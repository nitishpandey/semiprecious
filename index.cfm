<!--- disabled because cfset mobile in header.cfm <cfif reFindNoCase("(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0><cflocation url="index-mobile.cfm"></cfif><!-- http://detectmobilebrowsers.com/ -->
--->
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
	<cfif cgi.server_name contains 'semipreciouswholesale.com'>
	<meta name="verify-v1" content="AEBLhretFXvzExOTH0gwqJLWaBi+tN2tB/L2fsLDGSc=" >
<cfelse>
	<META name="verify-v1" content="qm7Tbru8zXcyS+Ul5gg82c3CD3LAhOl6WZ3tLKub3Zs=" />
	<link rel="canonical" href="http://www.semiprecious.com" />
</cfif>
		<!--- how to use rdf scripts? --->
		<cfif cgi.server_name contains 'wholesale'>
			<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.wholesale-gemstone-jewelry.com" r (n 0 s 0 v 0 l 0))'>
		<cfelse>
			<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
		</cfif>
		<meta name="google-site-verification" content="DkigBobNrTChIEYmwD3PFkSFA9ORp9chDgr7656EoRc" /><meta name="keywords" content="<cfoutput>#metakeywords#</cfoutput>">
		<meta name="description" content="<cfoutput>#metadescription#</cfoutput>">


		<link href="styles/hub_ws.css" rel="stylesheet" type="text/css" />

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




	</cfsavecontent>


<cfinclude template="header.cfm" />

<!---<CFINCLUDE template="js/hoverstonemenu.cfm">
	style="border-top:1px groove #000066;border-right:1px groove #000066;"
	--->
	<cfset usecache = false />
	<cfif (session.cartitem[1][1] is  0) AND (len(trim(session.mail)) is 0) >
		<cfset usecache = true />
	</cfif>

<cfcache usecache="#usecache#" action="cache" timespan="#createTimeSpan(0,10,0,0)#">


<cfif mobile>
	<CFINCLUDE TEMPLATE="home_page_left_menu.cfm" />
	<cfinclude template="indexcenter.cfm" />
<cfelse>

<table id="container2" style="padding-left:2px;margin-top:30px;"  border="0" >
	<tr>
		<td  align=left valign='top' >
			<!--- BEGIN LEFT SIDE STUFF --->
    			<cfif cgi.SERVER_NAME does not contain 'wholesale'>
				<div id="home_page_left_menu" style="position:relative;float:left;display:inline;width:180px;">
					<CFINCLUDE TEMPLATE="home_page_left_menu.cfm" />
				</div>
				<cfelse>
				&nbsp;
			</cfif>
			<!--- END LEFT SIDE STUFF --->
			<!---	</cfif>--->
		</td>
		<td valign='top'   align="left" >
					<cfinclude template="indexcenter.cfm" />
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
