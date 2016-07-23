<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfloop from="35628" to="35880" index="idx" >

<cfquery datasource="gemssql" name="j">
select paymode as stat from cartstatus where cartid = #idx# where status = 'done'
</cfquery>
<cfif j.stat  eq 'WellsCC' or j.stat eq 'Paypal' or j.stat eq 'check' >
<cfinvoke component="inventory" method="updatepercart" returnvariable="r" >
<cfinvokeargument name="cartid" value="#idx#" />
</cfinvoke>

</cfif>
</cfloop>
</body>
</html>
