<?php
//*****************************************************************************
// This will allow an occurrences of the LINK table to be added or deleted.
// The identity of the OUTER occurrence is passed down from the previous screen.
// The INNER table is defined using LEFT JOIN from within the LINK table.
// The existence of individual LINK table entries will be shown in a checkbox
// which can be toggled ON to create a record or OFF to delete a record.
//*****************************************************************************

$outer_table = 'mnu_task_snr';               // name of outer table
$link_table  = 'mnu_nav_button';             // name of link table
$inner_table = 'mnu_task_jnr';               // name of inner table
$screen = 'mnu_nav_button.link1.screen.inc'; // file identifying screen structure

// identify extra parameters for a JOIN
$outer_sql_select = 'task_id, task_name, task_type, pattern_id';
$outer_sql_from   = NULL;
$outer_sql_where  = NULL;

// modify the sql select for the LINK table
$link_sql_select = 'mnu_nav_button.sort_seq'.
                   ', COALESCE(mnu_nav_button.button_text, mnu_task_jnr.button_text) AS button_text'.
                   ', COALESCE(mnu_nav_button.context_preselect, mnu_pattern.context_preselect) AS context_preselect';
$link_sql_from   = 'LEFT JOIN mnu_pattern '.
                   'ON (mnu_task_jnr.pattern_id=mnu_pattern.pattern_id)';
$link_sql_where  = '';
$link_sql_orderby = 'task_id_jnr';
$link_search_table = 'mnu_task AS mnu_task_jnr';

require 'std.link1.inc';                    // activate page controller

?>
