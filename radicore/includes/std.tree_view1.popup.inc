<?php
// *****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006 by Radicore Software Limited <http://www.radicore.org>
// *****************************************************************************

// name = std.tree_view1.popup.inc

// type = tree view 1 popup

// This will list nodes in a tree structure where everything is on the TREE_NODE table.
// A node can have only one parent but many children.

// add 'choose' button to action bar
$act_buttons['choose'] = 'CHOOSE';

require 'std.tree_view1.inc';           // activate page controller

?>