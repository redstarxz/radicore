<?php
//*****************************************************************************
// List the contents of a database table and allow the user to view/modify
// the contents by activating other screens via navigation buttons. 
//*****************************************************************************

//DebugBreak();
$table_id = 'dict_table_key';               	// name of inner table
$screen   = 'dict_table_key.list.screen.inc';	// file identifying screen structure

$sql_select = '';
$sql_from   = '';
$sql_groupby = '';

// activate page controller
require 'std.list1.inc';

?>