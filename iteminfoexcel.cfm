<cfcontent type="application/vnd.ms-excel">

<cfheader name="Content-Disposition" value="filename=items.xls"> 
<cfquery datasource="gemssql" name="qryItemInfo">
Select newitem, subcat,cat, storage,storageindia,inventoryindia, basecost as BaseCostinRs, weight 
from items
where inventory<1 and inventoryindia>0
and cat<>'gems' 
and storage not like 'G%' 
order by storageindia
</cfquery>

<table border="1" style="border-collapse:collapse">
	<tr bgcolor="#999999">
    	<b>
    	<td>
        	ItemId
        </td>
        <td>
        	SubCat
        </td>
        <td>
        	Cat
        </td>
        <td>
        	Storage
        </td>
        <td>
        	StorageIndia
        </td>
        <td>
        	InventoryIndia
        </td>
        <td>
        	basecost
        </td>
        <td>
        	weight
        </td>
        </b>
    </tr>
    <cfoutput query="qryItemInfo">
    	<tr>
			<td>
                #newitem#
            </td>
            <td>
                #SubCat#
            </td>
            <td>
                #Cat#
            </td>
            <td>
                #Storage#
            </td>
            <td>
                #StorageIndia#
            </td>
            <td>
                #InventoryIndia#
            </td>
            <td>
                #BaseCostinRs#
            </td>
            <td>
                #weight#
            </td>
        </tr>
    </cfoutput>