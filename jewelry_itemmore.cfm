<cfif cgi.SERVER_NAME contains 'laptop' >
	<cfset session.cart = 'bagcart.cfm' />
<cfelse>
	<cfset session.cart = '#session.country#cart.cfm' />
</cfif>
<cftry>
<cfsilent>
	<CFPARAM NAME="country" DEFAULT= "" />
	<CFPARAM NAME="designer" DEFAULT= "" />
	<CFPARAM NAME="session.gallery" DEFAULT= "gemstone_jewelry_gallery.cfm" />
	<CFPARAM NAME="session.filter" DEFAULT= "sortorder=datetaken" />

	<cfparam name="session.ajaxcheck" default="0" />
	<cfset session.ajaxcheck=0 />

	<CFPARAM NAME="description" DEFAULT="" />
	<CFPARAM NAME="Price" DEFAULT= "1000" >
	<CFPARAM NAME="width" DEFAULT= "" >
	<cfparam name="pimg" default="" >
	<cfparam default="0" name="valueadd" >
	<cfparam name="status" default="0" >

<cfparam name="catp"  default="jewelry" >
<cfparam name="catn"  default="" >
<cfparam name="nimg" default="" >
<cfparam name="url.optionid" default="0" >
<cfparam name="url.existqty" default="1" type="numeric" >
<cfparam name="url.quantity" default="#url.existqty#" >
<CFPARAM NAME="SalePrice" DEFAULT= "" >
<CFPARAM NAME="category" DEFAULT= "" >
<CFPARAM NAME="subcategory" DEFAULT= "" >
<CFPARAM NAME="stonename" DEFAULT= "" >
<CFPARAM NAME="NameID" DEFAULT= "" >
<cfif isdefined("url.newitem")>
  <cfset url.itemnumber = url.newitem>
</cfif>
<cfparam name="itemnumber" default="0" >
<cfparam name="session.screenwidth" default="833" type="numeric" >
<CFPARAM NAME="cart" DEFAULT="" >
<CFPARAM NAME="itemnumber" DEFAULT="" >
<CFPARAM NAME="invent" DEFAULT="" >
	<cfparam name="title" default="Semiprecious Silver Jewelry - Peridot, Amethyst...variety of necklaces, bracelets, pendants" >
<CFPARAM NAME="editcart" DEFAULT="" >
<CFPARAM NAME="url.filter" DEFAULT="" >

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

<!--- This is set up to differentiate between local test environment and
the web environment --->

<CFPARAM name="stopshipdate" default="07/14/08" >
<CFPARAM name="nextshipdate" default="7/22/08" >



<cffunction name="filterarrayfind" output=True>
  <cfargument name="a" >
  <cfloop from="1" to="#arraylen(session.filterarray)#" index="idx" >
    <cfif session.filterarray[idx][1] eq a>
      <cfreturn idx>
    </cfif>
  </cfloop>
  <cfreturn 0>
</cffunction>

<cfset pattern = #cgi.PATH_INFO#>
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
		  Select grouping, itemnumber, size, weight, style, color, storage, imagelink, inventory, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, subcat2, cat, morepics from 
		  items where newitem=#itemnumber# 
	  </cfquery>
	  <cfif session.mail is "scorpionitish@yahoo.com" or 1>
	  <cfdump var="#details#" />
	  </cfif>
	  <cfif not (details.recordcount is 0)>
		   <cfquery name="getGroups" datasource="gemssql" >
				Select distinct groupname from itemsbygroup where itemid=#itemnumber#
			</cfquery>

		  
	  <cfif session.bulkbuyer.id neq ""  >
			    <CFSET status = details.status>
		    <cfif isnumeric(details.wholesaleprice)>
				      <CFSET price=details.wholesaleprice>
		      <cfelse>
				      <cfset price = details.price/2 />
		    </cfif>
				<cfset recoprice = details.price />
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
		    <cfset description = description & '<br /><font color=gray>Our Jewelry is all hand-made. Silver used is 92.5 sterling silver unless otherwise noted</font>'>
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
	<cfoutput>  <cfif cgi.server_name contains 'wholesale'>
