<html>
<head>
<title>Addresses UnShipped</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
  <cfquery datasource="gemssql" name="addresses">
  select top 20 Firstname, LastName, address1, address2, city, state, Country, email, cartstatus.cartid from 
  purchase ,  cartstatus where cast(cartstatus.cartid as varchar(20)) = purchase.cartid
  and indate > #createodbcdate(dateadd('d',-20,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  or paymode in ('2co','auth.net','pp','chck','goog') order by 
cartstatus.cartid desc

</cfquery>

<cfoutput query="addresses">
#Firstname# #LastName#<br> #address1# #address2# <br>#city#, #state#<br>#Country#<br> #email# <p>
</cfoutput>

</body>
</html>
