<?php if( ! defined('BASEPATH')) exit('No direct script access allowed');

// load safeharbor_mcp
require_once 'mcp.safeharbor.php';

// load amazon s3 library
require_once 'libraries/Request.php';
require_once 'libraries/S3.php';

class Safeharbor
{
	public $version = '1.3.3';

	private $return_data = NULL;
	private $settings = array();

	public function __construct()
	{
		// disable errors - needed for transfers
		ini_set('display_errors', 0);
		error_reporting(0);

		// set script settings
		ini_set('ignore_user_abort', 'on');
		set_time_limit(0);

		// load ExpressionEngine Object
		$this->EE =& get_instance();

		// load settings
		$this->get_settings();
	}

	public function communicate()
	{
		if($this->settings['disable_remote'] == 1)
		{
			exit();
		}
		// request vars
		$auth_code = $this->EE->input->get('ac');

		// request type
		$request_alive		= $this->EE->input->get('alive') ? TRUE : FALSE;
		$request_settings	= $this->EE->input->get('get_settings') ? TRUE : FALSE;

		$request_backup_database	= $this->EE->input->get('backup_db') ? TRUE : FALSE;
		$request_backup_files		= $this->EE->input->get('file_backup') ? TRUE : FALSE;
		$request_backup_transfer	= $this->EE->input->get('transfer_backup') ? TRUE : FALSE;
		$request_backup_update		= $this->EE->input->get('update_backup') ? TRUE : FALSE;
		$request_backup_details		= $this->EE->input->get('backup_details') ? TRUE : FALSE;

		// request options
		$local_only		= $this->EE->input->get('local') ? TRUE : FALSE;
		$full_backup	= $this->EE->input->get('full') ? TRUE : FALSE;

		// force local backup if off-site auth code is not set
		if( empty($this->settings['off_site_backup_auth_code']) ) { $local_only = TRUE; }

		// validate auth_code before doing anything
		if( !empty($auth_code) AND $auth_code == $this->settings['auth_code'] )
		{
			if( $request_alive )
			{
				$data['alive'] = TRUE;
				$this->send_data($data);
			}

			if( $request_settings )
			{
				$data = $this->get_settings();

				// unsetting unneeded data
				unset($data['amazon_s3_enabled']);
				unset($data['amazon_s3_access_key']);
				unset($data['amazon_s3_secret']);
				unset($data['ftp_enabled']);
				unset($data['ftp_host']);
				unset($data['ftp_port']);
				unset($data['ftp_username']);
				unset($data['ftp_password']);
				unset($data['ftp_path']);
				unset($data['backup_path'], $data['auth_code']);
				unset($data['storage_path']);


				$data['server_time'] = time();

				$this->send_data($data);
			}

			if( $request_backup_database )
			{
				$this->backup_db();

				// notify the relay that the db backup is complete
				$safeharbor_mcp = new Safeharbor_mcp();

				$params = array('alive' => 'yes');
				$is_alive = $safeharbor_mcp->server_communication($params);

				if( !empty($is_alive['alive']) )
				{
					$params = array('db_complete' => 'yes');

					if( $local_only )
					{
						$params['local'] = 'yes';
					}

					if( $full_backup )
					{
						$params['full'] = 'yes';
					}

					$backup_now = $safeharbor_mcp->server_communication($params);

					if( empty($backup_now['error']) )
					{
						exit;
					}
				}
			}

			if( $request_backup_files )
			{
				$backup_data = $this->backup_files($full_backup);

				if( !empty($backup_data) )
				{
					$backup_file = $backup_data['file_name'];
					$backup_path = $this->_get_storage_path('current') . $backup_file;

					$this->_send_backup_to_s3($backup_file, $backup_path);
					$this->_send_backup_to_ftp($backup_file, $backup_path);

					// notify the relay that the file backup is complete
					$safeharbor_mcp = new Safeharbor_mcp();

					$params = array('alive' => 'yes');
					$is_alive = $safeharbor_mcp->server_communication($params);

					if( !empty($is_alive['alive']) )
					{
						$params = array('get_backup_info' => 'yes');

						if( $local_only )
						{
							$params['local'] = 'yes';
						}

						if( $full_backup )
						{
							$params['full'] = 'yes';
						}

						$safeharbor_mcp->server_communication($params);
					}
				}

				exit;
			}

			if( $request_backup_details )
			{
				$safeharbor_mcp = new Safeharbor_mcp();
				$latest_backup = $safeharbor_mcp->get_backups(1);
				$latest_backup = $latest_backup[0];

				$data = array(
					'size' => $latest_backup['backup_size'],
					'file_name' => $latest_backup['name'],
					'md5' => $latest_backup['md5_hash'],
					'backup_type' => $latest_backup['backup_type'],
					'backup_start_time' => $latest_backup['start_time'],
					'backup_end_time' => $latest_backup['end_time'],
					'files_backedup' => 1
				);

				if( $latest_backup['backup_type'] == 'differential' )
				{
					$last_full_backup = $this->get_last_full_backup();
					$data['full_backup_name'] = $last_full_backup['name'];
				}

				$this->send_data($data);
			}

			if( $request_backup_transfer )
			{
				// fixes the remote backup link bug. This part of communication is broken and needs to be refactored.
				if( $this->EE->input->get('transfer_backup') == 'success' AND $this->EE->input->get('local') == '1' )
				{
					$backup_file_name = $this->EE->input->get('file_name');

					$data = array('backup_transfer_failed' => '1');
					$this->EE->db->where('name', $backup_file_name);
					$this->EE->db->update('safeharbor_backups', $data);
					$this->send_backup_email();
				}
				else
				{
					switch( $this->EE->input->get('transfer_backup') )
					{
						case 'yes':
							$this->transfer_backup();
							break;
						case 'success':
							$this->send_backup_email();
							break;
						case 'fail':
							$this->set_backup_failed();
							break;
					}
				}

				exit;
			}
		}

		if( $request_backup_update )
		{
			$backup_file_name = $this->EE->input->get('file_name');
			$backup_file_local = $this->EE->input->get('local');

			$data = array('local' => '1');
			$this->EE->db->where('name', $backup_file_name);
			$this->EE->db->update('safeharbor_backups', $data);

			exit;
		}
	}