Wholesale
  </cfif>
  		 #subcategory#
  <cfif details.subcat2 neq "" >
    & #details.subcat2#
  </cfif>
  #category#
  </cfoutput>
  <cfloop query="getgroups" >
    <cfoutput>#groupname#</cfoutput>
  </cfloop>
  <cfoutput>
  #details.color# gem stone #details.style# #category# #itemnumber#
</cfoutput>  </cfsavecontent>
	  </cfif>

  <cfelse>
	  <Cfset category = "" >
	  <cfset itemnumber  = "" >
	  <cfset newitem = 1009>
</cfif>

</cfsilent>
<cfset cart_msg= "" /><!--- javacsript at bottom of page is triggered the moment we have a cart msg (checks length). The 
javascript lowers the page so that the message is in focus. This javascript is thus needed if we are putting the message below the image --->
<cfif isdefined("form.bought") or url.quantity is 0 > <!--- we are using url.qty = 0 to signfigy attemp to remove this item --->
	<cfif isdefined("form.bought")>
		<cfinvoke method="additem" attributecollection="#form#" component="cartcontrol.cartmonitor" returnvariable="added"  />
	<cfelse>
		<cfinvoke method="additem" attributecollection="#url#" component="cartcontrol.cartmonitor" returnvariable="added"  />
	</cfif>
<cfset width = 'thumb' /> 
	<cfset what_happened = added.response.newitem.qtyadded.XmlText  />
	<cfif  what_happened LT 0>
		<cfset cart_msg="Cannot add any more of this item to your cart" />
	<cfelseif what_happened is 0 >
		<cfset cart_msg="Selected Design Removed from your cart" />
	<cfelse>
		<cfset cart_msg= what_happened & " Added to Cart" />
	</cfif>
</cfif>
 

<!--- item added to cart --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
<HEAD>
<cfoutput>
  <TITLE>#titlecase(title)#</TITLE>
<script language="JavaScript" src="/js/global.js"></script>
<script language="JavaScript" src="/js/mag.js"></script>
<style type="text/css">     
div.mojomagnify_zoom {
	position : absolute;
	width : 150px;
	height : 150px;
	overflow : hidden;
	cursor : crosshair;
}

div.mojomagnify_border {
	position : absolute;
	border : 1px solid ##EFDDEC;
	width:150px;
	height:150px;

}
img.mojomagnify_img {
	padding : 0px;
	border : 0px;
}
div.mojomagnify_zoom a {
	cursor : crosshair;
}     
     </style>
	 <cfif len(session.bulkbuyer.id) >

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

<BODY >
		  <cfinclude template="/#session.country#/header.cfm" >
	  	    <h3>Sorry, nothing found, that was the last record for the selection Please go back.</h3>
			</div>
		 
	
  <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px" > 
    <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;" > 
    <strong>Designs</strong><br />
    </span> <a href="showearrings.cfm" >earrings</a> <br />
    <a href="shownecklaces.cfm" >necklaces</a><br />
    <a href="showbracelets.cfm" >bracelets</a> <br />
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
  <br />
  If you were trying to add an item to the shopping cart then make sure you 
  clicked on the 'Looks Good' button. Hitting 'Enter' on your keyboard can 
  cause error.Browser
    <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px" > 
      <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;" > 
      <strong>Designs</strong><br />
      </span> <a href="showearrings.cfm" >earrings</a> <br />
      <a href="shownecklaces.cfm" >necklaces</a><br />
      <a href="showbracelets.cfm" >bracelets</a> <br />
      <a href="showpendants.cfm" >pendants</a> </p> </div>
</div>
<cfinclude template="mainfooter.cfm" >

</body>
</html>
<CFABORT>
<cfelse>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >


