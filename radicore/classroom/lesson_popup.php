<?php
// *****************************************************************************
// List the contents of a database table and allow the user to choose one
// (or more) for processing by te previous screen.
// *****************************************************************************

$table_id = 'crs_lesson';                  // table name
$screen   = 'crs_lesson.list.screen.inc';  // file identifying screen structure

// identify extra parameters for a JOIN
$sql_select = null;
$sql_from   = null;
$sql_where  = null;
$sql_groupby = null;

// set default sort sequence
$sql_orderby = null;

require 'std.list1.popup.inc';              // activate page controller

?>
