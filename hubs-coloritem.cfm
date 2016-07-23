
<td valign="top"><table cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" valign="top"><cfoutput> <a href="#themelink#" class="hubs_item">
#color# #displaycateg#</cfoutput></a> </td>
    </tr>
    <cfif session.mail eq application.admin_email>
    <tr>
    <td colspan="2" align="center">
    <cfoutput><a href="/admintools/coloredit.cfm?category=#cat#&color=#color#">EDIT</a></cfoutput>
    </tr>
    </cfif>
    <tr>
      <cfset mySpaceFreeVariable = ReReplace(themedesc, "[[:space:]]","","ALL")>
      <cfif  mySpaceFreeVariable neq ""  and mySpaceFreeVariable neq " ">
        <td valign="top" ><cfoutput><a href="#themelink#"><img src="http://#session.tld##themeimage#"  border="0"></a></cfoutput></td>
        <td style="padding-left:5px" valign="top"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'> <cfoutput> #themedesc#</cfoutput> </span> </td>
      <cfelse>
        <td valign="top" colspan="2" align="center" ><cfoutput><a href="#themelink#"><img src="http://#session.tld##themeimage#"  border="0"></a></cfoutput></td>
      </cfif>
    </tr>
  </table></td>
