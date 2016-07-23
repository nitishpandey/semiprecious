<!---<cfquery name="avgcalc" datasource="gemssql">
select avg(cast(daysactive as real)) as actdays from nitish.itemstats 
</cfquery>
<cfset avgdaysactive=avgcalc.actdays>
<cfquery name="shuffle" datasource="gemssql">
update items set disporderwhole = ((zoom/(addtocart+1))/(avzoom/(avcart+1))), 
 disporder = ((thumbexposure/(daysactive+1))/(av.thumbex/#avgdaysactive#))*((zoom/(addtocart+1))/(avzoom/(avcart+1)))  from nitish.itemstats, items, 
 (Select cat, avg(zoom) as avZoom, avg(cast(addtocart as real)) as avCart, avg(thumbexposure) as thumbex from items, nitish.itemstats 
 where items.newitem=nitish.itemstats.itemid group by cat) av
where items.newitem=nitish.itemstats.itemid and av.cat=items.cat


</cfquery>

<cfquery name="avgcalc" datasource="gemssql">
select avg(cast(daysactive as real)) as actdays from nitish.itemstats 
</cfquery>
--->
<cfquery name="avgcalc" datasource="gemssql">
select avg(cast(daysactive as real)) as actdays from nitish.itemstats 
</cfquery>
<cfset avgdaysactive=avgcalc.actdays>
<cfquery name="shuffle" datasource="gemssql">
<!---
update items set disporderwhole = av.thumbex/(thumbexposure+1)* ((
cast(addtocart/(zoom+1)/(avcart+0.001)/(avzoom+1) 
	as real) 
 + 60* cast((sold/(daysactive+1))/((avsold+0.001)/#avgdaysactive#) as real))),
 disporder =  av.thumbex/(thumbexposure+1)*(
cast(addtocart/(zoom+1)/(avcart+0.001)/(avzoom+1) 
	as real) 
 + 30* cast((sold/(daysactive+1))/((avsold+0.001)/#avgdaysactive#) as real))
 from nitish.itemstats, items, (Select cat, 
avg(zoom) as avZoom, avg(cast(sold as real)) as avsold, avg(cast(addtocart as real)) as avCart, 
avg(thumbexposure) as thumbex from items, nitish.itemstats where items.newitem=nitish.itemstats.itemid 
group by cat) av 
where items.newitem=nitish.itemstats.itemid and av.cat=items.cat


update items set disporder=1/(disporder+0.1)

update items set disporderwhole=1/(disporderwhole+0.1)
--->



update items  set disporderwhole=1/(3*zoom/(daysactive+1)+0.1) from items, itemstats  where itemstats.itemid=items.newitem

</cfquery>


<cfif dateformat(now(),"dddd") eq "thursdayxxxxxxxxxxxxxxxxxxxxxxxx">

<cfquery name="shuffle" datasource="gemssql">


update items set disporderwhole =(select max(cast(restockdate as int)) from items)-cast(restockdate as int)

</cfquery>
</cfif>

<cfif dateformat(now(),"dddd") eq "Friday">

<cfquery name="shuffle" datasource="gemssql">

update items set disporderwhole =(select max(cast(lastbought as int)) from items)-cast(lastbought as int)

</cfquery>
</cfif>