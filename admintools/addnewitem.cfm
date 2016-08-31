<CFPARAM NAME="CAT" DEFAULT="Necklaces">
<CFINCLUDE TEMPLATE="setup.cfm">

<cftry>
<CFQUERY datasource="gemssql" name="itemadded">
SELECT TOP 1 Items.newitem
FROM Items
ORDER BY Items.newitem DESC </cfquery>

<CFSET newitem = #evaluate(itemadded.newitem + 1)#>

<HTML>
<HEAD>
<TITLE>Add new Item</TITLE>
</HEAD>
<BODY BGCOLOR="CREAM" TEXT="#000000" LINK="#0000FF" VLINK="#800080">
<h2>Add new Item</h2>


<form bgcolor='lightblue' action="anupadditems.cfm" method="post">

Item number:<INPUT TYPE="text" SIZE="10" NAME="newitem" value="<CFOUTPUT>#newitem#</cfoutput>">
Color:<INPUT TYPE="text" SIZE="10" NAME="color">
Category:<INPUT TYPE="text" SIZE="10" VALUE="" NAME="CAT">  Size :  <input type="text" name="size" value="" size="5">
Sub-category or stone:<INPUT TYPE="text" SIZE="10" NAME="subcat"><br>
&nbsp;Price: $<INPUT TYPE="text" SIZE="5" NAME="price">&nbsp;
Cost Price: Rs<INPUT TYPE="text" SIZE="5" NAME="BaseCost" >&nbsp;
WholeSale Price: $<INPUT TYPE="text" SIZE="5" NAME="WholeSalePrice">&nbsp;
	  <input type="hidden" name="clustercount" value="0">
Inventory:<INPUT TYPE="text" SIZE="3" NAME="inventory"><br>
Description: <textarea cols="40" rows="3" name="description"  wrap="virtual"></textarea><br>

Shipping:<INPUT TYPE="text" SIZE="3" NAME="shipping">
  Status: 
  <Select NAME="status">
<option value="0">Active</option>
<option value="1" selected >Inactive</option>
<option  value="2">Discontinued</option>
<option value="3">On Sale</option>
<option value="4">Free</option>
</select>

<INPUT TYPE="SUBMIT" VALUE="Add">
</FORM>

<table><tr><td>
<img src='images/<cfoutput>#cat#/#newitem#</cfoutput>.jpg'>
</td><td>
All Stones List is: <br />
<cfoutput>#application.allstones#</cfoutput>

</td></tr></table>



</BODY>
</HTML>
<cfcatch type="any">
<cfdump var='#cfcatch#' />
</cfcatch>
</cftry>