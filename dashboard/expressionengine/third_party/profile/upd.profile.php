<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profile_upd
{
	public $version;
	
	protected $hooks = array(
		'member_member_register',
		'cp_members_member_create',
		'cp_js_end',
		//'cp_members_member_delete_end',
		'entry_submission_start',
		'safecracker_entry_form_tagdata_start',
		'safecracker_submit_entry_start',
		'safecracker_submit_entry_end',
		'publish_form_entry_data',
		'template_post_parse',
		'template_fetch_template',
		array(
			'hook' => 'entry_submission_redirect',
			'method' => 'entry_submission_redirect',
			'priority' => 1,
		),
	);
	
	/**
	 * @var array 'hook_name' => 'setting_it_depends_on'
	 */
	protected $settings_dependent_hooks = array(
		//'cp_members_member_delete_end' => 'delete_profiles_when_deleting_members',
		'template_post_parse' => 'global_profile_variables',
		'template_fetch_template' => 'global_profile_variables',
	);
	
	protected $actions = array(
		'register_action',
		'edit_action',
		'set_active_profile_action',
		'login_action',
		'logout_action',
		'forgot_password_action',
		'reset_password_action',
		'activation_action',
	);
	
	protected $default_settings;

	/**
	 * Profile_upd
	 *
	 * @access	public
	 * @return	void
	 */
	public function __construct()
	{
		$this->EE =& get_instance();
		
		include PATH_THIRD.'profile/config.php';
		
		$this->version = $config['version'];
		
		$this->default_settings = $config['default_settings'];
	}

	/**
	 * install
	 *
	 * @access	public
	 * @return	void
	 */
	public function install()
	{
		//ensure that safecracker is installed
		if ( ! $this->EE->db->where('module_name', 'Safecracker')->count_all_results('modules') || ! $this->EE->db->where('class', 'Safecracker_ext')->count_all_results('extensions'))
		{
			$this->EE->lang->loadfile('profile', 'profile');

			show_error(lang('safecracker_not_installed'));
		}

		$this->EE->db->insert(
			'modules',
			array(
				'module_name' => 'Profile',
				'module_version' => $this->version,
				'has_cp_backend' => 'y',
				'has_publish_fields' => 'n'
			)
		);
		
		foreach ($this->actions as $action)
		{
			$this->EE->db->insert(
				'actions',
				array(
					'class' => 'Profile',
					'method' => $action,
				)
			);
		}

		foreach ($this->hooks as $hook)
		{
			$hook_name = (is_array($hook)) ? $hook['hook'] : $hook;
			
			if (array_key_exists($hook_name, $this->settings_dependent_hooks) && ! $this->default_settings[$this->settings_dependent_hooks[$hook_name]])
			{
				continue;
			}
			
			$this->install_hook($hook);
		}

		return TRUE;
	}

	/**
	 * uninstall
	 *
	 * @access	public
	 * @return	void
	 */
	public function uninstall()
	{
		$query = $this->EE->db->get_where('modules', array('module_name' => 'Profile'));

		if ($query->row('module_id'))
		{
			$this->EE->db->delete('module_member_groups', array('module_id' => $query->row('module_id')));
		}
		
		$query->free_result();

		$this->EE->db->delete('modules', array('module_name' => 'Profile'));

		$this->EE->db->delete('actions', array('class' => 'Profile'));
		
		$this->EE->db->delete('extensions', array('class' => 'Profile_ext'));

		return TRUE;
	}

	/**
	 * update
	 *
	 * @access	public
	 * @param	mixed $current = ''
	 * @return	void
	 */
	public function update($current = '')
	{
		if ($current == $this->version)
		{
			return FALSE;
		}
		
		//grab actions & hooks that are already in the DB
		$current_actions = array();
		
		$current_hooks = array();
		
		$query = $this->EE->db->select('method')
				      ->where('class', 'Profile')
				      ->get('actions');
		
		foreach ($query->result() as $row)
		{
			$current_actions[] = $row->method;
		}
		
		$query->free_result();
		
		$query = $this->EE->db->select('hook, settings')
				      ->where('class', 'Profile_ext')
				      ->get('extensions');
		
		$settings = $query->row('settings');
		
		if ( ! $current_settings = @unserialize($settings))
		{
			$current_settings = array();
		}
		
		$current_settings = array_merge($this->default_settings, $current_settings);
		
		foreach ($query->result() as $row)
		{
			$current_hooks[] = $row->hook;
		}
		
		//add actions that aren't already in the DB
		foreach ($this->actions as $method)
		{
			if ( ! in_array($method, $current_actions))
			{
				$this->EE->db->insert('actions', array('class' => 'Profile', 'method' => $method));
			}
			else
			{
				unset($current_actions[array_search($method, $current_actions)]);
			}
		}
		
		//add hooks that aren't already in the DB
		foreach ($this->hooks as $hook)
		{
			$hook_name = (is_array($hook)) ? $hook['hook'] : $hook;
			
			if ( ! in_array($hook_name, $current_hooks))
			{
				if (array_key_exists($hook_name, $this->settings_dependent_hooks) && ! $current_settings[$this->settings_dependent_hooks[$hook_name]])
				{
					continue;
				}
				
				$this->install_hook($hook, $settings);
			}
			else
			{
				unset($current_hooks[array_search($hook_name, $current_hooks)]);
			}
		}
		
		//remove actions that are in the DB that are no longer in this->actions
		foreach ($current_actions as $method)
		{
			$this->EE->db->delete('actions', array('class' => 'Profile', 'method' => $method));
		}
		
		//remove hooks that are in the DB that are no longer in this->hooks
		foreach ($current_hooks as $hook)
		{
			$this->EE->db->delete('extensions', array('hook' => $hook, 'class' => 'Profile_ext'));
		}
		
		$this->EE->db->update('extensions', array('version' => $this->version), array('class' => 'Profile_ext'));
		
		return TRUE;
	}
	
	protected function install_hook($hook, $settings = '')
	{
		$defaults = array(
			'class' => 'Profile_ext',
			'settings' => (is_array($settings)) ? serialize($settings) : $settings,
			'version' => $this->version,
			'enabled' => 'y',
			'priority' => 10,
		);
		
		if (is_array($hook))
		{
			$hook = array_merge($defaults, $hook);
		}
		else
		{
			$hook = array_merge($defaults, array(
				'hook' => $hook,
				'method' => $hook,	
			));
		}
		
		$this->EE->db->insert('extensions', $hook);
	}
	
	public function update_hooks($settings)
	{
		$this->EE->db->update('extensions', array('settings' => serialize($settings)), array('class' => 'Profile_ext'));
		
		foreach ($this->settings_dependent_hooks as $hook => $setting)
		{
			if (empty($settings[$setting]))
			{
				$this->EE->db->delete('extensions', array('hook' => $hook));
			}
			else
			{
				if ($this->EE->db->where(array('class' => 'Profile_ext', 'hook' => $hook))->count_all_results('extensions') === 0)
				{
					$this->install_hook($hook, $settings);
				}
			}
		}
	}
}

/* End of file upd.profile.php */
/* Location: ./system/expressionengine/third_party/profile/upd.profile.php */