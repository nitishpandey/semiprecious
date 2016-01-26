<cftry>
<cfsilent>
	<CFPARAM NAME="country" DEFAULT= "" >
	<CFPARAM NAME="designer" DEFAULT= "" >
	<cfparam name="session.ajaxcheck" default="0" >
	<cfset session.ajaxcheck=0>

	<CFPARAM NAME="description" DEFAULT="" >
	<CFPARAM NAME="Price" DEFAULT= "1000" >
	<cfparam name="pimg" default="" >
	<cfparam default="0" name="valueadd" >
	<cfparam name="status" default="0" >
<cfparam name="catp"  default="jewelry" >
<cfparam name="catn"  default="" >
<cfparam name="nimg" default="" >
<cfparam name="url.optionid" default="0" >
<CFPARAM NAME="SalePrice" DEFAULT= "" >
<CFPARAM NAME="category" DEFAULT= "" >
<CFPARAM NAME="subcategory" DEFAULT= "" >
<CFPARAM NAME="stonename" DEFAULT= "" >
<CFPARAM NAME="NameID" DEFAULT= "" >
<cfif isdefined("url.newitem")>
  <cfset url.itemnumber = url.newitem>
</cfif>
<cfparam name="itemnumber" default="0" >
<cfparam name="existqty" default="1" type="numeric" >
<cfparam name="session.screenwidth" default="833" type="numeric" >
<CFPARAM NAME="cart" DEFAULT="" >
<CFPARAM NAME="itemnumber" DEFAULT="" >
<CFPARAM NAME="invent" DEFAULT="" >
	<cfparam name="title" default="Semiprecious Silver Jewelry - Peridot, Amethyst...variety of necklaces, bracelets, pendants" >
<CFPARAM NAME="editcart" DEFAULT="" >
<CFPARAM NAME="url.filter" DEFAULT="" >
<cfif cgi.server_name contains "semiprecious.in" >
  <cfset session.india=1>
</cfif>
<cfif designer neq "" >
  <cfset itemnumber=designer>
  <cfset url.newitem=designer>
  <cfset url.itemnumber=designer>
</cfif>
<!--- processing for item number after a forward slash --->
<CFPARAM Name="DSNNAME" default="semiprecious" >
<CFPARAM name="imageloc" default="web" >
<CFPARAM name="display" default="20" >
<CFPARAM name="Currencyexchange" default="1" >
<CFPARAM name= "PicWidth" default= "120" >
<cfif session.mail is 'nitishpandey@indiatimes.com'>
<cfset light = 'pink' />
<cfset dark = '##5A005A' />
<cfelse>
<cfset light = '##D3D3AA' />
<cfset dark = '##666600' />
</cfif>
<!--- This is set up to differentiate between local test environment and
the web environment --->

<CFPARAM name="stopshipdate" default="07/14/08" >
<CFPARAM name="nextshipdate" default="7/22/08" >

<!---
<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com" >
 <cfif not isdefined(session.bulkbuyer.id)>
  <cfset session.bulkbuyer.id = 'guestviewer'>
  </cfif>
</cfif>
--->

<cfif cgi.server_name contains "semiprecious.in" >
<cfset currencyexchange = 42>
</cfif> 

<cffunction name="filterarrayfind" output=True>
  <cfargument name="a" >
  <cfloop from="1" to="#arraylen(session.filterarray)#" index="idx" >
    <cfif session.filterarray[idx][1] eq a>
      <cfreturn idx>
    </cfif>
  </cfloop>
  <cfreturn 0>
</cffunction>

<cfset pattern = #cgi.script_name#>
<cfif not isdefined("url.itemnumber")>
  <cfif Find('/', pattern) gt 0>
    <cftry>
      <cfset  underscore = find('_',pattern,1)>
      <cfif underscore>
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
      <cfcatch type="any" >
        <cfset itemnumber  = "7216" >
        <!---  ERROR CAUTH --->
      </cfcatch>
    </cftry>
  </cfif>
<cfelse>
	 <cfset newitem = url.itemnumber>
</cfif>

<!---<cfif newitem NEQ "" >  <Cfset itemnumber = newitem>  </cfif>end --->


