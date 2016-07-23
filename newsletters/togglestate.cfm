<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="semiprecious">
update memberinfo set nlstatus = 1
</cfquery>
<cfquery datasource="semiprecious" name="state">
select nlstatus from memberinfo order by nlstatus
</cfquery>
<cfif state.nlstatus>
<cfquery datasource="semiprecious">
update memberinfo set nlstatus = 0 where email = 'nitishpandey@indiatimes.com'
</cfquery>
Stopped
<cfelse>
<cfquery datasource="semiprecious">
update memberinfo set nlstatus = 99 where email = 'nitishpandey@indiatimes.com'
</cfquery>
Started.
</cfif>
</body>
</html>