	function _backup_cron()
	{
		$this->backup_db();

		$backup_data = $this->backup_files(FALSE);

		if( !empty($backup_data) )
		{
			$backup_file = $backup_data['file_name'];
			$backup_path = $this->_get_storage_path('current') . $backup_file;

			$this->_send_backup_to_s3($backup_file, $backup_path);
			$this->_send_backup_to_ftp($backup_file, $backup_path);

			// send email
			$this->send_backup_email();

			//update backup local status
			$data = array('local' => '1');
			$this->EE->db->where('name', $backup_file);
			$this->EE->db->update('safeharbor_backups', $data);
		}
	}

	private function send_backup_email()
	{
		// load helpers
		$this->EE->load->helper('number');

		$safeharbor_mcp = new Safeharbor_mcp();

		$latest_backup = $safeharbor_mcp->get_backups(1);
		$latest_backup = $latest_backup[0];

		$email_data['site'] = str_replace('index.php', '', $this->EE->functions->fetch_site_index());
		$email_data['date'] = date('F j, Y');
		$email_data['backup_size'] = byte_format(round($latest_backup['backup_size']*(1024*1024*1024)));
		$email_data['backup_filename'] = $latest_backup['name'];
		$email_data['backup_md5'] = $latest_backup['md5_hash'];
		$email_data['backup_type'] = ucfirst($latest_backup['backup_type']);
		$email_data['backup_time_start'] = date('F j, Y g:ia', (($this->settings['time_diff']*3600) + $latest_backup['start_time']));
		$email_data['backup_time_end'] = date('F j, Y g:ia', (($this->settings['time_diff']*3600) + $latest_backup['end_time']));
		$email_data['backup_database_mode'] = $latest_backup['db_backup_mode'];

		// format backup duration
		$hrs = (int)date('G', $latest_backup['backup_time']);
		$min = (int)date('i', $latest_backup['backup_time']);
		$sec = (int)date('s', $latest_backup['backup_time']);

		$email_data['backup_time_total'] = (empty($sec) ? '' : $sec.' second'.($sec > 1 ? 's ' : ' '));

		if( !empty($hrs) OR !empty($min) )
		{
			$email_data['backup_time_total']  = (empty($hrs) ? '' : $hrs.' hour'.($hrs > 1 ? 's ' : ' '));
			$email_data['backup_time_total'] .= (empty($min) ? '' : $min.' minute'.($min > 1 ? 's ' : ' '));
		}

		// status of local backup
		if( !empty($latest_backup['local']) )
		{
			$email_data['backup_status_local'] = 'Completed Successfully.';
		}
		else
		{
			$email_data['backup_status_local'] = 'Failed.';
		}

		// status of remote backup (eeharbor service)
		if( !empty($latest_backup['backup_transfer_failed']) )
		{
			$email_data['backup_status_remote'] = "Not Configured.\n\nUpgrade at http://eeharbor.com/safeharbor/ to receive off-site backups.";
		}
		else
		{
			$email_data['backup_status_remote'] = 'Completed Successfully.';
		}

		// status of amazon s3 backup
		if( !empty($latest_backup['transferred_amazon_s3']) )
		{
			$email_data['backup_status_amazon_s3'] = 'Completed Successfully.';
		}
		else if( empty($this->settings['amazon_s3_enabled']) )
		{
			$email_data['backup_status_amazon_s3'] = 'Not Configured';
		}
		else
		{
			$email_data['backup_status_amazon_s3'] = 'Failed.';
		}

		// status of ftp backup
		if( !empty($latest_backup['transferred_ftp']) )
		{
			$email_data['backup_status_ftp'] = 'Completed Successfully.';
		}
		else if( empty($this->settings['ftp_enabled']) )
		{
			$email_data['backup_status_ftp'] = 'Not Configured';
		}
		else
		{
			$email_data['backup_status_ftp'] = 'Failed.';
		}

		// build the plain text email
		$plain_message  = '';
		$plain_message .= "Safe Harbor Backup Report\n\n";
		$plain_message .= "Date: ".$email_data['date']."\n";
		$plain_message .= "Site: ".$email_data['site']."\n\n";
		$plain_message .= "======================================================================\n\n";
		$plain_message .= "Local Backup Status:  ".$email_data['backup_status_local']."\n";
		$plain_message .= "Remote Backup Status: ".$email_data['backup_status_remote']."\n";
		$plain_message .= "Amazon S3 Backup Status: ".$email_data['backup_status_amazon_s3']."\n";
		$plain_message .= "FTP Backup Status: ".$email_data['backup_status_ftp']."\n\n";
		$plain_message .= "======================================================================\n\n";
		$plain_message .= "Backup File: ".$email_data['backup_filename']."\n";
		$plain_message .= "Backup Size: ".$email_data['backup_size']."\n\n";
		$plain_message .= "Backup Type: ".$email_data['backup_type']."\n";
		$plain_message .= "Database Backup Method: ".$email_data['backup_database_mode']."\n";
		$plain_message .= "Backup Started:   ".$email_data['backup_time_start']."\n";
		$plain_message .= "Backup Completed: ".$email_data['backup_time_end']."\n\n";
		$plain_message .= "Backup completed in ".$email_data['backup_time_total']."\n\n";
		$plain_message .= "Database Backup Method: ".$email_data['backup_database_mode']."\n\n";
		$plain_message .= "======================================================================\n\n";
		$plain_message .= "Thank you for using Safe Harbor!\n\n";
		$plain_message .= "If you have any questions or comments, feel free to send us an email at help@eeharbor.com\n\n";
		$plain_message .= "http://eeharbor.com\n";
		$plain_message .= "http://twitter.com/eeharbor\n";

		$html_message = $this->EE->load->view('email', $email_data, TRUE);

		$this->EE->load->library('email');
		$this->EE->load->helper('text');

		$this->EE->email->initialize(array('mailtype' => 'html'));

		$this->EE->email->from('info@eeharbor.com');
		$this->EE->email->to($this->settings['notify_email_address']);
		$this->EE->email->subject('Safe Harbor Backup Report: '.$email_data['site']);
		$this->EE->email->message($html_message);
		$this->EE->email->set_alt_message(word_wrap(entities_to_ascii($plain_message), 70));
		$this->EE->email->send();
	}

