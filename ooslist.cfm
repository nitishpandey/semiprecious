<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="js/macromediafuncs.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
<cfparam name="newstart" default="1">
 <CFPARAM NAME="displaycolumns" DEFAULT="4"> 
<cfif session.mail eq "nitishpandey@indiatimes.com" >

<cfset url.edit =  'mamamia'>
</cfif>
 <cfparam default="662222" name="l">
 <cfparam name="displayrows" default="3">
<CFPARAM NAME="numpages" DEFAULT="0"> 
<CFPARAM NAME="category" DEFAULT="ALL" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
 <CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="priceless" DEFAULT="">
<cfset price_array  = arraynew(1)>
<cfset status_array  = arraynew(1)>

<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
<CFINCLUDE TEMPLATE="setup.cfm">


<CFPARAM NAME="sortorder" DEFAULT="inventory" >
<!--- <CFIF sortorder is 'price'>
<CFSET sortorder='orderprice'>
 </cfif>
<CFPARAM NAME="PicWidth" DEFAULT= "120"> 
<cfoutput>sortorder is #sortorder#</cfoutput>
need to figure out from where sort order is coming as datetakendesc --->
<cfif sortorder eq 'datetakendesc'>
<cfset sortorder = 'datetaken desc'>


</cfif>
<!--- <cfoutput>sortorder is #sortorder#</cfoutput> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">

<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="url.subcat" DEFAULT= "silver">
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
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> <CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cftry>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter=CGI.QUERY_STRING >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(advancedsearch)#" >
</Cfif>
<cfcatch type="any"> </cfcatch></cftry>

<cfset  session.gallery = 'list'> <!--- used to determine on cart page whether the buyer should be routed to ooslist.cfm or listcluster.cfm when he clicks on continue shopping --->
<CFIF advancedsearch is not "">

<cfset category ="">
<cfset subcat = "">
<cfset advancedsearch=replacenocase(advancedsearch," & "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"'","")>
<cfset advancedsearch=replacenocase(advancedsearch,"jewelry"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"items"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"item"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"gold stone","goldstone")>
<cfset advancedsearch=replacenocase(advancedsearch,"mixed stone","mixedstone")>
<cfset advancedsearch=replacenocase(advancedsearch,"shap"," styl")>
<cfif find("$",advancedsearch) or find("dollar",advancedsearch)>
<cfset remark = '(You can select price range at bottom)'>
<cfelse>
<cfset remark =''> 
</cfif>
<cfset advancedsearch=replacenocase(advancedsearch,"jewellery"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," or "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,","," ")>
<cfset advancedsearch=replacenocase(advancedsearch," on "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"colored"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"color"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," with "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," semiprecious "," ")>
<Cfif listlen(advancedsearch," ") gt 0>
  <cfset advancedsearch=replacenocase(advancedsearch," and ", " ")>
  <CFSET advancedsearch1 = left(listGetat(advancedsearch,1," "),4)>
</cfif>
<Cfif listlen(advancedsearch," ") gt 1>
  <CFSET advancedsearch2 = left(listGetat(advancedsearch,2," "),4)>
</cfif>
<Cfif listlen(advancedsearch," ") gt 2>
  <CFSET advancedsearch3 = left(listGetat(advancedsearch,3," "),4)>
</cfif>
<CFSET colors ='red,blue,gray,orange,green,yellow,black,pink,white,maroon,purple'>
<CFIF listcontainsnocase(colors, advancedsearch1)>
  <CFSET color= advancedsearch1>
</CFIF>
  <CFSET display=21>
  <CFSET displaycolumns = "3">
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>

<!--- speed up things  ---><CFIF start EQ 1 and advancedsearch neq "">
  </CFIF>
</CFIF> 


  <CFQUERY DATASOURCE="gemssql" NAME="GetList">
