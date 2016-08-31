<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Iventory By Category</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfquery name="checkinventory" datasource="gemssql">
SELECT items.subcat, items.CAT, items.style, Count(items.newitem) AS CountOfnewitem
FROM items WHERE (((items.Inventory)>0))
GROUP BY items.subcat, items.CAT, items.style ORDER BY items.subcat, items.CAT;
</cfquery>

<cfquery name="stonepopularity" datasource="gemssql">
SELECT items.subcat, Sum(nitish.itemstats.thumbexposure) AS SumOfthumbexposure
FROM nitish.itemstats INNER JOIN dbo.items ON nitish.itemstats.itemid = items.newitem
GROUP BY items.subcat ORDER BY items.subcat
</cfquery>
<body>
The table no the left shows number of designs in stock for a stone-category. On the right is gallery page requested by users by stone.
<table border=4><tr valign="top"><td>
<table><tr bgcolor="#FFFF99"><td>Stone</td><td>Category</td><td>Style</td><td>countofnewitem</td></tr>
<cfoutput query="checkinventory">
<tr><td>#subcat#</td><td>#Cat#</td><td>#Style#</td><td>#countofnewitem#</td></tr>

</cfoutput>
</table></td><td>
<table><tr bgcolor="#FFFFCC"><td>Stone</td><td>Gallery Exposure</td></tr>
<cfoutput query="stonepopularity">
<tr><td>#subcat#</td><td>#SumOfthumbexposure#</td></tr>

</cfoutput></table>
</td></tr></table>

</body>
</html>
