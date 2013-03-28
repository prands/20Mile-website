<?php

// load safeharbor_mcp
require_once 'mcp.safeharbor.php';

class Safeharbor_upd
{
	public $version = '1.3.3';

	public function __construct()
	{
		$this->EE =& get_instance();
	}

	public function install()
	{
		$this->EE->db->insert('modules', array(
			'module_name' => 'Safeharbor',
			'module_version' => $this->version,
			'has_cp_backend' => 'y',
			'has_publish_fields' => 'n'
		));

		$this->EE->db->insert('actions', array(
			'class' => 'Safeharbor',
			'method' => 'communicate'
		));

		$this->EE->db->insert('actions', array(
			'class' => 'Safeharbor',
			'method' => '_backup_cron'
		));

		$this->EE->db->query("CREATE TABLE IF NOT EXISTS `".$this->EE->db->dbprefix('safeharbor_backups')."` (
				`backup_id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
				`site_id` INT(6) UNSIGNED NOT NULL,
				`name` varchar(128) NOT NULL ,
				`backup_time` varchar(32),
				`start_time` varchar(32) NOT NULL ,
				`end_time` varchar(32),
				`status` varchar(32),
				`db_backup_mode` varchar(32),
				`backup_size` varchar(32),
				`md5_hash` varchar(32),
				`local` int(1),
				`backup_transfer_failed` int(1),
				`backup_type` ENUM('full','differential') NOT NULL,
				`file_ctime` INT(11),
				`full_backup_id` INT(6),
				`transferred_amazon_s3` int(1) NOT NULL DEFAULT '0',
				`transferred_ftp` int(1) NOT NULL DEFAULT '0',
				`note` text NOT NULL,
			PRIMARY KEY (`backup_id`),
			KEY `backup_type` (`backup_type`));");

		$this->EE->db->query("CREATE TABLE IF NOT EXISTS `".$this->EE->db->dbprefix('safeharbor_messages')."` (
				`id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
				`site_id` INT(6) UNSIGNED NOT NULL,
				`message` varchar(512) NOT NULL ,
				`date` varchar(32) NOT NULL,
			PRIMARY KEY (`id`));");

		$this->EE->db->query("CREATE TABLE IF NOT EXISTS `".$this->EE->db->dbprefix('safeharbor_hash')."` (
				`id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
				`site_id` INT(6) UNSIGNED NOT NULL,
				`hash` varchar(36) NOT NULL ,
			PRIMARY KEY (`id`));");

		$this->EE->db->query("CREATE TABLE IF NOT EXISTS `".$this->EE->db->dbprefix('safeharbor_settings')."` (
				`id` INT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
				`site_id` INT(6) NOT NULL,
				`auth_code` varchar(32) NOT NULL,
				`off_site_backup_auth_code` varchar(32) NOT NULL,
				`time_diff` int(2) NOT NULL ,
				`db_backup` varchar(32) NOT NULL,
				`notify_email_address` varchar(128) NOT NULL,
				`backup_time` varchar(32) NOT NULL,
				`backup_plan` varchar(128) NOT NULL,
				`time_saved` varchar(32) NOT NULL,
				`backup_space` varchar(32) NOT NULL,
				`backup_path` varchar(256) NOT NULL,
				`storage_path` varchar(256) NOT NULL,
				`transfer_type` varchar(5) NOT NULL,
				`disable_remote` int(1) NOT NULL,
				`amazon_s3_enabled` int(1) NOT NULL DEFAULT '0',
				`amazon_s3_access_key` varchar(256) NOT NULL,
				`amazon_s3_secret` varchar(256) NOT NULL,
				`ftp_enabled` int(1) NOT NULL DEFAULT '0',
				`ftp_username` varchar(20) NOT NULL,
				`ftp_password` varchar(256) NOT NULL,
				`ftp_host` varchar(128) NOT NULL,
				`ftp_port` int(5) NOT NULL,
				`ftp_path` varchar(256) NOT NULL,
			PRIMARY KEY (`id`),
			UNIQUE KEY (`site_id`));");

		$this->EE->db->query("CREATE TABLE IF NOT EXISTS `".$this->EE->db->dbprefix('safeharbor_indexes')."` (
				`id` INT(7) UNSIGNED NOT NULL AUTO_INCREMENT,
				`backup_id` INT(6) UNSIGNED NOT NULL,
				`file` varchar(512) NOT NULL,
			PRIMARY KEY (`id`));");

		$mcp = new Safeharbor_mcp();
		$mcp->create_dir_structure('', 1);

		return TRUE;
	}

	public function update( $current = '' )
	{
		if ($current == '' OR $current == $this->version)
		{
			return FALSE;
		}

		$this->EE->load->dbforge();

		if( $current < '1.2' )
		{
			$this->EE->db->query("CREATE TABLE IF NOT EXISTS `".$this->EE->db->dbprefix('safeharbor_indexes')."` (
					`id` INT(7) UNSIGNED NOT NULL AUTO_INCREMENT,
					`backup_id` INT(6) UNSIGNED NOT NULL,
					`file` varchar(512) NOT NULL ,
				PRIMARY KEY (`id`));");

			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN amazon_s3_enabled int(1) NOT NULL DEFAULT '0';");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN amazon_s3_access_key varchar(20) NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN amazon_s3_secret varchar(40) NOT NULL;");

			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_backups')."` ADD COLUMN transferred_amazon_s3 int(1) NOT NULL DEFAULT '0';");

			//go ahead and remove all indexes of backups that have expired
			$results = $this->EE->db->query("SELECT DISTINCT(exp_safeharbor_indexes.backup_id) as backup_id FROM `exp_safeharbor_backups` JOIN exp_safeharbor_indexes ON exp_safeharbor_backups.backup_id = exp_safeharbor_indexes.backup_id WHERE exp_safeharbor_backups.status = 'Purged'");
			$results = $results->result();

			foreach($results as $row)
			{
				$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $row->backup_id));
			}
		}

		if( $current < '1.3' )
		{
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN ftp_enabled int(1) NOT NULL DEFAULT '0';");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN ftp_username varchar(20) NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN ftp_password varchar(256) NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN ftp_host varchar(128) NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN ftp_port int(5) NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN ftp_path varchar(256) NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_backups')."` ADD COLUMN transferred_ftp int(1) NOT NULL DEFAULT '0';");
			
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN storage_path varchar(256) NOT NULL DEFAULT '0';");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_backups')."` ADD COLUMN note text NOT NULL;");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN disable_remote int(1) NOT NULL DEFAULT '0';");

			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` MODIFY amazon_s3_access_key varchar(256);");
			$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` MODIFY amazon_s3_secret varchar(256);");
			$this->EE->db->query("UPDATE `".$this->EE->db->dbprefix('actions')."` SET method='_backup_cron' WHERE class='Safeharbor' AND method='transfer_status'");
		}

		if( $current < '1.3.1') 
		{
			if( !$this->EE->db->field_exists('disable_remote', 'safeharbor_settings') )
				$this->EE->db->query("ALTER TABLE `".$this->EE->db->dbprefix('safeharbor_settings')."` ADD COLUMN disable_remote INT(1) NOT NULL DEFAULT '0';");
		}
		if( $current < '1.3.3') 
		{
			$this->EE->db->select('backup_id');
			$this->EE->db->from('safeharbor_backups');
			$this->EE->db->where('status', 'Purged');
			$results = $this->EE->db->get();
			$results = $results->result();

			foreach($results as $row)
			{
				$this->EE->db->delete('safeharbor_backups', array('backup_id' => $row->backup_id));
				$this->EE->db->delete('safeharbor_indexes', array('backup_id' => $row->backup_id));
			}
		}

		return TRUE;
	}

	public function uninstall()
	{
		// remove backups directory
		$mod = new Safeharbor ();
		$storage_path = $mod->_get_storage_path('base');
		$this->EE->functions->delete_directory($storage_path, TRUE);

		$this->EE->functions->delete_directory(APPPATH.'cache/safeharbor_backups/', TRUE);

		$module_id = $this->EE->db->query("SELECT module_id FROM ".$this->EE->db->dbprefix('modules')." WHERE module_name='Safeharbor' LIMIT 1");
		$module_id = $module_id->row('module_id');

		$this->EE->db->query("DELETE FROM ".$this->EE->db->dbprefix('module_member_groups')." WHERE module_id=$module_id");
		$this->EE->db->query("DELETE FROM ".$this->EE->db->dbprefix('modules')." WHERE module_name = 'Safeharbor'");

		$this->EE->db->query("DELETE FROM ".$this->EE->db->dbprefix('actions')." WHERE class='Safeharbor'");
		$this->EE->db->query("DELETE FROM ".$this->EE->db->dbprefix('actions')." WHERE class='Safeharbor_CP'");

		$this->EE->db->query("DROP TABLE IF EXISTS ".$this->EE->db->dbprefix('safeharbor_backups'));
		$this->EE->db->query("DROP TABLE IF EXISTS ".$this->EE->db->dbprefix('safeharbor_messages'));
		$this->EE->db->query("DROP TABLE IF EXISTS ".$this->EE->db->dbprefix('safeharbor_hash'));
		$this->EE->db->query("DROP TABLE IF EXISTS ".$this->EE->db->dbprefix('safeharbor_settings'));
		$this->EE->db->query("DROP TABLE IF EXISTS ".$this->EE->db->dbprefix('safeharbor_indexes'));

		return TRUE;
	}
}

/* End of File: upd.safeharbor.php */
