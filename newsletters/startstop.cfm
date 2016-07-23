<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfset Application.nlerrorcount = 5>
Error mailing reset. <br />
<cfquery datasource="semiprecious" name="state">
select nlstatus from memberinfo order by nlstatus
</cfquery>
<cfif state.nlstatus>
<cfquery datasource="semiprecious">
update memberinfo set nlstatus = 0 where email = 'nitishpandey@indiatimes.com'
</cfquery>
Stopped.Click here to <a href="startstop.cfm">start</a>. 
<cfelse>
<cfquery datasource="semiprecious">
update memberinfo set nlstatus = 99 where email = 'nitishpandey@indiatimes.com'
</cfquery>
  Started. Click here to <a href="startstop.cfm">stop</a>. 
</cfif>
</body>
</html>
