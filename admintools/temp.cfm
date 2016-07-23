<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

		<cfquery name="addRefund" datasource="gemssql">
				update buyingrecord set quantity = quantity - 1 where cartid = 104731 and optionid = 0 and itemid = 1586 
		</cfquery>

		<cfquery name="addRefund" datasource="gemssql">
				select * from buyingrecord where cartid = 104731
		</cfquery>
		<Cfdump var="#addRefund#" />

</body>
</html>
