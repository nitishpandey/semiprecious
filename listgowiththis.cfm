<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="js/macromediafuncs.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
 <CFPARAM NAME="displaycolumns" DEFAULT="4"> 
 <CFINCLUDE TEMPLATE="setup.cfm">
<cfparam default="" name="advancedsearch">
 <cfif session.mail eq 'anup@semiprecious.com'>
 <cfset url.edit =  'mamamia'>
 </cfif>
 <cfparam default="662222" name="l">
 <cfparam name="displayrows" default="4">
<CFPARAM NAME="numpages" DEFAULT="0"> 
<cfquery datasource="semiprecious" name="catfind">
select cat,subcat from items where newitem = #url.newitem#
</cfquery>
<cfset category = catfind.cat>
<cfset subcat = listgetat(catfind.subcat,1)>
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<CFSET CATEGORY2=CATEGORY>

<cfset price_array  = arraynew(1)>
<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
<cfset status_array  = arraynew(1)>
<CFPARAM NAME="sortorder" DEFAULT="datetaken desc" >
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
<cftry>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter=urlencodedformat(CGI.QUERY_STRING) >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#" >
</Cfif>
<cfcatch type="any"> </cfcatch></cftry>


<CFSET colors ='red,blue,gray,orange,green,yellow,black,pink,white,maroon,purple'>
  <CFSET display=21>
  <CFSET displaycolumns = "3">
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>


  <CFQUERY DATASOURCE="semiprecious" NAME="GetList">
  Select * from (SELECT 0 as orderbuy, disporder, newitem, CAT, subcat, datetaken, 
  NameID, 
    price
  , saleprice, status, wholesaleprice, Description, inventory,
   buylink ,  iif(status=3, saleprice,price) as orderprice from Items where  (inventory>0
 
   and 
   <cfif isdefined("url.matching")>
CAT =  '#url.matching#'
   <cfelse>
   CAT <> '#category#' 
   <cfif category eq 'necklaces' >
   and CAT <> 'pendants' 
   </cfif>
   <cfif category eq 'pendants' >
   and CAT <> 'necklaces' 
   </cfif>
</cfif>

    and (status=0 or status=3)
 
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


 ) 

    order by cat, datetaken desc)
  </CFQUERY>


<CFIF not ISDEFINED("gETLIst.recordcount")>
<cfinclude template="header.cfm">
NO ITEM FOUND! PLEASE TRY AGAIN.
<cfinclude template="footer.htm">
<cfabort />
</cfif>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >
<CFOUTPUT >
<TITLE>#color# #subcat# 
  <cfif category is "ALL">
    <cfset p = "jewelry">
    <cfelse>
<cfset p = category> 
  </cfif>
  #p#
<cfif isdefined("reversefilename")>
Beaded, Gemstone Sterling Silver Jewellery

<cfelse>
Semi-precious Gemstone Sterling Silver Jewelry</cfif></TITLE>
<meta name="keywords" content="valentine gift under $10 #color# gemstone, #subcat# #category# jewelry,semiprecious, semi-precious, jewellery">
<meta name="description" content="Retail and wholesale #subcat# #category#,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>">
</cfoutput>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY leftmargin=1 BGCOLOR="white" text='black' link="black" vlink='#006600'black alink=black topmargin='1' >
<CFINCLUDE TEMPLATE="headerforlist.cfm"> 
<cfoutput>
   
<cfif  isdefined("session.bulkbuyer.id")>Wholesale/Reseller Shopping Mode is ON
<cfelseif session.mail is ""><h3>Click on the small yellow arrows to choose listing of specific type and stone.</h3>
<cfelse><h3>Member: #session.mail# </h3></cfif></em>

<cfif session.screenwidth LT 1023 >
<cfset screensize = "small">
<cfset displaycolumns = 3>
<cfset displayrows = 2>
</cfif>
<CFIF category Is "bracelets"> <!---  <CFSET #PicWidth# = "150"> --->
  <CFSET displaycolumns = 3>
  <cfif screensize is "small" >
