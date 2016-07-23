
<td valign="top"><table cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="2" valign="top"><cfoutput> <a href="#themelink#" style="text-decoration:none"></cfoutput><span
    style='font-size:36.0pt;font-family:"Palatino Linotype","serif"'><cfoutput>#Ucase(Left(themeitem,1))#</cfoutput></span><u><span style='font-size:14.0pt;font-family:"Palatino Linotype","serif";color:black'><cfoutput>#Ucase(Right(themeitem,Len(themeitem)-1))# #Ucase(subcat)# #Ucase(displaycateg)#</cfoutput></span></u> </a> </td>
    </tr>
    <cfif session.mail eq "acemat@vsnl.com">
    <tr>
    <td colspan="2" align="center">
    <cfoutput><a href="/admintools/groupedit.cfm?cat=#displaycateg#&grouping=#themeitem#">EDIT</a></cfoutput>
    </tr>
    </cfif>
    <tr>
      <cfset mySpaceFreeVariable = ReReplace(themedesc, "[[:space:]]","","ALL")>
      <cfif  mySpaceFreeVariable neq ""  and mySpaceFreeVariable neq " ">
        <td valign="top" ><cfoutput><a href="#themelink#"><img src="#themeimage#"  border="0"></a></cfoutput></td>
        <td style="padding-left:5px" valign="top"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'> <cfoutput> #themedesc#</cfoutput> </span> </td>
      <cfelse>
        <td valign="top" colspan="2" align="center" ><cfoutput><a href="#themelink#"><img src="#themeimage#"  border="0"></a></cfoutput></td>
      </cfif>
    </tr>
  </table></td>
