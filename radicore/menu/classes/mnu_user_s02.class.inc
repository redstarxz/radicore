<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************
require_once 'mnu_user.class.inc';
class mnu_user_s02 extends mnu_user
{
    // ****************************************************************************
    // This class is for use by script: mnu_user_upd(b).php
    // ****************************************************************************

    // ****************************************************************************
    function _cm_changeConfig ($where, $fieldarray)
    // Change the table configuration for the duration of this instance.
    // $where = a string in SQL 'where' format.
    // $fieldarray = the contents of $where as an array.
    {
        // create 'new_password' field
        $fieldarray['new_password1'] = '';
        $this->fieldspec['new_password1']['type'] = 'string';
        $this->fieldspec['new_password1']['size'] = $this->fieldspec['user_password']['size'];
        $this->fieldspec['new_password1']['password'] = 'y';
        $this->fieldspec['new_password1']['required'] = 'y';

        // get user to repeat input to avoid mistakes
        $fieldarray['new_password2'] = '';
        $this->fieldspec['new_password2']['type'] = 'string';
        $this->fieldspec['new_password2']['size'] = $this->fieldspec['user_password']['size'];
        $this->fieldspec['new_password2']['password'] = 'y';
        $this->fieldspec['new_password2']['required'] = 'y';

        // do not display current password
        $this->fieldspec['user_password']['nodisplay'] = 'y';

        // do not allow changes to user_name
        $this->fieldspec['user_name']['noedit'] = 'y';

        return $fieldarray;

    } // _cm_changeConfig

    // ****************************************************************************
    function _cm_commonValidation ($fieldarray, $originaldata)
    // perform validation that is common to INSERT and UPDATE.
    {
        //DebugBreak();
        // input password must not be same as original password
        if ($fieldarray['new_password1'] == $fieldarray['user_password']) {
            $this->errors['new_password1'] = getLanguageText('e0030'); // 'New password must not match current password';
            return $fieldarray;
        } // if

        // validate new password
        $new_password = $fieldarray['new_password1'];
        if ($new_password != $fieldarray['new_password2']) {
            $this->errors['new_password2'] = getLanguageText('e0031'); // 'Repeat password does not match new password';
            return $fieldarray;
        } // if

        // replace the current password with the new one
        $fieldarray['user_password'] = $new_password;

        // perform standard processing defined in the parent class
        $fieldarray = parent::_cm_commonValidation($fieldarray, $originaldata);

        return $fieldarray;

    } // _cm_commonValidation

// ****************************************************************************
} // end class
// ****************************************************************************

?>