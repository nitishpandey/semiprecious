
<cfif #cgi.server_name# does not contain "www." and #cgi.server_name# contains "semiprecious">
  <cfset newurl= "http://www.semiprecious.com">
  <cfheader statuscode="301" statustext="Moved permanently">
  <cfheader name="Location" value="#newurl#">
</cfif>
<cfsilent>
<cfparam name="affil" default="-">
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
</cfsilent>
<cfif CGI.SERVER_NAME contains "semiprecious.in">
  <cfinclude template="/india/index.cfm">
  <cfelse>
  <cfsilent>
  <cfif CGI.SERVER_NAME IS "www.forcesofindia.com" or cgi.server_name IS "forcesofindia.com">
    <cflocation url="http://www.forcesofIndia.com/headhunting" addtoken="no">
  </cfif>
  <cfif cgi.server_name IS "semiprecious.com">
    <cfheader statuscode="301" statustext="Moved permanently">
    <cfheader name="Location" value="http://www.semiprecious.com">
  </cfif>
  <cfif CGI.SERVER_NAME contains "gem-stones.com">
    <cflocation url="http://www.gem-stones.com/gemstones" addtoken="no">
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
  <CFPARAM NAME="session.affil" DEFAULT="-">
  <cfset session.affil=affil>

  <cfparam name="session.filter" default="salestatus=3">
  <cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='index.cfm'
	</cfquery>
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <cfset metatitle="Wholesale Bulk #contentbypage.title#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
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
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
    <meta name="verify-v1" content="AEBLhretFXvzExOTH0gwqJLWaBi+tN2tB/L2fsLDGSc=" >
    <cfelse>
    <TITLE><cfoutput>#metatitle#</cfoutput></TITLE>
    <META name="verify-v1" content="qm7Tbru8zXcyS+Ul5gg82c3CD3LAhOl6WZ3tLKub3Zs=" />
  </cfif>
  <!--- how to use rdf scripts? --->
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (n 0 s 0 v 0 l 0))'>
    <cfelse>
    <meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
  </cfif>
  <meta name="keywords" content="<cfoutput>#metakeywords#</cfoutput>">
  <meta name="description" content="<cfoutput>#metadescription#</cfoutput>">
  <script language="JavaScript" src="js/mm_menu.js"></script>
  <script language="JavaScript" src="js/topmenu.js"></script>
  <link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
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
  <BODY  link="black"  topmargin='0' vlink="black" text='black'  alink="black" onLoad="MM_preloadImages('images/healing/newhotroll.gif')">
    <CFINCLUDE TEMPLATE="header.cfm">
    <!---<CFINCLUDE template="js/hoverstonemenu.cfm">
style="border-top:1px groove #000066;border-right:1px groove #000066;" 
--->
    <div style="padding-left:10px">
      <table width=1000 border="0" cellspacing="0"  cellpadding="0">
        <!---border=0 cellpadding="0" cellspacing="0"   background="white" width="1000">--->
        <tr valign="top" align=center >
          <td align="center" valign="top"   >
            <table  border="0"  cellpadding="0" cellspacing="0" >
              <tr>
                <td  align ='left' valign='top'>
 		<!--- BEGIN LEFT SIDE STUFF --->
<CFINCLUDE TEMPLATE="leftmenus.cfm">
          <!--- END LEFT SIDE STUFF --->
                  <!---	</cfif>--->
                </td>
                <td valign='top'   align="center" ><cfif cgi.server_name eq "63.135.126.234" or cgi.server_name is 'www.ornamentscollect.com'>
                    <cfinclude template="indexcenteragent.cfm" />
                    <cfelseif cgi.server_name contains "wholesale-gemstone-jewelry.com">
                    <cfinclude template="indexcenterwholesale.cfm" />
                    <cfelse>
                    <cfinclude template="indexcenter.cfm" />
                  </cfif>
    <!--- Begin all footer stuff --->
         <!--- Footer --->
             <cfinclude template="/mainfooter.cfm">
         <!--- End footer --->
         <br>
<!--- <cfinclude template="marketing/jewelry-directories.cfm">--->
 <br>
 		  <cfif cgi.server_name neq "63.135.126.234">
              <table  border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td  colspan="5" align=center  bgcolor="#003366" style="color:#FFFFFF">Advertisements</td>
                </tr>
                <tr>
                  <td align="center" valign="top" width="20%" >
                    <a href="http://www.haldiramsUSA.com" class="promos">Yummy Gourmet 
                    Indian Snacks & Sweets</a> </td>
                  <td align=center  valign="top" >
                    <a href="http://www.jewelrycentral.com" class="promos"> Jewelry 
                    Central Member </a> </td>
                  <td align="center" valign="top" width="20%">
                    <a href="http://www.forcesofindia.com/" target="foi"  class="promos">Hire from India</a><br><span  style="color:#666699;">Certified Managers<br>
                      Ex-Defence Officers</span></Td>
 
                  <td width="20%" valign="top" align="center"   ><a href="free-jewelry.htm"  class="promos">Free Jewelry</a> </td>

                  <td width="20%"  valign="top"  align="center" ><a href="http://www.wholesalegemshop.com/"  class="promos">Wholesale Silver Jewelry</a> </td>
                </tr>
              </table>
            </cfif>
            <br>
    <cfif cgi.server_name neq "63.135.126.234" >
      <div align="center">
        <!---<cfinclude template="adminfooter.cfm" >--->
        <strong>Site Developed and Maintained by <a href=http://www.DynamicWebTX.com>www.DynamicWebTX.com</a> All rights reserved</strong>.</div>
    </cfif>
<!--- End all footer stuff --->
                </td>
              </tr>
            </table>
            </td>
        </tr>
      </table>
    </div>
   
    <!---
		<CFINCLUDE template="new_jewelry.inc">
--->
    <script language="JavaScript1.1">

/*	document.getElementById("home").style.color = "maroon";
  document.getElementById("home").style.textDecoration = "none" ;*/
	
	</script>
    <!--- <cfoutput><cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
	</cfoutput> --->


  </BODY>
  </HTML>
</cfif>
