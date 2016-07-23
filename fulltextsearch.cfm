<cfquery name=fillfullindex datasource=gemssql>
set concat_null_yields_null OFF
delete items_FTIndex
insert into items_FTIndex (itemid, fulltext)  select  newitem,  left(description,700)+ ' ' + grouping + ' ' + cat + ' ' + subcat  + ' ' + color from items where inventory>0 and status<>1

set concat_null_yields_null ON
</cfquery>
