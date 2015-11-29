<cfset supcode = session.apptt />

<cfparam name="msg" default="" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
	Manage Orders From Semiprecious.com
</title>
    <link type="text/css" rel="stylesheet" href="../css/StyleSheet.css">


</head><body style="background-color: rgb(217, 217, 217);">

	<cfif isuserinrole("admin") or isuserinrole("superadmin")>
    <form id="form1"  method="post">
 <div>
<cfinclude template="moomenu.cfm" />
                <td align="left" valign="top">
                    </td>
            </tr>

            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td valign="top" colspan="2" class="style8">

<cfif isdefined("form.ship") >

		<cfloop list="#form.ship#" index="ind" >
				<!--- put a counter of qty here ---> <cfset cartid_ = listgetat(ind,1,"_") />
				<cfset itemid_ = listgetat(ind,2,"_") />
				<cfset optionid_ = listgetat(ind,3,"_") />
				<cfset ma_ = listgetat(ind,4,"_")/>
				<cfset make =Left(ma_,3)&"SHI" />

				<cfquery  datasource="gemssql" >
					update buyingrecord set MAKEONDEMANDNOTE ='#make#'  where cartid = #cartid_#
																							and itemid = #itemid_#
																							and optionid = #optionid_#
                     update  moo set RCVDate=NULL where cartid = #cartid_# and itemid = #itemid_# and optionid = #optionid_#
				</cfquery>

		</cfloop>

	<cfif isdefined("url.status")><cfoutput>#url.status#</cfoutput> </cfif>
	<!--- output qty of times here --->
	Items are successfully undo.

</cfif>
<div align="center" id="msg" style="padding-left:40px;font-size:bold;align:center;color:Blue;">UNDO RECEIVED ITEMS  </div>
<br/>
Shipped Items : <a href="http://www.semiprecious.com/bo/moo/ShippedItems.cfm"> Items shipped from supplier</a><BR/>
<br/>

<cfquery name="d" datasource="gemssql" >

select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,WEIGHT,makeondemandnote from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and  ( MAKEONDEMANDNOTE LIKE '___RCV%') and quantity > 0 and buyingrecord.cartid > 97300 order by indate asc

</cfquery>

<div style="width:850px;border:1px solid black;padding:2px;align:left">
<form action="" method="post">

<table style="border:1px dashed brown">

<tr style="background:gray;color:white;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>ITEM ID</td><td>QUANTITY</td><td>WEIGHT</td><td>SIZE</td><td>DESCRIPTION</td><td>SELECT ITEMS</td><td>DATE ORDER</td></tr>
<cfoutput query="d">
<tr>
<td>#currentrow#</td><td><img src="/images/#cat#/thumb/#itemid#.jpg" alt="#itemid#" /></td>
<td><a href="http://www.semiprecious.in/itemsell.cfm?cartid=#Cartid#" target="_blank">#Cartid#</a></td>
<td>
		<a href="http://www.semiprecious.in/detail.cfm?newitem=#itemid#">#Itemid#</a></td>
<td>#Quantity#</td><td>#WEIGHT#</td><td>#size#</td>
<td><cfif optionid gt 0 >
<cfquery name="b" datasource="gemssql">

   select  DESCRIPTION	 from options where ITEMID=#itemid# and OPTIONID=#optionid#

</cfquery>
#b.description#
</cfif>
<cfquery name="e" datasource="gemssql" >

   select INDATE from cartstatus where CARTID=#Cartid# order by INDATE

</cfquery>
</td><td><input type="checkbox" name="ship" value="#cartid#_#itemid#_#optionid#_#MAKEONDEMANDNOTE#" /></td>
<td>#e.indate#</td>
<td>

</td>

</tr>
</cfoutput>

</table>


</div>
</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                                 <!-- Please provide shipment details: <input type="text" name="shipment_details" value="" size="30"> -->
<input type="submit" value="Reverse(undo) items status" />
 &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </tbody></table>

    </div>
    </form>
	<cfelse>
	Please log in with proper rights.
</cfif>
</body></html>
