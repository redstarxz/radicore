<?php
$structure['xsl_file'] = 'std.list1.xsl';

$structure['tables']['main'] = 'mnu_subsystem';

$structure['main']['columns'][] = array('width' => 1);
$structure['main']['columns'][] = array('width' => 100);
$structure['main']['columns'][] = array('width' => '*');
$structure['main']['columns'][] = array('width' => 10);

$structure['main']['fields'][] = array('selectbox' => 'Select');
$structure['main']['fields'][] = array('subsys_id' => 'ID');
$structure['main']['fields'][] = array('subsys_desc' => 'Description');
$structure['main']['fields'][] = array('count' => 'Count');

?>