<!--- the original before adding quertystring to the url <CFIF (category is "") And (itemnumber is  not "")>--->
<CFIF  isnumeric(itemnumber)>
	<CFQUERY DATASOURCE="gemssql" NAME="stats" >
		update itemstats set zoom=zoom+1 where itemid =#newitem#
	</cfquery>
	  <CFQUERY datasource="gemssql" name="details" >
		  Select itemnumber, size, weight, style, color, storage, imagelink, inventory, price, status, saleprice,clustercount,wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, subcat2, cat, morepics from 
		  items where newitem=#itemnumber# 
	  </cfquery>
	  <cfif not (details.recordcount is 0)>
		   <cfquery name="getGroups" datasource="gemssql" >
				Select distinct groupname from itemsbygroup where itemid=#itemnumber#
			</cfquery>

		  <cfif details.subcat contains 'bulk' and (session.bulkbuyer.id eq "" or session.bulkbuyer.id eq "0")>
				<cfset session.bulkbuyer.id=session.cartid> <!--- how do we no session.cartid is not 0 ? --->
		  </cfif> 
		  
		  <cfif session.bulkbuyer.id neq "" or cgi.server_name  contains "wholesale-gemstone-jewelry.com" >
			    <CFSET status = details.status>
			    <cfif isnumeric(details.wholesaleprice)>
				      <CFSET price=details.wholesaleprice>
			      <cfelse>
				      <cfset price = details.price/2 />
			    </cfif>
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
		  <CFSET subcategory = details.subcat>
		  <CFSET invent = details.inventory>
		  <cfif findnocase('silver',details.style)>
		    <cfset description = description & '<br><font color=gray>Our Jewelry is all hand-made. Silver used is 92.5 sterling silver unless otherwise noted</font>'>
		  </cfif>
 <cfset listofstoneswithproperties ="AGATE,AMETHYST,BLOODSTONE,CARNELIAN,CITRINE,FLUORITE,GARNET,HEMATITE,IOLITE,JADE,JASPER,LAPIS_LAZULI,MALACHITE,MOONSTONE,MOSS_AGATE,PEARL,PERIDOT,ROSE_QUARTZ,QUARTZ,SMOKEY_QUARTZ,SMOKY_QUARTZ,SODALITE,TIGER_EYE,TOURMALINE,TURQUOISE" >
		  <cfif len(subcategory)><!--- subcategory is basically the stoneslist --->
			    <cfset stonelist = replacenocase(subcategory,"and",",","All")>
			    <cfset stonelist = replace(subcategory,";",",","All")>
		    <cfloop list="#stonelist#" index="ston" >
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

<cfsavecontent variable="title" >
	<cfoutput>  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
Wholesale
  </cfif>
  		 #subcategory#
  <cfif details.subcat2 neq "" >
    &#details.subcat2#
  </cfif>
  #category#
  </cfoutput>
  <cfloop query="getgroups" >
    <cfoutput>#groupname#</cfoutput>
  </cfloop>
  <cfoutput>
  #details.color# gem stone #category# in #details.style# #itemnumber#
</cfoutput>  </cfsavecontent>
	  </cfif>

  <cfelse>
	  <Cfset category = "" >
	  <cfset itemnumber  = "" >
	  <cfset newitem = 1009>
</cfif>

</cfsilent>
<cfset cart_msg= "" />
<cfif isdefined("form.bought")>
<cfinvoke method="additem" attributecollection="#form#" component="cartcontrol.cartmonitor" returnvariable="added"  />

<cfset what_happened = added.response.newitem.qtyadded.XmlText />
<cfif  what_happened LT 0>
<cfset cart_msg="Cannot add any more of this item to your cart" />
<cfelseif what_happened is 0 >
<cfset cart_msg="Selected Design Removed from your cart" />
<cfelse>
<cfset cart_msg= "Selected Item Placed in your cart :" & what_happened />
</cfif>
</cfif>
 <!--- item added to cart --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<cfoutput>
  <TITLE>#title#</TITLE>
<script language="JavaScript" src="/js/global.js"></script>
	 <cfif cgi.server_name contains "wholesale" or cgi.script_name contains "wholesale" or session.bulkbuyer.id contains "@">

	  <script type="text/javascript" src="/wholesalemenu.files/dmenu.js">
   </script>
   <cfelse>
  <script type="text/javascript" src="/newtopmenu.files/dmenu.js"></script>
   </cfif> 
 
  <script language="JavaScript" > 
vCurrentInventory = #invent#;
                     
						function swapMainImage(pImage)
						   { document.getElementById('mainimage').src = pImage; }

</script>



<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
<cfif cgi.server_name contains "wholesale">
<script language=JAVASCRIPT src="/javascript/wholesalezoom.js" type="text/javascript" ></script>
<cfelse>
<script language=JAVASCRIPT src="/javascript/#session.country#zoom.js" type="text/javascript" ></script>
</cfif></cfoutput>
<cfif session.mail neq application.admin_email >
  <SCRIPT LANGUAGE="JavaScript1.1" >
<!-- Original:  Martin Webb (martin@irt.org) --> 
  
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com --> 
  
<!-- Begin

if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);

//  End -->
</script>
  <SCRIPT LANGUAGE="JavaScript1.1" >
<!-- Original:  Martin Webb (martin@irt.org) --> 
  
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com --> 
  
<!-- Begin
function right(e) {
if (navigator.appName == 'Netscape' &&
(e.which == 3 || e.which == 2))
return false;
else if (navigator.appName == 'Microsoft Internet Explorer' &&
(event.button == 2 || event.button == 3)) {
alert("I'm sorry, The Right click option on your mouse has been disabled for the download window pages.");
return false;
}
return true;
} 
  
document.onmousedown=right;
document.onmouseup=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);
window.onmousedown=right;
window.onmouseup=right;
//  End -->
</script>
</cfif>
	<cfif details.recordcount is 0>