	private function set_backup_failed()
	{
		$this->EE->db->where('status', 'current_full');
		return $this->EE->db->update('safeharbor_backups', array('backup_transfer_failed' => 1));
	}

	private function transfer_backup()
	{
		$safeharbor_mcp = new Safeharbor_mcp();

		$latest_backup = $safeharbor_mcp->get_backups(1);
		$latest_backup = $latest_backup[0];
		$latest_backup = $this->_get_storage_path('current') . $latest_backup['name'];

		header('Pragma: public');
		header('Expires: 0');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Cache-Control: private', FALSE);

		header('Content-Disposition: attachment; filename="'.basename($latest_backup).'";');
		header('Content-Type: application/x-tar');
		header('Content-Transfer-Encoding: binary');
		header('Content-Length: '.@filesize($latest_backup));

		return $this->readfile_chunked($latest_backup);
	}

	private function get_settings()
	{
		if( empty($this->settings) )
		{
			$site_id = $this->EE->config->config['site_id'];

			// retrieve settings from database
			$settings = $this->EE->db->query("SELECT * FROM ".$this->EE->db->dbprefix('safeharbor_settings')." WHERE site_id=$site_id LIMIT 1");
			$settings = $settings->row_array();
			unset($settings['id'], $settings['backup_plan'], $settings['time_saved']);

			// get action_id
			$action_id = $this->EE->db->get_where('actions', array('class'=>'Safeharbor', 'method'=>'communicate'), 1);
			$action_id = $action_id->row();

			// defaults
			$defaults = array(
				'site_id' => $site_id,
				'base_trigger' => $this->EE->functions->fetch_site_index(0).QUERY_MARKER.'ACT='.$action_id->action_id,

				'auth_code' => '',
				'notify_email_address' => '',
				'backup_space' => '1',
				'off_site_backup_auth_code' => '',
				'backup_path' => dirname(dirname(dirname(BASEPATH))),
				'time_diff' => '0',
				'backup_time' => '2,30',
				'transfer_type' => 'http',
				'db_backup' => 'command',

				'amazon_s3_enabled' => '0',
				'amazon_s3_access_key' => '',
				'amazon_s3_secret' => '',

				'ftp_enabled' => '0',
				'ftp_host' => '',
				'ftp_username' => '',
				'ftp_password' => '',
				'ftp_port' => '21',
				'ftp_path' => '',
			);

			$this->settings = array_merge($defaults, $settings);



			if( !empty($this->settings['auth_code']) )
			{
				// decrypt amazon s3 and ftp data
				$this->EE->load->library('encrypt');
				$this->EE->encrypt->set_key($this->settings['auth_code']);

				$this->settings['amazon_s3_access_key'] = $this->EE->encrypt->decode($this->settings['amazon_s3_access_key']);
				$this->settings['amazon_s3_secret'] = $this->EE->encrypt->decode($this->settings['amazon_s3_secret']);
				$this->settings['ftp_password'] = $this->EE->encrypt->decode($this->settings['ftp_password']);
			}

			// clean up
			$defaults = NULL;
			$settings = NULL;
			unset($defaults, $settings);
		}

		return $this->settings;
	}

