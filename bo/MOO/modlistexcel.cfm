<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="filename=items.xls"> 
<cfquery name="getlist" datasource="gemssql" >

select  indate, cat, couponcode, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and quantity > 0 and indate > '8/1/2011' and paymode <>'emptied' and paymode<>'null'
and MAKEONDEMANDNOTE not like '%WIP%' and MAKEONDEMANDNOTE not like '%SHI%' order by indate asc

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
                #itemid#
            </td>
        </cfoutput>
        </tr>
    
</table>