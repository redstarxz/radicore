<?php
//*****************************************************************************
// This will allow an occurrences of a database table to be updated.
// The identity of the selected occurrence is passed down from the previous screen.
//*****************************************************************************

//DebugBreak();
$table_id = 'dict_table';                    // table id
$screen   = 'dict_table.detail.screen.inc';  // file identifying screen structure

// activate page controller
require 'std.update1.inc';

?>