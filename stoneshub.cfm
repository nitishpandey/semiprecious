<!-- stoneshub.cfm starts -->
<cftry>
	<cfsilent>
		<CFPARAM NAME="itemcount" DEFAULT="0" >
		<CFPARAM NAME="sortorder" DEFAULT="" >

		<CFPARAM NAME="category" DEFAULT="">
		<cfparam name="metatitle" default="">
		<cfparam name="metadescription" default="">
		<cfparam name="url.ringsize" default="">
		<cfparam name="metakeywords" default="">
		<cfparam name="pendantsdone" default="no">
		<cfparam name="earringsdone" default="no">
		<cfparam name="braceletsdone" default="no">
		<cfparam name="subcat2" default="">
		<cfparam name="birthstone" default="">
		<cfparam name="description" default="">
		<CFPARAM NAME="edit" DEFAULT= "">
		<CFPARAM NAME="newtstart" DEFAULT= "1">
		<CFPARAM NAME="url.subcat" DEFAULT= subcat>

		<CFPARAM NAME="salestatus" DEFAULT="">
		<CFPARAM NAME="newcart" DEFAULT="">
		<CFPARAM NAME="pricegreater" DEFAULT="">

		<cfparam name="pagedescription" default="">
		<cfparam name="screensize" default="big">


			<cfif session.mail eq 'acemat@vsnl.com'>
			<cfset url.edit =  'mamamia'>

		</cfif>


		<CFPARAM NAME="category2" DEFAULT="ALL" >
		<CFIF CATEGORY  EQ "">
			<CFSET CATEGORY ="ALL">
		</CFIF>


		<CFSET CATEGORY2=CATEGORY>
		<CFPARAM NAME="subcat" DEFAULT= "">
		<CFPARAM NAME="subcat2" DEFAULT= "">




	<cfset start=1>
		<!--- meta tags addition for groups--->
		<cfparam name="groupname" default="">
		<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where domain='#cgi.server_name#' and  pagename='#replace(Trim(CGI.script_path),"/","")#'
	</cfquery>
		<cfif contentbypage.recordcount GT 0>
			<cfif cgi.server_name contains 'semipreciouswholesale.com'>
				<cfset metatitle="Wholesale #lcase(subcat)# jewelry healing crystals">
				<cfset metadescription="Wholesale #lcase(subcat)# jewelry pendants necklaces rings bracelets jewellery beaded and silver, beads and healing crystals. #contentbypage.metadescription#">
				<cfset metakeywords="<cfif contentbypage.keywords neq ''>#contentbypage.keywords#<cfelse>Wholesale #lcase(subcat)# jewelry, wholesale #lcase(subcat)# silver jewellery, wholesale #lcase(subcat)# beads, wholesale healing crystals, wholesale #lcase(subcat)# necklaces, wholesale #lcase(subcat)# rings, wholesale #lcase(subcat)# pendants, wholesale #lcase(subcat)# bracelets</cfif>">
				<cfset pagedescription="<cfif contentbypage.description neq ''>#contentbypage.description#<cfelse>
					For reselling our wholesale #lcase(subcat)# jewelry is the best, we have the best prices and quality for retail stores to sell wholesale #lcase(subcat)# silver jewelry. We have thousands of designs including wholesale #lcase(subcat)# beads, wholesale healing crystals, wholesale #lcase(subcat)# necklaces, wholesale #lcase(subcat)# rings, wholesale #lcase(subcat)# pendants, wholesale #lcase(subcat)# bracelets</cfif>">
				>
		<cfelse>
				<cfset metatitle="#lcase(subcat)# jewelry, necklaces, pendants, rings, bracelets, healing stones #titlecase(contentbypage.title)#">
				<cfset metatitle="#titlecase(metatitle)#">
				<cfset metadescription="#lcase(subcat)# jewelry pendants necklaces rings bracelets jewellery beaded and silver, beads and healing crystals. #contentbypage.metadescription#">
				<cfset metakeywords="#contentbypage.keywords#">
				<cfset pagedescription="#contentbypage.description#">
			</cfif>
		</cfif>

		<cftry>
			<cfquery DATASOURCE="gemssql"  name="getlist" >
					  Select distinct subcat, cat, style, inventory from qryCatSubcatBeadedAndSilverInventory where (subcat='#subcat#' ) and inventory >0 order by cat desc, inventory desc
  </cfquery>
			<cfcatch type="any">
				<b>
					Sorry, there has been a database error, please call us at 1 888 563 3943 to inform us.
				</b>
				<cfif	!isdefined("url.decache")>
					<!--- add redirection to self with this url variable. hopefully it will not use the cache
						--->
				</cfif>
				<cfscript>
					createobject("backing_beans.mailer").sendmail(mailto: 'stacyanup@gmail.com',
					subject: 'error at stoneshub',
					mailcontent: '#cfcatch.detail#-#cfcatch.message#-#cgi.url#');
				</cfscript>
			</cfcatch>
		</cftry>
		</cfsilent>
		<CFIF not isdefined("gETLIst.recordcount") >
			<!--- <cfinclude template="#session.country#header.cfm"> --->
			<CFINCLUDE TEMPLATE="/header.cfm">
			<div id="container2">
				<br>
				<span class="error">
					No items found. PLEASE TRY AGAIN.
				</span>
				<cfif subcat is 'amber'>
					<cfinclude template="pippinindex.htm">
				</cfif>
			</div>
			</div>
			<cfinclude template="/mainfooter.cfm">
			<CFSET enddisplay= start + display -1 >
			<cfabort />
		</cfif>
		<CFOUTPUT>
			<cfsavecontent variable="title">

              <cfif metatitle neq "">
            		Semprecious #titleCase(subcat)# jewelry #metatitle#
                <cfelse>
                        <cfif cgi.server_name contains 'wholesale'>
                   			 Wholesale Stock for
                        </cfif>

      			     Silver and  #titleCase(subcat)#  gemstone <cfif category is 'All'> Jewelery <cfelse>#titlecase(category)#</cfif> in a range of styles

              </cfif>
  </cfsavecontent>
			<cfsavecontent variable="inheader">


		  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale.com'> Wholesale</cfif>Affordable #subcat#  Gem stone  bracelets, rings, beads, pendants jewelry"</cfif>>
		  <meta name="author" content="Anup Pandey" />
		  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale.com'> Wholesale</cfif>#subcat#  gem stone pendants, rings, bracelets jewelry for retail and wholesale.
			<CFLOOP QUERY="Getlist" startrow="#start#"
				endrow="#evaluate(start+5)#">#description#. </cfloop>'</cfif>>

		</cfsavecontent>
		</cfoutput>

	<CFINCLUDE TEMPLATE="/header.cfm">
			<cfif cgi.server_name contains "semiprecious.in" or cgi.server_name contains "forcesofindia">
			<cfif cgi.query_string neq "">
				<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
			<cfelse>
				<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
			</cfif>
			<cfheader statuscode="301" statustext="Moved permanently">
			<cfheader name="Location" value="#newurl#">
		</cfif>

		<cfcache  action="cache" timespan="#createtimespan(0,10,0,0)#">

		<div id="container2">
	<!-- cached at
	<cfoutput>

	#createodbcdatetime(now())# for #getbasetemplatepath()#

	</cfoutput>
	-->

		<!---	<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
			<cfif session.bulkbuyer.id eq "">
			<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
			</cfif>
			</cfif>--->

		<!--- end meta tags for groups ---->


		<table cellspacing="0" border="0"
		<cfif mobile>
			width="100%"
		</cfif>
		>
		<tr  align="center">
			<td valign="top"
			<cfif !mobile>
				width="180px"
			</cfif>
			align="left">
			<!--- BEGIN LEFT SIDE STUFF --->
			<cfset leftgemstonedisplay="inline" />
			<cfcache action="serverCache" timespan="10">
				<!-- output from leftmenus.cfm -->
				<CFINCLUDE TEMPLATE="leftmenus.cfm" />
			</cfcache>
			<!--- END LEFT SIDE STUFF --->
			</td>
			<!--- MOBILE --->
			<cfif mobile>
		</tr>
		</table> <table cellspacing="0" cellpadding="2" border="0" > <tr  align="center"> </cfif>
		 <td align="right" valign="top" style="border:1px ##DDDDDD ridge;">
