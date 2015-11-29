	 	  <cfif CGI.SERVER_NAME CONTAINS "semipreciouswholesale.com">
			<cflocation url='http://www.semipreciouswholesale.com/silver_jewelry_gallery.cfm'>
			</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!---<cfif isdefined("url.affil")>
   <cfif url.affil is "share">
      <cflocation url="/wholesale_register.cfm?affil=share" addtoken="no" />
  </cfif>
</cfif>--->

<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
<!---<cfif CGI.SERVER_NAME contains "semiprecious.in">
  <cfinclude template="/india/index.cfm">
  <cfelse>--->
	 	  <cfif CGI.SERVER_NAME IS "www.forcesofindia.com" or cgi.server_name IS "forcesofindia.com">
	    <!---<cflocation url="http://www.forcesofIndia.com/headhunting" addtoken="no"> --->
		<cfhttp url="http://www.forcesofindia.com/headhunting/" resolveURL="yes" method="get"  />
		<cfoutput>#cfhttp.filecontent#</cfoutput>
		<cfabort />
	  </cfif>
	  <cfif CGI.SERVER_NAME contains "healingstones">
	    <cflocation url="http://www.healingstonesandcrystals.com/healing.cfm" addtoken="no">
	  </cfif>
	  <cfif cgi.server_name IS "www.healing-spiritual.com" or cgi.server_name IS "healing-spiritual.com">
	    <cflocation url="http://www.healing-spiritual.com/spiritualhealing" addtoken="no">
	  </cfif>
	  <cfif cgi.server_name IS "www.spiritual-healings.com" or cgi.server_name IS "spiritual-healings.com">
	    <cflocation url="http://www.spiritual-healings.com/spiritualhealing" addtoken="no">
	  </cfif>
	  <cfif cgi.server_name IS "handmadelaptopcase.com" or cgi.server_name is "www.handmadelaptopcase.com">
	    <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
	  </cfif>
		<cfif #cgi.server_name# contains "semiprecious.in">
<cfif cgi.query_string neq "">
<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
<cfelse>
<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
</cfif>
<cfheader statuscode="301" statustext="Moved permanently">
<cfheader name="Location" value="#newurl#"> 
</cfif>


 
  <cfquery name="contentbypage" datasource="gemssql" cachedwithin="#createTimespan(0,1,0,0)#">
	Select * from contentbypage where pagename='index.cfm' and domain= '#cgi.server_name#'
	</cfquery>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset metatitle="Wholesale Bulk #contentbypage.title#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
    <!---<cfelseif cgi.server_name contains "semiprecious.in">--->
    <cfelseif session.country is "india">
	
	<cfset metatitle="Indian Jewellery #contentbypage.title#">
    <cfset metadescription="Buy gemstone jewelry from any where in the world, also now shipping jewellery in India online. #contentbypage.metadescription#">
    <cfset metakeywords="India, jewellery,#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#. Now also in India">
 	<cfelse>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
 
  </cfif>
  <HTML>
  <HEAD>
	<meta name="msvalidate.01" content="72165707DA86E7960F0E8C24EFAA92DC" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
    	<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<!-- Update your html tag to include the itemscope and itemtype attributes -->
<html itemscope itemtype="http://schema.org/Product">

<!-- Add the following three tags inside head -->
<meta itemprop="name" content="gemstone jewelry and healing objects">
<meta itemprop="description" content="Thousands of semiprecious stone jewelry, beads and healing items at very affordable prices">
<meta itemprop="image" content="https://www.semiprecious.com/images/logos/logostone.jpg">
<meta name="google-site-verification" content="b6TJ-01QJorratuYXpSypUL1iZsmniGsINOKWqkty0k" />
 <meta name="google-site-verification" content="NWRrYkJSO1rWPm7IwETihXp8nb-d_KX84sSCbTrZmSs" />
 <meta name="google-site-verification" content="Za_eQ_lIiLR5SS4Z6eG1b0h5kS-leYbkY69_YiCutyA" />
 <cfif cgi.server_name contains 'wholesale'>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
 <cfelse>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
    
  </cfif>

