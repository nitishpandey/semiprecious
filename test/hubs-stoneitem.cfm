<td valign="top"><table cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" valign="top"><cfoutput> <h2>
<a href="#themelink#" class="hubs_item">
	   <cfif cgi.server_name contains "wholesale">	
WHOLESALE #subcat# #displaycateg#<cfelse> 
	  #subcat# #displaycateg#</cfif> </a></h2></cfoutput> </td>
    </tr>
    <cfif session.mail eq application.admin_email>
    <tr>
    <td colspan="2" align="center">
    <cfoutput><a href="/admintools/stoneedit.cfm?category=#cat#&subcat=#subcat#">Retail EDIT</a></cfoutput>
    </tr>
    </cfif>
    <tr>
      <cfset mySpaceFreeVariable = ReReplace(themedesc, "[[:space:]]","","ALL")>
      <cfif  mySpaceFreeVariable neq ""  and mySpaceFreeVariable neq " ">
        <td valign="top" ><cfoutput><a href="#themelink#"><img src="#themeimage#"  border="0"></a></cfoutput></td>
        <td style="padding-left:5px" valign="top"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'> <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com"><cfelse><cfoutput> #themedesc#</cfoutput></cfif> </span> </td>
      <cfelse>
        <td valign="top" colspan="2" align="center" ><cfoutput><a href="#themelink#"><img src="#themeimage#"  border="0"></a></cfoutput></td>
      </cfif>
    </tr>
  </table></td>
