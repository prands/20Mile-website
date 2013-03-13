<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property CI_Controller $EE
 */
class Profile_ext
{
	public $settings = array();
	public $name = 'Profile:Edit';
	public $version;
	public $description = 'Facilitates the use of channel entries as member profiles using SafeCracker.';
	public $settings_exist = 'y';
	public $docs_url = 'http://mightybigrobot.com/docs/profile_edit';
	public $required_by = array('module');

	private $errors = array();
	private $message;
	
	protected $EE;

	/**
	 * Extension_ext
	 *
	 * @access	public
	 * @param	mixed $settings = ''
	 * @return	void
	 */
	public function __construct($settings = '')
	{
		$this->EE =& get_instance();
		
		include PATH_THIRD.'profile/config.php';
		
		$this->version = $config['version'];
		
		if ( ! in_array(PATH_THIRD.'profile/', $this->EE->load->get_package_paths()))
		{
			$this->EE->load->add_package_path(PATH_THIRD.'profile/');
		}
		
		$this->EE->load->model('profile_model');
		
		$this->EE->profile_model->set_settings($settings);
	}

	/**
	 * activate_extension
	 *
	 * @access	public
	 * @return	void
	 */
	public function activate_extension()
	{
		return TRUE;
	}

	/**
	 * update_extension
	 *
	 * @access	public
	 * @param	mixed $current = ''
	 * @return	void
	 */
	public function update_extension($current = '')
	{
		if ($current == '' || $current == $this->version)
		{
			return FALSE;
		}
		
		return TRUE;
	}

	/**
	 * disable_extension
	 *
	 * @access	public
	 * @return	void
	 */
	public function disable_extension()
	{
		return TRUE;
	}
	