<cfset displaycolumns = 2>
<cfset displayrows = 2>
</cfif>
</CFIF>
<cfset display = displaycolumns*displayrows>
  <CFIF GetList.cat is not "">
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'>
 <cfset tw = 0.98*session.screenwidth>
  <table border="0" width="#tw#" cellpadding="0" cellspacing="0"  >

    <tr >
  <td width="94" valign="top" align="center" bordercolor="##999933" bgcolor="##D3D3AA" >
  <table width="94" border="0" cellpadding="0" cellspacing="0"  bgcolor="##D3D3AA">
        <tr >
		 <td width="94"  align="center"   bgcolor="##D3D3AA" style="border-top:1px groove ##000066;border-right:1px ridge ##666666;border-left:1px ridge ##666666;" >
		  <font face="Geneva, Arial, Helvetica, sans-serif" color="##000000">
		  <span class="category"> Your Selected Jewelry</span></font></td>
        </tr>
      </table>
	   <cfset display = displaycolumns*displayrows>  
	    <CFSET enddisplay= start + display-1>

    <img src="images/#category#/thumb/#url.newitem#.jpg" width="90">
	<hr />
	Select Matching<br>
<cfloop list="necklaces,bracelets,pendants,earrings"  index="match"><a href="listgowiththis.cfm?newitem=#url.newitem#&matching=#match#">#match#</a><br><br>

</cfloop> <hr />
	 <!--- removed bottom fading img from here ---> 
	 </td>
	<td valign="top">
	<table><tr>
<td valign="top" align="center" class="topnavigator">
 			 <CFIF start is not "1">
			 <cfset newstart = start - display>
			 <cfif newstart LT 1>
			 <cfset newstart = 1>
			 </cfif>
			 <cfif isdefined("url.silverjewelry")>
<a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/prevlist.gif" name="prev" hspace="0" vspace="0" height="16"  border="0" align="absmiddle"></a>	
			 <cfelse>
	<a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/prevlist.gif" name="prev" hspace="0" vspace="0" height="16"  border="0" align="absmiddle"></a>
			 </cfif>
         &nbsp; &nbsp;</CFIF>
<!--- Selection:  ---><b><font face=verdana style="textTransform capitalize">

     </font></b><!--- &nbsp; <font size=2>Sort 
      </font> <a href='list.cfm?category=#category#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=2>Newest 
      First</font></a> --->
	  <cfif len(subcat) GT 0><!--- &nbsp;<font  face=verdana color='maroon'>#subcat#</font>&nbsp;&nbsp; --->
	<cfset subcat3 = replace(trim(subcat),"_","")>
<cfset subcat3 = replace(trim(subcat3)," ","")>
<cfif listfindnocase(Application.necklacestones,subcat)>
<i>
<a href="#subcat3#_necklaces.cfm" id="necklaces_horiz">#subcat# Necklaces</a>&nbsp;</cfif>
<cfif listfindnocase(Application.Braceletstones,subcat)>
<a href="#subcat3#_bracelets.cfm" id="bracelets_horiz"> #subcat# Bracelets</a>&nbsp;</cfif>
<cfif listfindnocase(Application.earringstones,subcat)>
<a href="#subcat3#_earrings.cfm" id="earrings_horiz">#subcat# Earrings</a>&nbsp;</cfif>
<cfif listfindnocase(Application.pendantstones,subcat)>
<a href="#subcat3#_pendants.cfm" id="pendants_horiz">#subcat# Pendants</a>&nbsp;
</cfif>
<cfelseif subcat eq "" and color neq "">Select a Type&nbsp;:<a href="list.cfm?color=#color#&category=Earrings">Earrings</a>&nbsp;<a href="list.cfm?color=#color#&category=Bracelets">Bracelets</a>&nbsp;<a href="list.cfm?color=#color#&category=Necklaces">Necklaces</a>&nbsp;</cfif>
<cfif category EQ "All"> 
<font color="##990000">[Showing All]</font>&nbsp;
</cfif>
 |&nbsp;<cfif sortorder is "price"><a href='list.cfm?category=#category#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#'><font color="black"> 
      See New First</font></a><cfelse><a href='list.cfm?category=#category#&sortorder=price&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#'><font color="black">Sort by Price</font></a></cfif>&nbsp;|&nbsp;&nbsp;      
                  <CFIF enddisplay LT GetList.Recordcount>   <b> <i><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# ---><a href="##" onMouseDown="ShowHide('jumpstart'); return false;"><u>Page Index</u></a></i></b>&nbsp;|&nbsp;
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> --->  &nbsp;
				   				   <cfif isdefined("url.silverjewelry")>
				   <a href='list.cfm?category=#category#&start=#evaluate(start + display)#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/nextlist.gif" height="16" name="next"  border="0" align="absmiddle" vspace="0" hspace="0"></a>    
				   <cfelse>