<BODY onLoad="javascript:location.href='#jewelry_top';"  >
		<cfif cgi.server_name contains "semiprecious.in" >
		  <cfinclude template="/india/header.cfm" >
	  <cfelse>
		  <cfinclude template="header.cfm" >
	</cfif>	    <h3>Sorry, nothing found, that was the last record for the selection Please go back.</h3>
			</div>
		 
	
  <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px" > 
    <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;" > 
    <strong>Designs</strong><br>
    </span> <a href="showearrings.cfm" >earrings</a> <br>
    <a href="shownecklaces.cfm" >necklaces</a><br>
    <a href="showbracelets.cfm" >bracelets</a> <br>
    <a href="showpendants.cfm" >pendants</a> </p> </div>
  </body>
			</html>
		    <cfabort />
	<CFelseIF (category is "")>
	  <cfinclude template="/#session.country#/header.cfm" >
	  
<br />
<div align="center" style="background-color:pink;margin-top:4px;border:thin ridge #CCFCCC;padding-top:8px;width:798px" >
  <FORM action='/jewelry_item.cfm' method='get' >
    If you have the jewelry item number handy please fill it and click on 'Details':
    <input type='text' name='itemnumber' size='5'>
    <INPUT type='submit'  class="greenbutton" value='details'>
  </form>
  <br>
  If you were trying to add an item to the shopping cart then make sure you 
  clicked on the 'Looks Good' button. Hitting 'Enter' on your keyboard can 
  cause error.Browser
    <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px" > 
      <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;" > 
      <strong>Designs</strong><br>
      </span> <a href="showearrings.cfm" >earrings</a> <br>
      <a href="shownecklaces.cfm" >necklaces</a><br>
      <a href="showbracelets.cfm" >bracelets</a> <br>
      <a href="showpendants.cfm" >pendants</a> </p> </div>
</div>
<cfinclude template="footer.htm" >

</body>
</html>
<CFABORT>
<cfelse>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >


<meta name="description" content="<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>Wholesale </cfif><cfoutput>#subcategory#</cfoutput><cfloop query="getgroups" ><cfoutput> #groupname# </cfoutput></cfloop> <cfoutput>#category#: #details.description#</cfoutput>. We are in Austin TX and India" >
<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>Wholesale </cfif><cfoutput>#subcategory# #category#,</cfoutput><cfloop query="getgroups" ><cfoutput> #groupname# #subcategory#  #category#,</cfoutput></cfloop><cfoutput> <cfif details.color contains "," >multicolor<cfelse>#details.color#</cfif> stone #category#</cfoutput>" >
</CFIF>

<script language="JavaScript" src="/js/imageswap.js" ></script>
  <!-- Deluxe Menu -->
    <noscript><p><a href="http://deluxe-menu.com" >Javascript Menu by Deluxe-Menu.com</a></p></noscript>
    
    <!-- (c) 2009, by Deluxe-Menu.com -->

</HEAD>
<BODY  style="margin-top:0" >
<div align="center" >

<div align="center" >
		  <cfinclude template="/#session.country#/header.cfm" >
	  
	<span  style="height:14px;text-decoration:none;position:relative;left:-40;font-size:11px;" ><cf_steps step="2" ></span>
	<!--- No category --->
	<!--- End no category --->
