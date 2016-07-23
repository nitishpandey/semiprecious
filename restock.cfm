<!---<CFCACHE TIMEOUT="#DateAdd("D", "-20", Now())#">
--->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 <CFPARAM NAME="displaycolumns" DEFAULT="2">
 <CFPARAM NAME="category" DEFAULT="necklaces">
 <CFPARAM NAME="sortorder" DEFAULT="subcat">
 <CFPARAM NAME="PicWidth" DEFAULT= "270">
 <CFPARAM NAME="start" DEFAULT= "1">
 <CFPARAM NAME="edit" DEFAULT= "">
 <CFPARAM NAME="subcat" DEFAULT= "">
 <CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "FEE6CD">
  <CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
 <CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="priceless" DEFAULT="">
  <CFPARAM NAME="pricegreater" DEFAULT="">
  <CFPARAM NAME="printwhat" default="">


<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and inventory<2)
</cfquery>

  


 <!---
<CFIF #session.edit# is not "">
<CFSET edit=#session.edit#>
b</cfif>
--->
<CFINCLUDE TEMPLATE="setup.cfm">
<cfset display=6>

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

<HTML>
<HEAD>
	<TITLE>Semiprecious Stone Jewelry Showcase</TITLE>

	<meta name="description" content="A unique collection of over 300 semiprecious stone jewelry items from India shipped from the US with astonishing prices. We guarantee 100% satisfaction and shipping within 24 hrs. Free shipping if you buy 3 items, and free optional gift wrap. Our shopping cart applies higher discounts as you buy more, so shop with your friends!">
<meta name="keywords" content="semi-precious, semiprecious stones, jewelry, jewellery, <CFOUTPUT>#category#, #subcat# necklace</CFOUTPUT>">

</HEAD>
<body topmargin=0>
<!---<CFINCLUDE TEMPLATE="header.htm">--->

<!---<CFoutput>#cgi.http_referer#</CFOUTPUT>
--->
    <FONT FACE="Verdana, Helvetica" SIZE="2">


<cfif printwhat eq "reorder">
	<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, CAT, subcat, NameID, (basecost*3/48) as price, reorder, basecost, saleprice, status, Description, subcat, inventory, buylink from Items where (status=0 or status=3) and  inventory<3  and CAT = '#category#' <cfif subcat is not ""> and subcat='#subcat#'</cfif>
	order by cat, subcat, newitem </CFQUERY>
	</cfif>
	
<cfif printwhat eq "catalogueall">
	<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, CAT, subcat, NameID, (basecost*5/48) as price, basecost, saleprice, status, Description, subcat, inventory, buylink from Items where (CAT = '#category#' <cfif subcat is not ""> and subcat='#subcat#'</cfif> and (status=0 or status=3))
	order by cat,subcat,newitem </CFQUERY>
	</cfif>


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
<table width='750' align='center' cellpadding='0' cellspacing='0' border='0'><tr align='LEFT'><td>
<cfif category is not 'ornaments'>
<FORM ACTION="restock.cfm" method="get">
<select name=subcat>
<OPTION selected value="">Select Type</option>
<OPTION value="">Select All</option>
<cfoutput query="getsubcat">
<option value="#subcat#">#subcat#</option></cfoutput>
</SELECT>

<input type="button" value='Go' Onclick="submit(this.form)">
<input type=hidden name=printwhat value="<cfoutput>#printwhat#</cfoutput>">
<input type=hidden name=category value="<cfoutput>#category#</cfoutput>">
<font color='black'><b>Current selection:</b> <font size=1 face=verdana color='maroon'><CFOUTPUT>#Ucase(subcat)# #Ucase(color)# #Ucase(GetList.cat)#, #GetList.recordcount# items</CFOUTPUT></font>
</FORM>
</cfif>
</td></tr></table>
	<cfif session.mail eq 'pandey@aol.com'><font size=5 color='orange'>APPROX. WHOLESALE RATES</font></cfif>


<CFIF #getList.recordcount# is 0><font size='4' color='black'><br>No matches found for your criteria specified. Redefine your search.</font></cfif>

<CFSET #columns#=1>
<CFSET #rows#=1>
<br>&nbsp;<br>


<Table  width=700 border=1 ><tr valign="top">

<CFSET #enddisplay#= #start# + #display#-1>
<CFSET #currentrow#=#start#>

<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#enddisplay#">

<CFOUTPUT>
<td valign=top align='left' width=300>
<img src = "images/#lcase(category)#/#newitem#.jpg"  width=#picwidth# border='0' bordercolor=''
 
  name="img#newitem#"><br><font verdana size='1'>
Item num #newitem#,<font color="##000080"><!---#evaluate(10*round(basecost*0.080))#---></font><br><font face="Verdana" verdana size="1">#description#</font>  In Stock: #inventory#<br>
<!---	<br><a href='reorder.cfm?itemid=#newitem#'>Reorder=#Reorder#</a>--->
	</td>

<cfif columns EQ #displaycolumns#>
	<CFSET columns=0>
	</tr></table>
<Table width=700 border=1><tr valign="top">

</cfif>
	<CFSET columns=columns + 1>
</CFOUTPUT>
</CFLOOP></b>
</font>
<cfif columns NEQ 0></tr></table></cfif>

<CFOUTPUT>
<table align=left BORDER=1 color=red width=700><tr><td width=300 align=right>
<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
<a href='restock.cfm?category=#GetList.cat#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&printwhat=#printwhat#'><b><font size=4>>>>>Click here for <i>#evaluate(GetList.recordcount-enddisplay)#</i> <font color=red>more</font></font><b></a>
<CFELSEIF start is not "1">
<a href='restock.cfm?category=#GetList.cat#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&printwhat=#printwhat#'>Show First Page</a>
</CFIF>
</td></tr></table>

</CFOUTPUT>
<P><FONT COLOR=WHITE>.</FONT></P>
<table  ALIGN=LEFT><tr><td>


</td></tr></TABLE>
<p>.</p>

</BODY>
</HTML>