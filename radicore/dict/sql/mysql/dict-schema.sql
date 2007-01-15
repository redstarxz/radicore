-- phpMyAdmin SQL Dump
-- version 2.7.0
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 22, 2006 at 01:36 PM
-- Server version: 4.1.21
-- PHP Version: 4.4.4
-- 
-- Database: `dict`
-- 

CREATE DATABASE dict ;
USE dict ;

-- --------------------------------------------------------

-- 
-- Table structure for table `dict_column`
-- 

CREATE TABLE IF NOT EXISTS `dict_column` (
  `database_id` varchar(64) NOT NULL default '',
  `table_id` varchar(64) NOT NULL default '',
  `column_id` varchar(64) NOT NULL default '',
  `column_seq` smallint(6) unsigned NOT NULL default '0',
  `column_desc` varchar(255) NOT NULL default '',
  `col_comment` text,
  `col_type` varchar(20) NOT NULL default '',
  `col_type_native` varchar(32) NOT NULL default '',
  `col_array_type` varchar(20) default NULL,
  `col_values` text,
  `user_size` bigint(20) unsigned default NULL,
  `col_maxsize` bigint(20) unsigned default NULL,
  `col_null` char(1) NOT NULL default 'Y',
  `is_required` char(1) NOT NULL default 'N',
  `col_key` char(3) default NULL,
  `col_default` varchar(40) default NULL,
  `col_auto_increment` char(1) NOT NULL default 'N',
  `col_unsigned` char(1) NOT NULL default 'N',
  `col_zerofill_bwz` char(3) default NULL,
  `col_precision` tinyint(3) unsigned default NULL,
  `col_scale` tinyint(3) unsigned default NULL,
  `col_minvalue` double default NULL,
  `col_maxvalue` double default NULL,
  `user_minvalue` double default NULL,
  `user_maxvalue` double default NULL,
  `noedit_nodisplay` char(3) default NULL,
  `no_search` char(3) default NULL,
  `no_audit` char(3) default NULL,
  `upper_lowercase` varchar(5) default NULL,
  `is_password` char(1) NOT NULL default 'N',
  `auto_insert` char(1) NOT NULL default 'N',
  `auto_update` char(1) NOT NULL default 'N',
  `infinityisnull` char(1) NOT NULL default 'N',
  `col_subtype` varchar(10) default NULL,
  `image_width` smallint(6) unsigned default NULL,
  `image_height` smallint(5) unsigned default NULL,
  `is_boolean` char(1) NOT NULL default 'N',
  `boolean_true` varchar(4) default NULL,
  `boolean_false` varchar(4) default NULL,
  `control` varchar(10) default NULL,
  `optionlist` varchar(64) default NULL,
  `checkbox_label` varchar(64) default NULL,
  `task_id` varchar(64) default NULL,
  `foreign_field` varchar(64) default NULL,
  `align_hv` char(1) default NULL,
  `align_lr` char(1) default NULL,
  `multi_cols` tinyint(3) unsigned default NULL,
  `multi_rows` tinyint(3) unsigned default NULL,
  `custom_validation` varchar(255) default NULL,
  `created_date` datetime NOT NULL default '2000-01-01 00:00:00',
  `created_user` varchar(16) NOT NULL default 'UNKNOWN',
  `revised_date` datetime default NULL,
  `revised_user` varchar(16) default NULL,
  PRIMARY KEY  (`database_id`,`table_id`,`column_id`)
) TYPE=MyISAM COMMENT='Database Column Names';

-- --------------------------------------------------------

-- 
-- Table structure for table `dict_database`
-- 

CREATE TABLE IF NOT EXISTS `dict_database` (
  `database_id` varchar(64) NOT NULL default '',
  `database_desc` varchar(255) NOT NULL default '',
  `db_comment` text,
  `subsys_id` varchar(8) NOT NULL default '',
  `created_date` datetime NOT NULL default '2000-01-01 00:00:00',
  `created_user` varchar(16) NOT NULL default 'UNKNOWN',
  `revised_date` datetime default NULL,
  `revised_user` varchar(16) default NULL,
  PRIMARY KEY  (`database_id`)
) TYPE=MyISAM COMMENT='Database Names';

-- --------------------------------------------------------

-- 
-- Table structure for table `dict_related_column`
-- 

