<CFINCLUDE TEMPLATE="setup.cfm">


<CFQUERY datasource="gemssql" name="itemadded">
SELECT TOP 1 Items.newitem
FROM Items
ORDER BY Items.newitem DESC </cfquery>

<CFSET #newitem#=#evaluate(itemadded.newitem + 1)#>

<HTML>
<HEAD>
<TITLE>Add new Item</TITLE>
</HEAD>
<BODY BGCOLOR="CREAM" TEXT="#000000" LINK="#0000FF" VLINK="#800080">
<h2>Add new Item</h2>


<form bgcolor='lightblue' action="anupadditems.cfm" method="post">

Item number:<INPUT TYPE="text" SIZE="10" NAME="newitem">
Color:<INPUT TYPE="text" SIZE="10" NAME="color">
Category:<INPUT TYPE="text" SIZE="10" NAME="CAT">
Sub-category/stone:<INPUT TYPE="text" SIZE="10" NAME="subcat"><br>
&nbsp;Price: $<INPUT TYPE="text" SIZE="5" NAME="price">&nbsp;
Inventory:<INPUT TYPE="text" SIZE="3" NAME="inventory"><br>
Description: <textarea cols="40" rows="3" name="description"  wrap="virtual"></textarea><br>

Shipping:<INPUT TYPE="text" SIZE="3" NAME="shipping">

Active:<Select NAME="status">
<option value="0">Active</option>
<option value="1" >Inactive</option>
<option  value="2">Discontinued</option>
<option value="3">On Sale</option>
<option value="4">Free</option>
</select>

<INPUT TYPE="SUBMIT" VALUE="Add">
</FORM>







</BODY>
</HTML>