<table style="margin-left:0px;text-align:center;horizontal-align:center;margin-top:2px;padding:5px 5px 5px 10px"  border="0" cellspacing="0"  cellpadding="0"> <!--- stone type image --->
		 <cfset subcatunspaced = replace(trim(subcat)," ","")>
		  <cfcache action="serverCache" timespan="10">
			   <tr> <td align="left" valign="top" colspan="2" >

				   <cfoutput> <img src="/images/stoneshub/#subcatunspaced#.jpg" style="float:left;padding:4px;padding-top:0px;" >
				   <span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'> <h1 class="hub_heading">#ucase(subcat)# JEWELRY</h1> <cfoutput>#pagedescription#</cfoutput> </span> </cfoutput> </td> </tr> <!--- End stone type image row --->
				   <CFINCLUDE TEMPLATE="hubs-bystone.cfm" />
			</cfcache> <cfif pagedescription neq "" or session.mail is 'acemat@vsnl.com'>
			 <Tr valign="middle"> <td valign="middle" style="color:##666600;" class="rowb"  colspan="2"> <cfif session.mail is application.admin_email>
				 <a href="/admintools/contentadder.cfm?pagename=<cfoutput>#right(currentfile, len(currentfile)-1)#</cfoutput>">Content Edit</a> </cfif> </td> </tr> </cfif>
				 <cfset subcat3 = replace(trim(subcat),"_","")> <cfset subcat3 = replace(trim(subcat3)," ","")>
				 <tr  bgcolor="white"> <td align="center" height=30   colspan="2"><cfoutput><a title="Lots of Designs in #subcat#" href=#subcat3#_jewelry.cfm>SEE RANDOM #ucase(subcat)# JEWELRY</cfoutput></a></td> </tr> <!--- End Matt Bayuk - SGM ---> <!---<cfinclude  template="statsrecord.cfm">---> <cfinclude template="includes/linkexchangebystone.cfm">
				 <cfoutput>
					  <tr> <td  align="middle"  colspan="2"> <!---<a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>--->
			 </td> </tr> <cfinclude template="marketing/stonelinks.cfm">
			   </cfoutput>
                 </table> </td> </tr> </table>
		<!--- no requirement seen here
		<cfoutput>

			<script language="JavaScript1.1">
				function showDetails(itemNum) {
					hideAll();
					document.getElementById('div' + itemNum).style.display = 'block';
				}

				function displayZoom(zoomImg, imageWidth) {
					$.blockUI.defaults.css = {};
					$.blockUI({
						message: "<<<<<<<<<<<<<input type='button' id='closeZoom' value='Close' /><br><img src='" + zoomImg + "' />",
						css: {
							width: imageWidth + 'px',
							padding: 0,
							margin: 0,
							top: (jQuery(window).height() - 500) / 2 + 'px',
							left: (jQuery(window).width() - imageWidth) / 2 + 'px',
							textAlign: 'center',
							color: '##000',
							border: '3px solid ##aaa',
							backgroundColor: '##fff'
						}
					});
					$('##closeZoom').click(function() {
						$.unblockUI();
					});
					//		    setTimeout(jQuery.unblockUI, 2000);
				}
				function zoomImage(zoomImg) {
					imgZoom = new Image();
					imgZoom.src = zoomImg;
					if (imgZoom.width > 0) {
						displayZoom(zoomImg, imgZoom.width);
					}
					else {
						imgZoom.onload = function() {
							imgZoom.onload = null;
							displayZoom(zoomImg, imgZoom.width);
						}
					}
				}
			</script>

			<script language="JavaScript1.1">
				function hidex() {
					divx.style.display = 'none';
				}
				function hideAll() {
					for (i = 1; i <= #itemcount#; i++) {
						eval('div' + i).style.display = 'none';
					}
				}
				/*
				 ShowHide('jumpstart');
				 <cfif start eq 1>
				 ShowHide('jumpstartblinder');
				 </cfif>
				 */
			</script>
		</cfoutput>
		--->

	</div>
	</cfcache>
	</div>
	<cfinclude template="/mainfooter.cfm">
	<cfcatch type="any">
		<cfdump var='#cfcatch#' />
	</cfcatch>
</cftry>
<!-- stoneshub.cfm ends -->
