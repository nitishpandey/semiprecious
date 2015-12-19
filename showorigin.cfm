<html>
<head>
<title>Origin of a buyer</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif isdefined("url.cartid")>
<cfquery datasource="gemssql" name="s">
select * from visitrecord where cartid = -1*#Url.cartid#
</cfquery>
</cfif>
<table border="1" cellspacing="1" ><tr><td>From</td><td>ON</td><td>First Page</td></tr>
<cfoutput query="s">
<tr><td>&nbsp;#comingfrom#</td><td> #cameon#, </td><td> #firstpage#</td></tr>

</cfoutput>
</table>
</body>
</html>
