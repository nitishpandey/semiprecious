<cfparam name="itemnumber" default="0" >
<cfset url.newitem=itemnumber>
<cfset newitem=itemnumber>
<cfif itemnumber is "0">
  <FORM action='/makeup.cfm' method='get' >
    If you have the jewelry item number handy please fill it and click on 'Details':
    <input type='text' name='itemnumber' size='5'>
    <INPUT type='submit'  class="greenbutton" value='details'>
  </form>
<cfabort>
<cfelse>

<cfif session.country is 'india'>
<cfinclude template="zoomdiv.cfm" />
<cfelse>
<cftry>
<cfset summary = " " />
<cfsilent>
	<CFPARAM NAME="orderonrequest" DEFAULT= "1" />
	<CFPARAM NAME="country" DEFAULT= "" />
	<CFPARAM NAME="designer" DEFAULT= "" />
	<cfparam name="session.address.country_code" default="" />	
	<CFPARAM NAME="session.gallery" DEFAULT= "gemstone_jewelry_gallery.cfm" />
	<CFPARAM NAME="session.filter" DEFAULT= "sortorder=datetaken" />
	<cfparam name="style_for_added" default="" />	
	<CFPARAM NAME="description" DEFAULT="" />
	<CFPARAM NAME="Price" DEFAULT= "1000" >
	<CFPARAM NAME="width" DEFAULT= "" >
	<cfparam name="pimg" default="" >
	<cfparam default="0" name="valueadd" >
	<cfparam name="status" default="0" >
<cfparam name="url.optionid" default="0" >
<cfparam name="url.quantity" default="1" type="numeric" >
<cfparam name="url.existqty" default="0" >
<CFPARAM NAME="SalePrice" DEFAULT= "" >
<CFPARAM NAME="category" DEFAULT= "" >
<CFPARAM NAME="subcategory" DEFAULT= "" >
<CFPARAM NAME="stonename" DEFAULT= "" >
<CFPARAM NAME="NameID" DEFAULT= "" >
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
	<!---
	<CFQUERY DATASOURCE="gemssql" NAME="stats" >
		update itemstats set zoom=zoom+1 where itemid =#newitem#
	</cfquery>
	--->
	  <CFQUERY datasource="gemssql" name="details">
		  Select grouping, itemnumber, size, weight, style, color, storage, imagelink, inventory,
			 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description,
			  NameID, newitem, subcat, subcat2, cat, morepics from 
		  items where   newitem=#itemnumber#
	  </cfquery>

		
		
		<cfquery name="getGroupsinmemory" datasource="gemssql" 		cachedwithin="#createTimespan(0,1,0,0)#">
				Select distinct groupname, itemid from itemsbygroup 
				</cfquery>
				
	  <cfif session.mail is "scorpionitish@yahoo.com" or 1>
	  <cfdump var="#details#" />
	  </cfif>

  
		
	  <cfif not (details.recordcount is 0)>
		
		 <cfquery name="getGroups" dbtype="query" >
				Select  groupname from getGroupsinmemory where itemid=#itemnumber#
			</cfquery>
		  <!--- <cfquery name="getGroups" dbtype="query" >
				Select groupname from getGroupsinmemory where itemid=#itemnumber#
			</cfquery>--->

		    <CFSET status = details.status>
	  <cfif session.bulkbuyer.id neq ""  >
		    <cfif isnumeric(details.wholesaleprice)>
				      <CFSET price=details.wholesaleprice>
		      <cfelse>
				      <cfset price = details.price/2 />
		    </cfif>
				<cfset recoprice = details.price />
		    <cfelse>
			    <CFSET price=details.price>
			     <cfif details.status eq 3>
				   <cfif details.saleprice > 0>
				      <CFSET SalePrice = session.sale_factor*details.saleprice>
					 <cfelse>
				      <CFSET SalePrice = session.sale_factor*0.8*details.price>

					 </cfif>
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
		    <cfset description = description & '<p><b>Metal:</b> <font color=gray>Silver used is 92.5 sterling silver unless otherwise noted</font><br><br>Our Jewelry is all hand-made.'>
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
	<cfinvoke method="cart_summary"  component="cartcontrol.cartmonitor" returnvariable="summary"  />
	<cfset width = 'thumb' /> 

<cfsavecontent variable="t"><cfoutput>
<a href="/jewelry_item.cfm?newitem=#newitem#">#titlecase(details.subcat)# #titlecase(details.grouping)# 
						<cfif details.subcat2 neq ""> #titlecase(details.subcat2)#</cfif> 
						<cfif details.cat neq 'healing'>#titlecase(left(details.cat, len(details.cat)-1))#</cfif></a></cfoutput>
						</cfsavecontent>
	<cftry>
	<cfset what_happened = added.response.newitem.qtyadded.XmlText  />
	<cfcatch type="any">
	<cfdump var="#added#">
	<cfabort /> 
	</cfcatch>
	</cftry>
	<cfif  what_happened is 0>
		<cfset cart_msg="Cannot add any more of " & t  />
	<cfelseif what_happened Lt 0 >
		<cfif what_happened GT -1000 >
			  <cfset kappa = -1*what_happened />
			<cfset cart_msg= kappa & " of " & t & " removed from cart" />
	       <cfelse>
			<cfset cart_msg= t & " removed from your cart" />
			</cfif>
	<cfelse>
	<cfsavecontent variable="style_for_added">
		<cfoutput>
		, .a#form.newitem#_#added.response.newitem.optionid.XmlText#
		</cfoutput>
		</cfsavecontent>
     <cflocation url="/#session.cart#?country=#session.address.country_code#&amp;secure=true&cartid=#session.cartid#" />
		<cfset cart_msg= what_happened & " of " & t & " added to cart" />
		<cfif trim(added.response.newitem.optionid.XmlText) neq '0'>
			<cfset cart_msg= cart_msg & " [Option "&  added.response.newitem.optionid.XmlText & "]" />
		</cfif> 
	</cfif>
	