	private function send_data( $data, $exit=TRUE )
	{
		$data['version'] = $this->version;
		$data = $this->data_encode($data);

		echo $data;
		flush();
		ob_flush();

		if( $exit ) { exit(); }
	}

	private function data_encode( $data )
	{
		return base64_encode(serialize($data));
	}

	private function backup_db()
	{
		$return = NULL;
		$backup_start = time();

		$db_name = $this->EE->db->database;
		$db_host = $this->EE->db->hostname;
		$db_user = $this->EE->db->username;
		$db_pass = $this->EE->db->password;

		//check to confirm directory exists.
		$safeharbor_mcp = new Safeharbor_mcp();
		$safeharbor_mcp->create_dir_structure($this->settings['storage_path']);
		
		$database_dump = $this->_get_storage_path('default_current');
		$archive_status = $this->archive_current_backup();

		if( $archive_status )
		{
			$database_dump_file = $database_dump.'safeharbor_'.time().'.sql';

			if( $this->settings['db_backup'] == 'command' )
			{

				$command = "mysqldump --add-drop-table --host=$db_host --user='$db_user' --password='$db_pass' $db_name > $database_dump_file";
				$output = shell_exec($command);

				// Hi there, whats your name?  This is Tom from Packet Tide / EEHarbor, if you
				// see this you should shoot me a tweet @TomJaeger :)

				// test to make sure we have a database dump
				$database_error = FALSE;
				if( file_exists($database_dump_file) )
				{
					// this should be 10k. A file that might be accidentally
					// written with an error won't have a file size greater
					// than 10k, but a database will
					if( filesize($database_dump_file) < 10240 )
					{
						$database_error = TRUE;
					}
				}
				else
				{
					$database_error = FALSE;
				}

				// if command based database dump fails, fall back to php dump
				if( $database_error )
				{
					if( $this->php_backup_db($database_dump_file) )
					{
						$return = TRUE;
					}
					else
					{
						$return = FALSE;
					}
				}
				else
				{
					$return = TRUE;
				}
			}
			else if( $this->settings['db_backup'] == 'php' )
			{
				if( $this->php_backup_db($database_dump_file) )
				{
					$return = TRUE;
				}
				else
				{
					$return = FALSE;
				}
			}
		}

		if( $return === TRUE )
		{
			// update the database
			$this->EE->db->insert('safeharbor_backups', array(
				'site_id' => $this->EE->config->config['site_id'],
				'name' => pathinfo($database_dump_file, PATHINFO_BASENAME),
				'start_time' => $backup_start,
				'status' => 'current_db_only',
				'db_backup_mode' => $this->settings['db_backup']
			));
		}

		return $return;
	}

	private function php_backup_db( $temp_db_dump_file )
	{
		$return_data = NULL;

		$db_name = $this->EE->db->database;
		$db_host = $this->EE->db->hostname;
		$db_user = $this->EE->db->username;
		$db_pass = $this->EE->db->password;

		$results = $this->EE->db->query('SHOW TABLES');
		$results = $results->result();

		$tables = array();
		if( !empty($results) )
		{
			foreach( $results as $row )
			{
				foreach( $row as $table )
				{
					$tables[] = $table;
				}
			}
		}

		if( @touch($temp_db_dump_file) )
		{
			$fp = fopen($temp_db_dump_file, 'w');

			if( !empty($tables) )
			{
				foreach( $tables as $table )
				{
					// build create table syntax
					$create_table_results = $this->EE->db->query('SHOW CREATE TABLE '.$table);

					$create_table_string  = "\n\n";
					$create_table_string .= $create_table_results->row('Create Table');

					$create_table_string  = str_replace('CREATE TABLE `'.$table.'`', 'CREATE TABLE IF NOT EXISTS `'.$table.'`', $create_table_string);
					$create_table_string .= ";\n";

					fwrite($fp, $create_table_string);

					// build insert rows syntax
					$num_rows = $this->EE->db->query('SELECT COUNT(*) AS rows FROM '.$table);
					$num_rows = $num_rows->row('rows');

					$loop = ceil($num_rows/50);

					for( $x=0; $x<=$loop; $x++ )
					{
						$results = $this->EE->db->query('SELECT * FROM '.$table.' LIMIT '.($x*50).', 50');
						$results = $results->result();

						foreach( $results as $row )
						{
							fwrite($fp, "\n".$this->EE->db->insert_string($table, $row).';');
						}

						// clean up
						$results = NULL;
						unset($results);
					}
				}
			}
		}

		fclose($fp);

		// make sure file exists
		if( file_exists($temp_db_dump_file) AND filesize($temp_db_dump_file) > 10000 )
		{
			$this->settings['db_backup'] = 'php';
			$return_data = TRUE;
		}
		else
		{
			$return_data = FALSE;
		}

		return $return_data;
	}

