<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006-2016 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************
if (!class_exists('wf_workflow')) {
	require_once 'wf_workflow.class.inc';
} // if
class workflow_engine extends wf_workflow
{
    var $wf_user_id;

    // ****************************************************************************
    // This subclass deals with cases, or instances of workflow processes.
    // ****************************************************************************
    function startWorkflowCase ($task_id, $context)
    // Look for a workflow process for the specified task, and if one exists
    // then start a new case (a workflow instance).
    {
        // look for a valid and current workflow for this task_id
        $today = date('Y-m-d');
        $where = "start_task_id='$task_id' AND is_valid='Y' AND start_date<='$today' AND end_date>='$today'";
        $this->sql_select = 'workflow_id, workflow_name';
        $data = $this->getData_raw($where);
        if ($this->numrows < 1) {
            // no process defined for this task, so quit here
            return;
        } // if

        $context = trim($context, '()');

        // create a case (workflow instance) for this task
        $dbcase =& RDCsingleton::getInstance('wf_case');

        // there may be more than one workflow, but it is unlikely
        foreach ($data as $workflow) {
            $case_data['workflow_id']   = $workflow['workflow_id'];
            $case_data['context']       = $context;
            if (!empty($_SESSION['rdcaccount_id'])) {
                $case_data['rdcaccount_id'] = $_SESSION['rdcaccount_id'];   // use same account as current user
            } else {
                $case_data['rdcaccount_id'] = 1;                            // use shared account
            } // if
            $case_data = $dbcase->insertRecord($case_data);
            if ($dbcase->errors) {
                $this->errors = array_merge($this->errors, $dbcase->getErrors());
                return;
            } // if
        } // foreach

        return $case_data['case_id'];

    } // startWorkflowCase

