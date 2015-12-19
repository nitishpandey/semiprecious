<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<CFQUERY DATASOURCE="semiprecious" NAME="searched">
Select * from track_keywords order by dated desc
</cfquery>

<cfoutput query="searched">
#keywords#, #dated# ||
</cfoutput>
</body>
</html>