<a href='list.cfm?category=#category#&start=#evaluate(start + display)#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/nextlist.gif" height="16" name="next"  border="0" align="absmiddle" vspace="0" hspace="0"></a>    				   
				   </cfif>
				   </CFIF></td></tr>
<Tr valign="middle"><td valign="middle" style="color:##666600">
<cfif category is 'ornaments'>
         <b><font color=green>Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b></cfif> 
    <cfif category is 'earrings'>
          <b><font color=brown size=-1>Nickel Free plated, Hypo Allergenic option  available for dangling earrings by emailing anup@semiprecious.com or calling 
      us 512 589 9009. </font></b><br>
</cfif> 
    <!--- <cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif> --->
    <cfif subcat is 'pearl'>
      <b><font color=gray size=-1>Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
</cfif> 	 <!---  <cfif advancedsearch neq "">
	     <cfsearch  collection="jewelrydescription" type="explicit" criteria="#advancedsearch#,#advancedsearch1#,#advancedsearch2#"
startrow=1 name="vertiylist"
 maxrows="40"
>	  
			  <cfset inventory = 1>
			
<cfset getlist = querynew('')>
<cfset queryaddcolumn(getlist,"cat",vertiylist["custom1"])>
<cfset queryaddcolumn(getlist,"status",vertiylist["url"])>
<cfset queryaddcolumn(getlist,"price",vertiylist["custom2"])>
 
<cfset queryaddcolumn(getlist,"saleprice",vertiylist["title"])>
<cfset queryaddcolumn(getlist,"description",vertiylist["summary"])>
<cfset queryaddcolumn(getlist,"newitem",vertiylist["key"])> 
 <CFSET display=21>
  <CFSET displaycolumns = 3>
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>