</cfif>
<HTML>
<HEAD>
<cfoutput>
  <TITLE>#titlecase(title)#</TITLE>
<script language="JavaScript" src="/js/global.js?ver=1.2"></script>
<!---
<script language="JavaScript" src="/js/mag.js"></script>--->
<style type="text/css">     
<!--
<cfif isdefined("form.bought")>
.#form.newitem#_#form.optionid# {
	background-color:##FDFDFD;
}
</cfif>
.place_holder #style_for_added# {
padding-left:18px;font-weight:700;height:16px;background:url('/images/added.png') no-repeat scroll 0px 0px ##E6F8DD;padding-top:1px;
}

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
    --> </style>
	<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
<!-- 
	 <cfif len(session.bulkbuyer.id) >

	  <script type="text/javascript" src="/wholesalemenu.files/dmenu.js">
   </script>
   <cfelse>
  <script type="text/javascript" src="/newtopmenu.files/dmenu.js"></script>
   </cfif> 
  -->
  <script language="JavaScript" > 
vCurrentInventory = #invent#;
                     
						function swapMainImage(pImage)
						   { document.getElementById('mainimage').src = pImage; }

</script>
<!--- 
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
 --->
 <cfif cgi.server_name contains "wholesale">
<script language=JAVASCRIPT src="/javascript/wholesalezoom.js" type="text/javascript" ></script>
<cfelse>
<script language=JAVASCRIPT src="/javascript/#session.country#zoom.js" type="text/javascript" ></script>
</cfif>
 </cfoutput>
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
<cfelse>
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
<script language="JAVASCRIPT1.1" type="TEXT/JAVASCRIPT">
<cfoutput>
var cat = '#category#' ;
</cfoutput>

function processReqChange()
{

if (req.readyState == 4) {
		if (req.status == 200 ) {
//alert(req.readyState);
			good = 0;
			if (window.DOMParser) // our CFC is sending in xml disguised as text. this we had to do  because when we try to send in XML content (http header text/xml) then it creates problems for normal cfmx pages since then the browser believes everything else is also xml compliant
			{
document.getElementById('custom_state').innerHTML =req.responseText;
return;
			xmlDoc=parser.parseFromString(req.responseText,"text/xml");
			}
			else // Internet Explorer
			{
			xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false";
			xmlDoc.loadXML(req.responseText);
			} 
			if (xmlDoc)	{
				if (xmlDoc.documentElement)  // for mozilla we need to test for req.response itself and this one is for IE
				{
					good = 1;
				}
			}

			if ( good == 0 )
			{
				//document.getElementById("ajaxcheck").value  = 0 ;
				goProcess('add'); // that process basically submits the form for post to web
			}

	if (good == 1) {

				var	response = xmlDoc.documentElement;
                        }

			}
		}	
	return;
}

function custom_select(i,s)
{
var p = Math.random();

var url = '/customrequest/custom.cfc?method=custom_status&itemid='+i+'&category='+cat+"&status="+s +"&dcache="+p;
if (window.XMLHttpRequest) {
//alert('i called successfully');
  req = new XMLHttpRequest();
  req.onreadystatechange = processReqChange;
  req.open("GET",url,true);
  req.send(null);
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");
if (req) {
 //alert(url);
 req.onreadystatechange = processReqChange;
 req.open("GET",url,true);
 req.send();
         } 
     }

return;
}

</script>

</cfif>
	<cfif details.recordcount is 0>

<BODY >
		  <cfinclude template="/header#session.country#.cfm" >
	  	    <h3>Sorry, nothing found, that was the last record for the selection Please go back.</h3>
			</div>
		 
	
  <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px" > 
    <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;" > 
    <strong>Designs</strong><br />
    </span> <a href="/showearrings.cfm" >earrings</a> <br />
    <a href="/shownecklaces.cfm" >necklaces</a><br />
    <a href="/showbracelets.cfm" >bracelets</a> <br />
    <a href="/showpendants.cfm" >pendants</a> </p> </div>
  </body>
			</html>
		    <cfabort />
	<CFelseIF (category is "")>
	  <cfinclude template="/header#session.country#.cfm" >
	  
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
      </span> <a href="/showearrings.cfm" >earrings</a> <br />
      <a href="/shownecklaces.cfm" >necklaces</a><br />
      <a href="/showbracelets.cfm" >bracelets</a> <br />
      <a href="/showpendants.cfm" >pendants</a> </p> </div>
</div>
<cfinclude template="/mainfooter.cfm" >

</body>
</html>
<CFABORT>
<cfelse>


<meta name="description" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory#</cfoutput><cfloop query="getgroups" >
<cfoutput> #groupname# </cfoutput></cfloop> <cfoutput>#category#: #details.description#</cfoutput>. We are in Austin TX and India" >
<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory# #category#,</cfoutput><cfloop query="getgroups" ><cfoutput> #groupname# #subcategory#  #category#,</cfoutput></cfloop><cfoutput> <cfif details.color contains "," >multicolor<cfelse>#details.color#</cfif> stone #category#</cfoutput>" >
</CFIF>

<!--- 
<script language="JavaScript" src="/js/imageswap.js" ></script>
 --->

</HEAD>
<BODY  style="margin-top:0" >
<div align="center" >

<div align="center" >
		  <cfinclude template="/header#session.country#.cfm" >
	<!--- No category --->
	<!--- End no category --->
