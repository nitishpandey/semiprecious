<<<<<<< HEAD
<!-- index.cfm starts-->
<!--- disabled because cfset mobile in header.cfm <cfif reFindNoCase("(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0><cflocation url="index-mobile.cfm"></cfif><!-- http://detectmobilebrowsers.com/ -->
--->
=======
<<<<<<< HEAD
<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
	<cfset newurl= "http://www."& cgi.server_name>
	<cfheader statuscode="301" statustext="Moved permanently">
	<cfheader name="Location" value="#newurl#">
</cfif>
=======
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
>>>>>>> origin/master
<cfsilent>
	<cfparam name="session.bulkbuyer.id" default="">
	<cfparam name="affil" default="-">

</cfsilent>
<!---<cfif CGI.SERVER_NAME contains "semiprecious.in">
	<cfinclude template="/india/index.cfm">
<cfelse>--->
<cfsilent>
    <cfif CGI.SERVER_NAME IS "semiprecious.com">
    		<cflocation url="www.semiprecious.com" statuscode="301" addtoken="false">
    </cfif>
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
<<<<<<< HEAD
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
	<!--- TODO: 1 Nov 2014. Get conents of this from older file over here --->
	<CFINCLUDE TEMPLATE="setup.cfm">
	---> 
</cfsilent>
	<cfif cgi.server_name contains 'semipreciouswholesale.com'>
		
			<meta name="verify-v1" content="AEBLhretFXvzExOTH0gwqJLWaBi+tN2tB/L2fsLDGSc=" >
		<cfelse>
		
			<META name="verify-v1" content="qm7Tbru8zXcyS+Ul5gg82c3CD3LAhOl6WZ3tLKub3Zs=" />
		</cfif>
	<cfset title="#metatitle#" />

<cfsavecontent variable="inheader">
	
=======
	<cfif cgi.server_name contains 'wholesale'>
		<cfset metatitle="Wholesale Bulk #contentbypage.title#" />
		<cfset metadescription="Wholesale #contentbypage.metadescription#" />
		<cfset metakeywords="Wholesale #contentbypage.keywords#" />
		<cfset pagedescription="Wholesale #contentbypage.description#" />
	<cfelse>
		<cfset metatitle="#contentbypage.title#" />
		<cfset metadescription="#contentbypage.metadescription#" />
		<cfset metakeywords="#contentbypage.keywords#" />
		<cfset pagedescription="#contentbypage.description#" />
	</cfif>
	<!--- TODO: 1 Nov 2014. Get conents of this from older file over here --->
	<CFINCLUDE TEMPLATE="setup.cfm">
	--->
</cfsilent>

<cfset title="#metatitle#" />
<cfsavecontent variable="inheader">
<<<<<<< HEAD



		<link href="styles/hub_ws.css" rel="stylesheet" type="text/css" />

=======
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
		<!--- how to use rdf scripts? --->
		<cfif cgi.server_name contains 'wholesale'>
			<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (n 0 s 0 v 0 l 0))'>
		<cfelse>
			<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
		</cfif>
		<meta name="google-site-verification" content="DkigBobNrTChIEYmwD3PFkSFA9ORp9chDgr7656EoRc" /><meta name="keywords" content="<cfoutput>#metakeywords#</cfoutput>">
		<meta name="description" content="<cfoutput>#metadescription#</cfoutput>">
<<<<<<< HEAD
		<script language="JavaScript" src="js/mm_menu.js"></script>
		<link href="styles/hub.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="topmenu.files/dmenu.js"></script>
=======

		<script language="JavaScript" src="js/mm_menu.js">
		</script>
		<link href="styles/hub_ws.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="topmenu.files/dmenu.js">
		</script>
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
		<!-- Deluxe Menu -->
		<noscript>
			<p>
				<a href="http://deluxe-menu.com">
					Javascript Menu by Deluxe-Menu.com
				</a>
			</p>
		</noscript>
<<<<<<< HEAD
		<script type="text/javascript" src="/newtopmenu.files/dmenu.js"></script>
=======

		<script type="text/javascript" src="/newtopmenu.files/dmenu.js">
		</script>
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
>>>>>>> origin/master
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
<<<<<<< HEAD
=======
		<meta name="author" content="anup pandey" />
<<<<<<< HEAD
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
	
=======
>>>>>>> origin/master





	</cfsavecontent>


<cfinclude template="header.cfm" />

<!---<CFINCLUDE template="js/hoverstonemenu.cfm">
	style="border-top:1px groove #000066;border-right:1px groove #000066;"
	--->
	<cfset usecache = false />
	<cfif  (len(trim(session.mail)) is 0) >
		<cfset usecache = true />
	</cfif>



<cfif mobile>
<cfcache usecache="true" action="servercache" timespan="#createTimeSpan(1,10,0,0)#">
	<CFINCLUDE TEMPLATE="home_page_left_menu.cfm" />
</cfcache>
<cfcache usecache="#usecache#" action="servercache" timespan="#createTimeSpan(0,10,0,0)#">
	<cfinclude template="indexcenter.cfm" />
	</cfcache>
<cfelse>

<table id="container2" style="padding-left:2px;margin-top:30px;"  border="0" >
	<tr>
		<td  align=left valign='top' >
			<!--- BEGIN LEFT SIDE STUFF --->
    			<cfif cgi.SERVER_NAME does not contain 'wholesale'>
				<div id="home_page_left_menu" style="position:relative;float:left;display:inline;width:180px;">
					<cfcache usecache="true" action="servercache" timespan="#createTimeSpan(1,10,0,0)#">
							<CFINCLUDE TEMPLATE="home_page_left_menu.cfm" />
					</cfcache>
				</div>
				<cfelse>
				&nbsp;
			</cfif>
			<!--- END LEFT SIDE STUFF --->
			<!---	</cfif>--->
		</td>
		<td valign='top'   align="left" >
					<cfcache usecache="#usecache#" action="servercache" timespan="#createTimeSpan(0,10,0,0)#">
						<cfinclude template="indexcenter.cfm" />
					</cfcache>
		</td>
	</tr>

	</table>

</cfif>

</div>
</div>
<cfinclude template="mainfooter.cfm" />

<!---
	<CFINCLUDE template="new_jewelry.inc">
	--->
<!--- <cfoutput><cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
	</cfoutput> --->
<<<<<<< HEAD
<!-- index.cfm ends-->
=======
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
>>>>>>> origin/master
