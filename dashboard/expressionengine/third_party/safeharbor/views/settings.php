<?php
echo form_open('C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=settings');

$this->table->clear();

$cp_table_template['heading_cell_start'] = '<th style="width:50%">';

$this->table->set_template($cp_table_template);
$this->table->set_heading('Parameter', 'Value');


/* Begin: Trigger URL */
$array_key = 'base_trigger';
$tbl_param = lang('trigger_intro');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
		'readonly' => 'readonly',
		'onclick' => 'javascript:this.focus();this.select();'
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Trigger URL */


/* Begin: Auth Code */
$array_key = 'auth_code';
$tbl_param = lang('auth_code');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Auth Code */


/* Begin: Email Notify */
$array_key = 'notify_email_address';
$tbl_param = lang('notify_email_address');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Email Notify */


/* Begin: Backup Space */
$array_key = 'backup_space';
$tbl_param = lang('backup_space');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Backup Space */


/* Begin: Backup Path */
$array_key = 'backup_path';
$tbl_param = lang('backup_path');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Backup Path */

/* Begin: Storage Path */
$array_key = 'storage_path';
$tbl_param = lang('storage_path');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Storage Path */


/* Begin: Backup Time */
$array_key = 'backup_time';
$tbl_param = lang('backup_time');
$tbl_value = '';

$backup_time = explode(',', $settings[$array_key]);
$backup_hour = $backup_time[0];
$backup_min = $backup_time[1];

$hours = array();
for( $x=0; $x<24; $x++ )
{
	$hours[$x] = $x;
}
$tbl_value .= form_dropdown($array_key.'-hour', $hours, array($backup_hour));

$minutes = array();
for( $x=0; $x<60; $x++ )
{
	if( ($x%15) === 0 )
	{
		$minutes[$x] = $x;
	}
}
$tbl_value .= ' '.form_dropdown($array_key.'-min', $minutes, array($backup_min));

$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Backup Time */


/* Begin: Transfer Type */
$array_key = 'transfer_type';
$tbl_param = lang('transfer_type');

if( $this->input->get('https') == 'pass' )
{
	$tbl_param .= ' <small>(<strong style="color:#0f0;">'.lang('test_https_pass').'</strong>)</small>';
}
else if( $this->input->get('https') == 'fail' )
{
	$tbl_param .= ' <small>(<strong style="color:#f00;">'.lang('test_https_fail').'</strong>)</small>';
}
else
{
	$tbl_param .= ' <small>(<a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=test_https'.'">'.lang('test_https').'</a>)</small>';
}

$tbl_value = form_dropdown($array_key, array(
	'http' => lang('http'),
	'https' => lang('https')
), array($settings[$array_key]));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Transfer Type */


/* Begin: Database Backup */
$array_key = 'db_backup';
$tbl_param = lang('db_backup');
$tbl_value = form_dropdown($array_key, array(
	'command' => lang('command'),
	'php' => lang('php')
), array($settings[$array_key]));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Database Backup */

/* Begin: CRON URL only */
$array_key = 'disable_remote';
$tbl_param = lang('disable_remote');
$tbl_value = form_dropdown($array_key, array(
	'0' => lang('no'),
	'1' => lang('yes')
), array($settings[$array_key]));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: CRON URL only */

/* Begin: CRON URL */
$array_key = 'cron_url';
$tbl_param = lang('cron_url');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
		'readonly' => 'readonly',
		'onclick' => 'javascript:this.focus();this.select();'
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: CRON URL */


// clean up
$tbl_param = NULL;
$tbl_value = NULL;
unset($tbl_param, $tbl_value);

echo $this->table->generate();


/* Begin: AMAZON S3 TABLE */
$this->table->clear();

$cp_table_template['heading_cell_start'] = '<th style="width:50%">';

$this->table->set_template($cp_table_template);
$this->table->set_heading('Parameter', 'Value');


/* Begin: Enable S3 */
$array_key = 'amazon_s3_enabled';
$tbl_param = lang('amazon_s3_enabled');
$tbl_value = form_checkbox(array(
	'name' => $array_key,
	'id' => $array_key,
	'value' => 'enabled',
	'checked' => (bool)$settings[$array_key],
	));
$tbl_value .= ' '.form_label(lang('amazon_s3_enabled_label'), $array_key);
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Enable S3 */


/* Begin: Access Key ID */
$array_key = 'amazon_s3_access_key';
$tbl_param = lang('amazon_s3_access_key');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Access Key ID */


/* Begin: Secret */
$array_key = 'amazon_s3_secret';
$tbl_param = lang('amazon_s3_secret');
$tbl_value = form_password(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Secret */

// clean up
$tbl_param = NULL;
$tbl_value = NULL;
unset($tbl_param, $tbl_value);

echo '<h3 style="padding-top:15px;">Amazon S3</h3>';
echo $this->table->generate();
/* End: AMAZON S3 TABLE */


/* Begin: FTP TABLE */
$this->table->clear();

$cp_table_template['heading_cell_start'] = '<th style="width:50%">';

$this->table->set_template($cp_table_template);
$this->table->set_heading('Parameter', 'Value');


/* Begin: Enable FTP */
$array_key = 'ftp_enabled';
$tbl_param = lang('ftp_enabled');
$tbl_value = form_checkbox(array(
	'name' => $array_key,
	'id' => $array_key,
	'value' => 'enabled',
	'checked' => (bool)$settings[$array_key],
	));
$tbl_value .= ' '.form_label(lang('ftp_enabled_label'), $array_key);
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Enable FTP */


/* Begin: FTP Host */
$array_key = 'ftp_host';
$tbl_param = lang('ftp_host');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: FTP Host */


/* Begin: FTP Username */
$array_key = 'ftp_username';
$tbl_param = lang('ftp_username');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: Access Key ID */


/* Begin: FTP Password */
$array_key = 'ftp_password';
$tbl_param = lang('ftp_password');
$tbl_value = form_password(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: FTP password */


/* Begin: FTP Port */
$array_key = 'ftp_port';
$tbl_param = lang('ftp_port');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
		'size' => '5',
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: FTP Port */


/* Begin: FTP Port */
$array_key = 'ftp_path';
$tbl_param = lang('ftp_path');
$tbl_value = form_input(array(
		'name' => $array_key,
		'id' => $array_key,
		'value' => $settings[$array_key],
	));
$this->table->add_row(array($tbl_param, $tbl_value));
/* End: FTP Port */

// clean up
$tbl_param = NULL;
$tbl_value = NULL;
unset($tbl_param, $tbl_value);

echo '<h3 style="padding-top:15px">FTP</h3>';
echo $this->table->generate();
/* End: FTP TABLE */

echo form_submit(array('name'=>'submit', 'value'=>lang('submit'), 'class'=>'submit'));
echo form_close();
?>
