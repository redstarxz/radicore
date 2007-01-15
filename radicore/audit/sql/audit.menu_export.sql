-- file created on October 31, 2006, 10:02 am
    
REPLACE INTO `mnu_subsystem` (`subsys_id`, `subsys_desc`, `subsys_dir`, `task_prefix`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('AUDIT', 'Audit Trail', 'audit', 'audit_', '2003-01-01 12:00:00', 'AJM', '2006-04-22 09:38:17', 'AJM');

REPLACE INTO `mnu_role` (`role_id`, `role_desc`, `start_task_id`, `global_access`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'Demonstration Class', 'main_menu', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('DEV', 'Development', 'main_menu', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('GLOBAL', 'Global Access', 'main_menu', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('READONLY', 'Read Only', 'main_menu', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY', 'SURVEY (supervisor)', 'main_menu', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'SURVEY (user)', 'survey', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('USER1', 'User Class 1', 'proto', 'N', '2003-01-01 12:00:00', 'AJM', '2005-07-31 14:59:56', 'AJM'),
('USER2', 'User Class 2', 'main_menu', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('USER3', 'User Class 3', 'main_menu', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(del)', 'Delete Audit Detail', 'Delete', 'PROC', 'audit_dtl_del.php', 'N', 'DEL4', 'AUDIT', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'N', '2006-03-20 15:29:33', 'AJM', '2006-03-20 16:50:22', 'AJM');

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(list)2', 'List Audit Details', 'List Audit', 'PROC', 'audit_dtl_list2.php', 'N', 'LIST2', 'AUDIT', 'audit_dtl(search)', NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'N', '2003-01-01 12:00:00', 'AJM', '2006-10-14 18:29:42', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(list)2', 'audit_dtl(del)', '001', 'Delete', 'N', '2006-03-20 15:39:54', 'AJM', '2006-03-20 15:41:57', 'AJM'),
('audit_dtl(list)2', 'audit_dtl(search)', '002', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', '2006-03-20 15:40:05', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'audit_dtl(list)2', '2005-04-19 18:09:05', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(list)3', 'List Audit Details for an Object', 'Audit Trail', 'PROC', 'audit_dtl_list3.php', 'N', 'LIST3', 'AUDIT', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'N', '2004-04-08 16:25:44', 'AJM', '2006-01-18 18:04:09', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'audit_dtl(list)3', '2005-04-19 18:09:05', 'AJM', NULL, NULL),
('DEV', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('GLOBAL', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('READONLY', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('SURVEY', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('SURVEY1', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('USER1', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('USER2', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL),
('USER3', 'audit_dtl(list)3', '2005-05-02 10:16:34', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(list)3exact', 'List Audit Details for an Object (exact match)', 'Audit Trail', 'PROC', 'audit_dtl_list3.php', 'N', 'LIST3', 'AUDIT', NULL, NULL, NULL, 'pattern=exact', NULL, 'N', 'N', NULL, 'N', '2004-07-21 16:54:14', 'AJM', '2006-06-20 14:53:08', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'audit_dtl(list)3exact', '2005-04-19 18:09:05', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(search)', 'Search Audit Detail', 'Search', 'PROC', 'audit_dtl_search.php', 'N', 'SRCH', 'AUDIT', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'N', '2003-01-01 12:00:00', 'AJM', '2006-01-17 20:28:38', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'audit_dtl(search)', '2005-04-19 18:09:05', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_logon_errors(list)', 'List Logon Errors', 'Logon Errors', 'PROC', 'audit_logon_errors_list.php', 'N', 'LIST1', 'AUDIT', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'N', '2006-03-08 14:52:07', 'AJM', NULL, NULL);

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_logon_errors(list)', 'audit_logon_errors(search)', '001', 'Search', 'N', '2006-03-08 15:27:28', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'audit_logon_errors(list)', '2006-04-07 14:24:33', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `pattern_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `log_sql_query`, `screen_refresh`, `use_https`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_logon_errors(search)', 'Search Logon Errors', 'Search', 'PROC', 'audit_logon_errors_search.php', 'N', 'SRCH', 'AUDIT', NULL, NULL, NULL, NULL, NULL, 'N', 'N', NULL, 'N', '2006-03-08 15:27:14', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'audit_logon_errors(search)', '2006-04-07 14:24:33', 'AJM', NULL, NULL);

REPLACE INTO `mnu_menu` (`menu_id`, `task_id_jnr`, `sort_seq`, `button_text`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('main_menu', 'audit_dtl(list)2', '004', 'Audit', '2003-01-01 12:00:00', 'AJM', '2005-06-12 12:17:52', 'AJM');

REPLACE INTO `help_text` (`task_id`, `help_text`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('audit_dtl(list)2', 'This will list entries from the Audit Log.

Refer to <a href=\"%root%/audit_dtl(list)2.html\">List Audit Details</a> for full details.', '2005-06-29 12:41:45', 'AJM', '2005-07-02 15:33:45', 'AJM'),
('audit_dtl(list)3', 'This will allow the contents of the Audit Log to be viewed for selected objects.

This version will select those Audit Log entries where the the primary key of the selected object is contained with the PKEY value of the audited occurrence. This will include entries from subordinate (child) tables which contain the same field names within their primary keys.

Refer to <a href=\"%root%/audit_dtl(list)3.html\">List Audit Details for a selected Object</a> for full details.', '2005-06-29 13:03:54', 'AJM', '2005-07-02 15:33:52', 'AJM'),
('audit_dtl(list)3exact', 'This will allow the contents of the Audit Log to be viewed for selected objects.

This version will select only those Audit Log entries where the the primary key of the selected object is as exact match with the PKEY value of the audited occurrence. 

Refer to <a href=\"%root%/audit_dtl(list)3.html\">List Audit Details for a selected Object</a> for full details.', '2005-06-29 16:17:59', 'AJM', '2005-07-02 15:34:01', 'AJM'),
('audit_dtl(search)', 'This will allow selection criteria to be entered before passing control back to the List Audit Detail screen.

Refer to <a href=\"%root%/audit_dtl(search).html\">Search Audit Details</a> for full details.', '2005-06-29 12:37:59', 'AJM', '2005-07-02 15:34:07', 'AJM'),
('audit_logon_errors(list)', 'This will show the details of any logon attemps which failed.

Refer to <a href=\"%root%/audit_logon_errors(list).html\">List Logon Errors</a> for full details.', '2006-04-07 11:26:07', 'AJM', NULL, NULL);

-- finished
