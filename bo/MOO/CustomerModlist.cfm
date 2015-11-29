<cfset supcode = session.apptt />

<cfparam name="msg" default="" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
	Untitled Page
</title>
    
    
    <link type="text/css" rel="stylesheet" href="../css/StyleSheet.css">
    

    
</head><body style="background-color: rgb(217, 217, 217);">  

<cfif isuserinrole("admin") or isuserinrole("superadmin")>
    <form id="form1"  method="post">
 <div>   
<cfinclude template="moomenu.cfm" />

<cfif isdefined("form.ship") >

		<cfloop list="#form.ship#" index="ind" >
				<!--- put a counter of qty here ---> <cfset cartid_ = listgetat(ind,1,"_") />
				<cfset itemid_ = listgetat(ind,2,"_") />
				<cfset optionid_ = listgetat(ind,3,"_") />
				<cfset ma_ = listgetat(ind,4,"_")/>
				<cfset make =Left(ma_,3)&"RCV" />
				<cfquery  datasource="gemssql" >
					update buyingrecord set MAKEONDEMANDNOTE ='#make#'  where cartid = #cartid_# 
																							and itemid = #itemid_#
																							and optionid = #optionid_#

                   update  moo set COMDate=NULL	where cartid = #cartid_# and itemid = #itemid_# and optionid = #optionid_#								   
				</cfquery>			
			
		</cfloop>
	
	<cfif isdefined("url.status")><cfoutput>#url.status#</cfoutput> </cfif>
	<!--- output qty of times here --->
	Items are successfully undo,Now you can see in the Received list.

</cfif>

<div align="center" id="msg" style="padding-left:40px;font-size:bold;align:center;color:Blue;">DELIVERED ITEMS TO CUSTOMERS </div>
<br/>
<br/>

<cfquery name="d" datasource="gemssql" >

select SHIDate,RCVDate,COMDate,indate, cat, cartstatus.cartid as cartid,buyingrecord.itemid, buyingrecord.optionid, quantity ,size,WEIGHT,MAKEONDEMANDNOTE from buyingrecord, items,cartstatus,moo  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and buyingrecord.cartid = moo.cartid and moo.itemid = buyingrecord.itemid and buyingrecord.optionid = moo.optionid  and inventoryatsale = -1 and  ( MAKEONDEMANDNOTE LIKE '___COM%') and quantity > 0 and buyingrecord.cartid > 97300 order by indate asc

</cfquery>

<div style="width:850px;border:1px solid black;padding:2px;align:left">
<form action="" method="post">

<table style="border:1px dashed brown">

<tr style="background:gray;color:white;font-size: medium; font-weight: bold;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>Itemid</td><td>Quantity</td><td>Weight</td><td>Size</td><td>Description</td><td>Select Items</td><td>Date Order</td><td>Date Shipped</td><td>Date Received</td><td>Date Dispatched</td></tr>
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
<td>#DateFormat(e.indate, "mmm-dd-yyyy")#</td>
<td>
#d.SHIDate#
<td/>
<td>
#d.RCVDate#
<td/>
<td>
#d.COMDate#
<td/>
</tr>
</cfoutput>

</table>

                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
<input type="submit" value="Reverse(undo) status of items" />


                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 5px;">
                <td>
                    </td>
                <td bgcolor="#009999" >
                
                
                
                
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;<span id="Label1">Copyright@Ganna Life Sciences Pvt. Ltd. ,2010. All Rights Reserved</span>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </tbody></table>
    </div>
    <cfelse>
	Please log in with proper rights.
</cfif>
</body></html>

