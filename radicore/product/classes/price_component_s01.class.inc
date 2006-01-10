<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************
require_once 'price_component.class.inc';
class price_component_s01 extends price_component
{
    // ****************************************************************************
    // This subtype is for price_component by PRODUCT
    // or PRODUCT + PRODUCT_FEATURE
    // ****************************************************************************

    function _checkNextRecord ($fieldarray)
    // check that end_date of current record is earlier than end_date of next record.
    {
        //DebugBreak();
        require_once 'std.datevalidation.class.inc';
        $dateobj =& singleton::getInstance('date_class');

        $price_component_id = $fieldarray['price_component_id'];
        $price_type         = $fieldarray['price_type'];
        $product_id         = $fieldarray['product_id'];
        $prod_feature_id    = $fieldarray['prod_feature_id'];

        $where = "price_component_id>$price_component_id AND price_type='$price_type' AND product_id='$product_id'";

        if (empty($fieldarray['prod_feature_id'])) {
            $where .= " AND prod_feature_id IS NULL";
        } else {
            $where .= " AND prod_feature_id='$prod_feature_id'";
        } // if

        $dbobject =& singleton::getInstance('price_component');

        $dbobject->sql_select      = 'price_component_id,end_date';
        $dbobject->rows_per_page   = 1;
        $dbobject->sql_orderby     = 'price_component_id';
        $dbobject->sql_orderby_seq = 'asc';
        $next_rec_data = $dbobject->getData_unformatted($where);
        if ($dbobject->numrows > 0) {
            // use data from first row only
            $next_rec_data = $next_rec_data[0];
            // save primary key of next record
            $fieldarray['next_price_component_id'] = $next_rec_data['price_component_id'];

            $end_date      = $dateobj->getInternalDate($fieldarray['end_date']);
            $next_end_date = $dateobj->getInternalDate($next_rec_data['end_date']);
            if ($end_date >= $next_end_date) {
                // 'End Date must be earlier than End Date of next entry'
                $this->errors['end_date'] = getLanguageText('e0008');
                // use next end_date minus 1 day
                $fieldarray['end_date'] = $dateobj->addDays($next_end_date, -1);
            } // if
        } // if

        return $fieldarray;

    } // _checkNextRecord

    // ****************************************************************************
    function _checkPrevRecord ($fieldarray)
    // check that start_date of current record is later than start_date of previous record.
    {
        //DebugBreak();
        require_once 'std.datevalidation.class.inc';
        $dateobj =& singleton::getInstance('date_class');

        $price_component_id = $fieldarray['price_component_id'];
        $price_type         = $fieldarray['price_type'];
        $product_id         = $fieldarray['product_id'];
        $prod_feature_id    = $fieldarray['prod_feature_id'];

        $where = "price_component_id<$price_component_id AND price_type='$price_type' AND product_id='$product_id'" ;

        if (empty($fieldarray['prod_feature_id'])) {
            $where .= " AND prod_feature_id IS NULL";
        } else {
            $where .= " AND prod_feature_id='$prod_feature_id'";
        } // if

        $dbobject =& singleton::getInstance('price_component');

        $dbobject->sql_select      = 'price_component_id,start_date';
        $dbobject->rows_per_page   = 1;
        $dbobject->sql_orderby     = 'price_component_id';
        $dbobject->sql_orderby_seq = 'desc';
        $prev_rec_data = $dbobject->getData_unformatted($where);
        if ($dbobject->numrows > 0) {
            // use data from first row only
            $prev_rec_data = $prev_rec_data[0];
            // save primary key of previous record
            $fieldarray['prev_price_component_id'] = $prev_rec_data['price_component_id'];

            $start_date      = $dateobj->getInternalDate($fieldarray['start_date']);
            $prev_start_date = $dateobj->getInternalDate($prev_rec_data['start_date']);
            if ($start_date <= $prev_start_date) {
                // 'Start Date must be later than Start Date of previous entry'
                $this->errors['start_date'] = getLanguageText('e0009');
                // use previous start_date plus 1 day
                $fieldarray['start_date'] = $dateobj->addDays($prev_start_date, 1);
            } // if
        } // if

        return $fieldarray;

    } // _checkPrevRecord

    // ****************************************************************************
    function _cm_pre_getData ($where, $where_array)
    // perform custom processing before database record(s) are retrieved.
    // (WHERE is supplied in two formats - string and array)
    {
        //DebugBreak();
        // perform common processing defined in parent class
        $where = parent::_cm_pre_getData($where, $where_array);

        if ($GLOBALS['mode'] == 'update') {
            // make certain fields non-editable
            $this->fieldspec['product_id']['noedit']      = 'y';
            $this->fieldspec['prod_feature_id']['noedit'] = 'y';
            $this->fieldspec['price_type']['noedit']      = 'y';
        } // if

        return $where;

    } // _cm_pre_getData

    // ****************************************************************************
    function _cm_validateInsert ($fieldarray)
    // perform custom validation before insert.
    {
        //DebugBreak();
        // check against previous record (if it exists)
        $fieldarray = $this->_checkPrevRecord($fieldarray);
        if ($this->errors) return $fieldarray;

        return $fieldarray;

    } // _cm_validateInsert

    // ****************************************************************************
    function _cm_validateUpdate ($fieldarray, $originaldata)
    // perform custom validation before update and allow for changes being made.
    {
        //DebugBreak();
        // check against previous record (if it exists)
        $fieldarray = $this->_checkPrevRecord($fieldarray);

        // if ($this->errors) return $fieldarray;
        // check against next record (if it exists)
        $fieldarray = $this->_checkNextRecord($fieldarray);

        // if ($this->errors) return $fieldarray;

        return $fieldarray;

    } // _cm_validateUpdate

// ****************************************************************************
} // end class
// ****************************************************************************

?>