<!---<CFCACHE TIMEOUT="#DateAdd("D", "-20", Now())#">
--->
<!--- modified last on 01 Jan 2004. wholesale spelt as wholsale. template was working when wholsale variable was added to url + there was no initialisation of wholesale parameter--->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 <CFPARAM NAME="displaycolumns" DEFAULT="4">
<cfparam name="wholesaleprice" default="10">
 <CFPARAM NAME="category" DEFAULT="necklaces">
  <CFPARAM NAME="category2" DEFAULT=#category#>
 <CFPARAM NAME="sortorder" DEFAULT="datetaken">
  <CFPARAM NAME="PicWidth" DEFAULT= "120">
 <CFPARAM NAME="start" DEFAULT= "1">
 <CFPARAM NAME="edit" DEFAULT= "">
 <CFPARAM NAME="subcat" DEFAULT= "">
 <CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "white">
  <CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
 <CFPARAM NAME="invent" DEFAULT="">
 <CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="priceless" DEFAULT="">
  <CFPARAM NAME="pricegreater" DEFAULT="">
  <CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
  <CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">

<cfif session.priceless eq "">
<cfset session.priceless=priceless>
<cfelse>
<cfset priceless=session.priceless>
</cfif>

 <CFPARAM NAME="priceless" DEFAULT="">
<!---<Cfif category is 'necklaces' and subcat is "">
<cfset subcat='Lapis lazuli'>
</cfif>--->
 <!---
<CFIF #session.edit# is not "">
<CFSET edit=#session.edit#>
b</cfif>
--->
<CFINCLUDE TEMPLATE="setup.cfm">

<CFset display =50>

 <CFIF "#category#" Is "bracelets">
 <CFSET #PicWidth# = "150">
  <CFSET #displaycolumns# = "2">

 </CFIF>


<!---recreating the cart--->
<!---
<CFIF j IS NOT "">
<CFLOOP INDEX="i"
FROM="1"
TO="#j#"
STEP="1">
<cfif #evaluate("quantity" & i)# IS NOT "0">
<cfset #newcart# =#newcart# & "," & #evaluate("itemnumber" & i)# & "," & #evaluate("category" & i)# & "," & #evaluate("price" & i)# & "," & #evaluate("quantity" & i)#>
</cfif>
</cfloop>
<cfset #session.cartitems#=#newcart#>
</cfif>
--->

<!---

<CFIF #edit# is 'mamamia'>
<CFSET #session.edit#="mamamia">
 <CFSET subcat = #left(subcat,4)#>
<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, saleprice, CAT, subcat, NameID, price, Description, subcat, inventory, buylink, status from Items where (CAT = '#category#') <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF>
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF><CFIF #salestatus# is 3>and (status = 3)</CFIF>
	order by #sortorder# <CFIF #sortorder# is "datetaken">Desc</CFIF></CFQUERY>
<CFELSE> --->

	<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, CAT, subcat, NameID, <cfif wholesaleprice eq 0>basecost/45*1.3<cfelse>wholesaleprice</cfif> as price, saleprice, status, Description, subcat, inventory, buylink from Items where ((CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>) <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>-1</cfif>) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF>
	order by #sortorder# <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">Desc</CFIF></CFQUERY>


<CFSET #enddisplay#= #start# + #display#>
<HTML>
<HEAD>
	<TITLE>Buy Wholesale Jewelry, Necklaces, Bracelets, Earrings of India. <CFOUTPUT >#subcat# #category# </CFOUTPUT> from Beaded Jewelry Designs</TITLE>
	<meta name="description" content="<CFOUTPUT>#subcat# #category#</CFOUTPUT>,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+20)#"><cfoutput>#description#. </cfoutput></cfloop>">
<meta name="keywords" content="<cfoutput>#subcat# #category#, </cfoutput><CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+20)#"></cfloop>">

</HEAD>
<a href='listwholesale.cfm?category=bracelets'><img src='http://www.cheap-jewelry.com/images/bracelets.png'></a> | <a href='listwholesale.cfm?category=earrings'><img src='http://www.cheap-jewelry.com/images/Earrings.png'></a> | <a href='listwholesale.cfm?category=necklaces'><img src='http://www.cheap-jewelry.com/images/necklaces.png'></a> 

<!---<CFoutput>#cgi.http_referer#</CFOUTPUT>
--->
    <FONT FACE="Verdana, Helvetica" SIZE="2">

	<!--- </cfif>  edit --->
