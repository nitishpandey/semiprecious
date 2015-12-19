<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>select newitem , basecost from items where price > 3.5*(basecost/40) order by basecost asc

<cfquery datasource="semiprecious" name="t">
select newitem , basecost from items where price > 3.5*(basecost/40) order by basecost asc
</cfquery>
<cfoutput query="t">
<a href="edititem.cfm?newitem=#newitem#">#newitem# (#basecost#) </a></cfoutput>
</body>
</html>
