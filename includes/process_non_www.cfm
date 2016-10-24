<cftry>
<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
	<cfset newurl= "#Application.protocol#://www."& replace(cgi.server_name,'http://',"") />
		<cfif cgi.query_string neq "">
		<cfset newurl= newurl& "#lcase(CGI.SCRIPT_NAME)#?#CGI.QUERY_STRING#" />
	<cfelse>
		<cfset newurl= "#newurl##lcase(CGI.SCRIPT_NAME)#" />
	</cfif>
	<cfheader statuscode="301" statustext="Moved permanently" />
	<cfheader name="Location" value="#newurl#" />
</cfif>

<cfif #cgi.server_name# contains "forcesofindia">
	<cfif cgi.query_string neq "">
		<cfset newurl= "#Application.protocol#://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" />
	<cfelse>
		<cfset newurl= "#Application.protocol#://www.semiprecious.com#CGI.SCRIPT_NAME#" />
	</cfif>
	<cfheader statuscode="301" statustext="Moved permanently" />
	<cfheader name="Location" value="#newurl#" />

</cfif>
<cfif #cgi.server_name# contains "semiprecious.in">
	<cfif cgi.query_string neq "">
		<cfset newurl= "#Application.protocol#://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#" />
	<cfelse>
		<cfset newurl= "#Application.protocol#://www.semiprecious.com#CGI.SCRIPT_NAME#" />
	</cfif>
	<cfheader statuscode="301" statustext="Moved permanently" />
	<cfheader name="Location" value="#newurl#" />
</cfif>
<cfcatch type="any"></cfcatch>

</cftry>