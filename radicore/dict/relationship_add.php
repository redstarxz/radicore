<?php
//*****************************************************************************
// Allow a new occurrence to be added to the PERSON_ADDR table for a particular
// value of PERSON_ID, as selected in the previous screen.
//*****************************************************************************

//DebugBreak();
$table_id = 'dict_relationship';                      // table name
$screen   = 'dict_relationship.detail.screen.inc';    // file identifying screen structure

// activate page controller
require 'std.add2.inc';

?>