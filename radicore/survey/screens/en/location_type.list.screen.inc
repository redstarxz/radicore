<?php
$structure['xsl_file'] = 'std.list1.xsl';

$structure['tables']['main'] = 'location_type';

$structure['main']['columns'][] = array('width' => 5);
$structure['main']['columns'][] = array('width' => 150);
$structure['main']['columns'][] = array('width' => '*');

$structure['main']['fields'][] = array('selectbox' => 'Select');
$structure['main']['fields'][] = array('location_type_desc' => 'Description');
$structure['main']['fields'][] = array('image_fname' => 'Icon');

?>