	private function backup_files( $full_backup=FALSE )
	{
		$return_data = NULL;

		$exclude_files = '*/safeharbor_backups/old_backups/*';

		$database_file = $this->_get_storage_path('current');

		$database_file .= $this->get_current_backup_file();

		$backup_file = str_replace('sql', 'tgz', $database_file);

		$path_to_backup = $this->get_path_to_backup();

		if( $full_backup )
		{
			$backup_type = 'FULL';
		}
		else
		{
			$backup_type = $this->backup_full_or_differential();
		}



		$last_full_backup = NULL;
		if( $backup_type != 'FULL' )
		{
			$last_full_backup = $this->get_last_full_backup();
			if( !empty($last_full_backup) )
			{
				$last_timestamp = date(DATE_RFC2822, $last_full_backup['file_ctime']);
			}
		}

		if( !empty($path_to_backup['last']) )
		{
			if( $backup_type == 'DIFFERENTIAL' )
			{
				// TODO: change multiple excludes to read a file for excludes, or config param
				// this was the old command tweaked didn't work on all linux boxes
				$command = "tar -pzcf $backup_file --newer-mtime '$last_timestamp' --exclude '$exclude_files' --exclude *.tgz ./";
			}
			else if( $backup_type == 'FULL' )
			{
				// TODO: change multiple excludes to read a file for excludes, or config param
				$command = "tar -pzcf $backup_file --exclude '$exclude_files' --exclude *.tgz ./";
			}
		}
		else
		{
			$error = "We don't have a backup path set. Please set it in your settings";
		}


		if( chdir($path_to_backup['full_path']) )
		{
			$output = exec($command);
		}
		else
		{
			$error = "We couldn't get into the directory needed to start your backup ERROR: 7709";
		}

		if( file_exists($backup_file) )
		{
			// remove sql file
			$database_file = $this->_get_storage_path('default_current');
			$database_file .= $this->get_current_backup_file();
			unlink($database_file);

			$current_backup_start_time = $this->get_current_backup_start_time();

			$data['name'] = $this->get_current_backup_file();
			$data['name'] = str_replace('sql', 'tgz', $data['name']);

			$data['end_time'] = time();

			//check to see if end time and start time are the same.  If so we set the backup time to 1 second
			if( $data['end_time'] == $current_backup_start_time)
			{
				$data['end_time'] += 1;
			}

			$data['backup_time'] = $data['end_time'] - $current_backup_start_time;

			$file_stat = stat($backup_file);
			$data['file_ctime'] = $file_stat['ctime'];

			if( $backup_type == 'DIFFERENTIAL' )
			{
				$data['full_backup_id'] = $last_full_backup['backup_id'];
			}

			$data['status'] = 'current_full';
			$data['backup_size'] = $this->get_backup_size($backup_file);
			$data['md5_hash'] = md5_file($backup_file);
			$data['backup_type'] = strtolower($backup_type);

			$data['local'] = 1;
			$data['backup_transfer_failed'] = 0;

			$current_backup_name = $this->get_current_backup_file();

			$this->check_for_status( $data['status'] );
			$this->change_backup_status($current_backup_name, '', $data);

			unset($return_data);

			$return_data['size'] = $data['backup_size'];
			$return_data['file_name'] = $data['name'];

			if( $backup_type != 'FULL' )
			{
				$last_full_backup = $this->get_last_full_backup();
				$return_data['full_backup_name'] = $last_full_backup['name'];
			}

			$return_data['backup_end_time'] = $data['end_time'];
			$return_data['backup_start_time'] = $current_backup_start_time;
			$return_data['backup_type'] = $data['backup_type'];
		}

		return $return_data;
	}

	private function archive_current_backup()
	{
		$path = $this->_get_storage_path('current');

		$return_data = NULL;

		$this->manage_space();

		$old_backups_directory = $this->_get_storage_path('old');

		// list of backups which need to be archived.
		$backups = array();
		$dir_listing = scandir($path);

		foreach($dir_listing as $key => $val)
		{
			if( $val == '.' || $val == '..')
			{
				unset($dir_listing[$key]);
			}
		}

		if( empty($dir_listing) )
		{
			$path = $this->_get_storage_path('default_current');
			$dir_listing = scandir($path);
		}

		foreach( $dir_listing as $var )
		{
			if( preg_match('/^safeharbor/', $var) )
			{
				$backups[] = $var;
			}
		}

		if( !empty($backups) )
		{
			foreach( $backups as $file )
			{
				$old_file = $path.$file;

				if(!file_exists($old_file))
				{
					// we will go ahead and change the path to the default
					$path = $this->_get_storage_path('default_current');
					$old_file = $path.$file;
				}

				$new_file = $old_backups_directory.$file;

				if( @rename($old_file, $new_file) )
				{
					$this->change_backup_status($file, 'archived');
					$return_data = TRUE;
				}
				else
				{
					$return_data = FALSE;
				}
			}
		}
		else
		{
			$return_data = TRUE;
		}

		return $return_data;
	}

