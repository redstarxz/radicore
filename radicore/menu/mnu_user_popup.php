<?php
//*****************************************************************************
// List the contents of a database table and allow the user to view/modify
// the contents by activating other screens via navigation buttons.
//*****************************************************************************

//DebugBreak();
$table_id = 'mnu_user';    	            // table name
$screen   = 'mnu_user.list.screen.inc'; // file identifying screen structure

require 'std.list1.popup.inc';          // activate page controller

?>