    // ****************************************************************************
    function finishWorkItem ($case_id, $workitem_id, $context, $fieldarray)
    // a workitem (transition) has been completed, so update this workflow case.
    {
        // switch to correct directory for retrieving message text
        $GLOBALS['classdir'] = dirname($this->dirname);

        // retrieve the current workitem
        $dbworkitem =& RDCsingleton::getInstance('wf_workitem');

        // check that workitem has not already been processed
        $where = "case_id='$case_id' AND workitem_id='$workitem_id' AND workitem_status IN ('EN','IP')";
        $data = $dbworkitem->getData_raw($where);
        if ($dbworkitem->errors) {
            $this->errors = array_merge($this->errors, $dbworkitem->getErrors());
            return;
        } // if

        // if nothing found exit now
        if ($dbworkitem->numrows == 0) {
            return;
        } // if

        $workitem_user = $data[0]['user_id'];
        $rdcaccount_id = $data[0]['rdcaccount_id'];

        // mark this workitem as finished
        $workitem_array['case_id']         = $case_id;
        $workitem_array['workitem_id']     = $workitem_id;
        $workitem_array['rdcaccount_id']   = $rdcaccount_id;
        $workitem_array['workitem_status'] = 'FI';
        $workitem_array['finished_date']   = getTimeStamp();
        if (!empty($workitem_user)) {
            $workitem_array['user_id']     = $workitem_user;
        } else {
            $workitem_array['user_id']     = $_SESSION['logon_user_id'];
        } // if
        $workitem_array = $dbworkitem->updateRecord($workitem_array);
        if ($dbworkitem->errors) {
            $this->errors = array_merge($this->errors, $dbworkitem->getErrors());
            return;
        } // if

        $workflow_id   = $workitem_array['workflow_id'];
        $transition_id = $workitem_array['transition_id'];
        if (is_null($context)) {
        	$context   = trim($workitem_array['context'], '()');
        } else {
            $context   = trim($context, '()');
        } // if

        // ********************************************************************
        // find tokens on all input arcs (there may be more than one)
        $dbarc =& RDCsingleton::getInstance('wf_arc');

        $dbarc->sql_select = 'wf_arc.*, token_id, case_id, token_status';
        $dbarc->sql_from   = "wf_arc "
                           . "LEFT JOIN wf_token ON (wf_token.case_id=$case_id AND wf_token.workflow_id=wf_arc.workflow_id AND wf_token.place_id=wf_arc.place_id) ";
        $where = "workflow_id='$workflow_id' AND transition_id='$transition_id' AND direction='IN'";
        $arc_data = $dbarc->getData($where);
        if ($dbarc->errors) {
            $this->errors = array_merge($this->errors, $dbarc->getErrors());
            return;
        } // if

        // now mark them all as consumed
        $dbtoken =& RDCsingleton::getInstance('wf_token');

        foreach ($arc_data as $arc) {
            if ($arc['token_status'] == 'FREE') {
            	$arc['token_status']  = 'CONS';
                $arc['consumed_date'] = getTimeStamp();
                $arc['rdcaccount_id'] = $rdcaccount_id;
                $token_data = $dbtoken->updateRecord($arc);
                if ($dbtoken->errors) {
                    $this->errors = array_merge($this->errors, $dbtoken->getErrors());
                    return;
                } // if
            } // if
        } // foreach

        $place_id_in = $arc_data[0]['place_id'];
        $arc_type_in = $arc_data[0]['arc_type'];

        // ********************************************************************
        if ($arc_type_in == 'OR-SPLIT-I') {
            // ensure that the other transitions from this place are cancelled
            $this->_cancelSplit ($workflow_id, $transition_id, $case_id, $place_id_in, $arc_type_in);
            if ($this->errors) {
                return;
            } // if
        } // if

        // ********************************************************************
        // find the arc(s) which leave this transition and go to other places
        $dbarc->sql_select = 'wf_arc.*, place_type, place_name, condition_field, condition_operator, condition_value';
        $dbarc->sql_from   = "wf_arc "
                           . "LEFT JOIN wf_place ON (wf_place.workflow_id=wf_arc.workflow_id AND wf_place.place_id=wf_arc.place_id) ";
        $where = "workflow_id='$workflow_id' AND transition_id='$transition_id' AND direction='OUT'";
        $dbarc->sql_orderby = 'place_type ASC, place_name ASC';
        $arc_data = $dbarc->getData($where);
        if ($dbarc->numrows < 1) {
            // "There are no outbound arcs from transition 'X'"
            $this->errors[] = getLanguageText('e0010', $transition_id);
            return;
        } // if

        $arc_type = null;
        // check that all linked places have the same arc_type
        foreach ($arc_data as $arc) {
            if (empty($arc_type)) {
                // use the value from the first row
                $arc_type = $arc['arc_type'];
            } else {
                // compare with previous value
                if ($arc['arc_type'] != $arc_type) {
                    // "Outward arcs do not have the same ARC_TYPE"
                    $this->errors[] = getLanguageText('e0011');
                    return;
                } // if
            } // if
        } // foreach

        $token_data = array();      // initialise
        $token_data['case_id']       = $case_id;
        $token_data['workflow_id']   = $workflow_id;
        $token_data['context']       = $context;
        $token_data['user_id']       = $workitem_user;
        $token_data['rdcaccount_id'] = $rdcaccount_id;

        // process arc according to it's type
        switch ($arc_type) {
            case 'SEQ':
                if (count($arc_data) > 1) {
                    // "Cannot have more than one outward arc with ARC_TYPE='Sequential'"
                    $this->errors[] = getLanguageText('e0012');
                    return;
                } // if
                // create a single new token (use $this->wf_user_id in case it has been changed)
                $token_data = $this->_createToken($dbtoken, $token_data, $arc_data[0], $this->wf_user_id);
                if ($this->errors) return;
                break;

            case 'AND-SPLIT':
                if (count($arc_data) <= 1) {
                    // "Must have more than one outward arc with ARC_TYPE='AND-split'"
                    $this->errors[] = getLanguageText('e0013');
                    return;
                } // if
                // create a new token in every output place
                foreach ($arc_data as $arc) {
                    $result = $this->_createToken($dbtoken, $token_data, $arc, $this->wf_user_id);
                    if ($this->errors) return;
                } // foreach
                break;

            case 'OR-SPLIT-E':
                if (count($arc_data) <= 1) {
                    // "Must have more than one outward arc with ARC_TYPE='OR-split (explicit)'"
                    $this->errors[] = getLanguageText('e0014');
                    return;
                } // if

                // examine the pre-condition (guard) in each arc to find out if one tests as TRUE
                foreach ($arc_data as $arc) {
                    if (empty($arc['condition_field'])) {
                    	// this is the default after all others have tested as FALSE
                    	$result = TRUE;
                    } else {
                        // test to see if this condition evaluates to TRUE
                        $result = $this->evaluateCondition ($fieldarray,
                                                            $arc['condition_field'],
                                                            $arc['condition_operator'],
                                                            $arc['condition_value']);
                        if ($this->errors) {
                            return;  // there was some sort of error
                        } // if
                    } // if
                    if ($result == TRUE) {
                        $token_data = $this->_createToken($dbtoken, $token_data, $arc, $this->wf_user_id);
                        if ($this->errors) return;
                        break;
                    } // if
                } // foreach

                break;

            case 'OR-JOIN':
                if (count($arc_data) > 1) {
                    // "Cannot have more than one outward arc with ARC_TYPE='OR-join'"
                    $this->errors[] = getLanguageText('e0015');
                    return;
                } // if
                // create a single new token
                $token_data = $this->_createToken($dbtoken, $token_data, $arc_data[0], $this->wf_user_id);
                if ($this->errors) return;
                break;

            default:
                // "Invalid PLACE_TYPE on outward arc"
                $this->errors[] = getLanguageText('e0016');
                return;
        } // switch

        return;

    } // finishWorkItem

