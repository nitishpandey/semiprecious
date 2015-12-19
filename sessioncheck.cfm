
<cfparam name="J_username" default="">
<cfif j_username contains "aria">
<cfabort>
</cfif>
<cfif j_username neq "">
		<cfquery datasource="sptm" username="nitish" password="rangeela"  name="valid">
		select * from users where apptt = '#j_username#' and password = '#j_password#'
		</cfquery>
		<cfif valid.recordcount >
	<cflogin  cookiedomain=".semiprecious.com,.semiprecious.in"  idletimeout="15000" applicationtoken="tm" >
	<cfloginuser name="tmuser" password="#cflogin.password#" roles="#cflogin.name#">
	
	</cflogin>
		<cfset session.apptt  = '#j_username#'>
		<cfset session.mail  = application.admin_email>
	<cfelse>
	<cflogout />
			</cfif>
</cfif>


<cfif isdefined("error")>
	 <cflocation url="login.cfm" addtoken="yes">  
</cfif>

	<!--- <cflocation url="mainmenu.cfm" addtoken="no"> --->