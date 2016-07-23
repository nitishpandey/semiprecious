<cfcontent type="application/vnd.ms-excel">

<cfheader name="Content-Disposition" value="filename=items.xls"> 
<!--- <cfparam name="orderby" default="wishcount">

<cfparam name="onlyitems" default="">
<cfparam name="itemnum" default="0">
<cfparam name="suppliername" default="royal" /> --->


<!--- ORDER BY : <cfoutput><a href="supplierrestock.cfm?suppliername=#suppliername#&orderby=subcat">stone</a> | <a href="supplierrestock.cfm?suppliername=#suppliername#&orderby=wishcount desc">WishCount</a> | <a href=supplierrestock.cfm?suppliername=#suppliername#&orderby=cat>CATEGORY</a> | <a href=supplierrestock.cfm.cfm?suppliername=#suppliername#&orderby=newitem>ITEM NUMBER</a>
</cfoutput> --->
<!--- inner join nitish.sellingfrequency  s on s.itemid = items.newitem --->
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select newitem,
  cast([newitem] as varchar) as item, weight,w.wishcount,dayspersell from items right outer join 
 (select itemid,daysactive/(sold+0.01) as dayspersell from nitish.itemstats i, itemsCat_rating c, items where items.newitem=i.itemid and items.cat=c.CAT and daysactive>0 and sold>0) newstat
  on itemid=newitem 
	right outer join 
( SELECT   count(*) as wishcount, newitem as wishitem FROM wish GROUP BY newitem ) w on wishitem = newitem where  newitem not in (select itemnum from anup.restock) and  ( (wishcount>-1 and inventory<1) ) and  supplier like '%#url.suppliername#%' and 
 (storage not like 'CM%')  order by   #orderby#

</cfquery>


<table border="1">
	<tr>
        <td>
            Item ID
        </td>
    </tr>
	
        <tr>
        <cfoutput query=getlist>
            <td> 
                #item#
            </td>
        </cfoutput>
        </tr>
    
</table>