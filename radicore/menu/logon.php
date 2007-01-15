<?php
// *****************************************************************************
// Copyright 2003-2006 by A J Marston <http://www.tonymarston.net>
// Licensed to Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************

// *****************************************************************************
// This is the main logon screen.
// The user must enter a valid username and password before being allowed
// to access the remainder of the system.
// *****************************************************************************

$table_id = 'logon';                // table name
$title    = 'System Logon';         // form title
$xsl_file = 'logon.xsl';            // xsl file for transformation
$screen   = 'logon.screen.inc';     // file identifying screen structure

require 'include.general.inc';
require "classes/$table_id.class.inc";

// get details from any previous session
if (isset($session_name)) {
    // use existing session name
} else {
    // assign new session name
    $session_name = getNewSession('menu');
} // if
session_name($session_name);
if (isset($_GET['session_id'])) {
    session_id($_GET['session_id']);    // set the session id
} // if
session_start();

if (isset($_SESSION['messages'])) {
    $messages_bf = (array)$_SESSION['messages'];
} // if
if (isset($_SESSION['logon_retries'])) {
    $logon_retries = $_SESSION['logon_retries'];
} // if
if (isset($_SESSION['user_id'])) {
    $_POST['user_id']       = $_SESSION['user_id'];
    $_POST['user_password'] = $_SESSION['user_password'];
} // if
if (isset($_SESSION['XSLT_client_side'])) {
	$XSLT_client_side = $_SESSION['XSLT_client_side'];
} // if
if (isset($_SESSION['css_file'])) {
	$theme = $_SESSION['css_file'];
} elseif (isset($_COOKIE['theme'])) {
    $theme = $_COOKIE['theme'];
} // if
if (isset($_SESSION['logon_user_id'])) {
    $dbobject = new $table_id;
    // log the current user off
    $errors = $dbobject->user_logoff($_SESSION['logon_user_id']);
	unset($dbobject);
} // if
if (count($_SESSION) <= 1) {
    // if $_SESSION is empty then $_POST must be empty as well
    $_POST = array();
} // if

if (isset($_SESSION['default_language'])) {
    $default_language    = $_SESSION['default_language'];
} else {
    // get default language from control table
    require_once 'classes/mnu_control.class.inc';
    $mnu_control = new mnu_control;
    $default_language    = $mnu_control->getControlData('default_language');
} // if

// unset any previous session data
session_unset();

if (isset($messages_bf)) {
    $_SESSION['messages'] = $messages_bf;  // put this message back
} // if

// identify mode for xsl file
$mode    = 'logon';
$task_id = 'logon';

// initialise a new session
initSession();

$_SESSION['default_language'] = $default_language;
$_SESSION[getSelf()]['pattern_id'] = 'logon';

// define action buttons
$act_buttons['submit'] = 'login';

if (isset($_POST['quit']) or (isset($_POST['quit_x']))) {
    // cancel this screen, return to previous screen
    scriptPrevious(null, 'quit');
} // if

if (isset($logon_retries)) {
    $_SESSION['logon_retries'] = $logon_retries;
} // if

if (isset($theme)) {
	$_SESSION['css_file'] = $theme;
} // if

// create a class instance for the main database table
$dbobject = new $table_id;

// look for entered data
if (!empty($_POST)) {
    // attempt to log on using this data
    $dbobject->startTransaction();
    $result = $dbobject->user_logon($_POST);
	if (!empty($result)) {
		// errors are keyed by object name
	    $errors[$dbobject->getClassName()] = $result;
	} // if
    if ($errors) {
        $dbobject->rollback();
    } else {
        $dbobject->commit();
        // logon is OK - go to next screen
        $fieldarray = $dbobject->getFieldArray();
        $messages   = $dbobject->getMessages();
        $_SESSION['start_task_id']  = $fieldarray[0]['start_task_id'];
        $task_array['query_string'] = "selection={$fieldarray[0]['start_task_id']}";
        scriptNext('menu', null, null, $task_array);
    } // if
} else {
    // get initial data for a new record
    $fieldarray = $dbobject->getInitialData($where);
    $result = $dbobject->getErrors();
	if (!empty($result)) {
		// errors are keyed by object name
	    $errors[$dbobject->getClassName()] = $result;
	} // if
	if (isset($messages_bf)) {
    	$messages = $messages_bf;
    } // if
} // if

// initialise $page_stack
$_SESSION['page_stack'] = array();

$xml_objects[]['root'] = &$dbobject;

// build XML document and perform XSL transformation
buildXML($xml_objects, $errors, $messages);
exit;

?>