	/**
	 * manage_space ()
	 *
	 * This function manages all the space used by backups. It will free up space by
	 * deleting older backups if we have reached the limit or if we need more space to
	 * run the current backup request. The limit is set in the control panel by the
	 * user (which can be updated at any time).
	 *
	 * @access private
	 * @return void
	 */
	private function manage_space()
	{
		$backup_path = $this->_get_storage_path('base');

		// convert current space to float value
		$this->settings['backup_space'] = (float)$this->settings['backup_space'];
		$this->settings['backup_space'] = round($this->settings['backup_space']);

		$space_used = $this->size_format($this->get_dir_size($backup_path), 'GB');

		// check if we are utilizing all the allocated space for backups. If
		// user defined limit has been reached, clean up some old backups to
		// make room for the new ones.
		if( $space_used >= $this->settings['backup_space'] )
		{
			if( $this->remove_backup() )
			{
				$this->manage_space();
			}
		}
		elseif( $space_used < $this->settings['backup_space'] )
		{
			// check if we have enough space available to run a new backup. If
			// not, delete old backups to make room.
			$space_available = $this->settings['backup_space'] - $space_used;

			// TODO: we need to fix this estimated backup size calculation. If
			// a user was to add a 2GB file since the last backup, it would not
			// be accounted for and we would fall short of our calculation.
			// This would cause the (user defined) alloted space for backups to
			// be surpassed.
			$this->EE->db->order_by('backup_id', 'desc');
			$current_backup_details = $this->EE->db->get('safeharbor_backups', 1);
			$current_backup_details = $current_backup_details->row_array();

			if( !empty($current_backup_details) )
			{
				if( $space_available < $current_backup_details['backup_size'] )
				{
					if( $this->remove_backup() )
					{
						$this->manage_space();
					}
				}
			}
		}
	}

	private function remove_backup($default = '')
	{
		if( empty($default))
		{
			$old_backups_path = $this->_get_storage_path('old');
		}
		elseif($default == 'default_old')
		{
			$old_backups_path = $this->_get_storage_path('default_old');
		}

		// retrieve oldest backup
		$this->EE->db->where(array(
			'status' => 'archived',
			'backup_type' => 'full'
		));
		$this->EE->db->order_by('start_time', 'ASC');
		$oldest_backup = $this->EE->db->get('safeharbor_backups', 1);
		$oldest_backup = $oldest_backup->row_array();

		if( !empty($oldest_backup) )
		{
			// check if there are any differential backups related to this full
			// backup. If so, delete them.
			$this->EE->db->where(array(
				'status' => 'archived',
				'backup_type' => 'differential',
				'full_backup_id' => $oldest_backup['backup_id']
			));
			$this->EE->db->order_by('start_time', 'ASC');
			$oldest_differential = $this->EE->db->get('safeharbor_backups');
			$oldest_differential = $oldest_differential->row_array();

			if( !empty($oldest_differential) )
			{
				// delete oldest differential
				$file = $old_backups_path.$oldest_differential['name'];

				if( $this->remove_backup_file($file) )
				{

					if( (bool)$this->settings['amazon_s3_enabled'] )
					{
						// remove backup file from s3 bucket
						$s3 = new s3($this->settings['amazon_s3_access_key'], $this->settings['amazon_s3_secret']);
						$s3->delete_object('safeharbor-' . $this->settings['auth_code'], $oldest_differential['name']);

						// cleanup
						$s3 = null;
						unset($s3);
					}

					if( (bool)$this->settings['ftp_enabled'] )
					{
						$this->EE->load->library('ftp');

						$this->EE->ftp->connect(array(
							'hostname' => $this->settings['ftp_host'],
							'username' => $this->settings['ftp_username'],
							'password' => $this->settings['ftp_password'],
							'port' => $this->settings['port'],
						));

						$remote_file = $this->settings['ftp_path'].$oldest_differential['name'];;

						$this->EE->ftp->delete_file($remote_file);
						$this->EE->ftp->close();
					}
					// change the status of the backup in database
					$this->change_backup_status($oldest_differential['name'], 'Purged');

					// remove search index
					$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $oldest_differential['backup_id']));

					return TRUE;
				}
			}
			else
			{
				// no more differentials, delete the full backup
				$file = $old_backups_path.$oldest_backup['name'];

				if( $this->remove_backup_file($file) )
				{
					if( (bool)$this->settings['amazon_s3_enabled'] )
					{
						// remove backup file from s3 bucket
						$s3 = new s3($this->settings['amazon_s3_access_key'], $this->settings['amazon_s3_secret']);
						$s3->delete_object('safeharbor-' . $this->settings['auth_code'], $oldest_backup['name']);

						// cleanup
						$s3 = null;
						unset($s3);
					}

					// if off site ftp backups is enabled go ahead and remove the full backup from there as well.
					if( (bool)$this->settings['ftp_enabled'] )
					{
						$this->EE->load->library('ftp');

						$this->EE->ftp->connect(array(
							'hostname' => $this->settings['ftp_host'],
							'username' => $this->settings['ftp_username'],
							'password' => $this->settings['ftp_password'],
							'port' => $this->settings['port'],
						));

						$remote_file = $this->settings['ftp_path'].$oldest_backup['name'];;

						// remove oldest backup on FTP server
						$this->EE->ftp->delete_file($remote_file);
						$this->EE->ftp->close();
					}

					// change the status of the backup in database
					$this->change_backup_status($oldest_backup['name'], 'Purged');

					// remove search index
					$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $oldest_differential['backup_id']));

