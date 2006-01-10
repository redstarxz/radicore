<?php
//*****************************************************************************
// List the contents of the CLASS table for a particular value of LESSON_ID
// (as selected in the previous screen) and allow the user to view/modify
// the contents by activating other screens via navigation buttons. 
//*****************************************************************************

//DebugBreak();
$outer_table = 'crs_lesson_s01';                // name of outer table
$inner_table = 'crs_class_lesson';              // name of inner table
$screen      = 'crs_class.list(a).screen.inc';  // file identifying screen structure

// identify extra parameters for a JOIN
$outer_sql_select = 'lesson_id, lesson_name';
$outer_sql_from   = '';
$outer_sql_where  = NULL;

$inner_sql_select = 'crs_class_lesson.lesson_id, crs_class_lesson.class_id, crs_class.class_name, crs_class.year, '
                   .'CASE count(crs_student.student_id) WHEN 0 THEN null ELSE count(crs_student.student_id) END AS student_count';
$inner_sql_from   = 'crs_class_lesson '
                   .'LEFT JOIN crs_class ON (crs_class.class_id=crs_class_lesson.class_id) '
                   .'LEFT JOIN crs_student ON (crs_student.class_id=crs_class_lesson.class_id)';
$inner_sql_where  = '';
$inner_sql_groupby  = 'crs_class_lesson.lesson_id, crs_class_lesson.class_id, crs_class.class_name, crs_class.year';
$inner_search_table = 'crs_class';

// set default sort sequence
$inner_sql_orderby = 'crs_class.class_name';

// activate page controller
require 'std.list2.inc';

?>