</cfif>  ---> <CFIF getList.recordcount is 0>
	  <form action="list.cfm" method="post" class=""><input type='text' maxlength="24" size="12" value="" name='advancedsearch'>&nbsp;<input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
     <!-- <font size="2" face="Times New Roman, Times, serif"><a href="detail.cfm">By Item number</a>  </font> -->
      </FORM>
      <font size='4' color='black'>
      No matches found for your criteria specified. Please try with some other words in your search.</font> 
      <br>
      <cfset salestatus = 3>
	  </cfif>
      
	 <CFSET columns=1> <CFSET rows=1> 
	 <CFSET enddisplay= start + display-1>
              <CFSET currentrow= start>
		
    </td></tr>
	<tr> <td>
		<Table cellpadding="2" cellspacing="0" width="#evaluate(tw - 118)#"  >
                         
 <cfif start is 1 >
 <cfset session.filterarray = arraynew(2)>  
 <cfif subcat is not "">
             <CFINCLUDE template="stoneinfo.inc">
            </cfif>
			  <CFINCLUDE TEMPLATE="jumpstart.cfm">
            <CFLOOP QUERY="Getlist"	>
              			  <cfset session.filterarray[currentrow][1] = newitem>
					   <cfset session.filterarray[currentrow][2] = cat>
					 </cfloop>
			 </cfif>
			  <CFLOOP QUERY="Getlist"		startrow="#start#"		endrow="#enddisplay#">
						   <CFIF COLUMNS eq 1>
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
                        <cfset price_array[columns] = dollarformat(0.50*price)>
                        <cfelse>
                        <cfset price_array[columns] = dollarformat(wholesaleprice)>
                      </cfif>
                      <cfelse>
                      <cfset price_array[columns] = dollarformat(price)>
                      <!--- 1 is normal, -1 is sale, 0 is sold out --->
                      <!--- this is defined in bulkbuyerlogin.cfm --->
                      <cfif status is 3 and session.mail neq 'pandey@aol.com' >
                        <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                          <CFSET Saleprice = 0.80*price>
                        </cfif>
                        <cfset status_array[columns] = dollarformat(saleprice)>
                        <!---   <img src="images/sale.gif"> <span class="whiteonred"><B>#dollarformat(saleprice)#</B></span> 
                &nbsp;Regular --->
                      </cfif>
                    </cfif>
                    <!--- wholesale --->
                    <cfelse>
                    <!---    <font color=red size=2>Sold Out!</font> <br /> --->
                    <cfset status_array[columns] = 0>
                    <cfset price_array[columns] = dollarformat(1.5*price)>
                  </cfif>
                  <cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
                  <a href='detail.cfm/#item_array[columns]#.htm' > 
                  <!---                  	<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
	<CFELSE>
			<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
                  <img src ='images/#getlist.cat#/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a> 
                  <!---  <cfset price_array[columns] = #dollarformat(price)#> --->
                  <cfset descr_array[columns] = description>
                  <!--- <b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br> --->
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
				  <a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[Indx]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' ><b>#status_array[indx]#</b></a> 
                 
				  
			   </cfdefaultcase>
				  </cfswitch>
				  </td>
              </cfloop>
            </tr>
            
              <CFSET columns=1>
              <!---</table>
		<Table cellpadding=2 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
              <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
				  </CFLOOP>
              <cfset columns  = columns - 1><cfif columns >
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
				  <a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;
				  #price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[Indx]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' ><b>#status_array[indx]#</b></a> 
   			   </cfdefaultcase>
				    </td></cfswitch>
	               </cfloop>
            
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row3" nowrap>&nbsp;</td>
              </cfloop>
            </tr>
                 <CFSET columns=0>
          </cfif>
	       </table >
		   </td>
		   </tr>
		<!---  <tr><Td>
		  		   <table width="#evaluate(session.screenwidth - 140)#"  align="left" BORDER=0>
            <tr> 
              <td align=left border=0> 
			  <CFIF start is not "1">
			  <cfif isdefined("url.silverjewelry")>
                  <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#urlencodedformat(sortorder)#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/prevlist.gif" name="prev"  border="0"></a>
				  <cfelse>
                  <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#urlencodedformat(sortorder)#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/prevlist.gif" name="prev"  border="0"></a>
				  </cfif>
                 <cfelse>  <a href="topselling.cfm" class="row2">See the Best Selling !</a>  </CFIF>
          </td>
          <td nowrap align="center">  
            <cfinclude template="searchforms.cfm"/></td>
                <td align="left" > 
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
              		  <cfif isdefined("url.silverjewelry")>
           				   <a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absmiddle"></a> 
				   <cfelse>
				   <a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absmiddle"></a> 
				   </cfif>
     				<cfelse>
                <a href="howtonavigate.cfm" class="row2">Need Help Finding ?</a>
</CFIF>
                  </td>
				
            </tr> --->
            <tr>
              <td colspan="3" align="center"> <script type="text/javascript"><!--
				google_ad_client = "pub-2709788135063072";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_format = "728x90_as";
				google_ad_channel ="";
				google_ad_type = "text";
				google_color_border = "CCCCCC";
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
              <!---  <tr>
              <td colspan=3><p>&nbsp;</p>
             <i>Advertisement: </i>
                <SCRIPT language="JavaScript">
terve('10896');
</SCRIPT>  </td>
            </tr>--->
          </table>
</td>
		  </tr></table></td></tr>
		 <tr bgcolor="white"  >
      <td align="center" valign="middle"    >&nbsp;  <a href="http://www.myexhibition.com"> 
       Love Art?</a> </td>
    <td align="center" valign="middle"  class="row3"> 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>
    </table><script language="JavaScript1.1">
ShowHide('jumpstart');
ShowHide('jumpstartblinder');
	<cfif subcat neq "" and subcat neq "beaded">
	document.getElementById("#subcat#").style.color = "maroon";
//document.getElementById("#subcat#").style.fontWeight = "bold";
 
 document.getElementById("#subcat#").style.textDecoration = "none" ;
		<cfif len(category) GT 4 >
 	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;
  document.getElementById("#lcase(category)#_#subcat#").style.color = "##000066";
//document.getElementById("#lcase(category)#_#subcat#").style.fontWeight = "bold";
 
 document.getElementById("#lcase(category)#_#subcat#").style.textDecoration = "none" ;
	</cfif>
    
	</cfif>
	<cfif len(category) GT 4 >
	document.getElementById("#lcase(category)#").style.color = "yellow";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
</cfif>
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/
	</script>

	</cfoutput>	

</BODY>
</HTML>