	public function settings_form()
	{
		$this->EE->functions->redirect(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=profile');
	}

	public function safecracker_submit_entry_start(&$safecracker)
	{
		if ($this->EE->profile_model->errors())
		{
			//they're already going to error out, no need to trigger the no title error.
			if ( ! $this->EE->input->post('title'))
			{
				$_POST['title'] = uniqid(md5(rand()), TRUE);
			}
			
			foreach ($this->EE->profile_model->errors() as $key => $value)
			{
				if (is_numeric($key))
				{
					$safecracker->errors[] = $value;
				}
				else
				{
					$safecracker->field_errors[$key] = $value;
				}
			}
		}
	}
	
	public function safecracker_submit_entry_end(&$safecracker)
	{
		$validated = ( ! $safecracker->errors && ! $safecracker->field_errors);
		
		if ($this->is_register())
		{
			if (isset($this->EE->session->cache['profile']['member_id']))
			{
				if ($validated)
				{
					//set in member member register
					//the reason this is here and not there is we only want to send the activation email
					//after we confirm that the safecracker/profile portion of the registration passes validation
					if (isset($this->EE->session->cache['profile']['send_email']))
					{
						$variables = $data = $this->EE->session->cache['profile']['send_email'];
						
						$variables['name'] = $data['screen_name'];
						
						$action_params = array(
							'authcode' => $data['authcode'],
							'return' => $this->EE->input->post('activation_return') ? $this->EE->input->post('activation_return') : '',
						);
						
						if ($this->EE->input->post('mailinglist_subscribe') &&
						    $this->EE->db->where('list_id', $this->EE->input->post('mailinglist_subscribe'))->count_all_results('mailing_lists') === 1 &&
						    $this->EE->db->where(array('list_id' => $this->EE->input->post('mailinglist_subscribe'), 'email' => $data['email']))->count_all_results('mailing_list') === 0
						   )
						{
							$action_params['mailinglist'] = $this->EE->input->post('mailinglist_subscribe');
						}
						
						if ($this->EE->input->post('GID') && $this->EE->session->userdata('can_admin_mbr_groups') === 'y')
						{
							$this->EE->load->helper('security');
							
							$group_id = xss_clean($this->EE->safecracker->decrypt_input($this->EE->input->post('GID')));
							
							//validate group_id
							if ($this->EE->profile_model->validate_group_id($group_id))
							{
								$action_params['g'] = $this->EE->input->post('GID');
							}
						}
						
						$variables['activation_url'] = $this->EE->profile_model->build_action_url('activation', $action_params);
						
						$this->EE->profile_model->send_email($data['email'], 'mbr_activation_instructions', $variables);
						
					}
				}
				else
				{
					$this->EE->profile_model->cancel_registration($this->EE->session->cache['profile']['member_id'], $this->EE->session->cache['profile']['entry_id']);
					
					if ( ! isset($this->EE->session->cache['profile']['admin_register']))
					{
						$this->EE->session->destroy();
					}
				}
			}
			
			//update the author id; when using self activation or manual activiation by admin
			if (isset($this->EE->session->cache['profile']['member_id']) && $this->EE->config->item('req_mbr_activation') !== 'none')
			{
				$this->EE->db->update('channel_titles', array('author_id' => $this->EE->session->cache['profile']['member_id']), array('entry_id' => $this->EE->session->cache['profile']['entry_id']));
			}
		}
		
		if ($this->is_edit())
		{
			if ( ! empty($this->EE->session->cache['profile']['update_member']))
			{
				$this->EE->profile_model->update_member($this->EE->session->cache['profile']['member_id'], $this->EE->session->cache['profile']['update_member']);
			}
		}
		
		//on register and edit profile
		if ($this->is_profile())
		{
			$member_id = (isset($this->EE->session->cache['profile']['member_id'])) ? $this->EE->session->cache['profile']['member_id'] : $this->EE->session->userdata('member_id');
			
			if ($member_id && $validated)
			{
				$this->EE->profile_model->update_native_profile($member_id, $_POST, TRUE);
			}
			
			if (isset($this->EE->session->cache['profile']['userdata']))
			{
				foreach (array('can_assign_post_authors', 'can_edit_other_entries') as $key)
				{
					if (isset($this->EE->session->cache['profile']['userdata'][$key]))
					{
						$this->EE->session->userdata[$key] = $this->EE->session->cache['profile']['userdata'][$key];
					}
				}
			}
		}
		
		//@TODO update native fields
		
		//@TODO
		//i wanted to pass error handling to form_builder because it does some stuff better, and also for consistency's sake
		//but it's not to feasible
		//will try to get some changes into safecracker to make it's inline errors/json more betterer
		return;
		
		/*
		if (
			//only proceed if this is a profile edit/register submission
			! isset($this->EE->session->cache['profile']['submit_entry']) ||
			//only proceed if there are errors to handle
			( ! $safecracker->errors && ! $safecracker->field_errors) ||
			//only proceed if we're doing json or inline errors
			($safecracker->error_handling !== 'inline' && ! $safecracker->json)
		)
		{
			return;
		}
		
		if (is_array($safecracker->errors))
		{
			//add the field name to custom_field_empty errors
			foreach ($safecracker->errors as $field_name => $error)
			{
				if ($error == $this->EE->lang->line('custom_field_empty'))
				{
					$safecracker->errors[$field_name] = $error.' '.$field_name;
				}
			}
		}
		
		if ( ! $safecracker->json && $safecracker->error_handling == 'inline')
		{
			$safecracker->entry = $_POST;
			
			$safecracker->form_error = TRUE;
			
			foreach($safecracker->post_error_callbacks as $field_type => $callbacks)
			{
				$callbacks = explode('|', $callbacks);
				
				foreach ($safecracker->custom_fields as $field)
				{
					if ($field['field_type'] == $field_type)
					{
						foreach ($callbacks as $callback)
						{
							if (in_array($callback, $safecracker->valid_callbacks))
							{
								$safecracker->entry[$field['field_name']] = $safecracker->entry['field_id_'.$field['field_id']] = call_user_func($callback, $safecracker->entry($field['field_name']));
							}
						}
					}
				}
			}
			
			foreach ($safecracker->date_fields as $field)
			{
				if ($safecracker->entry($field) && ! is_numeric($safecracker->entry($field)))
				{
					$safecracker->entry[$field] = $this->EE->localize->convert_human_date_to_gmt($safecracker->entry($field));
				}
			}
			
			if (version_compare(APP_VER, '2.1.3', '>'))
			{
				$this->EE->core->generate_page();
			}
			else
			{
				$this->EE->core->_generate_page();
			}
			
			return;
		}
		
		if ($safecracker->json)
		{
			return $safecracker->send_ajax_response(
				//$this->EE->javascript->generate_json(
					array(
						'success' => (empty($safecracker->errors) && empty($safecracker->field_errors)) ? 1 : 0,
						'errors' => (empty($safecracker->errors)) ? array() : $safecracker->errors,
						'field_errors' => (empty($safecracker->field_errors)) ? array() : $safecracker->field_errors,
						'entry_id' => $safecracker->entry('entry_id'),
						'url_title' => $safecracker->entry('url_title'),
						'channel_id' => $safecracker->entry('channel_id'),
					)
				//)
			);
		}
		*/
	}
	
	/**
	 * Changes the entry_form action
	 * 
	 * @return Type    Description
	 */
	public function safecracker_entry_form_tagdata_start($tagdata, &$safecracker)
	{
		if ($this->EE->extensions->last_call !== FALSE)
		{
			$tagdata = $this->EE->extensions->last_call;
		}
		
		if (isset($this->EE->session->cache['profile']['form_hidden']))
		{
			$safecracker->form_hidden($this->EE->session->cache['profile']['form_hidden']);
			
			unset($this->EE->session->cache['profile']['form_hidden']);
		}
		
		if ($this->is_edit())
		{
			//parse native member data for this entry
			$tagdata = $this->EE->TMPL->parse_variables_row($tagdata, $this->EE->profile_model->get_member_data($safecracker->entry('author_id')));
		}
		
		return $tagdata;
	}

	/**
	 * Hook into entry_submission_start
	 *
	 * This is used to show an error if the user is trying to create a new entry
	 * in the member channel when they already have an entry in that channel
	 * 
	 * @param string|int $channel_id
	 * @param bool $autosave
	 * 
	 * @return void
	 */
	public function entry_submission_start($channel_id, $autosave)
	{
		if ($autosave || $this->EE->input->get_post('entry_id'))
		{
			return;
		}

		if ($channel_id == $this->EE->profile_model->channel_id()//ignore if not the profile channel
		    && ($this->EE->profile_model->oldest_superadmin() != $this->EE->session->userdata('member_id'))//this means we're using the logged_out_member_id parameter
		    && ! $this->EE->profile_model->settings('allow_multiple_profiles')
		    && $this->EE->profile_model->member_has_entry())
		{
			$this->EE->lang->loadfile('profile', 'profile');

			$this->EE->output->show_user_error('submission', lang('one_entry_per_member'));
		}
	}

	/**
	 * Hook into member_member_register
	 *
	 * Creates an entry in the member channel for the new registrant,
	 * Saves entry_id and member_id to cache
	 * 
	 * @param array $data      the submitted member data
	 * @param string|int $member_id the nely created member_id
	 * 
	 * @return void
	 */
	public function member_member_register($data, $member_id)
	{
		if ( ! $this->EE->profile_model->channel_id())
		{
			return;
		}
		
		$entry_id = $this->EE->profile_model->create_profile($data, $member_id, isset($this->EE->session->cache['profile']['oldest_superadmin']));
		
		if ($this->is_register())
		{
			//we don't want the member module to log them into the new account if they're already logged in
			if ($this->EE->session->userdata('member_id') && $this->EE->config->item('req_mbr_activation') === 'none')
			{
				$this->EE->extensions->end_script = TRUE;
			}
			
			if ($this->EE->config->item('req_mbr_activation') === 'email')
			{
				$this->EE->session->cache['profile']['send_email'] = $data;
				
				$this->EE->extensions->end_script = TRUE;
			}
		
			if ( ! $this->is_admin_register())
			{
				$this->EE->load->model('member_model');
		
				$query = $this->EE->member_model->get_member_groups(array('can_assign_post_authors', 'can_edit_other_entries'), array('group_id' => $data['group_id']));
		
				if ($query->num_rows() > 0)
				{
					$this->EE->session->userdata['can_assign_post_authors'] = $query->row('can_assign_post_authors');
		
					$this->EE->session->userdata['can_edit_other_entries'] = $query->row('can_edit_other_entries');
				}
				
				$query->free_result();
		
				$this->EE->session->userdata['group_id'] = $data['group_id'];
			}
			else
			{
				//if they have sufficient privilege to make it this far, ie. to register a user
				//we'll ignore these prefs momentarily until after the profile entry is edited in safecracker_submit_entry_end
				$this->EE->session->cache['profile']['userdata'] = array(
					'can_assign_post_authors' => $this->EE->session->userdata('can_assign_post_authors'),
					'can_edit_other_entries' => $this->EE->session->userdata('cann_edit_other_entries'),
				);
				
				$this->EE->session->userdata['can_edit_other_entries'] = $this->EE->session->userdata['can_assign_post_authors'] = 'y';
			}
		
			$this->EE->session->cache['profile']['member_id'] = $member_id;
	
			$this->EE->session->cache['profile']['entry_id'] = $entry_id;
		}
	}
	
	public function cp_members_member_create($member_id, $data)
	{
		if ( ! $this->EE->profile_model->channel_id())
		{
			return;
		}
		
		$entry_id = $this->EE->profile_model->create_profile($data, $member_id);
		
		$this->EE->stats->update_member_stats();
		
		$this->EE->session->set_flashdata(array(
			'message_success' => lang('new_member_added').NBS.'<b>'.stripslashes($data['username']).'</b>',
		));
		
		$this->EE->functions->redirect(BASE.AMP.'C=content_publish'.AMP.'M=entry_form'.AMP.'channel_id='.$this->EE->profile_model->channel_id().AMP.'entry_id='.$entry_id);
	}
	
	//this is inactive and doesn't work--b/c by the time the hook is called, the entry's author has been changed to the "heir"
	public function cp_members_member_delete_end($member_ids = array())
	{
		if ( ! $this->EE->profile_model->settings('delete_profiles_when_deleting_members'))
		{
			return;
		}
		
		if (version_compare(APP_VER, '2.5', '<'))
		{
			$member_ids = (is_array($this->EE->input->post('delete'))) ? $this->EE->input->post('delete') : array();
		}
		
		$entry_ids = array();
		
		foreach ($member_ids as $member_id)
		{
			$entry_ids = array_merge($entry_ids, $this->EE->profile_model->get_all_profile_ids($member_id));
		}
		
		if ($entry_ids)
		{
			$this->EE->load->library('api');
			
			$this->EE->api->instantiate('channel_entries');
			
			$this->EE->api_channel_entries->delete_entry($entry_ids);
		}
	}
	
	//for legacy purposes
	public function cp_menu_array($menu)
	{
		return ($this->EE->extensions->last_call !== FALSE) ? $this->EE->extensions->last_call : $menu;
	}
	
	public function template_fetch_template($row)
	{
		$profile_data = $this->EE->profile_model->get_profile_data($this->EE->session->userdata('member_id'));
		
		if ( ! $profile_data)
		{
			return;
		}
		
		if (strpos($row['template_data'], '{profile:') !== FALSE)
		{
			$this->EE->load->library('api');
			
			$this->EE->load->library('typography');
		
			$this->EE->load->helper('custom_field');
			
			$this->EE->api->instantiate('channel_fields');
			
			foreach ($this->EE->profile_model->get_custom_fields() as $field)
			{
				if ( ! isset($this->EE->api_channel_fields->settings[$field['field_id']]))
				{
					if ( ! $settings = @unserialize(base64_decode($field['field_settings'])))
					{
						$settings = array();
					}
					
					$this->EE->api_channel_fields->set_settings(
						$field['field_id'],
						array_merge(
							$field,
							$settings
						)
					);
				}
			}
			
			$tags = array();
			
			//var pair
			if (preg_match_all('/{profile:(.+?)([\s\t\r\n].*?)?}(.*?){\/profile:\\1}/ms', $row['template_data'], $matches))
			{
				foreach ($matches[0] as $i => $full_match)
				{
					$params = ($matches[2][$i]) ? $this->EE->functions->assign_parameters($matches[2][$i]) : array();
					
					$field_name = $matches[1][$i];
					
					$method = 'replace_tag';
					
					$tagdata = $matches[3][$i];
					
					if (strpos($field_name, ':') !== FALSE)
					{
						$parts = explode(':', $field_name);
						
						$field_name = array_shift($parts);
						
						$method = 'replace_'.array_shift($parts);
						
						unset($parts);
					}
					
					$key = substr($full_match, 1, -1);
					
					$tags[] = array(
						'key' => $key,
						'params' => $params,
						'field_name' => $field_name,
						'method' => $method,
						'tagdata' => $tagdata,
					);
					
					$row['template_data'] = str_replace($full_match, '', $row['template_data']);
				}
			}
			
			if (preg_match_all('/{profile:(.+?)([\s\t\r\n].*?)?}/ms', $row['template_data'], $matches))
			{
				foreach ($matches[0] as $i => $full_match)
				{
					$params = ($matches[2][$i]) ? $this->EE->functions->assign_parameters($matches[2][$i]) : array();
					
					$field_name = $matches[1][$i];
					
					$method = 'replace_tag';
					
					if (strpos($field_name, ':') !== FALSE)
					{
						$parts = explode(':', $field_name);
						
						$field_name = array_shift($parts);
						
						$method = 'replace_'.array_shift($parts);
						
						unset($parts);
					}
					
					$key = substr($full_match, 1, -1);
					
					$tags[] = array(
						'key' => $key,
						'params' => $params,
						'field_name' => $field_name,
						'method' => $method,
						'tagdata' => '',
					);
				}
			}
			
			foreach ($tags as $tag)
			{
				extract($tag);
				
				if (isset($params['parse']) && $params['parse'] === 'late')
				{
					if ( ! isset($this->EE->session->cache['late_variables']))
					{
						$this->EE->session->cache['late_variables'] = array();
					}
					
					$data_store =& $this->EE->session->cache['late_variables'];
				}
				else
				{
					$data_store =& $this->EE->config->_global_vars;
				}
				
				$field_id = $this->EE->profile_model->get_field_id($field_name);
				
				if ($field_id && ! isset($profile_data['field_id_'.$field_id]))
				{
					$data_store[$key] = '';
				}
				else if ( ! $field_id)
				{
					$data_store[$key] = isset($profile_data[$field_name]) ? $profile_data[$field_name] : '';
					
					if ($data_store[$key] && in_array($field_name, array('entry_date', 'expiration_date', 'comment_expiration_date')) && isset($params['format']))
					{
						$data_store[$key] = $this->EE->localize->decode_date($params['format'], $data_store[$key]); 
					}
				}
				else if ($this->EE->api_channel_fields->setup_handler($field_id))
				{
					$this->EE->api_channel_fields->apply('_init', array(array('row' => $profile_data)));
					
					$var_data = $this->EE->api_channel_fields->apply('pre_process', array($profile_data['field_id_'.$field_id]));
					
					$data_store[$key] = $this->EE->api_channel_fields->apply($method, array($var_data, $params, $tagdata));
				}
				else
				{
					$data_store[$key] = $profile_data['field_id_'.$field_id];
				}
			}
		}
	}
	
	public function template_post_parse($template, $sub, $site_id)
	{
		if ($this->EE->extensions->last_call !== FALSE)
		{
			$template = $this->EE->extensions->last_call;
		}
		
		if ($sub || empty($this->EE->session->cache['late_variables']))
		{
			return $template;
		}
		
		return $this->EE->TMPL->parse_variables_row($template, $this->EE->session->cache['late_variables']);
	}
	
	public function publish_form_entry_data($row)
	{
		if ($this->EE->input->get('channel_id') && $this->EE->input->get('channel_id') == $this->EE->profile_model->channel_id() && isset($row['author_id']))
		{
			$this->EE->lang->loadfile('profile', 'profile');
			
			$this->EE->cp->set_right_nav(array(
				'back_to_member_settings' => BASE.AMP.'C=myaccount'.AMP.'id='.$row['author_id'],
			));
		}
		
		return ($this->EE->extensions->last_call !== FALSE) ? $this->EE->extensions->last_call : $row;
	}
	
	private function is_admin_register()
	{
		return isset($this->EE->session->cache['profile']['admin_register']);
	}
	
	//set in register_action
	private function is_register()
	{
		return isset($this->EE->session->cache['profile']['register']);
	}
	
	//set in edit_action
	private function is_edit()
	{
		return isset($this->EE->session->cache['profile']['edit']);
	}
	
	private function is_profile()
	{
		return $this->is_register() || $this->is_edit();
	}
	
	private function check_page($controller, $method = FALSE, $more = array())
	{
		if ($this->get('C') !== $controller)
		{
			return FALSE;
		}
		
		if ($method && $this->get('M') !== $method)
		{
			return FALSE;
		}
		
		foreach ($more as $key => $value)
		{
			if ($this->get($key) !== $value)
			{
				return FALSE;
			}
		}
		
		return TRUE;
	}
	
	private function get($key = FALSE)
	{
		static $get;
		
		//get $_GET from the referring page
		if (is_null($get))
		{
			parse_str(parse_url(@$_SERVER['HTTP_REFERER'], PHP_URL_QUERY), $get);
		}
		
		if ($key === FALSE)
		{
			return $get;
		}
		
		$this->EE->load->helper('array');
		
		return element($key, $get);
	}
	
	public function entry_submission_redirect($entry_id, $meta, $data, $cp_call, $redirect)
	{
		if ($this->EE->extensions->last_call !== FALSE)
		{
			$redirect = $this->EE->extensions->last_call;
		}
		
		if ($cp_call && $channel_id = $this->EE->profile_model->channel_id())
		{
			if ($channel_id == $data['channel_id'])
			{
				$redirect = BASE.AMP.'C=content_publish'.AMP.'M=entry_form'.AMP.'channel_id='.$data['channel_id'].AMP.'entry_id='.$entry_id;
				
				if ($this->get('filter'))
				{
					$redirect .= AMP.'filter='.$this->get('filter');
				}
			}
		}
		
		return $redirect;
	}
	
	public function cp_js_end()
	{
		$str = $this->EE->extensions->last_call;
		
		if ($this->check_page('content_publish', 'entry_form') && $channel_id = $this->EE->profile_model->channel_id())
		{
			if ($channel_id == $this->get('channel_id'))
			{
				$this->EE->lang->loadfile('profile', 'profile');
				
				$str .= '
					$(function(){
						var edited = false
						$(".rightNav a:first").click(function(){
							return (edited) ? confirm("'.lang('unsaved_changes').'") : true;
						});
						$("#mainContent").find(":input").one("change", function(){
							edited = true;
						});
					});
				';
			}
		}
		else if ($this->check_page('myaccount') && $channel_id = $this->EE->profile_model->channel_id())
		{
			if ( ! $member_id = $this->get('id'))
			{
				$member_id = $this->EE->session->userdata('member_id');
			}
			
			$entry_id = $this->EE->profile_model->get_profile_id($member_id);
			
			$this->EE->lang->loadfile('profile', 'profile');
			
			$str .= '
				$(function(){
					$("#menu li:first ul li:first a").html("'.lang('edit_info').'");
					$("#menu li:first ul li:first").before("<li><a href=\'"+EE.BASE+"&C=content_publish&M=entry_form&channel_id='.$channel_id.'&entry_id='.$entry_id.'\'>'.lang('edit_profile').'</a></li>");
				});
			';
			
			//iframe
			//&& element('M', $get) === 'edit_profile'
			/*
			$str .= '
				$(function(){
					$(".pageContents table tbody td:eq(1)").html("").html("<iframe id=\'publish_form\' style=\'display:none;\'></iframe>");
					$("iframe#publish_form").attr("src", EE.BASE+"&C=content_publish&M=entry_form&channel_id='.$channel_id.'&entry_id='.$entry_id.'");
					$("iframe#publish_form").load(function(){
						var contents = $(this).contents();
						contents.find(".contents").css({padding: 0});
						$.each(["#footer", "#branding", "#mainMenu", "#sideBar", "#breadCrumb", "#accessoriesDiv", "#mainContent .contents .heading"], function(i, v){
							contents.find(v).remove();
						});
						$(this).css({
							height: $(this).contents().find("body").height(),
							width: $(this).contents().find("body").width(),
							border: "none"
						}).show();
					});
				});
			';
			*/
		}
		
		return $str;
	}
}

/* End of file ext.profile.php */
/* Location: ./system/expressionengine/third_party/profile/ext.profile.php */