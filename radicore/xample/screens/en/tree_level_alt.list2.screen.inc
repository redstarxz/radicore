<?php
$structure['xsl_file'] = 'std.list2.xsl';

$structure['tables']['outer'] = 'x_tree_level';

// identify the column specs - may use 'width' or 'class'
$structure['outer']['columns'][] = array('width' => '25%');
$structure['outer']['columns'][] = array('width' => 10);
$structure['outer']['columns'][] = array('width' => '*');

// identify the field names and their screen labels
$structure['outer']['fields'][] = array('tree_type_desc' => 'Tree Type', 'colspan' => 2);
$structure['outer']['fields'][1][] = array('label' => 'Tree Level');
$structure['outer']['fields'][1][] = array('field' => 'tree_level_seq');
$structure['outer']['fields'][1][] = array('field' => 'tree_level_desc');

$structure['tables']['inner'] = 'x_tree_level_alt';

// identify the column specs - may use 'width' or 'class'
$structure['inner']['columns'][] = array('width' => 5);
$structure['inner']['columns'][] = array('width' => 200);
$structure['inner']['columns'][] = array('width' => 350);
$structure['inner']['columns'][] = array('width' => '*');

// identify the field names and their screen labels
$structure['inner']['fields'][] = array('selectbox' => 'Select');
$structure['inner']['fields'][] = array('language_id' => 'Language');
$structure['inner']['fields'][] = array('tree_level_desc' => 'Description');
$structure['inner']['fields'][] = array('' => '');

?>