 <CFPARAM NAME="description" DEFAULT="">
<CFPARAM NAME="Price" DEFAULT= "1000">
<cfparam name="pimg" default="">
<cfparam default="0" name="valueadd" /><cfparam name="status" default="0" />
<cfparam name="catp"  default="jewelry">
<cfparam name="catn"  default="">
<cfparam name="nimg" default="">
<cfparam name="url.optionid" default="0" />
<CFPARAM NAME="SalePrice" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT= "">
<CFPARAM NAME="subcategory" DEFAULT= "">
<CFPARAM NAME="NameID" DEFAULT= "">
<cfif isdefined("url.newitem")>
<cfset url.itemnumber = url.newitem>
</cfif>

<cfparam name="existqty" default="1" type="numeric">
<cfparam name="session.screenwidth" default="833" type="numeric">
<CFPARAM NAME="cart" DEFAULT="">
<CFPARAM NAME="itemnumber" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="">
<CFPARAM NAME="editcart" DEFAULT="">
 <CFPARAM NAME="url.filter" DEFAULT="">

<!--- <cfoutput><font color="##FFFFFF">Comecing romf #cgi.HTTP_REFERER#.  to</font>
</cfoutput> --->
<!--- not required
<Cfif editcart neq "">
  <cfset session.cartitem[editcart][4]=0>
</CFIF> in fact creates an anomaly if after clicking one comes to the jewelry_next.cfm
and then decides to leave it undedited and goes on to see some other item then
that next items  quantity is placed for the item initially intended to be edited. Editing if gone ahead with still effective without this instruction.
--->
<!--- processing for item number after a forward slash --->
<cffunction name="filterarrayfind" output=True>
   <cfargument name="a">
  <!---  <cfoutput>#arraylen(session.filterarray)#</cfoutput> --->
   <cfloop from="1" to="#arraylen(session.filterarray)#" index="idx">
   <cfif session.filterarray[idx][1] eq a>
   <cfreturn idx>
   </cfif>
   </cfloop>

   <cfreturn 0>
   </cffunction>

<cfset pattern = #cgi.script_name#>
<!---   <cfoutput>#Pattern#</cfoutput> 
 --->
 <cfif not isdefined("url.itemnumber")>
 <cfif Find('/', pattern) gt 0>
<cftry>
  <cfset  underscore = find('_',pattern,1)>
<!---   <cfoutput>#underscore# (Uscore)</cfoutput>
 ---><cfif underscore>
  <CFSET itemnumber = mid(pattern,2, underscore-2)>
  <cfelse>
    <cfset  underscore = find('.htm',pattern,1)>
<cfif underscore>
  <CFSET itemnumber = mid(pattern,2, underscore-2)>
<cfelse>
    <CFSET itemnumber = mid(pattern,2, len(pattern)-2)>
</cfif>
</cfif>
  <cfset newitem = itemnumber>
  <cfcatch type="any">
  <cfset itemnumber  = "">
 <!---  ERROR CAUTH --->
    </cfcatch>
  </cftry>
<!--- <cfoutput>#Pattern#,#itemnumber#</cfoutput> 
 ---></cfif>
 </cfif>
<cfif not isnumeric(itemnumber) >
  <cfset itemnumber  = ""> <cfset newitem = 1009>
</cfif>
  <!---<cfif newitem NEQ "">
  <Cfset itemnumber = newitem>
  </cfif>
end --->
<CFINCLUDE TEMPLATE="setup.cfm">
<!--- <cfoutput>#itemnumber#</cfoutput> --->
<!--- the original before adding quertystring to the url <CFIF (category is "") And (itemnumber is  not "")>--->
<CFIF  isnumeric(itemnumber)>
<!--- ,<cfoutput>#itemnumber#</cfoutput>
 --->
  <CFQUERY datasource="gemssql" name="details">
  Select inventory, price, status, saleprice,clustercount,wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, cat from 
  items where newitem=#itemnumber# 
  </cfquery>
    <cfif isdefined("session.bulkbuyer.id")>
<!--- 	<cfif details.wholesaleprice eq 0 or details.wholesaleprice eq "">
	<cfset price = 0.5*details.price>
	<cfelse> ---><CFSET status = details.status>
