<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="sptm" username="nitish" password="rangeela" >
update task set closedon = #createodbcdatetime(createdate(2002,10,25))#
</cfquery>
</body>
</html>
