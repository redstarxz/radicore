<?php

// modify INCLUDE_PATH
$include_path = ini_get('include_path');
$include_path .= PATH_SEPARATOR .'../dict';
$include_path .= PATH_SEPARATOR .'../menu';
ini_set('include_path', $include_path);
unset($include_path);

?>