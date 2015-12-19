
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 <CFPARAM NAME="displaycolumns" DEFAULT="6">
 <CFPARAM NAME="category" DEFAULT="necklaces">
  <CFPARAM NAME="category2" DEFAULT=#category#>
 <CFPARAM NAME="sortorder" DEFAULT="datetaken">
 <CFPARAM NAME="PicWidth" DEFAULT= "50">
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

<!---<Cfif category is 'necklaces' and subcat is "">
<cfset subcat='Lapis lazuli'>
</cfif>--->
 <!---
<CFIF #session.edit# is not "">
<CFSET edit=#session.edit#>
b</cfif>
--->
<CFINCLUDE TEMPLATE="setup.cfm">
<cfset display =100>

 <CFIF "#category#" Is "bracelets">
 <CFSET #PicWidth# = "50">
  <CFSET #displaycolumns# = "4">

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
<CFQUERY DATASOURCE="gemssql" NAME="GetList">
	SELECT newitem, saleprice, CAT, subcat, NameID, price, Description, subcat, inventory, buylink, status from Items where (CAT = '#category#') <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF>
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF><CFIF #salestatus# is 3>and (status = 3)</CFIF>
	order by #sortorder# <CFIF #sortorder# is "datetaken">Desc</CFIF></CFQUERY>
<CFELSE> --->
<cfif not isdefined("form.submit5")>

	<CFQUERY DATASOURCE="gemssql" NAME="GetList">
	SELECT newitem, CAT, subcat, NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description, subcat, inventory, buylink from Items where (CAT = '#category#') and (storage ='Angela'  or supplier ='Angela')
and inventory <1	order by #sortorder# <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">Desc</CFIF></CFQUERY>

</cfif>
	
<cfif isdefined("form.submit5")>
<CFQUERY DATASOURCE="gemssql" NAME="GetList">
SELECT newitem, CAT, subcat, NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description, subcat, inventory, buylink from Items
<cfif isdefined("form.submit5")> where (saleprice
 <cfif #form.price# EQ 0>
     < 1000 )
  <cfelse>
     <cfif #form.price# EQ 5>
       < 5.1)
    <cfelse>
       <cfif #form.price#  EQ 10>
         < 10.1 )
       <cfelse>
	     <cfif #form.price# EQ 20>
	        < 20.1)
         <cfelse>
		   <cfif #form.price# EQ 1020>
		      < 20.1) and (saleprice > 9.99)
		    <cfelse>
		      > 19.99)
		  </cfif>
	    </cfif>
      </cfif>
	     </cfif>
      </cfif>
	  
<cfif not isDefined("form.cat1")>
 <cfif isDefined("form.cat")>
 and (cat in  (#PreserveSingleQuotes(form.cat)#))
 </cfif>
</cfif>
<cfif not isDefined("form.subcat1")>
<cfif isDefined("form.subcat")>
and (subcat in (#PreserveSingleQuotes(form.subcat)#))
</cfif>
</cfif>
 <cfelse>
	  <cfif isDefined("form.submit1")>
	   <cfif not isDefined("form.cat1")>
 <cfif isDefined("form.cat")>
where (cat in  (#PreserveSingleQuotes(form.cat)#))
 </cfif>
</cfif>
<cfelse>
	  <cfif isDefined("form.submit3")>
	  <cfif not isDefined("form.subcat1")>
<cfif isDefined("form.subcat")>
where(subcat in (#PreserveSingleQuotes(form.subcat)#))
</cfif>
</cfif>
 <cfelse>
	  <cfif isDefined("form.submit2")>
	   where (saleprice
 <cfif #form.price# EQ 0>
     < 1000 )
  <cfelse>
     <cfif #form.price# EQ 5>
       < 5.1)
    <cfelse>
       <cfif #form.price#  EQ 10>
         < 10.1 )
       <cfelse>
	     <cfif #form.price# EQ 20>
	        < 20.1)
         <cfelse>
		   <cfif #form.price# EQ 1020>
		      < 20.1) and (saleprice > 9.99)
		    <cfelse>
		      > 19.99)
		  </cfif>
	    </cfif>
      </cfif>
	     </cfif>
      </cfif>
	   <cfelse>
	   <h3>How on earth did we land up here !</h3>
	   </cfif>
	  </cfif>
	  </cfif>
	  </cfif>

order by cat, saleprice 
</cfquery>
</cfif>
<CFSET #enddisplay#= #start# + #display#>
<HTML>
<HEAD>
	<TITLE> <CFOUTPUT >#subcat# #category# </CFOUTPUT> from gems Stone Jewelry</TITLE>
<font size=1 color=gray><CFOUTPUT>#subcat# #category# </CFOUTPUT> gems Stone Jewelry</font>
	<meta name="description" content="Cheap <CFOUTPUT>#subcat# #category#</CFOUTPUT>,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#enddisplay#"><cfoutput>#description#. </cfoutput></cfloop>">
<meta name="keywords" content="<cfoutput>#subcat# #category#, </cfoutput><CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#enddisplay#"><cfoutput>#subcat# #cat#,</cfoutput></cfloop>">

</HEAD>
<CFINCLUDE TEMPLATE="header.htm">

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
</td></tr></table>
<font color='black'>
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
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
<CFELSE>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
</cfif>

<img src = "images/#lcase(category)#/thumb/#newitem#.jpg"  border='4' bordercolor='black'
 
  name="img#newitem#" alt="#subcat# #category#"></a><br><font verdana size='1'><cfif status is 3 and session.mail neq 'pandey@aol.com'><img src=images/sale.gif width="80" height="120"><B>#dollarformat(saleprice)#</B>&nbsp;Regular</cfif>
<b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br>
<cfif inventory is 0><font color=red size=2>Sold Out!</font></cfif>
<cfif status is 3>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
<CFELSE>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
</CFIF>
<font verdana size='2'><b>Zoom/Detail</b></font></a>&nbsp;<a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'><CFIF #status# is "1">Inactive<cfelseif #status# is "2">Discont.<cfelseif #status# is "4">Free<cfelseif #status# is "3">Sale<cfelseif #status# is "5">Picture</cfif></font></font>

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