<?php if ( ! defined('EXT')) exit('No direct script access allowed');

 /**
 * Solspace - Super Search
 *
 * @package		Solspace:Super Search
 * @author		Solspace DevTeam
 * @copyright	Copyright (c) 2009-2012, Solspace, Inc.
 * @link		http://www.solspace.com/docs/addon/c/Super_Search/
 * @version		2.0.5
 * @filesource	./system/expressionengine/third_party/super_search/
 */

 /**
 * Super Search Module Class - Updater
 *
 * Installs, deinstalls, updates
 *
 * @package		Solspace:Super Search
 * @author		Solspace DevTeam
 * @filesource	./system/expressionengine/third_party/super_search/upd.super_search.php
 */

if ( ! defined('APP_VER')) define('APP_VER', '2.0'); // EE 2.0's Wizard doesn't like CONSTANTs

require_once 'addon_builder/module_builder.php';

class Super_search_upd extends Module_builder_super_search
{
	public $actions			= array();
	public $hooks				= array();

	// --------------------------------------------------------------------

	/**
	 * Contructor
	 *
	 * @access	public
	 * @return	null
	 */

	function __construct ()
	{
		parent::Module_builder_super_search('super_search');

		// --------------------------------------------
		//  Module Actions
		// --------------------------------------------

		$this->module_actions = explode('|', SUPER_SEARCH_ACTIONS);

		// --------------------------------------------
		//  Extension Hooks
		// --------------------------------------------

		$this->default_settings = array();

		$default = array(
			'class'			=> $this->extension_name,
			'settings'		=> '',
			'priority'		=> 10,
			'version'		=> SUPER_SEARCH_VERSION,
			'enabled'		=> 'y'
		);

		$this->hooks = array(
			array_merge(
				$default,
				array(
					'method'	=> 'entry_submission_absolute_end',
					'hook'		=> 'entry_submission_absolute_end'
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'channel_entries_query_result',
					'hook'		=> 'channel_entries_query_result'
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'refresh_cache_from_template',
					'hook'		=> 'edit_template_end'
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'refresh_cache_from_weblog',
					'hook'		=> 'submit_new_entry_end'
				)
			),

			//	EE 2 version of 'submit_new_entry_end'
			array_merge(
				$default,
				array(
					'method'	=> 'refresh_cache_from_weblog',
					'hook'		=> 'entry_submission_end'
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'refresh_cache_from_category',
					'hook'		=> 'publish_admin_update_category'
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'sessions_end_processor',
					'hook'		=> 'sessions_end'
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_alter_search_check_group',
					'hook'		=> 'super_search_alter_search',
					'priority'	=> 5
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_alter_search_multiselect',
					'hook'		=> 'super_search_alter_search',
					'priority'	=> 6
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_alter_search_playa',
					'hook'		=> 'super_search_alter_search',
					'priority'	=> 7
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_alter_search_relationship',
					'hook'		=> 'super_search_alter_search',
					'priority'	=> 4
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_extra_basic_fields_tag',
					'hook'		=> 'super_search_extra_basic_fields',
					'priority'	=> 5
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_alter_ids_tag',
					'hook'		=> 'super_search_alter_ids',
					'priority'	=> 5
				)
			),
			array_merge(
				$default,
				array(
					'method'	=> 'super_search_do_search_and_array_playa',
					'hook'		=> 'super_search_do_search_and_array',
					'priority'	=> 5
				)
			),
		);
	}

	//	END

	// --------------------------------------------------------------------

	/**
	 * Module Installer
	 *
	 * @access	public
	 * @return	bool
	 */

