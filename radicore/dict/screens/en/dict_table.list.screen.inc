<?php
$structure['xsl_file'] = 'std.list1.xsl';

$structure['tables']['main'] = 'dict_table';

$structure['main']['columns'][] = array('width' => 5);
$structure['main']['columns'][] = array('width' => 120);
$structure['main']['columns'][] = array('width' => 150);
$structure['main']['columns'][] = array('width' => '*');
$structure['main']['columns'][] = array('width' => 25);

$structure['main']['fields'][] = array('selectbox' => 'Select');
$structure['main']['fields'][] = array('database_id' => 'Database Id');
$structure['main']['fields'][] = array('table_id' => 'Table Id');
$structure['main']['fields'][] = array('table_desc' => 'Description');
$structure['main']['fields'][] = array('column_count' => 'Columns');

?>