<?php if (! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Assets S3 source
 *
 * @package   Assets
 * @author    Andris Sevcenko <andris@pixelandtonic.com>
 * @copyright Copyright (c) 2011 Pixel & Tonic, Inc
 */
class Assets_s3_source extends Assets_base_source
{
	protected $_source_id = 0;
	protected $_source_type = 's3';

	private static $_predefined_endpoints = array(
		'US' => 's3.amazonaws.com',
		'EU' => 's3-eu-west-1.amazonaws.com'
	);

	// images of this size will be saved to be used as sources for thumbnail generation
	const IMAGE_SOURCE_SIZE = '400x400';

	/**
	 * @var S3
	 */
	public $s3 = null;

	/**
	 * Constructor
	 */
	public function __construct($source_id, $settings)
	{
		parent::__construct();

		require_once PATH_THIRD . 'assets/sources/s3/lib/S3.php';
		$this->s3 = new S3($settings->access_key_id, $settings->secret_access_key);

		$this->_source_settings = $settings;
		$this->_source_id = $source_id;

		$this->_source_row = $this->EE->assets_lib->get_source_row_by_type_and_id($this->get_source_type(), $this->get_source_id());

	}

	/**
	 * Returns TRUE if the other source is an S3 source and shares the same credentials
	 * @param Assets_base_source $source
	 * @return mixed
	 */
	public function can_move_files_from(Assets_base_source $source)
	{
		return ($source instanceof Assets_s3_source
			&& $this->settings()->access_key_id == $source->settings()->access_key_id
			&& $this->settings()->secret_access_key == $source->settings()->secret_access_key);
	}

	/**
	 * @return array
	 */
	public static function get_settings_field_list()
	{
		return array(
			'access_key_id', 'secret_access_key'
		);
	}

	/**
	 * Get bucket list for credential
	 * @param $key_id
	 * @param $secret_key
	 * @return array
	 * @throws Exception
	 */
	public static function get_bucket_list($key_id, $secret_key)
	{
		require_once PATH_THIRD . 'assets/sources/s3/lib/S3.php';
		$s3 = new S3($key_id, $secret_key);
		$buckets = @$s3->listBuckets();
		if (empty($buckets))
		{
			throw new Exception(lang('wrong_credentials'));
		}

		$bucket_list = array();
		foreach ($buckets as $bucket)
		{
			$location = $s3->getBucketLocation($bucket);
			$bucket_item = array(
				'bucket' => $bucket,
				'location' => $location,
				'url_prefix' => 'http://' . self::get_endpoint_by_location($location) . '/' . $bucket . '/'
			);

			$bucket_list[$bucket] = (object) $bucket_item;

		}
		return $bucket_list;
	}

	/**
	 * Get the folder server path
	 *
	 * @param $folder
	 * @param $source_row
	 * @return string
	 */
	public function get_folder_server_path($folder, $source_row)
	{
		// fix :/ type of path
		return preg_replace('/:\/$/', ':', $source_row->source_id . ':' . trim($folder, '/') . '/');
	}

	/**
	 * Create a folder at designated path for source
	 *
	 * @param $server_path
	 * @return array
	 */
	protected function _create_source_folder($server_path)
	{
		list ($bucket_id, $folder_path) = explode(":", $server_path);
		$bucket_data = $this->get_bucket($bucket_id);

		$this->s3->setEndpoint($this->get_endpoint_by_location($bucket_data->location));

		return $this->s3->putObject('', $bucket_data->bucket, rtrim($folder_path, '/') . '/', S3::ACL_PUBLIC_READ);
	}

	/**
	 * Rename a folder
	 *
	 * @param $old_path
	 * @param $new_path
	 * @return mixed
	 */
	protected function _rename_source_folder($old_path, $new_path)
	{
		list ($bucket_id, $old_folder_path) = explode(":", $old_path);
		list ($bucket_id, $new_other_path) = explode(":", $new_path);
		$bucket_data = $this->get_bucket($bucket_id);

		$old_folder = trim($old_folder_path, '/') . '/';
		$this->s3->setEndpoint($this->get_endpoint_by_location($bucket_data->location));
		$files_to_move = $this->s3->getBucket($bucket_data->bucket, $old_folder);

		rsort($files_to_move);
		foreach ($files_to_move as $file)
		{
			$file_path = substr($file['name'], strlen($old_folder));

			$this->s3->copyObject($bucket_data->bucket, str_replace('//', '/', $file['name']),
				$bucket_data->bucket, ltrim(str_replace('//', '/', $new_other_path . '/' . $file_path), '/'),
				S3::ACL_PUBLIC_READ);

			$this->s3->setEndpoint($this->get_endpoint_by_location($bucket_data->location));
			$this->s3->deleteObject($bucket_data->bucket, $file['name']);
		}

		return TRUE;
	}

	/**
	 * Delete a folder
	 *
	 * @param $server_path
	 * @param int $source_id folder internal id
	 * @return mixed
	 */
	protected function _delete_source_folder($server_path, $source_row)
	{
		list ($bucket_id, $folder_path) = explode(":", $server_path);
		$bucket_data = $this->get_bucket($bucket_id);

		$this->s3->setendpoint($this->get_endpoint_by_location($bucket_data->location));

		return $this->s3->deleteObject($bucket_data->bucket, $folder_path);
	}

	/**
	 * Delete a file
	 *
	 * @param $server_path
	 * @param $source_row
	 * @return mixed
	 */
	protected function _delete_source_file($server_path, $source_row)
	{
		preg_match('/\{source_(?P<source_id>[0-9]+)\}(?P<path>.*)/', $server_path, $matches);
		if (empty($matches))
		{
			return FALSE;
		}

		$bucket_id = $matches['source_id'];
		$path = $matches['path'];
		$bucket_data = $this->get_bucket($bucket_id);

		$this->_s3_set_creds($bucket_data->access_key_id, $bucket_data->secret_access_key);
		$this->s3->setendpoint($this->get_endpoint_by_location($bucket_data->location));
		return $this->s3->deleteObject($bucket_data->bucket, $path);
	}

	/**
	 * Check if folder exists on source
	 *
	 * @param $server_path
	 * @return array
	 */
	protected function _source_folder_exists($server_path)
	{
		list ($bucket_id, $folder_path) = explode(":", $server_path);
		$bucket_data = $this->get_bucket($bucket_id);

		$this->_s3_set_creds($bucket_data->access_key_id, $bucket_data->secret_access_key);
		$this->s3->setEndpoint($this->get_endpoint_by_location($bucket_data->location));
		return (bool) $this->s3->getObjectinfo($bucket_data->bucket, $folder_path);
	}

	/**
	 * Upload File
	 */
	protected function _do_upload_in_folder($folder_data, $temp_file_path, $original_name )
	{
		$server_path = $this->get_folder_server_path($folder_data->full_path, $folder_data);
		list ($bucket_id, $folder_path) = explode(":", $server_path);

		// make sure this is a valid upload directory path
		if (! $server_path)
		{
			return array('error' => lang('invalid_filedir_path'));
		}

		if ($folder_path == '/')
		{
			$folder_path = '';
		}

		// swap whitespace with underscores
		$original_name = str_replace('%', '_', $this->EE->security->sanitize_filename(preg_replace('/\s+/', '_', $original_name)));

		$file_path = $folder_path . $original_name;

		// since "/file.ext"  is a file in folder with no name for S3, we have to trim these paths in some places
		if (substr($server_path, -2) == ':/')
		{
			$server_path = substr($server_path, 0, -1);
		}

		if ($this->_source_folder_exists($server_path . $original_name)
			OR (empty($this->cache['merge_in_progress']) && $this->EE->assets_lib->get_file_id_by_folder_id_and_name($folder_data->folder_id, $original_name))
		)
		{
			return $this->_prompt_result_array($original_name);
		}

		$ext = strtolower(pathinfo($file_path, PATHINFO_EXTENSION));

		if (! $this->_is_extension_allowed($ext))
		{
			throw new Exception(lang('filetype_not_allowed'));
		}

		$bucket_data = $this->get_bucket($folder_data->source_id);

		$this->_s3_set_creds($bucket_data->access_key_id, $bucket_data->secret_access_key);
		$this->s3->setEndpoint($this->get_endpoint_by_location($bucket_data->location));

		if ($this->s3->putObject(array('file' => $temp_file_path), $bucket_data->bucket, $file_path, S3::ACL_PUBLIC_READ))
		{
			return array('success' => TRUE, 'path' => $file_path);
		}
		else
		{
			return array('error'=> lang('couldnt_save'));
		}
	}

	/**
	 * Move a source file
	 *
	 * @param Assets_base_file $file
	 * @param                  $previous_folder_row
	 * @param                  $folder_row
	 * @param string           $new_file_name
	 * @throws Exception
	 * @return mixed
	 */
	protected function _move_source_file(Assets_base_file $file, $previous_folder_row, $folder_row, $new_file_name = '')
	{
		if (empty($new_file_name))
		{
			$new_file_name = $file->filename();
		}

		$old_server_path = $this->get_folder_server_path($previous_folder_row->full_path, $previous_folder_row);
		$new_server_path = $this->get_folder_server_path($folder_row->full_path, $folder_row);

		// sneaky: folder_exists can also be used to check for file existance
		// TODO: also - refactor this to be less "sneaky" and more "clear and understood"
		// Probably by adding _source_file_exists which, in case of S3, can call _source_folder_exists

		// can we place the file there?
		if ($this->_source_folder_exists($new_server_path . $new_file_name)
			OR $this->EE->assets_lib->get_file_id_by_folder_id_and_name($folder_row->folder_id, $new_file_name))
		{
			return $this->_prompt_result_array($new_file_name);
		}

		list ($bucket_id, $old_path) = explode(":", $old_server_path);
		$old_bucket_data = $this->get_bucket($bucket_id);

		list ($bucket_id, $new_path) = explode(":", $new_server_path);
		$new_bucket_data = $this->get_bucket($bucket_id);


		$this->_s3_set_creds($new_bucket_data->access_key_id, $new_bucket_data->secret_access_key);
		if ($this->s3->copyObject($old_bucket_data->bucket, ltrim($old_path, '/') . $file->filename(), $new_bucket_data->bucket, ltrim($new_path, '/') . $new_file_name, S3::ACL_PUBLIC_READ))
		{
			$this->_delete_source_file($file->server_path(), $previous_folder_row);
			return array(
				'success' => TRUE,
				'new_path' => $file->file_id(),
				'new_file_name' => $new_file_name);
		}

		throw new Exception(lang('invalid_path'));
	}

	/**
	 * Return bucket info
	 *
	 * @param $source_id
	 * @return array|bool|mixed|null
	 */
	public function get_bucket($source_id)
	{
		if ( empty($this->cache['buckets'][$source_id]))
		{
			$bucket_rows = $this->_get_sources(array('source_type' => $this->get_source_type(), 'source_id' => $source_id));
			if (! empty($bucket_rows))
			{
				$this->cache['buckets'][$source_id] = $bucket_rows[0];
			}
		}

		$row = $this->cache['buckets'][$source_id];

		if ( ! $row )
		{
			return FALSE;
		}

		return json_decode($row->settings);
	}

	/**
	 * Start indexing
	 * @param $session_id
	 * @return array
	 */
	public function start_index($session_id)
	{
		$settings = $this->_source_settings;
		$offset = 0;
		$total_file_count = 0;
		$indexed_folder_ids = array();

		$folder_row = $this->_find_folder(array('source_type' => $this->get_source_type(), 'source_id' => $this->get_source_id(), 'parent_id' => NULL));

		if ( empty($folder_row))
		{
			$source_row = $this->_source_row;
			// this is a new folder - insert into DB
			$data = array (
				'source_type' => $this->get_source_type(),
				'folder_name' => $source_row->name,
				'full_path' => '',
				'source_id' => $this->get_source_id(),
			);

			$indexed_folder_ids[$this->_store_folder($data)] = TRUE;
		}
		else
		{
			$indexed_folder_ids[$folder_row->folder_id] = TRUE;
		}

		$this->_s3_set_creds($settings->access_key_id, $settings->secret_access_key);
		$this->s3->setEndpoint($this->get_endpoint_by_location($settings->location));
		$file_list = $this->s3->getBucket($settings->bucket);

		// Let's assume that we'll need more memory if we hit an arbitrary amount of entries
		if (count($file_list) > 2000)
		{
			ini_set('memory_liimt', '64M');
		}

		foreach ($file_list as $file)
		{
			$parts = explode("/", $file['name']);
			foreach ($parts as $part)
			{
				if (substr($part, 0, 1) == '_')
				{
					continue 2;
				}
			}

			// in S3, it's possible to have files in folders that don't exist. E.g. - one/two/three.jpg.
			// if folder "one" is empty, except for folder "two", this won't show up in this list so we work around it
			// matches all paths with folders, except if folder is last or no folder at all
			if (preg_match('/(.*\/).+$/', $file['name'], $matches))
			{
				$folders = explode('/', rtrim($matches[1], '/'));
				$base_path = '';
				foreach ($folders as $folder)
				{
					$base_path .= $folder . '/';

					// this is exactly the case the above comment block reffers to
					if ( ! isset($existing_bucket_files[$base_path]))
					{
						$existing_bucket_files[$base_path] = TRUE;
						$this->_store_s3_folder($base_path, $indexed_folder_ids);
					}
				}
			}

			if ( !preg_match(Assets_helper::INDEX_SKIP_ITEMS_PATTERN, $file['name']))
			{
				if (substr($file['name'], -1) == '/')
				{
					$this->_store_s3_folder($file['name'], $indexed_folder_ids);
					$existing_bucket_files[$file['name']] = TRUE;
				}
				else
				{
					$this->_store_index_entry($session_id, $this->get_source_type(), $this->get_source_id(), $offset++, $file['name'], $file['size']);
					$total_file_count++;
				}

			}
		}

		$this->_execute_index_batch();

		// figure out the obsolete records for folders
		$missing_folder_ids = array();
		$all_folders = $this->EE->db->select('folder_id, full_path')
			->where('source_id', $this->get_source_id())
			->get('assets_folders')->result();

		foreach ($all_folders as $folder_row)
		{
			if (!isset($indexed_folder_ids[$folder_row->folder_id]))
			{
				$missing_folder_ids[$folder_row->folder_id] = $this->_source_row->name . '/' . $folder_row->full_path;
			}
		}

		return array(
			'source_type' => $this->get_source_type(),
			'source_id' => $this->get_source_id(),
			'total' => $total_file_count,
			'missing_folders' => $missing_folder_ids);
	}


	/**
	 * Start indexing a folder
	 * @param $session_id
	 * @param StdClass $folder_row
	 * @return array
	 */
	public function start_folder_index($session_id, $folder_row)
	{
		$settings = $this->_source_settings;

		$this->_s3_set_creds($settings->access_key_id, $settings->secret_access_key);
		$this->s3->setEndpoint($this->get_endpoint_by_location($settings->location));
		$file_list = $this->s3->getBucket($settings->bucket, $folder_row->full_path);


		$offset = 0;
		$count = 0;
		foreach ($file_list as $file)
		{
			// Only allow files directly in this folder
			if (strpos(substr($file['name'], strlen($folder_row->full_path)), '/') === FALSE)
			{
				$count++;
				$this->_store_index_entry($session_id, $this->get_source_type(), $this->get_source_id(), $offset++, $file['name'], $file['size']);
			}
		}
		$this->_execute_index_batch();

		return array(
			'total' => $count,
		);

	}

	/**
	 * Perform indexing
	 * @param $session_id int
	 * @param $offset
	 * @return boolean
	 */
	public function process_index($session_id, $offset)
	{
		$search_parameters = array(
			'session_id' => $session_id,
			'source_type' => $this->get_source_type(),
			'source_id' => $this->get_source_id(),
			'offset' => $offset
		);

		$index_entry = $this->_get_index_entry($search_parameters);

		// can't find the file. awkward. avoid eye contact and return next offset
		if (empty($index_entry))
		{
			return FALSE;
		}

		$file = $index_entry->uri;
		$size = $index_entry->filesize;

		$file_indexed = FALSE;


		if ( $this->_is_extension_allowed(pathinfo($file, PATHINFO_EXTENSION)))
		{
			$parts = explode('/', $file);
			$file_name = array_pop($parts);

			$search_full_path = join('/', $parts) . '/';
			if ($search_full_path == '/')
			{
				$search_full_path = '';
			}

			$folder_search = array(
				'source_type' => $this->get_source_type(),
				'source_id' => $this->get_source_id(),
				'full_path' => $search_full_path
			);

			// check for parent by path segment in table
			$parent_row = $this->_find_folder($folder_search);

			if (empty($parent_row))
			{
				return FALSE;
			}
			$folder_id = $parent_row->folder_id;

			$file_id = $this->EE->assets_lib->get_file_id_by_folder_id_and_name($folder_id, $file_name);

			// new file?
			if ( empty($file_id))
			{
				$data = array(
					'folder_id' => $folder_id,
					'source_type' => $this->get_source_type(),
					'source_id' => $this->get_source_id(),
					'file_name' => $file_name,
					'kind' => Assets_helper::get_kind($file)
				);

				$file_id = $this->_store_file($data);
				$this->EE->db->update('assets_index_data', array('record_id' => $file_id), $search_parameters);
			}
			else
			{
				$this->EE->db->update('assets_index_data', array('record_id' => $file_id), $search_parameters);
			}

			$file_indexed = $file_id;
		}

		// add image dimensions and size as well
		if ( $file_indexed)
		{
			$settings = $this->settings();
			$this->_s3_set_creds($settings->access_key_id, $settings->secret_access_key);
			$this->s3->setEndpoint($this->get_endpoint_by_location($settings->location));
			$info = $this->s3->getObjectInfo($this->settings()->bucket, $file);

			$data = array(
				'size' => $size
			);

			if (is_array($info))
			{
				$data['date_modified'] = $info['time'];
			}

			$file_row = $this->EE->assets_lib->get_file_row_by_id($file_id);
			if ($file_row->kind == 'image' && $size != $file_row->size)
			{
				$this->_perform_image_actions($file, $file_id, $this->settings()->bucket);
			}
			$this->_update_file($data, $file_id);
		}

		return TRUE;
	}

	/**
	 * Store an S3 folder in database
	 * @param $file
	 * @param $indexed_folder_ids array of indexed forlder ids by reference
	 */
	private function _store_s3_folder($file, &$indexed_folder_ids)
	{
		$folder_search = array(
			'source_type' => $this->get_source_type(),
			'source_id' => $this->get_source_id(),
			'full_path' => $file
		);

		$folder_row = $this->_find_folder($folder_search);

		// new folder?
		if ( empty($folder_row))
		{
			$parts = explode('/', rtrim($file, '/'));
			$folder_name = array_pop($parts);

			// check for parent by path segment in table
			$folder_search['full_path'] = join('/', $parts) . '/';

			if ($folder_search['full_path'] == '/')
			{
				$folder_search['full_path'] = '';
			}
			$parent_row = $this->_find_folder($folder_search);

			if (empty($parent_row))
			{
				$parent_id = NULL;
			}
			else
			{
				$parent_id = $parent_row->folder_id;
			}

			$data = array (
				'source_type' => $this->get_source_type(),
				'folder_name' => $folder_name,
				'full_path' =>  $file,
				'source_id' => $this->get_source_id()
			);

			if (! is_null($parent_id))
			{
				$data['parent_id'] = $parent_id;
			}

			$indexed_folder_ids[$this->_store_folder($data)] = TRUE;
		}
		else
		{
			$indexed_folder_ids[$folder_row->folder_id] = TRUE;

		}
	}

	/**
	 * @param $location
	 * @return string
	 */
	public static function get_endpoint_by_location($location)
	{
		if (isset(self::$_predefined_endpoints[$location]))
		{
			return self::$_predefined_endpoints[$location];
		}
		return 's3-' . $location . '.amazonaws.com';
	}

	/**
	 * Perform image actions - resize and save dimensions. If no bucket name provided, $uri is treated as filesystem path
	 *
	 * @param $uri
	 * @param $file_id
	 * @param mixed $bucket false for uri to be treated as a filesystem path
	 * @return bool
	 */
	private function _perform_image_actions($uri, $file_id, $bucket = FALSE)
	{
		$this->EE->load->library('filemanager');

		$cache_path = 'assets/s3_sources';

		$cache_path = Assets_helper::ensure_cache_path($cache_path);

		if ($bucket)
		{
			$target = Assets_helper::get_temp_file();
			$this->_s3_set_creds($this->settings()->access_key_id, $this->settings()->secret_access_key);
			$this->s3->getObject($bucket, $uri, $target);
			$uri = $target;
		}

		list ($width, $height) = getimagesize($uri);
		$data = array('width' => $width, 'height' => $height);
		$this->_update_file($data, $file_id);

		$target_path = $cache_path . $file_id . '.jpg';

		$this->EE->assets_lib->resize_image($uri, $target_path, self::IMAGE_SOURCE_SIZE);

		@unlink($uri);
	}

	/**
	 * Width/Height/Thumbnail
	 *
	 * @param $file_id
	 * @param $file_path
	 * @return mixed|void
	 */
	public function post_upload_image_actions($file_id, $file_path)
	{
		// cook up the thumbnail while we're at it
		$this->_perform_image_actions($file_path, $file_id);
	}

	/**
	 * Delete thumbnail
	 *
	 * @param $file_id
	 * @return void
	 */
	public function post_delete_actions($file_id)
	{
		$cache_path = $this->EE->config->item('cache_path');

		if (empty($cache_path))
		{
			$cache_path = APPPATH.'cache/';
		}

		@unlink($cache_path . 'assets_s3_storage/_thumbs/' . $file_id . '.jpg');
		return;
	}

	/**
	 * Get name replacement for a filename
	 *
	 * @param $folder_row
	 * @param $file_name
	 * @return mixed|void
	 */
	protected function _get_name_replacement($folder_row, $file_name)
	{
		$bucket_data = $this->get_bucket($folder_row->source_id);

		$this->_s3_set_creds($bucket_data->access_key_id, $bucket_data->secret_access_key);
		$this->s3->setEndpoint(self::get_endpoint_by_location($bucket_data->location));
		$file_list = $this->s3->getBucket($bucket_data->bucket, $folder_row->full_path);

		$file_name_parts = explode(".", $file_name);

		$extension = array_pop($file_name_parts);

		$file_name_start = join(".", $file_name_parts) . '_';
		$index = 1;

		while (
			(isset($file_list[$folder_row->full_path . $file_name_start . $index . '.' . $extension]))
			|| $this->EE->assets_lib->get_file_id_by_folder_id_and_name($folder_row->folder_id, $file_name_start . $index . '.' . $extension)
		)
		{
			$index++;
		}

		return $file_name_start . $index . '.' . $extension;
	}

	/**
	 * Get server path for a file
	 *
	 * @param $folder_row
	 * @param $file_name
	 * @return string
	 */
	protected function _get_file_server_path($folder_row, $file_name)
	{
		return $folder_row->source_id . ':' . $folder_row->full_path . $file_name;
	}

	/**
	 * Set S3 credentials
	 * @param $accessKey
	 * @param $secretKey
	 */
	private function _s3_set_creds($accessKey, $secretKey)
	{
		S3::setAuth($accessKey, $secretKey);
	}
}