<cfif isnumeric(details.wholesaleprice)>
   <CFSET price=details.wholesaleprice>

   <cfelse>
   <cfset price = details.price/2 />

</cfif>
   <cfset saleprice = price >
	<!--- </cfif> --->
 <cfelse>
   <CFSET price=details.price> 
    
<CFSET status = details.status>
    <cfif details.status eq 3> 
	<CFSET SalePrice = #details.saleprice#>
  </cfif>
</cfif>
  <CFSET description=details.description>
  <CFSET NameId=details.NameID>
  <cfset optcount = details.optcount>
  <CFSET newitem = details.newitem>
  <CFSET category = details.cat>
  <CFSET subcategory = #details.subcat#>
 
  <CFSET invent = #details.inventory#>
 

<!--- <cfhttp url="http://www.semiprecious.com/listofstoneswithpropertysheets.txt" method="get"   redirect="no" >
</cfhttp>
<cfif cfhttp.statuscode contains "200">
  <cfset listofstoneswithproperties = cfhttp.FileContent>
  <cfelse>
  <cfoutput> ---><cfset listofstoneswithproperties ="AGATE,AMETHYST,BLOODSTONE,CARNELIAN,CITRINE,FLUORITE,GARNET,HEMATITE,IOLITE,JADE,JASPER,LAPIS_LAZULI,MALACHITE,MOONSTONE,MOSS_AGATE,PEARL,PERIDOT,ROSE_QUARTZ,QUARTZ,SMOKEY_QUARTZ,SMOKY_QUARTZ,SODALITE,TIGER_EYE,TOURMALINE,TURQUOISE
">
  <!--- #cfhttp.statuscode#.</cfoutput>  
</cfif>--->
<cfif len(subcategory)>
  <cfset stonelist = replacenocase(subcategory,"and",",","All")>
  <cfset stonelist = replace(subcategory,";",",","All")>
  <cfloop list="#stonelist#" index="ston">
    <cfset ston = trim(ston)>
    <cfset ston = replace(ston," ","_","one")>
	
    <cfif ListContainsnocase(listofstoneswithproperties, ston)>
      <cfif isdefined("stones2")>
        <cfset stones2 = stones2 & "," & ston>
        <cfset stonecount = stonecount +1>
        <cfelse>
        <cfset stonecount = 1>
        <cfset stones2 = ston>
      </cfif>
      <cfelse>
      <cfif find(" ",ston)>
        <cfset stone = replace(ston," ","_","all")>
        <cfif ListContainsnocase(listofstoneswithproperties, ston)>
          <cfif isdefined("stones2")>
            <cfset stones2 = stones2 & "," & ston>
            <cfset stonecount = stonecount +1>
            <cfelse>
            <cfset stonecount = 1>
            <cfset stones2 = ston>
          </cfif>
        </cfif>
      </cfif>
    </cfif>
  </cfloop>
</cfif>
<cfelse>
<Cfset category = "">
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<CFIF (category is "")>
<cfinclude template="/header.cfm">
<div align="center" style="POSition:absolute;top:100px;border:thin ridge #CCFCCC;padding-top:12px;width:798px">
  <FORM action='/jewelry_next.cfm' method='get' >
If you have the  jewelry item number handy please fill it and click on 'Details': 
    <input type='text' name='itemnumber' size='5'>
    <INPUT type='submit' value='details'>
  </form><br>
    If you were trying to add an item to the shopping cart then make sure you 
    clicked on the 'Add to Cart' button. Hitting 'Enter' on your keyboard can 
    cause error.Browser <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px"> 
      <span style="width:100%;background-color:#666600;color:white;font-weight:bold;text-align:center;"> 
      <strong>Designs</strong><br>
      </span> <a href="showearrings.cfm">earrings</a> <br>
      <a href="shownecklaces.cfm">necklaces</a><br>
      <a href="showbracelets.cfm">bracelets</a> <br>
      <a href="showpendants.cfm">pendants</a></p> </div>Our Designers are Working 
    on <a href="cssgemstone_jewelry_gallery.cfm?sort=jewelry&type=silver&category=pendants">CSS</a> 
    (Cascading Style Sheets) based semi precious jewelry gallery page ... any 
    comments? 
    <cfinclude template="footer.htm" > 
  </div>
  <CFABORT>
