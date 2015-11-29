<cfparam name="J_username" default="">
<cfif j_username contains "aria">
<cfabort>
</cfif>

	<cflogin cookiedomain=".semiprecious.com" applicationtoken="wwwsemiprecious" idletimeout="15000">
		<cfquery datasource="sptm" username="nitish" password="rangeela"  name="valid">
		select * from users where apptt = '#cflogin.name#' and password = '#cflogin.password#'
		</cfquery>
		<cfif valid.recordcount >
	<cfloginuser name="tmuser" password="#cflogin.password#" roles="#cflogin.name#">
	<cfset session.apptt  = cflogin.name >
		<cfset session.mail  = application.admin_email>
		<cflocation url="mainmenu.cfm" addtoken="no"> 
		</cfif>
	</cflogin>
	
	<cfif not isuserloggedin() or not isdefined("session.apptt")>
<cflogout />
<cflocation url="login.cfm" addtoken="no" />
</cfif>
<cfif isdefined("error")>
	   
</cfif>

	<!--- --->