<table width="906px" cellpadding="0" cellspacing="0" >
<tr valign=top>
  <td cellpadding="0" ><!--- BEGIN LEFT SIDE STUFF --->
  <cfset leftgemstonedisplay="inline" />
    <CFINCLUDE TEMPLATE="/leftmenus.cfm" >
    <!--- END LEFT SIDE STUFF ---></td>
  <td valign=top align="center" >
  	<table   border="0" cellspacing="0"  bgcolor=white width="760px" cellpadding="0" style="margin-top:0px;" >
      <tr  valign="top" >
        <td   valign="top" align="Center" >
        <CFSET folder = LCASE(category) />
          <cfif not isnumeric(newitem)>
            <cfset newitem = 3300> 
          </cfif>
          <cfset prevpos = newitem - 1>
          <cfset nextpos = newitem + 1>
          <CFFORM ACTION="##instock" METHOD="POST" NAME="wishbuy" onSubmit="javascript:goProcess('add');return false;" style="display:inline;" >
          <cfoutput>
            <input type="hidden" name="ajaxcheck" value="#session.ajaxcheck#"  id="ajaxcheck"/>
            </cfoutput>
            <table  width="756px" bgcolr="#ff7777" cellspacing="0" cellpadding="0" border="0" align="center"  >
              <!--DWLayoutTable-->
              <tr valign="top" >
                 <!--- Main image --->
                <td width="560px" align="center" style="border:0 0px #CFFCCF solid;padding-top:2px;" >
				  <cfoutput>
	                   <!--- not in use <cfx_imageinfo file="#imgname#" >
                 <cfset imgname ="d:\inetpub\semiprecious\images\#folder#\#newitem#.jpg" >
	               <cftry>
                      <cfset width = imageinfo.width>
                      <cfset ht = imageinfo.height>
                      <cfif imageinfo.width GT 550 or imageinfo.height GT 400>
                        <cfif imageinfo.width GT  evaluate(imageinfo.height +50 ) >
                          <cfset width =  550>
                          <cfelse>
                          <cfset width = imageinfo.width*400/imageinfo.height>
                        </cfif>
                      </cfif>
                      <Cfcatch type="any" >
                        <cfset width = 350>
                      </Cfcatch>
                    </cftry> --->
                    <CFIF #NameID# is "" >
                      <cfset imagename= newitem & ".jpg" >
                      <CFELSE>
                      <cfset imagename = NameID >
                    </CFIF> 

                <table border="0" cellpadding="0" cellspacing="0" style="padding:2px" >
	                <tr  valign="middle" >
	                	<td valign="middle">
						<div 						style="display:block;border: 0px ##DDD solid;position:relative;z-index:1;"   align="center" > 
                    <img id="mainimage" src ='/images/#folder#/#imagename#'  alt="unique #subcategory# #category# Jewelry"  border="0" > 
                    <DIV   style="position:absolute;top:1px;left:2px;z-index:1;background-color:transparent;"> 
                      <cfif category eq 'beads'>
                        <a class="login_link" href='/semiprecious-stone-beads.cfm?#session.filter#' >Back 
                        to Gallery</a> 
                        <cfelseif isdefined("session.filter")>
                        <cfif len(session.filter)>
                          <a class="LOGIN_link" href='/gemstone_jewelry_gallery.cfm?#session.filter#' >Back 
                          to Gallery</a> 
                          <cfelseif isdefined("session.gallery")>
                          <a class="LOGIN_link" href='#session.gallery#' >Back 
                          to Gallery</a> 
                        </cfif>
                      </cfif>
                    </DIV></cfoutput>
                    <!---  <br style="clear:both" >--->
                    <!--- Display thumbnails if we have more than one image --->
                    <cfif details.morepics GT 0>
                      <div style="border: 1px gray ridge;padding-top:4px;background-color:#EEE" align="center" > 
                        <cfoutput> <img  src ='/images/#folder#/<CFIF #NameID# is "" >#newitem#.jpg<CFELSE>#NameID#.jpg</CFIF>'  alt="unique #subcategory# #category# Jewelry"   height="70px" border="1" style="cursor:pointer" onMouseOver="swapMainImage('/images/#folder#/#imagename#');"  alt='unique #subcategory# #category# Jewelry' > 
                          <cfloop index="picCount" from="1" to=#details.morepics#>
                            <CFIF #NameID# is "" >
                              <cfset imagename= newitem & "-" & picCount & ".jpg" >
                            </CFIF>
                            <img src ="/images/jewelry/#category#/#imagename#" alt="unique #subcategory# #category# Jewelry"  border="1" height="70px" style="cursor:pointer" onMouseOver="swapMainImage('/images/jewelry/#category#/#imagename#');" > 
                          </cfloop>
                        </cfoutput> </div>
                    </cfif>
                  </div>
                  </td></tr>
                  <!--- End thumbnail display --->
                  <!--- Item Description --->
                  <tr><td>
                  <cfoutput>
                  <table>
                    <tr>
                    <td>
                      <cfif details.morepics eq 0 or details.morepics eq "" >  
                      <img style="float:left;margin-left:4px" src=/images/#category#/thumb/#newitem#.jpg />
                      </cfif>
                      
                      	<div align="justify"  >
                        <a href=/images/pictureonly.cfm?category=#category#&itemid=#newitem#><img src=/images/magglass.jpg border=0 width="25" height="24" ></a><font color="black" face="Verdana, Arial, Helvetica, sans-serif" >
                          </cfoutput>
                        <cfif details.subcat neq 'wood'>
                        <cfoutput>
                          #ucase(subcategory)# #ucase(details.subcat2)#
                        </cfoutput>
                          <cfloop query="getgroups" >
                            <cfoutput>#Ucase(groupname)#</cfoutput>
                          </cfloop>
                          <cfoutput>
                          <cfif category neq 'healing'>
                            #ucase(left(Category,len(category)-1))#
                            <cfelse>
                            #ucase(category)#
                            
                          </cfif>
                         
                          </cfoutput>
                          :
                        </cfif>
                        <cfoutput>
                        <CFIF invent LT 1 and details.storage neq 'angela'>
This is out of stock, we restock most items within 6 weeks                          
                        </cfif>
                        #description#<br>
                        <b>Size:</b>
                        <cfif details.size neq "" >
                          <cfif details.size is 0 and details.storage neq 'Angela'>
                            Select size above the ADD TO CART button in inches
                          </cfif>
                          <cfif details.size LT 100>
                            <cfif details.size LT 0.2 and details.size neq 0>
							Adjustable
                              <cfelseif details.size neq 0>
                              #details.size#
                            </cfif>
                            <cfif category is "necklaces" or category is "bracelets" or category is "bags" >
inches
                              <cfelseif (category is "pendants"or category is "earrings" or category is "brouches") and details.size LT 5>
                              inches
							  <cfelseif category is "rings" >
							  (US sizing)
                              <cfelseif details.size GT 0.2>
                              mm
                            </cfif>
                            <cfelse>
                            #Round(evaluate(details.size/25.4))#inches
                          </cfif>
                        </cfif>
						<cfif category is "bracelets" and details.itemnumber is "10">
							Select length above ADD TO CART button
							</cfif>

                        <cfif details.weight neq "0" and details.weight neq "" >
                          <b>Weight: </b>#details.weight#
                          <cfif category is "gems" >