CREATE TABLE IF NOT EXISTS `dict_related_column` (
  `database_id_snr` varchar(64) NOT NULL default '',
  `table_id_snr` varchar(64) NOT NULL default '',
  `column_id_snr` varchar(64) NOT NULL default '',
  `database_id_jnr` varchar(64) NOT NULL default '',
  `table_id_jnr` varchar(64) NOT NULL default '',
  `seq_no` tinyint(3) unsigned NOT NULL default '0',
  `column_id_jnr` varchar(64) default NULL,
  `seq_in_index` tinyint(4) unsigned NOT NULL default '0',
  `created_date` datetime NOT NULL default '2000-01-01 00:00:00',
  `created_user` varchar(16) NOT NULL default 'UNKNOWN',
  `revised_date` datetime default NULL,
  `revised_user` varchar(16) default NULL,
  PRIMARY KEY  (`database_id_snr`,`table_id_snr`,`column_id_snr`,`database_id_jnr`,`table_id_jnr`,`seq_no`)
) TYPE=MyISAM COMMENT='Columns used in relationship';

-- --------------------------------------------------------

-- 
-- Table structure for table `dict_relationship`
-- 

CREATE TABLE IF NOT EXISTS `dict_relationship` (
  `database_id_snr` varchar(64) NOT NULL default '',
  `table_id_snr` varchar(64) NOT NULL default '',
  `database_id_jnr` varchar(64) NOT NULL default '',
  `table_id_jnr` varchar(64) NOT NULL default '',
  `seq_no` tinyint(3) unsigned NOT NULL default '0',
  `table_alias_snr` varchar(64) default NULL,
  `table_alias_jnr` varchar(64) default NULL,
  `relation_desc` varchar(255) default NULL,
  `rel_comment` text,
  `rel_type` char(3) NOT NULL default '',
  `orderby` varchar(64) default NULL,
  `parent_field` varchar(64) default NULL,
  `calc_field` varchar(255) default NULL,
  `created_date` datetime NOT NULL default '2000-01-01 00:00:00',
  `created_user` varchar(16) NOT NULL default 'UNKNOWN',
  `revised_date` datetime default NULL,
  `revised_user` varchar(16) default NULL,
  PRIMARY KEY  (`database_id_snr`,`table_id_snr`,`database_id_jnr`,`table_id_jnr`,`seq_no`)
) TYPE=MyISAM COMMENT='Database Table Relationships';

-- --------------------------------------------------------

-- 
-- Table structure for table `dict_table`
-- 

CREATE TABLE IF NOT EXISTS `dict_table` (
  `database_id` varchar(64) NOT NULL default '',
  `table_id` varchar(64) NOT NULL default '',
  `table_desc` varchar(255) NOT NULL default '',
  `tbl_comment` text,
  `audit_logging` char(1) NOT NULL default 'Y',
  `default_orderby` varchar(64) default NULL,
  `created_date` datetime NOT NULL default '2000-01-01 00:00:00',
  `created_user` varchar(16) NOT NULL default 'UNKNOWN',
  `revised_date` datetime default NULL,
  `revised_user` varchar(16) default NULL,
  PRIMARY KEY  (`database_id`,`table_id`)
) TYPE=MyISAM COMMENT='Database Table Names';

-- --------------------------------------------------------

-- 
-- Table structure for table `dict_table_key`
-- 

CREATE TABLE IF NOT EXISTS `dict_table_key` (
  `database_id` varchar(64) NOT NULL default '',
  `table_id` varchar(64) NOT NULL default '',
  `key_name` varchar(64) NOT NULL default '',
  `column_id` varchar(64) NOT NULL default '',
  `seq_in_index` tinyint(3) unsigned NOT NULL default '0',
  `is_unique` char(1) NOT NULL default 'N',
  `column_seq` tinyint(3) unsigned default NULL,
  `created_date` datetime NOT NULL default '2000-01-01 00:00:00',
  `created_user` varchar(16) NOT NULL default 'UNKNOWN',
  `revised_date` datetime default NULL,
  `revised_user` varchar(16) default NULL,
  PRIMARY KEY  (`database_id`,`table_id`,`key_name`,`column_id`)
) TYPE=MyISAM COMMENT='Database Table Keys';