    // ****************************************************************************
    function evaluateCondition ($fieldarray, $name, $operator, $value)
    // evaluate the contents of $NAME, $OPERATOR and $VALUE
    {
        // check if $name is in format 'strlen(name)' or just plain 'name'
        $strlen = false;
        if (preg_match('/^strlen\((?<name>\w+)\)/i', $name, $regs)) {
            $name = $regs['name'];
            $strlen = true;
        } // if

        if (!array_key_exists($name, $fieldarray)) {
            // "CONDITION_FIELD cannot be found in data array"
            $this->errors = getLanguageText('e0076');
            return false;
        } // if

        if ($strlen === true) {
            $field = strlen($fieldarray[$name]);    // use the length of the field's value
        } else {
            $field = $fieldarray[$name];            // use the field's value
        } // if

        if (array_key_exists($value, $fieldarray)) {
            // string matches a name in $fieldarray, so use that field's value instead
            $value = $fieldarray[$value];
        } // if

        switch ($operator) {
            case '<>':
                if ($field <> $value) {
                    return true;
                } // if
                break;
            case '<=':
                if ($field <= $value) {
                    return true;
                } // if
                break;
            case '<':
                if ($field < $value) {
                    return true;
                } // if
                break;
            case '>=':
                if ($field >= $value) {
                    return true;
                } // if
                break;
            case '>':
                if ($field > $value) {
                    return true;
                } // if
                break;
            case '=':
            case '==':
                if ($field == $value) {
                    return true;
                } // if
                break;
            case '!=':
                if ($field != $value) {
                    return true;
                } // if
                break;
            case '===':
                if ($field === $value) {
                    return true;
                } // if
                break;
            case '!==':
                if ($field !== $value) {
                    return true;
                } // if
                break;
            default:
                // "CONDITION_OPERATOR is not valid"
                $this->errors = getLanguageText('e0077');
                return false;
        } // switch

        return false;

    } // evaluateCondition

    // ****************************************************************************
    function fireTimedEvent ($fieldarray)
    // a timed workitem has passed its deadline, so perform the transition (task)
    {
        $this->errors = array();

        $case_id       = $fieldarray['case_id'];
        $workitem_id   = $fieldarray['workitem_id'];
        $workflow_id   = $fieldarray['workflow_id'];
        $transition_id = $fieldarray['transition_id'];
        $context       = trim($fieldarray['context'], '()');

        // mark this workitem as finished
        $dbworkitem =& RDCsingleton::getInstance('wf_workitem');

        // check that workitem has not already been processed
        $where = "case_id='$case_id' AND workitem_id='$workitem_id' AND workitem_status='EN'";
        $data = $dbworkitem->getData_raw($where);
        if ($dbworkitem->errors) {
            $this->errors = array_merge($this->errors, $dbworkitem->getErrors());
            return $fieldarray;
        } // if

        // if nothing found exit now
        if ($dbworkitem->numrows == 0) {
            return $fieldarray;
        } // if

        // mark this workitem as 'in progress'
        $workitem_array['case_id']         = $case_id;
        $workitem_array['workitem_id']     = $workitem_id;
        $workitem_array['workitem_status'] = 'IP';
        $workitem_array['user_id']         = $_SESSION['logon_user_id'];
        $workitem_array = $dbworkitem->updateRecord($workitem_array);
        if ($dbworkitem->errors) {
            $this->errors = array_merge($this->errors, $dbworkitem->getErrors());
            return $fieldarray;
        } // if

        // ********************************************************************
        // find token on input arc (there should be only one)
        $dbarc =& RDCsingleton::getInstance('wf_arc');

        $dbarc->sql_select = 'wf_arc.*, token_id, case_id';
        $dbarc->sql_from   = "wf_arc "
                           . "LEFT JOIN wf_token ON (wf_token.case_id=$case_id AND wf_token.workflow_id=wf_arc.workflow_id AND wf_token.place_id=wf_arc.place_id) ";
        $where = "workflow_id='$workflow_id' AND transition_id='$transition_id' AND direction='IN'";
        $arc_data = $dbarc->getData($where);
        if ($dbarc->errors) {
            $this->errors = array_merge($this->errors, $dbarc->getErrors());
            return $fieldarray;
        } // if

        if (count($arc_data) < 1) {
         	// "Not enough inward Arcs for transition '%1\$s'"
         	$this->errors[] = getLanguageText('e0062', $transition_id);
         	return $fieldarray;
        } // if
        if (count($arc_data) > 1) {
         	// "Too many inward Arcs for transition '%1\$s'"
         	$this->errors[] = getLanguageText('e0063', $transition_id);
         	return $fieldarray;
        } // if
        if ($arc_data[0]['arc_type'] != 'OR-SPLIT-I') {
        	// "Timed Transition '%1\$s' must have an inward Arc of type OR-split (Implicit)"
        	$this->errors[] = getLanguageText('e0064', $transition_id);
         	return $fieldarray;
        } // if

        // now mark it as consumed
        $dbtoken =& RDCsingleton::getInstance('wf_token');

        foreach ($arc_data as $arc) {
            $arc['token_status']  = 'CONS';
            $arc['consumed_date'] = getTimeStamp();
            $token_data = $dbtoken->updateRecord($arc);
            if ($dbtoken->errors) {
                $this->errors = array_merge($this->errors, $dbtoken->getErrors());
                return $fieldarray;
            } // if
        } // foreach

        $place_id_in = $arc_data[0]['place_id'];
        $arc_type_in = $arc_data[0]['arc_type'];

        // ********************************************************************
        // find other arcs of type OR-split (Implicit) and cancel it/them
        $this->_cancelSplit ($workflow_id, $transition_id, $case_id, $place_id_in, $arc_type_in);
        if ($this->errors) {
            return $fieldarray;
        } // if

        // put timed transition (task) into the processing queue
        $next['task_id'] = $fieldarray['task_id'];
        $next['where']   = $context;
        append2ScriptSequence($next);

        return $fieldarray;

    } // fireTimedEvent

