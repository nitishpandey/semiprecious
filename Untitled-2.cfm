<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery name="a" datasource="sptm" username="nitish" password="rangeela">
select * from customrequest
</cfquery>
<cfoutput query="a">
#reqid#,#name#
</cfoutput>
</body>
</html>