<table width="930px" id="container1" cellpadding="0"  cellspacing="0" >
<tr valign=top>
  <td CELLPADDING="0" width="142px" ><!--- BEGIN LEFT SIDE STUFF --->
  <cfset leftgemstonedisplay="inline" />

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
          <cfoutput>
            <input type="hidden" name="ajaxcheck" value="0"  id="ajaxcheck"/>
            </cfoutput>
            <table   bgcolr="#ff7777" cellspacing="0" cellpadding="0" border="0"  align="center"  >
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

                <table border="0" cellpadding="0" cellspacing="0" style="padding:1px" >
	                <tr  valign="middle" >
	                	<td valign="middle" align="center">
						<div style="display:block;border: 0px ##EDD solid;;position:relative;z-index:1;" id="zoomarea"   align="center" >
					<cfif not len(width)>
						 <span   style="positio:absolute;top:8px;left:2px;z-index:1;background-color:transparent;" > 
                         <a class="side_link" href='#session.gallery#?#session.filter####newitem#_anchor' style="text-decoration:underline;" >&larr;Back To Gallery</a></span>
					&nbsp;|<span style="color:black;">&nbsp; Item Id: #newitem# &nbsp;</span>|&nbsp;	<span   style="positio:absolute;top:8px;left:2px;z-index:1;background-color:transparent;" > 
                         <a class="side_link" href='/#session.cart#?country=#session.address.country_code#&amp;secure=zoom&cartid=#session.cartid#' style="text-decoration:underline;" >To Cart &rarr;</a></span>
						<h1   class="form_heading" style="color:black;">
						<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif>#titlecase(details.subcat)# #titlecase(details.grouping)# 
						<cfif details.subcat2 neq ""> #titlecase(details.subcat2)#</cfif> 
						<cfif details.cat neq 'healing'>#titlecase(left(details.cat, len(details.cat)-1))#</cfif>
						          
							</h1></cfif><table style="margin-top:1px;width:100%" cellpadding="1px;"><tr><td width="40%" align="center">
						<cfif len(cart_msg)>
								<Div id="cart_summary" style=";margin-top:2px;border:2px solid red;padding:2px 1px 1px 1px;">
									<span style="width:460px;display:inline;background-color:##FDFDFD;;padding:2px;color:black;font-size:1.2em;font-weight:bold;">#cart_msg#&nbsp; </span>&nbsp;
									</div> 
					<cftry>#summary#<cfcatch type="any"><cfset width = "" />	
					<img   id="mainimage" style="display:inline;" src ='/images/#folder#/#width#/#imagename#'   alt="unique #subcategory# #category# Jewelry"  border="0" />
				</cfcatch></cftry>  <div align="center" style="height:28px;">
						  <span id="cart_form" >&nbsp;
						  <span class="greenbutton" style="border-bottom: purple 2px outset; border-left: purple 2px outset; background-colo: white; width: 150px; height: 28px; border-top: black 2px outset;   font-weight: 800; border-right: purple 2px outset; padding-top: 4px; left: 2px; ">
						                  &nbsp;<a  href='#session.gallery#?#session.filter####newitem#_anchor'  >&nbsp;&nbsp;&larr; Back to Gallery</a>&nbsp;
						  </span> 
	                    <span   style="positio:absolute;top:8px;left:2px;z-index:1;background-color:transparent;" > 
                         <a class="side_link" href='/#session.cart#?country=#session.address.country_code#&amp;secure=true&cartid=#session.cartid###checkout' style="text-decoration:underline;" >To Cart&rarr;</a></span>  	<cfif not len(session.bulkbuyer.id) or (session.grandtotal GTE session.bulkbuyer.minamt) >
						
							<div style="display:none;"><span id="easy_form">	
							    <form action="/#session.cart#?country=#session.address.country_code#&amp;secure=true&cartid=#session.cartid###checkout" method="get" >
									<cfset country_msg = "Ship to Country" />
									<font size=+1><input type="submit" name="submit" style="border-left:1px solid black;border-top:1px solid black;border-bottom:1px solid purple;border-right:1px solid purple;color:black;background-color:##CAB;display:inline;" value="Select Country  &rarr; Then Click Here" />&nbsp;
									<cfinclude template="/includes/countries_drop_down.cfm" />
									</font>  
					  			</form>
					  			</span>
							</div>
					  
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">OR</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<span class="greenbutton" 
				style="border-bottom: purple 2px outset; border-left: purple 2px outset; background-colo: whit; width: 200px; height: 28px; border-top: black 2px outset;  font-weight: 800; border-right: purple 2px outset; padding-top: 4px; left: 2px; positio: absolute;"
				onClik="document.getElementById('cart_form').innerHTML=document.getElementById('easy_form').innerHTML;"  onClik="goProcess('cart summary');return;">&nbsp;<a title="Check Cart and start checkout" href="/#session.cart#?country=#urlencodedformat(session.address.country_code)#&amp;php=1.2210&amp;cartid=#session.cartid#" >Start Checkout &rarr;</a>&nbsp;
						  </span>
						  <cfelse>&nbsp;
						  <span class="error2"><span style="font-size:1.2em">To Checkout please shop for #format(session.bulkbuyer.minamt)#</span></span>
					  </cfif>
					  </span> 
						  </div>
						  	
					  
					  <cfelse>
				          
					   <div>  <img  src="/images/spacer_.gif" height="240px;" style="float:left;height:200px;width:1px;display:inline;" />
                   	<cfimage source="#application.rootfolder#\images\#folder#\#width#\#imagename#" action="info" structname="wd" />
					<cfif wd.height GT 450 >
					  <img  height="450px" id="mainimage" style="display:inline;" src ='/images/#folder#/#width#/#imagename#'   alt="unique #subcategory# #category# Jewelry"  border="0" />
					  <cfelse>
					<img   id="mainimage" style="display:inline;" src ='/images/#folder#/#width#/#imagename#'   alt="unique #subcategory# #category# Jewelry"  border="0" />
					  
					</cfif>	
					 </cfif> 
                    </div></td></tr></table>
					<cfif isdefined("url.rating") or session.mail is application.admin_email >
					<!-- <table  width="200px" cellspacing="0" style="position:absolute;top:2px;z-index:2;right:3px;background-color:white;" cellpadding="1" border="0" align="right">
				<tbody><tr> TD align="left" width=8>&nbsp;</TD 
				<td width="" align="left" style="padding-top: 3px; padding-bottom: 3px;background-color:white;background-color:transparent" class="side_link" id="poll_items">Rate It &rarr;</td>
				<td nowrap="" width="" valign="top" align="right" style="background-color:transparen;">
						<cfoutput>
							<img onclick="rate_item( 1,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_1" title="Extremely Poor" />
							<img onclick="rate_item( 2,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_2" title="Poor" />
							<img onclick="rate_item( 3,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_3" title="OK" />
							<img onclick="rate_item( 4,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_4" title="Good" />
							<img onclick="rate_item( 5,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_5" title="Excellent" />
						</cfoutput>
				</td></tr></table> -->
			</cfif>
