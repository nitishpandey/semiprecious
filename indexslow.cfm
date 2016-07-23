<cfif isdefined("url.admin")>
<cfdump var="#session#" />
</cfif>
<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
<cfset newurl= "http://www."& cgi.server_name>
  <cfheader statuscode="301" statustext="Moved permanently">
  <cfheader name="Location" value="#newurl#">
   
</cfif>

<cfparam name="agentid" default="0">
<cfparam name="agentfolder" default="">
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
  <cfif cgi.server_name contains "gem-stones.com">
    <cflocation url="http://www.gem-stones.com/agent" addtoken="no">
  </cfif>

  <cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='index.cfm' and domain ='#cgi.server_name#'
	</cfquery>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
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
  <CFINCLUDE TEMPLATE="setup.cfm">
  </cfsilent>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
  <cfif cgi.server_name contains 'wholesale'>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
<meta name="google-site-verification" content="zc183UPRVHgeWD276GxvkhCaOtoA8Xl7Xd_SILEuSGs" />
    <cfelse>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
<!-- Google Website Optimizer Control Script -->
<script>
function utmx_section(){}function utmx(){}
(function(){var k='4246402729',d=document,l=d.location,c=d.cookie;function f(n){
if(c){var i=c.indexOf(n+'=');if(i>-1){var j=c.indexOf(';',i);return c.substring(i+n.
length+1,j<0?c.length:j)}}}var x=f('__utmx'),xx=f('__utmxx'),h=l.hash;
d.write('<sc'+'ript src="'+
'http'+(l.protocol=='https:'?'s://ssl':'://www')+'.google-analytics.com'
+'/siteopt.js?v=1&utmxkey='+k+'&utmx='+(x?x:'')+'&utmxx='+(xx?xx:'')+'&utmxtime='
+new Date().valueOf()+(h?'&utmxhash='+escape(h.substr(1)):'')+
'" type="text/javascript" charset="utf-8"></sc'+'ript>')})();
</script><script>utmx("url",'A/B');</script>
<!-- End of Google Website Optimizer Control Script -->
    <META name="verify-v1" content="qm7Tbru8zXcyS+Ul5gg82c3CD3LAhOl6WZ3tLKub3Zs=" />
  </cfif>
  <!--- how to use rdf scripts? --->
  <cfif cgi.server_name contains 'wholesale'>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://wholesale.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://wholesale.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
    <cfelse>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
  </cfif>
<cfif cgi.server_name contains ".in">
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
  <BODY  link="black"   topmargin='0' vlink="black" text='black'  alink="black" onLoad="MM_preloadImages('images/healing/newhotroll.gif')">
<cfif isdefined("url.admin")>
<cfdump var="#session#" />
</cfif>
	   <div align=center>
	<cfif agentfolder neq "">
      <cfinclude template="agent/header.cfm">
	  <cfelse>
	  <cfinclude template="#session.country#/header.cfm">
	 </cfif>
  
    <!---<CFINCLUDE template="js/hoverstonemenu.cfm">
style="border-top:1px groove #000066;border-right:1px groove #000066;" 
--->
    <div style="padding-left:0px">
      <table width=930 id="container1" border="0" cellspacing="0"  cellpadding="0">
        <!---border=0 cellpadding="0" cellspacing="0"   background="white" width="1000">--->
        <tr valign="top" valign=top align=left >
          <td align="left" valign="top"   >
            <table  border="0"  cellpadding="0" cellspacing="0" >
              <tr>
                <td  align=left valign='top'>
 		<!--- BEGIN LEFT SIDE STUFF --->
		<cfset leftgemstonedisplay="inline" />
		<cfif agentfolder eq "">
<CFINCLUDE TEMPLATE="leftmenus.cfm"></cfif>
          <!--- END LEFT SIDE STUFF --->
                  <!---	</cfif>--->
                </td>
                <td valign='top'   align="left" >
		<cfif isdefined("url.admin")>
<cfdump var="#session#" />
</cfif>		<table><tr><td align=left>
				    <cfif cgi.server_name eq "63.135.126.234" or cgi.server_name is 'www.ornamentscollect.com'>
                    <cfinclude template="indexcenteragent.cfm" />
                    <cfelseif cgi.server_name contains "wholesale">
                    <cfinclude template="/includes/indexcenterwholesale.cfm" />
                    <cfelse>
                    <cfinclude template="/includes/indexcenter.cfm" />
                  </cfif></td>
				  </tr><tr><td>
    <!--- Begin all footer stuff --->
         <!--- Footer --->
    <cfinclude template="mainfooter.cfm">
         <!--- End footer --->
		 <cfif cgi.server_name neq "63.135.126.234" >
      <div align="center">
        <!---<cfinclude template="adminfooter.cfm" >--->
        <strong>Site Developed and Maintained by <a href=http://www.DynamicWebTX.com>www.DynamicWebTX.com</a> All rights reserved</strong>.</div>
    </cfif>
</td></tr>
<tr><td >
    
<!--- End all footer stuff --->
       <cfif isdefined("url.admin")>
<cfdump var="#session#" />
</cfif>         </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
    </div>
   
    <!---
		<CFINCLUDE template="new_jewelry.inc">
--->
    <!--- <cfoutput><cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
	</cfoutput> --->

</div>

  </BODY>
  </HTML>
