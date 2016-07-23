 	<!---<CFCACHE TIMEOUT="#DateAdd("D", "-20", Now())#">
--->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">		<script language="JavaScript1.1">
function addressWindow(title, msg,msg2)
{

  var width="300", height="225";
  var left = (screen.width/2) - width/2;
  var top = (screen.height/2) - height/2;
  var styleStr = 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbar=no,resizable=no,copyhistory=yes,width='+width+',height='+height+',left='+left+',top='+top+',screenX='+left+',screenY='+top;
  var msgWindow = window.open("emailimage.cfm?newitem=msg","msgWindow", styleStr);
  var head = '<head><title>'+title+'</title></head>';
  var body = '<center>Processing..<br><p><form><input type="button" value="  Close   " onClick="self.close()"></form>';
  msgWindow.document.write(head + body);
  var dest = "emailimage.cfm?newitem="+msg+"&cat="+msg2;
 msgWindow.location.href = dest; 
}
</script>
 <CFPARAM NAME="displaycolumns" DEFAULT="4">
 <CFPARAM NAME="category" DEFAULT="ALL">
 <CFPARAM NAME="category2" DEFAULT="ALL">
 <CFPARAM NAME="sortorder" DEFAULT="datetaken">
  <CFPARAM NAME="PicWidth" DEFAULT= "120">
 <CFPARAM NAME="start" DEFAULT= "1">
 <CFPARAM NAME="edit" DEFAULT= "">
 <CFPARAM NAME="subcat" DEFAULT= "">
  <CFPARAM NAME="advancedsearch" DEFAULT= "">
    <CFPARAM NAME="advancedsearch1" DEFAULT= "">
 <CFPARAM NAME="advancedsearch2" DEFAULT= "">
  <CFPARAM NAME="advancedsearch3" DEFAULT= "">
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
  <cfset advancedsearch=replacenocase(advancedsearch," & "," ")>
   <cfset advancedsearch=replacenocase(advancedsearch,"jewelry"," ")>
   <cfset advancedsearch=replacenocase(advancedsearch,"jewellery"," ")>
   <cfset advancedsearch=replacenocase(advancedsearch," or "," ")>
   <cfset advancedsearch=replacenocase(advancedsearch," with "," ")>
   <cfset advancedsearch=replacenocase(advancedsearch," semiprecious "," ")>
<Cfif listlen(advancedsearch," ") gt 0><cfset advancedsearch=replacenocase(advancedsearch," and ", " ")>
<CFSET advancedsearch1 = left(listGetat(advancedsearch,1," "),4)></cfif>
<Cfif listlen(advancedsearch," ") gt 1><CFSET advancedsearch2 = left(listGetat(advancedsearch,2," "),4)></cfif>
<Cfif listlen(advancedsearch," ") gt 2><CFSET advancedsearch3 = left(listGetat(advancedsearch,3," "),4)></cfif>
<CFSET colors ='red,blue,green,yellow,black,pink,white'>
<CFIF listcontainsnocase(colors, advancedsearch1)>
<CFSET color= advancedsearch1></CFIF>
<!---
<cfif session.priceless neq priceless and priceless neq "" and priceless neq "All">
<cfset session.priceless=priceless>
<cfelseif priceless eq "All">
<cfset priceless="">
<cfset session.priceless="">
<cfelse>
<cfset priceless=session.priceless>
</cfif>
--->

<CFIF CATEGORY  EQ ""><CFSET CATEGORY ="ALL"></CFIF>
<CFSET CATEGORY2=CATEGORY>
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

<CFIF advancedsearch is not ""><CFSET #display#=21>  <CFSET #displaycolumns# = "3">
		<CFIF start EQ 1>
			<CFQUERY DATASOURCE="semiprecious" NAME="searched">
			insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()# ) 
			</cfquery>
		</CFIF>


