<?php if( ! defined('BASEPATH')) exit('No direct script access allowed');

// load amazon s3 library
require_once 'libraries/Request.php';
require_once 'libraries/S3.php';
require_once 'mod.safeharbor.php';

class Safeharbor_mcp
{
	public $version = '1.3.3';

	private $settings = array();
	private $servers = array('eeharbor.com/index.php?ACT=23');

	public $all_files = array();

	// data to be sent to views
	private $data = array();


	public function __construct()
	{
		// disable errors - needed for transfers
		ini_set('display_errors', 0);
		error_reporting(0);

		// set default timezone
		date_default_timezone_set('GMT');

		// Load the Expression Engine object
		$this->EE =& get_instance();

		// load settings
		$this->get_settings();
	}

	public function index()
	{
		if( empty($this->settings['auth_code']) )
		{
			$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings');
		}

		// load libraries
		$this->EE->load->library('table');

		// load helpers
		$this->EE->load->helper('number');

		// Set page title
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('safeharbor_module_name'));

		// set navigation
		$this->_set_right_nav();

		$this->EE->cp->add_js_script(array('ui' => array('core', 'position', 'widget')));

		// sync backups in directory
		$this->sync_backups_db();
		
		//run manage space here as well.
		

		// send data to view
		$this->data['backups'] = $this->EE->input->get('all') ? $this->get_backups() : $this->get_backups(10);

		$this->data['settings'] = $this->settings;
		$this->data['class'] = $this;