	function install()
	{
		// Already installed, let's not install again.
		if ($this->database_version() !== FALSE)
		{
			return FALSE;
		}

		// --------------------------------------------
		//  Our Default Install
		// --------------------------------------------

		if ($this->default_module_install() == FALSE)
		{
			return FALSE;
		}

		// --------------------------------------------
		//  Set default cache prefs
		// --------------------------------------------

		$this->data->set_default_cache_prefs();

		// --------------------------------------------
		//  Set default super search prefs
		// --------------------------------------------

		$this->data->set_default_search_preferences();

		// --------------------------------------------
		//  Module Install
		// --------------------------------------------

		$data = array(	'module_name'			=> $this->class_name,
						'module_version'		=> constant(strtoupper($this->lower_name).'_VERSION'),
						'has_publish_fields'	=> 'y',
						'has_cp_backend'		=> 'y');

		if (APP_VER < 2.0)
		{
			unset($data['has_publish_fields']);
		}

		$sql[] = ee()->db->insert_string('exp_modules', $data);

		// --------------------------------------------
		// Create the levenshtein mysql level function
		// --------------------------------------------

		//be safe
		$sql[] = "DROP FUNCTION IF EXISTS LEVENSHTEIN;";

		//install it
		$sql[] = $this->data->define_levenshtein();

		foreach ($sql as $query)
		{
			ee()->db->query($query);
		}

		// --------------------------------------------
		//	Show silly ass flash message for no earthly reason.
		// --------------------------------------------

		if (APP_VER >= 2.0)
		{
			ee()->session->set_flashdata( 'message_success', ee()->lang->line( 'module_has_been_installed' ) . NBS . ee()->lang->line( 'super_search_module_name' ) );
		}

		return TRUE;
	}

	// END install()

	// --------------------------------------------------------------------

	/**
	 * Module Uninstaller
	 *
	 * @access	public
	 * @return	bool
	 */

	function uninstall()
	{
		// Cannot uninstall what does not exist, right?
		if ($this->database_version() === FALSE)
		{
			return FALSE;
		}

		// --------------------------------------------
		//  Default Module Uninstall
		// --------------------------------------------

		if ($this->default_module_uninstall() == FALSE)
		{
			return FALSE;
		}

		// --------------------------------------------
		//	Show silly ass flash message for no earthly reason.
		// --------------------------------------------

		if (APP_VER >= 2.0)
		{
			ee()->session->set_flashdata( 'message_success', ee()->lang->line( 'module_has_been_removed' ) . NBS . ee()->lang->line( 'super_search_module_name' ) );
		}

		return TRUE;
	}

	//	END uninstall

	// --------------------------------------------------------------------

	/**
	 * Module Updater
	 *
	 * @access	public
	 * @return	bool
	 */

