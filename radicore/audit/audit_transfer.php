<?

/*
Extract details from 'audit_hdr' and 'audit_dtl' and transfer them to:
- audit_ssn (session data)
- audit_trn (transaction data)
- audit_tbl (table data)
- audit_fld (field data)
*/

echo '<p>** started at ' .date('F j, Y, g:i a') .'</p>';

$curr_file = __FILE__;              // get fully-qualified name of current file
$curr_file = str_replace("\\", "/", $curr_file);
$curr_dir  = dirname($curr_file);   // extract directory
chdir($curr_dir);                   // set current working directory to this

$PHP_SELF = str_replace($_SERVER['DOCUMENT_ROOT'], "", $curr_file);
$_SERVER['PHP_SELF'] = $PHP_SELF;

$ini_array = parse_ini_file('batch.ini');
ini_set('include_path', $ini_array['include_path']);

$_SERVER['SERVER_NAME'] = $ini_array['server_name'];

require 'include.general.inc';

// ****************************************************************************
function check_errors ($object)
// check object for errors
{
    $errors = $object->getErrors();

	if ($errors) {
	    foreach ($errors as $ix => $error) {
	        if (is_string($ix)) {
	        	$error = $ix .': ' .$error;
	        } // if
	    	trigger_error($error, E_USER_ERROR);
	    } // foreach
	} // if

} // check_errors

// ****************************************************************************

// create objects for each database table
require 'classes/audit_hdr.class.inc';
$audit_hdr = new Audit_Hdr;

require 'classes/audit_dtl.class.inc';
$audit_dtl = new Audit_Dtl;

require 'classes/audit_dtl_jnr.class.inc';
$audit_dtl_jnr = new Audit_Dtl_jnr;

require 'classes/audit_ssn.class.inc';
$audit_ssn = new Audit_ssn;

require 'classes/audit_trn.class.inc';
$audit_trn = new Audit_trn;

require 'classes/audit_tbl.class.inc';
$audit_tbl = new Audit_tbl;

require 'classes/audit_fld.class.inc';
$audit_fld = new Audit_fld;

// 'audit_hdr' data is to be split across 'audit_ssn' and 'audit_trn'
$audit_hdr->sql_orderby = 'date,time,tran_seq_no';
$audit_hdr_result = $audit_hdr->getData_batch();
$session_id  = '';
while ($row = $audit_hdr->fetchRow($audit_hdr_result)) {
    $audit_ssn_data['user_id'] = $row['user_id'];
    $audit_ssn_data['date']    = $row['date'];
    $audit_ssn_data['time']    = $row['time'];
    if ($row['session_id'] != $session_id) {
    	$audit_ssn_data = $audit_ssn->insertRecord($audit_ssn_data);
    	check_errors($audit_ssn);
    	$session_id = $row['session_id'];
    } // if
    $audit_trn_data = $row;
    $audit_trn_data['session_id'] = $audit_ssn_data['session_id'];
    $audit_trn_data = $audit_trn->insertRecord($audit_trn_data);
    check_errors($audit_trn);

    $tran_seq_no = $row['tran_seq_no'];
    $audit_dtl_result = $audit_dtl->getData_batch("session_id='$session_id' AND tran_seq_no='$tran_seq_no'");
    // 'audit_dtl' data is to be split across 'audit_tbl' and 'audit_fld'
    while ($row2 = $audit_dtl->fetchRow($audit_dtl_result)) {
        $audit_tbl_data = $row2;
        $audit_tbl_data['session_id'] = $audit_ssn_data['session_id'];
        $audit_tbl_data = $audit_tbl->insertRecord($audit_tbl_data);
        check_errors($audit_tbl);
        // use 'audit_dtl_jnr' to extract field data
        $audit_dtl_jnr->setFieldArray($row2);
        $audit_dtl_jnr_data = $audit_dtl_jnr->getData(null);
        foreach ($audit_dtl_jnr_data as $row3) {
        	$audit_fld_data = $audit_tbl_data;
        	$audit_fld_data['field_id']  = $row3['item_name'];
        	$audit_fld_data['old_value'] = $row3['old_value'];
        	$audit_fld_data['new_value'] = $row3['new_value'];
        	$audit_fld_data = $audit_fld->insertRecord($audit_fld_data);
            check_errors($audit_fld);
        } // foreach
    } // while
} // while

echo '<p>** finished at ' .date('F j, Y, g:i a') .'</p>';

?>