</CFIF>
<cfoutput> 
  <TITLE>#subcategory# #category# Jewelry </TITLE></cfoutput> 
  <script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
  <script language=JAVASCRIPT src="/javascript/detailtest.js" type="text/javascript">
</script>

<meta name="description" content="<cfoutput>#description#, #category# ">
<meta name="keywords" content='#category#,#description#</cfoutput>'>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">

<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
<meta name="description" content="Unique <cfoutput>#subcategory# of #category#</cfoutput>, a semiprecious gemstone jewelry item. We sell rings, pendants, necklaces, earrings, bracelets.  We sell retail and wholesale. We sell Tiger eye, lapis lazuli, pearl, garnet, malachite, turquoise, aventurine, jasper, moss agate, agate, quartz, peridot etc. and other healing crystals, Austin based">
<meta name="keywords" content="semiprecious cheap <cfoutput> #category# #subcategory#</cfoutput>,semi precious, xmas ornaments, bells,starts, balls, christmas, ornaments, semi-precious, gemstones, jewelry, necklaces, earrings, Austin, Texas, woven earrings, bracelet, agate, moonstone, rose quartz, bracelets quartz, silver bracelets, peridot pendants, smokey quartz, jasper, stone jewelry,India Jewelry,Indian jewelry, jewellery, carnelian, tiger eye, tigereye,malachite, lapis lazuli, amethyst, amethyst necklace, lapis lazuli necklace, garnet necklace, quartz, topaz necklace, aventurine neclace, pearl necklace, fluorite, unakite, iolite necklace, tourmoline, beads, hand-made, handcrafted jewelry">


</HEAD>
<BODY BGCOLOR="white" link="black" topmargin='0' leftmargin="1" >
<div align="left">
<cfinclude template="headerforlist.cfm">
 <table border="0"  align='left'  cellspacing="0"  width="800" cellpadding="0" style="margin-top:1px;margin-left:0px;">
   		  <tr  valign="top" align="center"> 
	   <td   valign="top" align="left"> 
        <CFSET folder = #LCASE(category)#> 
		<cfif not isnumeric(newitem)>
		<cfset newitem = 1010>
		</cfif>
		               <cfset prevpos = newitem - 1>
                <cfset nextpos = newitem + 1>
 <CFFORM ACTION="/cart.cfm" METHOD="POST" NAME="wishbuy" onSubmit="javascript:goProcess('add');"> 
		<table  width="800"  cellspacing="0" align="center" style="border:1px gray solid;" >
        <!--DWLayoutTable-->
          <tr valign="top"> 
            <td rowspan="1" valign="middle" align="center" width="120" bgcolor='#ffffff'> <!--- the left blank column of the image tab --->
			  <cfoutput>   
			  <div id="qtyincart" ><strong  class="grayplacard">&nbsp; Item Id: #newitem# </strong> </div>
			<!--   <td rowspan="2" align="left" background="/images/dg2lgbg.jpg">&nbsp;</td> -->
            </td><td    rowspan="3"   align="center" valign="middle"   > 
                <cfset imgname ="d:\inetpub\semiprecious\images\#folder#\#newitem#.jpg">
						<cfx_imageinfo file="#imgname#">
			<cftry>
				<cfset width = imageinfo.width>
			<cfset ht = imageinfo.height>
			<cfif imageinfo.width GT 550 or imageinfo.height GT 500>
		
			<cfif imageinfo.width GT imageinfo.height >
			<cfset width =  550>
	<cfelse>
			<cfset width = imageinfo.width*500/imageinfo.height>
			</cfif>
			
			</cfif><Cfcatch type="any">
			<cfset width = 350>
</Cfcatch>
</cftry>
               <img width="#width#"  src ='/images/#folder#/<CFIF #NameID# is "">#newitem#.jpg<CFELSE>#NameID#</CFIF>' alt="100% Satisfaction Guaranteed"  border="0">

            </td>
   <td  align='center' valign="middle"   bgcolor="##FFFFFF" >
  
        <cftry> 	
		<cfif  details.clustercount mod 2>
		<input type="hidden" name="style"  value="1">
		<span  class="look">
		<a href="/gemstone.cfm?itemid=#newitem#&type=look" >More Items <br>Like This</a>
		</span>
      </cfif>
		<cfcatch type="any">
			<cfquery datasource="gemssql">
            update items set clustercount =  0  where newitem = #details.newitem#
 </cfquery>
 </cfcatch></cftry>	  
