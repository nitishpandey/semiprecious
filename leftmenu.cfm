<cfif cgi.server_name does not contain "wholesale">
<cfparam name="category" default="all">
<cfparam name="categ" default="jewelry">
<cfif category neq "" and category neq "all">
  <cfset categ = category>
  <cfelse>
  <cfset categ = "jewelry">
</cfif>
<cfquery name=groupnow datasource="gemssql">
select top 4  groupname from groupings where <cfif category neq "all" and category neq "">cat='#category#' and</cfif> domain='#cgi.server_name#' order by hubsequence
</cfquery>

<table border="0" align=center cellpadding="0" cellspacing="0" width="140px" style="margin-right:5px">
  <tr>
    <td colspan="3">
<div id="LeftColorDisplay" style="display:none">
	By Theme:<br>
	<cfoutput query=groupnow>
<a href=/shaped/#groupname#-gemstones-<cfif categ is 'jewelry'>jewellery<cfelse>#categ#</cfif>>#lcase(groupname)#<br>
</cfoutput>
<cfoutput><a href=/#categ#.cfm>More By Theme</a></cfoutput>
</div>
		
	</td>
  </tr>
  <!--- Start color popup button --->
  <tr>
    <td border=0 align="right" width="8px" style="padding:0px"><img src="/images/green_left_curve.jpg" height="34" border="0" /></td>
    <td style="cursor:pointer" border=0 align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftColorDisplay')"  style="padding:0px">
    <cfoutput>#Left( UCase(categ), 1 )##Right( LCase( categ), Len( categ ) - 1 )# by&nbsp;Color</cfoutput>
    </td>
    <td border=0 align="left"  width="8px" style="padding:0px"><img src="/images/green_right_curve.jpg" height="34" border="0" /></td>
  </tr>
  <tr>
    <td colspan="3">
    <div id="LeftColorDisplay" style="display:none">
        <table cellpadding="0" cellspacing="0">
          <cfloop index="Color1" list="black,blue,brown,green,gray,multi-color,orange,pink,purple,red,white,yellow">
            <tr>
              <td colspan=3 ><cfoutput> 
              <cfif category eq "all" or category eq "">
              <a href="/#Color1#-gemstone-jewelry.cfm" class="side_link"> #Left( UCase(Color1), 1 )##Right( LCase( Color1), Len( Color1 ) - 1 )#</a> 
              <cfelse>
               <a href="/color-gem-stone/#Color1#-#categ#.cfm" class="side_link"> #Left( UCase(Color1), 1 )##Right( LCase( Color1), Len( Color1 ) - 1 )#</a> 
             
			  </cfif>
			  </cfoutput> </td>
            </tr>
          </cfloop>
        </table>
      </div>
      </td>
  </tr>
  <!--- End color popup button --->
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <!--- Start birthstone popup button --->
  <tr>
    <td border=0 align="right" width="8px" style="padding:0px"><img src="/images/green_left_curve.jpg" height="34" border="0" /></td>
    <td style="cursor:pointer" border=0 align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftBirthstoneDisplay')"  style="padding:0px">
    Jewelry by Birthstone
    </td>
    <td border=0 align="left"  width="8px" style="padding:0px"><img src="/images/green_right_curve.jpg" height="34" border="0" /></td>
  </tr>
  <tr>
    <td colspan="3"><div id="LeftBirthstoneDisplay" style="display:none">
        <table cellpadding="0" cellspacing="0">
          <cfloop index="Month" list="january,february,march,april,may,june,july,august,september,october,november,december">
            <tr>
              <td colspan=3 ><cfoutput> <a href="/#Month#-birthstone.cfm" class="side_link"> #Left( UCase(Month), 1 )##Right( LCase( Month), Len( Month ) - 1 )# birthstone</a> </cfoutput> </td>
            </tr>
          </cfloop>
        </table>
      </div></td>
  </tr>
  <!--- End birthstone popup button --->
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <cfif category neq "gems">
    <!-- Start Gemstone listing -->
    <CFINCLUDE TEMPLATE="subcatvertical.cfm">
    <!-- End Gemstone listing -->
    <tr>
      <td colspan="3">&nbsp;</td>
    </tr>
  </cfif>
<tr>
  
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" colspan="3" ><a href="http://austin.bbb.org/WWWRoot/Report.aspx?site=40&bbb=0825&firm=90026075"><img src="/images/bblogo.gif" border="0" width="80" height="126"></a> </td>
  </tr>
  <!--- End bbb logo --->
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</cfif>