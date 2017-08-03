ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
SET SCAN OFF;

ALTER SESSION SET CURRENT_SCHEMA = "MENU";

DROP TABLE help_text;
DROP TABLE help_text_alt;
DROP TABLE mnu_account;
DROP TABLE mnu_control;
DROP TABLE mnu_favourite;
DROP TABLE mnu_initial_value_role;
DROP TABLE mnu_initial_value_user;
DROP TABLE mnu_language;
DROP TABLE mnu_menu;
DROP TABLE mnu_motd;
DROP TABLE mnu_nav_button;
DROP TABLE mnu_pattern;
DROP TABLE mnu_role;
DROP TABLE mnu_role_task;
DROP TABLE mnu_role_taskfield;
DROP TABLE mnu_saved_selection;
DROP TABLE mnu_saved_selection_data;
DROP TABLE mnu_subsystem;
DROP TABLE mnu_task;
DROP TABLE mnu_task_alt;
DROP TABLE mnu_task_field;
DROP TABLE mnu_task_quicksearch;
DROP TABLE mnu_task_quicksearch_alt;
DROP TABLE mnu_time_limit_role;
DROP TABLE mnu_time_limit_user;
DROP TABLE mnu_task_ip_address;
DROP TABLE mnu_todo;
DROP TABLE mnu_user;
DROP TABLE mnu_user_ip_address;
DROP TABLE mnu_user_alt;
DROP TABLE mnu_user_role;

DROP SEQUENCE MNU_ACCOUNT_SEQ;
DROP SEQUENCE MNU_MOTD_SEQ;
DROP SEQUENCE MNU_SAVED_SELECTION_SEQ;