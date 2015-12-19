<cfquery name=saleupdate datasource=gemssql>
update items set status=0 where status=3 and storage like 'in-%'

update items set status=3 where status=0 and storage like 'in-%' and newitem in 
(select top 1000 itemid from itemstats, items where items.newitem=itemstats.itemid and restockdate <'6/10/2010' and inventory>0 and storage like 'in-%' and items.price>5  and status=0 order by sold asc, daysactive desc)
</cfquery>
<cfset status=3 />
<cfinclude template="jewelry-sale.cfm" />