		return $this->EE->load->view('index', $this->data, TRUE);
	}

	public function settings()
	{
		// load libraries
		$this->EE->load->library('form_validation');
		$this->EE->load->library('table');

		// setup validation
		$this->EE->form_validation->set_rules('auth_code', 'auth code', 'required');
		$this->EE->form_validation->set_rules('notify_email_address', 'notification email address', 'required|valid_email');
		$this->EE->form_validation->set_rules('backup_space', 'local backup space', 'required|is_natural_no_zero');
		$this->EE->form_validation->set_rules('backup_path', 'backup path', 'required');
		$this->EE->form_validation->set_rules('disable_remote', 'Disable Remote', 'required');

		if( $this->EE->input->post('amazon_s3_enabled') )
		{
			$this->EE->form_validation->set_rules('amazon_s3_access_key', 'access key id', 'required');
			$this->EE->form_validation->set_rules('amazon_s3_secret', 'secret', 'required');
		}
		if( $this->EE->input->post('ftp_enabled') )
		{
			$this->EE->form_validation->set_rules('ftp_host', 'ftp host', 'required');
			$this->EE->form_validation->set_rules('ftp_username', 'ftp username', 'required');
			$this->EE->form_validation->set_rules('ftp_password', 'ftp password', 'required');
			$this->EE->form_validation->set_rules('ftp_port', 'ftp port', 'required');
			$this->EE->form_validation->set_rules('ftp_path', 'ftp path', 'required');
		}

		// process form submission
		if( $this->EE->input->post('submit') )
		{
			if( $this->EE->form_validation->run() )
			{
				$this->settings['auth_code'] = $this->EE->input->post('auth_code');
				$this->settings['notify_email_address'] = $this->EE->input->post('notify_email_address');
				$this->settings['backup_space'] = $this->EE->input->post('backup_space');
				$this->settings['off_site_backup_auth_code'] = $this->EE->input->post('auth_code');
				$this->settings['backup_path'] = $this->EE->input->post('backup_path');
				$this->settings['storage_path'] = $this->EE->input->post('storage_path');

				if (substr($this->settings['storage_path'], -1) !== '/')
				{
					$this->settings['storage_path'] = $this->settings['storage_path'].'/';
				}
				$this->create_dir_structure($this->settings['storage_path']);

				// TODO: need to go ahead and create directories here

				$this->settings['backup_time'] = $this->EE->input->post('backup_time-hour').','.$this->EE->input->post('backup_time-min');
				$this->settings['transfer_type'] = $this->EE->input->post('transfer_type');
				$this->settings['db_backup'] = $this->EE->input->post('db_backup');

				// This setting disables the remote schedueling of backups
				$this->settings['disable_remote'] = $this->EE->input->post('disable_remote');

				// setting Amazon S3 settings
				$this->settings['amazon_s3_enabled'] = $this->EE->input->post('amazon_s3_enabled') ? '1' : '0';
				$this->settings['amazon_s3_access_key'] = $this->EE->input->post('amazon_s3_access_key');
				$this->settings['amazon_s3_secret'] = $this->EE->input->post('amazon_s3_secret');

				// setting FTP settings
				$this->settings['ftp_enabled'] = $this->EE->input->post('ftp_enabled') ? '1' : '0';
				$this->settings['ftp_host'] = $this->EE->input->post('ftp_host');
				$this->settings['ftp_username'] = $this->EE->input->post('ftp_username');
				$this->settings['ftp_password'] = $this->EE->input->post('ftp_password');
				$this->settings['ftp_port'] = $this->EE->input->post('ftp_port');
				$this->settings['ftp_path'] = $this->EE->input->post('ftp_path');

				if( $this->save_settings() )
				{
					$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('config_save_success'));
				}
				else
				{
					$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('config_save_failure'));
				}
			}
			else
			{
				$this->EE->session->set_flashdata('message_failure', validation_errors());
			}

			$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings');
		}

		// Set page title
		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('safeharbor_module_name_settings'));

		// set navigation
		$this->_set_right_nav();

		// send data to view
		$this->data['settings'] = $this->settings;

		return $this->EE->load->view('settings', $this->data, TRUE);
	}

	public function note()
	{
		$backup_id = (int)$this->EE->input->get('ID');
		$note = $this->EE->input->post('note');

		$this->EE->db->where('backup_id', $backup_id);
		$this->EE->db->update('safeharbor_backups', array('note' => $note));

		$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('backup_note_save_success'));
		$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index');
	}

	public function retrieve()
	{
		$backup_id = (int)$this->EE->input->get('ID');

		$selected_backup = NULL;
		$full_backup = NULL;

		if( !empty($backup_id) )
		{
			$this->EE->db->select('name, backup_id, full_backup_id, status, md5_hash, backup_size, backup_type, backup_transfer_failed, transferred_amazon_s3');
			$this->EE->db->select('IF((SELECT COUNT(backup_id) FROM '.$this->EE->db->dbprefix('safeharbor_backups').' WHERE status!="current_db_only") > 30, IF((SELECT backup_id FROM '.$this->EE->db->dbprefix('safeharbor_backups').' WHERE status != "current_db_only" ORDER BY backup_id DESC LIMIT 30,1) < backup_id, 1, 0), 1) AS remote_available', FALSE);
			$selected_backup = $this->EE->db->get_where('safeharbor_backups', array('backup_id' => $backup_id), 1);
			$selected_backup = $selected_backup->row_array();

			// create our links for the selected backup
			$links = array();
			$local_link = $this->get_local_backup_link($selected_backup);
			if( !empty($local_link) ) { $links[] = $local_link; }

			$amazon_s3_link = $this->get_amazon_s3_backup_link($selected_backup);
			if( !empty($amazon_s3_link) ) { $links[] = $amazon_s3_link; }

			$this->data['selected_backup'] = $selected_backup;
			$this->data['selected_backup_links'] = $links;
			$this->data['selected_backup_remote_link'] = $this->get_remote_backup_link($selected_backup);

			// if backup is a differential, selected related full backup
			if( !empty($selected_backup['full_backup_id']) )
			{
				$this->EE->db->select('name, backup_id, full_backup_id, status, md5_hash, backup_size, backup_type, backup_transfer_failed, transferred_amazon_s3');
				$this->EE->db->select('IF((SELECT COUNT(backup_id) FROM '.$this->EE->db->dbprefix('safeharbor_backups').' WHERE status!="current_db_only") > 30, IF((SELECT backup_id FROM '.$this->EE->db->dbprefix('safeharbor_backups').' WHERE status != "current_db_only" ORDER BY backup_id DESC LIMIT 30,1) < backup_id, 1, 0), 1) AS remote_available', FALSE);
				$full_backup = $this->EE->db->get_where('safeharbor_backups', array('backup_id' => $selected_backup['full_backup_id']), 1);
				$full_backup = $full_backup->row_array();

				// create our links for the full backup (if any)
				$links = array();
				$local_link = $this->get_local_backup_link($full_backup);
				if( !empty($local_link) ) { $links[] = $local_link; }

				$amazon_s3_link = $this->get_amazon_s3_backup_link($full_backup);
				if( !empty($amazon_s3_link) ) { $links[] = $amazon_s3_link; }

				$this->data['full_backup_links'] = $links;
				$this->data['full_backup'] = $full_backup;
			}
		}

		ob_end_clean();
		print $this->EE->load->view('modal_download', $this->data, TRUE);
		exit;
	}
	
	public function delete_confirm()
	{
		$backup_id = (int)$this->EE->input->get('ID');

		if( !empty($backup_id) )
		{
			// query to get the backup details 
			$this->EE->db->select('name, backup_id, start_time, backup_type');
			$selected_backup = $this->EE->db->get_where('safeharbor_backups', array('backup_id' => $backup_id), 1);
			$selected_backup = $selected_backup->row_array();

			$this->data['name'] = $selected_backup['name'];
			$this->data['start_time'] = date('F j, Y g:ia', $this->EE->localize->set_localized_time($selected_backup['start_time']));
			$this->data['delete_link'] = '<a class="submit" href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=delete'.AMP.'ID='.$selected_backup['backup_id'].'">'.lang('delete').'</a>';

			if( $selected_backup['backup_type'] == full)
			{
				$this->data['delete_diffs'] = 1;
			}

			ob_end_clean();			
			print $this->EE->load->view('modal_delete', $this->data, TRUE);
			exit;
		
		}

	}
	
	public function delete()
	{
		
		// I really don't like how the path checks are done here... it should be moved to the _remove_backup method.
		// We will also have to refactor the manage_backup_files to remove the paths from there.
		// also check to see where else we might need to refactor as a result.
		// TODO: refactor this to remove the path checks
		// TODO: move path checks into the _remove_backup method possible
		$mod = new Safeharbor();

		$backup_id = (int)$this->EE->input->get('ID');
		
		$this->EE->db->select('name, backup_id, start_time, status');
		$backup = $this->EE->db->get_where('safeharbor_backups', array('backup_id' => $backup_id), 1);
		$backup = $backup->row_array();
		
		if( $backup['status'] != 'current_full' )
		{
			$path = $mod->_get_storage_path('old');
			
			if(file_exists($path.$backup_name))
			{
				$return_data = $this->_remove_backup($path.$backup['name']);
			}
			else
			{
				$path = $mod->_get_storage_path('default_old');
				if(file_exists($path.$backup_name))
				{
					$return_data = $this->_remove_backup($path.$backup['name']);
				}
			}
		}
		else
		{
			$path = $mod->_get_storage_path('current');
			
			if(file_exists($path.$backup_name))
			{
				$return_data = $this->_remove_backup($path.$backup['name']);
			}
			else
			{
				$path = $mod->_get_storage_path('default_current');
				
				if(file_exists($path.$backup_name))
				{
					$return_data = $this->_remove_backup($path.$backup['name']);
				}
			}
		}
		if($return_data)
		{
			$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('backup_deleted'));			
		}
		else
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backup_delete_failed'));
		}

		$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index');
	}

	public function download()
	{
		$backup_id = (int)$this->EE->input->get('O');

		$mod = new Safeharbor();

		$backup_path = $mod->_get_storage_path('base');

		$this->EE->db->select('name, full_backup_id, status');
		$backup = $this->EE->db->get_where('safeharbor_backups', array('backup_id' => $backup_id), 1);
		$backup = $backup->row_array();

		$backup_file = $backup_path . (($backup['status'] == 'archived') ? 'old_backups/' : 'current_backup/') . $backup['name'];

		if( file_exists($backup_file) )
		{
			$download = 1;
		}
		else
		{
			if($backup['status'] == 'archived')
			{
				$backup_path = $mod->_get_storage_path('default_old');
			}
			else
			{
				$backup_path = $mod->_get_storage_path('default_current');
			}

			$backup_file = $backup_path . $backup['name'];

			if( file_exists($backup_file) )
			{
				$download = 1;
			}
			else
			{
				$download = 0;
				$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('download_failed_file_not_found'));
			}
		}
		if( !empty($download))
		{
			// send file download to user
			$file_size = filesize($backup_file);
			header("Cache-Control: public");
			header("Content-Description: File Transfer");
			header("Content-Disposition: attachment; filename=".$backup['name']);
			header("Content-Type: application/x-tar");
			header("Content-Transfer-Encoding: binary");
			header("Content-Length: ".$file_size);

			$this->readfile_chunked($backup_file);
		}

	}

	public function test_https()
	{
		$params['test_ssl'] = 'yes';
		$test_https = $this->server_communication($params, 'https');

		$return_url = BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings';

		if( !empty($test_https) )
		{
			if( $test_https['ssl_response'] == 'yes' )
			{
				// pass
				$this->EE->functions->redirect($return_url.AMP.'https=pass');
			}
			else
			{
				// fail
				$this->EE->functions->redirect($return_url.AMP.'https=fail');
			}
		}
		else
		{
			// fail
			$this->EE->functions->redirect($return_url.AMP.'https=fail');
		}
	}

	public function backup()
	{
		$params = array('alive' => 'yes');
		$is_alive = $this->server_communication($params);

		if( !empty($is_alive['alive']) )
		{
			// start the backup
			$params = array(
				'backup_now' => 'yes',
				'full' => 'yes'
			);
			$backup = $this->server_communication($params);

			if( empty($backup['error']) )
			{
				$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('backup_running'));
			}
			else
			{
				$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backup_failed'));
			}
		}
		else
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backup_failed'));
		}

		$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index');
	}

	public function backup_local()
	{
		// funciton used to trigger backup inside the CP.
		$request = new Request();
		$request->set_option('CURLOPT_CONNECTTIMEOUT', 2);
		$request->set_option('CURLOPT_TIMEOUT', 2);
		$request->set_option('CURLOPT_SSL_VERIFYPEER', FALSE);
		$request->set_option('CURLOPT_SSL_VERIFYHOST', FALSE);
		$result = $request->get($this->get_cron_url());

		$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('backup_running'));
		$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index');
	}

	private function get_settings()
	{
		// var_dump($this->EE->session);
		if( empty($this->settings) )
		{
			$site_id = $this->EE->config->config['site_id'];

			// retrieve settings from database
			$settings = $this->EE->db->query("SELECT * FROM ".$this->EE->db->dbprefix('safeharbor_settings')." WHERE site_id=$site_id LIMIT 1");
			$settings = $settings->row_array();
			if( empty($settings['storage_path']))
			{
				unset($settings['storage_path']);
			}
			unset($settings['id'], $settings['backup_plan'], $settings['time_saved']);

			// get action_id of trigger url
			$action_id = $this->EE->db->get_where('actions', array('class'=>'Safeharbor', 'method'=>'communicate'), 1);
			$action_id = $action_id->row('action_id');

			$site_index = $this->EE->functions->fetch_site_index(0);
			//config->default_ini->index_page
			// or config -> site_index
			$index = $this->EE->config->item('site_index');
			if( strpos($site_index, $index) === FALSE )
			{
				$site_index .= $this->EE->config->item('site_index');
			}
			// building out trigger url
			$site_index .= QUERY_MARKER.'ACT='.$action_id;

			// get action id of cron url
			$cron_url = $this->get_cron_url();

			// defaults
			$defaults = array(
				'site_id' => $site_id,
				'base_trigger' => $site_index,
				'cron_url' => $cron_url,

				'auth_code' => '',
				'notify_email_address' => '',
				'backup_space' => '1',
				'off_site_backup_auth_code' => '',
				'backup_path' => dirname(dirname(dirname(BASEPATH))),
				'storage_path' => APPPATH.'cache',
				'time_diff' => ($this->EE->localize->set_localized_time() - time())/(60*60),
				'backup_time' => '2,30',
				'transfer_type' => 'http',
				'db_backup' => 'command',
				'disable_remote' => '0',

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

	private function save_settings()
	{
		$action_url = $this->settings['base_trigger'];

		// remove unnecessary settings
		unset($this->settings['base_trigger']);
		unset($this->settings['cron_url']);

		// encrypt amazon s3 and ftp data
		$this->EE->load->library('encrypt');
		$this->EE->encrypt->set_key($this->settings['auth_code']);

		$this->settings['amazon_s3_access_key'] = $this->EE->encrypt->encode($this->settings['amazon_s3_access_key']);
		$this->settings['amazon_s3_secret'] = $this->EE->encrypt->encode($this->settings['amazon_s3_secret']);
		$this->settings['ftp_password'] = $this->EE->encrypt->encode($this->settings['ftp_password']);

		// save settings to local database
		$query_string = $this->EE->db->insert_string('safeharbor_settings', $this->settings);
		$query_string = preg_replace('/^INSERT/', 'REPLACE', $query_string);
		$this->EE->db->query($query_string);

		// save settings to eeharbor
		if( $this->settings['disable_remote'] == 0)
		{
			$params = array('alive' => 'yes');
			$is_alive = $this->server_communication($params);
		}


		if( empty($is_alive['alive']) && $this->settings['disable_remote'] == 0)
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('config_save_remote_failure'));
			$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings');
		}

		if( $this->settings['disable_remote'] == 0)
		{
			$params = array('update_settings' => 'yes', 'action_url' => urlencode($action_url));
			$update_settings = $this->server_communication($params);
		}


		if( empty($update_settings['update_settings']) && $this->settings['disable_remote'] == 0 )
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('config_save_remote_failure'));
			$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings');
		}
		
		if($this->settings['disable_remote'] == 1)
		{
			$this->EE->session->set_flashdata('message_success', $this->EE->lang->line('config_saved_locally'));
			
		}

		return TRUE;
	}

	public function search()
	{
		// load libraries
		$this->EE->load->library('table');

		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('safeharbor_module_name_search'));

		// set navigation
		$this->_set_right_nav();

		$backup_id = $this->EE->input->get('O');
		$ajax_url = BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=query'.AMP.'O='.$backup_id.'';
		$ajax_url=	html_entity_decode($ajax_url);

		// setting the JS stuff needed up
		$this->EE->cp->add_to_head('
		<script type="text/javascript">
			var safeharbor_settings = {
				"site_id": ' . $this->EE->config->item('site_id') . ',
				"xid": "' . XID_SECURE_HASH . '"};
		</script>');

		$this->EE->cp->add_to_head('<script type="text/javascript">
		$(document).ready(function()
			{
			$(".search").keyup(function()
			 // $("#live_search").submit(function()
			{
				// $(".live_search").submit(function() {
				var filesearch = $(this).val();
				var dataString = "qs"+ filesearch;
				if(filesearch!="")
				{
					$.ajax({
						type: "GET",
						url: "'.$ajax_url.'",
						// data: { dataString, "xid": "' . XID_SECURE_HASH . '" },
						data: { qs:filesearch },
						cache: false,
						success: function(html)
						{
							$("#display").html(html).show();
						}
					});
				}
			// });
				return false;
			});

		});
		</script>');

		// check to see if we have the current backup indexed.  If not go ahead and index it.
		$is_indexed = $this->EE->db->query("SELECT id FROM ".$this->EE->db->dbprefix('safeharbor_indexes')." WHERE backup_id=$backup_id LIMIT 1");

		if ($is_indexed->num_rows() > 0)
		{
			// this means the backup has been indexed.
		}
		else
		{
			// backup hasn't been indexed, lets index it and continue
			$this->index_backup($backup_id);
		}

		$this->data['backup_id'] = $this->EE->input->get('O');

		return $this->EE->load->view('search', $this->data, TRUE);
	}

	public function query()
	{
		// will get the DB contents according to the search string input.
		$backup_id = $this->EE->input->get('O');

		if ( $this->EE->input->get_post('qs') )
		{
			$qs = $this->EE->input->get_post('qs');
		}

		$results = $this->get_search_matches($backup_id, $qs, '10');

		if ($results->num_rows() >0)
		{
			echo '<table class="mainTable" cellspacing="0" cellpadding="0" border="0">';
			echo '<thead>';
			echo '<th>'.lang('file_path').'</th>';
			echo '<th>'.lang('file').'</th>';
			echo '<th>'.lang('download').'</th>';
			echo '</thead>';
			echo '<tbody>';

			foreach ($results->result() as $row)
			{
				$file = $this->_format_search_result($row->file);

				$download_url = BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=_download_single_file'.AMP.'O='.$backup_id.''.AMP.'file='.$row->id.'';
				$download_url=	html_entity_decode($download_url);

				echo '<td>'.$file['path'].'</td>';
				echo '<td>'.$file['name'].'</td>';
			    echo '<td><a href="'.$download_url.'">'.lang('download_file').'</a></td>';
				echo '</tr>';
			}

			echo '</tbody>';
			echo '</table>';

			$query_string =  urlencode($qs);
			$view_all = BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=show_search_results'.AMP.'O='.$backup_id.''.AMP.'search='.$query_string.'';

			echo '<div style="float:right;padding-right:5px;"><a href="'.$view_all.'">'.lang('view_all_results').'</a></div>';
		}

		flush();
		ob_flush();
		die();
	}

	public function show_search_results()
	{
		$this->EE->load->library('table');

		$this->EE->cp->set_variable('cp_page_title', $this->EE->lang->line('safeharbor_module_name_search'));

		// set navigation
		$this->_set_right_nav();

		if( !$this->EE->input->get('search') )
		{
			$qs = $this->EE->input->post('search');
		}
		else
		{
			$qs = $this->EE->input->get('search');
		}

		$backup_id = $this->EE->input->get('O');
		$results = $this->get_search_matches($backup_id, $qs);
		if( $results->num_rows() > 0 )
		{
			$i = 0;
			foreach ($results->result() as $row)
			{
				$this->data['results'][$i]['file'] = $this->_format_search_result($row->file);

				$download_url = BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=_download_single_file'.AMP.'O='.$backup_id.''.AMP.'file='.$row->id.'';
				$download_url = html_entity_decode($download_url);
				$this->data['results'][$i]['download_url'] = '<a href="'.$download_url.'">'.lang('download_file').'</a></td>';

				$i++;
			}
		}

		return $this->EE->load->view('search_results', $this->data, TRUE);
	}

	private function _format_search_result($file)
	{
		$file_parts = explode('/', $file);
		$file_parts[0] = str_replace('.', '/', $file_parts[0]);
		$return_data['name'] = array_pop($file_parts);
		$return_data['path'] = implode('/', $file_parts);

		return $return_data;
	}

	public function index_backup($backup_id)
	{
		//execute command here to index backup
		$mod = new Safeharbor ();

		$base_path = $mod->_get_storage_path('base');
		$backup = $this->get_backups('1', array('backup_id' => $backup_id));
		$backup = $backup[0];

		if($backup['status'] != 'current_full')
		{
			$backup_path = $mod->_get_storage_path('old');
		}
		else
		{
			$backup_path = $mod->_get_storage_path('current');
		}
		$full_file_path = $backup_path . $backup['name'];
		if(file_exists($full_file_path))
		{
			if(chdir($backup_path))
			{
				$command = 'tar -ztf '.$backup['name'].'';

			}
		}
		else
		{
			if($backup['status'] != 'current_full')
			{

				$backup_path = $mod->_get_storage_path('default_old');
			}
			else
			{

				$backup_path = $mod->_get_storage_path('default_current');
			}

			if(chdir($backup_path))
			{
				$command = 'tar -ztf '.$backup['name'].'';
			}
			else
			{
				$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('index_failed'));
				$error = TRUE;
			}
		}
		if( empty($error) )
		{
			$files = shell_exec($command);

			// switching to an array
			$files = explode("\n", $files);
			$i=0;
			foreach( $files as $key => $file )
			{
				$this->EE->db->set(array('backup_id' => $backup_id, 'file' => $file));
				$this->EE->db->insert('safeharbor_indexes');
			}
		}

	}

	public function _download_single_file()
	{
		// we get the id of the backup and the id of the indexed file
		$mod = new Safeharbor ();

		$backup_id = $this->EE->input->get('O');
		$file_id = $this->EE->input->get('file');
		$file = $this->get_indexed_file_name($file_id);

		$base_path = $mod->_get_storage_path('base');

		$backup = $this->get_backups('1', array('backup_id' => $backup_id));
		$backup = $backup[0];

		if($backup['status'] != 'current_full')
		{
			$backup_path = $mod->_get_storage_path('old');
		}
		else
		{
			$backup_path = $mod->_get_storage_path('current');
		}


		if(chdir($backup_path))
		{
			if( file_exists($backup['name']) AND is_file($backup['name']) )
			{
			}
			else
			{
				$wrong_dir = 1;
				$edata .= $wrong_dir;
			}
		}
		if(!empty($wrong_dir) )
		{
			if($backup['status'] != 'current_full')
			{
				$backup_path = $mod->_get_storage_path('default_old');
			}
			else
			{
				$backup_path = $mod->_get_storage_path('default_current');
			}

			if(chdir($backup_path))
			{
			}
			else
			{
				$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('download_failed'));
				$error = TRUE;
			}
		}

		if( empty($error) )
		{

			$backup_temporary_dir = $backup_path . 'temporary/';

			mkdir($backup_temporary_dir);

			$command = 'tar -xvf '.$backup['name'].' -C '.$backup_temporary_dir.' '.$file.'';
			$ouput = exec( $command );

			$file_name = $this->_format_search_result($file);
			$file_size = filesize($backup_temporary_dir.$file);

			// send file download to user
			header("Cache-Control: public");
			header("Content-Description: File Transfer");
			header("Content-Disposition: attachment; filename=".$file_name['name']."");
			header("Content-Type: application/x-tar");
			header("Content-Transfer-Encoding: binary");
			header("Content-Length: ".$file_size);

			$this->readfile_chunked($backup_temporary_dir.$file);
			$this->_remove_temp_files($backup_temporary_dir);
			@unlink($backup_temporary_dir.$file);



			die();
		}


	}

	public function get_indexed_file_name($file_id)
	{
		//funciton will return the name of a given file based on the file_id passed in
		$this->EE->db->select('file');

		$this->EE->db->where(array('id' => $file_id));
		$this->EE->db->limit(1);
		$results = $this->EE->db->get('safeharbor_indexes');
		$result = $results->result_array();
		$result = $result[0];
		return $result['file'];

	}

	private function get_search_matches($backup_id, $qs, $limit = 1000)
	{
		$this->EE->db->select('file, id');
		$this->EE->db->where(array('backup_id' => $backup_id));
		$this->EE->db->like('file', $qs);
		$this->EE->db->limit($limit);
		$results = $this->EE->db->get('safeharbor_indexes');

		return $results;
	}


	private function _remove_temp_files($path)
	{
		$return_data = 0;

		if( is_dir($path) )
		{
			chdir($path);
			$contents = scandir($path);
			if( count($contents) > 2 )
			{
				foreach($contents as $key => $file)
				{
					if( $file != '..' && $file != '.')
					{

						if( is_file($file) )
						{
							unlink($file);
							$return_data = 1;
						}
						elseif( is_dir($file))
						{

							if( $this->_remove_temp_files($path.$file."/") )
							{
								$return_data = 1;
							}
							else
							{
								$return_data = 0;
							}
						}

					}
				}
				$this->_remove_temp_files($path);
			}
			else
			{
				// this means we have an empty directoy, we can go ahead delete it
				rmdir($path);
				$return_data = 1;
			}
		}
		return $return_data;
	}

	public function get_backups( $limit=NULL, $where=NULL )
	{
		// current code gets all backups from the DB
		$site_id = $this->EE->config->config['site_id'];

		$this->EE->db->order_by('backup_id', 'desc');
		$this->EE->db->where(array('site_id'=>$site_id));
		$this->EE->db->where_not_in('status', array('current_db_only', 'Unk Error'));
		if( !empty($where))
		{
			$backups = $this->EE->db->where($where);
		}
		$this->EE->db->limit($limit);
		$backups = $this->EE->db->get('safeharbor_backups');

		return $backups->result_array();
	}
	
	private function sync_backups_db()
	{
		$mod = new Safeharbor();

		// $backup_path = $mod->_get_storage_path('base');
		// get path  were going to start with the current path

		// dont really want to run all of these each time.  But we will to account for a changed directory location
		$backup_path['current'] = $mod->_get_storage_path('current');
		$backup_path['default_current'] = $mod->_get_storage_path('default_current');
		$backup_path['old'] = $mod->_get_storage_path('old');
		$backup_path['default_old'] = $mod->_get_storage_path('default_old');
		if( $backup_path['current'] == $backup_path['default_current'] )
		{
			unset($backup_path['default_current']);
		}
		if( $backup_path['old']  == $backup_path['default_old'])
		{
			unset($backup_path['default_old']);
		}
		
		$this->manage_backup_files($backup_path);

	}
	
	// this function takes an array of paths to check 
	private function manage_backup_files($paths)
	{
		$this->EE->load->helper('file');
		$prefx = $this->EE->db->dbprefix;
		
		// were going to go ahead and check too many backups being in the current backup folder
		
		foreach($paths as $type => $path)
		{
			$files[$type] = get_filenames($path);
			
			if(( $type == 'current' || $type == 'default_current' )&& !empty($files[$type]) && count($files) > 1)
			{
				// we have more then 1 file in the current backups folder we need to go ahead and move the others over to the old_backups folder
				// then remove it from the current list
				$results = $this->EE->db->get_where('safeharbor_backups', array('status' => 'current_full'));
				
				if( $results->num_rows() > 0 )
				{
					//this means we have our current backup, this is the one that gets to stay...the rest we will move.
					foreach($results as $row)
					{
						foreach($files[$type] as $key => $file_name)
						{
							if($row['name'] != $file_name)
							{
								if( @rename($path.$file_name, $paths['current_old'].$file_name) )
								{
									unset($files[$type][$key]);
								}
								else
								{
									// theres been an error... should send email.
								}
								
							}
						}
					}
				}
				
			
			}
			
			if( !empty($files[$type]) )
			{
				foreach( $files[$type] as $id => $name)
				{
					$files_quoted_for_query[] = '"'.$name.'"';
				}

				$query_file_names = implode(',', $files_quoted_for_query);

				$site_id = $this->EE->config->config['site_id'];

				$sql = 'SELECT * FROM '.$prefx.'safeharbor_backups WHERE site_id = '.$site_id.' AND name IN('.$query_file_names.')';
				$backup_data = $this->EE->db->query($sql);

				if($backup_data->num_rows() > 0 )
				{
					$backup_data = $backup_data->result_array();

					foreach($backup_data as $key => $row)
					{
						$names[] = $row['name'];
						
						if($row['status'] == 'current_db_only' || $row['status'] == 'archived')
						{
							// doing a little global clean up here
							
							$ext = substr($row['name'], -4, 4);

							// cleaning up any remaining .sql files.  These get left behind if theres permissinons errors, or site errors while running a bacup
							if( $ext == '.sql' )
							{
								$current = time();
								$diff = $current - $row['start_time'];

								// 7200 = seconds in 2 hours
								// this means that the DB has been sitting around for over 2 hours. 
								// This represents a dead backup process.  We can go ahead and delete this DB
								if($diff > 7200)
								{
									$this->_remove_backup($path.$row['name'], $row['backup_id']);
								}	
							}
							elseif($ext == '.tgz')
							{
								// this is the backup type we expect
								if( $row['status'] == 'Purged' )
								{
									$this->_remove_backup($path.$row['name'], $row['backup_id']);
								}
							}
						}

					}
				}
					//end foreach
			}
					
		}

		// Putting the current file backups file name in to variable. to compare below.  Sometimes when a backup completes REALLY fast, we find the .tgz file before the db is updated
		// and delete it, so were going to run a check against it
		if( empty($mod) )
		{
			$mod = new Safeharbor();
		}
		$current_backup_name = $mod->get_current_backup_file();
		$current_backup_parts = explode(".", $current_backup_name);

		//put all files into a single list to check if we hae any extra files in the directories
		foreach( $files as $key => $file_list)
		{
			$files_still_on_server = array_diff($file_list, $names);
			if( !empty($files_still_on_server) )
			{
				if( empty($mod) )
				{
					$mod = new Safeharbor();
				}

				$path_to_delete = $mod->_get_storage_path($key);

				foreach( $files_still_on_server as $id => $file)
				{
					$file_name = explode('.', $file);

					if($file_name[0] != $current_backup_parts[0])
					{
						$this->_remove_backup($path_to_delete.$file);
					}

				}
			}
			
			foreach($file_list as $name)
			{
				$all_files[] = $name;
			}
		}

		//run check on all files that are marked as not purged
		$results = $this->EE->db->get_where('safeharbor_backups', array('status' => 'archived'));

		if( $results->num_rows() > 0 )
		{
			$results = $results->result_array();

			foreach( $results as $key => $backup )
			{
				// if the files aren't on the server mark them as perged

				if( !in_array($backup['name'], $all_files) )
				{
					$this->EE->db->delete('safeharbor_backups', array('backup_id' => $backup['backup_id']));
					$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $backup['backup_id']));

				}
			}
		}
		
		//run check to see if we have differentials left over from a full that's been deleted
		// eventually we can refactor this section of the method as a whole to work from 1 query on the DB that gets updated to reflect the changes in the DB
		// for now we'll go ahead and query the DB to get the *updated* data
		
		if( empty($mod) )
		{
			$mod = new Safeharbor();
		}

		$this->EE->db->select('sb.*, sb2.status AS full_status');
		$this->EE->db->from('safeharbor_backups as sb');
		$this->EE->db->join('safeharbor_backups AS sb2', 'sb.full_backup_id = sb2.backup_id', 'inner');
		$this->EE->db->where(array(
				'sb.status' => 'archived',
				'sb.backup_type' => 'differential',
			));
		$this->EE->db->or_where(array('sb.status' => 'current_full'));
		$this->EE->db->where('sb.full_backup_id !=', '');
		$this->EE->db->order_by('sb.start_time', 'ASC');

		$differentials = $this->EE->db->get();

		if( $differentials->num_rows() > 0 )
		{
			$differentials = $differentials->result_array();
			foreach($differentials as $key => $diff)
			{
				if($diff['status'] == 'current_full')
				{
					$path_to_delete = $mod->_get_storage_path('current');
				}
				else
				{
					$path_to_delete = $mod->_get_storage_path('old');
				}
				
				if( $diff['full_status'] == 'Purged')
				{
					if($this->_remove_backup($path_to_delete.$diff['name']))
					{
						$data = array('status' => 'Purged');
						$this->EE->db->where('name', $diff['name']);
						$this->EE->db->update('safeharbor_backups', $data);
					}
				}
			}
		}
	}
	
	private function _remove_backup($file, $backup_id = '')
	{
		if( empty($mod) )
		{
			$mod = new Safeharbor();
		}

		if($mod->remove_backup_file($file))
		{
			//now we need to remove the entry from the db. if we have a backup_id
			if(!empty($backup_id))
			{
				$this->EE->db->delete('safeharbor_backups', array('backup_id' => $backup_id));
				// remove cache
				$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $row->backup_id));
			}
			
			return TRUE;
		}
		else
		{
			//theres been an error... Send email here.
			return FALSE;
		}
	}
	
	public function get_remote_backup_link( $backup )
	{
		if( !empty($backup['backup_transfer_failed']) ) { return FALSE; }

		$params = array(
			'ac' => $this->settings['auth_code'],
			'get_backup' => 'yes',
			'backup_name' => str_replace('.tgz', '', $backup['name'])
		);

		$communication_url = $this->get_communication_url().'&'.http_build_query($params);

		return '<a class="submit" href="'.$communication_url.'">'.lang('download_remote').'</a>';
	}

	public function get_amazon_s3_backup_link( $backup )
	{
		if( empty($backup['transferred_amazon_s3']) ) { return FALSE; }

		$bucket = 'safeharbor-' . $this->settings['auth_code'];
		$backup_file = $backup['name'];

		$S3 = new S3($this->settings['amazon_s3_access_key'], $this->settings['amazon_s3_secret']);
		$link = $S3->get_object_url($bucket, $backup_file);

		// cleanup
		$S3 = NULL;
		unset($S3);

		return '<a class="submit" href="'.$link.'">'.lang('download_amazon_s3').'</a>';
	}

	public function get_local_backup_link( $backup )
	{
		return '<a class="submit" href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=download'.AMP.'O='.$backup['backup_id'].'">'.lang('download_local').'</a>';
	}

	public function server_communication( $vars=array(), $mode='http' )
	{
		// default return value
		$result = FALSE;

		if( !empty($vars) && $this->settings['disable_remote'] == 0 )
		{
			// add auth_code to variables past
			$vars['ac'] = $this->settings['auth_code'];

			// check if https mode is https
			if( $mode == 'https' )
			{
				$this->settings['transfer_type'] = 'https';
			}

			$request = new Request();
			$request->set_option('CURLOPT_CONNECTTIMEOUT', 5);
			// To fix JR's busted code
			$request->set_option('CURLOPT_TIMEOUT', 5);
			$request->set_option('CURLOPT_SSL_VERIFYPEER', FALSE);
			$request->set_option('CURLOPT_SSL_VERIFYHOST', FALSE);
			$result = $request->get($this->get_communication_url(), $vars);

			if( !empty($result) )
			{
				$result = $this->data_decode($result);
			}
		}

		return $result;
	}

	private function get_communication_url()
	{
		if( $this->settings['transfer_type'] == 'https' )
		{
			$prefix = 'https://';
		}
		else
		{
			$prefix = 'http://';
		}

		return $prefix.$this->servers[0];
	}

	private function data_decode( $data )
	{
		$data = @unserialize(base64_decode($data));

		if( !is_array($data) )
		{
			return FALSE;
		}
		else
		{
			return $data;
		}
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

	function create_dir_structure($backups_directory = '', $install = '')
	{
		if( empty($backups_directory) )
		{
			$backups_directory = APPPATH.'cache/';
		}
		$backups_directory .= 'safeharbor_backups/';
		@mkdir($backups_directory);

		$current_backup_directory = $backups_directory.'current_backup/';
		@mkdir($current_backup_directory);

		$old_backups_directory = $backups_directory.'old_backups/';
		@mkdir($old_backups_directory);

		$htaccess = $backups_directory.'.htaccess';
		$written = @file_put_contents($htaccess, 'deny from all');
		if( empty($written) && $install == 1 )
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backup_path_not_writable_install'));
		}
		elseif( empty($written))
		{
			$this->EE->session->set_flashdata('message_failure', $this->EE->lang->line('backup_path_not_writable'));
		}

	}

	private function get_cron_url()
	{
		// building out trigger url
		
		// get action id of cron url
		$cron_action_id = $this->EE->db->get_where('actions', array('class'=>'Safeharbor', 'method'=>'_backup_cron'), 1);
		$cron_action_id = $cron_action_id->row('action_id');
		$cron_url = $this->EE->functions->fetch_site_index(0);

		$index = $this->EE->config->item('site_index');
		if( strpos($cron_url, $index) === FALSE )
		{
			$cron_url .= $this->EE->config->item('site_index');
		}

		// building out trigger url
		$cron_url .= QUERY_MARKER.'ACT='.$cron_action_id;

		return $cron_url;
	}

	// set right nav
	private function _set_right_nav()
	{
		// set navigation
		if( $this->settings['disable_remote'] == 0)
		{
			$this->EE->cp->set_right_nav(array(
			'home'				=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index',
			'settings'			=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings',
			'backup_full_now'	=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=backup'
			));
		}
		else
		{
			$this->EE->cp->set_right_nav(array(
			'home'				=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index',
			'settings'			=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings',
			'backup_now'	=> BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=backup_local'
			));
		}


	}
}

/* End of File: mcp.safeharbor.php */