</CFIF>

 <CFIF category Is "bracelets">
 <CFSET #PicWidth# = "150">
  <CFSET #displaycolumns# = "3">

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
<cfif not isdefined("form.submit5")>

	<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	Select * from (SELECT 0 as orderbuy, newitem, CAT, subcat, datetaken, NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description,  inventory, buylink from Items where (1=1  	<cfif advancedsearch is "">  <CFIF category NEQ "ALL">and (CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>)</CFIF></cfif> <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <!---<cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif>--->) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF> 
	<CFIF advancedsearch1 is not "">and (left(subcat,3) ='#advancedsearch1#')</CFIF> 
	<CFIF advancedsearch2 is not "">and (left(cat,3) = '#advancedsearch2#')</CFIF> 
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not "">and (price <=  #evaluate(priceless+10)# and price >=  #evaluate(priceless-10)#)</cfif> 
	<CFIF advancedsearch is not "">
	UNION
	SELECT 1 as orderbuy, newitem, CAT, subcat, datetaken,  NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description,  inventory, buylink from Items where (1=1  	<cfif advancedsearch is "">  <CFIF category NEQ "ALL">and (CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>)</CFIF></cfif> <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <!---<cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif>--->) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF> 
	<CFIF advancedsearch1 is not "">and  (left(subcat,3) = '#advancedsearch1#')</CFIF> 
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not "">and (price <=  #evaluate(priceless+10)# and price >=  #evaluate(priceless-10)#)</cfif> 
	</CFIF>
	<CFIF advancedsearch is not "">
	UNION
	SELECT 2 as orderbuy, newitem, CAT, subcat, datetaken,  NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description,  inventory, buylink from Items where (1=1  	<cfif advancedsearch is "">  <CFIF category NEQ "ALL">and (CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>)</CFIF></cfif> <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <!---<cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif>--->) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF> 
	<CFIF advancedsearch1 is not "">and (description like '%#advancedsearch1#%')</CFIF> 
	<CFIF advancedsearch2 is not "">and (description like '%#advancedsearch2#%')</CFIF> 
	<CFIF advancedsearch3 is not "">and (description like '%#advancedsearch3#%')</CFIF>
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not "">and (price <=  #evaluate(priceless+10)# and price >=  #evaluate(priceless-10)#)</cfif> 
	</CFIF>
	<CFIF advancedsearch3 is not "">
	UNION
	SELECT 3 as orderbuy, newitem, CAT, subcat, datetaken,  NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description,  inventory, buylink from Items where (1=1  	<cfif advancedsearch is "">  <CFIF category NEQ "ALL">and (CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>)</CFIF></cfif> <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <!---<cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif>--->) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF> 
	<CFIF advancedsearch1 is not "">and (description like '%#advancedsearch1#%')</CFIF> 
	<CFIF advancedsearch2 is not "">and (description like '%#advancedsearch2#%')</CFIF> 
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not "">and (price <=  #evaluate(priceless+10)# and price >=  #evaluate(priceless-10)#)</cfif> 
	</CFIF>
	<CFIF advancedsearch1 is not "">
	UNION
	SELECT 4 as orderbuy, newitem, CAT, subcat, datetaken,  NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description,  inventory, buylink from Items where (1=1  	<cfif advancedsearch is "">  <CFIF category NEQ "ALL">and (CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>)</CFIF></cfif> <CFIF #salestatus# is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <!---<cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif>--->) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF> 
	<CFIF advancedsearch1 is not "">and ((description like '%#advancedsearch1#%')</CFIF> 
	<CFIF advancedsearch2 is not "">or (description like '%#advancedsearch2#%')</CFIF> 
	<CFIF advancedsearch3 is not "">or (description like '%#advancedsearch3#%')</CFIF>)
	And NOT (
	<CFIF advancedsearch1 is not ""> (description like '%#advancedsearch1#%')</CFIF> 
	<CFIF advancedsearch2 is not "">and (description like '%#advancedsearch2#%')</CFIF> 
	<CFIF advancedsearch3 is not "">and (description like '%#advancedsearch3#%')</CFIF>)
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not "">and (price <=  #evaluate(priceless+10)# and price >=  #evaluate(priceless-10)#)</cfif> 
	</cfif>) S
	<cfif advancedsearch1 is not ""> order by orderbuy <cfelse> 	order by #sortorder# <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">Desc</CFIF></cfif>

	</CFQUERY>
</cfif>
	
<cfif isdefined("form.submit5")>
<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
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
	<TITLE>Buy Jewelry, Necklaces, Bracelets, Earrings of India Buy Wholesale. <CFOUTPUT >#subcat# #category# </CFOUTPUT> from Beaded Jewelry Designs</TITLE>
	<meta name="description" content="<CFOUTPUT>#subcat# #category#</CFOUTPUT>,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#"><cfoutput>#description#. </cfoutput></cfloop>">
<meta name="keywords" content="<CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#"><cfoutput>#subcat# #category#, </cfoutput></cfloop>">
</HEAD>
<BODY BGCOLOR="white" link="black" topmargin='0' vlink=black text='black' alink=black>
<CFINCLUDE TEMPLATE="header.htm">


	<!--- </cfif>  edit --->
<!---
<table border=3 width=750 cellpadding='0' cellspacing='0'><tr><td width=750 align=center>
--->
<cfoutput>

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
<table width=100% align=right><tr valign=top><td valign=top align=right>

<CFINCLUDE TEMPLATE="subcatlist.cfm">

</td></tr></table><p>&nbsp;</p>

<font color='black'>
<table><tr><td width=140 valign=top bgcolor="#CCCC99"><b><cfoutput>#ucase(Category)#<br>
Available In</cfoutput></b>
	<CFINCLUDE TEMPLATE="subcatvertical.cfm">
<td valign=top>
<b><cfif advancedsearch is not "">Displaying search results in order of matching words / criteria.
<cfelse>Current selection:</b> <b><font size=3 face=verdana color='maroon'><CFOUTPUT>#Ucase(subcat)# 
  #Ucase(color)# #Ucase(category2)# <Cfif priceless is not "">around #dollarformat(priceless)#</Cfif>, #GetList.recordcount# items</CFOUTPUT></font> </cfif>
<cfif session.mail eq 'pandey@aol.com'><font size=5 color='orange'>APPROX. WHOLESALE RATES</font></cfif>
<cfif category is 'ornaments'><br><b><font color=green>Christmas Ornaments handmade with paper mache and hand painted intricately in the Indian state of Jammu and Kashmir.</font></b></cfif>
<cfif category is 'earrings'><br><b><font color=brown size=-1>Nickel Free plated, Hypo Allergenic option available for dangling earrings by emailing anup@semiprecious.com or calling us 512 589 9009. </font></b></cfif>
<cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif>
<cfif subcat is 'pearl'><br><b><font color=gray size=-1>Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b></cfif>

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

<CFIF #getList.recordcount# is 0><font size='4' color='black'><br>No matches found for your criteria specified. Redefine your search.</font>
<br>
However some other items on sale:

<cfset salestatus = 3>
<CFQUERY DATASOURCE="semiprecious" NAME="GetList">
	SELECT newitem, CAT, subcat, NameID, <cfif #session.mail# eq 'pandey@aol.com'> (basecost*2.5/48) as price<cfelse> price</cfif>, saleprice, status, Description, subcat, inventory, buylink from Items where (1=1  	<cfif advancedsearch is ""> and (CAT = '#category#' <CFIF category is 'necklaces'> or  CAT = 'sets' </cfif>)</cfif> <CFIF salestatus is 3>and (status = 3)<CFELSE>and (status=0 or status=3)</CFIF> <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>-1</cfif>) <CFIF #subcat# is not "">and (subcat like '%#Left(subcat,4)#%')</CFIF> 
	<CFIF #color# is not "">and (color like '%#color#%')</CFIF> <CFIF #priceless# is not "">and (price <=  #priceless#)</cfif> <CFIF #pricegreater# is not ""> and (price >= #pricegreater#)</CFIF>
	order by #sortorder# <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">Desc</CFIF></CFQUERY>
</cfif>
<CFSET #columns#=1>
<CFSET #rows#=1>
<br>&nbsp;<br>
<table align="center" width=100%>
	<tr valign=top><td valign=top align=left>

	</td>
	<CFIF (#GetList.cat# is "Sets")>
	<CFSET #category# = "Necklaces">
	</cfif>
	<td valign=top align=left>
		<Table cellpadding=10 cellspacing=0 border='0' width="100%">
		<tr bgcolor="white" valign="top">
		<CFSET #enddisplay#= #start# + #display#-1>
		<CFSET #currentrow#=#start#>
		<CFLOOP QUERY="Getlist"
		startrow="#start#"
		endrow="#enddisplay#">
		<CFOUTPUT>
		<CFSET invent=inventory>
		<td valign=top align='center' border=0 width=200>
<!----			<CFIF getList.status is 3> --->
			<CFIF getList.saleprice is "" or getList.Saleprice eq 0><CFSET Saleprice = 0.80*price></cfif>
			<cfif not isdefined("url.filter")>
			<a href='detail.cfm/#newitem#.htm?filter=#urlencodedformat(QUERY_STRING)#'>	
			<cfelse>
			<a href='detail.cfm/#newitem#.htm?filter=#urlencodedformat(url.filter)#' >
			</cfif>
<!---	<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			<CFELSE>
			<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
			<img src = 'images/<cfif getlist.cat is "sets">necklaces<cfelse>#lcase(getlist.cat)#</cfif>/thumb/#newitem#.jpg'  border='4' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a><br><font verdana size='1'><cfif status is 3 and session.mail neq 'pandey@aol.com'><img src=images/sale.gif width="80" height="120">
			<B>#dollarformat(saleprice)#</B>&nbsp;Regular</cfif>
			<b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br>
			<cfif inventory is 0><font color=red size=2>Sold Out!</font></cfif>
			<font verdana size='2'>
			<cfif not isdefined("url.filter")>
			<a href='detail.cfm/#newitem#.htm?filter=#urlencodedformat(QUERY_STRING)#' >
			<cfelse>
			<a href='detail.cfm/#newitem#.htm?filter=#urlencodedformat(url.filter)#' >
			</cfif><b>Zoom/Buy</b> </font></a>&nbsp;or <a href='javascript:addressWindow("Address Details","#newitem#","#lcase(getlist.cat)#");' > Email Picture</a><CFIF #Edit# Is "MAMAMIA"><a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'><CFIF #status# is "1">Inactive<cfelseif #status# is "2">Discont.<cfelseif #status# is "4">Free<cfelseif #status# is "3">Sale<cfelseif #status# is "5">Picture</cfif></font></CFIF></font>
			
		<cfif columns EQ #displaycolumns#>
		<CFSET columns=0>
		
		<!---
		<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
		<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
		--->
		</td></tr>
		<!---</table>
		<Table cellpadding=10 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
		</cfif>
		<CFSET columns=columns + 1>
		</CFOUTPUT>
	</CFLOOP></b>
</font>
<cfif columns NEQ 0>
</tr></table>
</cfif>
<CFIF (#GetList.cat# is "Sets")>
<CFSET #category# = "Sets">
</cfif>
<CFOUTPUT>
<table width=100% align=left BORDER=0><tr>
<td align=left border=0>
<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
<a href='list.cfm?category=#category2#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=4>Next <i>#evaluate(GetList.recordcount-enddisplay)#</i> <font color=red>more</font></font><b></a>
<CFELSEIF start is not "1">
<a href='list.cfm?category=#category2#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#'>Show First Page</a>
</CFIF>
<br>
      <font size="2" face="Arial, Helvetica, sans-serif">&nbsp;</font>&nbsp;<br>

	</td><td align=right border=0>
<CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
<a href='list.cfm?category=#category2#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=4>Next <i>#evaluate(GetList.recordcount-enddisplay)#</i> <font color=red>more</font></font><b></a>
<CFELSEIF start is not "1">
<a href='list.cfm?category=#category2#&start=1&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#'>Show First Page</a>
</CFIF>
<br>
      <font size="2" face="Arial, Helvetica, sans-serif">&nbsp;</font>&nbsp;<br>
</CFOUTPUT> 

	</td></tr></table>
</td></tr></table>

  <!---
<CFIF #session.mail# is "">
You are not logged in and will not earn 10% credit</i>
<CFELSE>
<i>You are logged in as: #session.mail#
</CFIF>--->


<p>.</p>
<!-- Begin Web-Stat code -->
<script language="JavaScript" type="text/JavaScript">
<!--
var page_name = '<cfoutput>#category#-#subcat#</cfoutput>';
var invisible = 'yes';
var framed = 'no';
function sE(){return true;}window.onError=sE;var base=document;
if(framed=='yes'){base=top.document;}var rn=Math.random();
var ui='semiprecious';var al='Web-Stat hit counters';
var qry=ui+':1::'+escape(base.referrer)+'::'+screen.width
+'x'+screen.height+'::'+screen.colorDepth+'::'+escape(page_name)
+'::'+invisible+'::'+rn+"::"+escape(base.URL);
document.write('<a href="http://www.web-stat.com/stats.shtml?');
document.write(ui+'" target="new"><img name="ct" border=0 ');
document.write('src="http://server3.web-stat.com/count.pl?');
document.write(qry+'" alt="'+al+'"><\/a>');
//-->
</script><noscript>
<a href="http://www.web-stat.com" target="new">
<img src="http://server3.web-stat.com/count.pl?semiprecious:1::NoJavaScript"
alt="web-stat hit counter" border=0></a></noscript>
<!-- End Web-Stat code -->


</BODY>
</HTML>