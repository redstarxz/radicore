<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

<!--
//*****************************************************************************
// Copyright 2003-2005 by A J Marston <http://www.tonymarston.net>
// Copyright 2006 by Radicore Software Limited <http://www.radicore.org>
//*****************************************************************************
-->

<xsl:variable name="script"       select="/root/params/script"/>
<xsl:variable name="mode"         select="/root/params/mode"/>
<xsl:variable name="session_name" select="/root/params/session_name"/>
<xsl:variable name="script_time"  select="/root/params/script_time"/>
<xsl:variable name="doc_root"     select="/root/params/doc_root"/>
<xsl:variable name="help_root"    select="/root/params/help_root"/>
<xsl:variable name="menu_root"    select="/root/params/menu_root"/>
<xsl:variable name="http_host"    select="/root/params/http_host"/>
<xsl:variable name="taskid"       select="/root/params/taskid"/>

<xsl:variable name="session"      select="concat('session_name=',$session_name)" />

<xsl:variable name="show"         select="/root/params/text/show"/>
<xsl:variable name="select-all"   select="/root/params/text/select-all"/>
<xsl:variable name="unselect-all" select="/root/params/text/unselect-all"/>
<xsl:variable name="logout"       select="/root/params/text/logout"/>
<xsl:variable name="new-session"  select="/root/params/text/new-session"/>
<xsl:variable name="help"         select="/root/params/text/help"/>
<xsl:variable name="page-created" select="/root/params/text/page-created"/>
<xsl:variable name="seconds"      select="/root/params/text/seconds"/>
<xsl:variable name="print"        select="/root/params/text/print"/>
<xsl:variable name="noprint"      select="/root/params/text/noprint"/>

<xsl:variable name="client-side"  select="/root/params/client-side"/>
<xsl:variable name="print-preview" select="/root/params/print-preview"/>

<!--
//*****************************************************************************
// ACTBAR - create buttons in the action bar
//*****************************************************************************
-->
<xsl:template name="actbar">

  <xsl:if test="not($print-preview)">

    <div class="actionbar">

      <div class="left">
        <xsl:text> </xsl:text>  <!-- insert a space to prevent an empty element -->
        <xsl:for-each select="//actbar/button[starts-with(@id,'submit') or @id='choose']">
          <!-- create a button for each element within actionbar -->
          <input class="submit" type="submit" name="{@id}" value="{node()}" />
          <xsl:text> </xsl:text>
        </xsl:for-each>
      </div>

      <div class="right">
        <xsl:text> </xsl:text>  <!-- insert a space to prevent an empty element -->
        <xsl:for-each select="//actbar/button[not(starts-with(@id,'submit')) and not(@id='choose')]">
          <!-- create a button for each element within actionbar -->
          <input class="submit" type="submit" name="{@id}" value="{node()}" />
          <xsl:text> </xsl:text>
        </xsl:for-each>
      </div>

    </div>

  </xsl:if>

  <!-- create a hidden field for session_name -->
  <xsl:if test="$session_name">
    <input type="hidden" name="session_name" value="{$session_name}" />
  </xsl:if>

  <xsl:if test="not($print-preview)">

    <xsl:choose>
      <xsl:when test="$mode='logon'">
        <p class="scripttime"><xsl:value-of select="$page-created"/>&#160;<xsl:value-of select="$script_time"/>&#160;<xsl:value-of select="$seconds"/></p>
        <xsl:if test="not($client-side)">
          <p class="scripttime">(XSLT= $xsl$ <xsl:value-of select="$seconds"/>)</p>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <p class="scripttime">
          <xsl:value-of select="$page-created"/>&#160;<xsl:value-of select="$script_time"/>&#160;<xsl:value-of select="$seconds"/>
          <xsl:if test="not($client-side)">
            (XSLT= $xsl$ <xsl:value-of select="$seconds"/>)
          </xsl:if>
        </p>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:if>

</xsl:template> <!-- ACTBAR -->



