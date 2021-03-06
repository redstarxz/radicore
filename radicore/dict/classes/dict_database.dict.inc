<?php
    // file created on June 9, 2017, 7:38 am
    
    // field specifications for table dict.dict_database
    $fieldspec['database_id']               = array('type' => 'string',
                                                    'size' => 64,
                                                    'pkey' => 'y',
                                                    'required' => 'y',
                                                    'lowercase' => 'y',
                                                    'control' => 'dropdown',
                                                    'optionlist' => 'database_id');
    
    $fieldspec['database_name']             = array('type' => 'string',
                                                    'size' => 80,
                                                    'required' => 'y');
    
    $fieldspec['database_desc']             = array('type' => 'string',
                                                    'size' => 65535,
                                                    'control' => 'multiline',
                                                    'cols' => 70,
                                                    'rows' => 5,
                                                    'nosearch' => 'y');
    
    $fieldspec['subsys_id']                 = array('type' => 'string',
                                                    'size' => 16,
                                                    'required' => 'y',
                                                    'uppercase' => 'y',
                                                    'control' => 'dropdown',
                                                    'optionlist' => 'subsys_id');
    
    $fieldspec['created_date']              = array('type' => 'datetime',
                                                    'size' => 20,
                                                    'required' => 'y',
                                                    'default' => '2000-01-01 00:00:00',
                                                    'autoinsert' => 'y',
                                                    'noedit' => 'y',
                                                    'nosearch' => 'y');
    
    $fieldspec['created_user']              = array('type' => 'string',
                                                    'size' => 16,
                                                    'required' => 'y',
                                                    'default' => 'UNKNOWN',
                                                    'autoinsert' => 'y',
                                                    'noedit' => 'y',
                                                    'nosearch' => 'y');
    
    $fieldspec['revised_date']              = array('type' => 'datetime',
                                                    'size' => 20,
                                                    'autoupdate' => 'y',
                                                    'noedit' => 'y',
                                                    'nosearch' => 'y');
    
    $fieldspec['revised_user']              = array('type' => 'string',
                                                    'size' => 16,
                                                    'autoupdate' => 'y',
                                                    'noedit' => 'y',
                                                    'nosearch' => 'y');
    
    // primary key details 
    $this->primary_key                      = array('database_id');
    
    // unique key details 
    $this->unique_keys                      = array();
    
    // child relationship details 
    $this->child_relations[]                = array('child' => 'dict_relationship',
                                                    'type' => 'RES',
                                                    'fields' => array('database_id' => 'database_id_snr'));
    
    $this->child_relations[]                = array('child' => 'dict_relationship',
                                                    'type' => 'RES',
                                                    'fields' => array('database_id' => 'database_id_jnr'));
    
    $this->child_relations[]                = array('child' => 'dict_table',
                                                    'type' => 'DEL',
                                                    'fields' => array('database_id' => 'database_id'));
    
    // parent relationship details 
    $this->parent_relations[]               = array('parent' => 'mnu_subsystem',
                                                    'dbname' => 'menu',
                                                    'subsys_dir' => 'menu',
                                                    'parent_field' => 'subsys_name',
                                                    'fields' => array('subsys_id' => 'subsys_id'));
    
    // determines if database updates are recorded in an audit log 
    $this->audit_logging                    = TRUE;
    
    // default sort sequence 
    $this->default_orderby                  = 'database_id';
    
    // alternative language options 
    $this->alt_language_table               = '';
    $this->alt_language_cols                = '';
    
    // alias names 
    $this->nameof_start_date                = '';
    $this->nameof_end_date                  = '';
    
    // finished
?>