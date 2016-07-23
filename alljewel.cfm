<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="filename=jewelinfo.xls">  

<cfquery datasource="gemssql" name="s">
	Select	* 
    from 	qryFroogleJewelry 
    where 	quantity>0  
    order 	by ID
</cfquery>

<table border="1" style="border-collapse:collapse">
	<tr bgcolor="#999999">
    	<b>
    	<td>
        	Brand
        </td>
        <td>
        	Category
        </td>
        <td>
        	Color
        </td>
        <td>
        	Condition
        </td>
        <td>
        	Currency
        </td>
        <td>
        	Description
        </td>
        <td>
        	ID
        </td>
        <td>
        	Image Link
        </td>
        <td>
        	Payment Accepted
        </td>
        <td>
        	Payment Notes
        </td>
        <td>
        	Price
        </td>
        <td>
        	Product Type
        </td>
        <td>
        	Quantity
        </td>
        <td>
        	Title
        </td>
        <td>
        	Weight
        </td>
        <td>
        	Link
        </td>
        </b>
    </tr>
    <cfoutput query="s">
    	<tr>
			<td>
        	#Brand#
        </td>
        <td>
        	#Cat#
        </td>
        <td>
        	#Color#
        </td>
        <td>
        	#Condition#
        </td>
        <td>
        	#Currency#
        </td>
        <td>
        	#Description#
        </td>
        <td>
        	#ID#
        </td>
        <td>
        	#Image_Link#
        </td>
        <td>
        	#Payment_Accepted#
        </td>
        <td>
        	#Payment_Notes#
        </td>
        <td>
        	#Price#
        </td>
        <td>
        	#Product_Type#
        </td>
        <td>
        	#Quantity#
        </td>
        <td>
        	#Title#
        </td>
        <td>
        	#Weight#
        </td>
        <td>
        	#Link#
        </td>
    </tr>
</cfoutput>
</table>