</div></Div>

</cfoutput>
                   <!---  <br style="clear:both" >--->
              <!--- Display thumbnails if we have more than one image --->
                    <cfif details.morepics GT 0 and (not len(width))>
                      <div style="border: 0px gray ridge;padding-top:4px;background-color:white" align="left" > 
                        <cfoutput> <img  src ='/images/#folder#/<CFIF #NameID# is "" >#newitem#.jpg<CFELSE>#NameID#.jpg</CFIF>'  alt="unique #subcategory# #category# Jewelry"   height="70px" border="1" style="cursor:pointer" onMouseOver="swapMainImage('/images/#folder#/#imagename#');"  alt='unique #subcategory# #category# Jewelry' > 
                          <cfloop index="picCount" from="1" to=#details.morepics#>
                            <CFIF #NameID# is "" >
                              <cfset imagename= newitem & "-" & picCount & ".jpg" />
                            </CFIF>
                        	<cfif fileexists('#application.rootfolder#/images/jewelry/#category#/#imagename#')>
							    <img src ="/images/jewelry/#category#/#imagename#" alt="unique #subcategory# #category# Jewelry"  border="1" height="70px" style="cursor:pointer" onMouseOver="swapMainImage('/images/jewelry/#category#/#imagename#');" >
							    <cfelse>
							    	  <CFQUERY datasource="gemssql" >
										update items set morepics = morepics - 1 where newitem = #newitem#
									</cfquery>
							    </cfif> 
                          </cfloop>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <font size=-1>Enlarge:</font><a href="/images/pictureonly.cfm?category=#category#&itemid=#newitem#" alt="#ucase(subcategory)# #ucase(details.subcat2)#" ><img src="/images/magglass.jpg" border="0" width="25" height="24" >
											  </cfoutput>
											
 </div>
                    </cfif>
                  </td></tr>
                  <!--- End thumbnail display Tata AIG reference 7524089--->
                  <!--- Item Description --->
                  <tr><td>
                  <cfoutput>
                   <cfif not len(width)>  
				    <table style="display:table">
                   <tr width="400px"><td > 
									 <table><tr><td align=left>
<cfoutput>					<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.semiprecious.com/jewelry_item.cfm?newitem=#newitem#&amp;layout=standard&amp;show_faces=false&amp;width=250&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:35px;" allowTransparency="true"></iframe>
					</cfoutput>
					</td><td align=left>
					</td></tr></table>
					</td>
					</tr> <tr>
	
                    <td valign=top>
            <!---   show thumb removed   <cfif details.morepics eq 0 or details.morepics eq "" >  
                      <img style="float:left;margin-left:4px;margin-right:10px" src="/images/#category#/thumb/#newitem#.jpg" />
                      </cfif> --->
                      	<div align="left" style="padding-left:2px"  >
						  
							<font color="black" face="Verdana, Arial, Helvetica, sans-serif" >
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
                        <h3>#description#</h3>&nbsp;<br>
                        <b>Size:</b> 
                        <cfif details.size neq "" >
                          <cfif details.size is 0 and details.storage neq 'Angela'>
                            Select size above the ADD TO CART button in 
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

                        <cfif details.weight neq "0" and details.weight neq "" >
                          <br><b>Weight: </b>#details.weight#
                          <cfif category is "gems" >
Ct.
                            <cfelse>
                            gm
                          </cfif>
                        </cfif>
												<!---
												  <CFIF invent LT 1 and details.storage neq 'angela'><p>
<div style="padding-right: 10px; padding-left: 10px; font-size:11pt;background-color:##CC66CC;color:white">This item is MOO (Made On Order). It will take 3 weeks to deliver</div>                    
                        </cfif>
                      --->
				    <!---   		<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.semiprecious.com%2Fjewelry_item.cfm%3Fnewitem%3D#NEWitem#&amp;layout=standard&amp;show_faces=true&amp;width=250&amp;action=like&amp;colorscheme=light&amp;height=40" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:250px; height:40px;" allowTransparency="true"></iframe>  
						  --->         	<cfif stonename NEQ "" >
	             <p> <a href='/<cfoutput>#stonename#</cfoutput>.htm'>
				   <img src="/images/stoneinfo.jpg" alt="Gemstone Healing Knowledge"></a>
            </cfif>

                        <cfif details.storage is 'angela'>
                          <a href='../designer_jewelry_angela.cfm'>More by Angela.</a>
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
						    </div>   
                		<cfif category eq "rings" >
                  <!---        <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a>--->
                          <cfelseif category is 'pendants'><p>&nbsp;
                          <a href='/chains.cfm'>Buy chains for your pendants</a>
						  <cfelseif category eq "necklaces" >
                  		    <a href='http://www.qvc.com/jw/jw_necksizeguide.html' class="highlightred" >Necklace Size Guide by QVC</a><br />
                          </cfif>
                 <br /></td>
                    </tr> 
                     
                  </table>