<cftry> 
<cfif  details.clustercount GT 1> <!--- 2 and 3 => set , 1, 3 indicate style --->
<input type="hidden" name="set" value="1">
                <span  class="set"><a href="/gemstone.cfm?itemid=#newitem#&type=set" >Make  a Set</a></span> 
                  </cfif>	
	
			<cfcatch type="any"><cfquery datasource="gemssql">
update items set clustercount =  0  where newitem = #details.newitem#
 </cfquery></cfcatch></cftry></td></tr><tr>
 <td align="center" valign="middle">
<!-- 			<td background="/images/lg2whitebg.jpg" rowspan="2">&nbsp;</td> -->
<a accesskey="Z" href="/wish.cfm"  class="wishlist">See Wish List</a><br><br>
<a href='/gemstone_jewelry_gallery.cfm?#session.filter#'  class="table_row_over" > Back  to Gallery </a>	<cfif session.mail is 'nitishpandey@indiatimes.com'>
			<br>
<a href="/edititem.cfm?newitem=#newitem#"  />EDIT</a>
			</cfif>
           <br>
<br>
            </td>
 <td valign="middle">
			   		  <div class="details" align="left">
                       
				<cfif status eq 0 or status eq 3 >
				    <FONT verdana > 
		                 Retail price: <strike>#format(round(evaluate(price*1.5*(1+(newitem mod 150)/1000))))#</strike>
                </font> <br>
					 <font color="black">Your Price: <b>#format(price)#</b> </FONT> <br>
	           <cfif not isdefined("session.bulkbuyer.id")>  
	                   <CFIF  status eq 3>
                      <b><font color="red">Sale!</font>: #format(saleprice)#</b> <br>
					              </CFIF>
				</cfif>
            	    <CFIF invent LTE 0>
                  <span class="error1">Item Sold out.</span>
				  You may Order. Allow 2-4 weeks for shipping<br>
                </cfif><div id="ajaxoutput" align="center">
                  <span id="erroraddingitem"  class="hidden" >Add To Cart Failed!</span>
			     <INPUT TYPE="hidden" NAME="bought" VALUE="buy">
                             <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('add')" VALUE="Add to Cart" /><CFINPUT type="text" SIZE="2"  id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" />
           <div id="totalqty" class="category" align="center">Can Change Later</div>
             <INPUT TYPE="button" id="a2wl" class="greenbutton" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List">
      
                <INPUT TYPE="hidden" NAME="cart" VALUE="#cart#">
                <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#">
				<input type="hidden" name="invent" value="#invent#">
                <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#">
                <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="<CFIF status is 3>#saleprice#<cfelse>#price#</cfif>">
                <INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#">
				<!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
				<cfelse>
				Item Not Available.
				Need it? Email us.
				</cfif>
                <!---                Shop By<br>
                Item No.: <br>
                <input type="text" name="nextitem" value="" size="4" maxlength="4">
                <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show">--->
       </div></div>	

              </td>					  		    
          </tr>		  </cfoutput> 
		  <tr valign="bottom"> 
                <!-- change this to darkgreen when putting image back -->
<td>&nbsp;</td>              	
      <cfoutput>   
      
		
                <cfif isdefined("session.filterarray")>
                  <cfif arraylen(session.filterarray) GT 1>
                    <cfset thispos =  filterarrayfind(newitem)>
                    <!--- <cfoutput>#thispos#</cfoutput> --->
                    <cfif thispos>
                      <cfif thispos EQ 1>
                        <cfset prevpos = arraylen(session.filterarray)>
						<cfelse>
                     <cfset prevpos = thispos -1>
				
                       </cfif>
    <cfset catp =	session.filterarray[prevpos][2]>
                      <cfset prevpos = session.filterarray[prevpos][1]>
            <!---                              <cfset imgname ="d:\inetpub\semiprecious\images\#catp#\#prevpos#.jpg">
                          <cfx_imageinfo file="#imgname#"> 
                       <cftry>  
					     <cfif imageinfo.width GT imageinfo.height >
                            <cfset width = 120>
                            <cfset ht = imageinfo.height*120/imageinfo.width >
                            <cfelse>
                            <cfset ht =  120>
                              </cfif>					   <cfcatch type="any">
					                               <cfset ht =  120>
