<?php
//*****************************************************************************
// This will display data from 2 tables in a ONE-to-MANY relationship.
// (also known as a PARENT-CHILD or OUTER-INNER retaltionship).
// It will start by reading the OUTER entity using the primary key passed down
// from the previous screen, then show existing occurrences of INNER.
// Occurrences of INNER may then be modified, or added and deleted using the
// relevant buttons on the navigation bar.
//*****************************************************************************

//DebugBreak();
$outer_table = 'dict_relationship';				    // name of outer table
$inner_table = 'dict_related_column_s01';           // name of inner table
$screen = 'dict_related_column.multi.screen.inc';   // file identifying screen structure

// identify extra parameters for a JOIN
$outer_sql_select = '';
$outer_sql_from   = '';
$outer_sql_where  = '';

$inner_sql_select = '';
$inner_sql_from   = '';
$inner_sql_where  = '';

// set default sort sequence
$inner_sql_orderby = '';

// activate page controller
require 'std.multi2.inc';

?>
