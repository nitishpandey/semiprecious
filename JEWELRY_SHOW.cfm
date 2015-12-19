	
 <CFPARAM NAME="description" DEFAULT="">
 <CFPARAM NAME="Price" DEFAULT= "">
  <CFPARAM NAME="SalePrice" DEFAULT= "">
 <CFPARAM NAME="category" DEFAULT= "">
 <CFPARAM NAME="subcategory" DEFAULT= "">
 <CFPARAM NAME="NameID" DEFAULT= "">
 <CFPARAM NAME="newitem" DEFAULT= "">
 <CFPARAM NAME="cart" DEFAULT="">
 <CFPARAM NAME="itemnumber" DEFAULT="499">
<CFPARAM NAME="invent" DEFAULT="">

<html>

<head>
<cfif itemnumber eq 0><CFSET itemnumber =500></cfif>
<meta http-equiv="refresh"
content="5;URL=http://WWW.SEMIPRECIOUS.COM/JEWELRY_SHOW.CFM?itemnumber=<CFOUTPUT>#EVALUATE(itemnumber-1)#</CFOUTPUT>" >
</head>




 <CFINCLUDE TEMPLATE="setup.cfm">
<CFIF (category is "") And (itemnumber is  not "")>
<CFQUERY datasource="semiprecious" name="details">
Select price, description, NameID, newitem, subcat, cat from items where newitem=<cfoutput>#itemnumber#</cfoutput>
</cfquery>
<CFSET price=#details.price#>
<CFSET description=#details.description#>
<CFSET NameId=#details.NameID#>
<CFSET newitem = #details.newitem#>
<CFSET category = #details.cat#>
<CFSET subcategory = #details.subcat#>

</cfif>
<CFIF (category is "")>
<FORM action='detail.cfm' method='get'>
Item number: <input type='text' name='itemnumber' size='5'>
<INPUT type='submit' value='details'>
</form>
<CFABORT>
</CFIF>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
	<TITLE><cfoutput>Cheap #subcategory# #category# #dollarformat(price)#</cfoutput></TITLE>
<script language=JAVASCRIPT>
<!--
function goProcess(inString){
	if(inString=='Add to Shopping Cart'){
	self.document.wishbuy.action="cart.cfm";
	self.document.wishbuy.submit();
	return;
	}
	if(inString=='Add to Wish List'){
	self.document.wishbuy.action='wish.cfm';
	self.document.wishbuy.submit();
	return;
	}
}
//-->
</script>
<meta name="description" content="<cfoutput>#description#, #category#</cfoutput> ">
<meta name="keywords" content="<cfoutput>#category#,#left(description,25)#</cfoutput>">
</HEAD>

<BODY BGCOLOR="white"  link="black" topmargin='0' vlink=black>

<h3>Semiprecious.com Slide Show</h3>&nbsp;&nbsp;Click <a href=index.cfm>here</a> to go to semiprecious.com home page.

<CFOUTPUT>
<center>
<Table border="0" bordercolor='black' align=left width=760>
<tr width=760 align=center><td width=760>
<!---
<HumanClick> <script language='javascript' src='http://hc2.humanclick.com/hc/53434508/x.js?cmd=file&file=chatScript&site=53434508'> </script> </HumanClick><br><FORM ACTION="list.cfm" method="get">

<input type='hidden' name='category' value='necklaces'>
<input type='hidden' name='sortorder' value='datetaken'>


<font size='1' color='white'>Only show:</font><br><SELECT NAME="subcat" SIZE="1" VALUE="subcat" onChange="submit(this.form)">

<OPTION selected value="">Select Stone</option>
<OPTION value="">Select All</option>