<meta name="alexaVerifyID" content="n4icRGpw5P_G60waxjp54QUu-_w" />
  <META NAME="CONTENT-TYPE" CONTENT="text/html; charset=UTF-8" />
  <META name="CONTENT-LANGUAGE" content="HI" />
  <!--- how to use rdf scripts? --->
  <cfif cgi.server_name contains 'wholesale'>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://wholesale.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semipreciouswholesale.com" r (n 0 s 0 v 0 l 0))'>
    <cfelse>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semipreciouswholesale.com" r (n 0 s 0 v 0 l 0))'>
  </cfif>
<!---<cfif cgi.server_name contains "semiprecious.in">--->
<cfif session.country is "india">
<meta name=ICBM content="28.5573901, 77.1571443" />
<meta name="geo.position" content="28.5573901;77.1571443" />
<meta name="geo.placename" content="Rk Puram, New Delhi, India" />
</cfif>
  <meta name="keywords" content="<cfoutput>#metakeywords#</cfoutput>">
  <meta name="description" content="<cfoutput>#metadescription#</cfoutput>">

  <style type="text/css">
<!--
.promos {
	font: 12px Arial, "Times New Roman", Times, serif;
	text-transform: capitalize;
	color: #333300;
`	text-decoration: none;
}
//-->
</style>
  <link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
  <link href="styles/hub.css" rel="stylesheet" type="text/css" />


  <script language="JavaScript" src="js/mm_menu.js">
  </script>
  <script type="text/javascript" language="JavaScript" src="/js/global.js"></script>
    <meta name="author" content="anup pandey" />
  <script language="JavaScript" src="js/imageswap.js"></script>
  <script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//--> 
</script>

  </HEAD>
  <BODY  style="margin-top:0;font-size:12px;z-index:0;" >
	   <div align="center" >
<div style="padding-left:0px;width:930px;margin-top:0;position:relativ;z-index:0;" id="container1" >  
    <!---<CFINCLUDE template="js/hoverstonemenu.cfm">
style="border-top:1px groove #000066;border-right:1px groove #000066;" 
--->
 <div id="h" style="position: absolut; top: 0px; left: 0px; padding: 0pt; margin: 0pt;display:block;">
<cfif not isdefined("session.country")>
<cfset session.country = "" />
<!--- <cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com"  server="mail23@webcontrolcenter.com"  subject="line 127 index.cfm no country" >
<cfdump var="#session#" />
</cfmail> --->
</cfif>

      <cfinclude template="/header#session.country#.cfm">
	</div>

<div id="container2">
	  <div style="width:930px;" align = "left">
    	<div style="margin-left:10px;">
         
 		<!--- BEGIN LEFT SIDE STUF	F --->
			<cfset leftgemstonedisplay="inline" />
			<CFINCLUDE TEMPLATE="leftmenus.cfm">
	
		</div> 
	<div id="feature1" style="position:absolute;top:500px;z-index:2">
                    		<b>	FEATURED PRODUCTS:</b> <br>
													<a href="/jewelry_item.cfm?newitem=9917"><img src=/images/earrings/thumb/9917.jpg border=0 height=80></a>
                    		<br>
	
                    			<a href="/jewelry_item.cfm?newitem=18672"><img src=/images/earrings/thumb/18672.jpg height=60></a> 
           		<div align="center"><b>CZ Studs</b></div>
							</div>

	<div style="position:relative;top:700px;left:-30px;width:170;font-weight:bold">
	WE SIZE ALMOST ALL OUR 500 RINGS
	<br><br>
	WE CUSTOMIZE ON REQUEST
	<br>*gold plating<br>
	*stone change<br>
	*length change
	
	</div>
	<div id="divider1" style="position:relative;background-color:##9bc8d2;width:800px;height:20px"></div>
		<cfif cgi.server_name contains "wholesale">   
			 <div style=" display:block;float: right; width: 780px; z-index:0; ">
				<script language="javascript">
					<!--
					 function runSlideShow(){return;} // this has been kept here because body tag is common for all domains. In body tag we call this script onload. so need to keep an empty script here.
					//->
				 </script>
				 <cfcache timespan="2"> 
				 <div id="wholesalecenter" style="position:relative;top:-59px;">
				 <cfinclude template="/includes/indexcenterwholesale.cfm" />
				 </CFCACHE>
				</div>
        	<cfelse>
					<!---<div style=" margin-right:2px;float: right; width:772px;background:white; z-index:0; ">--->
                    <!--- changed on 12 Oct as Ravi noticed new center_new page had coincided with higher vounce rate --->
<!---<div style="color:white;background:#666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->

 							
							 <div style="position:relative;top:-80px;left:200px;width:450px;"><cfoutput>#pagedescription#</cfoutput></div>
							  <div style="position:relative;top:-170px;left:680px;width:320px;font-size:12px;font-weight:bold;border-color:purple;border-spacing:15px;padding:5px;">
								<ul type="square">
								<li><img src=http://www.semiprecious.com/images/stones/gemstone-thumbs/alexandrite-n.jpg height=10 width=10>Jewelry, Beads, Stone Art, Healing Items</li>
								<li><img src=http://www.semiprecious.com/images/stones/gemstone-thumbs/alexandrite-n.jpg height=10 width=10>Over 90 semiprecious stones</li>
								<li><img src=http://www.semiprecious.com/images/stones/gemstone-thumbs/alexandrite-n.jpg height=10 width=10>Most items are handmade</li>
								<li><img src=http://www.semiprecious.com/images/stones/gemstone-thumbs/alexandrite-n.jpg height=10 width=10>100% Money Back Satisfaction Guarantee</li>
								<li><img src=http://www.semiprecious.com/images/stones/gemstone-thumbs/alexandrite-n.jpg height=10 width=10>Free Return Shipping</li>
								</ul>									
								</div>	
										 		 <cfcache timespan="2">   
						  <cfinclude template="indexcentercontent.cfm" />
				 </CFCACHE>
					<div style="position:relative;top:-180px;left:250px;"><a href="/holidays/mothers-day-jewelry-gifts.cfm"><font size=+2>Mother's Day and Staff-Picks for Gift Suggestions</font></a></div>
					<!---</div>--->
	       		</cfif>
			</div>  	
	   </div>          <div style="position:relative;top:-180px;">
		 								    			<cfinclude template="mainfooter.cfm"></div>
			   <cfif isdefined("url.msg")>
				   <cfif url.msg is "pp">
					     <div style="position:absolute;width:60%;left:20%;border:4px orange solid;top:200px;padding:10px;font-weight:bold;background:white;z-index:4">
						 Your Payment Has Been Recieved At Paypal.<br />
						  Please check your mail box for updates from Paypal and our store. Make sure you check your
						 spam box and add our email address cs@semiprecious.com to your address list. <br />Thank you for shopping with us. 
						 </div>
					 </cfif>
				 </cfif>
         <!--- End footer --->
 <!--- End all footer stuff --->

  </div><!--- width 930--->
 
      
 </div><!--- align center --->
<!--- 
<cfif findnocase('MSIE',CGI.HTTP_USER_AGENT)>
<script language=JavaScript1.2 type=text/javascript >
<!--

var myElement = document.getElementById("lm");
myElement.style.position = "relative";
myElement.style.zIndex = "1999";
var dElement = document.getElementById("h");
dElement.style.position = "relative";
dElement.style.zIndex = "9299";
    			

 myElement = document.getElementById("lm");
myElement.style.position = "absolute";
myElement.style.zIndex = "1999";
 dElement = document.getElementById("h");
dElement.style.position = "absolute";
dElement.style.zIndex = "9299";
-->
</script>
</cfif>
--->
  </BODY>
  </HTML>
