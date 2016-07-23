<!---
<cfset supcode = session.apptt />

--->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
Pending MOO Items

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
         <cfinclude template="moomenu.cfm"/>
<br/>
<br/>
<div align="center"  STYLE="font:bold;font-names:franklin gothic book;font-size:large;font-underline:true;forecolor:Maroon;">PENDING MOO ITEMS</div>
		<cfif isuserinrole("superadmin") or isUserinRole("admin")>
				<cfif isdefined("url.suppliercode")>
					<cfset form = url />
				</cfif>
			<cfif isdefined("form.suppliercode") >
			 <cfset suppliername='#form.suppliercode##form.workstage#'>
				<cfif len(trim(form.workstage))> 
					<cfquery name="d" datasource="gemssql" >
						select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt , makeondemandnote 
							from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and 
							inventoryatsale = -1 and quantity > 0  and paymode<>'null' and paymode<>'emptied' 
							and 	indate>'2011-08-28' ORDER BY indate asc
				
					</cfquery>
				<cfelse>
					<cfquery name="d" datasource="gemssql" >
							select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt , makeondemandnote 
								from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and 
								inventoryatsale = -1 and quantity > 0 and paymode<>'null' and paymode<>'emptied' and indate >'2011-08-28'  ORDER BY indate asc
				
					</cfquery>
			</cfif>
		</cfif>	
	<CFQUERY NAME="list" DATASOURCE="gemssql" cachedwithin="#createtimespan(2,0,0,0)#">
				SELECT APPTT FROM users where usertype='supplier'
		</CFQUERY>

<br/>
<div style="width:850px;border:1px solid black;padding:2px;align:left">
<form action="PendingCartItem.cfm" method="post">
<br/>
<div>
 Select Both Supplier and Working Stage :
	<SELECT size="1" NAME="suppliercode">
	<OPTION>Select Supplier</OPTION>
	<CFOUTPUT QUERY="list">
	<OPTION VALUE="#apptt#">#apptt#</OPTION>
	</CFOUTPUT>
	</SELECT>
	
	
	<SELECT SIZE="1" NAME="workstage">
	<OPTION value="">Select Working Stage</OPTION>
	<OPTION VALUE="WIP">WIP</OPTION>
	<OPTION VALUE="SHI">SHI</OPTION>
	<OPTION VALUE="RCV">RCV</OPTION>
	<OPTION VALUE="COM">COM</OPTION>
	</SELECT>
	

<INPUT TYPE="submit" name="submitform" VALUE="SEARCH ">
</div
<br/>
<cfif isdefined("form.suppliercode") >
 
<table style="border:1px dashed brown">

<tr style="background:gray;color:white;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>Itemid</td><td>Description</td><td>Qty</td><td>Size</td><td>Size2</td><td>Weight</td><td>Working Stage</td><td>Date Order</td></tr>
<cfoutput query="d">
<tr>
<td>#currentrow#</td><td><img src="/images/#cat#/thumb/#itemid#.jpg" alt="#itemid#" /></td>
<td><a href="http://www.semiprecious.com/itemsell.cfm?cartid=#Cartid#" target="_blank">#Cartid#</a></td>
<td><a href="http://www.semiprecious.com/detail.cfm?newitem=#itemid#"  target="_blank">#Itemid#</a></td>
<td>
<cfif optionid gt 0 >
<cfquery name="b" datasource="gemssql">

   select  DESCRIPTION	 from options where ITEMID=#itemid# and OPTIONID=#optionid#

</cfquery>
#b.description#
</cfif>
</td><td>#Quantity#</td><td>#size#</td><td>#size2#</td><td>#WEIGHT#</td><td>
'#makeondemandnote#'
</td>
<td>#indate#</td>
<td>
<td/></tr>
</cfoutput>

</table>

</tr>
<tr>

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
        </tbody>
        </table>
        </cfif>
</form>
</div>
<cfelse>
Please log in
</cfif>
   </body>
   </html>