Ct.
                            <cfelse>
                            gm
                          </cfif>
                        </cfif>
                        <cfif details.storage is 'angela'>
                          <a href='../designer_jewelry_angela.cfm'>More by Angela.</a>
                        </cfif>
                        <cfif details.storage is 'CMZP'>
                          <a href='../pettags.cfm'>Also see Pet Tags by Gymstones</a>
                        </cfif>
                        <cfif category is 'beads'>
** Unless specified differently, all strands are 16 inches.                          <br>
                          <cfif details.size neq "" and details.size GT 0>
Approx. number of beads calculate out to:                            #round(evaluate(16*25.4/details.size))#(this is auto calculated based on bead size entered and 16 inch strand length and can be wrong if lenght of strand is different or size of bead is not along the strand length)
                          </cfif>
                          <br>
                           </font>
                          <font color=red>**</font>Size and color of natural stones may vary slightly
                        </cfif>
                        <cfif category eq "rings" >
                          <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a>
                          <cfelseif category is 'pendants'>
                          <a href='/chains.cfm'>Buy chains for your pendants</a>
						  <cfelseif category eq "necklaces" >
                  		    <a href='http://www.qvc.com/jw/jw_necksizeguide.html' class="highlightred" >Necklace Size Guide by QVC</a><br />
                          </cfif>
                        <br /></td>
                    </tr> 
                     
                  </table>
                  </cfoutput>
                  <!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:" ><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;" >Customize/Modify</span></a>--->
                  
	<cfquery datasource="gemssql" name="checkcluster">
	select  itemid from styles,items where  itemid = #itemnumber#
	</cfquery>
	<cfoutput><span id="cart_summary" style="border:1px solid ##d3e467;padding:1px;"><span style="background-color:##dae970;padding:4px;color:black;font-weight:bold;">#cart_msg#</span></span>&nbsp;</cfoutput>
	<a href="javascript:"  class="green_bg" style="color:black" onClick="goProcess('cart summary');return;">Cart Summary</a>&nbsp;
   <cfif checkcluster.recordcount gt 1>
    <!--- include file to display clustered items, by Anup--->
	
    	<cfquery datasource="gemssql" name="getcluster">
    	select top 12 styles.itemid , styles.cat,inventory from styles, items where items.newitem=itemid and styleid =
    	(select  max(styleid) from styles where itemid = #itemnumber#) and itemid <>#itemnumber#
    	</cfquery>
		<cfif getcluster.recordcount gt 0>
        <b><font color="brown">YOU MAY ALSO LIKE THESE:</font></b>
        
        <table border=0 cellpadding=4>
        <cfset coll=0>
        <tr>
        <cfoutput query="getcluster">
        <cfset coll=coll+1>
        <td align=center><a href=/jewelry_item.cfm?newitem=#itemid#><img src="/images/#cat#/thumb/#itemid#.jpg" border=0 width=100><cfif inventory lt 1><br><i>sold out</i></cfif></td><cfif coll is 4></tr><tr><cfset coll=0></cfif>
        </cfoutput>
        <cfset missingTDs=#evaluate(4-coll)#>
        <cfloop from="1" to="#missingtds#" index=k><td></td></cfloop></tr>
        </table>	
        </cfif>
	</cfif>	

                  <br />
                  Check out our <a href=/designer_jewelry_angela.cfm>designer jewelry</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="color:maroon;font-size:11px;" >For more information within 15 min to 12 hrs on this item: <a href="/contactus.cfm?newitem=<cfoutput>#newitem#&folder=#folder#</cfoutput>" >Ask Us</a></span>
                  </td></tr></table>
                  <!--- End Item Description --->
                  <!--- End main image ---></td>
                   <!--- Right side start --->
                <cfoutput>
                <td valign="top" align=center width="140px" ><strong>Item Id: #newitem#</strong><br>
                <cftry>
                    <cfif  details.clustercount mod 2>
                      <input type="hidden" name="style"  value="1" >
                      <span  class="look" ><a href="/gemstone.cfm?itemid=#newitem#&type=look" style="color:white;" >In Other Stones</a></span>
                    </cfif>
                    <cfcatch type="any" >
                      <cfquery datasource="gemssql" >
			            update items set clustercount =  0  where newitem = #details.newitem#
				 </cfquery>
                    </cfcatch>
                  </cftry>
                  <cftry>
                    <cfif  details.clustercount GT 1>
                      <!--- 2 and 3 => set , 1, 3 indicate style --->
                      <input type="hidden" name="set" value="1" >
                      <span  class="set" ><a href="/gemstone.cfm?itemid=#newitem#&type=set" >Make a Set</a></span>
                    </cfif>
                    <cfcatch type="any" >
                      <cfquery datasource="gemssql" >
						update items set clustercount =  0  where newitem = #details.newitem#
					 </cfquery>
                    </cfcatch>
                  </cftry>
                  <br />
                  	  <!--- Prev button --->
                 <!--- removed  <a href="/jewelry_item.cfm/#prevpos#_#catp#.htm" ><img border="0" src="/images/prev.gif" hspace="0" vspace="0"   align="absbottom" width="18" height="18" >PREV</a> --->
                  <!--- End Prev button --->
                  <!--- Next/Edit button --->
                 <!---     <a href="/jewelry_item.cfm/#nextpos#_#catn#.htm?thiswidth=#width#" >NEXT<img  border="0" src="/images/next.gif" hspace="0" vspace="0"  align="absbottom" width="18" height="18" ></a>--->
                  <cfif session.mail is application.admin_email>
                    <br>
                    <cfif category is 'bags'>
                      <a href="/editbags.cfm?newitem=#newitem#"  />EDIT</a>
                      <cfelse>
                      <a href="/edititem.cfm?newitem=#newitem#"  />EDIT</a>
                    </cfif>
                  </cfif>
                  <!--- End next/edit button --->
                 <br>
                  <br>
                  <div class="details" align="center" >
                    <CFIF price eq 0 and (session.bulkbuyer.id is "" and cgi.server_name does not contain "wholesale-gemstone-jewelry.com")>
							Not for retail sale
                      <CFELSEif (session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale-gemstone-jewelry.com") and price eq 0>
                      Not available for wholesale
                      <cfelse>
                      <cfif status eq 0 or status eq 3 >
                        <font color="black" >
                        <cfif session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale-gemstone-jewelry.com" >
							Wholesale
                          <cfelse>
                          <cfif cgi.server_name neq "63.135.126.234" >
							Reg. Price
                            <cfelse>
                            Through Agent
                          </cfif>
                        </cfif>
                        :<b>#format(price)#</b>
						</FONT>
						<br>
                        <cfif cgi.server_name neq "63.135.126.234" >
                          <cfif session.bulkbuyer.id eq "" and cgi.server_name does not contain 'wholesale'>
							<CFIF  status eq 3>
                              <b><font color="red" >Sale!</font>:#format(saleprice)#</b><br>
                            </CFIF>
                          </cfif>
                          <cfif details.inventory GT 0>
                            <cfif cgi.server_name contains  "semiprecious.in" >
Ships in 24 hrs
                              <cfelse>
                              <cfif details.storage contains 'IN'>
                                <font color="red" ><b>Delivery by:<br></b>
		Regular: <cfoutput>#dateformat(dateadd('d',12,now()),"d-mmm")#<br>
		Priority: #dateformat(dateadd('d',10,now()),"d-mmm")#<br>
		Express: #dateformat(dateadd('d',8,now()),"d-mmm")#<br><b></font></cfoutput>
                                <cfelse>
                                <font color=green size=-3><b>Delivery by:<br></b>
		Regular: <cfoutput>#dateformat(dateadd('d',8,now()),"d-mmm")#<br>
		Priority: #dateformat(dateadd('d',7,now()),"d-mmm")#<br>
		Express: #dateformat(dateadd('d',5,now()),"d-mmm")#<br></cfoutput>

		</font></b>
                              </cfif>
                            </cfif>
                            <br>
                          </cfif>
                          <div id="ajaxoutput" align="center" >
                          <span id="erroraddingitem"  class="hidden" >Select  Failed!</span>
                          <INPUT TYPE="hidden" NAME="bought" VALUE="buy" >
                          <!---       <CFIF invent LT 1 and details.storage does not contain 'CM'><font color="##FF9966" >4 week delivery</font><cfelse>--->
                          <cfif invent gt 0>
                           <a name="instock"> #invent#</a> in stock
                          </cfif>
                          <!---</cfif>--->
                          <br />
                          <CFIF invent LT 1>
Sold Out
                            <cfelse>
                            
                            <select id="quantity" style="margin-bottom:2px;" name="quantity" >
<option selected>Qty</option><cfloop from="0" to="#invent#" index="j"><option >#j#</option></cfloop></select>&nbsp;
 <!--- <CFINPUT  type="text" SIZE="1"  id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" onclick="this.focus();" > --->
                            <br>
                            <br>
                            <!--- Display item options --->
                            <cfif optcount>
                              <div  class="optionsinline" align="right" style="width:100%;horizontal-align:right" >
                                <select id="optionidpulldown" name="optionid"   >
                                  <cfquery datasource="gemssql" name="opts" >
                  select description, optionid, <cfif session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale-gemstone-jewelry.com" >valueadd/2 <cfelse> valueadd </cfif>as _valueadd from options where itemid               = #newitem#  and inventory>0
                  </cfquery>
                                  <cfloop query="opts" >
                                    <cfif _valueadd>
                                      <!--- if there is a change in price because of this option --->
                                      <cfif url.optionid eq opts.optionid>
                                        <option value="#opts.optionid#" selected>#description#. Charge: $#_valueadd#</option>
                                        <cfelse>
                                        <option value="#opts.optionid#" >#description#. Charge: $#_valueadd#</option>
                                      </cfif>
                                      <cfelse>
                                      <cfif url.optionid eq opts.optionid>
                                        <option value="#opts.optionid#" selected>#description#</option>
                                        <cfelse>
                                        <option value="#opts.optionid#" >#description#</option>
                                      </cfif>
                                    </cfif>
                                  </cfloop>
                                </select>
                              </div>
                              <cfelse>
                              <input type="hidden" name="optionid"  id="optionid" value="0" >
                            </cfif>
                            <!--- End item options displays --->
                            </div>

                            <img src=/images/addtocart.gif d="a2cb"  onClick="javascript:goProcess('add')" >	   
							<input type="button" class="hidden" id="a2cw" value="Wait..." >
                          </cfif>
                          <!--- Angela --->
                          <INPUT TYPE="button" id="a2wl" class="greenbutton" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List" >
                          <br><br>
                          <a accesskey="Z" href="/wish.cfm"  >See Wish List</a><br>
                          <br>
                          
                          <!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#>Tell a Friend</a>--->
                          <!-- AddThis Button BEGIN -->
                          <script type="text/javascript" >var addthis_pub="anuppandey";</script>
                          <a href="http://www.addthis.com/bookmark.php?v=20" onClick="return addthis_open(this, '', '[URL]', '[TITLE]')" onMouseOut="addthis_close()" ><img src="http://s7.addthis.com/static/btn/sm-share-en.gif" width="83" height="16" alt="Bookmark and Share" style="border:0"/></a>
                          <script type="text/javascript" src="http://s7.addthis.com/js/200/addthis_widget.js" ></script>
                          <!-- AddThis Button END -->
                          <INPUT TYPE="hidden" NAME="cart" VALUE="#cart#" >
                          <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#" >
                          <input type="hidden" name="invent" value="#invent#" >
                          <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#" >
                          <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="
						   <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "">
				 #decimalformat(details.wholesaleprice)#
				 <cfelse>
				<CFIF status is 3>#decimalformat(details.saleprice)#<cfelse>#decimalformat(details.price)#</cfif></cfif>" >
                          <INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#" >
                          <!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
                          <cfelse>
                          <cfif cgi.server_name neq "63.135.126.234" >
Item Not Available.
                          Need it? Email us.
                          </cfif>
                        </cfif>
                      </CFIF>
                    </cfif>
                    <!--- cgi--->
                    <!---                Shop By<br>
                Item No.: <br>
                <input type="text" name="nextitem" value="" size="4" maxlength="4" >
                <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show" >--->
                  </div>
                  </div>
        			     <cfif category eq 'beads'>
	                    <a href='/semiprecious-stone-beads.cfm?#session.filter#' >Back to Gallery</a>
                    <cfelseif isdefined("session.filter")>
                    	<cfif len(session.filter)>
	                    <a href='/gemstone_jewelry_gallery.cfm?#session.filter#' >Back to Gallery</a>
					<cfelseif isdefined("session.gallery")>
	                    <a href='#session.gallery#' >Back to Gallery</a>
	                	</cfif>
                  </cfif>                <br /><br />
                  <cfif category is 'beads'>
                    <a href="../semiprecious-stone-beads.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                    <cfelse>
                    <a href="../gemstone_jewelry_gallery.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                  </cfif>
                  <br /><br /><cfoutput>
                  <a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >Ask Us</a></cfoutput><br /><br />
                  <!--- Help button --->
                  <a onClick="MM_showHideLayers('howto','','show');" style="color:maroon;margin-bottom:2px;" ><img src="/images/help.gif" border="0" vspace="0" hspace="0" align="absmiddle" width="43" height="30" ></a>
                  <!--- End help button --->
                </cfoutput>
                  <br><br>
       <!-- change this to darkgreen when putting image back -->
<!---                       <cfif isdefined("session.filterarray")>               
                  <cfif arraylen(session.filterarray) GT 1>
                    <cfset thispos =  filterarrayfind(newitem)>
                    <cfif thispos>
                      <cfif thispos EQ 1>
                        <cfset prevpos = arraylen(session.filterarray)>
                        <cfelse>
                        <cfset prevpos = thispos -1>
                      </cfif>
                      <cfset catp =	session.filterarray[prevpos][2]>
                      <cfset prevpos = session.filterarray[prevpos][1]>
                    </cfif>
                  </cfif>
                  <cfelse>
                  <cfset catp = 'jewelry'>
                  <cfset prevpos = newitem - 1>
                </cfif>
               <cfif isdefined("session.filterarray") >
                <cfif arraylen(session.filterarray) GT 2>
                  <cfset thispos =  filterarrayfind(newitem)>
                  <cfif thispos>
                    <cfif thispos EQ arraylen(session.filterarray)>
                      <cfset nextpos = 1>
                      <cfelse>
                      <cfset nextpos  = thispos + 1>
                    </cfif>
                    <cfset catn = 	session.filterarray[nextpos][2] >
                    <cfset nextpos = 	session.filterarray[nextpos][1]>
                    <cfset variables.ht = 90 />
                    <cfset imgname ="d:\inetpub\semiprecious\images\#catn#\#nextpos#.jpg" >
                    <cfx_imageinfo file="#imgname#" >
                    <cftry>
                      <cfif imageinfo.width GT imageinfo.height >
                        <cfset width1 =  90>
                        <cfset ht = round((imageinfo.height*90)/imageinfo.width)>
                        <cfelse>
                        <cfset ht =  90>
                      </cfif>
                      <cfset nimg = "/images/#catn#/#nextpos#.jpg" >
                      <cfcatch type="any" >
                        <cfset ht =  "" >
                        <cfset nimg = "/images/#catn#/thumb/#nextpos#.jpg" >
                      </cfcatch>
                    </cftry>
                    <cfset nimg = "/images/#catn#/#nextpos#.jpg" >
                    <cfif category neq 'beads'>
                      <cfoutput><a href='/jewelry_item.cfm/#nextpos#_#catn#.htm?thiswidth=#width#'><img  src="/images/#catn#/thumb/#nextpos#.jpg" border="1"  name="nimg" hspace="0" vspace="0"  alt="Next" height="#variables.ht#"   ></a></cfoutput>
                    </cfif>
                  </cfif>
                  <cfelse>
                  <cfset nextpos = prevpos>
                  <cfset catn = 'jewelry'>
                </cfif>
                <cfelse>
                <cfset nextpos = newitem + 1>
                <cfset catn = 'jewelry'>
              </cfif>
--->        
              <!--- End wholesalers next image --->
          </td>
             <!--- End right side? --->
			  <!--- 4th column --->
                <cfparam name=category default="jewelry" >
                <cfparam name=numbershow default=6>
                <cfif category is "pendants" or category is "necklaces" >
                  <cfset numbershow=4>
                </cfif>
                <cfquery name="findGroup" datasource="gemssql" >
Select top 1 groupname from itemsbyGroup where itemid=#itemnumber#
</cfquery>
                <cfquery name="groupitems" datasource="gemssql" >
Select top #numbershow# itemID from itemsBygroup, items where itemsbygroup.itemid = newitem and GroupName='#findGroup.groupname#' <cfif category neq "All" >and category = '#category#'</cfif> and itemid <> #itemnumber# and inventory>0 order by itemid desc
</cfquery>
                <cfif groupitems.recordcount GT 0>
                  <td align="center" ><cfoutput>#findGroup.groupname# Items<br></cfoutput><cfoutput query="groupitems" ><a href=detail.cfm?newitem=#itemid#><img src=/images/#category#/thumb/#itemID#.jpg border=0 width=75></a><br>
                    </cfoutput><cfoutput><a href=/list.cfm?groupname=#findGroup.groupname#&category=#category#>More #findGroup.groupname# #category#</a>
					</cfoutput></td>
                </cfif>
                <!--- End 4th column --->
            
                </tr>
            </table>
          </CFFORM></TD>
      </tr>
      <cfif cgi.server_name neq "63.135.126.234" and cgi.server_name neq "www.ornamentscollect.com" >
        <tr>
          <td  align="center" >
          	<cfif stonename NEQ "" >
	              <a href='/<cfoutput>#stonename#</cfoutput>.htm'><i>Learn more about this and other semi precious stones</i></a>
            </cfif>
            </td>
        </tr>
        <tr><td align="center" >
        <!--- Footer --->
             <cfinclude template="/mainfooter.cfm" >
         <!--- End footer --->

        </td>
		</tr>
      </cfif>
      <!-- cgi -->
    </TABLE>
    <cfoutput>
      <script language="javascript" >
      	/*
	on 15 Mar 2010 Nitish: Did not find use of the id of any element
	being named by the use of variable 'folder'. so removed the code
	document.getElementById("#lcase(folder)#").style.color = "maroon";
  document.getElementById("#lcase(folder)#").style.textDecoration = "none" ;
 window.focus();
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;
*/
   if (document.getElementById('quantity') != null)
    { document.getElementById('quantity').focus(); }


</script>
    </cfoutput>
    <div  id="howto" style="visibility:hidden;position:absolute;top:90px;left:220px;color:#666600;background-color:white;z-index:2;width:300px;" >
      <div class="noticebox" >This page helps you to add an item to your cart. Enter the number of  pieces (1 or more) you wish to buy  in the text box shown before the 'Select' button and click on the 'Select' button. Your cart will be filled by the desired number of this item.  If the item is already there in the cart, the quantity in cart is updated to the number you have just entered. You will get the message of   item addition on top left.
        <ul>
          <li>Options:Before adding/changing the quantity please see if any options/modification  are available for the jewelry. Options are shown at the bottom of the picture and are<span class="optionsinline" >highlighted in this color</span>.
            If options are available you may select an option, options are not always compulsory.</li>
          <li>To remove an item from your cart enter the number 0 (Zero).</li>
        </ul>
      </div>
      <a onClick="MM_showHideLayers('howto','','hide');" style="color:red;" >Close Help</a>
	  </div>
</div>
    </BODY>
<footer>
<cfif len(cart_msg)><!--- cart msg has length only if an item add operation has been attempted on this page --->
<cfoutput>

<script   language="javascript" >
//alert("#cart_msg#");
location.href="##instock";
</script>
</cfoutput>
</cfif></footer>
    </HTML>
<cfcatch type="any">
<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
