<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
<cfset newurl= "http://www."& replace(cgi.server_name,'http://',"")>
<cfset k = structdelete(session, 'mail', "false") />
<cfset k = structdelete(session, 'cartid', "false") />

  <CFHEADER statuscode="301" statustext="Moved Permanently"/>
<CFHEADER name="Location"  value="#newurl#" />
<cfabort />
</cfif>