<!--
//*****************************************************************************
// HELP - display hyperlinks for HELP and LOGOUT
//*****************************************************************************
-->
<xsl:template name="help">

  <div class="help">
    <p>
      <xsl:if test="not(//params/application='sample')">
        <!-- do not include this in the sample application -->
        <xsl:if test="not($mode='logon')">
          <!-- create a logout link -->
          <a href="{$menu_root}/logon.php" ><xsl:value-of select="$logout"/></a>
          <xsl:text> | </xsl:text>
          <!-- create a link to start a new session -->
          <!-- (this creates a new session name with a new session id) -->
          <a href="{$script}?action=newsession&amp;{$session}" ><xsl:value-of select="$new-session"/></a>
          <xsl:text> | </xsl:text>

          <xsl:choose>
            <xsl:when test="$print-preview">
              <!-- create a link to turn off print-preview mode -->
              <a href="{$script}?action=noprint&amp;{$session}" ><xsl:value-of select="$noprint"/></a>
            </xsl:when>
            <xsl:otherwise>
              <!-- create a link to redisplay the page in print mode -->
              <a href="{$script}?action=print&amp;{$session}" ><xsl:value-of select="$print"/></a>
            </xsl:otherwise>
          </xsl:choose>

          <xsl:text> | </xsl:text>
        </xsl:if>
      </xsl:if>

      <!-- create a HELP link -->
      <a href="{$help_root}/help.php?taskid={$taskid}"><xsl:value-of select="$help"/></a>
    </p>
  </div>

</xsl:template> <!-- HELP -->




<!--
//*****************************************************************************
// MENUBAR - create hyperlinks for each option on the current menu
//*****************************************************************************
-->
<xsl:template name="menubar">

  <xsl:if test="not($print-preview)">

    <div id="menubar">
      <!-- produce a list of menu items, with the one which is active being highlighted -->
      <ul>
        <xsl:for-each select="//menubar/button">
          <li>
            <xsl:choose>
              <xsl:when test="@active">
                <xsl:attribute name="class">active</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="class">inactive</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>

            <!-- create a link for each element within navbar -->
            <xsl:choose>
              <xsl:when test="//params/application='sample'">
                <!-- this is for the sample application -->
                <a href="{$help_root}/{@id}?{$session}"><xsl:value-of select="node()"/></a>
              </xsl:when>
              <xsl:otherwise>
                <!-- this is for the full application -->
                <a href="{$script}?selection={@id}&amp;{$session}"><xsl:value-of select="node()"/></a>
              </xsl:otherwise>
            </xsl:choose>

          </li>
        </xsl:for-each>
      </ul>
    </div>

    <div id="menustack-outer">
      <div id="menustack">

          <!-- this area is the same colour as the active item in the previous line -->
          <!-- it also contains entries for each page in the current hierarchy (aka 'breadcrumbs') -->
          <ul>

            <xsl:for-each select="//menubar/stack">
             <li>
                <xsl:choose>
                  <xsl:when test="position()=last() or @active">
                    <!-- last/active entry is not a hyperlink, just plain text -->
                    <xsl:value-of select="node()"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <!-- insert hyperlink -->
                    <a href="{$script}?selection={@id}&amp;{$session}">
                      <xsl:value-of select="node()"/>
                    </a>
                  </xsl:otherwise>
                </xsl:choose>

                <xsl:if test="not(position()=last())">
                  <!-- not last entry, so insert a '>>' separator before the next entry -->
                  <xsl:text>&#187;</xsl:text>
                </xsl:if>
              </li>
            </xsl:for-each>

          </ul>

          <!-- insert a blank paragraph to get round a bug in the Firefox browser -->
          <p>&#160;</p>
      </div>
    </div>

  </xsl:if>

</xsl:template> <!-- MENUBAR -->



