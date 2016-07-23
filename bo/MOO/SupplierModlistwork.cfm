<!---
<cfset supcode = session.apptt />

--->
<cfset supcode = 'HAR' />
<cfparam name="msg" default="" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
Your Work In Progres Items</title>
    
    <style type="text/css">
        .style9
        {
            width: 371px;
        }
        .style10
        {
            width: 418px;
        }
        .style11
        {
            width: 418px;
            height: 21px;
        }
        .style12
        {
            height: 32px;
        }
        .style13
        {
            width: 418px;
            height: 32px;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="../css/StyleSheet.css">
    

    <style type="text/css">
        .style1
        {
            width: 100%;
            
        }
        .style2
        {
            height: 61px;
        }
        .style5
        {
            height: 27px;
            width: 582px;
        }
        .style8
        {
        }
        .style9
        {
            width: 17px;
        }
        .style10
        {
            height: 41px;
            width: 582px;
        }
    </style>
</head><body style="background-color: rgb(217, 217, 217);">

    <div>
        <table cellspacing="0" cellpadding="0" bgcolor="White" style="background-color: white;" class="style1">
            <tbody><tr>
                <td align="left" valign="top" rowspan="2" style="width: 5%;">
                    &nbsp;</td>
                <td rowspan="2" class="style2">
                    <img src="../Images/semipreciouslogo.jpg" id="Image3">
                </td>
                <td align="left" class="style10">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/tm-tm/mainmenu.cfm" id="HyperLink1">Main Menu</a>
                    &nbsp;&nbsp;<a href="main.aspx" id="HyperLink2">Task Menu</a>
                    &nbsp; &nbsp;&nbsp;<a href="/tm-tm/login.cfm" id="HypLogout">Log Out</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span style="color: rgb(0, 51, 204);" id="Label2">Logged In :</span>
&nbsp;<span style="color: rgb(153, 0, 51);" id="LblLoginName">nitish</span>
                    &nbsp;</td>
                <td align="left" valign="top" rowspan="2" style="width: 5%;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="style5">
                    </td>
            </tr>
            <tr style="height: 2px;">
                <td align="left" valign="top">
                    </td>
                <td height="2px" bgcolor="#009999" colspan="2">
                    </td>
                <td align="left" valign="top">
                    </td>
            </tr>
            
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td valign="top" rowspan="2" colspan="2" class="style8">
<br/>
<br/>
<cfif isdefined("url.action")>
<cfquery datasource="gemssql" name="d" >
	select indate from cartstatus where cartid = #url.cartid#
</cfquery>
	<cfif d.recordcount>
	    <cfset hrs = datediff('h',d.indate,now()) />
		<cfif hrs GT 30>
			<cfset msg = "Too late to cancel. You only have 30 hrs to decline a request" />
		<cfelse>
		  <cfset negsupcode = "-#supcode#" />
			<cfquery datasource="gemssql" name="d" >
				update buyingrecord set makeondemandnote = '#negsupcode#' where cartid = #url.cartid# and itemid=#url.itemid# and optionid = #url.optionid# and inventoryatsale = -1 and quantity > 0
			</cfquery>		
			<cfmail from="cs@semipreciuos.com" to="austin@semiprecious.com" subject="#supcode# declines MOO" >
			
					update buyingrecord set makeondemandnote = '#negsupcode#' where cartid = #url.cartid# and itemid=#url.itemid# and optionid = #url.optionid# and inventoryatsale = -1 and quantity > 0	
			
			</cfmail>
				<cfset msg = "Decline message sent to Anup and item marked as declined." />
			</cfif>
	</cfif>
</cfif>


<cfif isdefined("form.ship") >
		<cfloop list="#form.ship#" index="ind" >
				<!--- put a counter of qty here ---> <cfset cartid_ = listgetat(ind,1,"_") />
				<cfset itemid_ = listgetat(ind,2,"_") />
				<cfset optionid_ = listgetat(ind,3,"_") />
				<cfquery  datasource="gemssql" >
					update buyingrecord set MAKEONDEMANDNOTE ='#FORM.SHIPMENT_DETAILS#'  where cartid = #cartid_# 
																							and itemid = #itemid_#
																							and optionid = #optionid_#

				</cfquery>
				
				
		</cfloop>
	
	<cfif isdefined("url.status")><cfoutput>#url.status#</cfoutput> </cfif>
	<!--- output qty of times here --->
	Items marked as shipped from your workshop. Please mark the shipment with following identifier:
<div style="border:1px black solid;font-size:1.2em;color:red;">
<cfoutput>#FORM.SHIPMENT_DETAILS#</cfoutput>
				
				</div>
</cfif>
<div id="msg" style="width:200px;padding-left:40px"><cfoutput>#msg#</cfoutput></div>


<cfquery name="d" datasource="gemssql" >

select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and  ( MAKEONDEMANDNOTE LIKE 'HARIP%') and quantity > 0 and buyingrecord.cartid > 97300 order by indate asc

</cfquery>

<div style="width:850px;border:1px solid black;padding:2px;align:left">
<form action="" method="post">

<table style="border:1px dashed brown">

<tr style="background:gray;color:white;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>Itemid</td><td>Description</td><td>Qty</td><td>Size</td><td>Size2</td><td>WEIGHT</td><td>metalwt</td><td>Made ?</td><td>Date Order</td><td>DECLINE</td></tr>
<cfoutput query="d">
<tr>
<td>#currentrow#</td><td><img src="/images/#cat#/thumb/#itemid#.jpg" alt="#itemid#" /></td>
<td><a href="http://www.semiprecious.in/itemsell.cfm?cartid=#Cartid#" target="_blank">#Cartid#</a></td>
<td>
		<a href="http://www.semiprecious.in/detail.cfm?newitem=#itemid#">#Itemid#</a></td>
<td><cfif optionid gt 0 >
<cfquery name="b" datasource="gemssql">

   select  DESCRIPTION	 from options where ITEMID=#itemid# and OPTIONID=#optionid#

</cfquery>
#b.description#
</cfif>
</td><td>#Quantity#</td><td>#size#</td><td>#size2#</td><td>#WEIGHT#</td><td>#metalwt#</td><td><input type="checkbox" name="ship" value="#cartid#_#itemid#_#optionid#" /></td>
<td>#indate#</td>
<td>
<a href="CancelMOO.aspx?itemid=#itemid#&cartid=#cartid#&optionid=#optionid#&date=#e.indate#" target="_blank"> Cancel (30 hours)</a>
<a href="modlist.cfm?action=cancel&itemid=#itemid#&cartid=#cartid#&optionid=#optionid#&date=#e.indate#" target="_blank"> Cancel (30 hours)</a>


<td/>
<td><a href="modlist.cfm?action=cancel&itemid=#itemid#&cartid=#cartid#&optionid=#optionid#" target="_blank"> New</a> </td>
</tr>
</cfoutput>

</table>
<cfset myStringVar = "HARSHI#Now()# ">


<INPUT TYPE="HIDDEN" VALUE="<cfoutput>#MYSTRINGVAR#</cfoutput>" NAME="shipment_details" />
<!-- Please provide shipment details: <input type="text" name="shipment_details" value="" size="30"> -->
<input type="submit" value="Shipping Items" />
<a href="UndoModlist.cfm">Undo</a>
</form>
</div>
<br/>
<br/>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 5px;">
                <td>
                    </td>
                <td bgcolor="#009999" colspan="2">
                
                
                
                
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
 
</body></html>