</cfcatch></cftry>

						<a href="/jewelry_next.cfm/#prevpos#_#catp#.htm">
						<cfset pimg = "/images/#catp#/#prevpos#.jpg">
						<img name="pimg"  align='absmiddle' border="1"  alt="Previous" src="/images/#catp#/thumb/#prevpos#.jpg" height="#ht#"   hspace="0" vspace="0"  > 
                          </a>					 
                      <cfelse>	 <cfset catp = 'jewelry'>
                      <cfset prevpos = newitem - 1>&nbsp;            --->
                    </cfif> 
                  </cfif>
                  <cfelse>	 <cfset catp = 'jewelry'>
                  <cfset prevpos = newitem - 1>&nbsp;
                </cfif>

              </cfoutput> <td  valign="bottom" align="center">&nbsp;
              <!--- <a href="#cgi.HTTP_REFERER#"> 
                    <a href="http://www.semiprecious.com/gemstone_jewelry_gallery.cfm?#session.filter#">Continue 
                    Shopping</a> 
                    </cfif> --->
                <cfif isdefined("session.filterarray") >
				<cfif arraylen(session.filterarray) GT 2>
                    <cfset thispos =  filterarrayfind(newitem)>
                    <!--- <cfoutput>#thispos#</cfoutput> --->
                    <cfif thispos>               
                      <cfif thispos EQ arraylen(session.filterarray)>
                        <cfset nextpos = 1>
						<cfelse>
						<cfset nextpos  = thispos + 1>
						 </cfif>
                      <cfset catn = 	session.filterarray[nextpos][2] >
                      <cfset nextpos = 	session.filterarray[nextpos][1]>
					  <cfset variables.ht = 90 />
                        <cfset imgname ="d:\inetpub\semiprecious\images\#catn#\#nextpos#.jpg">
                      <cfx_imageinfo file="#imgname#"> 
					  <cftry>
					  <cfif imageinfo.width GT imageinfo.height >
                            <cfset width1 =  90>
                            <cfset ht = round((imageinfo.height*90)/imageinfo.width)>
					                            <cfelse>
                            <cfset ht =  90>
                       </cfif>	  <cfset nimg = "/images/#catn#/#nextpos#.jpg">
					   <cfcatch type="any">
					                               <cfset ht =  "">	  <cfset nimg = "/images/#catn#/thumb/#nextpos#.jpg">
</cfcatch></cftry>
						  <cfset nimg = "/images/#catn#/#nextpos#.jpg"> 
					<cfoutput> 

 	<a href='/jewelry_next.cfm/#nextpos#_#catn#.htm'  ><img  src="/images/#catn#/thumb/#nextpos#.jpg" border="1"  name="nimg" hspace="0" vspace="0"   alt="Next" height="#variables.ht#"   >
								</a></cfoutput>
					<!--- 	<cfelse>
				<cfoutput><img  src="" border="1"  name="nimg" hspace="0" vspace="0"   alt="Next" height="#variables.ht#"   >
                 </cfoutput> ---> </cfif>
				  	<cfelse>
					<cfset nextpos = prevpos>
				  <cfset catn = 'jewelry'>
               </cfif>
                  <cfelse>
                  <cfset nextpos = newitem + 1>
				  <cfset catn = 'jewelry'>
                </cfif>
            <cfoutput>  
              </td>
			  </tr>
            <tr valign="bottom" > 
              <td valign="top" align="center"   colspan="1" ><a href="/jewelry_next.cfm/#prevpos#_#catp#.htm"><img border="0" src="/images/prev.gif" hspace="0" vspace="0"   align="absbottom" width="18" height="18" />PREV</a> <!--- <br> <br> <a href="/detailemailer3.cfm?description=#urlencodedformat('visit www.semiprecious.com for more details')#&newitem=#newitem#&cat=#category#&from=#cgi.HTTP_REFERER#" ><font face="Calisto MT" style="bold">Tell 
                a Friend</font></a> ---></td>
              <td align="justify" valign="top"  > <span >#description#                 <cfif optcount>
                  <br>
                  <cfquery datasource="sptm" username="nitish" password="rangeela" name="opts">
                  select description, optionid, valueadd from options where itemid               = #newitem# 
                  </cfquery><span class="lookinline"> Options: <select id="optionid" name="optionid"  style="display:inline;backgroun-color:orange;">
                    <cfloop query="opts">
