<cfquery name="groups" datasource="gemssql">
Select distinct groupname from groupings <cfif category neq "All">where cat = '#category#'</cfif>
</cfquery>

<cfoutput query="groups">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/shaped/#lcase(groupname)#-gemstone-<cfif category neq "All">#lcase(category)#<cfelse>jewellery</cfif>.cfm">
#Left( UCase(groupname), 1 )##Right( LCase( groupname), Len( groupname ) - 1 )#</a><br>
</cfoutput>