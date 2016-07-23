<!---<CFCACHE TIMEOUT="#DateAdd("D", "-20", Now())#">
--->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 <CFPARAM NAME="displaycolumns" DEFAULT="4">
 <CFPARAM NAME="category" DEFAULT="necklaces">
 <CFPARAM NAME="sortorder" DEFAULT="datetaken">
 <CFPARAM NAME="PicWidth" DEFAULT= "120">
 <CFPARAM NAME="start" DEFAULT= "1">
 <CFPARAM NAME="edit" DEFAULT= "">
 <CFPARAM NAME="subcat" DEFAULT= "">
 <CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "FEE6CD">
  <CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
 <CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="price" DEFAULT="">
 <CFPARAM NAME="cat1" DEFAULT="">
 <CFPARAM NAME="subcat1" DEFAULT="">
 <CFPARAM NAME="submit2" DEFAULT="">
 <CFPARAM NAME="submit3" DEFAULT="">
 <CFPARAM NAME="priceless" DEFAULT="">
  <CFPARAM NAME="pricegreater" DEFAULT="">

<!---<Cfif category is 'necklaces' and subcat is "">
<cfset subcat='Lapis lazuli'>
</cfif>--->
 <!---
<CFIF #session.edit# is not "">
<CFSET edit=#session.edit#>
b</cfif>
--->
<CFINCLUDE TEMPLATE="setup.cfm">


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
	<TITLE> <CFOUTPUT>Semi-precious #category#, #subcat#</CFOUTPUT> of Semiprecious Stone Jewelry Showcase</TITLE>

	<meta name="description" content="A unique collection of over 300 semiprecious stone jewelry items from India shipped from the US with astonishing prices. We guarantee 100% satisfaction and shipping within 24 hrs. Free shipping if you buy 3 items, and free optional gift wrap. Our shopping cart applies higher discounts as you buy more, so shop with your friends!">
<meta name="keywords" content="semi-precious, semiprecious stones, jewelry, jewellery, <CFOUTPUT>#category#, #subcat# necklace</CFOUTPUT>">

</HEAD>
<CFINCLUDE TEMPLATE="header.htm">

<!---<CFoutput>#cgi.http_referer#</CFOUTPUT>
--->
    <FONT FACE="Verdana, Helvetica" SIZE="2">

<!---

<CFIF #edit# is 'mamamia'>
<CFSET #session.edit#="mamamia">
 <CFSET subcat = #left(subcat,4)#>
<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, saleprice, CAT, subcat, NameID, price, Description, subcat, inventory, buylink, status from Items where (CAT = '#category#') <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF>
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF><CFIF #salestatus# is 3>and (status = 3)</CFIF>
	order by #sortorder# <CFIF #sortorder# is "datetaken">Desc</CFIF></CFQUERY>