<meta name="description" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory#</cfoutput><cfloop query="getgroups" >
<cfoutput> #groupname# </cfoutput></cfloop> <cfoutput>#category#: #details.description#</cfoutput>. We are in Austin TX and India" >
<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory# #category#,</cfoutput><cfloop query="getgroups" ><cfoutput> #groupname# #subcategory#  #category#,</cfoutput></cfloop><cfoutput> <cfif details.color contains "," >multicolor<cfelse>#details.color#</cfif> stone #category#</cfoutput>" >
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
<table width="906px" cellpadding="0" style="margin-top:2px;" cellspacing="0" >
<tr valign=top>
  <td cellpadding="0" width="140px" ><!--- BEGIN LEFT SIDE STUFF --->
  <cfset leftgemstonedisplay="inline" />
   <CFINCLUDE TEMPLATE="/leftmenus.cfm" >
	<!--removed as per Ravi's instructions on 10 May-->
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
          <CFFORM ACTION="##jewelry_top" METHOD="POST" NAME="wishbuy"  style="display:inline;" >
          <cfoutput>
            <input type="hidden" name="ajaxcheck" value="#session.ajaxcheck#"  id="ajaxcheck"/>
            </cfoutput>
            <table  width="750px" bgcolr="#ff7777" cellspacing="0" cellpadding="0" border="0"  align="center"  >
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
					
						<div style="display:block;border: 0px ##DDD solid;;position:relative;z-index:1;" id="zoomarea"   align="center" >
							
							<h2>	<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif>#titlecase(details.subcat)# #titlecase(details.grouping)# 
						<cfif details.subcat2 neq ""> #titlecase(details.subcat2)#</cfif> 
						<cfif details.cat neq 'healing'>#titlecase(left(details.cat, len(details.cat)-1))#</cfif>
						</h2>
						<cfif len(cart_msg)>
								<Div id="cart_summary" style="height:18px;margin-top:33px;border:1px solid pink;padding:2px 1px 1px 1px;">
					
									<span style="background-color:##DDDDDD;;padding:2px;color:black;font-weight:bold;">#cart_msg#&nbsp;</span>[Cart Total: #format(session.grandtotal)#] <span   style="positio:absolute;top:10px;left:2px;z-index:1;background-color:transparent;" > 
                          <a class="LOGIN_link" href='#session.gallery#?#session.filter####newitem#_anchor' style="text-decoration:underline;" >&larr; Back to Gallery</a> 
                      </span>
								| <span class="" style="color:black;padding:2px;"><a href="/#session.cart#?cartid=#session.cartid#"   onClik="goProcess('cart summary');return;">View Your Cart &rarr;</a></span></Div>
				<cfelse>
				         <img  src="/images/spacer_.gif" height="240px;" style="float:left;height:200px;width:1px;display:inline;" />
                   		 </cfif> 
                    <img id="mainimage" style="display:block;" src ='/images/#folder#/#width#/#imagename#'   alt="unique #subcategory# #category# Jewelry"  border="0" />
					
					<cfif isdefined("url.rating") or session.mail is application.admin_email>
					<table  width="200px" cellspacing="0" style="position:absolute;top:2px;z-index:2;right:3px;background-color:white;" cellpadding="1" border="0" align="right">
				<tbody><tr><!-- TD align="left" width=8>&nbsp;</TD -->
				<td width="" align="left" style="padding-top: 3px; padding-bottom: 3px;background-color:white;background-color:transparent" class="side_link" id="poll_items">Rate It &rarr;</td>
				<td nowrap="" width="" valign="top" align="right" style="background-color:transparen;">
						<cfoutput>
							<img onclick="rate_item( 1,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_1" title="Extremely Poor" />
							<img onclick="rate_item( 2,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_2" title="Poor" />
							<img onclick="rate_item( 3,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_3" title="OK" />
							<img onclick="rate_item( 4,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_4" title="Good" />
							<img onclick="rate_item( 5,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_5" title="Excellent" />
						</cfoutput>
				</td></tr></table>
			</cfif>
</div>

</cfoutput>
					
					
                    <!---  <br style="clear:both" >--->
                    <!--- Display thumbnails if we have more than one image --->
                    <cfif details.morepics GT 0>
                      <div style="border: 1px gray ridge;padding-top:4px;background-color:#EEE" align="center" > 
                        <cfoutput> <img  src ='/images/#folder#/<CFIF #NameID# is "" >#newitem#.jpg<CFELSE>#NameID#.jpg</CFIF>'  alt="unique #subcategory# #category# Jewelry"   height="70px" border="1" style="cursor:pointer" onMouseOver="swapMainImage('/images/#folder#/#imagename#');"  alt='unique #subcategory# #category# Jewelry' > 
                          <cfloop index="picCount" from="1" to=#details.morepics#>
                            <CFIF #NameID# is "" >
                              <cfset imagename= newitem & "-" & picCount & ".jpg" />
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
                   <cfif not len(width)>  
				    <cfif details.morepics eq 0 or details.morepics eq "" >  
                      <img style="float:left;margin-left:4px" src=/images/#category#/thumb/#newitem#.jpg />
                      </cfif>
                      
                      	<div align="justify"  >
                        <a href=/images/pictureonly.cfm?category=#category#&itemid=#newitem#><img src=/images/magglass.jpg border=0 width="25" height="24" ></a><font color="black" face="Verdana, Arial, Helvetica, sans-serif" >
                      <cfif details.subcat neq 'wood'>
                          #ucase(subcategory)# #ucase(details.subcat2)#
                          <cfloop query="getgroups" >
                            #Ucase(groupname)#
                          </cfloop>
                          <cfif category neq 'healing'>
                            #ucase(left(Category,len(category)-1))#
                            <cfelse>
                            #ucase(category)#
                            
                          </cfif>
                         
                          :
                        </cfif>
                        <CFIF invent LT 1 and details.storage neq 'angela'>
