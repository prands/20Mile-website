<?php if (! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Assets library
 *
 * @package Assets
 * @author Andris Sevcenko <andris@pixelandtonic.com>
 * @copyright Copyright (c) 2011 Pixel & Tonic, Inc
 */

class Assets_lib
{
	/**
	 * Default parameters for file listing
	 *
	 * @var array
	 */
	private $_default_file_params = array(
		'folders' => '',
		'keywords' => '',
		'orderby' => '',
		'sort' => '',
		'offset' => 0,
		'limit' => 1000,
		'kinds' => '',
		'search_type' => 'shallow'
	);

	/**
	 * Default parameters for folder listing
	 *
	 * @var array
	 */
	private $_default_folder_params = array(
		'parent_id' => 0,
		'offset' => 0,
		'limit' => 50,
		'keywords' => '',
		'recursive' => 'no',
		'sort' => 'asc'
	);

	/**
	 * @var EE
	 */
	public $EE;

	public function __construct()
	{
		$this->EE =& get_instance();

		if (! isset($this->EE->session->cache['assets']))
		{
			$this->EE->session->cache['assets'] = array();
		}

		$this->cache =& $this->EE->session->cache['assets'];

		// manually add the view path if this is less than EE 2.1.5
		if (version_compare(APP_VER, '2.1.5', '<'))
		{
			$this->EE->load->_ci_view_path = PATH_THIRD.'assets/views/';
		}

		require_once PATH_THIRD . 'assets/sources/base_source.php';
		require_once PATH_THIRD . 'assets/sources/base_file.php';
		require_once PATH_THIRD . 'assets/helper.php';
	}

	/**
	 * Call an extension with parameters.
	 *
	 * @param $extension_name
	 * @param array $parameters
	 */
	public function call_extension($extension_name, array $parameters)
	{
		if ($this->EE->extensions->active_hook($extension_name))
		{
			array_unshift($parameters, $extension_name);
			call_user_func_array(array($this->EE->extensions, 'call'), $parameters);
		}
	}

	/**
	 * Perform Asset index
	 *
	 * @param $session_id
	 * @param string $source_type source type
	 * @param $source_id
	 * @param $offset
	 * @return mixed
	 */
	public function perform_index($session_id, $source_type, $source_id, $offset)
	{
		$source = $this->instantiate_source_type((object) array('source_type' => $source_type, 'source_id' => $source_id, 'filedir_id' => $source_id));
		if ( !$source)
		{
			return FALSE;
		}
		return array('processed' => (int) $source->process_index($session_id, $offset));

	}

	/**
	 * Finish indexing
	 *
	 * @param string $session_id
	 * @param array $sources
	 * @param string $command
	 * @return mixed
	 */
	public function finish_index($session_id, $sources, $command)
	{
		$output = array();

		$command = json_decode($command);
		switch ($command->command)
		{
			case 'delete':
				if ( ! empty($command->file_ids))
				{
					$this->EE->db->where_in('file_id', $command->file_ids);
					$this->EE->db->delete('assets_files');
					$this->EE->db->where_in('file_id', $command->file_ids);
					$this->EE->db->delete('assets_selections');
				}

				if ( ! empty($command->folder_ids))
				{
					$this->EE->db->where_in('folder_id', $command->folder_ids);
					$this->EE->db->delete('assets_folders');
				}

				$output = array('success' => TRUE);
				break;

			case 'statistics':

				if (!empty($sources))
				{
					$processed_files = array();
					$processed_rows = $this->EE->db->get_where('assets_index_data', array('session_id' => $session_id))->result();

					foreach ($processed_rows as $row)
					{
						$processed_files[$row->record_id] = TRUE;
					}

					$query = "
						SELECT
							fi.source_id, fi.filedir_id, fi.source_type, fi.file_id, fi.file_name, fo.full_path
						FROM exp_assets_files AS fi
						LEFT JOIN exp_assets_folders AS fo ON fo.folder_id = fi.folder_id
						WHERE ";

					$query_parts = array();
					foreach ($sources as $source)
					{
						$query_parts[] = '(fi.source_type = ' . $this->EE->db->escape($source['source_type']) . ' AND fi.' . ($source['source_type'] == 'ee' ? 'filedir_id' : 'source_id') . ' = ' . $this->EE->db->escape($source['source_id']) . ')';
					}
					$query .= join(' OR ', $query_parts);

					$all_files = $this->EE->db->query($query)->result();
					foreach ($all_files as $db_file)
					{
						if ( is_null($db_file->full_path) OR !isset($processed_files[$db_file->file_id]))
						{
							$output['files'][$db_file->file_id] = $this->_get_source_name($db_file->source_type, ($db_file->source_type == 'ee' ? $db_file->filedir_id : $db_file->source_id)) .
								'/' . $db_file->full_path . $db_file->file_name;
						}
					}
				}

				$this->EE->db->query("DELETE FROM exp_assets_index_data WHERE session_id = " . $this->EE->db->escape($session_id) );
				break;
		}

		return $output;
	}

	/**
	 * Get source name
	 * @param $source_type
	 * @param $source_id
	 * @return string
	 */
	private function _get_source_name($source_type, $source_id)
	{
		if ($source_type == 'ee')
		{
			$settings = $this->EE->db->get_where('upload_prefs', array('id' => $source_id))->row();
			if (empty($settings))
			{
				return '???';
			}
		}
		else
		{
			$settings = $this->EE->db->get_where('assets_sources', array('source_id' => $source_id, 'source_type' => $source_type))->row();
			if (empty($settings))
			{
				return '???';
			}
		}

		return $settings->name;
	}

	// ===================================
	// Folder operations
	// ===================================

	/**
	 * Get folders according to parameters
	 *
	 * @param $params
	 * @return mixed
	 */
	public function get_folders($params)
	{
		$params = array_merge($this->_default_folder_params, $params);

		if ($params['parent_id'] == 0)
		{
			$params['parent_id'] = NULL;
		}

		if ($params['recursive'] != 'yes')
		{
			$params['recursive'] = FALSE;
		}

		$folder_ids = $this->_get_folder_ids($params['parent_id'], $params['keywords'], $params['recursive']);
		$sort = in_array(strtoupper($params['sort']), array('ASC', 'DESC')) ? $params['sort'] : 'ASC';

		if (! empty ($folder_ids))
		{
			$this->EE->db->select('folder_id, folder_name');
			$this->EE->db->where_in('folder_id', $folder_ids);
			$this->EE->db->order_by('folder_name', $sort);
			$this->EE->db->limit($params['limit'], $params['offset']);
			$result = $this->EE->db->get('assets_folders')->result();
		}
		else
		{
			$result = array();
		}

		$return = array();
		foreach ($result as $folder)
		{
			$return[] = (object) array(
				'folder_name' => $folder->folder_name,
				'folder_id' => $folder->folder_id
			);
		}

		return $return;
	}

	/**
	 * Get folder ids by parent it and keywords separated by space
	 *
	 * @param $parent_id
	 * @param $keywords
	 * @param $recursive bool if true will fetch all the children as well
	 * @return array
	 */
	private function _get_folder_ids($parent_id, $keywords, $recursive)
	{
		$baseQuery = "
			SELECT f.* FROM exp_assets_folders AS f
			LEFT JOIN `exp_upload_prefs` AS p ON f.source_type = 'ee' AND f.filedir_id = p.id AND p.site_id = %s
			WHERE (f.source_type <> 'ee' OR p.id IS NOT NULL) %s %s";

		$site_id = intval($this->EE->config->item('site_id'));
		$keyword_query = "";

		if (!empty($keywords))
		{
			if (count($keywords) > 0)
			{
				$keyword_query = 'AND (';
				foreach ($keywords as $keyword)
				{
					$keyword_query .= 'folder_name LIKE "%' . $this->EE->db->escape_like_str($keyword) . '%" AND ';
				}
				$keyword_query = substr($keyword_query, 0, -5) . ')';
			}
		}

		$filter_query = 'AND parent_id ' . (is_null($parent_id) ? 'IS NULL' : '= ' . intval($parent_id));

		$return = array();
		$filter_parts = array();

		$query = sprintf($baseQuery, $site_id, $filter_query, $keyword_query);
		$matched_rows = $this->EE->db->query($query)->result();

		foreach ($matched_rows as $row)
		{
			$return[] = $row->folder_id;
		}

		// no children need to be fetched, we're good to go
		if (! $recursive)
		{
			return $return;
		}

		// have to perform a deep search, so we need all parents regardless of keyword hits
		$query = $query = sprintf($baseQuery, $site_id, $filter_query, '');
		$parent_rows = $this->EE->db->query($query)->result();

		foreach ($parent_rows as $row)
		{
			$filter_parts[] = ' full_path LIKE "' . $this->EE->db->escape_like_str($row->full_path) . '%" ';
		}

		if (count($filter_parts) > 0)
		{
			$filter_query = 'AND (' . join(' OR ', $filter_parts) . ')';
			$query = sprintf($baseQuery, $site_id, $filter_query, $keyword_query);
			$rows = $this->EE->db->query($query)->result();
			foreach ($rows as $row)
			{
				$return[] = $row->folder_id;
			}

		}

		return $return;
	}

	/**
	 * Create a folder
	 *
	 * @param $path
	 * @return array
	 * @throws Exception
	 */
	public function create_folder($path)
	{
		if (substr_count($path, "/") != 1)
		{
			throw new Exception(lang('invalid_source_path'));
		}

		list ($parent_id, $folder_name) = explode('/', $path);

		$folder_name = str_replace('%', '_', $this->EE->security->sanitize_filename($folder_name));
		$folder_row = $this->get_folder_row_by_id($parent_id);
		$source = $this->instantiate_source_type($folder_row);

		return $source->create_folder($parent_id . '/' . $folder_name);
	}

	/**
	 * Rename a folder
	 *
	 * @param $folder_id
	 * @param $new_name
	 * @return array
	 */
	public function rename_folder($folder_id, $new_name)
	{
		$folder_row = $this->get_folder_row_by_id($folder_id);
		$source = $this->instantiate_source_type($folder_row);

		$new_name = str_replace('%', '_', $this->EE->security->sanitize_filename($new_name));

		return $source->rename_folder($folder_id, $new_name);
	}

	/**
	 * Move a folder
	 *
	 * @param array $old_ids an array of folder ids
	 * @param array $new_parents an array of new parent ids
	 * @param array $actions to take in case of a conflict
	 * @return array $result
	 * @throws Exception
	 */
	public function move_folder($old_ids, $new_parents, $actions)
	{
		$result_list = array();

		foreach ($old_ids as $i => $folder_id)
		{
			$new_parent_id = $new_parents[$i];
			$action = $actions[$i];

			$old_folder_row = $this->get_folder_row_by_id($folder_id);
			$old_source = $this->instantiate_source_type($old_folder_row);

			$new_parent_folder_row = $this->get_folder_row_by_id($new_parent_id);
			$new_source = $this->instantiate_source_type($new_parent_folder_row);

			if ($old_source && $new_source)
			{
				$result = $new_source->move_folder($folder_id, $new_parent_id, $action);
			}
			else
			{
				throw new Exception(lang('invalid_source_path'));
			}

			if (isset($result['error']))
			{
				$source = $this->get_folder_row_by_id($folder_id);
				throw new Exception($this->EE->functions->var_swap(lang('error_moving_folder'), array(
					'folder' => $source->folder_name,
					'error'  => $result['error']
				)));
			}
			$result_list[] = $result;
		}
		return $result_list;
	}

	/**
	 * Delete a folder
	 *
	 * @param $folder_id
	 * @return array
	 */
	public function delete_folder($folder_id)
	{
		$folder_row = $this->get_folder_row_by_id($folder_id);
		$source = $this->instantiate_source_type($folder_row);

		return $source->delete_folder($folder_id);
	}

	/**
	 * Get folder id by parent id and folder name
	 *
	 * @param $parent_id
	 * @param $folder_name
	 * @return mixed
	 */
	public function get_folder_id_by_parent_and_name($parent_id, $folder_name)
	{
		return $this->get_folder_id_by_params(array('parent_id' => $parent_id, 'folder_name' => $folder_name));
	}

	/**
	 * Get folder id by parameters
	 *
	 * @param $parameters
	 * @return mixed
	 */
	public function get_folder_id_by_params($parameters)
	{
		$result = $this->EE->db->get_where('assets_folders', $parameters, 1)->row();
		if ($result)
		{
			return $result->folder_id;
		}

		return FALSE;
	}

	/**
	 * Returns the whole folder structure in a tree
	 *
	 * @param array $filedirs if not empty will restrict to these EE upload dirs
	 * @return array
	 */
	public function get_folder_tree($filedirs = array())
	{
		$query = "SELECT f.*
					FROM exp_assets_folders AS f
					LEFT JOIN `exp_upload_prefs` AS p ON f.source_type = 'ee' AND f.filedir_id = p.id AND p.site_id = %s
					WHERE
						(f.source_type <> 'ee' OR p.id IS NOT NULL)
						%s
					ORDER BY
						f.source_type ASC,
						f.full_path ASC";

		$filedir_query = "";
		if ( !empty($filedirs) && is_array($filedirs))
		{
			$parts = array();
			foreach ($filedirs as $filedir)
			{
				if ( ! strpos($filedir, ':'))
				{
					$source_type = 'ee';
					$source_id = $filedir;
				}
				else
				{
					list ($source_type, $source_id) = explode(":", $filedir);
				}
				if ( ! preg_match('/^[a-z0-9]{2}$/i', $source_type))
				{
					continue;
				}
				if ($source_type == 'ee')
				{
					$parts[] = '(f.source_type = "ee" AND f.filedir_id = ' . intval($source_id) . ')';
				}
				else
				{
					$parts[] = '(f.source_type = "' . $source_type . '" AND f.source_id = ' . intval($source_id) . ')';
				}
			}
			$filedir_query = 'AND (' . join(" OR ", $parts) . ')';
		}

		$sql = sprintf($query, $this->EE->config->item('site_id'), $filedir_query);
		$rows = $this->EE->db->query($sql)->result();

		$tree = array();
		$reference_store = array();

		foreach ($rows as $row)
		{
			$tree_node = (object) array(
				'id'   => $row->folder_id,
				'name' => $row->folder_name,
				'type' => $row->source_type,
				'children' => array()
			);

			if ($row->parent_id)
			{
				$reference_store[$row->parent_id]->children[] = $tree_node;
			}
			else
			{
				$tree[] = $tree_node;
			}

			$reference_store[$row->folder_id] = $tree_node;
		}

		return $tree;
	}

	// ==============================
	// File operations
	// ==============================

	/**
	 * Get files by parameters
	 *
	 * @param $params
	 * @return array
	 */
	public function get_files($params)
	{
		$params = array_merge($this->_default_file_params, $params);
		$files = $this->_get_files($params['folders'], $params['keywords'], $params['kinds'], $params['search_type']);
		Assets_helper::sort_files($files, $params['orderby'], $params['sort']);
		return $files;
	}

	/**
	 * Get file list for folders
	 *
	 * @param $folders
	 * @param $keywords
	 * @param string $kinds
	 * @param string $search_type shallow|deep
	 * @return array
	 */
	private function _get_files($folders, $keywords = '', $kinds = 'any', $search_type)
	{
		$files = array();

		if ( ! is_array($folders))
		{
			$folders = array($folders);
		}

		foreach ($folders as $folder_id)
		{
			if (empty($folder_id) OR ! is_numeric($folder_id))
			{
				continue;
			}
			$folder_row = $this->get_folder_row_by_id($folder_id);
			$source = $this->instantiate_source_type($folder_row);
			$folder_files = $source->get_files_in_folder($folder_id, $keywords, $search_type);

			// ignore if there are no files
			if (! $folder_files)
			{
				continue;
			}

			foreach ($folder_files as $file)
			{
				// probably a index issue. either way - nothing to show
				if (! $file instanceof Assets_base_file)
				{
					continue;
				}

				// make sure this file is one of the requested file kinds
				if ($kinds != 'any' && ! in_array($file->kind(), $kinds))
				{
					continue;
				}
				$files[] = $file;
			}
		}

		return array_slice($files, 0, $this->_default_file_params['limit']);
	}

	/**
	 * Get file for a source path
	 *
	 * @param int|array $file_ids
	 * @return Assets_base_file|array
	 */
	public function get_file_by_id($file_ids)
	{
		$return_single = !is_array($file_ids);

		if ($return_single)
		{
			$file_ids = array($file_ids);
		}

		$file_rows = $this->get_file_row_by_id($file_ids);

		$return = array();

		foreach ($file_rows as $file_id => $file_row)
		{
			if ($file_row)
			{
				$source = $this->instantiate_source_type($file_row);
				$return[$file_id] = $source->get_file($file_id);
			}
			else
			{
				$return[$file_id] = $file_row;
			}
		}

		if ($return_single)
		{
			return $return[$file_id];
		}
		else
		{
			return $return;
		}
	}

	/**
	 * Upload file into source path
	 *
	 * @param $folder_id
	 * @param string $action to take in case of filename conflict
	 * @param string $action_info additional information for action
	 * @param string $file_name being in conflict
	 * @return array
	 * @throws Exception
	 */
	public function upload_file($folder_id, $action = '', $action_info = '', $file_name = '')
	{
		// a follow-up to an upload
		if ( ! empty($action))
		{
			$this->cache['merge_in_progress'] = TRUE;
			$data = $this->_merge_uploaded_files($action, $action_info, $file_name);
			$this->cache['merge_in_progress'] = FALSE;
			return $data;
		}

		$folder_row = $this->get_folder_row_by_id($folder_id);
		$source = $this->instantiate_source_type($folder_row);

		require_once PATH_THIRD . 'assets/lib/fileuploader.php';
		$result = $source->upload_file($folder_id);

		// Upload naming conflict
		if (isset($result['new_file_id']))
		{
			$this->EE->assets_lib->call_extension('assets_upload_file', array($source->get_file($result['new_file_id']), $folder_row));
		}
		// All good
		elseif(isset($result['path']))
		{
			$this->EE->assets_lib->call_extension('assets_upload_file', array($source->get_file($result['path']), $folder_row));
		}


		if (isset($result['success']))
		{
			// turn the returned path into a source path
			$result['path'] = $folder_id .':'.$result['path'];
		}
		else if ( empty($result['prompt']) && !empty($result['error']))
		{
			throw new Exception($result['error']);
		}

		return $result;
	}

	/**
	 * Merge a conflicting uploaded file
	 *
	 * @param string $action action to take
	 * @param string $action_info additional information for action
	 * @param string $file_name being in conflict
	 * @return array|string
	 */
	private function _merge_uploaded_files($action, $action_info, $file_name)
	{
		list ($folder_id, $created_file_id) = explode(":", $action_info);

		$folder_row = $this->get_folder_row_by_id($folder_id);
		$source = $this->instantiate_source_type($folder_row);

		switch ($action)
		{
			case Assets_helper::ACTIONS_REPLACE:
				// replace the physical file

				$target_file = $source->get_file($this->get_file_id_by_folder_id_and_name($folder_id, $file_name));
				$replace_with = $source->get_file($created_file_id);
				$this->EE->assets_lib->call_extension('assets_replace_file', array($target_file, $replace_with));

				$source->replace_file($target_file, $replace_with);

				$this->clear_file_cache();
				$source->clear_file_cache();

			// falling through to delete the file
			case Assets_helper::ACTIONS_CANCEL:

				return $this->delete_file(array($created_file_id));
				break;
		}

		return 'ok';
	}

	/**
	 * Return a file's URL
	 *
	 * @param $file_id
	 * @return string
	 * @throws Exception
	 */
	public function get_file_url($file_id)
	{
		$file_row = $this->get_file_row_by_id($file_id);
		$source = $this->instantiate_source_type($file_row);
		$file = $source->get_file($file_id);

		if (! $file)
		{
			throw new Exception(lang('invalid_file_path'));
		}

		return $file->url();
	}

	/**
	 * @param $file_ids
	 * @return array
	 */
	public function delete_file($file_ids)
	{
		$results = array();

		foreach ($file_ids as $file_id)
		{
			$file_row = $this->get_file_row_by_id($file_id);

			$source = $this->instantiate_source_type($file_row);
			$result = $source->delete_file($file_id, TRUE);

			// add in the old $file_id so the JS knows which folder we're dealing with
			$result['path'] = $file_id;
			$results[] = $result;
		}

		return $results;
	}

	/**
	 * Rename a file
	 *
	 * @param $file_id
	 * @param $new_name
	 * @param $action string Actions to take in case of conflicts
	 */
	public function rename_file($file_id, $new_name, $action)
	{
		$file_row = $this->get_file_row_by_id($file_id);
		$this->move_file(array($file_id), array($file_row->folder_id . '/' . $new_name), array($action));
	}

	/**
	 * Move a file
	 *
	 * @param $old_ids
	 * @param $new_paths
	 * @param $actions string Actions to take in case of conflicts
	 * @return array $results
	 * @throws Exception
	 */
	public function move_file($old_ids, $new_paths, $actions)
	{
		$result_list = array();

		foreach ($old_ids as $i => $file_id)
		{
			$new_path = $new_paths[$i];
			$action = $actions[$i];

			if (substr_count($new_path, '/') != 1)
			{
				throw new Exception(lang('invalid_folder_path'));
			}

			list ($folder_id, $file_name) = explode("/", $new_path);

			$file_row = $this->get_file_row_by_id($file_id);

			if ($folder_id == $file_row->folder_id)
			{
				$result_list[] = array('success' => TRUE, 'old_path' => $file_id);
				continue;
			}
			$old_source = $this->instantiate_source_type($file_row);

			$file_name = str_replace('%', '_', $this->EE->security->sanitize_filename($file_name));

			$folder_row = $this->get_folder_row_by_id($folder_id);
			$new_source = $this->instantiate_source_type($folder_row);

			if ($old_source && $new_source)
			{
				if ( !$result = $new_source->move_file_inside_source($old_source, $file_id, $new_path, $action))
				{
					$result = $this->_move_file_between_sources($old_source, $new_source, $file_id, $new_path, $action);
				}
			}
			else
			{
				throw new Exception(lang('invalid_source_path'));
			}

			if (isset($result['error']))
			{
				// format the error message
				$file = $old_source ? $old_source->get_file($file_id) : FALSE;
				$filename = $file ? $file->filename() : $file_id;

				throw new Exception($this->EE->functions->var_swap(lang('error_moving_file'), array(
						'file'  => $filename,
						'error' => $result['error']
					))
				);
			}


			if (isset($result['success']))
			{
				$this->clear_file_cache();
				$new_source->clear_file_cache();
				$file = $new_source->get_file($file_id);
				if ($file)
				{
					if ($file_row->folder_id == $folder_id)
					{
						$this->EE->assets_lib->call_extension('assets_rename_file', array($file, $file_name));
					}
					else
					{
						$this->call_extension('assets_move_file', array($file, $folder_row, $file_name));
					}
				}
			}

			// add in the old file id so the JS knows which file we're dealing with and can update the information
			$result['old_path'] = $file_id;
			$result_list[] = $result;
		}

		return $result_list;
	}

	/**
	 * Move a file between sources
	 *
	 * @param Assets_base_source $old_source
	 * @param Assets_base_source $new_source
	 * @param $file_id
	 * @param $new_path
	 * @param string $action to take if conflict exists
	 * @return array
	 * @throws Exception
	 */
	private function _move_file_between_sources(Assets_base_source $old_source, Assets_base_source $new_source, $file_id, $new_path, $action)
	{
		$file_to_move = $old_source->get_file($file_id);
		$local_file = $file_to_move->get_local_copy();
		$result = $new_source->transfer_file_into_source($local_file, $new_path, $file_to_move, $action);

		if (isset($result['success']))
		{
			if ($old_source->finalize_outgoing_transfer($file_to_move))
			{
				if (Assets_helper::get_kind($result['path']) == 'image')
				{
					$new_source->post_upload_image_actions($file_id, $local_file);
				}
				@unlink($local_file);
				return array('success' => TRUE, 'new_path' => $file_id);
			}
			else
			{
				throw new Exception(lang('invalid_source_path'));
			}
		}
		else
		{
			return $result;
		}
	}

	/**
	 * View thumbnail for file and a size
	 *
	 * @param $file_id
	 * @param $size
	 * @return string
	 */
	public function get_thumbnail_location($file_id, $size)
	{
		$file = $this->get_file_by_id($file_id);

		if ($file instanceof Assets_base_file)
		{
			if ($file->kind() == 'image')
			{
				$path = $file->get_thumb_path($size);
				if (! file_exists($path))
				{
					$source_path = $file->get_thumbnail_source_path();
					$this->resize_image($source_path, $path, $size);
				}

				return $file->get_thumb_path($size);
			}
		}

		return FALSE;
	}

	/**
	 * Save file properties
	 *
	 * @param $file_id
	 * @param $data
	 */
	public function save_file_properties($file_id, $data)
	{
		$this->EE->db->update('assets_files', $data, array('file_id' => $file_id));

		$this->update_file_search_keywords($file_id);
	}

	/**
	 * Update the files search_keyword column to be up-to-date
	 * @param $file_id
	 */
	public function update_file_search_keywords($file_id)
	{
		$fields_to_include = array(
			'`file_name`', '`title`', '`alt_text`', '`caption`', '`author`', '`desc`', '`location`', '`keywords`'
		);

		$sql = 'UPDATE exp_assets_files
			SET `search_keywords` = CONCAT_WS(",", ' . join(',', $fields_to_include) . ')
			WHERE file_id = ' . intval($file_id);

		$this->EE->db->query($sql);
	}


	/**
	 * Get asset id by folder id and file name
	 *
	 * @param $folder_id
	 * @param $file_name
	 * @return mixed
	 */
	public function get_file_id_by_folder_id_and_name($folder_id, $file_name)
	{
		$result = $this->EE->db->get_where('assets_files', array('folder_id' => $folder_id, 'file_name' => $file_name), 1)->row();
		if ($result)
		{
			return $result->file_id;
		}

		return FALSE;
	}


	/**
	 * Unregister a file using the file_id
	 * @param $file_id
	 * @return bool
	 * @throws Exception
	 */
	public function unregister_file($file_id)
	{
		$file_row = $this->get_file_row_by_id($file_id);
		$source = $this->instantiate_source_type($file_row);
		$source->delete_file($file_id, TRUE);
		return TRUE;
	}

	/**
	 * Register a file in EE filedir
	 * @param $filedir_id
	 * @param $path
	 * @return bool|mixed
	 */
	public function register_ee_file($filedir_id, $path)
	{
		$filedir = $this->EE->db->get_where('upload_prefs', array('id' => $filedir_id))->row();
		if (empty($filedir))
		{
			return FALSE;
		}

		require_once PATH_THIRD . 'assets/sources/ee/source.ee.php';
		$filedir = Assets_ee_source::apply_filedir_overrides($filedir);

		$path_parts = explode("/", $path);
		$filename = array_pop($path_parts);

		$current_folder_id = $this->get_folder_id_by_parent_and_name(NULL, $filedir->name);
		if (empty($current_folder_id))
		{
			$data = array(
				'source_type' => 'ee',
				'folder_name' => $filedir->name,
				'full_path' => '',
				'parent_id' => NULL,
				'filedir_id' => $filedir_id
			);
			$this->EE->db->insert('assets_folders', $data);
			$current_folder_id = $this->EE->db->insert_id();
		}

		$current_folder = $this->get_folder_row_by_id($current_folder_id);
		$full_path = '';
		$next_folder_id = $current_folder_id;

		foreach ($path_parts as $path_part)
		{
			$full_path .= $path_part .'/';
			$next_folder_id = $this->get_folder_id_by_parent_and_name($current_folder->folder_id, $path_part);
			if (empty($next_folder_id))
			{
				$data = array(
					'source_type' => 'ee',
					'folder_name' => $path_part,
					'full_path' => $full_path,
					'parent_id' => $current_folder->folder_id,
					'filedir_id' => $filedir_id
				);
				$this->EE->db->insert('assets_folders', $data);
				$next_folder_id = $this->EE->db->insert_id();
			}
			$current_folder = $this->get_folder_row_by_id($next_folder_id);
		}

		return $this->register_file($next_folder_id, $filename);

	}

	/**
	 * Register a file using a folder id and filename
	 * @param $folder_id
	 * @param $filename
	 * @return mixed
	 * @throws Exception
	 */
	public function register_file($folder_id, $filename)
	{
		$folder_row = $this->get_folder_row_by_id($folder_id);
		$source = $this->instantiate_source_type($folder_row);

		$data = array(
			'file_name' => $filename,
			'source_type' => $folder_row->source_type,
			'source_id' => $folder_row->source_id,
			'filedir_id' => $folder_row->filedir_id,
			'folder_id' => $folder_id,
			'kind' => Assets_helper::get_kind($filename)
		);


		$this->EE->db->insert('assets_files', $data);
		$file_id =  $this->EE->db->insert_id();
		$file = $source->get_file($file_id);

		if ($file->exists())
		{
			$file_id =  $source->update_file_info($file);
			$this->update_file_search_keywords($file_id);
			return $file_id;
		}
		else
		{
			return FALSE;
		}
	}

	// =================================
	// Source operations
	// =================================

	/**
	 * Deletes and external source, all of its folders, files and their entry associations
	 * @param $source_id
	 */
	public function delete_source($source_id)
	{
		// First delete any file selections

		$folders = $this->EE->db->select('folder_id')->where('source_id', $source_id)->get('assets_folders')->result();
		$folder_ids = array();
		foreach ($folders as $folder_row)
		{
			$folder_ids[] = $folder_row->folder_id;
		}

		if ($folder_ids)
		{
			$files = $this->EE->db->select('file_id')->where_in('folder_id', $folder_ids)->get('assets_files')->result();
			$file_ids = array();
			foreach ($files as $file_row)
			{
				$file_ids[] = $file_row->file_id;
			}

			if ($file_ids)
			{
				$this->EE->db->where_in('file_id', $file_ids)->delete('assets_selections');
			}
		}

		// Now delete the rest

		$this->EE->db->delete('assets_sources', array('source_id' => $source_id));
		$this->EE->db->delete('assets_folders', array('source_id' => $source_id));
		$this->EE->db->delete('assets_files', array('source_id' => $source_id));
	}

	/**
	 * Get source
	 *
	 * @param StdCLass $data_object
	 * @return Assets_base_source
	 * @throws Exception
	 */
	public function instantiate_source_type($data_object)
	{
		$source_key = $data_object->source_type . '_'
			. (isset($data_object->source_id) ? $data_object->source_id : '') . '_'
			. (isset($data_object->filedir_id) ? $data_object->filedir_id : '');
		if (empty($this->cache['sources'][$source_key]))
		{
			require_once PATH_THIRD . 'assets/sources/' . $data_object->source_type . '/source.' . $data_object->source_type . '.php';
			require_once PATH_THIRD . 'assets/sources/' . $data_object->source_type . '/file.' . $data_object->source_type . '.php';

			$source_class = 'Assets_' . $data_object->source_type . '_source';

			if ($data_object->source_type == 'ee')
			{
				$settings = $this->EE->db->get_where('upload_prefs', array('id' => $data_object->filedir_id))->row();
				if (empty($settings))
				{
					throw new Exception(lang('unknown_source'));
				}

				$source_id = $data_object->filedir_id;
			}
			else
			{
				$settings = $this->EE->db->get_where('assets_sources', array('source_id' => $data_object->source_id, 'source_type' => $data_object->source_type))->row();
				if (empty($settings))
				{
					throw new Exception(lang('unknown_source'));
				}
				$settings = json_decode($settings->settings);

				$source_id = $data_object->source_id;
			}

			$this->cache['sources'][$source_key] = new $source_class($source_id, $settings);
		}

		if (empty($this->cache['sources'][$source_key]))
		{
			throw new Exception(lang('invalid_source_path'));
		}

		return $this->cache['sources'][$source_key];
	}

	/**
	 * Get settings field list for a source type
	 * @param $source_type
	 * @return mixed
	 */
	public function get_source_settings_field_list($source_type)
	{
		require_once PATH_THIRD . 'assets/sources/' . $source_type . '/source.' . $source_type . '.php';
		return call_user_func(array('Assets_' . $source_type . '_source', 'get_settings_field_list'));
	}

	/**
	 * Return an array of all available sources
	 * @return array
	 */
	public function get_all_sources()
	{
		require_once PATH_THIRD . 'assets/sources/ee/source.ee.php';
		$ee_filedirs = Assets_ee_source::get_all_filedirs();
		$other_sources = $this->EE->db->order_by('source_type, source_id')->get('assets_sources')->result();
		$output = array();

		foreach ($ee_filedirs as $row)
		{
			$output['ee_' . $row->id] = $row->name . ($row->site_id != 1 ? ' [' . $row->site_id . ']' : '');
		}

		foreach ($other_sources as $row)
		{
			$output[$row->source_type . '_' . $row->source_id] = $row->name;
		}

		return $output;
	}

	/**
	 * Store a source by type, id and data. If id exists for type, this will perform an update
	 * @param $source_type
	 * @param $source_id
	 * @param $data
	 * @return object
	 */
	public function store_source($source_type, $source_id, $data)
	{
		if ( ! $source_id)
		{
			return $this->EE->db->insert('assets_sources', array_merge($data, array('source_type' => $source_type)));
		}
		return $this->EE->db->update('assets_sources', $data, array('source_id' => $source_id));
	}

	/**
	 * Returns source data by id
	 *
	 * @param $source_type
	 * @param $source_id
	 * @return StdClass
	 * @throws Exception
	 */
	public function get_source_row_by_type_and_id($source_type, $source_id)
	{
		$key = $source_type . '_' . $source_id;
		if (! isset($this->cache['source_rows'][$key]))
		{
			$this->cache['source_rows'][$key] = $this->EE->db->get_where('assets_sources', array('source_type' => $source_type, 'source_id' => $source_id))->row();
		}

		if (! is_object($this->cache['source_rows'][$key]))
		{
			throw new Exception(lang('exception_error'));
		}

		return $this->cache['source_rows'][$key];
	}

	/**
	 * Get source id by type and name
	 * @param $source_type
	 * @param $name
	 * @return mixed
	 * @throws Exception
	 */
	public function get_source_id_by_type_and_name($source_type, $name)
	{
		if ($source_type == 'ee')
		{
			$source_row = $this->EE->db->get_where('upload_prefs', array('name' => $name))->row();
		}
		else
		{
			$source_row = $this->EE->db->get_where('assets_sources', array('source_type' => $source_type, 'name' => $name))->row();
		}
		if (empty($source_row))
		{
			throw new Exception(lang('unknown_source'));
		}
		return $source_row->source_id;
	}

	/**
	 * Returns folder data
	 *
	 * @param $folder_id
	 * @return StdClass
	 * @throws Exception
	 */
	public function get_folder_row_by_id($folder_id)
	{
		if (! isset($this->cache['folder_data'][$folder_id]))
		{
			$this->cache['folder_data'][$folder_id] = $this->EE->db->get_where('assets_folders', array('folder_id' => $folder_id))->row();
		}

		if (! is_object($this->cache['folder_data'][$folder_id]))
		{
			throw new Exception(lang('exception_error'));
		}

		return $this->cache['folder_data'][$folder_id];
	}

	/**
	 * Return folder template path by a folder id.
	 *
	 * @param $folder_id
	 * @return string
	 */
	public function get_folder_template_path_by_id($folder_id)
	{
		$folder_row = $this->get_folder_row_by_id($folder_id);
		$prefix = empty($folder_row->source_id) ? '{filedir_' . $folder_row->filedir_id . '}' : '{source_' . $folder_row->source_id . '}';
		return $prefix . $folder_row->full_path;
	}

	/**
	 * Returns file data
	 *
	 * @param int|array $file_ids
	 * @return StdClass
	 */
	public function get_file_row_by_id($file_ids)
	{
		$return_single = !is_array($file_ids);

		if ($return_single)
		{
			$file_ids = array($file_ids);
		}

		// Find the files that we haven't cached yet
		$uncached_files = array();

		foreach ($file_ids as $file_id)
		{
			if (! isset($this->cache['file_data'][$file_id]))
			{
				$uncached_files[] = $file_id;
			}
		}

		// Now grab them
		if ($uncached_files)
		{
			if (count($uncached_files) == 1)
			{
				$file_id = $uncached_files[0];

				$query = $this->EE->db->where('file_id', $file_id)->get('assets_files');

				if ($query->num_rows())
				{
					$this->cache['file_data'][$file_id] = $query->row();
				}
				else
				{
					$this->cache['file_data'][$file_id] = FALSE;
				}
			}
			else
			{
				$query = $this->EE->db->where_in('file_id', $uncached_files)->get('assets_files');

				$rows_by_file_id = array();

				if ($query->num_rows())
				{
					foreach ($query->result() as $row)
					{
						$rows_by_file_id[$row->file_id] = $row;
					}
				}

				foreach ($uncached_files as $file_id)
				{
					if (isset($rows_by_file_id[$file_id]))
					{
						$this->cache['file_data'][$file_id] = $rows_by_file_id[$file_id];;
					}
					else
					{
						$this->cache['file_data'][$file_id] = FALSE;
					}
				}
			}
		}

		// Now pass them back
		$return = array();

		foreach ($file_ids as $file_id)
		{
			$row = $this->cache['file_data'][$file_id];

			$return[$file_id] = $row;
		}

		if ($return_single)
		{
			return $return[$file_ids[0]];
		}
		else
		{
			return $return;
		}
	}

	/**
	 * Clears file cache
	 */
	public function clear_file_cache()
	{
		$this->cache['file_data'] = array();
	}

	/**
	 * Resize an image
	 *
	 * @param $source_path
	 * @param $target_path
	 * @param $size
	 */
	public function resize_image($source_path, $target_path, $size)
	{
		$this->EE->load->library('filemanager');

		$size = explode('x', $size);
		$width = $size[0];
		$height = $size[1];

		$resize = array();
		$resize['source_image']   = $source_path;
		$resize['new_image']      = $target_path;
		$resize['maintain_ratio'] = TRUE;
		$resize['image_library']  = $this->EE->config->item('image_resize_protocol');
		$resize['library_path']   = $this->EE->config->item('image_library_path');
		$resize['width']          = $width;
		$resize['height']         = $height;

		$this->EE->load->library('image_lib', $resize);
		$this->EE->filemanager->set_image_memory($source_path);
		$this->EE->image_lib->resize();
	}

	/**
	 * Rename a source folder
	 * @param $source_id
	 * @param $source_type
	 * @param $folder_name
	 * @return object
	 */
	public function rename_source_folder($source_id, $type, $folder_name)
	{
		switch($type)
		{
			case 'ee':
			{
				return $this->EE->db->update('assets_folders', array('folder_name' => $folder_name), array('parent_id' => NULL, 'source_id' => NULL, 'filedir_id' => $source_id));
				break;
			}

			case 's3':
			{
				return $this->EE->db->update('assets_folders', array('folder_name' => $folder_name), array('parent_id' => NULL, 'source_id' => $source_id, 'filedir_id' => NULL));
				break;
			}
		}

	}

	// =====================================
	// Indexing methods
	// =====================================
	/**
	 * @param $session
	 * @param $source
	 * @return array
	 */
	public function get_index_list_for_source($session, $source)
	{
		list ($source_type, $source_id) = explode("_", $source);
		$source = $this->instantiate_source_type((object) array('source_type' => $source_type, 'source_id' => $source_id, 'filedir_id' => $source_id));

		return  $source->start_index($session);
	}

	/**
	 * @param $session
	 * @param $folder_id
	 * @return mixed
	 */
	public function get_index_list_for_folder($session, $folder_id)
	{
		$folder_row = $this->get_folder_row_by_id($folder_id);
		$source = $this->instantiate_source_type((object) $folder_row);
		return $source->start_folder_index($session, $folder_row);
	}

	/**
	 * Start a new index session and return a new index session ID
	 * @return int
	 */
	public function init_new_index_session()
	{
		return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',

			// 32 bits for "time_low"
			mt_rand(0, 0xffff), mt_rand(0, 0xffff),

			// 16 bits for "time_mid"
			mt_rand(0, 0xffff),

			 // 16 bits for "time_hi_and_version", four most significant bits holds version number 4
			mt_rand(0, 0x0fff) | 0x4000,
			// 16 bits, 8 bits for "clk_seq_hi_res", 8 bits for "clk_seq_low",
			// two most significant bits holds zero and one for variant DCE1.1
			mt_rand(0, 0x3fff) | 0x8000,

			// 48 bits for "node"
			mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
		);
	}
}