    // ****************************************************************************
    function _cancelSplit ($workflow_id, $transition_id, $case_id, $place_id_in, $arc_type_in)
    // one transition in an OR-Split (Implicit) has been fired, so cancel the other(s)
    {
        $dbarc =& RDCsingleton::getInstance('wf_arc');

        // find out if the place on the current inward arc has other inward arcs
        $dbarc->sql_select = 'wf_arc.transition_id, arc_type, workitem_id, case_id, workitem_status, rdcaccount_id';
        $dbarc->sql_from   = 'wf_arc '
                           . "LEFT JOIN wf_workitem ON (wf_workitem.case_id='$case_id' AND wf_workitem.workflow_id='$workflow_id' AND wf_workitem.transition_id=wf_arc.transition_id) ";
        $where = "workflow_id='$workflow_id' AND transition_id != '$transition_id' AND place_id='$place_id_in' AND direction='IN'";
        $arc_data = $dbarc->getData($where);
        if ($dbarc->numrows = 0) {
            // Not enough arcs of type 'OR-split (Implicit)' at place 'X'
            $this->errors[] = getLanguageText('e0031', $place_id_in);
            return;
        } else {
            $dbworkitem =& RDCsingleton::getInstance('wf_workitem');
            // check that all arcs from this place have the same arc_type
            foreach ($arc_data as $arc) {
                if ($arc['arc_type'] != $arc_type_in) {
                    // "Inward arcs from Place 'X' do not have the same ARC_TYPE"
                    $this->errors[] = getLanguageText('e0060', $place_id_in);
                    return;
                } // if

                if ($arc['workitem_status'] != 'CA') {
                	// mark this workitem as cancelled
                    $workitem_array = array();
                    $workitem_array['case_id']         = $case_id;
                    $workitem_array['workitem_id']     = $arc['workitem_id'];
                    $workitem_array['workitem_status'] = 'CA';
                    $workitem_array['cancelled_date']  = getTimeStamp();
                    $workitem_array['user_id']         = $_SESSION['logon_user_id'];
                    $workitem_array = $dbworkitem->updateRecord($workitem_array);
                    if ($dbworkitem->errors) {
                        $this->errors = array_merge($this->errors, $dbworkitem->getErrors());
                        return;
                    } // if
                } // if

            } // foreach
        } // if

        return;

    } // _cancelSplit

    // ****************************************************************************
    function _createToken ($dbtoken, $token_data, $arc_data, $wf_user_id)
    // create a token at the designated place for this workflow case
    {
        $token_data['place_id']   = $arc_data['place_id'];
        $token_data['place_type'] = $arc_data['place_type'];
        $token_data['user_id']    = $wf_user_id;
        $token_data = $dbtoken->insertRecord($token_data);
        if ($dbtoken->errors) {
            $this->errors = array_merge($this->errors, $dbtoken->getErrors());
            return;
        } // if

        return $token_data;

    } // _createToken

// ****************************************************************************
} // end class
// ****************************************************************************

?>
