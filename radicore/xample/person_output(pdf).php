<?php
//*****************************************************************************
// Extract the contents of a database table and export them to a PDF file which
// will be downloaded to the client device.
//*****************************************************************************

$table_id = 'x_person';                     // table name
$report   = 'x_person.list.report.inc';     // file identifying report structure

// customise the SQL SELECT statement
$sql_select  = null;
$sql_from    = null;
$sql_where   = null;
$sql_groupby = null;
$sql_having  = null;
//$sql_orderby = 'last_name asc';

require 'std.output2.inc';      // activate page controller

?>
