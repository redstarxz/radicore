<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************
require_once 'crs_schedule.class.inc';
class crs_schedule_s02 extends crs_schedule
{
    // ****************************************************************************
    // this is for use in 'schedule_list(teacher).php'
    // ****************************************************************************
    function _cm_getExtraData ($where, $fieldarray)
    // Perform custom processing for the getExtraData method.
    // $where = a string in SQL 'where' format.
    // $fieldarray = the contents of $where as an array.
    {
        //DebugBreak();
        // get array for task_type and put into LOOKUP_DATA
        $array = $this->getValRep('day_no');
        $this->lookup_data['day_no'] = $array;

        return $fieldarray;

    } // _cm_getExtraData

    // ****************************************************************************
    function _cm_post_getData ($rowdata, &$where)
    // perform custom processing after database record(s) are retrieved.
    // NOTE: $where is passed BY REFERENCE so that it may be modified.
    {
        //DebugBreak();

        // this is only here to override the parent method

        return $rowdata;

    } // _cm_post_getData

    // ****************************************************************************
    function _cm_pre_getData ($where, $where_array)
    // perform custom processing before database record(s) are retrieved.
    // (WHERE is supplied in two formats - string and array)
    {
        //DebugBreak();
        $this->rows_per_page = 0;   // turn off pagination
        if (empty($this->sql_orderby)) {
            $this->sql_orderby = 'day_no, start_time';
        } // if

        if (empty($this->sql_select)) {
            $this->sql_select = "seq_no, room_id, day_no, start_time, end_time, lesson_short_name AS item_name, CONCAT('class ', class_id) as item_subname";
            $this->sql_from   = 'crs_schedule '
                              . 'LEFT JOIN crs_lesson USING (lesson_id) '
                              . 'LEFT JOIN crs_class_lesson ON (crs_schedule.lesson_id=crs_class_lesson.lesson_id) ';
        } // if

        // get current schedule_id
        require_once 'crs_schedule_hdr.class.inc';
        $dbobject =& singleton::getInstance('crs_schedule_hdr');
        $dbobject->sql_select = 'schedule_id,start_time,end_time,last_day_no';
        $data = $dbobject->getData("is_active='Y'");
        if ($dbobject->numrows > 0) {
            $schedule_id = $data[0]['schedule_id'];
        } else {
            $schedule_id = 0;
        } // if

        //DebugBreak();
        $where_array['schedule_id'] = $schedule_id;
        $where = array2where($where_array);

        if (!empty($data)) {
            // pass these values to the XSL transformation
            $this->xsl_params['start_time']  = $data[0]['start_time'];
            $this->xsl_params['end_time']    = $data[0]['end_time'];
            $this->xsl_params['last_day_no'] = $data[0]['last_day_no'];
        } // if

        return $where;

    } // _cm_pre_getData

// ****************************************************************************
} // end class
// ****************************************************************************

?>