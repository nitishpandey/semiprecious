	
<cfparam name="session.ajaxcheck" default="-1" />
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
<CFPARAM NAME="stonename" DEFAULT= "">
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

<cfset pattern = #cgi.PATH_INFO#>
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
  Select size, storage, imagelink, inventory, price, status, saleprice,clustercount,wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, cat from 
  items where newitem=#itemnumber# 
  </cfquery>
    <cfif isdefined("session.bulkbuyer.id")>
	<CFSET status = details.status>
		<cfif isnumeric(details.wholesaleprice)>
		   <CFSET price=details.wholesaleprice>
		<cfelse>
	   		<cfset price = details.price/2 />
		</cfif>
   	<!--- </cfif> --->
 <cfelse>
   <CFSET price=details.price> 
    
<CFSET status = details.status>
    <cfif details.status eq 3> 
	<CFSET SalePrice = #details.saleprice#>
  </cfif>
</cfif>
  <CFSET description=details.description>

<cfif findnocase('silver',details.subcat)>
  <cfset description = description & '<br><font color=gray>Our Jewelry is all hand-made, so there may be slight differences amongst the pieces. However, if there are significant differences, we state so in each item description.<br>Silver used is .925 sterling silver</font>'>
</cfif>
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
	<cfset Stonename=ston>
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
<cfoutput> 
  <TITLE>#subcategory# #category# Jewelry </TITLE></cfoutput> 



 <script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>

  <script language=JAVASCRIPT src="/javascript/detail2.js" type="text/javascript">
</script>

  
<SCRIPT LANGUAGE="JavaScript1.1">
<!-- Original:  Martin Webb (martin@irt.org) --> 
  
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com --> 
  
<!-- Begin

if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);

//  End -->
</script> 

<meta name="description" content="<cfoutput>#description#, #category# #subcategory# ">
<meta name="keywords" content='#category#,#description#</cfoutput>'>
<cfif subcategory is 'amber' or stonename is 'amber'><META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
</cfif> 
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
<!---
<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
--->
<meta name="description" content="Unique <cfoutput>#subcategory# of #category#</cfoutput>, a semiprecious gemstone jewelry item. We sell rings, pendants, necklaces, earrings, bracelets.  We sell retail and wholesale. We sell Tiger eye, lapis lazuli, pearl, garnet, malachite, turquoise, aventurine, jasper, moss agate, agate, quartz, peridot etc. and other healing crystals, Austin based">
<meta name="keywords" content="semiprecious cheap <cfoutput> #category# #subcategory#</cfoutput>,semi precious, xmas ornaments, bells,starts, balls, christmas, ornaments, semi-precious, gemstones, jewelry, necklaces, earrings, Austin, Texas, woven earrings, bracelet, agate, moonstone, rose quartz, bracelets quartz, silver bracelets, peridot pendants, smokey quartz, jasper, stone jewelry,India Jewelry,Indian jewelry, jewellery, carnelian, tiger eye, tigereye,malachite, lapis lazuli, amethyst, amethyst necklace, lapis lazuli necklace, garnet necklace, quartz, topaz necklace, aventurine neclace, pearl necklace, fluorite, unakite, iolite necklace, tourmoline, beads, hand-made, handcrafted jewelry">


</HEAD>
<BODY BGCOLOR="white" link="black" topmargin='0' leftmargin="0" onLoad="javascript:ajaxcheck();"  >

<div align="center">
<cfinclude template="headerforgemstone_jewelry_gallery.cfm">
<cf_steps step="2" /><CFIF (category is "")><br>
<div align="center" style="background-color:pink;margin-top:4px;border:thin ridge #CCFCCC;padding-top:12px;width:798px">
  <FORM action='/jewelry_item.cfm' method='get' >
If you have the jewelry item number handy please fill it and click on 'Details': 
    <input type='text' name='itemnumber' size='5'>
    <INPUT type='submit'  class="greenbutton" value='details'>
  </form><br>
    If you were trying to add an item to the shopping cart then make sure you 
    clicked on the 'Add to Cart' button. Hitting 'Enter' on your keyboard can 
    cause error.Browser 
    <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px"> 
      <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;"> 
      <strong>Designs</strong><br>
      </span> <a href="showearrings.cfm">earrings</a> <br>
      <a href="shownecklaces.cfm">necklaces</a><br>
      <a href="showbracelets.cfm">bracelets</a> <br>
      <a href="showpendants.cfm">pendants</a></p> </div>	
  </div>
	    <cfinclude template="footer.htm" > 
  </div>
  
</html></body>
  <CFABORT>
