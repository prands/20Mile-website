<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profile
{
	/**
	 * Profile
	 *
	 * @access	public
	 * @return	void
	 */
	public function __construct()
	{
		$this->EE =& get_instance();

		$this->EE->load->model('profile_model');
		
		$this->EE->lang->loadfile('profile', 'profile');
		
		$this->EE->load->library('typography');
	}
	
	/**
	 * A list of the current member's profiles
	 * 
	 * @return string
	 */
	public function profiles()
	{
		if ( ! $this->EE->profile_model->channel_id() || ! $this->EE->profile_model->channel_name())
		{
			return $this->EE->output->show_user_error('general', lang('no_channel'));
		}
		
		if ($this->EE->TMPL->fetch_param('username'))
		{
			$member_id = $this->EE->profile_model->get_member_id_by_username($this->EE->TMPL->fetch_param('username'));
		}
		else if ($this->EE->TMPL->fetch_param('member_id'))
		{
			$member_id = $this->EE->TMPL->fetch_param('member_id');
		}
		else
		{
			$member_id = $this->EE->session->userdata('member_id');
		}
		
		if ( ! $member_id || ! $entry_ids = $this->EE->profile_model->get_all_profile_ids($member_id))
		{
			return $this->EE->TMPL->no_results();
		}
		
		if ($this->EE->profile_model->site_id() != $this->EE->config->item('site_id'))
		{
			$this->EE->TMPL->site_ids = array($this->EE->profile_model->site_id());
		}
		
		return $this->EE->profile_model->channel_entries(array(
			'dynamic' => 'no',
			'channel' => $this->EE->profile_model->channel_name(),
			'entry_id' => implode('|', $entry_ids),
		));
	}
	
	public function login()
	{
		$this->EE->load->library('form_builder');
		
		$variables = array_merge(
			$this->EE->profile_model->member_vars(),
			$this->EE->form_builder->form_variables()
		);

		$variables['auto_login'] = ($this->EE->config->item('user_session_type') === 'c') ? 1 : 0;
		
		$this->EE->form_builder->initialize(array(
			'classname' => 'Profile',
			'method' => 'login_action',
			'params' => $this->EE->TMPL->tagparams,
			'content' => $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, array($variables)),
		));

		return $this->EE->form_builder->form();
	}
	
	public function logout_link()
	{
		return $this->EE->profile_model->build_action_url('logout');
	}
	
	public function logout_action()
	{
		$this->EE->load->library('form_builder');
		
		$this->EE->profile_model->member_action('member_logout');
		
		$this->EE->functions->redirect($this->EE->functions->create_url($this->EE->input->get_post('return')));
	}
	
	public function login_action()
	{
		$this->EE->load->library('form_builder');
		
		$this->EE->profile_model->member_action('member_login');
		
		$this->EE->form_builder->add_error($this->EE->profile_model->errors());
		
		foreach ($this->EE->profile_model->member_vars() as $key => $value)
		{
			if (FALSE !== ($value = $this->EE->input->post($key)))
			{
				$this->EE->profile_model->set_member_var($key, $this->EE->security->xss_clean($value));
			}
		}
		
		return $this->EE->form_builder->action_complete();
	}
	
	public function forgot_password()
	{
		$this->EE->load->library('form_builder');

		$variables = array_merge(
			$this->EE->profile_model->member_vars(),
			$this->EE->form_builder->form_variables()
		);
		
		$this->EE->form_builder->initialize(array(
			'classname' => 'Profile',
			'method' => 'forgot_password_action',
			'form_data' => array(
				'forgot_password_return',
			),
			'params' => $this->EE->TMPL->tagparams,
			'content' => $this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, array($variables)),
		));

		return $this->EE->form_builder->form();
	}
	
	public function forgot_password_action()
	{
		$this->EE->load->library('form_builder');
		
		$this->EE->load->helper(array('string', 'email'));
		
		$this->EE->load->model('member_model');
		
		if ($this->EE->session->userdata('is_banned'))
		{
			$this->EE->form_builder->add_error(lang('not_authorized'))
					       ->action_complete();
		}
		
		$email = $this->EE->input->post('email');
		
		if ( ! valid_email($email))
		{
			$this->EE->form_builder->add_error(lang('invalid_email_address'))
					       ->action_complete();
		}
		
		$query = $this->EE->member_model->get_member_emails(array(), array('email' => $email));
		
		if ($query->num_rows() === 0)
		{
			$this->EE->form_builder->add_error(lang('no_email_found'))
					       ->action_complete();
		}
		
		$member_data = $query->row_array();
		
		$resetcode = random_string();
		
		$query->free_result();
		
		$this->EE->db->delete('reset_password', array('member_id' => $member_data['member_id']));
		
		$this->EE->db->delete('reset_password', array('date <' => $this->EE->localize->now - (60*60*24)));
		
		$this->EE->db->insert('reset_password', array(
			'resetcode' => $resetcode,
			'date' => $this->EE->localize->now,
			'member_id' => $member_data['member_id'],
		));
		
		$variables = $member_data;
		
		$variables['name'] = $member_data['screen_name'];
		
		$variables['reset_url'] = $this->EE->profile_model->build_action_url('reset_password', array(
			'resetcode' => $resetcode,
			'return' => $this->EE->input->post('forgot_password_return'),
		));
		
		if ( ! $this->EE->profile_model->send_email($email, 'forgot_password_instructions', $variables))
		{
			$this->EE->form_builder->add_error(lang('error_sending_email'))
					       ->action_complete();
		}
		
		foreach ($this->EE->profile_model->member_vars() as $key => $value)
		{
			if (FALSE !== ($value = $this->EE->input->post($key)))
			{
				$this->EE->profile_model->set_member_var($key, $this->EE->security->xss_clean($value));
			}
		}
		
		return $this->EE->form_builder->action_complete();
	}
	
	public function is_active_profile()
	{
		if ( ! $this->EE->TMPL->fetch_param('entry_id'))
		{
			return 0;
		}
		
		return (int) ($this->EE->profile_model->get_profile_id($this->EE->session->userdata('member_id')) == $this->EE->TMPL->fetch_param('entry_id'));
	}
	
	/**
	 * Get a link to the action which sets the active profile
	 * 
	 * @return Type    Description
	 */
	public function set_active_profile_link()
	{
		if ( ! $this->EE->TMPL->fetch_param('entry_id'))
		{
			return '';
		}
		
		return $this->EE->profile_model->build_action_url('set_active_profile', array('entry_id' => $this->EE->TMPL->fetch_param('entry_id')));
	}
	
	public function set_active_profile_action()
	{
		$this->EE->load->library('form_builder');
		
		$this->EE->profile_model->set_active_profile($this->EE->input->get_post('entry_id'));
		
		$this->EE->functions->redirect($this->EE->functions->create_url($this->EE->input->get_post('return')));
	}
	
	public function member_group_select()
	{
		$this->EE->load->helper('form');
 
		if ($this->EE->TMPL->fetch_param('id'))
		{
			$attrs['id'] = $this->EE->TMPL->fetch_param('id');
		}

		if ($this->EE->TMPL->fetch_param('class'))
		{
			$attrs['class'] = $this->EE->TMPL->fetch_param('class');
		}

		if ($this->EE->TMPL->fetch_param('onchange'))
		{
			$attrs['onchange'] = $this->EE->TMPL->fetch_param('onchange');
		}

		$extra = '';

		if (isset($attrs))
		{
			$extra .= _attributes_to_string($attrs);
		}

		if ($this->EE->TMPL->fetch_param('extra'))
		{
			if (substr($this->EE->TMPL->fetch_param('extra'), 0, 1) != ' ')
			{
				$extra .= ' ';
			}

			$extra .= $this->EE->TMPL->fetch_param('extra');
		}
		
		$name = 'GID'; 
		
		$selected = ($this->EE->TMPL->fetch_param('selected') ? $this->EE->TMPL->fetch_param('selected'): $this->EE->config->item('default_member_group')); 
		
		$query = $this->EE->db->order_by('group_id', 'asc')->get('member_groups');
		
		$member_groups = array();
		
		foreach ($query->result_array() as $row)
		{
			$member_groups[$row['group_id']] = $row['group_title'];
		}
		
		$query->free_result();
		
		$data = array();
		
 		// get the gateways that the user wants to output
		if ($this->EE->TMPL->fetch_param('member_groups'))
		{
			foreach (explode('|', $this->EE->TMPL->fetch_param('member_groups')) as $group_id)
			{
				if (array_key_exists($group_id, $member_groups))
				{
					$data[$this->EE->safecracker->encrypt_input($group_id)] = $member_groups[$group_id];
				}
			}
		}
		else
		{
			foreach (array_keys($member_groups) as $group_id)
			{
				if ($group_id > 4)
				{
					$data[$this->EE->safecracker->encrypt_input($group_id)] = $member_groups[$group_id];
				}
			}
		}
		
		if ($this->EE->safecracker->bool_string($this->EE->TMPL->fetch_param('add_blank')))
		{
			$data = array_merge(array('' => '---'), $data);
		}
		
		if ($this->EE->TMPL->tagdata)
		{
			$variables = array();
			
			if ( ! $data)
			{
				$variables[] = array();
			}
			
			foreach ($data as $option_value => $option_name)
			{
				$variables[] = array(
					'option_value' => $option_value,
					'option_name' => $option_name,
					'selected' => (int) $option_value === $selected,
				);
			}
			
			return "<select $extra>".$this->EE->TMPL->parse_variables($this->EE->TMPL->tagdata, $variables).'</select>';
		}
		
 		return form_dropdown(
			$name, 
			$data,
			$selected,
			$extra
		);
	}

	public function view()
	{
		if ( ! $this->EE->profile_model->channel_id() || ! $this->EE->profile_model->channel_name())
		{
			return $this->EE->output->show_user_error('general', lang('no_channel'));
		}
		
		if ($this->EE->profile_model->site_id() != $this->EE->config->item('site_id'))
		{
			$this->EE->TMPL->site_ids = array($this->EE->profile_model->site_id());
		}
		
		$entry_id = FALSE;
		
		$url_title = FALSE;
		
		if ($this->EE->TMPL->fetch_param('entry_id'))
		{
			$entry_id = $this->EE->TMPL->fetch_param('entry_id');
		}
		else if ($this->EE->TMPL->fetch_param('url_title'))
		{
			$url_title = $this->EE->TMPL->fetch_param('url_title');
		}
		else if ($this->EE->TMPL->fetch_param('username'))
		{
			$member_id = $this->EE->profile_model->get_member_id_by_username($this->EE->TMPL->fetch_param('username'));
		}
		else if ($this->EE->TMPL->fetch_param('member_id'))
		{
			$member_id = $this->EE->TMPL->fetch_param('member_id');
		}
		else
		{
			$member_id = $this->EE->session->userdata('member_id');
		}
		
		if ( ! $entry_id && ! $url_title)
		{
			if ( ! $member_id)
			{
				return $this->EE->TMPL->no_results();
			}
			
			if ( ! $entry_id = $this->EE->profile_model->get_profile_id($member_id))
			{
				return $this->EE->TMPL->no_results();
			}
		}
		
		$params = array(
			'dynamic' => 'no',
			'channel' => $this->EE->profile_model->channel_name(),
			'limit' => '1',
		);
		
		if ($url_title)
		{
			$params['url_title'] = $url_title;
		}
		else
		{
			$params['entry_id'] = $entry_id;
		}
		
		return $this->EE->profile_model->channel_entries($params);
	}

	public function edit()
	{
		if ( ! $this->EE->profile_model->channel_id())
		{
			return $this->EE->output->show_user_error('general', lang('no_channel'));
		}

		$this->EE->load->add_package_path(APPPATH.'modules/safecracker/');

		$this->EE->load->library('safecracker_lib');
		
		$entry_id = FALSE;
		$member_id = FALSE; 
		$url_title = FALSE;
		
		if ($this->EE->TMPL->fetch_param('entry_id'))
		{
			$entry_id = $this->EE->TMPL->fetch_param('entry_id');
		}
		else if ($this->EE->TMPL->fetch_param('url_title'))
		{
			$url_title = $this->EE->TMPL->fetch_param('url_title');
		}
		else if ($this->EE->TMPL->fetch_param('username'))
		{
			$member_id = $this->EE->profile_model->get_member_id_by_username($this->EE->TMPL->fetch_param('username'));
		}
		else if ($this->EE->TMPL->fetch_param('member_id'))
		{
			$member_id = $this->EE->TMPL->fetch_param('member_id');
		}
		else
		{
			$member_id = $this->EE->session->userdata('member_id');
		}
		
		if ($entry_id && ! $this->EE->profile_model->validate_entry_id($entry_id, $member_id))
		{
			$entry_id = FALSE;
		}
		else if ($url_title && ! $this->EE->profile_model->validate_url_title($url_title, $member_id))
		{
			$url_title = FALSE;
		}
		
		if ( ! $entry_id && ! $url_title)
		{
			if ( ! $member_id)
			{
				return $this->EE->TMPL->no_results();
			}
			
			if ( ! $this->EE->safecracker->bool_string($this->EE->TMPL->fetch_param('new')))
			{
				if ($entry_id = $this->EE->profile_model->get_profile_id($member_id))
				{
					$this->EE->TMPL->tagparams['entry_id'] = $entry_id;
				}
				else
				{
					return $this->EE->TMPL->no_results();
				}
			}
		}
		
		$this->EE->TMPL->tagparams['channel'] = $this->EE->profile_model->channel_name();
		
		$this->EE->session->cache['profile']['form_hidden'] = array(
			'ACT' => $this->EE->functions->fetch_action_id('Profile', 'edit_action'),
			'member_id' => $member_id,
		);
		
		if ($this->EE->TMPL->fetch_param('dynamic_screen_name'))
		{
			$this->EE->session->cache['profile']['form_hidden']['dynamic_screen_name'] = base64_encode($this->EE->TMPL->fetch_param('dynamic_screen_name'));
		}
		
		if ($this->EE->profile_model->site_id() != $this->EE->config->item('site_id'))
		{
			$this->EE->TMPL->site_ids = array($this->EE->profile_model->site_id());
			
			$this->EE->TMPL->tagparams['site'] = $this->EE->profile_model->site_name();
		}
		
		if ( ! $this->EE->TMPL->fetch_param('return'))
		{
			$this->EE->TMPL->tagparams['return'] = $this->EE->uri->uri_string();
		}
		
		if ($this->EE->safecracker->errors || $this->EE->safecracker->field_errors || $this->EE->profile_model->errors())
		{
			$member_vars = $this->EE->profile_model->member_vars();
			
			//we only want to parse those vars which have been posted
			foreach ($member_vars as $key => $value)
			{
				if ( ! isset($_POST[$key]))
				{
					unset($member_vars[$key]);
				}
			}
			
			$this->EE->TMPL->tagdata = $this->EE->TMPL->parse_variables_row($this->EE->TMPL->tagdata, $member_vars);
		}
		
		//tell safecracker that this is an edit form, not a register form
		$this->EE->session->cache['profile']['edit'] = TRUE;
		
		return $this->EE->safecracker->entry_form();
	}
	
	public function edit_action($update_member_settings = TRUE)
	{
		$this->EE->session->cache['profile']['submit_entry'] = TRUE;
		
		$this->EE->load->add_package_path(APPPATH.'modules/safecracker/');
		
		$this->EE->load->library('safecracker_lib');
		
		$member_id = $this->EE->input->post('member_id');
		
		if ( ! $member_id)
		{
			$this->EE->functions->redirect($this->EE->input->post('RET'));
		}
		
		$member_data = $this->EE->profile_model->get_member_data($member_id);
		
		if (isset($_POST['username']) && $_POST['username'] !== $member_data['username'])
		{
			if (isset($_POST['screen_name']) && $_POST['screen_name'] === '')
			{
				$_POST['screen_name'] = $_POST['username'];
			}
			else if ( ! isset($_POST['screen_name']) && $member_data['username'] === $member_data['screen_name'])
			{
				$_POST['screen_name'] = $_POST['username'];
			}
		}
		
		if ($this->EE->input->post('dynamic_screen_name'))
		{
			$_POST['screen_name'] = base64_decode($this->EE->input->post('dynamic_screen_name'));
			
			foreach ($_POST as $key => $value)
			{
				if (is_string($value) && strpos($screen_name, '['.$key.']') !== FALSE)
				{
					$_POST['screen_name'] = str_replace('['.$key.']', $value, $_POST['screen_name']);
				}
			}
		}
		
		if ($this->EE->profile_model->settings('use_email_as_username'))
		{
			if (isset($_POST['email']) && ! isset($_POST['username']))
			{
				$_POST['username'] = $_POST['email'];
			}
			else if ( ! isset($_POST['email']))
			{
				$_POST['email'] = $_POST['username'];
			}
		}
		
		if (isset($_POST['email']) && ! $this->EE->profile_model->settings('require_email_confirm'))
		{
			$_POST['email_confirm'] = $_POST['email'];
		}
		
		if (isset($_POST['password']) && ! $this->EE->profile_model->settings('require_password_confirm'))
		{
			$_POST['password_confirm'] = $_POST['password'];
		}
		
		$this->EE->session->cache['profile']['edit'] = TRUE;
		
		$this->EE->session->cache['profile']['member_id'] = $member_id;
		
		$this->EE->session->cache['profile']['update_member'] = $this->EE->profile_model->validate_member_data($this->EE->session->userdata('member_id'), $_POST);
		
		if ($this->EE->profile_model->settings('auto_title_screen_name') && $this->EE->input->post('screen_name') !== FALSE && $this->EE->input->post('screen_name') != $member_data['screen_name'])
		{
			$_POST['title'] = $this->EE->session->userdata('screen_name');
		}
		
		if ($this->EE->profile_model->settings('auto_url_title_username') && $this->EE->input->post('username') !== FALSE && $this->EE->input->post('username') != $member_data['username'])
		{
			$_POST['url_title'] = $this->EE->session->userdata('username');
		}
		
		foreach ($this->EE->profile_model->member_vars() as $key => $value)
		{
			if (FALSE !== ($value = $this->EE->input->post($key)))
			{
				$this->EE->profile_model->set_member_var($key, $this->EE->security->xss_clean($value));
			}
		}
		
		$_POST['json'] = $this->EE->input->is_ajax_request();
		
		return $this->EE->safecracker->submit_entry();
	}

	public function register()
	{
		if ( ! $this->EE->profile_model->channel_id())
		{
			return $this->EE->output->show_user_error('general', lang('no_channel'));
		}

		$this->EE->load->add_package_path(APPPATH.'modules/safecracker/');

		$this->EE->load->library('safecracker_lib');

		$this->EE->TMPL->tagparams['channel'] = $this->EE->profile_model->channel_name();
		
		$this->EE->TMPL->tagparams['logged_out_member_id'] = $this->EE->profile_model->oldest_superadmin();
		
		$this->EE->TMPL->tagdata = $this->EE->TMPL->parse_variables_row($this->EE->TMPL->tagdata, $this->EE->profile_model->member_vars());
		
		$this->EE->session->cache['profile']['register'] = TRUE;
		
		if (preg_match_all('#{if captcha}(.*?){/if}#s', $this->EE->TMPL->tagdata, $matches))
		{
			foreach ($matches[0] as $i => $full_match)
			{
				if ($this->EE->config->item('use_membership_captcha') === 'y' && ! $this->EE->session->userdata('member_id'))
				{
					$tagdata = $this->EE->TMPL->parse_variables_row($matches[1][$i], array(
						'captcha_word' => '',
						'captcha' => $this->EE->functions->create_captcha(),
					));
					
					$tagdata = $this->EE->TMPL->swap_var_single('captcha', $this->EE->functions->create_captcha(), $tagdata);
					
					$this->EE->TMPL->tagdata = str_replace($full_match, $tagdata, $this->EE->TMPL->tagdata);
				}
				else
				{
					$this->EE->TMPL->tagdata = str_replace($full_match, '', $this->EE->TMPL->tagdata);
				}
			}
		}
		
		$this->EE->session->cache['profile']['form_hidden'] = array(
			'ACT' => $this->EE->functions->fetch_action_id('Profile', 'register_action'),
		);
		
		$group_id = $this->EE->TMPL->fetch_param('group_id');
		
		if ($this->EE->profile_model->validate_group_id($group_id))
		{
			$this->EE->session->cache['profile']['form_hidden']['GID'] = $this->EE->safecracker->encrypt_input($group_id);
		}
		
		if ($this->EE->TMPL->fetch_param('dynamic_screen_name'))
		{
			$this->EE->session->cache['profile']['form_hidden']['dynamic_screen_name'] = base64_encode($this->EE->TMPL->fetch_param('dynamic_screen_name'));
		}
		
		if ($this->EE->profile_model->site_id() != $this->EE->config->item('site_id'))
		{
			$this->EE->TMPL->site_ids = array($this->EE->profile_model->site_id());
			
			$this->EE->TMPL->tagparams['site'] = $this->EE->profile_model->site_name();
		}
		
		if ( ! $this->EE->TMPL->fetch_param('return'))
		{
			$this->EE->TMPL->tagparams['return'] = $this->EE->uri->uri_string();
		}
		
		if ($this->EE->TMPL->fetch_param('activation_return'))
		{
			$this->EE->session->cache['profile']['form_hidden']['activation_return'] = $this->EE->TMPL->fetch_param('activation_return');
		}
		
		return $this->EE->safecracker->entry_form();
	}
	
	public function register_action()
	{
		$this->EE->session->cache['profile']['submit_entry'] = TRUE;
		
		$this->EE->load->add_package_path(APPPATH.'modules/safecracker/');
		
		$this->EE->load->library('safecracker_lib');
		
		//log them in if applicable
		$this->EE->load->library('auth');
		
		$username = $this->EE->input->post('username', TRUE);
		
		$password = $this->EE->input->post('password', TRUE);
		
		if ($this->EE->profile_model->settings('use_email_as_username'))
		{
			if (isset($_POST['email']) && ! isset($_POST['username']))
			{
				$_POST['username'] = $username = $_POST['email'];
			}
			else if ( ! isset($_POST['email']))
			{
				$_POST['email'] = $username;
			}
		}
		
		if ($this->EE->input->post('dynamic_screen_name'))
		{
			$screen_name = base64_decode($this->EE->input->post('dynamic_screen_name'));
			
			foreach ($_POST as $key => $value)
			{
				if (is_string($value) && strpos($screen_name, '['.$key.']') !== FALSE)
				{
					$screen_name = str_replace('['.$key.']', $value, $screen_name);
				}
			}
			
			$_POST['screen_name'] = $screen_name;
		}
		
		//if they're already logged in and they don't have member admin privileges
		if ($this->EE->session->userdata('member_id') && $this->EE->session->userdata('can_admin_members') !== 'y')
		{
			$this->EE->profile_model->add_error(lang('logged_in_no_register_privilege'));
		}
		else
		{
			//login the member if they already exist
			if ($username && $this->EE->db->where('username', $username)->count_all_results('members'))
			{
				if ($sess = $this->EE->auth->authenticate_username($username, $password))
				{
					if ($sess->is_banned())
					{
						return $this->EE->output->show_user_error('general', lang('not_authorized'));
					}
					
					$sess->start_session();
	
					if ( ! isset($_POST['title']))
					{
						$_POST['title'] = $this->EE->session->userdata('screen_name');
					}
					
					if ( ! isset($_POST['url_title']))
					{
						$_POST['url_title'] = $this->EE->session->userdata('username');
					}
					
					$_POST['entry_id'] = $this->EE->profile_model->get_profile_id($this->EE->session->userdata('member_id'));
					
					return $this->EE->safecracker->submit_entry();
				}
			}
		}
		
		if ($this->EE->profile_model->settings('use_email_as_username'))
		{
			$username = $this->EE->input->post('email');
		}
		
		if (strlen($username) > 50)
		{
			$this->EE->profile_model->add_error('username', lang('username_too_long'));
		}
		
		if (strlen($password) > 40)
		{
			$this->EE->profile_model->add_error('password', lang('password_too_long'));
		}
		
		//we set this cache variable so that the member_member_register hook knows to use
		//the oldest superadmin as the temporary author_id of the entry, to get around
		//api_channel_entries restrictions
		if ($this->EE->config->item('req_mbr_activation') !== 'none')
		{
			$this->EE->session->cache['profile']['oldest_superadmin'] = TRUE;
		}
		
		$this->EE->session->cache['profile']['register'] = TRUE;
		
		//turn off captcha if already logged in
		$use_membership_captcha = $this->EE->config->item('use_membership_captcha');
		
		if ($this->EE->session->userdata('member_id'))
		{
			//set this so safecracker_submit_entry_end knows not to log you out if failed
			$this->EE->session->cache['profile']['admin_register'] = TRUE;
			
			$this->EE->config->set_item('use_membership_captcha', 'n');
		}
		
		$default_member_group = $this->EE->config->item('default_member_group');
		
		if ($this->EE->config->item('req_mbr_activation') === 'none' && $this->EE->session->userdata('member_id') && $this->EE->session->userdata('can_admin_mbr_groups') === 'y' && $this->EE->input->post('GID'))
		{
			$this->EE->load->helper('security');
			
			$group_id = xss_clean($this->EE->safecracker->decrypt_input($this->EE->input->post('GID')));
			
			//validate group_id
			if ($this->EE->profile_model->validate_group_id($group_id))
			{
				$this->EE->config->set_item('default_member_group', $group_id);
			}
		}
		
		if (isset($_POST['email']) && ! $this->EE->profile_model->settings('require_email_confirm'))
		{
			$_POST['email_confirm'] = $_POST['email'];
		}
		
		if (isset($_POST['password']) && ! $this->EE->profile_model->settings('require_password_confirm'))
		{
			$_POST['password_confirm'] = $_POST['password'];
		}
		
		$register = $this->EE->profile_model->member_action('register_member', 'member_register');
		
		$this->EE->config->set_item('default_member_group', $default_member_group);
		
		$this->EE->config->set_item('use_membership_captcha', $use_membership_captcha);
		
		//member_register returns FALSE if registrations are turned off
		if ($register === FALSE)
		{
			$this->EE->profile_model->add_error(lang('registration_off'));
		}
		
		foreach ($this->EE->profile_model->member_vars() as $key => $value)
		{
			if (FALSE !== ($value = $this->EE->input->post($key)))
			{
				$this->EE->profile_model->set_member_var($key, $this->EE->security->xss_clean($value));
			}
		}
		
		//if this isn't set it means the register action failed early
		if (isset($this->EE->session->cache['profile']['member_id']))
		{
			//we can't set the author_id to the new member unless there's no account activation required
			//api_channel_entries will throw an error due to author_id/member_id mismatch
			//so we rectify this later on in the extension in the safecracker_submit_entry_end hook
			if ($this->EE->config->item('req_mbr_activation') === 'none')
			{
				$_POST['author_id'] = $this->EE->session->cache['profile']['member_id'];
			}
			
			//we have to do this because the XID hash was already cleared by Member::register_member and needs to be restored,
			//in order for SC to work. don't worry, Member class already validated it
			if ($this->EE->config->item('secure_forms') === 'y' && $this->EE->input->post('XID'))
			{
				$this->EE->db->insert('security_hashes', array('date' => time() - 60, 'ip_address' => $this->EE->input->ip_address(), 'hash' => $this->EE->input->post('XID')));
			}

			if (isset($this->EE->session->cache['profile']['entry_id']))
			{
				$_POST['entry_id'] = $this->EE->session->cache['profile']['entry_id'];
			}
		}
		
		$_POST['json'] = $this->EE->input->is_ajax_request();

		if ($this->EE->input->post('title') === FALSE)
		{
			$_POST['title'] = ($this->EE->input->post('screen_name')) ? $this->EE->input->post('screen_name') : $this->EE->input->post('username');
		}
		
		if ($this->EE->input->post('url_title') === FALSE)
		{
			$_POST['url_title'] = $this->EE->input->post('username');
		}
		
		return $this->EE->safecracker->submit_entry();
	}
	
	public function activation_action()
	{
		$data = array(
			'group_id' => 4,
			'authcode' => $this->EE->input->get('authcode'),
		);
		
		if ( ! $data['authcode'])
		{
			return $this->EE->output->show_user_error('general', lang('missing_authcode'));
		}
		
		$query = $this->EE->db->select('member_id')
				      ->where($data)
				      ->get('members');
		
		if ($query->num_rows() === 0)
		{
			return $this->EE->output->show_user_error('general', lang('invalid_authcode'));
		}
		
		$member_id = $query->row('member_id');
		
		$query->free_result();
		
		$_GET['id'] = $data['authcode'];
		
		$default_member_group = $this->EE->config->item('default_member_group');
		
		if ($this->EE->input->get('g'))
		{
			$this->EE->load->add_package_path(APPPATH.'modules/safecracker/');
	
			$this->EE->load->library('safecracker_lib');
			
			$this->EE->load->helper('security');
			
			$group_id = xss_clean($this->EE->safecracker->decrypt_input($this->EE->input->get('g')));
			
			//validate group_id
			if ($this->EE->profile_model->validate_group_id($group_id))
			{
				$this->EE->config->set_item('default_member_group', $group_id);
			}
		}
		
		$this->EE->profile_model->member_action('activate_member', 'member_register');
		
		$this->EE->config->set_item('default_member_group', $default_member_group);
		
		if ( ! $this->EE->session->userdata('member_id') && $this->EE->profile_model->settings('login_after_email_activation'))
		{
			$this->EE->load->library('auth');
			
			$this->EE->load->model('member_model');
			
			$query = $this->EE->member_model->get_member_data($member_id);
			
			$auth = new Auth_result($query->row());
			
			$auth->remember_me(60*60*24*365);
			
			$auth->start_session();
		}
		
		$this->EE->functions->redirect($this->EE->functions->create_url($this->EE->input->get_post('return')));
	}
	
	public function reset_password_action()
	{
		$this->EE->load->library('form_builder');
		
		$_GET['id'] = $this->EE->input->get('resetcode');
		
		//false means the member_id from the reset-password table does not exist
		if (FALSE === $this->EE->profile_model->member_action('reset_password', 'member_auth'))
		{
			return $this->EE->output->show_user_error('general', lang('mbr_id_not_found'));
		}
		
		if ($this->EE->profile_model->errors())
		{
			return $this->EE->output->show_user_error('general', $this->EE->profile_model->errors());
		}
		
		$this->EE->functions->redirect($this->EE->functions->create_url($this->EE->input->get_post('return')));
	}
}

/* End of file mod.profile.php */
/* Location: ./system/expressionengine/third_party/profile/mod.profile.php */