SELECT disporder, newitem, CAT, subcat, datetaken, 
       price    , saleprice, status, wholesaleprice, Description, inventory
  from Items where  (inventory < 1 
    <CFIF category NEQ "ALL">
      and (CAT = '#category#'     )
  </cfif>
  <CFIF salestatus is 3>
    and (status = 3)
    <CFELSE>
    and (status=0 or status=3)
  </CFIF>
  ) 
      <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
	   </cfdefaultcase>
      </CFswitch>
  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
  </cfif>
    order by #sortorder# 
  </CFQUERY>





<cfif isdefined("form.submit5")>
  <CFQUERY DATASOURCE="semiprecious" NAME="GetList">
  select disporder, newitem, CAT, subcat,       price  , saleprice, status, wholesaleprice, Description, subcat, inventory,  iif(status=3, saleprice,price) as orderprice from Items 
  <cfif isdefined("form.submit5")>
    where (saleprice 
    <cfif form.price EQ 0>
      < 1000 ) 
      <cfelse>
      <cfif form.price EQ 5>
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
        and (cat in (#PreserveSingleQuotes(form.cat)#)) 
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
          where (cat in (#PreserveSingleQuotes(form.cat)#)) 
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
  order by  cat, saleprice 
  </cfquery>
</cfif>


<CFOUTPUT >
<CFIF not ISDEFINED("gETLIst.recordcount")>
<title>Jewelry Search Gallery</title>
<body topmargin="0" >
<div align="center">
<cfinclude template="header.cfm"><br>

<span class="noticebox">NO ITEM FOUND! PLEASE TRY AGAIN.</span>
<CFSET enddisplay= start + display -1 >
<cfset getlist = querynew('a') />
<cfset tw = 600 />
<cfset getlist.recordcount = 0 />
<cfinclude template="footer.htm">
</div>
<cfelse>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >

<title>#color# #subcat# 
  <cfif category is "ALL">
    <cfset p = "jewelry">
    <cfelse>
<cfset p = category> 
  </cfif>
  #p#
<cfif isdefined("reversefilename")>
Beaded, Gemstone Sterling Silver Jewellery

<cfelse>
Semi-precious Gemstone Sterling Silver Jewelry
</cfif></title>
<meta name="keywords" content="valentine gift under $10 #color# gemstone, #subcat# #category# jewelry,semiprecious, semi-precious, jewellery">
<meta name="description" content="Retail and wholesale #subcat# #category#,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>">

<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin=0 BGCOLOR="white" text='black' link="black" vlink='##006600'black alink=black topmargin='0' >
<CFINCLUDE TEMPLATE="headerforlist.cfm"> 
	  <cfif isdefined("url.silverjewelry")>
			  <cfif subcat eq 'silver'>
			  <cfquery dbtype="query" name="Getlist2">
			  select * from Getlist where  Getlist.subcat like '%#url.silverjewelry#%'
			  </cfquery>
			  <cfelseif url.silverjewelry eq 1>
			  <cfquery dbtype="query" name="Getlist2">
			  select * from Getlist where  Getlist.subcat like '%silver%'
			  </cfquery>
				  			  <cfelse>
			  <cfquery dbtype="query" name="Getlist2">
			  select * from Getlist where  subcat not like '%silver%'
			  </cfquery>

			  		  </cfif>
			  <cfset Getlist = Getlist2>
			  <cfset getlist2 = 0>
			  </cfif>
<CFIF getList.recordcount is 0>
	  <form action="ooslist.cfm" method="post"  style="display:inline;" ><input type='text' maxlength="24" size="12" value="" name='advancedsearch'>&nbsp;<input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
     <!-- <font size="2" face="Times New Roman, Times, serif"><a href="jewelry_item.cfm">By Item number</a>  </font> -->
  
      <font size='4' color='black'>
      No matches found for your criteria specified. Please try with some other words in your search.</font> 
          </FORM><br>
      However some other items on sale: 
      <cfset salestatus = 3>
      <CFQUERY DATASOURCE="semiprecious" NAME="GetList">
      select disporder, newitem, CAT, subcat,  

        price
      , saleprice, status, wholesaleprice, Description, subcat, inventory from Items 
      where (1=1 
      <cfif advancedsearch is "">
        and (CAT = '#category#' 
         )
      </cfif>
      <CFIF salestatus is 3>
        and (status = 3)
        <CFELSE>
        and (status=0 or status=3)
      </CFIF>
      <cfif url.edit is "" >
        and inventory > -1
      </cfif>
      ) 
      <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
	   </cfdefaultcase>
      </CFswitch>
      <CFIF color is not "">
        and (color like '%#color#%')
      </CFIF>
      <CFIF priceless is not "">
        and (price <= #priceless#)
      </cfif>
      <CFIF pricegreater is not "">
        and (price >= #pricegreater#)
      </CFIF>
      order by #sortorder# 
      </CFQUERY>
	  <cfelse>
	<cfif start is 1 >
 <cfset session.filterarray = arraynew(2)>  
            <CFLOOP QUERY="Getlist"	>
              			  <cfset session.filterarray[currentrow][1] = newitem>
					   <cfset session.filterarray[currentrow][2] = cat>
					 </cfloop>
					    <CFSET enddisplay= start + display-1>
					
	 <cfelse>
			 <cfset newstart = start - display>
			 <cfif newstart LT 1>
			 <cfset newstart = 1>
			 </cfif>
    </cfif>
	</cfif>

    <cfif subcat eq 'silver' or isdefined("url.silverjewelry") or listfindnocase(evaluate('application.silver.#category#tones'),subcat)>
        <div align="center" class="silverfilter" > Silver Filter:
      <cfif len(cgi.QUERY_STRING)>
        <cfset tmp = Rereplace(cgi.QUERY_STRING,'silverjewelry=?','')>
        <cfset cleanedqstring = Rereplace(tmp,'start=?','start=1&')>
        <cfelse>
        <cfset cleanedqstring="subcat=#subcat#&category=#category#&sortorder=#sortorder#">
      </cfif>
      <form action="ooslist.cfm?#cleanedqstring#" method="get" style="padding:1px;margin-top:2px;margin-bottom:4px;">
        &nbsp; <a name="picsonly"  dir="ltr"></a> <cfif subcat neq 'silver' and listfindnocase(evaluate('application.silver.#category#tones'),subcat)> <cfif isdefined("url.silverjewelry")> <cfif url.silverjewelry> 
        <font color="maroon">Showing Sterling Silver #subcat# #p#</font><font color="##666600">&nbsp;|&nbsp;</font> <a href="ooslist.cfm?#cleanedqSTRING#&silverjewelry=0"> 
        <font color="black"><strong>Check for #subcat# #p# NOT in Sterling Silver</strong></font></a> 
        <cfelse>
        <a href="ooslist.cfm?#cleanedqSTRING#&silverjewelry=1"><font color="black"><strong>See 
        ONLY Sterling Silver #subcat# #p#</strong></font></a> <font color="##666600">&nbsp;|&nbsp;</font><font color="maroon">Showing 
        #subcat# #p# NOT in Sterling Silver<font></font> </cfif> 
        <cfelse>
        <a href="ooslist.cfm?#cleanedqSTRING#&silverjewelry=1"><font color="black"><strong>See 
        ONLY Sterling Silver #subcat# #p#</strong></font></a> <font color="##666600">&nbsp;|&nbsp;</font> <a href="ooslist.cfm?#cleanedqSTRING#&silverjewelry=0"> 
        <font color="black"><strong>Check for #subcat# #p# NOT in Sterling Silver</strong></font></a> </cfif> 
        <cfelseif subcat eq 'silver' >
        <input type="hidden" name="subcat" value="silver">
        <select name="silverjewelry" style="text-transform:capitalize;" onChange="this.form.submit();" class="inputtext">
          <option value="">Sterling Silver #p# with</option>
          <cfset lis = evaluate('application.silver.#category#tones')>
          <cfloop list='#lis#' index="st">
            <option value="#st#">#st#</option>
          </cfloop>
        </select>
        <input type="hidden" name="category" value="#category#"></cfif> 
      </form>
    </div>
      <cfelse>
<span class="whiteonred"><em>
<cfif  isdefined("session.bulkbuyer.id")>Wholesale/Reseller Shopping Mode is ON
<cfelseif session.mail is ""><h3>Click on the small yellow arrows to choose listing of specific type and stone.</h3>
<cfelse><h3>Member: #session.mail#</h3></cfif></em></span>
    </cfif>
<cfif session.screenwidth LT 1023 >
<cfset screensize = "small">
<CFIF category Is "bracelets">
<cfset displaycolumns = 2>
<cfelse>
<cfset displaycolumns = 3>
</cfif>
</cfif>
 <!---  <CFSET #PicWidth# = "150"> --->
  <cfset display = displaycolumns*displayrows>
  <CFIF GetList.cat is not "">
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'>
 <cfset tw =session.screenwidth -112>	  
<!---
<cfswitch expression="#category#">
<cfcase value="necklaces">
<cfinclude template="necklacesstoneleftcolumn.htm" />
</cfcase>
<cfcase value="bracelets">
<cfinclude template="braceletsstoneleftcolumn.htm" />
</cfcase>
<cfcase value="pendants">
<cfinclude template="pendantsstoneleftcolumn.htm" />
</cfcase>
<cfcase value="earrings">
<cfinclude template="earringsstoneleftcolumn.htm" />
</cfcase>
<cfcase value="ornaments">
</cfcase>
<cfdefaultcase>
<cfinclude template="allstoneleftcolumn.htm" />
</cfdefaultcase>
</cfswitch>
<table><tr><td>&nbsp;</td></tr></table>


<table style="display: inline; position: static; left: 1px; top: 76px;"><tr><td>&nbsp;</td></tr></table>
--->	   <table style="margin-left:91px;display:block;width:#tw#">
	<tr>
<td valign="top" align="center" class="topnavigator">
 <cfif  start GT 1>
			 <cfif isdefined("url.silverjewelry")>
<a href='ooslist.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/prevlist.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>	
			 <cfelse>
	<a href='ooslist.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlist.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>
			 </cfif></cfif>		
         &nbsp; &nbsp;</CFIF>
 <cfif advancedsearch is not "">&nbsp;Displaying verity search results 
    in order of matching words/criteria #remark#.
    <cfelse><!--- Selection:  ---><b><font face=verdana style="textTransform capitalize">
<Cfif isnumeric(priceless)>
        &nbsp;(Around #format(priceless)#)&nbsp;|</Cfif>
     </font></b><!--- &nbsp; <font size=2>Sort 
      </font> <a href='ooslist.cfm?category=#category#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=2>Newest 
      First</font></a> --->
	  <cfif len(subcat) GT 0><!--- &nbsp;<font  face=verdana color='maroon'>#subcat#</font>&nbsp;&nbsp; --->
	<cfset subcat3 = replace(trim(subcat),"_","")>
<cfset subcat3 = replace(trim(subcat3)," ","")>
<cfif listfindnocase(Application.necklacestones,subcat)>
<a href="#subcat3#_necklaces.cfm" id="necklaces_horiz">#subcat# Necklaces</a>&nbsp;</cfif>
<cfif listfindnocase(Application.Braceletstones,subcat)>
<a href="#subcat3#_bracelets.cfm" id="bracelets_horiz"> #subcat# Bracelets</a>&nbsp;</cfif>
<cfif listfindnocase(Application.earringstones,subcat)>
<a href="#subcat3#_earrings.cfm" id="earrings_horiz">#subcat# Earrings</a>&nbsp;</cfif>
<cfif listfindnocase(Application.pendantstones,subcat)>
<a href="#subcat3#_pendants.cfm" id="pendants_horiz">#subcat# Pendants</a>&nbsp;
</cfif>
<cfelseif subcat eq "" and color neq "">Select a Type&nbsp;:<a href="ooslist.cfm?color=#color#&category=Earrings">Earrings</a>&nbsp;<a href="ooslist.cfm?color=#color#&category=Bracelets">Bracelets</a>&nbsp;<a href="ooslist.cfm?color=#color#&category=Necklaces">Necklaces</a>&nbsp;</cfif>
<cfif category EQ "All"> 
<font color="##990000">[Showing All]</font>&nbsp;
</cfif>
</cfif> |&nbsp;<cfif sortorder is "price"><a href='ooslist.cfm?category=#category#&sortorder=datetaken&subcat=#subcat#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black"> 
      See New First</font></a><cfelse><a href='ooslist.cfm?category=#category#&sortorder=price&subcat=#subcat#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black">Sort by Price</font></a></cfif>&nbsp;|&nbsp; 
                  <CFIF enddisplay LT GetList.Recordcount><b> <i><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# ---><a href="##" onMouseDown="ShowHide('jumpstart'); return false;"><u>Page Index</u></a></i></b>&nbsp;|&nbsp;
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> --->  &nbsp;
				    <cfif isdefined("url.silverjewelry")>
				   <a href='ooslist.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/nextlist.gif" height="18" name="next"  border="0" align="absmiddle" vspace="0" hspace="0"></a>    
				   <cfelse>
                  <a href='ooslist.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif" height="18" name="next"  border="0" align="absmiddle" vspace="0" hspace="0"></a>    				   
				   </cfif>
				   </CFIF>
				   </td>
				   </tr></table>	
			<cfif start is 1>	   
			<table style="margin-left:91px;display:block;width:#tw#;border-left:1px ##666600 groove;border-right:1px ##666600 groove">
	
<Tr valign="middle"><td valign="middle" style="color:##666600"> 
<cfif subcat is not "">
             <CFINCLUDE template="stoneinfo.inc">
            </cfif>
<cfif category is 'ornaments'>
         <b><font color=green>Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b>
		 </cfif> 
    <cfif category is 'earrings'>
          <b><font color=brown size=-1>Nickel Free plated, Hypo Allergenic option  available for dangling earrings by emailing anup@semiprecious.com or calling 
      us 512 589 9009. </font></b><br>
</cfif> 
    <!--- <cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif> --->
    <cfif subcat is 'pearl'>
      <b><font color=gray size=-1>Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
</cfif> 

 	 		  
		</td></tr></table>
		</cfif>
	 <CFSET columns=1> 
	 <CFSET rows=1> 
	 <CFSET enddisplay= start + display-1>
     <CFSET currentrow= start>
 <CFLOOP QUERY="Getlist"		startrow="#start#"		endrow="#enddisplay#">
						   <CFIF COLUMNS eq 1>
						   <table style="margin-left:91px;display:block;width:#tw#;border-left:1px groove ##666600;border-right:1px groove ##666600;border-bottom:1px ridge ##CCCCCC;">
		  <tr>
			  </CFIF>
			  
              <CFSET invent=inventory>
                    
                <td class="row1"> 
                  <!---			<CFIF getList.status is 3> --->
                  <font verdana size='1'> 
                  <cfif inventory GT 0 >
                    <cfset status_array[columns] = 1>
                    <cfif isdefined("session.bulkbuyer.id")>
                      <cfset  l = 'AA2222'>
                      <cfif wholesaleprice eq "" or wholesaleprice eq "null" or wholesaleprice eq 0>
                        <cfset price_array[columns] = format(0.50*price)>
                        <cfelse>
                        <cfset price_array[columns] = format(wholesaleprice)>
                      </cfif>
                      <cfelse>
          
                        <cfset price_array[columns] = format(price)>
                      <!--- 1 is normal, -1 is sale, 0 is sold out --->
                      <!--- this is defined in bulkbuyerlogin.cfm --->
                      <cfif status is 3  >
                        <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                          <CFSET Saleprice = 0.80*price>
                        </cfif>
                          <cfset status_array[columns] = format(saleprice)>
                        <!---   <img src="images/sale.gif"> <span class="whiteonred"><B>#format(saleprice)#</B></span> 
                &nbsp;Regular --->
                      </cfif>
                    </cfif>
                    <!--- wholesale --->
                    <cfelse>
                    <!---    <font color=red size=2>Sold Out!</font> <br /> --->
                    <cfset status_array[columns] = 0>
                      <cfset price_array[columns] = soldformat(saleprice)>
                  </cfif>
                  <cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
                  <a href='jewelry_item.cfm/#item_array[columns]#.htm' > 
                  <!---                  	<a href='jewelry_item.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
	<CFELSE>
			<a href='jewelry_item.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
                  <img src ='images/#getlist.cat#/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a> 
                  <!---  <cfset price_array[columns] = #format(price)#> --->
                  <cfset descr_array[columns] = description>
                  <!--- <b><font color="##000080">#format(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br> --->
                  <CFIF Edit Is "MAMAMIA">
                    <a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'> 
                    <CFIF status is "1">
                      Inactive 
                      <cfelseif status is "2">
                      Discont. 
                      <cfelseif status is "4">
                      Free 
                      <cfelseif status is "3">
                      Sale 
                      <cfelseif status is "5">
                      Picture 
                    </cfif>
                    </font> 
                  </CFIF>
                  </font> </td>
				  <cfif columns EQ displaycolumns> 
                  <!---
		<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
		<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
		--->
              </tr>
			              <tr > 
              <cfloop from="1" to="#columns#" index="indx">
                <td class="row2">#descr_array[Indx]#
                   </td><!--- <cfflush  interval="400"> --->
              </cfloop>
            </tr>
            <tr  > 
              <cfloop from="1" to="#columns#" index="indx">
                <td  class="row3" nowrap>
				<cfswitch expression="#status_array[indx]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='jewelry_item.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[Indx]#.htm' ><b>Buy</b></a>
				  </cfcase><!---  --->
				  <cfcase value="0"><font color="##000099"><a href='jewelry_item.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='jewelry_item.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='jewelry_item.cfm/#item_array[Indx]#.htm' ><b>#status_array[indx]#</b></a> 
                 
				  
			   </cfdefaultcase>
				  </cfswitch>
				  </td>
              </cfloop>
            </tr>
       <!---         <tr><td colspan="#displaycolumns#"><hr noshade /></td></tr>
			    --->
			   </table>
          
              <CFSET columns=1>
              <!---</table>
		<Table cellpadding=2 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
              <cfelse>
			  <cfif start is 1>
			  </cfif>
              <CFSET columns=columns + 1>
			  </cfif>
				  </CFLOOP>
              <cfset columns  = columns - 1>
			  <cfif columns >
              <!--- code of 19 aug 04 --->
              <cfset columns  = columns + 1>
			  
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                 
                  <td class="row1">&nbsp;</td>
              </cfloop>
            </tr>
            <tr>
              <cfset columns  = columns - 1>
                  <cfloop from="1" to="#columns#" index="indx">
                  <td class="row2">#descr_array[Indx]#
                   
                  </td>
                </cfloop>
             
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row2">&nbsp;</td>
              </cfloop>
            </tr>
			
            <tr> 
              <cfset columns  = columns - 1>
         
                <cfloop from="1" to="#columns#" index="indx">
                  <td class="row3">
					<cfswitch expression="#status_array[indx]#">
				  <cfcase value="1"><font color="###l#">
				  <a href='jewelry_item.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;
				  #price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[Indx]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='jewelry_item.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='jewelry_item.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='jewelry_item.cfm/#item_array[Indx]#.htm' ><b>#status_array[indx]#</b></a> 
   			   </cfdefaultcase>
				    </td>
				</cfswitch>
	               </cfloop>
                      <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row3" nowrap>&nbsp;</td>
              </cfloop>
            </tr>
			</table><br />

                 <CFSET columns=0>
          </cfif>
   <table    style="margin-left:91px;display:block;width:#tw#" BORDER=0>
            <tr> 
              <td align=left border=0> 
			  <CFIF start is not "1">
			  <cfif isdefined("url.silverjewelry")>
                  <a href='ooslist.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/prevlist.gif" name="prev"  border="0" width="80" height="31"></a>
				  <cfelse>
                  <a href='ooslist.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlist.gif" name="prev"  border="0" width="80" height="31"></a>
				  </cfif>
                 <cfelse>  <a href="topselling.cfm" class="row2">See the Best Selling !</a>  </CFIF>
          </td>
          <td nowrap align="center">  
            <cfinclude template="searchforms.cfm"/></td>
                <td align="left" > 
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
                  
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> 
				   		  <cfif isdefined("url.silverjewelry")>
           
				   <a href='ooslist.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absmiddle" width="80" height="31"></a> 
				   <cfelse>
				   <a href='ooslist.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absmiddle" width="80" height="31"></a> 
				   </cfif>
     				<cfelse>
                <a href="howtonavigate.cfm" class="row2">Need Help Finding ?</a>
</CFIF>
                  </td>
				
            </tr>
            <tr>
              <td colspan="3" align="center"> <script type="text/javascript"><!--
				google_ad_client = "pub-2709788135063072";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_format = "728x90_as";
				google_ad_channel ="";
				google_ad_type = "text";
				google_color_border = "CFCCCC";
				google_color_bg = "FFFFFF";
				google_color_link = "000000";
				google_color_url = "666666";
				google_color_text = "333333"; 
			//--></script> 
              <script type="text/javascript"
				  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
              </td>
            </tr>
            
          </table>
			
			   <div style="margin-left:91px;display:table;width:#tw#">
		 <div style="display:row;text-align:center;" bgcolor="white"   >
    <div align="center" style="display:cell" valign="middle"  class="row3"> 
        <cfinclude template="adminfooter.cfm">
			 </div>
          </div></div>
		  	 <CFINCLUDE TEMPLATE="jumpstart.cfm"> 
<script language="JavaScript1.1">
ShowHide('jumpstart');
ShowHide('jumpstartblinder'); 
	
	<cfif len(category) GT 4 >
	document.getElementById("#lcase(category)#").style.color = "yellow";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
</cfif>
<cfif subcat neq "" and subcat neq "beaded">

		<cfif len(category) GT 4 >
 	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
	 	
  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;
  document.getElementById("#lcase(category)#_#subcat#").style.color = "##000066";
//document.getElementById("#lcase(category)#_#subcat#").style.fontWeight = "bold";
 
 document.getElementById("#lcase(category)#_#subcat#").style.textDecoration = "none" ;
	</cfif>
<!---     	document.getElementById("#subcat#").style.color = "maroon";
//document.getElementById("#subcat#").style.fontWeight = "bold";
 
 document.getElementById("#subcat#").style.textDecoration = "none" ; --->
	</cfif>
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/
	</script></cfoutput>
<div style="display:inline;position:absolute;top:98px;left:0px;margin-left:1px;width:88px"><cfif session.mail is "">
<a href="apply.cfm">Sign Up</a><br>
<a href="simpleloginform.cfm">Login</a><br>

<a href="contactus.cfm">Contact Us</a>
<cfelse>
<a href="wish.cfm">Wish list</a><br>
<a href="invite.cfm">Invite Friend</a></cfif><br>
<a href="fillcart.cfm">Saved Cart</a><br>
<div style="display:inline;width:86px;margin-top:30px;">
<span class="headerfont">Cart Total<br>
<cfoutput>#format(session.grandtotal)#</cfoutput></span>
<br>
	<a href="cart.cfm" >Check Out</a>
</div>
<cfif isdefined("session.india")>
<br>
Introductory <br>
Offer - Free<br>
 Shipping.</cfif>
</div>
	</body>
</html>