<!---
<table border=3 width=750 cellpadding='0' cellspacing='0'><tr><td width=750 align=center>
--->
<CFIF (#GetList.cat# is "Sets")>
<CFSET #category# = "Necklaces">
</cfif><cfoutput>

<CFIF (#GetList.cat# is not "")>
<input type='hidden' name='category' value='#GetList.cat#'>
<CFELSE>
<input type='hidden' name='category' value='#category#'>
</cfif>
<input type='hidden' name='sortorder' value='#sortorder#'>
</cfoutput>

<!---
<SELECT NAME="subcat" SIZE="1" VALUE="">
<OPTION selected value="">Select Type</option>
<OPTION value="">Select All</option>
<cfoutput query="getsubcat">
<option value="#subcat#">#subcat#</option></cfoutput>
</SELECT>--->
&nbsp;
<a name="picsonly">

<!---&nbsp;
<SELECT NAME="category" SIZE="1" VALUE="<CFOUTPUT>#category#</cfoutput>"  onChange="submit(this.form)">
<option selected value="<CFOUTPUT>#category#</cfoutput>">Select Category</option>
<OPTION value="Bracelets">Bracelets</option>
<OPTION value="Necklaces">Necklaces</option>
<OPTION value="Sets">Sets</option>
<OPTION value="earrings">Earrings</option>
<OPTION value="ornaments">Ornaments</option>
</select>
--->
<table width=750><tr><td width=750 align=center>
<CFINCLUDE TEMPLATE="subcatlistwholesale.cfm">

</td></tr></table>

<font color='black'>
<b>Current selection:</b> <b><font size=3 face=verdana color='maroon'><CFOUTPUT>#Ucase(subcat)# 
  #Ucase(color)# #Ucase(category2)#, #GetList.recordcount# items</CFOUTPUT></font> 
<cfif session.mail eq 'pandey@aol.com'><font size=5 color='orange'>APPROX. WHOLESALE RATES</font></cfif>
<cfif category is 'ornaments'><br><b><font color=green>Christmas Ornaments handmade with paper mache and hand painted intricately in the Indian state of Jammu and Kashmir.</font></b></cfif>
<!---
<CFOUTPUT>


<table width=750 align=left><tr><td align=left>

<font color='black'><b>Current selection</b> <b><i><font color='yellow'>#subcat#</font>&nbsp;<font color='yellow'>#color#</font></i></b> sorted by: <i><b><CFIF #sortorder# is "subcat">stone<cfelseif #sortorder# is "datetaken">New to Old<cfelse>#sortorder#</CFIF></font></b></i><br>

<b>Sort or Order by:  <a href='list.cfm?category=#GetList.cat#&sortorder=price&subcat=#URLEncodedformat(subcat)#&color=#color#'>Price</a> | <a href='list.cfm?category=#GetList.cat#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#'>New to Old</a> | <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>

<a href='list.cfm?category=#GetList.cat#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#'><b><font size=4>Next</font></b></a></cfif></td><td align=CENTER>
<!--total shown on this page: #start# to #evaluate(display + start-1)# (#display#) out of #GetList.Recordcount# |-->

<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>

<a href='list.cfm?category=#GetList.cat#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#'><b><font size=4>Next</font></b></a>

<CFELSEIF start is not "1">

<a href='list.cfm?category=#GetList.cat#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#'><b>Show First Page</b></a>

</CFIF>
</td></tr></table>
</CFOUTPUT>
--->

<CFIF #getList.recordcount# is 0><font size='4' color='black'><br>No matches found for your criteria specified. Redefine your search.</font></cfif>

<CFSET #columns#=1>
<CFSET #rows#=1>
<br>&nbsp;<br>


<Table cellpadding=10 cellspacing=0 border='0' width="750"><tr bgcolor="white" valign="top">

<CFSET #enddisplay#= #start# + #display#-1>
<CFSET #currentrow#=#start#>

<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#enddisplay#">

<CFOUTPUT>
<CFSET invent=inventory>
<td valign=top align='center' border=0>
<CFIF getList.status is 3>
<CFIF #getList.saleprice# is ""><CFSET Saleprice = 0.80*price></cfif>
<a href='http://www.semiprecious.com/images/#lcase(category)#/#newitem#.jpg'>
<CFELSE>
<a href='http://www.semiprecious.com/images/#lcase(category)#/#newitem#.jpg'>
</cfif>

<img src = "images/#lcase(category)#/thumb/#newitem#.jpg"  border='4' bordercolor='black'
 
  name="img#newitem#" alt="#subcat# #category#"></a><br><font verdana size='1'>Item: #newitem# <cfif status is 3 and session.mail neq 'pandey@aol.com'><img src=images/sale.gif width="80" height="120"><B>#dollarformat(saleprice)#</B>&nbsp;Regular</cfif>
<b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br>
<cfif inventory is 0><font color=red size=2>Sold Out but available in 30 days!</font></cfif>
<cfif status is 3>
<a href='http://www.semiprecious.com/images/#lcase(category)#/#newitem#.jpg'>
<CFELSE>
<a href='http://www.semiprecious.com/images/#lcase(category)#/#newitem#.jpg'>
</CFIF>
<font verdana size='2'><b>Zoom</b></font></a>&nbsp;<CFIF #Edit# Is "MAMAMIA"><a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'><CFIF #status# is "1">Inactive<cfelseif #status# is "2">Discont.<cfelseif #status# is "4">Free<cfelseif #status# is "3">Sale<cfelseif #status# is "5">Picture</cfif></font></CFIF></font>

	</td>
<!---
<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
	<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
--->
<cfif columns EQ #displaycolumns#>
	<CFSET columns=0>
	</tr></table>
<Table cellpadding=10 cellspacing=0 border='0' width="750"><tr width=750 bgcolor="#bcolor#" valign="top">

</cfif>
	<CFSET columns=columns + 1>
</CFOUTPUT>
</CFLOOP></b>
</font>
<cfif columns NEQ 0></tr></table></cfif>
<CFIF (#GetList.cat# is "Sets")>
<CFSET #category# = "Sets">
</cfif>
<CFOUTPUT>
<table width=720 align=left BORDER=0><tr><td align=right border=0>
<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
<a href='listwholesale.cfm?category=#category2#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#'><b><font size=4>Next <i>#evaluate(GetList.recordcount-enddisplay)#</i> <font color=red>more</font></font><b></a>
<CFELSEIF start is not "1">
<a href='listwholesale.cfm?category=#category2#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#'>Show First Page</a>
</CFIF>
<br>
      <font size="2" face="Arial, Helvetica, sans-serif">&nbsp;</font>&nbsp;<br>
</CFOUTPUT> 
</td></tr></table>

  <!---
<CFIF #session.mail# is "">
You are not logged in and will not earn 10% credit</i>
<CFELSE>
<i>You are logged in as: #session.mail#
</CFIF>--->


<!---<CFINCLUDE TEMPLATE="subcatlist.cfm">--->

<p>.</p>


</BODY>
</HTML>