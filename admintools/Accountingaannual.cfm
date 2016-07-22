<cfif isuserinrole('superadmin')>
<cfparam name="month" default="#datepart('m',now())#" />
<cfset myquery = querynew('source,type,income,profit','VarChar,VarChar,Double,Double') />
<cfparam name="year" default="2011" />

<cfquery name="angelawholesale" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth, YEAR([indate]) as yr
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' AND (cartstatus.couponcode Like 'regwsale%' or cartstatus.couponcode Like 'wsale%')
GROUP BY year([indate]), Month([indate]), items.supplier
HAVING ((YEAR([indate])=#YEAR#) AND ((items.supplier)='Angela'))   order by mnth
</cfquery>

<cfquery name="angelaretail" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' AND (cartstatus.couponcode not Like 'regwsale%' and cartstatus.couponcode not Like 'wsale%' or cartstatus.couponcode is null)
GROUP BY year([indate]),  Month([indate]), items.supplier
HAVING (( YEAR([indate])=#YEAR# ) AND ((items.supplier)='Angela'))  order by mnth
</cfquery>
<!--- OC SALES --->

<cfquery name="OC" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' 
GROUP BY year([indate]),  Month([indate]), items.supplier
HAVING (( YEAR([indate])=#YEAR#) AND ((items.supplier) like 'OC%'))  order by mnth
</cfquery>

<cfquery name="self" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null' 
and (items.supplier not like 'OC%' and items.supplier not like 'angela%' and items.supplier not like 'CM%')
GROUP BY year([indate]),  Month([indate])
HAVING YEAR([indate])=#YEAR#
</cfquery>


<cfquery name="selfretail" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'   AND (cartstatus.couponcode not Like 'regwsale%' and cartstatus.couponcode not Like 'wsale%' or cartstatus.couponcode is null)
and (items.supplier not like 'OC%' and items.supplier not like 'angela%' and items.supplier not like 'CM%') 
GROUP BY year([indate]),   Month([indate])
HAVING YEAR([indate])=#YEAR#
</cfquery>
<cfquery name="selfwholesale" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'   AND (cartstatus.couponcode Like 'regwsale%' or cartstatus.couponcode  Like 'wsale%')
and (items.supplier not like 'OC%' and items.supplier not like 'angela%' and items.supplier not like 'CM%') 
GROUP BY year([indate]), Month([indate])
HAVING  YEAR([indate])=#YEAR#
</cfquery>

<cfquery name="overall" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth
FROM items, (select * from cartstatusall where indate >'1/1/07') as cartstatus INNER JOIN buyingrecordall ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'  
GROUP BY year([indate]), Month([indate])						
HAVING  YEAR([indate])=#YEAR#
</cfquery>
<!--- 
<cfquery name="annual" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth, indate
FROM items, (select * from cartstatus where indate >'1/1/10' ) as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'  
GROUP BY year([indate]), Month([indate])
order by indate
</cfquery>
<cfquery name="annual2" datasource="gemssql">
SELECT Sum(buyingrecordall.cost*quantity) AS Cost, Sum(buyingrecordall.rate*quantity) AS Sales, Month([indate]) AS mnth, indate
FROM items, (select * from cartstatusall where indate >'1/1/10') as cartstatus INNER JOIN buyingrecord ON cartstatus.cartid = buyingrecordall.cartid
where buyingrecordall.itemid=cast([items].[NEWITEM] as varchar(10)) AND cartstatus.paymode<>'null'  
GROUP BY year([indate]), Month([indate]),indate
order by indate
</cfquery>
--->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Accounting</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body lang="en-US">
<cfoutput><a href="?month=#evaluate(month-1)#">Prev</a><a href="accountingnew.cfm">Improved</a><a href="?month=#evaluate(month+1)#">Next</a>
#month#</cfoutput>

<cfset commission="0" />
<cfif month GT month(now())>
<table style="border:1 ridge brown;"><tr style="background-color:#DEF;"><td>Channel</td><td>Type</td><td>Sales</td><td>Profit</td></tr>

<tr><td>
<B>Overall</B></td>
<td>Overall</td><td>47308</td><td>30201</td>

</tr>

<tr><td>
<B>ANGELA</B></td>
<td>Wholesale</td><td>321</td><td>62</td>

</tr>

<tr><td>
<B>ANGELA</B></td>
<td>Retail</td><td>384</td><td>75</td>

</tr>

<tr><td>
<B>Own</B></td>
<td>All</td><td>46321</td><td>29056</td>

</tr>

<tr><td>
<B>Own</B></td>
<td>Retail</td><td>29781</td><td>23519</td>

</tr>

<tr><td>
<B>Own</B></td>
<td>Wholesale</td><td>16540</td><td>5497</td>

</tr>

</table>

<cfelse>
	<table style="border:1 ridge brown;"><tr style="background-color:#DEF;"><td>Channel</td><td>Type</td><td>Sales</td><td>Profit</td></tr>
<cfoutput query="overall">
<cfset commission=0 />
<cfset commission=sales - cost/44 />
<cfset newrow = QueryAddRow(myQuery,1) />
<cfset temp = QuerySetCell(myQuery,"source","overall") />
<cfset temp = QuerySetCell(myQuery,"type","overall") />
<cfset temp = QuerySetCell(myQuery,"income",Sales) />
<cfset temp = QuerySetCell(myQuery,"profit",commission) />
<tr><td>
<B>Overall</B></td>
<td>Overall</td><td>#round(Sales)#</td><td>#round(commission)# <cfset gm = 100*commission/sales />

 [ #Variables.gm# ]</td>

</tr>

</cfoutput>
<cfoutput query="angelawholesale">
<cfset commission=0 />
<cfset commission=0.10*Sales+commission>
<cfset newrow = QueryAddRow(myQuery,1) />
<cfset temp = QuerySetCell(myQuery,"source","angelawholesale") />
<cfset temp = QuerySetCell(myQuery,"type","WS") />
<cfset temp = QuerySetCell(myQuery,"income",Sales) />
<cfset temp = QuerySetCell(myQuery,"profit",commission) />
<tr><td>
<B>ANGELA</B></td>
<td>Wholesale</td><td>#round(Sales)#</td><td>#round(commission )#</td>

</tr>
</cfoutput>
<cfoutput query="angelaretail">
<cfset commission=0 />
<cfset commission=0.18*Sales+commission>
<cfset newrow = QueryAddRow(myQuery,1) />
<cfset temp = QuerySetCell(myQuery,"source","angelaretail") />
<cfset temp = QuerySetCell(myQuery,"type","Retail") />
<cfset temp = QuerySetCell(myQuery,"income",Sales) />
<cfset temp = QuerySetCell(myQuery,"profit",commission) />
<tr><td>
<B>ANGELA</B></td>
<td>Retail</td><td>#round(Sales)#</td><td>#round(commission )#</td>

</tr>
</cfoutput>
<cfoutput query="OC">
<cfset commission=0 />
<cfset commission=0.2*Sales+commission>
<cfset newrow = QueryAddRow(myQuery,1) />
	<cfset temp = QuerySetCell(myQuery,"source","OC") />
	<cfset temp = QuerySetCell(myQuery,"type","WS") />
	<cfset temp = QuerySetCell(myQuery,"income",Sales) />
	<cfset temp = QuerySetCell(myQuery,"profit",commission) />
<tr><td>
<B>Oriental</B></td>
<td>Wholesale</td><td>#round(Sales)#</td>
<td>#round(commission )#</td>

</tr>
</cfoutput>
<cfoutput query="self">
<cfset commission=0 />
<cfset commission=sales - cost/44>
<cfset newrow = QueryAddRow(myQuery,1) />
	<cfset temp = QuerySetCell(myQuery,"source","self") />
	<cfset temp = QuerySetCell(myQuery,"type","All") />
	<cfset temp = QuerySetCell(myQuery,"Income",Sales) />
	<cfset temp = QuerySetCell(myQuery,"Profit",commission) />

<tr><td>
<B>Own</B></td>
<td>All</td><td>#round(Sales)#</td><td>
#round(commission )#</td>

</tr>
</cfoutput>
<cfoutput query="selfretail">
<tr><td><cfset commission=0 />
<cfset commission=sales - cost/44>
<cfset newrow = QueryAddRow(myQuery,1) />
	<cfset temp = QuerySetCell(myQuery,"source","selfretail") />
	<cfset temp = QuerySetCell(myQuery,"type","Retail") />
	<cfset temp = QuerySetCell(myQuery,"Income",Sales) />
	<cfset temp = QuerySetCell(myQuery,"Profit",commission) />
<B>Own</B></td>
<td>Retail</td><td>#round(Sales)#</td><td>#round(commission )#</td>

</tr>
</cfoutput>
<cfoutput query="selfwholesale">
<tr><td><cfset commission=0 />
<cfset commission=sales - cost/44>
<cfset newrow = QueryAddRow(myQuery,1) />
	<cfset temp = QuerySetCell(myQuery,"source","selfwholesale") />
	<cfset temp = QuerySetCell(myQuery,"type","WS") />
	<cfset temp = QuerySetCell(myQuery,"Income",Sales) />
	<cfset temp = QuerySetCell(myQuery,"Profit",commission) />

<B>Own</B></td>
<td>Wholesale</td><td>#round(Sales)#</td><td>#round(commission )#</td>

</tr>
</cfoutput>
</table>
</cfif>
<cfchart backgroundcolor="white"  chartheight="400" xaxistype="category" sortxaxis="true" URL="$SERIESLABEL$"   chartwidth="800" scalefrom="0" scaleto="45000" seriesplacement="stacked" showlegend="true"   >
<cfchartseries query="myquery" valuecolumn="Income" type="bar" itemcolumn="Source"  paintstyle="shade" serieslabel="Income"  >
</cfchartseries>
<cfchartseries query="myquery" valuecolumn="Profit" type="bar" itemcolumn="Source" serieslabel="Profits"  >
</cfchartseries>

</cfchart>
<!--- 
<cfset myquery = querynew('income,profit','Double,Double') />

<cfoutput query="annual">
<cfset commission=0 />
<cfset commission=sales - cost/44 />
<cfset newrow = QueryAddRow(myQuery,1) />
<cfset temp = QuerySetCell(myQuery,"income",Sales) />
<cfset temp = QuerySetCell(myQuery,"profit",commission) />
</cfoutput>


<cfoutput query="annual2">
<cfset commission=0 />
<cfset commission=sales - cost/44 />
<cfset newrow = QueryAddRow(myQuery,1) />
<cfset temp = QuerySetCell(myQuery,"income",Sales) />
<cfset temp = QuerySetCell(myQuery,"profit",commission) />
</cfoutput>

<cfchart backgroundcolor="white"  chartheight="400" xaxistype="category" sortxaxis="true" URL="$SERIESLABEL$"   chartwidth="800" scalefrom="0" scaleto="25000" seriesplacement="stacked" showlegend="true"   >
<cfchartseries query="myquery" valuecolumn="income" type="line" itemcolumn="Source"  paintstyle="shade" serieslabel="Income"  >
</cfchartseries>
<cfchartseries query="myquery" valuecolumn="profit" type="line" itemcolumn="Source" serieslabel="Profits"  >
</cfchartseries>

</cfchart>
--->
<!---
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
</table> --->
</body>
</html>
</cfif>