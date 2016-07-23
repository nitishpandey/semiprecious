<html>
<head>
<title>Harish Make Urgently</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
 <cfquery datasource="gemssql" name="s">
  select cartid from cartstatus where status ='harish' order by cartid
</cfquery>
<cfoutput query="s">
<a href=itemsell.cfm?cartid=#cartid#>#CartID#</a><br>
</cfoutput>
</body>
</html>
