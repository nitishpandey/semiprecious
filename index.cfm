<cfcache action="cache" timespan="#createTimeSpan(0,0,30,0)#">
										  
<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
	<cfset newurl= "http://www."& cgi.server_name>
	<cfheader statuscode="301" statustext="Moved permanently">
	<cfheader name="Location" value="#newurl#">
</cfif>
<cfsilent>
	<cfparam name="session.bulkbuyer.id" default="">
	<cfparam name="affil" default="-">
	<cfparam name="metatitle" default="">
	<cfparam name="metadescription" default="">
	<cfparam name="metakeywords" default="">
</cfsilent>
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
	<CFPARAM NAME="session.affil" DEFAULT="-">
	<cfset session.affil=affil>
	<cfparam name="session.filter" default="salestatus=3">
	<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='index.cfm' and domain ='#cgi.server_name#'
	</cfquery>
	<cfif cgi.server_name contains 'wholesale'>
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
	<!--- TODO: 1 Nov 2014. Get conents of this from older file over here --->
	<CFINCLUDE TEMPLATE="setup.cfm">
	---> 
</cfsilent>
	<cfif cgi.server_name contains 'semipreciouswholesale.com'>
		
			<meta name="verify-v1" content="AEBLhretFXvzExOTH0gwqJLWaBi+tN2tB/L2fsLDGSc=" >
		<cfelse>
		
			<META name="verify-v1" content="qm7Tbru8zXcyS+Ul5gg82c3CD3LAhOl6WZ3tLKub3Zs=" />
		<link rel="canonical" href="http://www.semiprecious.com" />
		</cfif>
	<cfset title="#metatitle#" />

<cfsavecontent variable="inheader">   
	
		<!--- how to use rdf scripts? --->
		<cfif cgi.server_name contains 'wholesale'>
			<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (n 0 s 0 v 0 l 0))'>
		<cfelse>
			<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
		</cfif>
		<meta name="google-site-verification" content="DkigBobNrTChIEYmwD3PFkSFA9ORp9chDgr7656EoRc" /><meta name="keywords" content="<cfoutput>#metakeywords#</cfoutput>">
		<meta name="description" content="<cfoutput>#metadescription#</cfoutput>">
		<script language="JavaScript" src="js/mm_menu.js"></script>
		<link href="styles/hub_ws.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="topmenu.files/dmenu.js"></script>
		<!-- Deluxe Menu -->
		<noscript>
			<p>
				<a href="http://deluxe-menu.com">
					Javascript Menu by Deluxe-Menu.com
				</a>
			</p>
		</noscript>
		<script type="text/javascript" src="/newtopmenu.files/dmenu.js"></script>
		<!-- (c) 2009, by Deluxe-Menu.com -->
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
}function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//--> 
</script>
		<script language="JavaScript" src="js/imageswap.js"></script>
	</cfsavecontent>
			<cfif cgi.server_name contains "semiprecious.in">
				<cfinclude template="headerindia.cfm">
			<cfelse>
				<cfinclude template="header.cfm">
			</cfif>
			<!---<CFINCLUDE template="js/hoverstonemenu.cfm">
				style="border-top:1px groove #000066;border-right:1px groove #000066;" 
				--->
				<table id="container2" style="padding-left:2px;margin-top:30px;"  border="0" >
							<tr>
								<td  align=left valign='top' >
									<!--- BEGIN LEFT SIDE STUFF --->
									<cfif cgi.SERVER_NAME does not contain 'wholesale'>
										<div id="home_page_left_menu" style="position:relative;float:left;display:inline;width:160px;">
											<CFINCLUDE TEMPLATE="home_page_left_menu.cfm">
										</div>
									</cfif>
									<!--- END LEFT SIDE STUFF --->
									<!---	</cfif>--->
								</td>
								<td valign='top'   align="left" >
									<table>
										<tr>
											<td align=
											<cfif cgi.http_user_agent contains 'MSIE'>
												"right"
											<cfelse>
												"center"
											</cfif> 
											> 
											<cfinclude template="indexcenter.cfm" />
											</td> 
										</tr>
										</table></td></tr>
<tr>
											<td colspan="2">
												<!--- Begin all footer stuff --->
												<!--- Footer --->
												<cfinclude template="mainfooter.cfm">
												<!--- End footer --->
											</td>
										</tr>
										<tr>
											<td colspan=2>
												<cfif cgi.server_name neq "63.135.126.234" >
													<div align="center">
														<!---<cfinclude template="adminfooter.cfm" >--->
															</div>
												</cfif>
												<!--- End all footer stuff --->
											</td>
										</tr>
									</table>
						
			</div>
</div>
		<!---
				<CFINCLUDE template="new_jewelry.inc">
				---> <!--- <cfoutput><cfset balance = session.screenwidth - 800>
				<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
				</cfoutput> --->
	