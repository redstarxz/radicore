<?php
//*****************************************************************************
// This will allow occurrences of a database table to be deleted.
// This will include ALL related occurrences on ALL child tables, thus bypassing
// any delete constraints which may have been set to RESTRICTED or NULLIFY.
// The identity of the selected occurrence(s) is passed from the previous screen.
//*****************************************************************************

//DebugBreak();
$table_id = 'mnu_subsystem';             	      // table id
$screen   = 'mnu_subsystem.detail.screen.inc';    // file identifying screen structure

require 'std.erase1.inc';          // activate page controller

?>
