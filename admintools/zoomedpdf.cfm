<!---<cfheader name='Content-Disposition' value='filename=Report.pdf'>
<cfcontent type="application/pdf"> 
--->
<cfparam name=itemlist default="0">
<cfparam name=width default="250">
 <cfdocument format="PDF"> 
<a href="zoomeditems.cfm">Item List Form</a>
<cfquery name=zoomeditems datasource='gemssql'>
Select newitem, cat, size, storage,inventory from items where newitem in (<cfoutput>#itemlist#</cfoutput>) <cfif width is 251>
order by storage</cfif>
</cfquery>
<cfset i = 1>
<table width="100%" align="center" border="0" style="border-collapse:collapse">

<tr>
<cfloop query=zoomeditems>
<td>
<img height="auto" src="/images/<cfoutput>#cat#/#newitem#.jpg" alt="#newitem#" width=#width#>
#newitem#<cfif width is 251> #storage# inventory:#inventory#<br></cfif>
</cfoutput>
</td>
<cfif i eq 4>
	</tr><tr>
    <cfset i = 0>
</cfif>
<cfset i = i+1>
</cfloop>
</tr>

</table>
</cfdocument> 