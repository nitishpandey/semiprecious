
<cfquery name="avgcalc" datasource="gemssql">
select avg(cast(daysactive as real)) as actdays from nitish.itemstats 
</cfquery>
<cfset avgdaysactive=avgcalc.actdays>
<!---
<cfquery name="shuffle" datasource="gemssql">
update items set disporderwhole = ((zoom/(addtocart+1))/(avzoom/(avcart+1))), 
 disporder = ((thumbexposure/(daysactive+1))/(av.thumbex/#avgdaysactive#))*((zoom/(addtocart+1))/(avzoom/(avcart+1)))  from nitish.itemstats, items, (Select cat, avg(zoom) as avZoom, avg(cast(addtocart as real)) as avCart, avg(thumbexposure) as thumbex from items, nitish.itemstats where items.newitem=nitish.itemstats.itemid group by cat) av
where items.newitem=nitish.itemstats.itemid and av.cat=items.cat
</cfquery>
--->
	
<cfquery name="shuffle" datasource="gemssql">
update items set disporderwhole = (
cast(addtocart/(zoom+1)/(avcart+0.001)/(avzoom+1) 
	as real) 
 + 6* cast((sold/(daysactive+1))/((avsold+0.001)/#avgdaysactive#) as real)),
 disporder =  av.thumbex/(thumbexposure+1)*(
cast(addtocart/(zoom+1)/(avcart+0.001)/(avzoom+1) 
	as real) 
 + 3* cast((sold/(daysactive+1))/((avsold+0.001)/#avgdaysactive#) as real))
 from nitish.itemstats, items, (Select cat, 
avg(zoom) as avZoom, avg(cast(sold as real)) as avsold, avg(cast(addtocart as real)) as avCart, 
avg(thumbexposure) as thumbex from items, nitish.itemstats where items.newitem=nitish.itemstats.itemid 
group by cat) av 
where items.newitem=nitish.itemstats.itemid and av.cat=items.cat


update items set disporder=(select max(disporder) from items) - disporder

update items set disporderwhole=(select max(disporderwhole) from items) - disporderwhole


</cfquery>