<?php
//*****************************************************************************
// This will allow occurrences of a database table to be deleted.
// The identity of the selected occurrence(s) is passed from the previous screen.
//*****************************************************************************

//DebugBreak();
$table_id = 'dict_table';             	        // table id
$screen   = 'dict_table.detail.screen.inc';     // file identifying screen structure

// activate page controller
require 'std.delete1.inc';

?>
