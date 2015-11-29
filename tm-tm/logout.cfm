<cfif  isUserloggedin()>
as
</cfif>
<cflogout  />
<cfset session.apptt = "" />
<cfset session.mail = "" />
<cfif  isUserloggedin()>
a
<cfelse>
b
</cfif>
	<cflocation   url = "http://www.semiprecious.com/tm-tm/login.cfm"   addToken = "no">
