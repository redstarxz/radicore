<?php
//*****************************************************************************
// Show a blank detail screen for a database table and allow the user to enter
// selection criteria, will will be passed back to the previous screen.
//*****************************************************************************

$table_id = 'risk_weighting';                       // table id
$screen   = 'risk_weighting.detail.screen.inc';     // file identifying screen structure

require 'std.search1.inc';      // activate page controller

?>