<cfif url.optionid eq optionid>
      <option value="#optionid#" selected>$ #valueadd# more for #description#</option>
<cfelse>
      <option value="#optionid#">$ #valueadd# more for #description#</option>
</cfif>
                
                    </cfloop>
                  </select>&nbsp;</span>
                  <cfelse>
                  <input type="hidden" name="optionid"  id="optionid" value="0">
                </cfif> 
			<!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:"><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;">Customize/Modify</span></a>--->
	<cfif category eq "necklaces"><br>        <a href='http://www.qvc.com/jw/jw_necksizeguide.html' class="highlightred">Necklace Size Guide by QVC</a> 
        <br>
    (Dangling earrings with or without Hypo allergenic hooks available for most necklaces for $3/pair, call 1800 620 9849  or 
          email <a href="/contactus.cfm?newitem=#newitem#">anup@semiprecious.com</a> to order or inquire) 
          <!---<br><b>To place order by phone 24x7 call 512-589-9009</b>--->
				  <cfelseif category is 'pendants'>
                  <br>
                  We NOW have silver chains for your pendants, click <a href='http://www.semiprecious.com/necklaces.cfm?subcat=chain-silver'>here</a>.
				  
				     <cfelseif category eq "earrings">
            <br />
            Hypo Allergenic, nickel free option available for all dangling earrings  for free call 1-800-908-4064 
			 or email <a href="/contactus.cfm?newitem=#newitem#">anup@semiprecious.com</a> to request 
            change after ordering 
            <!---<br><b>To place order by phone 24x7 call 512-589-9009</b>--->
          </cfif>
			</span></td>
              <td  align='center' valign="top"     bgcolor="##FFFFFF"  colspan="1" > 
                <a href="/jewelry_next.cfm/#nextpos#_#catn#.htm">NEXT <img  border="0" src="/images/next.gif" hspace="0" vspace="0"  align="absbottom" width="18" height="18" /></a><!--- <br /> <br /> <a href="/gift_certificatenew.cfm?description=visit%20www.semiprecious.com%20to%20know%20more">Gift 
                Certificate </a> ---> </td></cfoutput>
          </tr>
     	    </table>       </CFFORM>
		</TD>
      </tr>
	  	<tr><td  align="Left"><a href='/agate.htm'><i>Learn more about this and other semi precious stones</i></a></td></tr>
		<Tr><td valign="top"><cfinclude template="googleads.htm" /><!---  <span class="highlightred">Can also order 
          by calling: 512 589 9009 (USA)</span> &nbsp;<span class="highlightred">|&nbsp;</span>  <a href="/detailemailer3.cfm?description=#urlencodedformat(description)#&newitem=#newitem#&cat=#category#">Email 
           to a Friend</a> <span class="highlightred">&nbsp;<br /> --->
	     </td></tr>
<!---  <tr> 
      <td height="130" valign="top" > <cfif isdefined("stones2") >
          <cfoutput> 
            <table  border="0" bordercolor="##996633"  >
              <!--DWLayoutTable-->
              <tr> 
                <td height="21" colspan="#stonecount#" align="center" > 
                  <!-- URL's used in the movie-->
                  <!-- text used in the movie-->
                  <!--HEALING,GEOGRAPHICAL, PHYSICAL & CHEMICAL, BIRTH STONES PROPERTIES-->
                  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,0,0"
 width="680" height="21" align="baseline">
                    <param name=movie value="/np/calloutproperties.swf">
                    <param name=quality value=high>
                    <param name=bgcolor value=##FFFFFF>
                    <param name="LOOP" value="false">
                    <embed src="/np/calloutproperties.swf"  width="681" height="21" loop="false" align="baseline" quality=high bgcolor=##FFFFFF
 type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed> 
                    <cfif find("Explorer",cgi.HTTP_USER_AGENT)>
                      <noobject><img src="/np/calloutproperties.jpg" width="678" height="21"></noobject> 
                    </cfif>
                  </object> 
                  <!---  <img src="/calloutproperties.jpg" width="678" height="30"></td>
                <td> --->
                </td>
              </tr>
              <tr class="descr"> 
                <cfloop list="#stones2#" index="st">
                  <td height="20" align="center" > 
                    <a href="/#st#.htm">#Ucase(st)#</a> </td>
                </cfloop>
              </tr> 
            </table>
          </cfoutput> 
          <cfelse>
          <!--- <cfif category is not "earrings" and category is not "bracelets" and category is not "ornaments">
            --->
          <a href='/healing_properties.htm'>Know more about Healing 
          Properties of stones and lots more...</a> 
          <!---     </cfif> --->
        </cfif> &nbsp;</td></tr>--->

			  	 
 
    <!--- <!--  <TR><td align='center'>