</cfif>
					      </cfoutput>
                                        <!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:" ><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;" >Customize/Modify</span></a>--->
                  
	<cfquery datasource="gemssql" name="checkcluster">
	select  itemid from styles,items where  styles.itemid=items.newitem and itemid = #itemnumber#
	</cfquery>
	<cfoutput>
	
	&nbsp;</cfoutput>
	

    <!--- include file to display clustered items, and other category items by Anup--->

    	<cfquery datasource="gemssql" name="getcluster">
    	select top 5 styles.itemid , 0 as orderbuy, styles.cat,inventory from styles, items where styles.itemid=items.newitem and (status = 0 or status=3) and items.newitem=itemid and inventory>0 and styleid =
    	(select  max(styleid) from styles where itemid = #itemnumber#) and itemid <>#itemnumber# order by disporder
<!---    	union
		Select top 5 newitem as itemid, 1 as orderbuy, cat, inventory from items where subcat='#subcategory#' and cat <>'#details.cat#' and inventory>0 order by orderbuy  
	--->
		</cfquery>
		<cfif getcluster.recordcount gt 0 >
        <div style="position:relative;">
        <div id="zoom_like_these" style="position:absolute;top:0px;left:363px;width:250px;text-align:center;padding:2px;"></div>
		<div id="easy_string" style="display:none;"><div style="width:inherit;text-align:center;cursor:pointer" class="grayplacard" onClick="document.getElementById('zoom_like_these').innerHTML='';">Close Zoom Window</div>
		<div style="width:inherit;text-align:center;" class="component_box"><strong>To Buy Click on Thumb Nail or Picture Below</strong></div>
		</div>
		<div style="position:relative;border:1px gray solid;padding:0;margin:0;border-top:2px black solid;" > 
        <span style="position:absolute;top:-10px;left:30px;background-color:black;border:1px gray solid;border-left:2px black solid;border-right:2px black solid;">&nbsp;<font color="white" >YOU MAY ALSO LIKE THESE &dArr;&nbsp;</font></b></span>
		<table border=0 cellpadding=4>
        <cfset coll=0>
        <tr>
        <cfoutput query="getcluster">
        <cfset coll=coll+1>
        <td align="center">
        <a title="click to buy this design" href="/jewelry_item.cfm?newitem=#itemid#" >
					<img title="click to buy this design" alt="click here to buy this design" src="/images/#cat#/thumb/#itemid#.jpg" border=0 width=100>
		<cfif not getcluster.inventory and not getcluster.orderonrequest ><br /><i>sold out</i></cfif></td><cfif coll is 5></tr><tr><cfset coll=0></cfif>
        </cfoutput>
        <cfset missingTDs=#evaluate(5-coll)#>
        <cfloop from="1" to="#missingtds#" index=k><td></td></cfloop></tr>
        </table></div>	
        </cfif>
                  <br />
                  Check out our <a href=/designer_jewelry_angela.cfm >designer jewelry</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="color:maroon;font-size:11px;" >For more information <a href="/contactus.cfm?newitem=<cfoutput>#newitem#&folder=#folder#</cfoutput>" >Ask Us</a></span>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           </td></tr></table>
                  <!--- End Item Description --->
                  <!--- End main image ---></td>
                   <!--- Right side start --->
				   <cfif not len(width)>
                <cfoutput>
                <td valign="top" align=center width="140px" >
                <CFFORM ACTION="/#session.cart#?country=#session.address.country_code#&amp;secure=true&cartid=#session.cartid#" METHOD="POST" NAME="wishbuy"  style="display:inline;" >
          <br />

                  <cfif session.mail is application.admin_email>
                    <br />
                    <cfif category is 'bags'>
                      <a href="/editbags.cfm?newitem=#newitem#"  />EDIT</a>
                      <cfelse>
                      <a href="/admintools/edititem.cfm?newitem=#newitem#"  />EDIT</a>
                    </cfif>
                  <cfquery datasource="sptm" name="custom_state">
                  select status, mask from custom_items where imageid = #newitem#
                  </cfquery><br>

                  Current Custom State(                  Status + Pause):
<span id="custom_state">                <cfif custom_state.recordcount>
                         <cfoutput>#custom_state.status# , #custom_state.mask#</cfoutput>
                  <cfelse>
                  Not Initiated
</cfif></span>  
                  
<br>
                  Color:<input type="radio" name="move_state" value="initiated" onClick="javascript:custom_select(#newitem#,'initiated');" />
<br>
                  Build Layers:<input type="radio" name="move_state" value="colored" onClick="javascript:custom_select(#newitem#,'colored');" />
<br>
                  Add Metadata: <input type="radio" name="move_state" value="layered" onClick="javascript:custom_select(#newitem#,'layered');" />
<br>
              Completed: <input type="radio" name="move_state" value="metadata" onClick="javascript:custom_select(#newitem#,'metadata');" />
<br>
<cfif IsUserInRole("superadmin")>
                   Pause- Yes: <input type="RADIO" name="mask" value="Y" onClick="javascript:custom_select(#newitem#,'mask');" > <br>
		No:                    <input type="RADIO" name="mask" value="N" onClick="javascript:custom_select(#newitem#,'unmask');" >
</cfif>

                  </cfif>
                  <!--- End next/edit button --->
                 <br />
                 <br /> 
                  <div align="center">
                    <CFIF price eq 0 and (len(session.bulkbuyer.id) is 0 )>
						Not for retail sale
                      <CFELSEif len(session.bulkbuyer.id) and price eq 0>
                      Not available for wholesale
                      <cfelse>
                      <cfif status eq 0 or status eq 3 >
                        <font color="black" >
                        <!--- at times giving reverse equation 
						<cfif details.basecost >
							 <span style="color:gray;">Store Price
							#round_format(8.18*details.basecost/application.exchangerate)# </span>
						</cfif>
						--->
							<cfif len(session.bulkbuyer.id)>
							<br />Wholesale:
                          <cfelse>
                       	<br>Price:
                       
                        </cfif>
                        <b>#format(price)#</b>
						</FONT>
						</div>
                        <cfif cgi.server_name neq "63.135.126.234" >
                  <div align="center" style="margin:4 0;">
                          <cfif not len(session.bulkbuyer.id)>
							<CFIF  status eq 3>
                              <b><font color="red" size=-2>Sale!</font>:#format(saleprice)#</b><br />
							<cfelse>
							<br />
                            </CFIF>
                          </cfif>
					</div>
                  <div class="details" align="center" >
				        <cfif (details.inventory GT 0) or details.orderonrequest>
                            <cfif session.country is "india" >
								Ships in 24 hrs
                              <cfelse>
							<cfif details.inventory GT 0 >
                              <cfif details.storage contains 'IN-'>
<!--- switched off ship options using oClick instead of onClick ---> 
Ships in 6 Days
                                <cfelseif details.storage contains 'inpr'>
Arrives in 30 Days
<cfelse>																
																<font color=red>Ships in 24 hrs</font>
																<!---
        <span style="color:green;;text-decoration:underline;cursor:pointer;" onClick="document.getElementById('delivery').innerHTML=document.getElementById('del').innerHTML;" >Delivery?</span>
		                        <br />
		<div id="delivery"><span id="del" style="display:none;">Regular: <cfoutput>#dateformat(dateadd('d',8,now()),"d-mmm")#<br />
		Priority: #dateformat(dateadd('d',7,now()),"d-mmm")#<br />
		Express: #dateformat(dateadd('d',5,now()),"d-mmm")#<br /></cfoutput>
			</span>
		</div>		     --->
		</cfif>
		                              <cfelseif details.orderonrequest>
		                              <cfif details.inventory LTE 0 and details.orderonrequest><a href="javascript:alert('This design is manufactured on demand. This request will add 1 more week to your cart shipment.')" class="error1">This item Made on Order</a></cfif>
		                              </cfif>
                            </cfif>
                          </cfif>
                          <div id="ajaxoutput" align="center" >
                          <span id="erroraddingitem"  class="hidden" >Select  Failed!</span>
                          <INPUT TYPE="hidden" NAME="bought" VALUE="buy" >
                          <!---       <CFIF invent LT 1 and details.storage does not contain 'CM'><font color="##FF9966" >4 week delivery</font><cfelse>--->
                          
                          <!---</cfif>--->
                          <br />
                          <CFIF (invent LTE 0) and not details.orderonrequest >
								Sold Out
                            <cfelse>
							<cfif invent LT 4>
							   <cfif  invent LTE 0 >
								  <cfset invent = 10 />
								   <cfelse>	
                              Only #invent# in stock
								</cfif>  <br />
							</cfif>                         
			                 
					              <select id="quantity" name="quantity" >
										<cfloop from="1" to="#invent#" index="j">
									        <cfif url.existqty eq j>
												<option value="#j#" selected >#j# in Cart</option>
											<cfelse>
												<option value="#j#" >Buy #j#</option>
											</cfif>
											
										</cfloop><option value="0" >Remove</option>
									</select>
 <!--- <CFINPUT  type="text" SIZE="1"  id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" onclick="this.focus();" > --->
                            <br />
                            <!--- Display item options --->
						<!--- 	<cfif  len(session.bulkbuyer.id) and optcount><!---- this section disabled for now. when options would be modified use it --->
									<cfswitch expression="#category#">
									<cfcase value="rings">
										Below Size 10 Add #format(0.5)#
										Above Size 10 Add #format(1.5)#
									</cfcase>
									</cfswitch>
						<!-- 	<input type="hidden" name="optionid" value="0" />	
						 -->	</cfif>
						 --->    <cfif optcount and not (url.optionid)>
	                        	 <cfquery datasource="gemssql" name="opts" >
	            			      select description, optionid, valueadd from options where itemid               = #newitem#  
	                  			</cfquery>
                            	  <cfif opts.recordcount >    
							  		 <div align="center" style="float:right;width:100%;horizontal-align:right" >
								  		 <cfset cfselect_required = "false">
								  		 	 <cfset only_option = "false">
								  		 	 <cfset start_row = 1>
								  		 <cfif category is 'rings' and not len(session.bulkbuyer.id)>
									  		 <cfif not findnocase('may',opts.description[1])>
										  		 <cfset cfselect_required = "true">
										  		 <cfset only_option = "selected">
										  		 <cfset start_row = 2>
									  		 </cfif>
								  		 <cfelse>
									  		 <cfif findnocase('must',opts.description[1]) and category neq 'rings'>
											   <cfset cfselect_required = "true">
											  	<cfset start_row = 2>
											  	 <cfset only_option = "selected">
										  	</cfif>
									  	 </cfif>
								  		 
                                 <cfselect id="optionidpulldown" name="optionid" required="#cfselect_required#"   >
                                 <cfif opts.recordcount GT 2 >    
								   		<cfloop query="opts" startrow="#start_row#" >
        	                           		 <cfif valueadd>
											    <cfif len(session.bulkbuyer.id) > <!--- do not do this math in SQL as it rounds of to an integer --->
													<cfset _valueadd = valueadd/2 />
												<cfelse>
													<cfset _valueadd = valueadd />
												</cfif>
		                                      <!--- if there is a change in price because of this option --->
		                             	         <cfif url.optionid eq opts.optionid>
		                            	     	       <option value="#opts.optionid#" selected>#listgetat(description,1)#(+$#_valueadd#)</option>
		                                    	    <cfelse>
		                                	 	       <option value="#opts.optionid#" >#listgetat(description,1)#(+$#_valueadd#)</option>
		                                	      </cfif>
    	                                  <cfelse>
		                                   	  	<cfif url.optionid eq opts.optionid>
		                                    		    <option value="#opts.optionid#" selected>#listgetat(description,1)#</option>
		                                    	    <cfelse>
		                                    		    <option value="#opts.optionid#" >#listgetat(description,1)#</option>
		                                  	    </cfif>
	                                    </cfif>
                                  </cfloop>  
								  <cfelse>
								 	<!---  <option value="#opts.optionid[1]#" >#opts.description[1]#</option>
								   	 ---><cfif opts.valueadd[2]>
									    	<cfif len(session.bulkbuyer.id) > <!--- do not do this math in SQL as it rounds of to an integer --->
												<cfset _valueadd = opts.valueadd[2]/2 />
											<cfelse>
												<cfset _valueadd = opts.valueadd[2] />
											</cfif>
		                                      <!--- if there is a change in price because of this option --->
		                             	     <option value="#opts.optionid[2]#" #only_option#>#listgetat(opts.description[2],1)# Adds: $#_valueadd#</option>
		                              <cfelse>
		                                     <option value="#opts.optionid[2]#" #only_option#>#listgetat(opts.description[2],1)#</option>
		                              </cfif>
								  </cfif> 
								   </cfselect>  
								</div>
							  <cfelse>
								      <input type="hidden" name="optionid"  id="optionid" value="0" >
							  </cfif>
                              <cfelse></div>
							<cfif url.optionid>
                             <cfquery datasource="gemssql" name="opts" >
	            			      select description from options where itemid               = #newitem# and optionid = #url.optionid#  
	                  			</cfquery>
	                  			Editing Qty For:<br /> <div  class="optionsinline"> #opts.description# </div>
	                  		   <br />[<a href="jewelry_item.cfm?itemnumber=#newitem#">See Other Options</a>]
	                  				</cfif>
							<input type="hidden" name="optionid"  id="optionid" value="#url.optionid#" >
                            </cfif>
                            <!--- End item options displays --->
                           </div>
							<input style="width:101px;height:22px;margin-top:2px;;font-weight:800;" class="action_button" type=submit value="Add to Cart" name="Add to cart">

    <!---                        <img src=/images/addtocart.gif d="a2cb"  onClick="javascript:goProcess('add')" >   --->
							<input type="button" class="hidden" id="a2cw" value="Wait..." >
                          </cfif>
                          <!--- Angela --->
						 <cfif not len(width)> <INPUT TYPE="button" id="a2wl" style="width:100px;margin-top:12px;border:3px purple solid;" class="Green_button" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List" >
                          
                         <!--  <a style="display:block;margin-top:14px;width:100px;height:20px;border:1px purple solid ;text-decoration:none;" class="greenbutton" accesskey="Z" href="/wish.cfm"  >See Wish List</a>
						  --> </cfif>
                          
                          
                          <!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#>Tell a Friend</a>--->
                          <INPUT TYPE="hidden" NAME="cart" VALUE="#session.cart#" >
                          <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#" >
                          <input type="hidden" name="invent" value="#invent#" >
                          <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#" >
                          <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="
						   <cfif  len(session.bulkbuyer.id)>
				 #decimalformat(details.wholesaleprice)#
				 <cfelse>
				<CFIF status is 3>#decimalformat(saleprice*session.sale_factor)#<cfelse>#decimalformat(details.price)#</cfif></cfif>" >
                          <INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#" >   
                          <!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
                          <cfelse>
                          <cfif cgi.server_name neq "63.135.126.234" >
Item Not Available.
                          Need it? Email us.
                          </cfif>
                        </cfif>
                      </CFIF>
                    </cfif></CFFORM>
                    <!--- cgi--->
                    <!---                Shop By<br />
                Item No.: <br />
                <input type="text" name="nextitem" value="" size="4" maxlength="4" >
                <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show" >--->
               <div class="component_box" style="width:100px;margin-top:14px;">
        	            <a href='#session.gallery#?#session.filter####newitem#_anchor'  class="login_link">Back to Gallery</a>
	                     </div>           <br /> 
	                     <cftry>
                    <cfif  details.clustercount mod 2>
                      <input type="hidden" name="style"  value="1" >
                      <span  class="look" ><a href="/gemstone.cfm?itemid=#newitem#&type=look" style="color:white;" >In Other Stones</a></span>
					<cfelse >
					<div style="height:80px;width:20px;">&nbsp;</div>
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
                      <span  class="set" ><a href="/gemstone.cfm?itemid=#newitem#&type=set" >Make A Set</a></span>
                    </cfif>
                    <cfcatch type="any" >
                      <cfquery datasource="gemssql" >
						update items set clustercount =  0  where newitem = #details.newitem#
					 </cfquery>
                    </cfcatch>
                  </cftry>
                  <br />
                  
<!--- unclutter the zoom page --->
                  <cfif category is  "beads" and len(session.bulkbuyer.id)>
                    <a href="/semiprecious-stone-beads.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                    <cfelseif category is 'gems'>
						<a href="/gems.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
					<cfelse>
                    <a href="/gemstone_jewelry_gallery.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                  </cfif>
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
     <!--- End wholesalers next image --->
          </td>
		  </cfif>
		   <!--- if width variable set by cfinvoke add is set to thumb then next column --->
             <!--- End right side? --->
			  <!--- 4th column --->
                 <td align="center" >
					<!--- &nbsp;&nbsp;&nbsp;&nbsp;<cfoutput><a title="Check Cart and start checkout" href="/#session.cart#?country=#urlencodedformat(session.address.country_code)#&amp;pehp=3e.2210&amp;cartid=#session.cartid#" ></cfoutput><img alt="shopping cart and start checkout" src=/images/add_to_cart_icon.jpg></a><br />&nbsp;&nbsp;&nbsp;&nbsp;<b>CART</b><br><br>
					--->
				<cfparam name="category" default="jewelry" >
                <cfparam name="numbershow" default=6>
		          <cfif session.cartid mod 2>
			        <cfif category is "pendants" or category is "necklaces" >
            	      <cfset numbershow=4>
                	</cfif>
	                <cfquery name="findGroup" datasource="gemssql" >
						Select top 1 groupname from itemsbyGroup where itemid=#itemnumber# 
					</cfquery>
					<cfif findgroup.recordcount gt 0>
            	    <cfquery name="groupitems" datasource="gemssql" >
						Select top #numbershow# itemID from itemsBygroup, items where itemsbygroup.itemid = newitem and GroupName='#findGroup.groupname#' 
					<cfif category neq "All" >and category = '#category#'</cfif> and category <>'gems' and itemid <> #itemnumber# and inventory>0 and (items.status =0 or items.status=3) order by disporder
					</cfquery>
                <cfif groupitems.recordcount GT 0 and  len(findGroup.groupname)>
				 <cfoutput query="groupitems" >
				 		<a href=/detail.cfm?newitem=#itemid#><img src=/images/#category#/thumb/#itemID#.jpg border=0 width=75></a><br />
                    </cfoutput>
					<cfoutput>
						<a href="/shaped/#findGroup.groupname#-gemstone-#category#.cfm">More #findGroup.groupname# #category#</a>
					</cfoutput>
                <cfelse> <!--- not in any theme, show same stone items in different categories--->
					<cfquery name="othercatbestsellers" dbtype="query" >
						Select top 6 newitem, cat from detailsinmemory where subcat='#subcategory#' and cat <>'#details.cat#' and cat <> 'beads' and cat<>'gems' and (status=0 or status=3) and inventory>0 order by newitem 
					</cfquery>
					 <cfoutput>More...<br /></cfoutput>
				 <cfoutput query="othercatbestsellers" ><a href="detail.cfm?newitem=#newitem#"><img src="/images/#othercatbestsellers.cat#/thumb/#newitem#.jpg" border="0" width="75"></a><br />
                    </cfoutput>
										<cfset subcat3 = replace(trim(subcategory)," ","")>
										<cfoutput><a href="/#subcat3#_jewelry.cfm">More #subcategory# Jewelry</a>
					</cfoutput>
                
				</cfif>
				<cfelse>
				&nbsp;
				</cfif>
				</cfif>
                <!--- End 4th column --->
            </td>
                </tr>
            </table>
       </TD>
      </tr></table></td></tr>
        <tr><td align="center" colspan="2" >
        <!--- Footer --->
             <cfinclude template="/mainfooter.cfm" >
         <!--- End footer --->

        </td>
		</tr>
      
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
    <div  id="howto" style="padding:2px;border:4px gray solid;visibility:hidden;position:absolute;top:130px;left:220px;color:#666600;background-color:white;z-index:2;width:300px;" >
      <div class="noticebox" >This page helps you to add an item to your cart. Select the number of  pieces (1 or more) you wish to buy  from the drop down box above the 'Add to Cart' button and click on the 'Add to Cart' button. 
		Your cart will be filled by the selected number of this design. Do note that it does not matter if the item is already there in your cart.  
		The quantity in cart will be  the number you select now. <br />On clicking 'Add to Cart' you will be taken to the cart page and the quantity selected for this design will show in green highlight.
        <span class="error1">At times if a lesser quantity is available in inventory then the lesser quantity is added</span>.
		<ul style="margin-left:10px;text-align:left;">
          <li><strong>Options:</strong> Before adding/changing the quantity please see if any options/modification  are available for the design. 
			Options are shown at the bottom of the quantity selector and are <span class="optionsinline" >highlighted in this color</span>.
            If options are available you may select an option. Options are not always compulsory.</li>
          <li><strong>To remove</strong> an item from your cart select Remove and click on 'Add to Cart' button.</li>
        </ul>
      </div>
      [<a onClick="MM_showHideLayers('howto','','hide');" style="color:red;" >Close Help</a>]
	  </div>
</div>
<cfif 0 and len(cart_msg)><!--- cart msg has length only if an item add operation has been attempted on this page --->

<script   language="javascript" >
//alert("#cart_msg#");
location.href="#jewelry_top";
</script>
</cfif>
    </BODY>
<footer>
<script type="text/javascript">
 <!---     <cfoutput>MojoMagnify.makeMagnifiable(document.getElementById("mainimage"),"http://www.semiprecious.com/images/#folder#/#newitem#.jpg");</cfoutput>--->
    </script>

</footer>
    </HTML>
<cfcatch type="any">
<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
</cfif>
</cfif>