<CFELSE> --->
<cfif price is "">

	<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, CAT, subcat, NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description, subcat, inventory, buylink from Items where (CAT = '#category#' <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif>) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF>
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not ""> and (price <= #priceless#)</CFIF> <CFIF #pricegreater# is not ""> and (price >= #pricegreater#)</CFIF>
	order by #sortorder# <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">Desc</CFIF></CFQUERY>

</cfif>
	
<cfif price is not "">
<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
SELECT newitem, CAT, CAT as category, subcat, NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description, subcat, inventory, buylink from Items
<cfif isdefined("form.submit5")> where inventory >0 and (saleprice
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
<CFINCLUDE TEMPLATE="subcatlist.cfm">

</td></tr></table>

<font color='black'><b>Current selection:</b> <b><font size=3 face=verdana color='maroon'><CFOUTPUT>#Ucase(subcat)# #Ucase(color)# #Ucase(GetList.cat)#, #GetList.recordcount# items</CFOUTPUT></font>
	<cfif session.mail eq 'pandey@aol.com'><font size=5 color='orange'>APPROX. WHOLESALE RATES</font></cfif>
<!---
<CFOUTPUT>


<table width=750 align=left><tr><td align=left>

<font color='black'><b>Current selection</b> <b><i><font color='yellow'>#subcat#</font>&nbsp;<font color='yellow'>#color#</font></i></b> sorted by: <i><b><CFIF #sortorder# is "subcat">stone<cfelseif #sortorder# is "datetaken">New to Old<cfelse>#sortorder#</CFIF></font></b></i><br>

<b>Sort or Order by:  <a href='searchlist.cfm?category=#GetList.cat#&sortorder=price&subcat=#URLEncodedformat(subcat)#&color=#color#'>Price</a> | <a href='searchlist.cfm?category=#GetList.cat#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#'>New to Old</a> | <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>

<a href='searchlist.cfm?category=#GetList.cat#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#'><b><font size=4>Next</font></b></a></cfif></td><td align=CENTER>
<!--total shown on this page: #start# to #evaluate(display + start-1)# (#display#) out of #GetList.Recordcount# |-->

<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>

<a href='searchlist.cfm?category=#GetList.cat#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#'><b><font size=4>Next</font></b></a>

<CFELSEIF start is not "1">

<a href='searchlist.cfm?category=#GetList.cat#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#'><b>Show First Page</b></a>

</CFIF>
</td></tr></table>
</CFOUTPUT>
--->

<CFIF #getList.recordcount# is 0><font size='4' color='black'><br>No matches found for your criteria specified. Redefine your search.</font></cfif>

<CFSET #columns#=1>
<CFSET #rows#=1>
<br>&nbsp;<br>


<Table cellpadding=10 cellspacing=0 border='1' width="750"><tr bgcolor="#FEE6CD" valign="top">

<CFSET #enddisplay#= #start# + #display#-1>
<CFSET #currentrow#=#start#>

<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#enddisplay#">

<CFOUTPUT>
<td valign=top align='center' border=0>
<CFIF getList.status is 3>
<CFIF #getList.saleprice# is ""><CFSET Saleprice = 0.80*price></cfif>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#'>
<CFELSE>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#'>
</cfif>

<img src = "images/#lcase(category)#/thumb/#newitem#.jpg"  border='4' bordercolor='black'
 
  name="img#newitem#"></a><br><font verdana size='1'><cfif status is 3 and session.mail neq 'pandey@aol.com'><img src=images/sale.gif width="80" height="120"><B>#dollarformat(saleprice)#</B>&nbsp;Regular</cfif>
<b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br>
<cfif status is 3>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#'>
<CFELSE>
<a href='detail.cfm?category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#'></CFIF><font verdana size='2'><b>Zoom/Detail</b></font></a>&nbsp;<CFIF #Edit# Is "MAMAMIA"><a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'><CFIF #status# is "1">Inactive<cfelseif #status# is "2">Discont.<cfelseif #status# is "4">Free<cfelseif #status# is "3">Sale<cfelseif #status# is "5">Picture</cfif></font></CFIF></font>

	</td>
<!---
<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
	<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
--->
<cfif columns EQ #displaycolumns#>
	<CFSET columns=0>
	</tr></table>
<Table cellpadding=10 cellspacing=0 border='1' width="750"><tr width=750 bgcolor="##<CFIF BCOLOR IS "FEE6CD"><CFSET BCOLOR="FEE6cd"><CFELSE>
	<cfset bcolor="FEE6CD"></CFIF>#bcolor#" valign="top">

</cfif>
	<CFSET columns=columns + 1>
</CFOUTPUT>
</CFLOOP></b>
</font>
<cfif columns NEQ 0></tr></table></cfif>

<CFOUTPUT>
<table width=720 align=left BORDER=0><tr><td align=right>
<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
<a href='searchlist.cfm?category=#GetList.cat#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&subcat1=#URLEncodedformat(subcat1)#color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&price=#price#&cat1=#cat1#&submit2=#submit2#&submit3=#submit3#'><b><font size=4>>>>>Click here for <i>#evaluate(GetList.recordcount-enddisplay)#</i> <font color=red>more</font></font><b></a>
<CFELSEIF start is not "1">
<a href='searchlist.cfm?category=#GetList.cat#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&price=#price#'>Show First Page</a>
</CFIF>
</td></tr></table>

<!---
<CFIF #session.mail# is "">
You are not logged in and will not earn 10% credit</i>
<CFELSE>
<i>You are logged in as: #session.mail#
</CFIF>--->
</CFOUTPUT>
<P><FONT COLOR=WHITE>.</FONT></P>
<table WIDTH=750 ALIGN=LEFT><tr><td>
<!-- Begin Free Links Network Large Icon Code -->
<P><A HREF="http://freelinksnetwork.com/links/semiprecious">
<IMG SRC="http://freelinksnetwork.com/images/icon.GIF" WIDTH="125" HEIGHT="145"
ALIGN="BOTTOM" ALT="Free Links Network - Make Your Hit Counter Scream I SURRENDER!" 
BORDER="0"></A></P>

<!-- End Free Links Network Large Icon Code -->
<CFINCLUDE TEMPLATE="subcatlist.cfm">
</td></tr>
<tr><td>


</TD></TR></TABLE>
<p>.</p>
<TABLE width=750><TR>
<TD WIDTH=100 ALIGN=center>
<!-- START OF ADDME LINK -->
<a href="http://www.addme.com"><img width="88" height="31"
src="http://www.addme.com/link8.gif" alt="Add Me!" border="0"></a>
<!-- END OF ADDME LINK --></td><td ALIGN=LEFT>
<!-- begin top 50 Gem sites -->

</td></tr>

<tr><td>
<!-- Begin Web-Stat code -->
<script>
function sE(){return true;}window.onError=sE;var lp=0;
function clr(){lp++;if(lp==1){document.ctr.src="http://64.49.222.57/0.gif";}
else {clearTimeout(myT);return true;}}
var myT=setTimeout('clr()',120000);var rn=0;
document.write('<a href="http://www.web-stat.com/stats.shtml?semiprecious" target="new">');
document.write('<img name="ctr" src="http://www.web-stat.com/fastcount.cgi?');
document.write('semiprecious,'+document.referrer);
if (window.screen){
document.write(','+screen.width+'x'+screen.height+','+screen.colorDepth+','+rn);
}else{document.write(',,,'+rn);}
document.write('" onError="clr();" onAbort="clr();" onLoad="clearTimeout(myT);"');
document.write('border=0 alt="web-stat hit counter"></a>');
</script><noscript>
<a href="http://www.web-stat.com/stats.shtml?semiprecious" target="new">
<img src=
"http://www.web-stat.com/fastcount.cgi?semiprecious,NoJavaScript"
border=0 alt="Web-Stat hit counter"></a>
</noscript>
<!-- End Web-Stat code -->



</td></tr>
</table>

</BODY>
</HTML>