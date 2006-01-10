<?php
//*****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
//*****************************************************************************

//*****************************************************************************
// This is the menu page.
// The user is brought here immediately after logging on.
//*****************************************************************************

//DebugBreak();
require_once 'include.general.inc';

$xsl_file = 'menu.xsl';       // xsl file for transformation

// load session variables
initSession();

$mode = 'read';

require_once 'classes/mnu_todo.class.inc';
$db_todo = new mnu_todo;

// insert label text
$db_todo->xsl_params['text']['todo-user'] = getLanguageText('xsl_todo_user');

// ****************************************************************************

// get paginaton details for 'workitem_role'
if (isset($pagination['mnu_todo'])) {
   $db_todo->setPageNo($pagination['mnu_todo']['curpage']);
} // if
if (isset($_GET['pagination']) AND $_GET['pagination'] == 'mnu_todo') {
   // set index number of item to be read from current $where list
   $db_todo->setPageNo($_GET['page']);
} // if

// get any 'to do' items for the current user
$db_todo->sql_select  = 'user_id, item_desc, due_date';
$db_todo->sql_orderby = 'due_date';
$db_todo->setRowsPerPage(10);
$todo_data = $db_todo->getData("user_id='{$_SESSION['logon_user_id']}' AND is_complete='N'");
$errors = array_merge($errors, $db_todo->getErrors());

// save pagination details for XML output
$pagination['mnu_todo']['numrows']  = $db_todo->getNumRows();
$pagination['mnu_todo']['curpage']  = $db_todo->getPageNo();
$pagination['mnu_todo']['lastpage'] = $db_todo->getLastPage();

// ****************************************************************************

if (!empty($_POST)) {
    // look for an action which is another script
    $errors = childForm($_POST, $db_todo, 'db_todo', $where);
} // if

// ****************************************************************************

require_once 'classes/wf_workitem_role.class.inc';
$dbworkitem_role = new wf_workitem_role;

// insert label text
$dbworkitem_role->xsl_params['text']['workitems-for-role'] = getLanguageText('xsl_workitems_role');

if (isset($_GET['case_id']) and isset($_GET['workitem_id'])) {
   // a workitem has been selected from the current screen, so jump to it now
   $where = "case_id='{$_GET['case_id']}' AND workitem_id='{$_GET['workitem_id']}'";
   $workitem = $dbworkitem_role->getData($where);
   if ($dbworkitem_role->errors) {
      $errors = array_merge($errors, $dbworkitem_role->getErrors());
   } else {
      $task_id = $workitem[0]['task_id'];
      $where   = $workitem[0]['context'];
      scriptNext($task_id, $where);
   } // if
} // if

// ****************************************************************************

// get paginaton details for 'workitem_role'
if (isset($pagination['workitem_role'])) {
   $dbworkitem_role->setPageNo($pagination['workitem_role']['curpage']);
} // if
if (isset($_GET['pagination']) AND $_GET['pagination'] == 'workitem_role') {
   // set index number of item to be read from current $where list
   $dbworkitem_role->setPageNo($_GET['page']);
} // if

// get any workitems for the current role
$dbworkitem_role->sql_orderby = 'enabled_date';
$dbworkitem_role->setRowsPerPage(10);
$workitem_data = $dbworkitem_role->getData("role_id='{$_SESSION['role_id']}' AND user_id IS NULL AND workitem_status='EN' AND transition_trigger='USER'");
$errors = array_merge($errors, $dbworkitem_role->getErrors());

// save pagination details for XML output
$pagination['workitem_role']['numrows']  = $dbworkitem_role->getNumRows();
$pagination['workitem_role']['curpage']  = $dbworkitem_role->getPageNo();
$pagination['workitem_role']['lastpage'] = $dbworkitem_role->getLastPage();

// ****************************************************************************

require_once 'classes/wf_workitem_user.class.inc';
$dbworkitem_user = new wf_workitem_user;

// insert label text
$dbworkitem_user->xsl_params['text']['workitems-for-user'] = getLanguageText('xsl_workitems_user');

// get paginaton details for 'workitem_user'
if (isset($pagination['workitem_user'])) {
   $dbworkitem_user->setPageNo($pagination['workitem_user']['curpage']);
} // if
if (isset($_GET['pagination']) AND $_GET['pagination'] == 'workitem_user') {
   // set index number of item to be read from current $where list
   $dbworkitem_user->setPageNo($_GET['page']);
} // if

// get any workitems for the current user
$dbworkitem_user->sql_orderby = 'enabled_date';
$dbworkitem_user->setRowsPerPage(10);
$workitem_data = $dbworkitem_user->getData("user_id='{$_SESSION['logon_user_id']}' AND workitem_status='EN' AND transition_trigger='USER'");
$errors = array_merge($errors, $dbworkitem_user->getErrors());

// save pagination details for XML output
$pagination['workitem_user']['numrows']  = $dbworkitem_user->getNumRows();
$pagination['workitem_user']['curpage']  = $dbworkitem_user->getPageNo();
$pagination['workitem_user']['lastpage'] = $dbworkitem_user->getLastPage();

// save this in session data
$script_vars['pagination'] = $pagination;
$PHP_SELF = getSelf();
$_SESSION[$PHP_SELF][$task_id] = $script_vars;

// ****************************************************************************

$xml_objects[]['root'] = &$db_todo;
$xml_objects[]['root'] = &$dbworkitem_role;
$xml_objects[]['root'] = &$dbworkitem_user;

// build XML document and perform XSL transformation
buildXML($xml_objects, $errors, $messages);
exit;

?>