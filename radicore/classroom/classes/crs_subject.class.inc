<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************
require_once 'std.table.class.inc';
class crs_subject extends Default_Table
{
    // ****************************************************************************
    // class constructor
    // ****************************************************************************
    function crs_subject ()
    {
        // save directory name of current script
        $this->dirname   = dirname(__file__);

        $this->dbms_engine = $GLOBALS['dbms'];
        $this->dbname      = 'classroom';
        $this->tablename   = 'crs_subject';

        // call this method to get original field specifications
        // (note that they may be modified at runtime)
        $this->fieldspec = $this->getFieldSpec_original();

    } // crs_subject

    // ****************************************************************************
    function _cm_getValRep ($item = '', $where)
    // get Value/Representation list as an associative array.
    {
        //DebugBreak();
        // provide values for dropdown list
        if (strtolower($item) == 'subject_id') {
            // get data from the database
            $this->sql_select     = 'subject_id, subject_name';
            $this->sql_orderby    = 'subject_name';
            $this->sql_ordery_seq = 'asc';
            $data = $this->getData(null);

            $array[''] = ' ';   // start with blank entry

            // convert each row into 'id=desc' in the output array
            foreach ($data as $row => $rowdata) {
                $rowvalues = array_values($rowdata);
                $array[$rowvalues[0]] = "$rowvalues[1]";
            } // foreach

            return $array;
        } // if

        return array();

    } // _cm_getValRep

// ****************************************************************************
} // end class
// ****************************************************************************

?>