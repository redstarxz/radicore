<?php
//*****************************************************************************
// This will allow an occurrences of the LINK table to be added or deleted.
// The identity of the OUTER occurrence is passed down from the previous screen.
// The INNER table is defined using LEFT JOIN from within the LINK table.
// The existence of individual LINK table entries will be shown in a checkbox
// which can be toggled ON to create a record or OFF to delete a record.
//*****************************************************************************

//DebugBreak();
$outer_table = 'mnu_task_snr';      		    // name of outer table
$link_table  = 'mnu_menu';      	            // name of link table
$inner_table = 'mnu_task_jnr';                  // name of inner table
$screen      = 'mnu_menu.link.screen.inc';      // file identifying screen structure

// identify extra parameters for a JOIN
$outer_sql_select = 'task_id,task_desc,task_type';
$outer_sql_from   = NULL;
$outer_sql_where  = NULL;

// modify the sql select for the LINK table
$link_sql_select = 'mnu_menu.sort_seq, mnu_menu.button_text, mnu_task_jnr.task_desc AS task_desc_jnr';
$link_sql_from   = '';
$link_sql_where  = '';
$link_search_table = 'mnu_task';

// activate page controller
require 'std.link1.inc';

?>