<CFIF saleprice is not ""><CFSET price = #saleprice#></CFIF>

<CFFORM ACTION="" METHOD="POST" NAME="wishbuy">
<INPUT TYPE="hidden" NAME="bought1" VALUE="wish">
<CFIF invent is not 0>
<INPUT TYPE="hidden" NAME="bought" VALUE="buy">Quantity:<CFINPUT type="text" SIZE="3" Name="quantity" VALUE="1" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer">
<INPUT TYPE="button" VALUE="add" onClick="javascript:goProcess('add')"><cfelse>Sold out, will be restocked</cfif>
<INPUT TYPE="button" VALUE="Add to Wish List" onClick="javascript:goProcess('Add to Wish List')">
<INPUT TYPE="hidden" NAME="cart" VALUE="<cfoutput>#cart#</cfoutput>">
<INPUT TYPE="hidden" NAME="NameID" VALUE="<cfoutput>#NameID#</cfoutput>">
<INPUT TYPE="hidden" NAME="newitem" VALUE="<cfoutput>#newitem#</cfoutput>">
<INPUT TYPE="hidden" NAME="price" VALUE="<cfoutput>#price#</cfoutput>">
<INPUT TYPE="hidden" NAME="category" VALUE="<cfoutput>#category#</cfoutput>"><br>
</CFFORM> 
</FONT></td></tr> -->


			  <script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 160;
google_ad_height = 600;
google_ad_format = "160x600_pas_abgn";
google_ad_channel ="";
google_ad_type = "text";
google_color_border = "CCCCCC"
google_color_bg = "FFFFFF";
google_color_link = "003300";
google_color_url = "DADA99";
google_color_text = "DADA99";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script> --->
  <tr><td>&nbsp;<p>&nbsp;</p></td></tr>
  <!---<tr>
      <td height='50' valign="top" colspan='2'> 
        <!-- Begin Jewelry Banner Exchange Code -->
        <IFRAME SRC="http://www.jewelrybannerexchange.com/cgi-bin/ads.pl?iframe;member=semiprecious" MARGINWIDTH="0" MARGINHEIGHT="0" HSPACE=0 VSPACE=0 FRAMEBORDER=0 SCROLLING=NO WIDTH=468 HEIGHT=60> 
        <SCRIPT LANGUAGE="JavaScript" SRC="http://www.jewelrybannerexchange.com/cgi-bin/ads.pl?jscript;member=semiprecious"></SCRIPT>
        <NOSCRIPT>
        <BR />
        <SMALL><A HREF="http://www.jewelrybannerexchange.com" TARGET="_blank">Jewelry 
        Banner Exchange</A></SMALL> <BR />
        </NOSCRIPT>
        </IFRAME> 
        <!-- End Jewelry Banner Exchange Code -->
      </td>
    </tr> --->
  </TABLE>

</div>

<cfoutput>
<script language="javascript">
	document.getElementById("#lcase(folder)#").style.color = "maroon";
  document.getElementById("#lcase(folder)#").style.textDecoration = "none" ;
 window.focus();
 document.getElementById('quantity').focus();
 
<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>

</script> 
<!---
  <cfif isdefined("session.filterarray") and (arraylen(session.filterarray) GT 1)>
     
 <script language="JavaScript1.1">
  function loadfunc() {

     document.pimg.src = "#pimg#" ; 
  <cfif arraylen(session.filterarray) GT 2>
               document.nimg.src = "#nimg#" ;
			   </cfif>
			   }
</script></cfif> --->
 </cfoutput>
</BODY>
</HTML>
