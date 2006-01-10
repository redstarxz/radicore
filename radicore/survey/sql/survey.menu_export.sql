-- file created on January 10, 2006, 6:37 pm
    
REPLACE INTO `mnu_subsystem` (`subsys_id`, `subsys_desc`, `subsys_dir`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'Survey/Questionnaire System', 'survey', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(add)', 'Add Answer Option', 'Insert', 'PROC', 'answer_option_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_answer_option(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(del)', 'Delete Answer Option', 'Delete', 'PROC', 'answer_option_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_answer_option(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(enq)', 'Enquire Answer Option', 'Enquire', 'PROC', 'answer_option_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_answer_option(enq)', '2005-04-19 18:48:31', 'AJM', NULL, NULL),
('SURVEY', 'srv_answer_option(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_answer_option(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(list)', 'List Answer Options', 'List Answers', 'PROC', 'answer_option_list.php', 'N', 'LIST2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:13:54', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(list)', 'srv_answer_option(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(list)', 'srv_answer_option(quick)', '002', 'Quick Setup', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(list)', 'srv_answer_option(enq)', '003', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(list)', 'srv_answer_option(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(list)', 'srv_answer_option(upd)', '005', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(list)', 'srv_answer_option(search)', '006', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(list)', 'audit_dtl(list)3', '007', 'Audit Trail', 'Y', '2004-04-09 12:01:21', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_answer_option(list)', '2005-04-19 18:48:31', 'AJM', NULL, NULL),
('SURVEY', 'srv_answer_option(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_answer_option(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(multi)', 'Maintain Answer Options', 'Maintain Answers', 'PROC', 'answer_option_multi.php', 'N', 'MULTI2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2005-06-24 17:30:34', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(multi)', 'srv_answer_option(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(multi)', 'srv_answer_option(quick)', '002', 'Quick Setup', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_answer_option(multi)', 'srv_answer_option(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_answer_option(multi)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(quick)', 'Answer Option Quick Setup', 'Quick Setup', 'PROC', 'answer_option_quick.php', 'N', 'ADD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_answer_option(quick)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(search)', 'Search Answer Option', 'Search', 'PROC', 'answer_option_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_answer_option(search)', '2005-04-19 18:48:31', 'AJM', NULL, NULL),
('SURVEY', 'srv_answer_option(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_answer_option(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_answer_option(upd)', 'Update Answer Option', 'Update', 'PROC', 'answer_option_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_answer_option(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset(add)', 'Add Asset to Tree Structure', 'Add Asset', 'PROC', 'tree_node_asset_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_asset(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(add)', 'Add Asset Type', 'Insert', 'PROC', 'asset_type_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_asset_type(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(del)', 'Delete Asset Type', 'Delete', 'PROC', 'asset_type_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_asset_type(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(enq)', 'Enquire Asset Type', 'Enquire', 'PROC', 'asset_type_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_asset_type(enq)', '2005-04-19 18:48:42', 'AJM', NULL, NULL),
('SURVEY', 'srv_asset_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_asset_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(list)', 'List Asset Type', 'Asset Type', 'PROC', 'asset_type_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:12:38', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(list)', 'srv_asset_type(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_asset_type(list)', 'srv_asset_type(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_asset_type(list)', 'srv_asset_type(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_asset_type(list)', 'srv_asset_type(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_asset_type(list)', 'srv_asset_type(search)', '005', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_asset_type(list)', 'audit_dtl(list)3', '006', 'Audit Trail', 'Y', '2004-04-09 11:56:11', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_asset_type(list)', '2005-04-19 18:48:42', 'AJM', NULL, NULL),
('SURVEY', 'srv_asset_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_asset_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(search)', 'Search Asset Type', 'Search', 'PROC', 'asset_type_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_asset_type(search)', '2005-04-19 18:48:42', 'AJM', NULL, NULL),
('SURVEY', 'srv_asset_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_asset_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_asset_type(upd)', 'Update Asset Type', 'Update', 'PROC', 'asset_type_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_asset_type(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(add)', 'Add Default Prompt', 'Insert', 'PROC', 'default_prompt_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_default_prompt(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(del)', 'Delete Default Prompt', 'Delete', 'PROC', 'default_prompt_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_default_prompt(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(enq)', 'Enquire Default Prompt', 'Enquire', 'PROC', 'default_prompt_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_default_prompt(enq)', '2005-04-19 18:48:42', 'AJM', NULL, NULL),
('SURVEY', 'srv_default_prompt(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_default_prompt(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(list)', 'List Default Prompt', 'Default Prompts', 'PROC', 'default_prompt_list.php', 'N', 'LIST2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:14:00', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(list)', 'srv_default_prompt(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_default_prompt(list)', 'srv_default_prompt(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_default_prompt(list)', 'srv_default_prompt(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_default_prompt(list)', 'srv_default_prompt(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_default_prompt(list)', 'srv_default_prompt(search)', '005', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_default_prompt(list)', 'audit_dtl(list)3', '006', 'Audit Trail', 'Y', '2004-04-09 12:01:28', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_default_prompt(list)', '2005-04-19 18:48:43', 'AJM', NULL, NULL),
('SURVEY', 'srv_default_prompt(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_default_prompt(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(popup)', 'Choose Default Prompt', 'Choose', 'PROC', 'default_prompt_popup.php', 'N', 'POPUP', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_default_prompt(popup)', '2005-04-19 18:48:43', 'AJM', NULL, NULL),
('SURVEY', 'srv_default_prompt(popup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_default_prompt(popup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(search)', 'Search Default Prompt', 'Search', 'PROC', 'default_prompt_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_default_prompt(search)', '2005-04-19 18:48:55', 'AJM', NULL, NULL),
('SURVEY', 'srv_default_prompt(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_default_prompt(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_default_prompt(upd)', 'Update Default Prompt', 'Update', 'PROC', 'default_prompt_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_default_prompt(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_filepicker', 'File Picker', 'File Picker', 'PROC', 'filepicker.php', 'N', 'FILEPICKER', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_filepicker', '2005-04-19 18:48:55', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location(add)', 'Add Location to Tree Structure', 'Add Location', 'PROC', 'tree_node_location_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_location(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(add)', 'Add Location Type', 'Insert', 'PROC', 'location_type_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_location_type(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(del)', 'Delete Location Type', 'Delete', 'PROC', 'location_type_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_location_type(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(enq)', 'Enquire Location Type', 'Enquire', 'PROC', 'location_type_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_location_type(enq)', '2005-04-19 18:48:55', 'AJM', NULL, NULL),
('SURVEY', 'srv_location_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_location_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(list)', 'List Location Type', 'Location Type', 'PROC', 'location_type_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:12:49', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(list)', 'srv_location_type(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_location_type(list)', 'srv_location_type(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_location_type(list)', 'srv_location_type(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_location_type(list)', 'srv_location_type(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_location_type(list)', 'srv_location_type(search)', '005', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_location_type(list)', 'audit_dtl(list)3', '006', 'Audit Trail', 'Y', '2004-04-09 11:56:19', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_location_type(list)', '2005-04-19 18:48:55', 'AJM', NULL, NULL),
('SURVEY', 'srv_location_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_location_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(search)', 'Search Location Type', 'Search', 'PROC', 'location_type_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_location_type(search)', '2005-04-19 18:48:55', 'AJM', NULL, NULL),
('SURVEY', 'srv_location_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_location_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_location_type(upd)', 'Update Location Type', 'Update', 'PROC', 'location_type_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_location_type(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_number_option(multi)', 'Update Number Option', 'Number Option', 'PROC', 'number_option_multi.php', 'N', 'MULTI1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2005-06-24 17:31:45', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_number_option(multi)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_organisation(add)', 'Add Organisation to Tree Structure', 'Add Organisation', 'PROC', 'tree_node_organisation_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_organisation(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(add)', 'Add Organisation Type', 'Insert', 'PROC', 'org_type_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_org_type(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(del)', 'Delete Organisation Type', 'Delete', 'PROC', 'org_type_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_org_type(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(enq)', 'Enquire Organisation Type', 'Enquire', 'PROC', 'org_type_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_org_type(enq)', '2005-04-19 18:49:06', 'AJM', NULL, NULL),
('SURVEY', 'srv_org_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_org_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(list)', 'List Organisation Type', 'Organisation Type', 'PROC', 'org_type_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:12:54', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(list)', 'srv_org_type(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_org_type(list)', 'srv_org_type(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_org_type(list)', 'srv_org_type(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_org_type(list)', 'srv_org_type(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_org_type(list)', 'srv_org_type(search)', '005', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_org_type(list)', 'audit_dtl(list)3', '006', 'Audit Trail', 'Y', '2004-04-09 11:56:27', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_org_type(list)', '2005-04-19 18:49:06', 'AJM', NULL, NULL),
('SURVEY', 'srv_org_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_org_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(search)', 'Search Organisation Type', 'Search', 'PROC', 'org_type_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_org_type(search)', '2005-04-19 18:49:06', 'AJM', NULL, NULL),
('SURVEY', 'srv_org_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_org_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_org_type(upd)', 'Update Organisation Type', 'Update', 'PROC', 'org_type_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_org_type(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_question_prompt(add)', 'Add Question Prompt', 'Insert', 'PROC', 'question_prompt_add.php', 'N', 'ADD3', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_question_prompt(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_question_prompt(del)', 'Delete Question Prompt', 'Delete', 'PROC', 'question_prompt_del.php', 'N', 'DEL2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_question_prompt(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_question_prompt(link)', 'Maintain Question Prompts', 'Question Prompts', 'PROC', 'question_prompt_link.php', 'N', 'LINK1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_question_prompt(link)', 'srv_default_prompt(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_question_prompt(link)', 'srv_default_prompt(search)', '002', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_question_prompt(link)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_question_prompt(list)', 'List Question Prompts', 'List Prompts', 'PROC', 'question_prompt_list.php', 'N', 'LIST2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:14:05', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_question_prompt(list)', 'srv_question_prompt(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_question_prompt(list)', 'srv_question_prompt(del)', '002', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_question_prompt(list)', 'srv_default_prompt(search)', '003', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_question_prompt(list)', 'audit_dtl(list)3', '004', 'Audit Trail', 'Y', '2004-04-09 12:01:36', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_question_prompt(list)', '2005-04-19 18:49:15', 'AJM', NULL, NULL),
('SURVEY', 'srv_question_prompt(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_question_prompt(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(add)', 'Add Risk Status', 'Insert', 'PROC', 'risk_status_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_risk_status(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(del)', 'Delete Risk Status', 'Delete', 'PROC', 'risk_status_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_risk_status(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(enq)', 'Enquire Risk Status', 'Enquire', 'PROC', 'risk_status_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_risk_status(enq)', '2005-04-19 18:49:15', 'AJM', NULL, NULL),
('SURVEY', 'srv_risk_status(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_risk_status(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(list)', 'List Risk Status', 'Risk Status', 'PROC', 'risk_status_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:13:09', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(list)', 'srv_risk_status(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_status(list)', 'srv_risk_status(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_status(list)', 'srv_risk_status(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_status(list)', 'srv_risk_status(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_status(list)', 'srv_risk_status(search)', '005', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_status(list)', 'audit_dtl(list)3', '006', 'Audit Trail', 'Y', '2004-04-09 11:56:35', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_risk_status(list)', '2005-04-19 18:49:15', 'AJM', NULL, NULL),
('SURVEY', 'srv_risk_status(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_risk_status(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(search)', 'Search Risk Status', 'Search', 'PROC', 'risk_status_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_risk_status(search)', '2005-04-19 18:49:16', 'AJM', NULL, NULL),
('SURVEY', 'srv_risk_status(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_risk_status(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_status(upd)', 'Update Risk Status', 'Update', 'PROC', 'risk_status_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_risk_status(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(add)', 'Add Risk Weighting', 'Insert', 'PROC', 'risk_weighting_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_risk_weighting(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(del)', 'Delete Risk Weighting', 'Delete', 'PROC', 'risk_weighting_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_risk_weighting(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(enq)', 'Enquire Risk Weighting', 'Enquire', 'PROC', 'risk_weighting_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_risk_weighting(enq)', '2005-04-19 18:49:45', 'AJM', NULL, NULL),
('SURVEY', 'srv_risk_weighting(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_risk_weighting(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(list)', 'List Risk Weighting', 'Risk Weighting', 'PROC', 'risk_weighting_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:13:15', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(list)', 'srv_risk_weighting(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_weighting(list)', 'srv_risk_weighting(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_weighting(list)', 'srv_risk_weighting(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_weighting(list)', 'srv_risk_weighting(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_weighting(list)', 'srv_risk_weighting(search)', '005', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_risk_weighting(list)', 'audit_dtl(list)3', '006', 'Audit Trail', 'Y', '2004-04-09 11:56:46', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_risk_weighting(list)', '2005-04-19 18:49:45', 'AJM', NULL, NULL),
('SURVEY', 'srv_risk_weighting(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_risk_weighting(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(search)', 'Search Risk Weighting', 'Search', 'PROC', 'risk_weighting_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_risk_weighting(search)', '2005-04-19 18:49:45', 'AJM', NULL, NULL),
('SURVEY', 'srv_risk_weighting(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_risk_weighting(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_risk_weighting(upd)', 'Update Risk Weighting', 'Update', 'PROC', 'risk_weighting_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_risk_weighting(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_dtl(multi)', 'Maintain Survey Answers', 'Maintain Answers', 'PROC', 'survey_answer_dtl_multi.php', 'N', 'MULTI1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2005-06-24 17:31:51', 'AJM');

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(add)', 'Add Survey Answer Header', 'Insert', 'PROC', 'survey_answer_hdr_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_answer_hdr(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_answer_hdr(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(del)', 'Delete Survey Answer Header', 'Delete', 'PROC', 'survey_answer_hdr_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2005-04-19 18:51:25', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_answer_hdr(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_answer_hdr(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(enq)', 'Enquire Survey Answer Header', 'Enquire', 'PROC', 'survey_answer_hdr_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_answer_hdr(enq)', '2005-04-19 18:49:45', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_answer_hdr(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_answer_hdr(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(list)', 'List Survey Answers', 'Survey Answers', 'PROC', 'survey_answer_hdr_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:13:20', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(list)', 'srv_survey_answer_hdr(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'srv_survey_answer_hdr(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'srv_survey_answer_hdr(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'srv_survey_answer_hdr(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'srv_survey_answer_dtl(multi)', '005', 'Maintain Answers', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'srv_survey_answer_hdr(status)', '006', 'Update Status', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'srv_survey_answer_hdr(search)', '007', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_answer_hdr(list)', 'audit_dtl(list)3', '008', 'Audit Trail', 'Y', '2004-04-09 11:56:54', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_answer_hdr(list)', '2005-04-19 18:49:45', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_answer_hdr(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_answer_hdr(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(search)', 'Search Survey Answer Header', 'Search', 'PROC', 'survey_answer_hdr_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_answer_hdr(search)', '2005-04-19 18:49:45', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_answer_hdr(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_answer_hdr(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(status)', 'Update Survey Status', 'Update Status', 'PROC', 'survey_answer_hdr_status.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_answer_hdr(upd)', 'Update Survey Answer Header', 'Update', 'PROC', 'survey_answer_hdr_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_answer_hdr(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_answer_hdr(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(add)', 'Add Survey Header', 'Insert', 'PROC', 'survey_hdr_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_hdr(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(del)', 'Delete Survey Header', 'Delete', 'PROC', 'survey_hdr_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_hdr(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(enq)', 'Enquire Survey Header', 'Enquire', 'PROC', 'survey_hdr_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_hdr(enq)', '2005-04-19 18:49:58', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_hdr(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_hdr(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(list)', 'List Surveys', 'Surveys', 'PROC', 'survey_hdr_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:13:26', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(list)', 'srv_survey_hdr(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'srv_survey_hdr(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'srv_survey_hdr(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'srv_survey_hdr(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'srv_default_prompt(list)', '005', 'Default Prompts', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'srv_survey_section(list)', '006', 'List Section', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'srv_survey_hdr(search)', '007', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)', 'audit_dtl(list)3', '008', 'Audit Trail', 'Y', '2004-04-09 11:57:12', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_hdr(list)', '2005-04-19 18:49:58', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_hdr(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_hdr(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(list)a', 'List Survey by Survey Type', 'List Survey', 'PROC', 'survey_hdr_list(a).php', 'N', 'LIST2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2003-01-01 12:00:00', 'AJM', '2004-08-17 16:14:12', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(list)a', 'srv_survey_hdr(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'srv_survey_hdr(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'srv_survey_hdr(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'srv_survey_hdr(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'srv_default_prompt(list)', '006', 'Default Prompts', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'srv_survey_section(list)', '007', 'List Section', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'srv_survey_hdr(search)', '008', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_hdr(list)a', 'audit_dtl(list)3', '009', 'Audit Trail', 'Y', '2004-04-09 12:01:43', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_hdr(list)a', '2005-04-19 18:49:58', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(popup)', 'Choose Survey', 'Choose', 'PROC', 'survey_hdr_popup.php', 'N', 'POPUP', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_hdr(popup)', '2005-04-19 18:49:58', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_hdr(popup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_hdr(popup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(search)', 'Search Survey Header', 'Search', 'PROC', 'survey_hdr_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_hdr(search)', '2005-04-19 18:49:58', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_hdr(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_hdr(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_hdr(upd)', 'Update Survey Header', 'Update', 'PROC', 'survey_hdr_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_hdr(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(add)', 'Add Survey Question', 'Insert', 'PROC', 'survey_question_add.php', 'N', 'ADD2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_question(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(del)', 'Delete Survey Question', 'Delete', 'PROC', 'survey_question_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_question(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(enq)', 'Enquire Survey Question', 'Enquire', 'PROC', 'survey_question_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_question(enq)', '2005-04-19 18:50:12', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_question(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_question(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(list)', 'List Survey Questions', 'List Questions', 'PROC', 'survey_question_list.php', 'N', 'LIST2', 'SURVEY', NULL, NULL, NULL, NULL, 'question_seq', 'Y', '2004-01-01 00:00:00', 'AJM', '2005-01-15 23:38:04', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(list)', 'srv_survey_question(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'srv_survey_question(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'srv_survey_question(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'srv_survey_question(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'srv_survey_question(moveup)', '005', 'Move Up', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'srv_survey_question(movedown)', '006', 'Move Down', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'srv_survey_question(reseq)', '007', 'Resequence', 'N', '2003-01-01 12:00:00', 'AJM', '2005-01-15 23:43:48', 'AJM'),
('srv_survey_question(list)', 'srv_survey_question(search)', '008', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(list)', 'audit_dtl(list)3', '009', 'Audit Trail', 'Y', '2004-04-09 12:01:51', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_question(list)', '2005-04-19 18:50:12', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_question(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_question(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(movedown)', 'Move Question Down', 'Move Down', 'PROC', 'survey_question_movedown.php', 'N', 'UPD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_question(movedown)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(moveup)', 'Move Question Up', 'Move Up', 'PROC', 'survey_question_moveup.php', 'N', 'UPD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_question(moveup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(reseq)', 'Resquence Survey Questions', 'Resequence', 'PROC', 'survey_question_reseq.php', 'N', 'UPD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2005-01-15 23:38:28', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_question(reseq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(search)', 'Search Survey Question', 'Search', 'PROC', 'survey_question_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_question(search)', '2005-04-19 18:50:12', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_question(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_question(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(upd)', 'Update Survey Question', 'Update', 'PROC', 'survey_question_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_question(upd)', 'srv_question_prompt(list)', '001', 'List Prompts', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(upd)', 'srv_question_prompt(link)', '002', 'Maintain Prompts', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(upd)', 'srv_answer_option(list)', '003', 'List Answers', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(upd)', 'srv_answer_option(multi)', '004', 'Maintain Answers', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_question(upd)', 'srv_number_option(multi)', '005', 'Number Options', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_question(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(add)', 'Add Survey Section', 'Insert', 'PROC', 'survey_section_add.php', 'N', 'ADD2', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_section(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(del)', 'Delete Survey Section', 'Delete', 'PROC', 'survey_section_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_section(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(enq)', 'Enquire Survey Section', 'Enquire', 'PROC', 'survey_section_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_section(enq)', '2005-04-19 18:50:26', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_section(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_section(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(list)', 'List Survey Section', 'List Section', 'PROC', 'survey_section_list.php', 'N', 'LIST2', 'SURVEY', NULL, NULL, NULL, NULL, 'section_seq', 'Y', '2004-01-01 00:00:00', 'AJM', '2005-01-15 23:49:13', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(list)', 'srv_survey_section(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_section(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_section(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_section(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_section(reseq)', '005', 'Resequence', 'N', '2003-01-01 12:00:00', 'AJM', '2005-01-15 23:49:25', 'AJM'),
('srv_survey_section(list)', 'srv_survey_section(moveup)', '006', 'Move Up', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_section(movedown)', '007', 'Move Down', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_question(list)', '008', 'List Questions', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'srv_survey_section(search)', '009', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_section(list)', 'audit_dtl(list)3', '010', 'Audit Trail', 'Y', '2004-04-09 12:01:58', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_section(list)', '2005-04-19 18:50:26', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_section(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_section(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(movedown)', 'Move Down Section', 'Move Down', 'PROC', 'survey_section_movedown.php', 'N', 'UPD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_section(movedown)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(moveup)', 'Move Up Section', 'Move Up', 'PROC', 'survey_section_moveup.php', 'N', 'UPD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_section(moveup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(reseq)', 'Resequence Survey Sections', 'Resequence', 'PROC', 'survey_section_reseq.php', 'N', 'UPD4', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_section(reseq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(search)', 'Search Survey Section', 'Search', 'PROC', 'survey_section_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_section(search)', '2005-04-19 18:50:26', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_section(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_section(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_section(upd)', 'Update Survey Section', 'Update', 'PROC', 'survey_section_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_section(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(add)', 'Add Survey Type', 'Insert', 'PROC', 'survey_type_add.php', 'N', 'ADD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_type(add)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(del)', 'Delete Survey Type', 'Delete', 'PROC', 'survey_type_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_type(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(enq)', 'Enquire Survey Type', 'Enquire', 'PROC', 'survey_type_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_type(enq)', '2005-04-19 18:50:39', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_type(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(list)', 'List Survey Types', 'Survey Types', 'PROC', 'survey_type_list.php', 'N', 'LIST1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'Y', '2004-01-01 00:00:00', 'AJM', '2004-08-17 16:13:32', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(list)', 'srv_survey_type(add)', '001', 'New', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_type(list)', 'srv_survey_type(enq)', '002', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_type(list)', 'srv_survey_type(upd)', '003', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_type(list)', 'srv_survey_type(del)', '004', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_type(list)', 'srv_survey_hdr(list)a', '005', 'List Survey', 'Y', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_type(list)', 'srv_survey_type(search)', '006', 'Search', 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('srv_survey_type(list)', 'audit_dtl(list)3', '007', 'Audit Trail', 'Y', '2004-04-09 11:57:21', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_type(list)', '2005-04-19 18:50:39', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_type(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(search)', 'Search Survey Types', 'Search', 'PROC', 'survey_type_search.php', 'N', 'SRCH', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_survey_type(search)', '2005-04-19 18:50:39', 'AJM', NULL, NULL),
('SURVEY', 'srv_survey_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_survey_type(search)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_survey_type(upd)', 'Update Survey Type', 'Update', 'PROC', 'survey_type_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_survey_type(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_tree_node(del)', 'Delete Tree Node', 'Delete', 'PROC', 'tree_node_del.php', 'N', 'DEL1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_tree_node(del)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_tree_node(enq)', 'Enquire Tree Node', 'Enquire', 'PROC', 'tree_node_enq.php', 'N', 'ENQ1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_tree_node(enq)', '2005-04-19 18:50:39', 'AJM', NULL, NULL),
('SURVEY', 'srv_tree_node(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_tree_node(enq)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_tree_node(list)', 'List Organisation/Location/Assets', 'Organisation Tree', 'PROC', 'tree_node_list.php', 'N', 'TREE1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2004-08-26 12:35:53', 'AJM');

REPLACE INTO `mnu_nav_button` (`task_id_snr`, `task_id_jnr`, `sort_seq`, `button_text`, `context_preselect`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_tree_node(list)', 'srv_tree_node(enq)', '001', 'Read', 'Y', '2003-01-01 12:00:00', 'AJM', '2004-04-28 18:22:49', 'AJM'),
('srv_tree_node(list)', 'srv_tree_node(upd)', '002', 'Update', 'Y', '2003-01-01 12:00:00', 'AJM', '2004-04-28 18:22:49', 'AJM'),
('srv_tree_node(list)', 'srv_tree_node(del)', '003', 'Delete', 'Y', '2003-01-01 12:00:00', 'AJM', '2004-04-28 18:22:49', 'AJM'),
('srv_tree_node(list)', 'srv_organisation(add)', '004', 'Add Organisation', 'N', '2003-01-01 12:00:00', 'AJM', '2004-04-28 18:22:49', 'AJM'),
('srv_tree_node(list)', 'srv_location(add)', '005', 'Add Location', 'Y', '2003-01-01 12:00:00', 'AJM', '2004-04-28 18:22:49', 'AJM'),
('srv_tree_node(list)', 'srv_asset(add)', '006', 'Add Asset', 'Y', '2003-01-01 12:00:00', 'AJM', '2004-04-28 18:22:49', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_tree_node(list)', '2005-04-19 18:50:39', 'AJM', NULL, NULL),
('SURVEY', 'srv_tree_node(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_tree_node(list)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_tree_node(popup)', 'Choose Location', 'Choose', 'PROC', 'tree_node_popup.php', 'N', 'TREE1POPUP', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', '2005-12-26 12:31:28', 'AJM');

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('DEMO', 'srv_tree_node(popup)', '2005-04-19 18:50:39', 'AJM', NULL, NULL),
('SURVEY', 'srv_tree_node(popup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('SURVEY1', 'srv_tree_node(popup)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('srv_tree_node(upd)', 'Update Tree Node', 'Update', 'PROC', 'tree_node_upd.php', 'N', 'UPD1', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_role_task` (`role_id`, `task_id`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('SURVEY', 'srv_tree_node(upd)', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_task` (`task_id`, `task_desc`, `button_text`, `task_type`, `script_id`, `is_disabled`, `dialog_type_id`, `subsys_id`, `initial_passthru`, `selection_fixed`, `selection_temp`, `settings`, `order_by`, `keep_data`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('survey', 'Survey system', 'Survey system', 'MENU', 'menu.php', 'N', 'MENU', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2004-01-01 00:00:00', 'AJM', NULL, NULL),
('survey01', 'Survey Setup', 'Setup', 'MENU', 'menu.php', 'N', 'MENU', 'SURVEY', NULL, NULL, NULL, NULL, NULL, 'N', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_menu` (`menu_id`, `task_id_jnr`, `sort_seq`, `button_text`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('survey', 'survey01', '001', 'Setup', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey', 'srv_tree_node(list)', '002', 'Organisation Tree', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey', 'srv_survey_hdr(list)', '003', 'Survey Questions', '2003-01-01 12:00:00', 'AJM', '2005-02-19 11:28:52', 'AJM'),
('survey', 'srv_survey_answer_hdr(list)', '004', 'Survey Answers', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey01', 'srv_asset_type(list)', '001', 'Asset Type', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey01', 'srv_location_type(list)', '002', 'Location Type', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey01', 'srv_org_type(list)', '003', 'Organisation Type', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey01', 'srv_risk_status(list)', '004', 'Risk Status', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey01', 'srv_risk_weighting(list)', '005', 'Risk Weighting', '2003-01-01 12:00:00', 'AJM', NULL, NULL),
('survey01', 'srv_survey_type(list)', '006', 'Survey Type', '2003-01-01 12:00:00', 'AJM', NULL, NULL);

REPLACE INTO `mnu_menu` (`menu_id`, `task_id_jnr`, `sort_seq`, `button_text`, `created_date`, `created_user`, `revised_date`, `revised_user`) VALUES 
('proto', 'survey', '003', 'Survey/Questionnaire', '2005-05-05 17:45:59', 'AJM', '2005-05-05 17:51:52', 'AJM');

-- finished
