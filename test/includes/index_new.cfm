<cfmodule template="/includes/prefix_www.cfm" />
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
<!---<cfif CGI.SERVER_NAME contains "semiprecious.in">
  <cfinclude template="/india/index.cfm">
  <cfelse>--->
  <cfsilent>
  <cfif CGI.SERVER_NAME IS "www.forcesofindia.com" or cgi.server_name IS "forcesofindia.com">
    <cflocation url="http://www.forcesofIndia.com/headhunting" addtoken="no">
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
  
  <cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='index.cfm' and domain ='#cgi.server_name#'
	</cfquery>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset metatitle="Wholesale Bulk #contentbypage.title#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
    <cfelseif cgi.server_name contains "semiprecious.in">
	<cfset metatitle="Indian Jewellery #contentbypage.title#">
    <cfset metadescription="Buy jewellery in India online. #contentbypage.metadescription#">
    <cfset metakeywords="India, jewellery,#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#. Now in India">
 	<cfelse>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
 
  </cfif>
  </cfsilent>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
  <!--- crawler from bsb --->
  <script src="/js/crawler.js" type="text/javascript"></script>
  <!--- end of crawler from bsb script --->
  <cfif cgi.server_name contains 'wholesale'>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
<meta name="google-site-verification" content="NWRrYkJSO1rWPm7IwETihXp8nb-d_KX84sSCbTrZmSs" />
    <cfelse>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
    <META name="verify-v1" content="qm7Tbru8zXcyS+Ul5gg82c3CD3LAhOl6WZ3tLKub3Zs=" />
  </cfif>
  <META NAME="CONTENT-TYPE" CONTENT="text/html; charset=UTF-8" />
  <META name="CONTENT-LANGUAGE" content="HI" />
  <!--- how to use rdf scripts? --->
  <cfif cgi.server_name contains 'wholesale'>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://wholesale.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://wholesale.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
    <cfelse>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
  </cfif>
<cfif cgi.server_name contains "semiprecious.in">
<meta name=ICBM content="28.5573901, 77.1571443" />
<meta name="geo.position" content="28.5573901;77.1571443" />
<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
</cfif>
  <meta name="keywords" content="<cfoutput>#metakeywords#</cfoutput>">
  <meta name="description" content="<cfoutput>#metadescription#</cfoutput>">
  <script language="JavaScript" src="js/mm_menu.js"></script>
  <script type="text/javascript" language="JavaScript" src="/js/global.js"></script>
  <link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
  <link href="styles/hub.css" rel="stylesheet" type="text/css" />


  <style type="text/css">
<!--
.promos {
	font: 12px Arial, "Times New Roman", Times, serif;
	text-transform: capitalize;
	color: #333300;
	text-decoration: none;
}
-->
</style>
  <meta name="author" content="anup pandey" />
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
  <script language="JavaScript" src="js/imageswap.js"></script>

  </HEAD>
  <BODY  style="margin-top:0;font-size:12px;background:" onLoad="javascript:runSlideShow();">
	   <div align=center style="position:relative;">
	
<div style="padding-left:0px;width:930px;margin-top:1px;position:relative;" id="container1" >  
 
    <!---<CFINCLUDE template="js/hoverstonemenu.cfm">
style="border-top:1px groove #000066;border-right:1px groove #000066;" 
--->
<div style="margin-left: 142px; float: left; width: 610px; padding-top: 100px;">
    			<cfif session.mail is application.admin_email>
		  <cfinclude template="includes/wow.cfm" />
	<cfelse>
                    <cfinclude template="includes/index_center_new.cfm" />
           </cfif>     

    			</div>
<div style="width: 160px; z-index: 2; float: right; display: inline; margin-top: 100px;">

                    <cfinclude template="includes/right_menu.cfm" />
			</div>
     <div style="display: inline; z-index: 3; position: absolute; left: 0px; top: 100px;">
 		<!--- BEGIN LEFT SIDE STUF	F --->
		<cfset leftgemstonedisplay="inline" />
		<CFINCLUDE TEMPLATE="leftmenus.cfm">
	</div>		
		

<div style="z-index: 5; position: absolute; top: 0px; left: 0px; padding: 0pt; margin: 0pt;">
      <cfinclude template="#session.country#/header.cfm">
	</div>
		 <div style="clear:both" id="mainfooter">
             <cfinclude template="mainfooter.cfm">
         <!--- End footer --->
   </div><!--- End all footer stuff --->

  </div><!--- width 906--->
 
      
 </div><!--- align center --->
  </BODY>
  </HTML>