<!--
//*****************************************************************************
// NAVBAR - create buttons in the navigation bar
//*****************************************************************************
-->
<xsl:template name="navbar"> <!-- this version is for LIST screens -->
  <xsl:param name="noshow"/>    <!-- if this is set do not include options to change page size -->
  <xsl:param name="noselect"/>  <!-- if this is set do not include options to select/unselect all -->

  <div class="navbar">

    <xsl:if test="//navbar/*[@context_preselect='N']">
      <!-- pick out the entries that do not require a selection to be made -->
      <p class="withoutselection">
        <xsl:for-each select="//navbar/*[@context_preselect='N']">
            <!-- create a button for each element within navbar -->
            <input class="submit" type="submit" name="{@id}" value="{node()}" />
            <xsl:text> </xsl:text>
        </xsl:for-each>
      </p>
    </xsl:if>

    <xsl:if test="not($noshow)">
      <!-- these links will allow the user to change the number of rows in the page -->
      <p class="show" >
        <xsl:choose>
          <xsl:when test="$numrows > 10">
            <a href="{$script}?{$session}&amp;pagesize=10"><xsl:value-of select="$show"/> 10</a>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="$show"/> 10</xsl:otherwise>
        </xsl:choose>
        <xsl:text> | </xsl:text>
        <xsl:choose>
          <xsl:when test="$numrows > 10">
            <a href="{$script}?{$session}&amp;pagesize=25"><xsl:value-of select="$show"/> 25</a>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="$show"/> 25</xsl:otherwise>
        </xsl:choose>
        <xsl:text> | </xsl:text>
        <xsl:choose>
          <xsl:when test="$numrows > 25">
            <a href="{$script}?{$session}&amp;pagesize=50"><xsl:value-of select="$show"/> 50</a>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="$show"/> 50</xsl:otherwise>
        </xsl:choose>
        <xsl:text> | </xsl:text>
        <xsl:choose>
          <xsl:when test="$numrows > 50">
            <a href="{$script}?{$session}&amp;pagesize=100"><xsl:value-of select="$show"/> 100</a>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="$show"/> 100</xsl:otherwise>
        </xsl:choose>
        <!-- insert a non-breaking space -->
        <xsl:text>&#160;</xsl:text>
      </p>
    </xsl:if>

    <xsl:if test="not($noselect)">
      <xsl:choose>
        <xsl:when test="not($select_one)">
          <!-- only display if the $select_one parameter is not set -->
          <p class="selection">
            <!-- these links will allow the user to toggle all select boxes either ON or OFF -->
            <!-- do this only if there is a field called 'selectbox' -->
            <xsl:if test="//item/cell[@field='selectbox']">
              <xsl:text>Selections:&#160;</xsl:text>
              <a href="{$script}?{$session}&amp;action=selectall"><xsl:value-of select="$select-all"/></a>
              <xsl:text> | </xsl:text>
              <a href="{$script}?{$session}&amp;action=unselectall"><xsl:value-of select="$unselect-all"/></a>
            </xsl:if>
            <!-- insert a on-breaking space -->
            <xsl:text>&#160;</xsl:text>
          </p>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="not($noshow)">
            <!-- if 'show' paragraph has been created there must be an empty 'selection' paragraph -->
            <p class="selection">&#160;</p>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="//navbar/*[@context_preselect='Y']">
      <!-- pick out the entries that require a selection to be made before the button is pressed -->
      <p class="withselection">
        <xsl:for-each select="//navbar/*[@context_preselect='Y']">
            <!-- create a button for each element within navbar -->
            <input class="submit" type="submit" name="{@id}" value="{node()}" />
            <xsl:text> </xsl:text>
        </xsl:for-each>
      </p>
    </xsl:if>

  </div>

</xsl:template>


<!-- this version is for DETAIL screens -->
<xsl:template name="navbar_detail">

  <xsl:if test="count(//navbar/*)&gt;0">

    <div class="navbar">
      <!-- no preselection is required as everything works off the current record -->
      <p class="withoutselection">
        <xsl:for-each select="//navbar/*">
            <!-- create a button for each element within navbar -->
            <input class="submit" type="submit" name="{@id}" value="{node()}" />
            <xsl:text> </xsl:text>
        </xsl:for-each>
      </p>
    </div>

  </xsl:if>

</xsl:template> <!-- NAVBAR -->

</xsl:stylesheet>