<html>
<head>
<title>Update Cartid</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="semiprecious" >
update cartstatus set cost = #url.cartvalue# where cartid = #url.cartid#
</cfquery>
</body>
</html>
