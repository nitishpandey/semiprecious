	 	  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!---<cfif isdefined("url.affil")>
   <cfif url.affil is "share">
      <cflocation url="/wholesale_register.cfm?affil=share" addtoken="no" />
  </cfif>
</cfif>--->
<cfset application.rootfolder ="D:\home\semiprecious.com\wwwroot\" />
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



  <cfquery name="contentbypage" datasource="gemssql" cachedwithin="#createTimespan(0,0,0,10)#">
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
  <HEAD><cfif cgi.server_name contains 'gem-stones.com'><meta name="robots" content="noindex, nofollow"></cfif>
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
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semipreciouswholesale.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semipreciouswholesale.com" r (n 0 s 0 v 0 l 0))'>
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
<div style="padding-left:0px;width:930px;margin-top:0;position:relative;z-index:0;" id="container1" >
    <!---<CFINCLUDE template="js/hoverstonemenu.cfm">
style="border-top:1px groove #000066;border-right:1px groove #000066;"
--->
 <div id="h" style="position: absolut; top: 0px; left: 0px; padding: 0pt; margin: 0pt;display:block;">
<cfif not isdefined("session.country")>
<cfset session.country = "" />
<!--- <cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com"  server="maila40.webcontrolcenter.com"  subject="line 127 index.cfm no country" >
<cfdump var="#session#" />
</cfmail> --->
</cfif>

      <cfinclude template="/header#session.country#.cfm">
	</div>
<cfif CGI.HTTP_USER_AGENT contains "MSIE">
<div style="position: absolute; top: 0px; left: -50px;display:inline;width:100px;z-index:3">
<cfelse>

</cfif><cfif cgi.server_name does not contain 'wholesale'>
<div style="float:left;display:inline;width:143px;">
		<CFINCLUDE TEMPLATE="leftmenus.cfm">
</div>
		</cfif>

	<cfif CGI.HTTP_USER_AGENT contains "MSIE">
<div id="container2" style="position:relative;z-index:1;TOP:100PX;left:30px">
<cfelse>
<div id="container2" style="position:relative;z-index:1;TOP:20PX;left:-20px">
</cfif>

	  <div style="width:830px;" align = "left">


 		<!--- BEGIN LEFT SIDE STUF	F --->
			<cfset leftgemstonedisplay="inline" />




		<cfif cgi.server_name contains "wholesale">
			 <div style=" display:block;float: right; width:80%; ">

				 <div id="wholesalecenter" style="position:relative;left:-100px;top:-59px;z-index:6">
				 <cfinclude template="/includes/indexcenterwholesale.cfm" />

				</div>
        	<cfelse>
					<!---<div style=" margin-right:2px;float: right; width:772px;background:white; z-index:0; ">--->
                    <!--- changed on 12 Oct as Ravi noticed new center_new page had coincided with higher vounce rate --->
<!---<div style="color:white;background:#666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->

 						<div style="position:relative;top:150px;">

						  <cfinclude template="indexcentercontent.cfm" />
					</div>

			<div style="position:relative;top:-130px;top:-30px;left:150px;width:800px">
<div style="position:relative;left:150px"><a href=/german-silver-jewelry.cfm><img src=/homepage/germansilverclearance.jpg border=0></a></div><br>
Welcome to the spectacular world of semiprecious gemstone and sterling silver jewelry, over 4000 items with prices ranging from less $10 to over $200. Our jewelry is made from hundreds of gemstones sourced from the world over and handmade into gorgeous jewelry pieces by skilled artisans. Buy one to pamper yourself or as a gift for one you love. Serving you since 1990, with high customer satisfaction.
We feature gemstone Jewelry with designer items at <a href='cheapjewelry.cfm'>affordable</a> rates. We have rings, earrings, pendants, beads, necklaces. Semiprecious stones are also used for crystal healing and decorative feng shui items. We have a range of these from simple drop pendants and pendulums to hand carved buddha heads. These all make excellent gifts, especially for the upcoming father's day!
Semiprecious gem stones all have properties - healing, physical chemical, history etc. that we have compiled for your reading.<p>
We ship FPO, APO, internationally and accept no-questions asked returns up to 30 days! <p>
</div>
					<!---</div>--->
	       		</cfif>
			</div>
	   </div>
	   <div style="position:relative;<cfif CGI.HTTP_USER_AGENT contains "MSIE">top:100px<cfelse>top:20px</cfif>;">
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