</CFIF>
 <table border="0"  align='center'   cellspacing="0"  bgcolor=white width="800" cellpadding="0" style="margin-top:0px;">
   		  <tr  valign="top" align="center"> 
	   <td   valign="top" align="left"> 
        <CFSET folder = #LCASE(category)#> 
		<cfif not isnumeric(newitem)>
		<cfset newitem = 1010>
		</cfif>
		               <cfset prevpos = newitem - 1>
                <cfset nextpos = newitem + 1>
 <CFFORM ACTION="/cart.cfm" METHOD="POST" NAME="wishbuy" onSubmit="javascript:goProcess('add');return false;" style="display:inline;"> 
		<table  width="800"  cellspacing="0" align="center" style="border:1px gray solid;" >
        <!--DWLayoutTable-->
         
 <tr valign="top"> 
            <td rowspan="1" valign="middle" align="center" width="120" bgcolor='#ffffff'> <!--- the left blank column of the image tab --->
			<cfoutput>   
			<input type="hidden" name="ajaxcheck" value="#session.ajaxcheck#"  id="ajaxcheck"/>
		<!--   <td rowspan="2" align="left" background="/images/dg2lgbg.jpg">&nbsp;</td> -->
            </td><td    rowspan="3"   align="center" valign="bottom"   > 
               <cfset imgname ="d:\inetpub\semiprecious\images\#folder#\#newitem#.jpg">
						<cfx_imageinfo file="#imgname#">
			<cftry>
				<cfset width = imageinfo.width>
			<cfset ht = imageinfo.height>
			<cfif imageinfo.width GT 550 or imageinfo.height GT 400>
		
			<cfif imageinfo.width GT  evaluate(imageinfo.height +50 ) >
				<cfset width =  550>
			<cfelse>
				<cfset width = imageinfo.width*400/imageinfo.height>
			</cfif>
			
			</cfif><Cfcatch type="any">
			<cfset width = 350>
</Cfcatch>
</cftry>
<cfif details.storage EQ 'pippin'>
               <img  src ='#details.imagelink#' alt="Cheap #subcategory# #category# Jewelry" border=0>
<cfelse>
               <!---<img width="#width#"---><img  src ='/images/#folder#/<CFIF #NameID# is "">#newitem#.jpg<CFELSE>#NameID#</CFIF>'  alt="Cheap #subcategory# #category# Jewelry"  border="0">
</cfif>

            </td>
   <td  align='center' valign="middle"   bgcolor="##FFFFFF" >
                       <a href=../cart.cfm><img src=/googlecheckout/googlesmall.gif border=0 width="115" height="17"></a><br><font size=1>(optional)</font>
					   			           <cftry> 	
		<cfif  details.clustercount mod 2>
		<input type="hidden" name="style"  value="1">
		<span  class="look">
		<a href="/gemstone.cfm?itemid=#newitem#&type=look" >More of <br>Similar Design</a>
		</span>
      </cfif><br>
	 <cfif category is 'beads'>
	<a href="../semiprecious-stone-beads.cfm?category=#category#&subcat=#subcategory#">More <cfoutput>#subcategory# #category#</cfoutput></a>
	<cfelse>
	<a href="../gemstone_jewelry_gallery.cfm?category=#category#&subcat=#subcategory#">More <cfoutput>#subcategory# #category#</cfoutput></a>
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

  <strong  class="grayplacard">&nbsp; Item Id: #newitem# </strong><br>
			  <div id="qtyincart" ></div><br>
<a accesskey="Z" href="/wish.cfm"  >See Wish List</a><br><br>
 <cfif category eq 'beads'>
 <a href='/semiprecious-stone-beads.cfm?#session.filter#' >Back  to Gallery</a>
 <cfelse>
<a href='/gemstone_jewelry_gallery.cfm?#session.filter#' >Back  to Gallery</a>
</cfif>
<cfif session.mail is 'nitishpandey@indiatimes.com'>
			<br>
<a href="/edititem.cfm?newitem=#newitem#"  />EDIT</a>
<cfelse><br>
<br>
<a href="/contactus.cfm?newitem=#newitem#&folder=#folder#">Enquire</a>
			</cfif>
			<br><br><br><a href=/cart.cfm><img src=../images/jewelrycart.jpg border=0></a>
            </td>
            
 <td valign="middle"  width="140px">
			   		  <div class="details" align="left">
                     
                       <br><br>
				<cfif status eq 0 or status eq 3 >
					    <cfif not isdefined("session.bulkbuyer.id")>
							<FONT verdana > 
								 Retail price: <strike>#format(round(evaluate(price*1.5*(1+(newitem mod 150)/1000))))#</strike>
							</font> <br>
							</cfif>
					 <font color="black">
					 <cfif isdefined("session.bulkbuyer.id")>Wholesale<cfelse>
					<cfif cgi.server_name neq "63.135.126.234">
					Your Price
					<cfelse>
					Through Agent
					</cfif>
					</cfif>: <b>#format(price)#</b> </FONT> <br>
					<fotn color=red>Min. $50 total beads purchase required for beads section</font>
			
