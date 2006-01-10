<?php
    // file created on April 24, 2005, 7:29 pm
    
    // field specifications for table survey.survey_question
    $fieldspec['survey_id']                 = array('type' => 'integer',
                                                    'size' => 5,
                                                    'minvalue' => 0,
                                                    'maxvalue' => 65535,
                                                    'pkey' => 'y',
                                                    'required' => 'y',
                                                    'default' => '0');
    
    $fieldspec['section_id']                = array('type' => 'integer',
                                                    'size' => 5,
                                                    'minvalue' => 0,
                                                    'maxvalue' => 65535,
                                                    'pkey' => 'y',
                                                    'required' => 'y',
                                                    'default' => '0');
    
    $fieldspec['question_id']               = array('type' => 'integer',
                                                    'size' => 5,
                                                    'minvalue' => 0,
                                                    'maxvalue' => 65535,
                                                    'pkey' => 'y',
                                                    'required' => 'y',
                                                    'default' => '0',
                                                    'noedit' => 'y');
    
    $fieldspec['question_seq']              = array('type' => 'integer',
                                                    'size' => 5,
                                                    'minvalue' => 0,
                                                    'maxvalue' => 65535,
                                                    'required' => 'y',
                                                    'default' => '0',
                                                    'noedit' => 'y');
    
    $fieldspec['question_text']             = array('type' => 'string',
                                                    'size' => 255,
                                                    'required' => 'y',
                                                    'control' => 'multiline',
                                                    'cols' => 70,
                                                    'rows' => 5);
    
    $fieldspec['answer_type']               = array('type' => 'string',
                                                    'size' => 1,
                                                    'required' => 'y',
                                                    'uppercase' => 'y',
                                                    'control' => 'dropdown',
                                                    'optionlist' => 'answer_type');
    
    $fieldspec['advice_text']               = array('type' => 'string',
                                                    'size' => 65535,
                                                    'control' => 'multiline',
                                                    'cols' => 70,
                                                    'rows' => 5);
    
    $fieldspec['risk_status_id']            = array('type' => 'integer',
                                                    'size' => 3,
                                                    'minvalue' => 0,
                                                    'maxvalue' => 127,
                                                    'required' => 'y',
                                                    'default' => '0',
                                                    'control' => 'dropdown',
                                                    'optionlist' => 'risk_status_id');
    
    $fieldspec['created_date']              = array('type' => 'datetime',
                                                    'size' => 20,
                                                    'required' => 'y',
                                                    'default' => '0000-00-00 00:00:00',
                                                    'autoinsert' => 'y',
                                                    'noedit' => 'y');
    
    $fieldspec['created_user']              = array('type' => 'string',
                                                    'size' => 16,
                                                    'autoinsert' => 'y',
                                                    'noedit' => 'y');
    
    $fieldspec['revised_date']              = array('type' => 'datetime',
                                                    'size' => 20,
                                                    'autoupdate' => 'y',
                                                    'noedit' => 'y');
    
    $fieldspec['revised_user']              = array('type' => 'string',
                                                    'size' => 16,
                                                    'autoupdate' => 'y',
                                                    'noedit' => 'y');
    
    // primary key details 
    $this->primary_key                      = array('survey_id',
                                                    'section_id',
                                                    'question_id');
    
    // unique key details 
    $this->unique_keys                      = array();
    
    // child relationship details 
    $this->child_relations[]                = array('child' => 'answer_option',
                                                    'type' => 'DEL',
                                                    'fields' => array('survey_id' => 'survey_id',
                                                                      'section_id' => 'section_id',
                                                                      'question_id' => 'question_id'));
    
    $this->child_relations[]                = array('child' => 'number_option',
                                                    'type' => 'DEL',
                                                    'fields' => array('survey_id' => 'survey_id',
                                                                      'section_id' => 'section_id',
                                                                      'question_id' => 'question_id'));
    
    $this->child_relations[]                = array('child' => 'question_prompt',
                                                    'type' => 'DEL',
                                                    'fields' => array('survey_id' => 'survey_id',
                                                                      'section_id' => 'section_id',
                                                                      'question_id' => 'question_id'));
    
    $this->child_relations[]                = array('child' => 'survey_answer_dtl',
                                                    'type' => 'RES',
                                                    'fields' => array('survey_id' => 'survey_id',
                                                                      'section_id' => 'section_id',
                                                                      'question_id' => 'question_id'));
    
    // parent relationship details 
    $this->parent_relations[]               = array('parent' => 'risk_status',
                                                    'parent_field' => 'risk_status_desc',
                                                    'fields' => array('risk_status_id' => 'risk_status_id'));
    
    $this->parent_relations[]               = array('parent' => 'survey_hdr',
                                                    'parent_field' => 'survey_name',
                                                    'fields' => array('survey_id' => 'survey_id'));
    
    $this->parent_relations[]               = array('parent' => 'survey_section',
                                                    'parent_field' => 'section_name',
                                                    'fields' => array('survey_id' => 'survey_id',
                                                                      'section_id' => 'section_id'));
    
    // determines if database updates are recorded in an audit log 
    $this->audit_logging                    = TRUE;
    
    // default sort sequence 
    $this->default_orderby                  = '';
    
    // finished
?>