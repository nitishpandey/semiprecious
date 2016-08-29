<cftry>
	<cfsilent>
		<CFPARAM NAME="itemcount" DEFAULT="0" >
		<CFPARAM NAME="sortorder" DEFAULT="" >
		<CFPARAM NAME="start" DEFAULT= "">
		<CFPARAM NAME="category" DEFAULT="">
		<cfparam name="metatitle" default="">
		<cfparam name="metadescription" default="">
		<cfparam name="url.ringsize" default="">
		<cfparam name="metakeywords" default="">
		<cfparam name="LatesStartingBackMonths" default="1">
		<cfparam name="pendantsdone" default="no">
		<cfparam name="earringsdone" default="no">
		<cfparam name="braceletsdone" default="no">
		<cfparam name="subcat2" default="">
		<cfparam name="birthstone" default="">
		<cfparam name="description" default="">
		<CFPARAM NAME="edit" DEFAULT= "">
		<CFPARAM NAME="newtstart" DEFAULT= "1">
		<CFPARAM NAME="url.subcat" DEFAULT= subcat>
		<cfparam name="url.category" default=category />
		<CFPARAM NAME="advancedsearch" DEFAULT= "">
		<CFPARAM NAME="advancedsearch1" DEFAULT= "">
		<CFPARAM NAME="advancedsearch2" DEFAULT= "">
		<cfparam name="display" default="21" />
		<CFPARAM NAME="advancedsearch3" DEFAULT= "">
		<CFPARAM NAME="color" DEFAULT= "white">
		<CFPARAM NAME="salestatus" DEFAULT="">
		<CFPARAM NAME="newcart" DEFAULT="">
		<CFPARAM NAME="invent" DEFAULT="">
		<CFPARAM NAME="j" DEFAULT="">
		<CFPARAM NAME="pricegreater" DEFAULT="">
		<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
		<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
		<cfparam name="pagedescription" default="">
		<cfparam name="screensize" default="big">
		<cfparam name="style" default="">
		<cfparam name="url.style" default="">
		<cfif style neq "" and url.style eq "">
			<cfset url.style=style>
		</cfif>
		<cfparam name="silverjewelry" default="">
		<cfset sj = "">
		<cfparam name="invstatus" default=-3	>
		<cfif session.mail eq 'acemat@vsnl.com'>
			<cfset url.edit =  'mamamia'>
			<cfset invstatus= -5>
		</cfif>
		<cfparam default="662222" name="l">
		<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
		<cfparam name="displayrows" default="5">
		<CFPARAM NAME="displaycolumns" DEFAULT="4">
		<CFPARAM NAME="numpages" DEFAULT="0">
		<cfparam name="jewelrysize" default="">
		<cfparam default="106" name="stonelistht" >
		<CFPARAM NAME="category2" DEFAULT="ALL" >
		<CFIF CATEGORY  EQ "">
			<CFSET CATEGORY ="ALL">
		</CFIF>
		<cfif category is 'beads' and session.mail neq application.admin_email>
			<cfset invstatus=0>
		</cfif>
		<cfif category is "bracelets" or category is 'beads'>
			<cfset displayrows=3>
			<cfset displaycolumns="5">
		</cfif>
		<CFSET CATEGORY2=CATEGORY>
		<CFPARAM NAME="subcat" DEFAULT= "">
		<CFPARAM NAME="subcat2" DEFAULT= "">
		<CFPARAM NAME="priceless" DEFAULT="">
		<cfif priceless is "">
			<cfif subcat is "" and category neq "beads">
				<cfset priceless = "">
			</cfif>
		</cfif>
		<cfset price_array  = arraynew(1)>
		<cfset status_array  = arraynew(1)>
		<cfset item_array  = arraynew(1)>
		<cfset descr_array  = arraynew(1)>
		<Cfif style EQ "silver" or style EQ "silverbeaded">
			<cfset url.silverjewelry=silverjewelry>
		</Cfif>
		<CFINCLUDE TEMPLATE="setup.cfm">
		<cfif cgi.server_name contains "wholesale.com">
			<CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
		<cfelse>
			<cfif dateformat(now(),"dddd") eq "Sunday">
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought">
			<cfelseif dateformat(now(),"dddd") eq "Monday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
			<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
			<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought">
			<cfelseif dateformat(now(),"dddd") eq "Thursday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
			<cfelseif dateformat(now(),"dddd") eq "Friday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="newitem desc" >
			<cfelse>
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken desc" >
			</cfif>
		</cfif>
		<cfparam name="sortorder" default="">
		<cfif sortorder neq "">
			<cfset url.sortorder =sortorder>
		</cfif>
		<!---<cfif category is 'beads'><cfset url.sortorder = 'pricedesc'></cfif>--->
		<!--- <CFIF url.sortorder is 'price'>
			<CFSET url.sortorder='orderprice'>
			</cfif>
			<CFPARAM NAME="PicWidth" DEFAULT= "120">
			<cfoutput>url.sortorder is #url.sortorder#</cfoutput>
			need to figure out from where sort order is coming as datetakendesc --->
		<cfif url.sortorder eq 'datetakendesc' or url.sortorder eq 'newitemdesc' or url.sortorder eq 'datetaken'>
			<cfset url.sortorder = 'datetaken desc'>
		</cfif>
		<cfif url.sortorder is 'pricedesc'>
			<cfset url.sortorder = 'price desc' />
		</cfif>
		<cfif url.sortorder is 'lastbought'>
			<cfset url.sortorder = 'lastbought desc' />
		</cfif>
		<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
		<cfif isnumeric(advancedsearch)>
			<cflocation url="detail.cfm?newitem=#advancedsearch#">
		</cfif>
		<cfinclude template="checkinjection.cfm" />
		<cfscript>
			cgiqstring = CGI.QUERY_STRING;
			if (session.bulkbuyer.id neq "") {
				url.sortorder = replace(url.sortorder, 'price', 'wholesaleprice');
				url.sortorder = replace(url.sortorder, 'wholesalewholesale', 'wholesale');
				cgiqstring = replace(cgi.QUERY_STRING, 'sortorder=price', 'sortorder=wholesaleprice');
				// unable to do the following within cfscript, but possible in cfset so do outside // cgi.QUERY_STRING = cgiqstring;
			}
			session.gallery = 'list'; // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping
			IF(advancedsearch is not "") {
				category = "";
				subcat = "";
				advancedsearch = replacenocase(advancedsearch, " & ", " ");
				advancedsearch = replacenocase(advancedsearch, "'", "");
				advancedsearch = replacenocase(advancedsearch, "jewelry", " ");
				advancedsearch = replacenocase(advancedsearch, "items", " ");
				advancedsearch = replacenocase(advancedsearch, "item", " ");
				advancedsearch = replacenocase(advancedsearch, "gold stone", "Goldstone");
				advancedsearch = replacenocase(advancedsearch, "mixed stone", "multi-stone");
				advancedsearch = replacenocase(advancedsearch, "multistrand", "multi strand");
				advancedsearch = replacenocase(advancedsearch, "multistone", "multi stone");
				advancedsearch = replacenocase(advancedsearch, "shap", " styl");
				advancedsearch = replacenocase(advancedsearch, "shap", " styl");
				if (find("$", advancedsearch) or find("dollar", advancedsearch)) {
					remark = '(You can select price range at bottom)';
				}
				else {
					remark = '';
				}
				advancedsearch = replacenocase(advancedsearch, "jewellery", " ");
				advancedsearch = replacenocase(advancedsearch, " or ", " ");
				advancedsearch = replacenocase(advancedsearch, ",", " ");
				advancedsearch = replacenocase(advancedsearch, " on ", " ");
				advancedsearch = replacenocase(advancedsearch, "colored", " ");
				advancedsearch = replacenocase(advancedsearch, "coloured", " ");
				advancedsearch = replacenocase(advancedsearch, "quartz", "crystal quartz");
				advancedsearch = replacenocase(advancedsearch, "color", " ");
				advancedsearch = replacenocase(advancedsearch, "colour", " ");
				advancedsearch = replacenocase(advancedsearch, " with ", " ");
				advancedsearch = replacenocase(advancedsearch, " semiprecious ", " ");
				if (listlen(advancedsearch, " ") gt 0) {
					advancedsearch = replacenocase(advancedsearch, " and ", " ");
					advancedsearch1 = left(listGetat(advancedsearch, 1, " "), 4);
				}
				if (listlen(advancedsearch, " ") gt 1) {
					advancedsearch2 = left(listGetat(advancedsearch, 2, " "), 4);
				}
				if (listlen(advancedsearch, " ") gt 2) {
					advancedsearch3 = left(listGetat(advancedsearch, 3, " "), 4);
				}
				colors = 'Red,Blue,Gray,Orange,Green,Maroon,Black,Pink,White,Maroon,Purple';
				if (listcontainsnocase(colors, advancedsearch1)) {
					color = advancedsearch1;
				}
				display = 21;
				displaycolumns = 5;
				if (screensize is "small") {
					displaycolumns = 4;
				}
			}
		</cfscript>
		<cfset categ=category>
		<cfif category is "All">
			<cfset categ="jewelry">
		</cfif>
		<!---<cfif start neq "" or category neq "" or sortorder neq "">
			<cfheader statuscode='301' statustext='Moved permanently'>
			<cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#test.cfm'>
			<cfabort />
			</cfif>--->
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
			<cfelseif cgi.server_name contains "semiprecious.in">
				<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
				<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
				<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
				<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
			<cfelse>
				<cfset metatitle="#lcase(subcat)# jewelry, necklaces, pendants, rings, bracelets, healing stones #titlecase(contentbypage.title)#">
				<cfset metatitle="#titlecase(metatitle)#">
				<cfset metadescription="#lcase(subcat)# jewelry pendants necklaces rings bracelets jewellery beaded and silver, beads and healing crystals. #contentbypage.metadescription#">
				<cfset metakeywords="#contentbypage.keywords#">
				<cfset pagedescription="#contentbypage.description#">
			</cfif>
		</cfif>
		<cfif category is "ALL" or category is "">
			<cfset p = "Jewelry">
		<cfelse>
			<cfset p = category>
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
					mailcontent: '#cfcatch.detail#-#cfcatch.message#');
				</cfscript>
			</cfcatch>
		</cftry>
		</cfsilent>
		<CFIF not isdefined("gETLIst.recordcount") >
			<!--- <cfinclude template="#session.country#header.cfm"> --->
			<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
			<div id="container2">
				<br>
				<span class="error">
					No item found. PLEASE TRY AGAIN.
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
      			     Silver and  #titleCase(subcat)#  gemstone #titlecase(p)# in #titleCase(color)#  #style#
              </cfif>
  </cfsavecontent>
			<cfsavecontent variable="inheader">


		  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale.com'> Wholesale</cfif>Affordable #color# #subcat#, Gem stone,  #p#"</cfif>>
		  <meta name="author" content="Anup Pandey" />
		  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale.
			<CFLOOP QUERY="Getlist" startrow="#start#"
				endrow="#evaluate(start+5)#">#description#. </cfloop>'</cfif>>

		</cfsavecontent>
		</cfoutput>

	<CFINCLUDE TEMPLATE="/header.cfm">
	<div id="container2">
		<cfcache  action="cache" timespan="#createtimespan(0,10,0,0)#">
	<!-- cached at
	<cfoutput>
	#createodbcdatetime(now())#

	</cfoutput>
	-->

		<!---	<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
			<cfif session.bulkbuyer.id eq "">
			<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
			</cfif>
			</cfif>--->
		<cfif cgi.server_name contains "semiprecious.in" or cgi.server_name contains "forcesofindia">
			<cfif cgi.query_string neq "">
				<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
			<cfelse>
				<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
			</cfif>
			<cfheader statuscode="301" statustext="Moved permanently">
			<cfheader name="Location" value="#newurl#">
		</cfif>
		<!--- end meta tags for groups ---->
		<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
		<cfset currentfile='#Trim(CGI.path_info)#'>
		<!--- speed up things  --->
		<CFSET numpages=round(GetList.RecordCount/display)>
		<CFSET enddisplay= start + display -1>
		<cfoutput>
			<cfset display = displaycolumns*displayrows>
			<CFIF GetList.cat is not "">
				<input type='hidden' name='category' value='#GetList.cat#'>
			<CFELSE>
				<input type='hidden' name='category' value='#category#'>
			</cfif>
			<input type='hidden' name='url.sortorder' value='#url.sortorder#'>
		</cfoutput>
		<CFSET columns=1 />
		<CFSET rows=1 />
		<CFSET enddisplay= start + display-1 />
		<CFSET currentrow= start />
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
		 <cfset rowsdisplayed = 0> <table style="margin-left:0px;text-align:center;horizontal-align:center;margin-top:2px;padding:5px 5px 5px 10px"  border="0" cellspacing="0"  cellpadding="0"> <!--- stone type image --->
		 <cfset subcatunspaced = replace(trim(subcat)," ","")>
		  <cfcache action="serverCache" timespan="10">
			   <tr> <td align="left" valign="top" colspan="2" >

				   <cfoutput> <img src="/images/stoneshub/#subcatunspaced#.jpg" style="float:left;padding:4px" > <span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'> <h1><font color=gray face='verdana'>#ucase(subcat)# <cfif cgi.server_name contains ".in"> JEWELLERY<cfelse> JEWELRY</cfif></h1> <cfoutput>#pagedescription#</cfoutput> </span> </cfoutput> </td> </tr> <!--- End stone type image row --->
				   <CFINCLUDE TEMPLATE="hubs-bystone.cfm" />
			</cfcache> <cfif pagedescription neq "" or session.mail is 'acemat@vsnl.com'> <Tr valign="middle"> <td valign="middle" style="color:##666600;" class="rowb"  colspan="2"> <cfif session.mail is application.admin_email> <a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=<cfoutput>#right(currentfile, len(currentfile)-1)#</cfoutput>">Content Edit</a> </cfif> </td> </tr> </cfif> <cfset subcat3 = replace(trim(subcat),"_","")> <cfset subcat3 = replace(trim(subcat3)," ","")> <tr  bgcolor="white"> <td align="center" height=30  colspan="2"><cfoutput><a href=#subcat3#_jewelry.cfm>SEE RANDOM #subcat# JEWELRY</cfoutput></a></td> </tr> <!--- End Matt Bayuk - SGM ---> <!---<cfinclude  template="statsrecord.cfm">---> <cfinclude template="includes/linkexchangebystone.cfm"> <cfoutput> <cfif rowsdisplayed LT 5 > <cfif rowsdisplayed  is 0> <cfset rowsdisplayed = 1> </cfif> </cfif> <tr> <td  align=middle  colspan="2"> <!---<a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>---> </td> </tr> <cfif subcat neq ""> <cfinclude template="marketing/stonelinks.cfm"> </cfif> </cfoutput> </table> </td> </tr> </table>
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
		<!--- <cfset balance = session.screenwidth - 800>
			<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
			--->
		<Cfif len(cgi.QUERY_STRING)>
			<cfset session.filter=CGI.QUERY_STRING >
		<cfelse>
			<cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
		</Cfif>
	</div>
	</cfcache>
	</div>
	<cfinclude template="/mainfooter.cfm">
	<cfcatch type="any">
		<cfdump var='#cfcatch#' />
	</cfcatch>
</cftry>