<cfif cgi.server_name neq "63.135.126.234">
	           <cfif not isdefined("session.bulkbuyer.id")>  
	                   <CFIF  status eq 3>
                      <b><font color="red">Sale!</font>: #format(saleprice)#</b> <br>
					              </CFIF>
				</cfif>
            	    <CFIF invent LTE 0>
            	    
                  <span class="error1">
                		Item Sold out.</span>
We restock, request to expedite by email.<br>
                
                </cfif>
                <div id="ajaxoutput" align="center">
                  <span id="erroraddingitem"  class="hidden" >Add To Cart Failed!</span>
			     <INPUT TYPE="hidden" NAME="bought" VALUE="buy">
            <cfoutput>#details.inventory#</cfoutput>  <i>in stock </i><br> 
            <CFIF invent GT 0>
            <CFINPUT  type="text" SIZE="1"   id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" /><INPUT TYPE="button"  id="a2cb" class="greenbutton" onClick="javascript:goProcess('add')" VALUE="Add to Cart" /><input type="button" class="hidden" id="a2cw" value="Wait..." />
           <div id="totalqty" class="" align="center">Can Change Later</div>
                       
             <INPUT TYPE="button" id="a2wl" class="greenbutton" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List">
      </cfif>
                <INPUT TYPE="hidden" NAME="cart" VALUE="#cart#">
                <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#">
				<input type="hidden" name="invent" value="#invent#">
                <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#">
                <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="<CFIF status is 3>#decimalformat(saleprice)#<cfelse>#decimalformat(price)#</cfif>">
                <INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#">
				<!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
				<cfelse>
					<cfif cgi.server_name neq "63.135.126.234">
	
					Item Not Available.
					Need it? Email us.
					</cfif>
				</cfif>
</cfif> <!--- cgi--->
                <!---                Shop By<br>
                Item No.: <br>
                <input type="text" name="nextitem" value="" size="4" maxlength="4">
                <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show">--->
       </div></div>	

              </td>					  		    
          </tr>		  </cfoutput> 
		  <tr valign="bottom"> 
                <!-- change this to darkgreen when putting image back -->
<td align="center"><a onClick="MM_showHideLayers('howto','','show');" style="color:maroon;margin-bottom:2px;"><img src="/images/help.gif" border="0" vspace="0" hspace="0" align="absmiddle" width="43" height="30" /></a></td>              	
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

						<a href="/jewelry_item.cfm/#prevpos#_#catp#.htm">
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
                    <a href="gemstone_jewelry_gallery.cfm?#session.filter#">Continue 
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
						  <cfif category neq 'beads'>
					<cfoutput> 

 	<a href='/jewelry_item.cfm/#nextpos#_#catn#.htm?thiswidth=#width#'  ><img  src="/images/#catn#/thumb/#nextpos#.jpg" border="1"  name="nimg" hspace="0" vspace="0" width=100  alt="Next" height="#variables.ht#"   >
								</a></cfoutput>
								</cfif>
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
            <tr valign="top" > 
              <td valign="top" align="center"   colspan="1" ><a href="/jewelry_item.cfm/#prevpos#_#catp#.htm"><img border="0" src="/images/prev.gif" hspace="0" vspace="0"   align="absbottom" width="18" height="18" />PREV</a> <!--- <br> <br> <a href="/detailemailer3.cfm?description=#urlencodedformat('visit www.semiprecious.com for more details')#&newitem=#newitem#&cat=#category#&from=#cgi.HTTP_REFERER#" ><font face="Calisto MT" style="bold">Tell 
                a Friend</font></a> ---></td>
              <td align="left" valign="top" > <div align="justify"  >#ucase(subcategory)# #ucase(left(Category,len(category)-1))#: #description# <cfif details.size neq ""><b>Size:</b> #details.size# mm/inches as appropriate</cfif>
			  <cfif details.storage is 'angela'> <a href='../designer_jewelry_angela.cfm'>More by Angela.</a></cfif>
			  <cfif details.storage is 'CMZP'> <a href='../pettags.cfm'>Also see Pet Tags by Gymstones</a></cfif>
			  <cfif category is 'beads'> ** Unless specified all strands are 16 inches.<br>
			    <cfif details.size neq "" and details.size GT 0> Approx. number of beads calculate out to: #round(evaluate(16*25.4/details.size))# (this is auto calculated based on bead size entered and 16 inch strand length and can be wrong if length of strand is different or size of bead is not along the strand length)</cfif><br>
				 <font color=red>**</font>Size and color of natural stones may vary slightly</cfif>
			
			  <cfif category eq "rings">
					 <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a> </cfif>     <cfif optcount>
                  <br />
                  <cfquery datasource="gemssql" name="opts">
                  select description, optionid, <cfif isdefined("session.bulkbuyer.id") >valueadd/2 <cfelse> valueadd </cfif>as _valueadd from options where itemid               = #newitem#  and inventory>0
                  </cfquery><div  class="optionsinline" align="right" style="width:100%;horizontal-align:right"> <b>Options</b>: <select id="optionid" name="optionid"   >
                    <cfloop query="opts">
					<cfif _valueadd> <!--- if there is a change in price because of this option --->
