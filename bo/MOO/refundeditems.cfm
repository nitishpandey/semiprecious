
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>
Refunded MOO Items

</title>
    
    
    <link type="text/css" rel="stylesheet" href="../css/StyleSheet.css">
    

    
</head><body style="background-color: rgb(217, 217, 217);">

    <div>
         <cfinclude template="moomenu.cfm"/>
		 <cfset supcode = session.apptt />
		<cfif isuserinrole("superadmin") or isUserinRole("admin")>
			<cfif isdefined("form.supplier")>
				<cfset supcode= form.supplier>
			<cfelse>
				<cfset supcode = "___" /><!--- 3 underscore as per SQL syntax for any 3 char --->
			</cfif>
		</cfif>


<div align="center"  STYLE="font:bold;font-names:franklin gothic book;font-size:large;font-underline:true;forecolor:Maroon;">Refunded MOO ITEMS for 
<cfoutput>#supcode#</cfoutput></div>
<cfif isuserinrole("superadmin,admin")> 
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
		<cfquery name="d" datasource="gemssql" >
			select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt , makeondemandnote 
						from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and 
						inventoryatsale = -1 and  quantity = 0 and MAKEONDEMANDNOTE LIKE '___%'  ORDER BY indate asc
		</cfquery>
	<cfelse>
		<cfquery name="d" datasource="gemssql" >
		select indate, cat, cartstatus.cartid as cartid, itemid, optionid, quantity ,size,size2,WEIGHT,metalwt , makeondemandnote 
							from buyingrecord, items,cartstatus  where buyingrecord.cartid = cartstatus.cartid and items.newitem = buyingrecord.itemid and 
							inventoryatsale = -1 and quantity = 0 and MAKEONDEMANDNOTE LIKE '#supcode#%'  ORDER BY indate asc
		</cfquery>
		
</cfif>		

</td></tr><tr><td>&nbsp;</td><td colspan="2">
<br/>
<div style="width:850px;border:1px solid black;padding:2px;align:left">
 
<table style="border:1px dashed brown">

<tr style="background:gray;color:white;"><td>Sr.No.</td><td>Pic</td><td>Cartid</td>
<td>Itemid</td><td>Description</td><td>Qty</td><td>Size</td><td>Size2</td><td>Weight</td><td>Working Stage</td><td>Date Order</td></tr>
<cfoutput query="d">
<tr>
<td>#currentrow#</td><td><img src="/images/#cat#/thumb/#itemid#.jpg" alt="#itemid#" /></td>
<td><a href="http://www.semiprecious.in/itemsell.cfm?cartid=#Cartid#" target="_blank">#Cartid#</a></td><td><a href="http://www.semiprecious.in/detail.cfm?newitem=#itemid#"  target="_blank">#Itemid#</a></td>
<td>
<cfif optionid gt 0 >
<cfquery name="b" datasource="gemssql">

   select  DESCRIPTION	 from options where ITEMID=#itemid# and OPTIONID=#optionid#

</cfquery>
#b.description#
</cfif>
</td><td>#Quantity#</td><td>#size#</td><td>#size2#</td><td>#WEIGHT#</td><td>
#makeondemandnote#	
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
</div>
   </body>
   </html>
