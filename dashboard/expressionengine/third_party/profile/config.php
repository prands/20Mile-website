<?php
$config['name'] = 'Profile:Edit';
$config['version'] = '1.0.7';
$config['nsm_addon_updater']['versions_xml'] = 'http://mightybigrobot.com/products/version/profile-edit';

$config['default_settings'] = array(
	'channel_id' => FALSE,
	'allow_multiple_profiles' => '0',
	'use_email_as_username' => '0',
	'login_after_email_activation' => '0',
	//'delete_profiles_when_deleting_members' => '0',
	'global_profile_variables' => '0',
	'auto_title_screen_name' => '1',
	'auto_url_title_username' => '1',
	'require_current_password' => '1',
	'require_password_confirm' => '1',
	'require_email_confirm' => '1',
);