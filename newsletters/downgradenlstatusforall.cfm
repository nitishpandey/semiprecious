<html>
<head>
<title>All downgraded by one</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="semiprecious" name="q">
update  memberinfo set nlstatus = nlstatus - 1 where (nlstatus < 99 and nlstatus > 0)
</cfquery>
<a href="../transient.cfm"> Click here to check status. </a>
</body>
</html>