<option value="agate">agate</option>
<option value="amethyst">amethyst</option>
<option value="carnelian">carnelian</option>
<option value="citrine">citrine</option>
<option value="garnet">garnet</option>
<option value="goldstone">goldstone</option>
<option value="Hematite">Hematite</option>
<option value="Iolite">Iolite</option>
<option value="jade">jade</option>
<option value="jasper">jasper</option>
<option value="lapis lazuli">lapis lazuli</option>
<option value="malachite">malachite</option>
<option value="mixed stones">mixed stones</option>
<option value="moonstone">moonstone</option>
<option value="moss agate">moss agate</option>
<option value="pearl">pearl</option>
<option value="quartz">quartz</option>
<option value="rose quartz">rose quartz</option>
<option value="soladite">soladite</option>
<option value="tiger eye">tiger eye</option>
<option value="turquoise">turquoise</option>
<option value="unakite">unakite</option>
</SELECT>
&nbsp;&nbsp;&nbsp;&nbsp;<br>
<SELECT NAME="color" SIZE="1" VALUE="subcat" onChange="submit(this.form)">
<option selected value="">Select Color</option>
<OPTION value="">Select All</option>
<OPTION value="black">Black</option>
<OPTION value="blue">Blue</option>
<OPTION value="blue">Brown</option>
<OPTION value="green">Green</option>
<OPTION value="grey">Grey</option>
<OPTION value="orange">Orange</option>
<OPTION value="pink">Pink</option>
<OPTION value="yellow">Purple</option>
<OPTION value="red">Red</option>
<OPTION value="white">White</option>
<OPTION value="yellow">Yellow</option></select>
</FORM>

</td><td>
--->
<CFSET folder = #LCASE(category)#>
<CFIF category eq "Sets"><CFSET folder = "necklaces"></cfif>

<table widh=100%><tr>

<td align=right>
<img src = "images/#folder#/<CFIF #NameID# is "">#newitem#.jpg<CFELSE>#NameID#</CFIF>"" alt="100% Satisfaction Guarantee"  border=15></td></tr></table> 
        <br>
        <fontface=arial><B>Item Number: #newitem# &nbsp;&nbsp;</B><FONT verdana size=3
color=black>Price:
     <b>#Dollarformat(price)#</B> </FONT><CFIF saleprice is not ""><b><font color=red>Sale!</font>: #dollarformat(saleprice)#</b></CFIF><br><font color='black' size='3'>#description#</font></cfoutput></TD>
	 <cfif category is not "earrings" and category is not "bracelets">
<td align=left></td>
<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;</td>
</cfif>
	 </TR>
  <TR><td align='center'>

<CFIF saleprice is not ""><CFSET price = #saleprice#></CFIF>

<CFFORM ACTION="" METHOD="POST" NAME="wishbuy">
<INPUT TYPE="hidden" NAME="bought1" VALUE="wish">
<CFIF invent is not 0>
<INPUT TYPE="hidden" NAME="bought" VALUE="buy">Quantity:<CFINPUT type="text" SIZE="3" Name="quantity" VALUE="1" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer">
<INPUT TYPE="button" VALUE="Add to Shopping Cart" onClick="javascript:goProcess('Add to Shopping Cart')"><cfelse>Sold out, will be restocked</cfif>
<INPUT TYPE="button" VALUE="Add to Wish List" onClick="javascript:goProcess('Add to Wish List')">
<INPUT TYPE="hidden" NAME="cart" VALUE="<cfoutput>#cart#</cfoutput>">
<INPUT TYPE="hidden" NAME="NameID" VALUE="<cfoutput>#NameID#</cfoutput>">
<INPUT TYPE="hidden" NAME="newitem" VALUE="<cfoutput>#newitem#</cfoutput>">
<INPUT TYPE="hidden" NAME="price" VALUE="<cfoutput>#price#</cfoutput>">
<INPUT TYPE="hidden" NAME="category" VALUE="<cfoutput>#category#</cfoutput>"><br>
</CFFORM>

Call us any time to ask about any item: 512 589 9009 (USA)
<!---
<font color='green'>Buy Any 10 necklaces for $130 (all different). Call 512 589 9009 to inquire or email anup@semiprecious.com.</font>
--->
</TD></TR></TABLE></FONT>
</center>
</BODY>
</HTML>

</body>

</HTML>
