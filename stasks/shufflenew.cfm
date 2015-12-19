<!---
<cfquery name="avgcalc" datasource="gemssql">
select avg(cast(daysactive as real)) as actdays from nitish.itemstats 
</cfquery>



<cfset avgdaysactive=avgcalc.actdays>

<cfquery name="shuffle" datasource="gemssql">
update items set disporderwhole = ((zoom/(addtocart+1))/(avzoom/(avcart+1))), 
 disporder = ((thumbexposure/(daysactive+1))/(av.thumbex/#avgdaysactive#))*((zoom/(addtocart+1))/(avzoom/(avcart+1)))  from nitish.itemstats, items, (Select cat, avg(zoom) as avZoom, avg(cast(addtocart as real)) as avCart, avg(thumbexposure) as thumbex from items, nitish.itemstats where items.newitem=nitish.itemstats.itemid group by cat) av
where items.newitem=nitish.itemstats.itemid and av.cat=items.cat
</cfquery>
---><!---
<cfloop list="necklaces,earrings,rings,bracelets,pendants" index="avcat">

<cfquery name="avgcatprice" datasource="gemssql">
select avg(price) as avgprice from items where cat='#avcat#' and inventory>0
</cfquery>

<Cfoutput>#avgcatprice.avgprice#</cfoutput>

	
<cfquery name="shuffle" datasource="gemssql">
update items set disporderwhole = (#avgcatprice.avgprice#/items.price)*(
addtocart/(zoom+1)/(avcart+0.001)/(avzoom+1) 

 +  (#avgcatprice.avgprice#/items.price)*6* (sold/(daysactive+1))/((avsold+0.001)/#avgdaysactive#)),
 disporder =  av.thumbex/(thumbexposure+1)*(
addtocart/(zoom+1)/(avcart+0.001)/(avzoom+1) 
 
 + 3* (sold/(daysactive+1))/((avsold+0.001)/#avgdaysactive#))
 from nitish.itemstats, items, (Select cat, 
avg(zoom) as avZoom, avg(sold) as avsold, avg(addtocart) as avCart, 
avg(thumbexposure) as thumbex from items, nitish.itemstats where items.newitem=nitish.itemstats.itemid 
group by cat) av 
where items.newitem=nitish.itemstats.itemid and av.cat=items.cat and items.cat="#avcat#" and inventory>0
</cfquery>

</cfloop>--->

<cfquery name="shuffle" datasource="gemssql">

update items set disporder=(select max(disporder) from items) - disporder

update items set disporderwhole=(select max(disporderwhole) from items) - disporderwhole


</cfquery>