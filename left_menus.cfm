
<cfif isdefined("url.live_support")>
<cfset application.live_support = url.live_support />
</cfif>
<cfparam name="category" default="all">
<cfparam name="categ" default="jewelry">
<cfif category neq "" and category neq "all" and category neq "chains">
  <cfset categ = category>
  <cfelse>
  <cfset categ = "jewelry">
</cfif>
<cfif cgi.server_name contains "wholesale">
<!---  <table><cfinclude template="includes/search.cfm"></table> 
<cfinclude template="/wholesale-jewellery/wholesaleleftmenu.cfm">--->
<cfelse>

<!---<cfquery name=groupnow datasource="gemssql">
select top 4  groupname from groupings where <cfif category neq "all" and category neq "">cat='#category#' and</cfif> domain='#cgi.server_name#' order by hubsequence
</cfquery>
--->
<table border="0" align=center cellpadding="0" cellspacing="0" width="140px" style="margin-top:2px;margin-right:5px;padding-top:4px;">
<!---  <tr>
    <td colspan="3">

	<table cellpadding="0" cellspacing="0">
	<tr><td>By Theme:<br>
	<cfoutput query=groupnow>
<a href=/shaped/#lcase(groupname)#-gemstones-<cfif categ is 'jewelry'>jewellery<cfelse>#categ#</cfif>.cfm class="side_link">#lcase(groupname)#</a><br>
</cfoutput><br>
<cfoutput><a href=/#categ#.cfm >More By Theme</a></cfoutput>
</td></tr>
<tr><td>&nbsp;</td></tr>
</table>			
	</td>

  </tr>--->


  
  <!--- Start color popup button ---><tr><td colspan=3 align=center>
   <cfinclude template="includes/search.cfm">		
   	<cfif application.live_support > 
   <a onclick="open_live_support()" href="javascript://"><img src="/images/callus.png" height="20px" valign="center" border=0 />&nbsp;<span style="position:relative;bottom:4px">Online Help</span></a>     
 <div style="border:1px ridge #0A0 ;margin-top:4px;padding:2px 4px" align=center> 
 <a href="#" class="login_link"   onClick='javascript:var d = document.getElementById("link").innerHTML; document.getElementById("chat").innerHTML = d;' > 
			  
<img src="/images/callus.png" height="20px" valign="center" border=0 />&nbsp;<span style="position:relative;bottom:4px">Online Help</span></a></div>
	
 </cfif>  	
   </td></tr> 
<cfif category neq "gems">
    <!-- Start Gemstone listing -->
  <CFINCLUDE TEMPLATE="subcatvertical.cfm">
    <!-- End Gemstone listing -->
    <tr>
      <td colspan="3">&nbsp;</td>
    </tr>
  </cfif>
<!--- have put this here to create space between search box and below menu. CSS wouldn't help --->

  <tr style="margin-top:4px;padding-top:1px;">
    <td border=0 align="right" width="8px" style="margin-top:4px;padding:0px">
    	&nbsp;</td>
    <td style="cursor:pointer" border=0 align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftColorDisplay')"  style="margin-top:4px;padding:0px">
    <cfoutput>#categ# by <br />Color</cfoutput>
    </td>
    <td border=0 align="left"  width="8px" style="padding:0px;margin-top:4px;">
    	&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" style="margin-left:5px;">
    <div id="LeftColorDisplay" style="display:none;">
        <table cellpadding="0" cellspacing="0">
          <cfloop index="Color1" list="black,blue,brown,green,gray,multi-color,orange,pink,purple,red,white,yellow">
            <tr>
              <td colspan=3 ><cfoutput> 
              <cfif category eq "all" or category eq "">
              <a href="/#Color1#-gemstone-jewelry.cfm" class="side_link"> #Color1#</a> 
              <cfelse>
               <a href="/color-gem-stone/#Color1#-#categ#.cfm" class="side_link"> #Color1#</a> 
             
			  </cfif>
			  </cfoutput> </td>
            </tr>
          </cfloop>
        </table>
      </div>
      </td>
  </tr>
  <!--- End color popup button --->
<!---  <tr>
    <td colspan="3">
	<font size="4" face="Bradley Hand ITC"><cfoutput>#category#</cfoutput> by Price:</font><br>
<a href="/jewelry-under-$10.cfm"><font size="4" face="Bradley Hand ITC">under 10</font></a><br>
<a href="/jewelry-under-$20.cfm"><font size="4" face="Bradley Hand ITC">$11-$20</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?priceless=30&priecegreater=20"><font size="4" face="Bradley Hand ITC">$21-$30</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?priceless=50&priecegreater=30"><font size="4" face="Bradley Hand ITC">$30-$50</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?pricegreater=49&priceless=1000"><font size="4" face="Bradley Hand ITC">Over $50</font></a><br><br>
&nbsp;
	</td>
  </tr>
--->  <!--- Start birthstone popup button --->
  <tr>
    <td border=0 align="right" width="8px" style="padding:0px">
    	&nbsp;</td>
    <td style="cursor:pointer" border=0 align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftBirthstoneDisplay')"  style="padding:0px">
    Jewelry by Birthstone
    </td>
    <td border=0 align="left"  width="8px" style="padding:0px">
    	&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" style="margin-left:15px;"><div id="LeftBirthstoneDisplay" style="display:none;">
        <table cellpadding="0" cellspacing="0">
          <cfloop index="Month" list="january,february,march,april,may,june,july,august,september,october,november,december">
            <tr>
              <td colspan=3 ><cfoutput> <a href="/#Month#-birthstone.cfm" class="side_link"> #Month# birthstone</a> </cfoutput> </td>
            </tr>
          </cfloop>
        </table>
      </div></td>
  </tr>
  <!--- End birthstone popup button --->
  

</table>
 </cfif>