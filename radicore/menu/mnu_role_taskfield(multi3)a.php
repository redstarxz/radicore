<?php
//*****************************************************************************
// This will allow occurrences of the INNER table to be displayed and
// modified. This version starts by showing the exiting entries, then allows the
// user to add, delete or modify entries.
// The id of the OUTER entty is passed down from the previous screen.
// The MIDDLE entity is scanned one entry at a time.
// The INNER entity is identified using the id from the OUTER and MIDDLE entities.
//*****************************************************************************

$outer_table  = 'mnu_task';				                // name of outer table
$middle_table = 'mnu_role_s01';                         // name of middle table
$inner_table  = 'mnu_role_taskfield_s01';               // name of table to be amended
$screen = 'mnu_role_taskfield.multi3(a).screen.inc';    // file identifying screen structure

// identify extra parameters for a JOIN
$outer_sql_select = 'task_id,task_desc,task_type';
$outer_sql_from   = NULL;
$outer_sql_where  = NULL;

$middle_sql_select = 'mnu_role.role_id, role_desc';
$middle_sql_from   = 'mnu_role';
$middle_sql_where  = "global_access='N'";

$inner_sql_select = '';
$inner_sql_from   = '';
$inner_sql_where  = '';
$inner_sql_orderby = 'mnu_task_field.field_id';

require 'std.multi3.inc';                           // activate page controller

?>