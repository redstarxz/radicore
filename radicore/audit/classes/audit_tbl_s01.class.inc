<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006-2016 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************
require_once 'audit_tbl.class.inc';
class audit_tbl_s01 extends audit_tbl
{
    // ****************************************************************************
    // this class is for use by script: audit_dtl_list3.php
    // ****************************************************************************

    var $select_count;      //

    // ****************************************************************************
    function _cm_initialise ($where, &$selection, $search)
    // perform any initialisation for the current task.
    {
        $pattern_id = getPatternId();
        if (preg_match('/^(add)/i', $pattern_id)) {
        	// ignore contents of selection
        } else {
            if (!empty($selection)) {
            	$where     = $selection;
            	$selection = null;
            } // if
        } // if

        // this is here to override the method in the parent class
        $array1 = where2indexedArray($where);   // convert string into indexed array
        $array2 = splitWhereByRow($array1);     // split into separate selections (rows)
        $this->select_count = count($array2);   // save count

        //$this->pageno = 7;  // this is a test

        return $where;

    } // _cm_initialise

    // ****************************************************************************
    function _cm_post_getData ($rowdata, &$where)
    // perform custom processing after database record(s) are retrieved.
    // NOTE: $where is passed BY REFERENCE so that it may be modified.
    {
        if (empty($rowdata) AND $this->select_count <= 1) {
            // Nothing retrieved from database table
        	$this->errors[] = $this->getLanguageText('sys0090', strtoupper($this->tablename));
        	scriptPrevious($this->errors);
        } // if

        return $rowdata;

    } // _cm_post_getData

    // ****************************************************************************
    function _cm_pre_getData ($where, $where_array, $parent_data=null)
    // perform custom processing before database record(s) are retrieved.
    // (WHERE is supplied in two formats - string and array)
    // $parent_data may contain contents of current record in the parent object.
    {
        if (empty($where)) {
            // obtain $where string from $fieldarray which has just been loaded
            unset($parent_data['audit_dtl_key']);  // ignore this entry
            $where = array2where($parent_data);
        } // if

        $where = trim($where, ' ()');

        // are we looking for 'similar' or 'exact'?
        $pattern =& $GLOBALS['settings']['pattern'];
        if ($pattern == 'exact') {
            // pkey must match $where exactly
            $where = "pkey='" . addslashes($where) . "'";
        } else {
            // pkey may contain other values as well as what is in $where
            // NOTE: must use addslashes TWICE for LIKE operator (now performed in DML class)
            //$where = "pkey LIKE '%" . addslashes(addslashes($where)) . "%'";
            $where = "pkey LIKE '%" . addslashes($where) . "%'";
        } // if

        // remove this so that it does not allow 'date' to appear in the order by clause
        unset($this->fieldspec['date']);

        if (isset($GLOBALS['search'])) {
            // this may have values for base_name and table name
        	$this->sql_search_orig = $GLOBALS['search'];
            $this->sql_search      = $GLOBALS['search'];
        } // if

        return $where;

    } // _cm_pre_getData

// ****************************************************************************
} // end class
// ****************************************************************************

?>