					return TRUE;

				}
				elseif( !empty($this->settings['storage_path']))
				{
					// call self and change path
					$this->remove_backup('default_old');
				}
			}
		}

		return FALSE;
	}

	public function remove_backup_file( $file )
	{
		
		// this function can be switched to use the codeigniter helper
		// $this->EE->load->helper('file');
		//delete_files($backup_path_current.$riw['name']);
		
		if( !empty($file) )
		{
			// check if file exists
			if( file_exists($file) )
			{
				// delete the file
				if( @unlink($file) )
				{
					// make sure the file was deleted
					if( !file_exists($file) )
					{
						return TRUE;
					}
					else
					{
						// file was not deleted
						return FALSE;
					}
				}
				else
				{
					// file could not be deleted
					return FALSE;
				}
			}
			else
			{
				// file not found
				return TRUE;
			}
		}

		return FALSE;
	}

	private function get_dir_size( $path )
	{
		$total_size = 0;

		if( is_dir($path) )
		{
			$files = scandir($path);

			foreach( $files as $file )
			{
				if( ($file != '.') AND ($file != '..') AND !is_link($file) )
				{
					$file_path = $path.'/'.$file;

					if( is_dir($file_path) )
					{
						$total_size += $this->get_dir_size($file_path);
					}
					elseif( is_file($file_path) AND is_readable($file_path) )
					{
						$total_size += filesize($file_path);
					}
				}
			}
		}

		return $total_size;
	}

	public function change_backup_status( $file, $action, $data="" )
	{
		if( empty($data)  && $action != 'Purged')
		{
			$data = array('status' => $action);
		}
		elseif( $action == 'Purged')
		{
			$this->EE->db->select('backup_id');
			$this->EE->db->from('safeharbor_backups');
			$this->EE->db->where('name', $file);
			$results = $this->EE->db->get();
			$results = $results->result();
			$backup_id = $results->row('backup_id');


			$this->EE->db->delete('safeharbor_backups', array('backup_id' => $backup_id));
			$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $backup_id));
			
			return TRUE;
		}

		$this->EE->db->where('name', $file);
		return $this->EE->db->update('safeharbor_backups', $data);
	}

	public function get_current_backup_file()
	{
		$this->EE->db->reconnect();
		$this->EE->db->select('name');
		$this->EE->db->order_by('backup_id', 'desc');
		$results = $this->EE->db->get('safeharbor_backups', 1);
		$results = $results->result();

		if( !empty($results) )
		{
			return $results[0]->name;
		}
	}

	private function get_current_backup_start_time()
	{
		$this->EE->db->reconnect();
		$this->EE->db->select('start_time');
		$this->EE->db->order_by('backup_id', 'desc');
		$results = $this->EE->db->get('safeharbor_backups', 1);
		$results = $results->result();

		if( !empty($results) )
		{
			return $results[0]->start_time;
		}
	}

	private function backup_full_or_differential()
	{
		$last_full_backup = $this->get_last_full_backup();
		$next_full_backup = strtotime('+1 week', $last_full_backup['start_time']);

		$current_time = time();

		$return = 'FULL';

		if( $current_time < $next_full_backup )
		{
			$return = 'DIFFERENTIAL';
		}

		return $return;
	}

	private function get_last_full_backup()
	{
		$this->EE->db->select('backup_id, name, start_time, file_ctime, status');
		$this->EE->db->where(array(
			'backup_type' => 'full',
			'status !=' => 'current_db_only',
			// 'status !=' => 'Purged',
		));
		$this->EE->db->order_by('start_time', 'desc');
		$last_backup = $this->EE->db->get('safeharbor_backups', 1);
		$last_backup = $last_backup->result_array();

		if( $last_backup[0]['status'] == 'Purged' )
		{
			$last_backup[0]['start_time'] = 0;
		}

		return $last_backup[0];
	}

	private function get_path_to_backup()
	{
		$return_data = NULL;

		if( !empty($this->settings['backup_path']) )
		{
			$return_data['full_path'] = $this->settings['backup_path'];

			$parts = explode('/', $this->settings['backup_path']);

			foreach( $parts as $key => $val )
			{
				if( $val == "" )
				{
					unset($parts[$key]);
				}
			}

			$parts = array_values($parts);
			$last = array_pop($parts).'/';

			$return_data['last'] = $last;

			$base_path = '';
			foreach( $parts as $key => $val )
			{
				$base_path .= '/'.$val;
			}
			$base_path .= '/';

			$return_data['base_path'] = $base_path;
		}
		else
		{
			$return_data = FALSE;
		}

		return $return_data;
	}

	private function get_backup_size( $file )
	{
		$size = filesize($file);
		if( $size )
		{
			return $this->size_format($size, 'GB');
		}

		return "unk";
	}

	private function size_format( $size, $format='MB' )
	{
		if( $format == 'GB' )
		{
			$size = round($size/(1024*1024*1024), 5);
		}
		else
		{
			$size = round($size/(1024*1024), 1);
		}

		return $size;
	}

	private function check_for_status( $status )
	{
		$results = $this->EE->db->get_where('safeharbor_backups', array('status' => $status));
		$results = $results->result();

		if( !empty($results) )
		{
			foreach( $results as $row )
			{
				$this->EE->db->where('backup_id', $row->backup_id);
				$this->EE->db->update('safeharbor_backups', array('status' => 'Unk Error'));
			}
		}

		return TRUE;
	}

	private function readfile_chunked( $filename )
	{
		$rate = 1024;

		if( file_exists($filename) AND is_file($filename) )
		{
			$file = fopen($filename, 'rb');

			while( !feof($file) )
			{
				print fread($file, round($rate * 1024));
				flush();
				ob_flush();
				sleep(1);
			}

			fclose($file);

			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}

	// function takes a param and returns the approprate path for storage locations
	function _get_storage_path($type = 'parent')
	{
		if( $type == 'old')
		{
			return $this->settings['storage_path'].'safeharbor_backups/old_backups/';
		}
		elseif( $type == 'current')
		{
			return $this->settings['storage_path'].'safeharbor_backups/current_backup/';
		}
		elseif($type == 'base')
		{
			return $this->settings['storage_path'].'safeharbor_backups/';
		}
		elseif( $type == 'default_old')
		{
			return APPPATH.'cache/safeharbor_backups/old_backups/';
		}
		elseif( $type == 'default_current')
		{
			return APPPATH.'cache/safeharbor_backups/current_backup/';
		}

		else
		{
			return FALSE;
		}
	}

	private function _send_backup_to_s3($backup_file, $backup_path)
	{
		//transfer to amazon S3 to be put into a function
		if( (bool)$this->settings['amazon_s3_enabled'] )
		{
			$bucket = 'safeharbor-' . $this->settings['auth_code'];

			// create bucket to make sure it's there for backup storage
			$S3 = new S3($this->settings['amazon_s3_access_key'], $this->settings['amazon_s3_secret']);
			$S3->create_bucket($bucket);
			$bucket_response = $S3->response_info();

			// cleanup
			$S3 = NULL;
			unset($S3);

			if( $bucket_response['http_code'] == 200 )
			{
				// transfer backup to amazon s3
				$S3 = new S3($this->settings['amazon_s3_access_key'], $this->settings['amazon_s3_secret']);
				$S3->create_object($bucket, $backup_file, $backup_path);
				$object_response = $S3->response_info();

				// cleanup
				$S3 = NULL;
				unset($S3);

				if( $object_response['http_code'] == 200 )
				{
					$this->EE->db->where('name', $backup_file);
					$this->EE->db->update('safeharbor_backups', array('transferred_amazon_s3' => 1));
				}
			}
		}
		//end amazon s3
	}

	private function _send_backup_to_ftp($backup_file, $backup_path)
	{
		// Transfer to FTP needs to be put into a funciton
		if( (bool) $this->settings['ftp_enabled'])
		{
			$this->EE->load->library('ftp');

			$this->EE->ftp->connect(array(
				'hostname' => $this->settings['ftp_host'],
				'username' => $this->settings['ftp_username'],
				'password' => $this->settings['ftp_password'],
				'port' => $this->settings['port'],
			));

			$remote_file = $this->settings['ftp_path'].$backup_file;

			// change directory
			if( $this->EE->ftp->changedir($this->settings['ftp_path'], TRUE) )
			{
				if( $this->EE->ftp->upload($backup_path, $backup_file , 'ascii', 0775) )
				{
					$this->EE->db->where('name', $backup_file);
					$this->EE->db->update('safeharbor_backups', array('transferred_ftp' => 1));
				}
				else
				{
					$this->EE->db->where('name', $backup_file);
					$this->EE->db->update('safeharbor_backups', array('transferred_ftp' => 2));
				}
			}
			elseif( $this->EE->ftp->mkdir($this->settings['ftp_path'], 0777) )
			{
				if( $this->EE->ftp->changedir($this->settings['ftp_path'], TRUE) )
				{
					if( $this->EE->ftp->upload($backup_path, $backup_file , 'ascii', 0775) )
					{
						$this->EE->db->where('name', $backup_file);
						$this->EE->db->update('safeharbor_backups', array('transferred_ftp' => 1));
					}
					else
					{
						$this->EE->db->where('name', $backup_file);
						$this->EE->db->update('safeharbor_backups', array('transferred_ftp' => 2));
					}
				}
			}
			else
			{
				$ftp_failed = 1;
			}

			$this->EE->ftp->close();
		}
		//end transfer to FTP
	}
}

/* End of File: mod.safeharbor.php */
