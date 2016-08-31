<CFPARAM NAME="CAT" DEFAULT="Necklaces">
<CFINCLUDE TEMPLATE="setup.cfm">


<CFQUERY datasource="semiprecious" name="itemadded">
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

Starting Item number:<INPUT TYPE="text" SIZE="10" NAME="newitem" value="<CFOUTPUT>#newitem#</cfoutput>">
No. of Items <INPUT type="text" size="10" name="noofitems" value="1"> (Add more than 1  in one go and then edit
the details using the edit items form)
Color:<INPUT TYPE="text" SIZE="10" NAME="color">
Category:<INPUT TYPE="text" SIZE="10" VALUE="" NAME="CAT">
Sub-category/stone:<INPUT TYPE="text" SIZE="10" NAME="subcat"><br>
&nbsp;Price: $<INPUT TYPE="text" SIZE="5" NAME="price">&nbsp;
Cost Price: Rs<INPUT TYPE="text" SIZE="5" NAME="BaseCost" >&nbsp;
WholeSale Price: $<INPUT TYPE="text" SIZE="5" NAME="WholeSalePrice">&nbsp;
 Size :  <input type="text" name="size" value="" size="5">
Inventory:	  <input type="hidden" name="clustercount" value="0">
  <INPUT NAME="inventory" TYPE="text" value="1" SIZE="3">
  Display Priority:
  <input name="disporder" type="text" id="disporder" value="0" size="3">
  <br>
Description: <textarea cols="40" rows="3" name="description"  wrap="virtual"></textarea>
  g2i :
  <input name="g2i" type="text" id="g2i" value="0" size="1">
  (0 or 1)<br>

Shipping:
  <INPUT NAME="shipping" TYPE="text" value="1.95" SIZE="3">

Active:<Select NAME="status">
<option value="0">Active</option>
<option value="1" >Inactive</option>
<option  value="2">Discontinued</option>
<option value="3">On Sale</option>
<option value="4">Free</option>
</select>

<INPUT TYPE="SUBMIT" VALUE="Add">
</FORM>

<table><tr><td>
<img src='images/<cfoutput>#cat#/#newitem#</cfoutput>.jpg'>
</td><td>
<p>USE SUB-CAT FROM THESE<BR>
<cfoutput>#application.allstones#</cfoutput>
</p></td></tr></table>



</BODY>
</HTML>
