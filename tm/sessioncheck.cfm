<cfparam name="J_username" default="">
<cfif j_username contains "aria">
<cfabort>
</cfif>
<cfif j_username neq "">
		<cfquery datasource="sptm" username="nitish" password="rangeela"  name="valid">
		select * from users where apptt = '#j_username#' and password = '#j_password#'
		</cfquery>
	<cfset session.apptt  = '#j_username#'>
	<cfset session.mail  = application.admin_email>
</cfif>

	<cfif isdefined("cflogin")>

		<cfquery datasource="sptm" username="nitish" password="rangeela"  name="valid">
			select * from users where apptt = '#cflogin.name#' and password = '#cflogin.password#'
		</cfquery>
	</cfif>
		
		<cflogin  cookiedomain=".semiprecious.com,.semiprecious.in"  idletimeout="15000" applicationtoken="tm" >
			<cfif isdefined("cflogin")>

		<cfquery datasource="sptm" username="nitish" password="rangeela"  name="valid">
		select * from users where apptt = '#cflogin.name#' and password = '#cflogin.password#'
		</cfquery>

<cfif valid.recordcount gt 0>
	<cfloginuser name="tmuser" password="#cflogin.password#" roles="#cflogin.name#">
	<cfset session.apptt  = '#cflogin.name#'>
	<cfset session.mail  = application.admin_email>

	
	<cfelse>
		<cfloginuser name="nontmuser1" password="1" roles="1">
	
	 <cfset error=1>
<!--- 	<cflocation url="login.cfm" addtoken="no">
the cflogin structure is not defiend till /Cflogin end tag ---> 
</cfif>
<cfelse>
<cfloginuser name="nontmuser2" password="1" roles="1">
  <cfset error=1>
</cfif>

</cflogin>
<cfif isdefined("error")>
	 <cflocation url="login.cfm" addtoken="yes">  
	 <cfelse>
<!--- <cfoutput>	 <script language="JavaScript1.1">alert("user was already logged in as #getauthuser()#.");
	 </script></cfoutput> --->
</cfif>

	<!--- <cflocation url="mainmenu.cfm" addtoken="no"> --->