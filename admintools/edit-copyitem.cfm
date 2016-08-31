<cfparam name=itemid default="">
<cfparam name=useimage default="no">
<cfparam name=cat default="">
<cfif session.mail is application.admin_email and itemid neq "">

<cftransaction>
<cfquery name="copyitem" datasource="gemssql">
insert into items (itemnumber,
newitem,
CAT,
subcat,
color,
size,
weight,
Inventory,
BaseCost,
price,
saleprice,
wholesaleprice,
num_sold,
status
)
select 0,
(select max(newitem)+1 from items),
CAT,
subcat,
color,
size,
0,
0,
BaseCost,
price,
saleprice,
wholesaleprice,
0,
0
 from items where newitem=#itemid#

</cfquery>

<cfquery name=newid datasource=gemssql>
Select max(newitem) as newid from items
</cfquery>
</cftransaction>

<cfif useimage is 'yes'>
<cffile action = "copy" source = "d:\inetpub\semiprecious\images\#cat#\#itemid#.jpg" 
    destination = "d:\inetpub\semiprecious\images\#cat#\#newid.newid#.jpg">
<cffile action = "copy" source = "d:\inetpub\semiprecious\images\#cat#\thumb\#itemid#.jpg" 
    destination = "d:\inetpub\semiprecious\images\#cat#\thumb\#newid.newid#.jpg">

</cfif>

New item created from <cfoutput>#itemid#, edit it <a href=edititem.cfm?NEWITEM=#newid.newid#>here</a></CFOUTPUT>
</cfif>
