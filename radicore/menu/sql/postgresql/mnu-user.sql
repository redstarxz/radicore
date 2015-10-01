SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path TO "menu";

--
-- Dumping data for table mnu_user
--

INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('AJM', 'Tony Marston', 'N0GxJ{(,:aR9]lDE', NULL, '2006-03-08', '22:13:50', 1684, 'Y', 'N', '2014-04-22', '05:17:52', NULL, '2003-01-01', '9999-12-31', '127.0.0.1', 'tony@marston-home.demon.co.uk', 'tony.marston', 'N', 98, NULL, '2003-01-01 12:00:00', 'AJM', '2014-04-20 10:54:53', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('DEMO', 'Demo User', '~n:.^#l::y(@SGu!', NULL, '2009-07-22', '00:49:59', 58, 'Y', 'N', '2014-04-20', '13:16:28', NULL, '2003-01-01', '9999-12-31', '127.0.0.1', NULL, NULL, 'N', NULL, NULL, '2003-01-01 12:00:00', 'AJM', '2014-04-19 12:00:04', 'DEMO');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('FB', 'Fred Bloggs', ';Rc_Gx(3~XPrAZCD', NULL, '2006-02-01', '20:10:05', 10, 'N', 'N', '2006-03-08', '22:12:49', NULL, '2003-01-01', '9999-12-31', '127.0.0.1', NULL, NULL, 'N', NULL, NULL, '2003-01-01 12:00:00', 'AJM', '2009-07-29 14:51:42', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('JS', 'Joe Soap', ';,SA1Qo08{(lk.Y-', NULL, '2004-08-01', '16:50:10', 0, 'N', 'N', NULL, NULL, NULL, '2003-01-01', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2003-01-01 12:00:00', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('MANAGER', 'Manager', 'Y3YP&CWh;HW+5N', NULL, '2004-08-01', '16:50:42', 0, 'N', 'N', NULL, NULL, NULL, '2003-01-01', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2003-01-01 12:00:00', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('MGR', 'MGR', 'Nz-3jN6+lK@Ii^DE', NULL, '2004-08-01', '16:51:04', 10, 'N', 'N', '2005-11-02', '18:57:11', NULL, '2003-01-01', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2003-01-01 12:00:00', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('SURVEY', 'SURVEY (supervisor)', '+wwjJMgFAuJ(1$qS', NULL, '2004-08-01', '16:52:09', 0, 'N', 'N', '2003-10-09', '19:24:40', NULL, '2003-01-01', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2003-01-01 12:00:00', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('USER1', 'user1', '$Y/R7/=t8_W98TI(', NULL, '2005-07-31', '15:10:17', 1, 'N', 'N', '2005-07-31', '15:10:52', NULL, '2005-07-31', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2005-07-31 15:10:17', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('USER2', 'user2', '$Y/R7uD,DS=6R,a?', NULL, '2005-07-31', '15:10:32', 1, 'N', 'N', '2005-07-31', '15:11:06', NULL, '2005-07-31', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2005-07-31 15:10:32', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('USER3', 'user3', '$Y/R75pZ~Uy#iyF=', NULL, '2005-07-31', '15:10:45', 1, 'N', 'N', '2005-07-31', '15:12:38', NULL, '2005-07-31', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2005-07-31 15:10:45', 'AJM', '2005-11-02 18:05:54', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('VPD', 'VPD', 'NUu$BBOW?;bBpk7', 2, '2007-09-13', '17:53:24', 14, 'Y', 'N', '2007-09-18', '11:46:49', NULL, '2007-09-13', '9999-12-31', '127.0.0.1', NULL, NULL, 'N', NULL, NULL, '2007-09-13 17:53:24', 'AJM', '2009-01-19 12:14:16', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('VPD2', 'VPD2', 'v5qiJNNw6EpwgUxn', 2, '2009-07-11', '10:30:36', 7, 'Y', 'N', '2009-08-17', '14:44:35', NULL, '2009-07-10', '9999-12-31', '127.0.0.1', NULL, NULL, 'N', NULL, NULL, '2009-07-10 13:35:19', 'AJM', '2009-07-11 10:30:36', 'AJM');
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('VPD2A', 'VPD2a', '$nKyd39nT%mzlq=_', 2, '2009-07-14', '10:43:11', 0, 'N', 'N', NULL, NULL, NULL, '2009-07-14', '9999-12-31', NULL, NULL, NULL, 'N', NULL, NULL, '2009-07-14 10:43:11', 'VPD2', NULL, NULL);
INSERT INTO mnu_user (user_id, user_name, user_password, rdcaccount_id, pswd_chg_date, pswd_chg_time, pswd_count, in_use, is_disabled, logon_date, logon_time, language_id, start_date, end_date, ip_address, email_addr, external_id, is_external_auth_off, party_id, user_timezone, created_date, created_user, revised_date, revised_user) VALUES('VPD3', 'VPD3', 'v5q$5MC3+7!21QvP', 3, '2009-07-14', '10:41:32', 1, 'Y', 'N', '2009-08-17', '13:29:56', NULL, '2009-07-14', '9999-12-31', '127.0.0.1', NULL, NULL, 'N', NULL, NULL, '2009-07-14 10:41:32', 'AJM', '2009-07-14 10:41:50', 'AJM');

--
-- Dumping data for table mnu_user_role
--

INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('AJM', 'GLOBAL', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('DEMO', 'AUDIT', 'N', '2014-04-19 12:24:18', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('DEMO', 'WORKFLOW-RO', 'N', '2014-04-20 12:50:47', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('MANAGER', 'GLOBAL', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('MGR', 'GLOBAL', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('JS', 'MENU-RO', 'N', '2014-04-20 11:55:33', 'AJM', '2014-04-24 05:13:07', 'AJM');
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('SURVEY', 'SURVEY', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('VPD', 'GLOBAL', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('VPD2', 'GLOBAL', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('VPD2A', 'DEMO', 'Y', '2014-04-17 00:00:00', 'VPD2', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('VPD3', 'GLOBAL', 'Y', '2014-04-17 00:00:00', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('FB', 'MENU-RO', 'N', '2014-04-20 11:53:09', 'AJM', '2014-04-24 05:12:35', 'AJM');
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('DEMO', 'MENU-RO', 'N', '2014-04-19 08:51:13', 'AJM', '2014-04-24 05:12:02', 'AJM');
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('FB', 'AUDIT', 'N', '2014-04-20 11:53:24', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('FB', 'DEMO', 'Y', '2014-04-24 05:12:35', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('DEMO', 'DICT-RO', 'N', '2014-04-19 12:24:30', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('FB', 'WORKFLOW-RO', 'N', '2014-04-20 12:51:57', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('FB', 'DICT-RO', 'N', '2014-04-20 11:53:44', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('USER1', 'USER', 'Y', '2014-04-20 10:56:58', 'AJM', '2014-04-20 10:57:23', 'AJM');
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('USER2', 'USER', 'Y', '2014-04-20 10:57:56', 'AJM', '2014-04-20 11:02:04', 'AJM');
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('USER3', 'USER', 'Y', '2014-04-20 10:58:23', 'AJM', '2014-04-20 11:02:18', 'AJM');
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('JS', 'DEMO', 'Y', '2014-04-24 05:13:06', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('JS', 'WORKFLOW-RO', 'N', '2014-04-20 12:52:49', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('JS', 'DICT-RO', 'N', '2014-04-20 11:55:48', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('JS', 'AUDIT', 'N', '2014-04-20 11:56:02', 'AJM', NULL, NULL);
INSERT INTO mnu_user_role (user_id, role_id, is_primary, created_date, created_user, revised_date, revised_user) VALUES('DEMO', 'DEMO', 'Y', '2014-04-24 05:12:01', 'AJM', NULL, NULL);

-- finished