<cfif url.optionid eq opts.optionid>
      <option value="#opts.optionid#" selected>#description#. Charge: $#_valueadd# </option>
<cfelse>
      <option value="#opts.optionid#"> #description#. Charge: $#_valueadd# </option>
</cfif>

<cfelse>
<cfif url.optionid eq opts.optionid>
      <option value="#opts.optionid#" selected> #description#</option>
<cfelse>
      <option value="#opts.optionid#"> #description#</option>
</cfif>

</cfif>
                    </cfloop>
                  </select>&nbsp;&nbsp;</div>
                  <cfelse>
                  <input type="hidden" name="optionid"  id="optionid" value="0">
                </cfif>  </div>
			<!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:"><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;">Customize/Modify</span></a>--->
	<cfif category eq "necklaces"><a href='http://www.qvc.com/jw/jw_necksizeguide.html' class="highlightred">Necklace Size Guide by QVC</a> 
	
        <br />
          <!---<br><b>To place order by phone 24x7 call 512-589-9009</b>--->
				  <cfelseif category is 'pendants'>
                  <br>
                  We NOW have silver chains for your pendants, click <a href='necklaces.cfm?subcat=chain-silver'>here</a>.
				  
				     <cfelseif category eq "rings">
					 <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a>
            <br />
          </cfif>

			</td>
              <td  align='center' valign="top"     bgcolor="##FFFFFF"  colspan="1" > 
                <a href="/jewelry_item.cfm/#nextpos#_#catn#.htm?thiswidth=#width#">NEXT <img  border="0" src="/images/next.gif" hspace="0" vspace="0"  align="absbottom" width="18" height="18" /></a><!--- <br /> <br /> <a href="/gift_certificatenew.cfm?description=visit%20www.semiprecious.com%20to%20know%20more">Gift 
                Certificate </a> ---> </td></cfoutput>
          </tr>
     	    </table>       </CFFORM>
		</TD>
      </tr>
		<cfif cgi.server_name neq "63.135.126.234">
	  	<tr><td  align="Left"><cfif stonename NEQ ""><a href='/<cfoutput>#stonename#</cfoutput>.htm'><i>Learn more about this and other semi precious stones</i></a></cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="color:maroon;font-size:11px;">
		
			For more information or to order by phone:<cfoutput>#Application.tollfree#</cfoutput>
		</span></td></tr>

		<Tr><td valign="top">
		<!---
		<cfif category neq 'beads'>
				<cfinclude template="googleads.htm" />
				</cfif>--->
		<table><tr><td>		
		</td><td align=left valign=center>Imagine being told by numerous psychics that you walked with Jesus two thousand years ago. This is what happened to John C. Davis, a comedy performer of over two decades. How would you react? John decided to find a regression therapist and see what happened. The regression revealed what many had already told him: he was the reincarnation of John the Beloved Apostle.  <a href=http://www.johnofnew.com>Read more...</a></td></tr></table>


		<!---  <span class="highlightred">Can also order 
          by calling: 512 589 9009 (USA)</span> &nbsp;<span class="highlightred">|&nbsp;</span>  <a href="/detailemailer3.cfm?description=#urlencodedformat(description)#&newitem=#newitem#&cat=#category#">Email 
           to a Friend</a> <span class="highlightred">&nbsp;<br /> --->
	     </td></tr>
		</cfif> <!-- cgi -->
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
<div  id="howto" style="visibility:hidden;position:absolute;top:90px;left:220px;color:##666600;background-color:white;z-index:2;width:300px;"><div class="noticebox">This page helps you to add an item to your cart. Enter the number of  pieces (1 or more) you wish to buy  in the text box shown before the 'Add to Cart' button and click on the 'Add to Cart' button. Your cart will be filled by the desired number of this item.  If the item is already there in the cart, the quantity in cart is updated to the number you have just entered. You will get the message of   item addition on top left.
<ul><li> Options:Before adding/changing the quantity please see if any options/modification  are available for the jewelry. Options are shown at the bottom of the picture and are <span class="optionsinline">highlighted in this color</span>.
         If options are available you may select an option, options are not always compulsory. </li>
		 <li>To remove an item from your cart enter the number 0 (Zero).</li>
		 </ul>
 </div><a onClick="MM_showHideLayers('howto','','hide');" style="color:red;">Close Help</a></div>

<cfif cgi.server_name neq "63.135.126.234">
<cfinclude template='adminfooter.cfm'>
</cfif>

</BODY>
</HTML>