<?php
//*****************************************************************************
// Show a blank detail screen for a database table and allow the user to enter
// selection criteria, will will be passed back to the previous screen. 
//*****************************************************************************

//DebugBreak();
$table_id = 'asset_type';                       // table id
$screen   = 'asset_type.detail.screen.inc';     // file identifying screen structure

// activate page controller
require 'std.search1.inc';

?>
