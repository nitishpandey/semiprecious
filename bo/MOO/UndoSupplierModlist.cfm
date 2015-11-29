<cfset supcode = session.apptt />
<cfparam name="msg" default="" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
	Move from Production to Pending
</title>

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
                    &nbsp;&nbsp;<a href="../moo" id="HyperLink2">MOO Menu</a>

                    &nbsp; &nbsp;&nbsp;<a href="/tm-tm/logout.cfm" id="HypLogout">Log Out</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span style="color: rgb(0, 51, 204);" id="Label2">Logged In :</span>
&nbsp;<span style="color: rgb(153, 0, 51);" id="LblLoginName"><cfoutput>#supcode#</cfoutput></span>
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
<div align="center" id="msg" style="padding-left:40px;font-size:bold;align:center;color:Blue;">UNDO ITEMS FROM WORK IN PROGRESS</div>
<br/>
<br/>
<cfparam name="form.code" default  = "#supcode#"/>
<br/>
<cfif isdefined("form.ship") >
		<cfloop list="#form.ship#" index="ind" >
				<!--- put a counter of qty here ---> <cfset cartid_ = listgetat(ind,1,"_") />
				<cfset itemid_ = listgetat(ind,2,"_") />
				<cfset optionid_ = listgetat(ind,3,"_") />
				<cfquery  datasource="gemssql" >

				update buyingrecord set MAKEONDEMANDNOTE ='#FORM.SHIPMENT_DETAILS#'  where cartid = #cartid_#
																							and itemid = #itemid_#
																							and optionid = #optionid_#
                update  moo set WIPDate=NULL where cartid = #cartid_# and itemid = #itemid_# and optionid = #optionid_#
				</cfquery>
		</cfloop>
	<!--- output qty of times here --->
<div style="align:center;font-size:1.2em;color:red;">Your selected items are successfully undo.Now you can check in your list items.	</div>

</cfif>
<div id="msg" style="width:200px;padding-left:40px"><cfoutput>#msg#</cfoutput></div>
Oredered Items : <a href="modlist.cfm"> Items ordered by customers</a><BR/>
Working Items : <a href="WIPSupplierModlist.cfm"> Items in Production</a><BR/>
Shipped Items  : <a href="ShippedSuppliermodlist.cfm" > Items Shipped</a>
<br/>
<br/>
<cfquery name="d" datasource="gemssql" >

select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and inventoryatsale = -1 and ( MAKEONDEMANDNOTE LIKE '#supcode#WIP%') and quantity > 0 and buyingrecord.cartid > 97300 order by indate asc

</cfquery>

<div style="width:750px;border:1px solid black;padding:2px;align:left">
<form action="" method="post">

<table style="border:1px dashed brown">

<tr style="background:gray;color:blue;"><td>Sr.No.</td><td>Pic</td><td>CART ID</td>
<td>ITEMD ID</td><td>DESCRIPTION</td><td>QUANTITY</td><td>SELECT ?</td><td>DATE ORDER</td></tr>
<cfoutput query="d">
<tr>
<td>#currentrow#</td><td><img src="/images/#cat#/thumb/#itemid#.jpg" alt="#itemid#" /></td>
<td><a href="http://www.semiprecious.in/itemsell.cfm?cartid=#Cartid#" target="_blank">#Cartid#</a></td><td><a href="http://www.semiprecious.in/?itemid="  target="_blank">#Itemid#</a></td>
<td><cfif optionid gt 0 >
<cfquery name="b" datasource="gemssql">

   select  DESCRIPTION	 from options where ITEMID=#itemid# and OPTIONID=#optionid#

</cfquery>
#b.description#
</cfif>

</td><td>#Quantity#</td><td><input type="checkbox" name="ship" value="#cartid#_#itemid#_#optionid#" /></td>
<td>#DateFormat(indate, "mmm-dd-yyyy")#</td>
</tr>
</cfoutput>

</table>
<cfset myStringVar ="#supcode#">

<INPUT TYPE="HIDDEN" VALUE="<cfoutput>#MYSTRINGVAR#</cfoutput>" NAME="shipment_details" />
<!-- Please provide shipment details: <input type="text" name="shipment_details" value="" size="30"> -->
<input type="submit" value="Click for undo after selecting items" />
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
                    &nbsp;<span id="Label1">Copyright@semiprecious 2015. All Rights Reserved</span>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </tbody></table>
    </div>

</body></html>