This is out of stock, we restock most items within 6 weeks                          
                        </cfif>
                        #description#<br />
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
							  (US sizing)<span class="error1">[</span>Please note we do not keep all sizes in stock. Orders for a specific size may require us to undertake customisation leading to a small delay<span class="error1">]</span>
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
** Unless specified differently, all strands are 16 inches.                          <br />
                          <cfif details.size neq "" and details.size GT 0>
Approx. number of beads calculate out to:                            #round(evaluate(16*25.4/details.size))#(this is auto calculated based on bead size entered and 16 inch strand length and can be wrong if length of strand is different or size of bead is not along the strand length)
                          </cfif>
                          <br />
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
                      </cfif>
					      </cfoutput>
                        <br /></td>
                    </tr> 
                     
                  </table>
                  <!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:" ><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;" >Customize/Modify</span></a>--->
                  
	<cfquery datasource="gemssql" name="checkcluster">
	select  itemid from styles,items where  itemid = #itemnumber#
	</cfquery>
	<cfoutput>
	
	&nbsp;</cfoutput>
	
   <cfif checkcluster.recordcount gt 1>
    <!--- include file to display clustered items, by Anup--->
	
    	<cfquery datasource="gemssql" name="getcluster">
    	select top 12 styles.itemid , styles.cat,inventory from styles, items where items.newitem=itemid and styleid =
    	(select  max(styleid) from styles where itemid = #itemnumber#) and itemid <>#itemnumber#
    	</cfquery>
		<cfif getcluster.recordcount gt 0 >
        <b><font color="brown">YOU MAY ALSO LIKE THESE &dArr;</font></b>
		<div style="position:relative;">
        <div id="zoom_like_these" style="position:absolute;top:0px;left:363px;width:250px;text-align:center;padding:2px;"></div>
		<div id="easy_string" style="display:none;"><div style="width:inherit;text-align:center;cursor:pointer" class="grayplacard" onClick="document.getElementById('zoom_like_these').innerHTML='';">Close Zoom Window</div>
		<div style="width:inherit;text-align:center;" class="component_box"><strong>To Buy Click on Thumb Nail or Picture Below</strong></div>
		</div> 
        <table border=0 cellpadding=4>
        <cfset coll=0>
        <tr>
        <cfoutput query="getcluster">
        <cfset coll=coll+1>
        <td align="center">
        <a title="click to buy this design" href="/jewelry_item.cfm?newitem=#itemid###jewelry_top" onouseOver="document.getElementById('zoom_like_these').innerHTML=document.getElementById('easy_string').innerHTML + ' <a href=\'/jewelry_item.cfm?newitem=#itemid###jewelry_top\'><img src=\'/images/#cat#/#itemid#.jpg\' /></a>';" ><img title="click to buy this design" alt="click here to buy this design" src="/images/#cat#/thumb/#itemid#.jpg" border=0 width=100><cfif inventory lt 1><br /><i>sold out</i></cfif></td><cfif coll is 4></tr><tr><cfset coll=0></cfif>
        </cfoutput>
        <cfset missingTDs=#evaluate(4-coll)#>
        <cfloop from="1" to="#missingtds#" index=k><td></td></cfloop></tr>
        </table>	
        </cfif>
	</cfif>	

                  <br />
                  Check out our <a href=/designer_jewelry_angela.cfm>designer jewelry</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="color:maroon;font-size:11px;" >For more information <a href="/contactus.cfm?newitem=<cfoutput>#newitem#&folder=#folder#</cfoutput>" >Ask Us</a></span>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           </td></tr></table>
                  <!--- End Item Description --->
                  <!--- End main image ---></td>
                   <!--- Right side start --->
                <cfoutput>
                <td valign="top" align=center width="140px" ><strong>Item Id: #newitem#</strong><br />
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
                    <br />
                    <cfif category is 'bags'>
                      <a href="/editbags.cfm?newitem=#newitem#"  />EDIT</a>
                      <cfelse>
                      <a href="/admintools/edititem.cfm?newitem=#newitem#"  />EDIT</a>
                    </cfif>
                  </cfif>
                  <!--- End next/edit button --->
                 <br />
                  <br />
                  <div class="details" align="center" >
                    <CFIF price eq 0 and (len(session.bulkbuyer.id) is 0 )>
						Not for retail sale
                      <CFELSEif len(session.bulkbuyer.id) and price eq 0>
                      Not available for wholesale
                      <cfelse>
                      <cfif status eq 0 or status eq 3 >
                        <font color="black" >
                        <cfif details.basecost >
							 Store Price
							#format(7.23*details.basecost/application.exchangerate)# </cfif>
							<cfif len(session.bulkbuyer.id)>
							<br />Wholesale
                          <cfelse>
                          <cfif cgi.server_name neq "63.135.126.234" >
							<br>Your Price
                            <cfelse>
                            Through Agent
                          </cfif>
                        </cfif>
                        :<b>#format(price)#</b>
						</FONT>
						<br />
                        <cfif cgi.server_name neq "63.135.126.234" >
                          <cfif len(session.bulkbuyer.id)>
							<CFIF  status eq 3>
                              <b><font color="red" >Sale!</font>:#format(saleprice)#</b><br />
                            </CFIF>
                          </cfif>
                          <cfif details.inventory GT 0>
                            <cfif session.country is "india" >
								Ships in 24 hrs
                              <cfelse>
                              <cfif details.storage contains 'IN'>
                                <span style="color:red;;text-decoration:underline;cursor:pointer;" onClick="document.getElementById('delivery').innerHTML=document.getElementById('del').innerHTML;" >Delivery?</span>
								<div id="delivery"><span id="del" style="display:none;">Regular: <cfoutput>#dateformat(dateadd('d',12,now()),"d-mmm")#<br />
		Priority: #dateformat(dateadd('d',10,now()),"d-mmm")#<br />
		Express: #dateformat(dateadd('d',8,now()),"d-mmm")#<br /></cfoutput></span></div>
                                <cfelse>
        <span style="color:green;;text-decoration:underline;cursor:pointer;" onClick="document.getElementById('delivery').innerHTML=document.getElementById('del').innerHTML;" >Delivery?</span>
		                        <br />
		<div id="delivery"><span id="del" style="display:none;">Regular: <cfoutput>#dateformat(dateadd('d',8,now()),"d-mmm")#<br />
		Priority: #dateformat(dateadd('d',7,now()),"d-mmm")#<br />
		Express: #dateformat(dateadd('d',5,now()),"d-mmm")#<br /></cfoutput>

		
</span></div>
		                              </cfif>
                            </cfif>
                          </cfif>
                          <div id="ajaxoutput" align="center" >
                          <span id="erroraddingitem"  class="hidden" >Select  Failed!</span>
                          <INPUT TYPE="hidden" NAME="bought" VALUE="buy" >
                          <!---       <CFIF invent LT 1 and details.storage does not contain 'CM'><font color="##FF9966" >4 week delivery</font><cfelse>--->
                          
                          <!---</cfif>--->
                          <br />
                          <CFIF invent LT 1>
Sold Out
                            <cfelse>
                            
                          
                           <a name="instock">
                           Quantity</a>: <select id="quantity" style="margin-bottom:2px;" name="quantity" >

<option value="0" >0</option>
<cfloop from="1" to="#invent#" index="j">
        <cfif url.quantity eq j>
<option value="#j#" selected >#j#</option>
<cfelse>
<option value="#j#" >#j#</option>
</cfif>
</cfloop></select>
 <!--- <CFINPUT  type="text" SIZE="1"  id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" onclick="this.focus();" > --->
                            <br />
                            <br />
                            <!--- Display item options --->
							<cfif len(session.bulkbuyer.id) and optcount>
							<cfswitch expression="#category#">
							<cfcase value="rings">
							US Sizes 6 to 10
							</cfcase>
							</cfswitch>
							
							<cfelse>
							
                            <cfif optcount >
                                           <cfquery datasource="gemssql" name="opts" >
                  select description, optionid, valueadd from options where itemid               = #newitem#  
                  </cfquery>
                              <cfif opts.recordcount >    
							   <div  class="optionsinline" align="right" style="width:100%;horizontal-align:right" >
                            
							     <select id="optionidpulldown" name="optionid"   >
                              <cfif opts.recordcount GT 2 >    
						
								  <cfloop query="opts" >
                                    <cfif valueadd>
											    <cfif len(session.bulkbuyer.id) > <!--- do not do this math in SQL as it rounds of to an integer --->
													<cfset _valueadd = valueadd/2 />
												<cfelse>
													<cfset _valueadd = valueadd />
									
												</cfif>
		                                      <!--- if there is a change in price because of this option --->
		                             	         <cfif url.optionid eq opts.optionid>
		                                 	       <option value="#opts.optionid#" selected>#description# Adds: $#_valueadd#</option>
		                                    	    <cfelse>
		                                 	       <option value="#opts.optionid#" >#description# Adds: $#_valueadd#</option>
		                                	      </cfif>
                                      <cfelse>
		                                    	  <cfif url.optionid eq opts.optionid>
		                                    	    <option value="#opts.optionid#" selected>#description#</option>
		                                    	    <cfelse>
		                                    	    <option value="#opts.optionid#" >#description#</option>
		                                  	    </cfif>
                                    </cfif>
                                  </cfloop>  
								  <cfelse>
								  <option value="#opts.optionid[1]#" >#opts.description[1]#</option>
								   <cfif opts.valueadd[2]>
											    <cfif len(session.bulkbuyer.id) > <!--- do not do this math in SQL as it rounds of to an integer --->
													<cfset _valueadd = opts.valueadd[2]/2 />
												<cfelse>
													<cfset _valueadd = opts.valueadd[2] />
									
												</cfif>
		                                      <!--- if there is a change in price because of this option --->
		                             	           <option value="#opts.optionid[2]#" selected>#opts.description[2]# Adds: $#_valueadd#</option>
		                                    	 
                                      <cfelse>
		                                    	    <option value="#opts.optionid[2]#" selected>#opts.description[2]#</option>
		                              </cfif>
								  </cfif> 
								   </select>  </div>
							  <cfelse>
								      <input type="hidden" name="optionid"  id="optionid" value="0" >
							  </cfif>
                            
                            
                              <cfelse>
                              <input type="hidden" name="optionid"  id="optionid" value="0" >
                            </cfif>
                            <!--- End item options displays --->
                           </cfif> </div>
<input style="width:100px;height:21px;margin-top:4px;border:1px purple solid;" class="greenbutton" type=submit value="Add to Cart" name="Add to cart">

    <!---                        <img src=/images/addtocart.gif d="a2cb"  onClick="javascript:goProcess('add')" >   --->
							<input type="button" class="hidden" id="a2cw" value="Wait..." >
                          </cfif>
                          <!--- Angela --->
						  <INPUT TYPE="button" id="a2wl" style="margin-top:4px;border:1px purple solid;" class="greenbutton" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List" >
                          
                          <a style="display:block;margin-top:4px;width:100px;height:20px;border:1px purple solid ;text-decoration:none;" class="greenbutton" accesskey="Z" href="/wish.cfm"  >See Wish List</a><br />
                          
                          
                          <!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#>Tell a Friend</a>--->
                          <INPUT TYPE="hidden" NAME="cart" VALUE="#session.cart#" >
                          <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#" >
                          <input type="hidden" name="invent" value="#invent#" >
                          <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#" >
                          <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="
						   <cfif  len(session.bulkbuyer.id)>
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
                    <!---                Shop By<br />
                Item No.: <br />
                <input type="text" name="nextitem" value="" size="4" maxlength="4" >
                <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show" >--->
               <span class="component_box" style="width:100px;margin-top:4px;">
        	            <a href='#session.gallery#?#session.filter####newitem#_anchor' class="login_link">Back to Gallery</a>
	                     </span>           <br /><br />   
				  <!-- AddThis Button BEGIN -->
                          <script type="text/javascript" >var addthis_pub="anuppandey";</script>
                          <a href="http://www.addthis.com/bookmark.php?v=20" onClick="return addthis_open(this, '', '[URL]', '[TITLE]')" onMouseOut="addthis_close()" ><img src="http://s7.addthis.com/static/btn/sm-share-en.gif" width="83" height="16" alt="Bookmark and Share" style="border:0"/></a>
                          <script type="text/javascript" src="http://s7.addthis.com/js/200/addthis_widget.js" ></script>
                          <!-- AddThis Button END -->
               <br /><!--- unclutter the zoom page
                  <cfif category is 'beads'>
                    <a href="../semiprecious-stone-beads.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                    <cfelse>
                    <a href="../gemstone_jewelry_gallery.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                  </cfif> --->
                  <br /><br /><cfoutput>
                  <a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >Ask Us</a></cfoutput><br />
                  <!--- Help button --->
                  <a onClick="MM_showHideLayers('howto','','show');" style="color:maroon;margin-bottom:2px;" ><img src="/images/help.gif" border="0" vspace="0" hspace="0" align="absmiddle" width="43" height="30" ></a>
                  <!--- End help button --->
                </cfoutput>
                  <br />
			              </div>
                  </div>
        	   
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
                 <td align="center" >&nbsp;&nbsp;&nbsp;&nbsp;<a href=/cart.cfm><img src=/images/add_to_cart_icon.jpg></a><br>&nbsp;&nbsp;&nbsp;&nbsp;<b>CART</b><br><br>
				<cfparam name=category default="jewelry" >
                <cfparam name=numbershow default=6>
                <cfif category is "pendants" or category is "necklaces" >
                  <cfset numbershow=4>
                </cfif>
                <cfquery name="findGroup" datasource="gemssql" >
Select top 1 groupname from itemsbyGroup where itemid=#itemnumber# 
</cfquery>
                <cfquery name="groupitems" datasource="gemssql" >
Select top #numbershow# itemID from itemsBygroup, items where itemsbygroup.itemid = newitem and GroupName='#findGroup.groupname#' <cfif category neq "All" >and category = '#category#'</cfif> and itemid <> #itemnumber# and inventory>0
</cfquery>
                <cfif groupitems.recordcount GT 0>
                 <cfoutput>More #findGroup.groupname# Items<br /></cfoutput><cfoutput query="groupitems" ><a href=detail.cfm?newitem=#itemid#><img src=/images/#category#/thumb/#itemID#.jpg border=0 width=75></a><br />
                    </cfoutput><cfoutput><a href=/list.cfm?groupname=#findGroup.groupname#&category=#category#>More #findGroup.groupname# #category#</a>
					</cfoutput>
                <cfelse> <!--- not in any theme, show same stone items in different categories--->
				<cfquery name="othercatbestsellers" datasource="gemssql" >
				Select top 6 newitem, cat from items where subcat='#subcategory#' and cat <>'#details.cat#' and inventory>0 order by num_sold desc
				</cfquery>
				 <cfoutput>More #details.subcat# Items<br /></cfoutput>
				 <cfoutput query="othercatbestsellers" ><a href=detail.cfm?newitem=#newitem#><img src=/images/#othercatbestsellers.cat#/thumb/#newitem#.jpg border=0 width=75></a><br />
                    </cfoutput><cfoutput><a href=/jewelry.cfm?subcat=#subcategory#>More #subcategory# Jewelry</a>
					</cfoutput>
                
				</cfif>
                <!--- End 4th column --->
            </td>
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
<script type="text/javascript">
 <!---     <cfoutput>MojoMagnify.makeMagnifiable(document.getElementById("mainimage"),"http://www.semiprecious.com/images/#folder#/#newitem#.jpg");</cfoutput>--->
    </script>
<cfif 1 or len(cart_msg)><!--- cart msg has length only if an item add operation has been attempted on this page --->

<!---<script   language="javascript" >
//alert("#cart_msg#");
location.href="#jewelry_top";
</script>
--->
</cfif></footer>
    </HTML>
<cfcatch type="any">
<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