	function update()
	{
		// --------------------------------------------
		//  ExpressionEngine 2.x attempts to do automatic updates.
		//		- Mitchell questioned clients/customers and discovered that the majority preferred to update
		//		themselves, especially on higher traffic sites. So, we forbid EE 2.x from doing updates
		//		unless it comes through our update form.
		// --------------------------------------------

		if ( ! isset($_POST['run_update']) OR $_POST['run_update'] != 'y')
		{
			return FALSE;
		}

		// --------------------------------------------
		//  Do DB work
		// --------------------------------------------

		if ( ! file_exists($this->addon_path.strtolower($this->lower_name).'.sql'))
		{
			return FALSE;
		}

		$sql = preg_split("/;;\s*(\n+|$)/", file_get_contents($this->addon_path.strtolower($this->lower_name).'.sql'), -1, PREG_SPLIT_NO_EMPTY);

		if (sizeof($sql) == 0)
		{
			return FALSE;
		}

		foreach($sql as $i => $query)
		{
			$sql[$i] = trim($query);
		}

		// --------------------------------------------
		//  Super Search History needs a query field
		// --------------------------------------------

		if ( $this->column_exists( 'query', 'exp_super_search_history' ) === FALSE )
		{
			$sql[]	= "ALTER TABLE exp_super_search_history ADD `query` mediumtext NOT NULL";
		}

		// --------------------------------------------
		//  Super Search History needs a query field
		// --------------------------------------------

		if ( $this->column_exists( 'hash', 'exp_super_search_history' ) === FALSE )
		{
			$sql[]	= "ALTER TABLE exp_super_search_history ADD `hash` varchar(32) NOT NULL";
		}

		// --------------------------------------------
		//  Super Search History needs a unique key for some insert magic
		// --------------------------------------------

		if ( ee()->db->table_exists('exp_super_search_history') === TRUE )
		{
			$query	= ee()->db->query( "SHOW indexes FROM exp_super_search_history WHERE Key_name = 'search_key'" );

			if ( $query->num_rows() == 0 )
			{
				$sql[]	= "ALTER TABLE `exp_super_search_history` ADD UNIQUE KEY `search_key` (`member_id`,`cookie_id`,`site_id`,`search_name`,`saved`)";
			}
		}

		// --------------------------------------------
		//	Change the name of the weblog_id field to channel_id
		// --------------------------------------------

		if ( $this->version_compare($this->database_version(), '<', '1.1.0.b3') )
		{
			$sql[]	= "ALTER TABLE exp_super_search_refresh_rules CHANGE `weblog_id` `channel_id` int(10) unsigned NOT NULL default '0'";
		}

		// --------------------------------------------
		//	Change the name of the weblog_id field to channel_id
		// --------------------------------------------

		if ( ee()->db->table_exists('exp_super_search_preferences') === FALSE)
		{
			$module_install_sql = file_get_contents($this->addon_path . strtolower($this->lower_name) . '.sql');

			//gets JUST the prefs table from the sql

			$prefs_table = stristr(
				$module_install_sql,
				"CREATE TABLE IF NOT EXISTS `exp_super_search_preferences`"
			);

			$prefs_table = substr($prefs_table, 0, stripos($prefs_table, ';;'));

			//install it
			$sql[] = $prefs_table;
		}



		// --------------------------------------------
		// Create the log table if it doesn't exist
		// --------------------------------------------

		if ( ee()->db->table_exists('exp_super_search_log') === FALSE)
		{
			$module_install_sql = file_get_contents($this->addon_path . strtolower($this->lower_name) . '.sql');

			//gets JUST the prefs table from the sql

			$prefs_table = stristr(
				$module_install_sql,
				"CREATE TABLE IF NOT EXISTS `exp_super_search_log`"
			);

			$prefs_table = substr($prefs_table, 0, stripos($prefs_table, ';;'));

			//install it
			$sql[] = $prefs_table;
		}

		// --------------------------------------------
		// Create the terms table if it doesn't exist
		// --------------------------------------------

		if ( ee()->db->table_exists('exp_super_search_terms') === FALSE)
		{
			$module_install_sql = file_get_contents($this->addon_path . strtolower($this->lower_name) . '.sql');

			//gets JUST the prefs table from the sql

			$prefs_table = stristr(
				$module_install_sql,
				"CREATE TABLE IF NOT EXISTS `exp_super_search_terms`"
			);

			$prefs_table = substr($prefs_table, 0, stripos($prefs_table, ';;'));

			//install it
			$sql[] = $prefs_table;

			// --------------------------------------------
			// Create the levenshtein mysql level function
			// --------------------------------------------

			//be safe
			$sql[] = "DROP FUNCTION IF EXISTS LEVENSHTEIN;";

			//install it
			$sql[] = $this->data->define_levenshtein();

			// Set our inital word list contents
			$this->data->set_preference( array('ignore_word_list' => 'a||and||of||or||the' ));
		}


		// --------------------------------------------
		// Add the term_length col to the search lexicon table
		// --------------------------------------------

		if ( $this->version_compare($this->database_version(), '<', '2.0.0.b3') )
		{
			if ( ee()->db->table_exists('exp_super_search_terms') === TRUE )
			{
				if ( $this->column_exists( 'term_length', 'exp_super_search_terms', FALSE ) === FALSE )
				{
					$sql[]	= "ALTER TABLE exp_super_search_terms ADD `term_length` int(10) unsigned NOT NULL default '0'";
				}
			}
		}

		// --------------------------------------------
		//  Run module SQL - dependent on CREATE TABLE IF NOT EXISTS syntax
		// --------------------------------------------

		foreach ($sql as $query)
		{
			if( $query != '' ) ee()->db->query($query);
		}

		// --------------------------------------------
		//  Set default cache prefs
		// --------------------------------------------

		// $this->data->set_default_cache_prefs();

		// --------------------------------------------
		//  Set default super search prefs
		// --------------------------------------------

		// $this->data->set_default_search_preferences();

		// --------------------------------------------
		//  Default Module Update
		// --------------------------------------------

		$this->default_module_update();

		// --------------------------------------------
		//  Version Number Update - LAST!
		// --------------------------------------------

		ee()->db->query(
			ee()->db->update_string(
				'exp_modules',
				array('module_version'	=> SUPER_SEARCH_VERSION),
				array('module_name'		=> $this->class_name)
			)
		);

		return TRUE;
	}
	//	END update()
}
//END Super_search_upd