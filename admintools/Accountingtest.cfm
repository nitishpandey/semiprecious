<cfparam name="month" default="1">
<cfparam name="year" default="2008">

YEAR = <cfoutput>#year#</cfoutput>
<p>
<cfquery name="angelawholesale" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth, YEAR([indate]) as yr
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' AND (cartstatus.couponcode Like 'regwsale%' or cartstatus.couponcode Like 'wsale%')
GROUP BY year([indate]), Month([indate]), items.supplier
HAVING ((month([indate])=#month# AND YEAR([indate])=#YEAR#) AND ((items.supplier)='Angela'))   order by mnth
</cfquery>

<cfquery name="angelaretail" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' AND (cartstatus.couponcode not Like 'regwsale%' and cartstatus.couponcode not Like 'wsale%' or cartstatus.couponcode is null)
GROUP BY year([indate]),  Month([indate]), items.supplier
HAVING ((month([indate])=#month# AND YEAR([indate])=#YEAR# ) AND ((items.supplier)='Angela'))  order by mnth
</cfquery>
<!--- OC SALES --->

<cfquery name="OC" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' 
GROUP BY year([indate]),  Month([indate]), items.supplier
HAVING ((month([indate])=#month# AND YEAR([indate])=#YEAR#) AND ((items.supplier) like 'OC%'))  order by mnth
</cfquery>

<cfquery name="self" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' 
and (items.supplier not like 'OC%' and items.supplier not like 'angela%' and items.supplier not like 'CM%')
GROUP BY year([indate]),  Month([indate])
HAVING month([indate])=#month# AND YEAR([indate])=#YEAR#
</cfquery>


<cfquery name="selfretail" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'   AND (cartstatus.couponcode not Like 'regwsale%' and cartstatus.couponcode not Like 'wsale%' or cartstatus.couponcode is null)
and (items.supplier not like 'OC%' and items.supplier not like 'angela%' and items.supplier not like 'CM%') 
GROUP BY year([indate]),   Month([indate])
HAVING month([indate])=#month# AND YEAR([indate])=#YEAR#
</cfquery>
<cfquery name="selfwholesale" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'   AND (cartstatus.couponcode Like 'regwsale%' or cartstatus.couponcode  Like 'wsale%')
and (items.supplier not like 'OC%' and items.supplier not like 'angela%' and items.supplier not like 'CM%') 
GROUP BY year([indate]), Month([indate])
HAVING month([indate])=#month# AND YEAR([indate])=#YEAR#
</cfquery>

<cfquery name="overall" datasource="gemssql">
SELECT Sum(buyingrecord.cost*quantity) AS Cost, Sum(buyingrecord.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatus where indate >'1/1/07') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecord.cartid
where buyingrecord.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'  
GROUP BY year([indate]), Month([indate])
HAVING month([indate])=#month# AND YEAR([indate])=#YEAR#
</cfquery>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Accounting</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
	
<cfset commission=0>
Retail:<p>
<table border=1><tr color bgcolor="#FFFFCC""><td>Total Sale</td><td>Month</td></tr>
<cfoutput query="angelaretail">
<cfset commission=0.18*Sales+commission>
<tr>
<td>#Sales#</td><td>#mnth#</td></tr></cfoutput>
</table>
Commission = <cfoutput>#commission#</cfoutput>
<p>
<cfset commission=0>
<B>ORIENTAL CREST</B><p>

<table border="1"><tr color bgcolor="#FFFFCC""><td>Total Sale</td><td>Month</td></tr>
<cfoutput query="OC">
<cfset commission=0.20*Sales+commission>
<tr>
<td>#Sales#</td><td>#mnth#</td></tr></cfoutput>
</table>
Commission = <cfoutput>#commission#</cfoutput>
<p>

<B>OWN SALES</B><p>
Total:<br>
<table border="1"><tr color bgcolor="#FFFFCC""><td>Total Sale</td> <td>Cost</td><td>Month</td></tr>
<cfoutput query="self">
<tr>
<td>#Sales#</td><td>#cost#</td><td>#mnth#</td></tr></cfoutput>
</table>

<p>

Wholesale:<p>

<table border="1"><tr color bgcolor="#FFFFCC""><td>Total Sale</td> <td>Cost</td><td>Month</td></tr>
<cfoutput query="selfwholesale">
<tr>
<td>#Sales#</td><td>#cost#</td> <td>#mnth#</td></tr></cfoutput>
</table>

<p>

Retail:<p>

<table border="1"><tr color bgcolor="#FFFFCC""><td>Total Sale</td><td>Cost</td><td>Month</td></tr>
<cfoutput query="selfretail">
<tr>
<td>#Sales#</td> <td>#cost#</td> <td>#mnth#</td></tr></cfoutput>
</table>
<p>

<B><font color="#006633">ALL SALES COMBINED</font></B>

<table border="1"><tr color bgcolor="#FFFFCC""><td>Total Sale</td><td>Cost</td><td>Month</td></tr>
<cfoutput query="overall">
<tr>
<td>#Sales#</td><td>#cost#</td><td>#mnth#</td></tr></cfoutput>
</table>
<table><tr><td>Channel</td><td>Type</td><td>Month</td><td>Sales</td><td>Profit</td></tr>
<cfoutput query="overall">
<tr><td><cfset commission=0>
<B>Overall</B></td>
<td>Overall</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=sales - cost>#commission#</td>

</tr>
</cfoutput>
<cfoutput query="angelawholesale">
<tr><td><cfset commission=0>
<B>ANGELA</B></td>
<td>Wholesale</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=0.10*Sales+commission>#commission#</td>

</tr>
</cfoutput>
<cfoutput query="angelaretail">
<tr><td><cfset commission=0>
<B>ANGELA</B></td>
<td>Retail</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=0.18*Sales+commission>#commission#</td>

</tr>
</cfoutput>
<cfoutput query="OC">
<tr><td><cfset commission=0>
<B>Oriental</B></td>
<td>Wholesale</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=0.20*Sales+commission>#commission#</td>

</tr>
</cfoutput>
<cfoutput query="self">
<tr><td><cfset commission=0>
<B>Own</B></td>
<td>All</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=sales - cost>#commission#</td>

</tr>
</cfoutput>
<cfoutput query="selfretail">
<tr><td><cfset commission=0>
<B>Own</B></td>
<td>Retail</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=sales - cost>#commission#</td>

</tr>
</cfoutput>
<cfoutput query="selfwholesale">
<tr><td><cfset commission=0>
<B>Own</B></td>
<td>Wholesale</td><td>#mnth#</td><td>#Sales#</td><td><cfset commission=sales - cost>#commission#</td>

</tr>
</cfoutput>
</table>
</body>
</html>
