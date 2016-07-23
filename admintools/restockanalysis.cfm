<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Restock Analysis</title>
</head>
<cfparam name=orderby default='stone'>
<body>
<cfquery datasource='gemssql' name='inventorycheck'>
SELECT * FROM (select stone +'-instock' as stone, cat, sum(inventory) as inventory from dbo.CatSubcatInStock group by stone, cat ) x
PIVOT (
SUM([inventory])
        FOR [cat] IN ([rings], [necklaces],[pendants],[earrings],[bracelets], [beads])  
)
     x
union
Select * from (select subcat+'Alldesigns'  as stone, cat, count(*) as designs from items group by subcat, cat) x
PIVOT (
sum([designs])
	FOR [cat] IN ([rings], [necklaces],[pendants],[earrings],[bracelets], [beads]) )  x 

union
select * from (select sum(quantity) as quantity , subcat+'SOLD' as stone,cat from buyingrecordall as buyingrecord, anup.cartstatusall as cartstatus , items where items.newitem=buyingrecord.itemid and cartstatus.cartid=buyingrecord.cartid and outdate >'1/1/2009'  and cat<>'bags' and cat <>'ornaments' group by subcat, cat) x
PIVOT (
	SUM(quantity)
	 FOR [cat] IN ([rings], [necklaces],[pendants],[earrings],[bracelets], [beads])  
) y order by stone

	</cfquery>

<h3>SOLD SINCE Jan 2009</h3>
<table>
<table cellpadding=10><tr bgcolor=lightblue><td>stone</td><td>Rings</td><td>Necklaces</td><td>Pendants</td><td>Earrings</td><td>Bracelets</td><td>Beads</td></tr>
<cfoutput query=inventorycheck>
<tr <cfif stone contains 'instock'>bgcolor='lightgreen'<cfelseif stone contains 'sold'>bgcolor='yellow'</cfif>><td>#stone#</td><td>#rings#</td><td>#necklaces#</td><td>#pendants#</td><td>#earrings#</td><td>#bracelets#</td><td>#beads#</td></tr>
</cfoutput>
</table>


<cfquery name="allrating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats
</cfquery>
<!--- cat rating--->
<cfquery name="earringsrating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats where earrings  >10
</cfquery>

<cfquery name="pendantsrating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats where pendants  >10
</cfquery>

<cfquery name="necklacesrating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats where necklaces  >10
</cfquery>

<cfquery name="ringsrating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats where rings  >10
</cfquery>

<cfquery name="braceletsrating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats where bracelets  >10
</cfquery>
<p>
<cfoutput>
<u><font color=red size=12>t2z/T2Z.avg:</font></u>
<table><tr bgcolor=gray><td>Earrings</td><td>Pendants</td><td>Necklaces</td><td>Rings</td><td>Bracelets</td></tr>

<tr  bgcolor=lightblue><td>#decimalformat(evaluate(earringsrating.avgt2z/allrating.avgt2z))#</td><td>#decimalformat(evaluate(pendantsrating.avgt2z/allrating.avgt2z))#</td>
<td>#decimalformat(evaluate(necklacesrating.avgt2z/allrating.avgt2z))#</td><td>#decimalformat(evaluate(ringsrating.avgt2z/allrating.avgt2z))#</td>
<td>#decimalformat(evaluate(braceletsrating.avgt2z/allrating.avgt2z))																			  #</td></tr>
</table>
</cfoutput>
<cftry>
    

	<cfcatch><cfoutput>#cfcatch.message#</cfoutput></cfcatch>
	
	</cftry>
</body>
</html>
