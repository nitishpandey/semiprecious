

<cfparam name="msg" default="" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
Items Shipped By Supplier
</title>
    
    
    <link type="text/css" rel="stylesheet" href="../css/StyleSheet.css">
    

    
</head><body style="background-color: rgb(217, 217, 217);">
	<CFQUERY NAME="list" DATASOURCE="gemssql" cachedwithin="#createtimespan(2,0,0,0)#">
				SELECT APPTT FROM users where usertype='supplier'

		</CFQUERY>
	<cfif isuserinrole("admin") or isuserinrole("superadmin")>
    <form id="form1"  method="post">
 <div>  
 <cfinclude template="moomenu.cfm" />
  <cfif isdefined("form.supplier")>
<cfset supcode= form.supplier>
<cfelse>
<cfset supcode = "___" /><!--- 3 underscore as per SQL syntax for any 3 char --->
</cfif>
<br/>
<cfif isdefined("form.ship") >
	<cfoutput><cfset curDate = #Now()#></cfoutput>

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
                     update  moo set RCVDate=#curDate#	where cartid = #cartid_# and itemid = #itemid_# and optionid = #optionid_#								   
				</cfquery>			
			
		</cfloop>
	
	<cfif isdefined("url.status")><cfoutput>#url.status#</cfoutput> </cfif>
	<!--- output qty of times here --->
	Items marked as received from your supplier. 

</cfif>
<div align="center" id="msg" style="padding-left:40px;font-size:bold;align:center;color:Blue;">ITEMS Expected From Supplier </div>
<br/>
Received Items : <a href="http://www.semiprecious.com/bo/moo/ReceivedModlist.cfm"> Items received by Back-office</a><BR/>
<br/>

<cfquery name="d" datasource="gemssql" >

select * from (select makeondemandnote, indate, cat, cartstatus.cartid as cartid,  buyingrecord.itemid, buyingrecord.optionid, quantity ,size,WEIGHT from buyingrecord, items,cartstatus where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and  ( MAKEONDEMANDNOTE LIKE '#supcode#SHI%') and quantity > 0 and buyingrecord.cartid > 97300 )  k 
left outer join moo on moo.itemid = k.itemid and moo.optionid = k.optionid and moo.cartid = k.cartid order by shidate asc , indate asc
<!--- select SHIdate, indate, cat, cartstatus.cartid as cartid, moo.itemid as itemid, moo.optionid as optionid, quantity ,size,WEIGHT from buyingrecord, items,cartstatus,moo  where moo.cartid = cartstatus.cartid and moo.optionid = buyingrecord.optionid and moo.itemid = buyingrecord.itemid and buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and  ( MAKEONDEMANDNOTE LIKE '#supcode#SHI%') and quantity > 0 and buyingrecord.cartid > 97300 order by shidate asc, indate asc
--->
</cfquery>

</td></tr><tr><td>&nbsp;</td><td colspan=2>
<div style="width:950px;border:1px solid black;padding:2px;align:left">
<form action="" method="post">

<table style="border:1px dashed brown">

<tr style="background:gray;color:white;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>ITEM ID</td><td>QUANTITY</td><td>WEIGHT</td><td>SIZE</td><td>DESCRIPTION</td><td>SELECT ITEMS </td><td>DATE ORDER</td><td>DATE SHIPPED </td>
<td>DTS</td></tr>
<cfoutput query="d" >

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

</td><td><input type="checkbox" name="ship" value="#cartid#_#itemid#_#optionid#_#MAKEONDEMANDNOTE#" /></td>
<td>#DateFormat(indate, "mmm-dd-yyyy")#</td>
<td>
#SHIDate#
<td/>
<td><cfif len(shidate)>#datediff('d',indate,shidate)#</cfif></td>

</tr>
</cfoutput>

</table>

<!-- Please provide shipment details: <input type="text" name="shipment_details" value="" size="30"> -->



</td>
                </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
					
                <td align="right"><input type="submit" value="Mark Selected Items As Recieved from supplier" />
                    &nbsp;</td><td>
                    </td>
                
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;<span id="Label1">Semiprecious.com Ltd. ,2010. All Rights Reserved</span>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </tbody></table>
        
    </div>
    </form>
<form action="" method="post">
<br/>
<div>
 Select Supplier :
	<SELECT size="1" NAME="suppliercode">
	<OPTION>Select Supplier</OPTION>
	<CFOUTPUT QUERY="list">
	<OPTION VALUE="#apptt#">#apptt#</OPTION>
	</CFOUTPUT>
	</SELECT>
	
	
	

<INPUT TYPE="submit" name="submitform" VALUE="SEARCH ">
</form>
	<cfelse>
	Please log in with proper rights.
</cfif>
</body></html>
