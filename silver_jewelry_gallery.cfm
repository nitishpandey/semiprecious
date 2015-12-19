 <cfcache  action="cache" timespan="#createtimespan(0,3,0,0)#" useQueryString="true">
 <cfif not isdefined("url.notmvc")><!--- specify this in url to skip using the V and M seperated files --->
	<cfinclude template="silver_jewelry_gallery_slow.cfm" />
<cfelse>
<cftry>
	<cfparam name=session.cartid default="">
	<!---
		<CFSET _start=GetTickCount()> --->
	<cfparam name="groupname" default="">
	<!--- used in folders like shaped, rare-stones --->
	<cfparam name="inventory" default="" />
	<cfparam name="occasion" default=""  />
	<cfparam name="occasionmenu" default=""  />
	<cfparam name="session.name" default=""  />
	<cfparam name="url.supcode" default=""  />
	<cfparam name="supcode" default=""  />
	<cfparam name="sortorder" default="disporder" />
	<cfparam name="located" default="" />
	<cfparam name="stored" default="" />
	<cfparam name="metatitle" default="" />
	<cfparam name="metadescription" default="" />
	<cfparam name="description" default="" />
	<CFPARAM NAME="subcat" DEFAULT= "" />
	<CFPARAM NAME="subcat2" DEFAULT= "" />
	<cfparam name="categ" default="jewelry" />
	<cfparam name="metakeywords" default="" />
	<cfparam name="LatestStartingBackMonths" default="1" />
	<cfparam name="ringsize" default="" />
	<cfparam name="url.ringsize" default="" />
	<cfparam name="url.category" default="" />
	<cfparam name="pagedescription" default="" />
	<cfparam name="screensize" default="big" />
	<cfparam name="style" default="" />
	<cfparam name="url.style" default="#style#" />
	<cfparam name="silverjewelry" default="" />
	<CFPARAM NAME="displaycolumns" DEFAULT="4" />
	<CFPARAM NAME="display" DEFAULT="4" />
	<cfparam name="light" default="pink" />
	<cfparam name="dark" default="##D64578" />
	<CFPARAM NAME="numpages" DEFAULT="0" />
	<cfparam name="jewelrysize" default="" />
	<cfparam default="106" name="stonelistht" />
	<CFPARAM NAME="category" DEFAULT="all" />
	<CFPARAM NAME="priceless" DEFAULT="" />
	<CFPARAM NAME="category2" DEFAULT="all" />
	<cfparam default="662222" name="l" />
	<cfparam name="invstatus" default=-3	/>
	<cfparam name="url.start" default="1" />
	<CFPARAM NAME="start" DEFAULT= "1" />
	<CFPARAM NAME="edit" DEFAULT= "" />
	<CFPARAM NAME="newtstart" DEFAULT= "1" />
	<CFPARAM NAME="url.subcat" DEFAULT="amethyst" />
	<CFPARAM NAME="advancedsearch" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch1" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch2" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch3" DEFAULT= "" />
	<CFPARAM NAME="color" DEFAULT= "" />
	<CFPARAM NAME="Bcolor" DEFAULT= "white" />
	<CFPARAM NAME="salestatus" DEFAULT="" />
	<CFPARAM NAME="newcart" DEFAULT="" />
	<CFPARAM NAME="invent" DEFAULT="" />
	<CFPARAM NAME="j" DEFAULT="" />
	<CFPARAM NAME="pricegreater" DEFAULT="0" />
	<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/" />
	<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/" />
	<cfif occasion is 'oos'>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	<cfelse>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,1,0,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
	 </cfquery>
	</cfif>
	<!---<cftry>--->
			<cfif url.start LTE 0>
				<cfset start = 1 />
			</cfif>
			<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
			<cfoutput>
				<style media="screen"   type="text/css" >
					<!--
						html, body {
						        height: 100%;
						     }
						     ##container {
						        height: 100%; position: relative; z-index: 2;
						     }

						###category#_horiz {
						text-decoration:underline;

						}
						##ajax_context
						{
						display:none;
						}
						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart,</cfif>
							</cfloop>
							.comma_ender
						{
						background:url("/images/added.png") no-repeat  right center;
						height:12px;
						width:12px;
						}

						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
							</cfloop> .comma_ender1
						{
						background-color:##DFE;
						}
						-->
				</style>
			</cfoutput>
			<cfif  len(session.bulkbuyer.id) or 1>
				<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
			<cfelse>
				<link href="/styles/hub.css" rel="stylesheet" type="text/css" >
			</cfif>
			<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
			<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
			<link rel="shortcut icon" href="/favicon.ico" >
			<cfif session.quick_add or 1>
				<!--- we need the js for retail for info on make for me. --->
				<!-- morphing switched off here and in quick_add
					<script type="text/javascript" language="JavaScript" src="/js/mootools_.js"></script>-->
				<cfif cgi.server_name contains 'wholesale' and 0>
					<!-- why load this for non wholesale because MOD info uses this-->
					<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js?ver=2"></script>
					<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
				</cfif>
			</cfif>
			<script type="text/javascript" src="/js/global.js?ver=2.1"></script>
			<cfquery name="contentbypage" datasource="gemssql">
	Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
			<cfif contentbypage.recordcount GT 0>
				<cfif cgi.server_name contains 'wholesale'>
					<cfset metatitle="#contentbypage.title# Handmade">
					<cfset metadescription="#contentbypage.metadescription# Handmade">
					<cfset metakeywords="#contentbypage.keywords# Handmade">
					<cfset pagedescription="#contentbypage.description#">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
					<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
					<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
					<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
				<cfelse>
					<cfset metatitle="#contentbypage.title#">
					<cfset metadescription="#contentbypage.metadescription#">
					<cfset metakeywords="#contentbypage.keywords#">
					<cfset pagedescription="#contentbypage.description#">
				</cfif>
			</cfif>
			<cfoutput>
				<TITLE>
					<cfif url.start GT 1>
						Gallery starting from #url.start#th item.
					</cfif>
					#titlecase(metatitle)#
					<cfif ringsize neq "">
						Rings #ringsize#
					</cfif>
					<cfif cgi.server_name contains 'wholesale'>
						Wholesale
					</cfif>
					#titleCase(subcat)# #style#
					<cfif color neq "">
						#titleCase(color)#
					</cfif>
					<cfif groupname neq "">
						#titlecase(groupname)# #categ#
					</cfif>
				</TITLE>
				<cfif occasion eq "oos">
					<meta name="robots" content="noindex,nofollow">
				</cfif>
				<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif><cfif color neq "">
				#color# </cfif>
				<cfif subcat neq "">
					#subcat#
				</cfif>
				<cfif groupname neq "">
					#groupname#
				</cfif>
				#p#, #metakeywords#">
				<meta name="author" content="Anup Pandey" >
				<cfif cgi.server_name contains "semiprecious.in">
					<meta name=ICBM content="28.5573901, 77.1571443" />
					<meta name="geo.position" content="28.5573901;77.1571443" />
					<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
				</cfif>
			</cfoutput>
			<META content="20 days" name=revisit-after >
			<!-- Deluxe Menu -->
			<!-- (c) 2009, by Deluxe-Menu.com -->
			<cfsilent>
				<cfif cgi.https is "on">
					<cflocation url="http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" />
				</cfif>
				<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
				</cfif>
				<cfif #cgi.server_name# contains "forcesofindia">
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
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
				<!--- the above code is run every time a gallery page is invoked. A more sensible thing
					would be to set the above flag either in login page or cart page where we can detect that
					person is shopping --->
				<cfif ringsize neq "">
					<cfif ringsize does not contain 'size'>
						<cfset ringsize='size ' & ringsize>
					</cfif>
				</cfif>
				<cfif cgi.server_name contains "handmadelaptopcase.com">
					<cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset session.india=1>
					<cfset session.country = "india">
				</cfif>
				<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
				<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
					<cfif session.bulkbuyer.id eq "">
					<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
					</cfif>
					</cfif>--->
				<cfset sj = "">
				<cfif session.mail eq application.admin_email>
					<cfset url.edit =  'mamamia'>
					<cfset invstatus= -5>
				</cfif>
				<cfset  top = 114 />
				<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
				<cfif cgi.server_name contains "wholesale">
					<cfparam name="displayrows" default="4">
				<cfelse>
					<cfparam name="displayrows" default="4">
				</cfif>
				<cfif category is "jewelry">
					<cfif url.category neq "">
						<cfset category=url.category>
					<cfelse>
						<cfset category="">
					</cfif>
				</cfif>
				<CFIF CATEGORY  EQ "">
					<CFSET CATEGORY ="all">
				</CFIF>
				<cfif category is 'beads' and session.mail neq application.admin_email>
					<cfset invstatus=0>
				</cfif>
				<cfif category is "bracelets">
					<cfset displaycolumns="4">
				</cfif>
				<cfif category is 'beads'>
					<cfset displayrows=7>
					<cfset displaycolumns="4">
				</cfif>
				<CFSET CATEGORY2=CATEGORY>
				<cfif subcat contains "smokey" or subcat contains "smoky">
					<cfset subcat ="smoky quartz">
				</cfif>
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
				<!--- <script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script> --->
				<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
				<cfif category eq 'all' or category eq "">
					<cfset categ='jewelry'>
				</cfif>
				<cfif cgi.server_name contains "wholesale">
					<CFPARAM NAME="url.sortorder" DEFAULT="disporderwhole" >
				<cfelse>
					<cfif dateformat(now(),"dddd") eq "Sunday">
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Monday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Thursday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Friday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelse>
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					</cfif>
				</cfif>
				<cfparam name="sortorder" default="disporder">
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
				<cfif priceless neq "">
					<cfset sortorder='price desc'>
					<cfset url.sortorder =sortorder>
				</cfif>
				<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
				<cfif isnumeric(advancedsearch)>
					<cflocation url="detail.cfm?newitem=#advancedsearch#">
				</cfif>
				<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
					<cflocation url="/wholesale_login.cfm">
				</cfif>
				<cfinclude template="checkinjection.cfm">
				<cfparam name="grouping" default="">
				<cfif style is 'silver beaded'>
					<cfset style='Silverbeaded'>
				</cfif>
				<cfif not len(occasion)>
					<!--- to avoid this processing for solr based searches which use occasion as the indicator --->
					<cfif advancedsearch neq "">
						<cfif  advancedsearch contains 'silver'>
							<cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
							<cfset url.style='Silver'>
						</cfif>
						<cfif  advancedsearch contains 'neck'>
							<cfset category='necklaces'>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklace"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklaces"," ")>
						</cfif>
						<cfif  advancedsearch contains ' earr'>
							<cfset category='earrings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"earring"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"earrings"," ")>
						</cfif>
						<cfif  advancedsearch contains ' ring'>
							<cfset category='rings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"rings"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"ring"," ")>
						</cfif>
						<cfif  advancedsearch contains ' brace'>
							<cfset category='bracelets'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelet"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelets"," ")>
						</cfif>
						<cfif  advancedsearch contains ' pend'>
							<cfset category='pendants'>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendant"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendants"," ")>
						</cfif>
						<cfif  advancedsearch contains 'bead'>
							<cfset category='beads'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bead"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"beads"," ")>
						</cfif>
						<cfif  advancedsearch contains 'heal'>
							<cfset category='healing'>
							<cfset advancedsearch=replacenocase(advancedsearch,"healing"," ")>
						</cfif>
					</cfif>
				</cfif>
				<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring;
 }

  session.gallery = 'gemstone_jewelry_gallery.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping
IF (advancedsearch is not "") {
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark ='';
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors = Application.color_list;
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=20;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
				<!--- meta tags addition for groups--->
				<cfif groupname neq "">
					<cfif cgi.server_name contains 'wholesale'>
						<cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="Wholesale semiprecious gemstone #groupname# jewelry">
						<cfset metakeywords="Wholesale #groupname# #subcat# #categ#  in gemstones">
					<cfelseif session.country is "india">
						<cfset metatitle="#groupname# #subcat# #categ# and Jewellery in gemstones">
						<cfset metadescription="Online store for gifting authentic semiprecious gemstone #groupname# jewellery">
						<cfset metakeywords="#groupname# #subcat# #categ# gemstone jewelry">
					<cfelse>
						<cfset metatitle="#groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="#subcat# gemstone #categ# and healing #groupname# #style# sterling silver #start#">
						<cfset metakeywords="#groupname# #subcat# #categ# #style# gemstone jewelry">
					</cfif>
				</cfif>
				<!--- end meta tags for groups ---->
				<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
				<cfset currentfile='#Trim(CGI.path_info)#'>
				<!--- speed up things - this removed to reduce hits to the database
					<CFIF start EQ 1 and advancedsearch neq "">
					<cftry>
					<CFQUERY DATASOURCE="gemssql" NAME="searched">
					insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    )
					</cfquery>
					<cfcatch type="database">
					<cfquery DATASOURCE="gemssql" >
					Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
					</cfquery>
					Nothing in this selection. Please click <a href="/">here<a/> to continue shopping.
					</cfcatch>
					<cfcatch type="any">
					Sorry, an error has occured, please email us at cs@semiprecious.com
					</cfcatch>
					</cftry>
					</CFIF>
					--->
				<cfif not isdefined("form.submit5")>
					<!---<cftry>--->
					<cfif isdefined("form.search_criteria")>
						<cfset advancedsearch = form.search_criteria />
						<cfset occasion = "solr" />
						<cfif isnumeric(trim(form.search_criteria))>
							<cflocation url="jewelry_item.cfm?newitem=#trim(form.search_criteria)#" addtoken="no" />
						<cfelse>
							<cfset occasion = "solr" />
						</cfif>
					<cfelseif occasion is "solr">
						<cfset form.search_criteria = url.advancedsearch />
					</cfif>
					<CFOUTPUT>
						<h2>
							#stored# #occasion#
						</h2>
					</CFOUTPUT>
					<cftry>
						<cfswitch expression="#occasion#">
							<cfcase value="xmas">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getxmasitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="clearance">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getclearanceitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="supplier">
								<cfif not isdefined("url.supcode")>
									Please provide storage code like H or PJ or P
									<cfabort />
								</cfif>
								<cfquery datasource="gemssql" name="getlist"  >
				  <cfinclude template="/includes/getsupitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="oos">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/getoositemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="custom">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/customitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="solr">
								<!---	<cfif not find( expand ,Form.search_criteria)>
									<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfelse>
									<cfset criteria_ = replace(Form.search_criteria,' expand ',' ')/>
									</cfif>
									--->
								<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfoutput>
									here: #form.search_criteria#
								</cfoutput>
								<cfset occasionmenu = "Searched #replace(form.search_criteria,' ',' Or ', 'all')#"/>
								<!--- we don't want to go beyond one page display. Else we have to build the critieria into the next and previous navigation links also --->
								<!---
									<cfquery dbtype="query" name="getlist">
									SELECT distinct [key] as newitem
									FROM sq
									order by  score desc
									</cfquery>
									<cfset qry = "solr" />--->
								<!---
									<cfdump var="#sq#" />
									--->
								<cfquery datasource="gemssql" name="getlist">
		                                                            <cfinclude template="/includes/getrecordsitemidsSearch.cfm" />
	                                                    	</cfquery>
							</cfcase>
							<cfdefaultcase>
								<cftry>
									<cfquery datasource="gemssql" name="getlist">
		                                                                   <cfinclude template="/includes/getrecordsitemids.cfm" />
	                                                            	</cfquery>
									<cfcatch type="any">
										<cfset getlist.recordcount = 0 />
										<!---<cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
											type="html" >
											Following query gave no result:
											#category# #subcat#
											<cfif isdefined("cfcatch.sql")>
											#cfcatch.sql#,
											</cfif>
											#cgi.path_info#
											#cfcatch.message#
											</cfmail>--->
										Following query gave no result: #category# #subcat# #cfcatch.message# #cfcatch.detail#
									</cfcatch>
								</cftry>
							</cfdefaultcase>
						</cfswitch>
						<cfif getlist.recordcount GT 0>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = #getlist.newitem#
	</cfquery>
						<cfelse>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = 7130
	</cfquery>
						</cfif>
						<cfcatch type="any">
							<cfoutput>
								Nothing in this selection. Please click
								<a href="/#category#.cfm">
									here
								<a/>
									to continue shopping.
							</cfoutput>
							<cfset getlist2.cat = category /> <cfset getlist2.recordcount = 0 /> <cfset getlist.recordcount = 0 /> <cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER#
 #subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,
#advancedsearch1#,#advancedsearch2#
 http://www.semiprecious.com/silver_jewelry_gallery.cfm?#cgi.QUERY_STRING#  #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
</cfmail>
						</cfcatch>
					</cftry>
					<!---<cfcatch type="database">
						<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
						</cfcatch>
						</cftry>---> <!---
						<cfquery name="getlist" dbtype="query">
						Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
						buylink ,  orderprice from getlist
						</cfquery>---> <!---
						<cfcatch type="database">
						<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
						type="html" >
						#cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
						#subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
						#cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
						<CFSET url.sortorder = 'datetaken desc' />
						</cfmail>
						</cfcatch>--->
				</cfif>
				<cfif category is ""> <cfset category=categ> </cfif> <cfif category is ""> <cfset category="All"> </cfif>
			</cfsilent>
			<cfoutput> <meta name="description" content="Our <cfif p is 'jewelry' or p is 'necklaces' or p is 'pendants'>handcrafted<cfelse>handmade</cfif> <cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# gemstone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# <cfif p is "jewelry">comes<cfelseif p is "healing"> items come<cfelse>come</cfif> in many varieties. We are your source for<cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# stone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# in silver, beads, necklaces, pendants, rings, earrings, bracelets & healing.<cfif url.start GT 1>Gallery starting from #url.start#th item.</cfif>"> </cfoutput>
		</HEAD>
		<body style="margin-top:0" > <div style="width:100%;position:absolute;top:0;left:0;z-index:3" align="Center"> <div style="width:960px;position:relative;top:-10pt;left:0;"> <div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;"> </div> </div> </div>
 <div align="center" id="container"> <!--- set up for ajax add to cart ---> <form><input type="hidden" id="ajax_context" value=gallery></form> <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
			---> <cfif isdefined("url.quick_add")> <cfset session.quick_add = url.quick_add /> </cfif> <cfinclude template="/header#session.country#.cfm"> <CFIF not isdefined("gETLIst.recordcount")> <br /> <span class="error">No item found. PLEASE TRY AGAIN.</span> <cfif subcat is 'amber'> <cfinclude template="pippinindex.htm"> </cfif> <cfinclude template="footer.htm"> <CFSET enddisplay= start + display -1 > </div> </body>
	</html>
	<cfabort /> </cfif> <CFSET numpages=round(GetList.RecordCount/display)> <CFSET enddisplay= start + display -1> <cfif start gt getlist.recordcount> <cfset start = getlist.recordcount> </cfif> <cfif start lt 1> <cfset start = 1> </cfif> <!---<cfinclude template="includes/themes.cfm">---> <cfoutput>
                <cfif getlist.recordcount LT 13>
                   <cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures ---> </cfif>
                   <cfset display = displaycolumns*displayrows>
                            <CFIF GetList2.cat is not "">
                                        <input type='hidden' name='category' value='#GetList2.cat#' />
                                      <CFELSE>
                                      <input type='hidden' name='category' value='#category#' />
                                </cfif> <input type='hidden' name='url.sortorder' value='#url.sortorder#' /> <!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
		LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->
<cfset tw =  606>
<div id="container1">
    <h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >&nbsp; <script type="text/javascript">
              document.getElementById("filter_summary").display = "block";
          </script>
          <cfif len(occasionmenu)> #occasionmenu#
             <cfelse> <!--- <cfif session.country neq 'india'> --->
                 <cfif color neq "" or subcat neq "">
                      <cfif len(advancedsearch)>
                              <cfelse> <!--- Selection:  --->
                                       <Cfif isnumeric(priceless)> &nbsp;
                                            Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;<br /> </Cfif> <!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or Beaded</cfif></b><br>---> <cfif len(trim(subcat)) > <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")> <img src="/images/dots1.gif" style="display:inline;" /> <a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">#subcat# home</a>&nbsp;&nbsp;&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> <cfif listfindnocase(Application.cufflinkstones,subcat)> <a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.necklacestones,subcat)> <a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.Braceletstones,subcat)> <a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.ringstones,subcat)> <a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.earringstones,subcat)> <a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.pendantstones,subcat)> <a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.beadstones,subcat)> <a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
                                             </cfif>
                                             <cfelseif  color neq "">
                                                       <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">#color# Pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">#color# Rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">#color# Earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">#color# Bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">#color# Necklaces</a>&nbsp; <cfelseif  salestatus is 3 > <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp; </cfif> <cfif category EQ "All" > <span style="color:black;background-color:#light#;font-size=12 px;">All Categories</span>&nbsp; </cfif> </cfif> </cfif> &nbsp; <!--- <cfelse> ---> <cfif session.country eq 'India'> <cfif pricegreater neq 0 or priceless neq ""> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> ---> #category# <cfif pricegreater neq 0> From #round_format(pricegreater)# </cfif> <cfif priceless neq ""> Up To #round_format(priceless)# </cfif> <!--- </span> ---> <cfelse> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> ---> <!--- <cfset kws = replace(cgi.script_name,".cfm","") /> ---> <cfset kws = #contentbypage.title# /> <cfif IsDefined('nameid') AND nameid neq ''> #nameid# <cfelse> #Kws# </cfif> <!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> ---><!--- </cfloop> ---> <!--- </span> ---> </cfif> </cfif> </span> </cfif> <!-- #color#, #len(trim(subcat))#--> </h1> </cfoutput> <CFSET columns=1> <CFSET rows=1> <CFSET enddisplay= start + display-1>
                                          <CFSET currentrow= start>
                                       <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
                                               <tr >

             <!---
              <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
              <td valign="top"  align="left" > <cfset itemCount = 0>
                  <cfset itemlist = 0> <cfset price_color_filter = "" />
                  <div id="semiprecious_gallery" style="margin-top:1px;overflow:visible;position:relative;float:right;margin-right:6px;" >
                  <CFIF getList.recordcount eq 0>
                  <div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:627px;text-align:justify;font-size:12px;color:black;">
                           <cfoutput>
                           Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
                          <cfif salestatus is 3> that are on sale </cfif>
                          <cfif pricegreater GT 0>
                              within price range #format(priceless)# to #format(pricegreater)#
                          </cfif>
                          <!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
        		<cfinclude template="/googleadsforlist.htm">
        		---->
                     </cfoutput>
             <cfset silver = "">
             <cfif isdefined("url.relocated")>
               <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
		OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  ---> <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail> <cfelse> <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
		--->
            </cfif>
            </div> <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
		#session.mail#,#cgi.QUERY_STRING# .
		</cfmail>
		--->
            <cfabort />
          </div></td></tr></table></body></html>
          </cfif>

           <!--- gallery portion starts here --->
         <div align="left" >
                         <cfif (Not len(session.name) or session.mail eq application.admin_email) and start lt 2>
                             <div align="left" style="width:100%; border-collapse:collapse; border:thin;">
                               <cfoutput>
                                   <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span>
                                </cfoutput>
                             </div>
                        </cfif>

         <span class="found_header">Showing <cfoutput>#Getlist.recordcount# #titlecase(color)# #titlecase(subcat)#
         <cfif groupname neq ""> #titlecase(groupname)#</cfif> #titlecase(url.style)# <cfif len(category) GT 3> #titlecase(category)#<cfelse> Items
         </cfif>
         <cfif pricegreater neq "0"> Over #format(pricegreater)#</cfif>
         <cfif priceless neq ""> Under #format(priceless)#</cfif> </cfoutput>
         </span>&nbsp;
         <!---<div >
          <cfinclude template="/includes/searchdropdowns.cfm" />

          <cfif subcat neq "" or groupname neq "" or pricegreater neq "0" or priceless neq "">
             <a href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath() )#</cfoutput> >
             Clear Filters</a></cfif>
            </div> --->
             <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>--->
          <cfif start is 1>
          <cfif session.cartitem[1][1] is 0>
          <h3 id="infotable"  style="margin-left:20px;"  align="justify" >
           <cfif subcat is 'pearl'>
           <font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.
         </font>
         </cfif> <!---#pagedescription#
          <cfif color neq "">
		Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
		</cfif>--->
             . </h3>
             </cfif>
             </cfif>
             <cfif session.mail eq application.admin_email> <!--- place to put display code ---> <cfoutput><cfif occasion is 'oos'>OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE</cfif></cfoutput> </cfif> <cfset quick_add = session.quick_add /> <!---<cfinclude template="/includes/gallery_engine.cfm" />
		<div align="center" style="margin-top:30px;">
		<!--- Paging links ---> <!---
		<CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">---> <!---  <div style="text-align:center;margin-bottom:2px;">
		<cfoutput>
		<span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
		</cfoutput>
		</div>
		End Paging links --->
               </div>
               <div align="center" id="cart_summary" style="z-index:6;"></div> <!--- End Matt Bayuk - SGM ---> <!---
		<cfinclude  template="statsrecord.cfm">--->
             </div><!--- semipeciou_gallery --->
               <div style="float:left;display:inline;width:100px;">
                       <cfset leftgemstonedisplay="block" />
                        <cfif color neq "" >
                               <cfset leftcolordisplay="block" />
                         </cfif>
                  <!---
		<cfif pricegreater neq 0 or priceless neq "">
		    <cfset leftpricedisplay = "inline" />
		    <span style="font-weight:bold">
                           <cfinclude template="/includes/price_color_filter.cfm" />
                   </span>
		</cfif>
		removed because now we ave a color bar above gallery---> <cfif category neq 'gems' and cgi.server_name does not contain 'wholesale'> <br> <CFINCLUDE TEMPLATE="leftmenus.cfm"> </cfif> </div> </td></tr> <!--- <tr> <td>
		<a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
		</td>
		</tr>---> ---> </td> </tr>
                        <tr> <td>
                 <table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
                 <tr>
                 <td valign="top">
                 <div style="float:left;display:inline;width:158px;">
                                <cfset leftgemstonedisplay="block" /> <cfif color neq "" > <cfset leftcolordisplay="block" /> </cfif>
                                <cfif category neq 'gems' and category neq "cufflinks" >
                                        <div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
                                                <CFINCLUDE TEMPLATE="leftmenus.cfm">
                                        </div>
                                </cfif>
                                <!---
                                            <p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                        		        <cfif session.country neq 'india'>
                            		<cfcache action="serverCache" timespan="1">
                            		    <cfinclude template="/includes/grouplist.cfm">
                            		</cfcache>
                                    </cfif>
                            --->
                </div>
                </td>
                <td align="center" valign="top">
                    <div style="margin-top:12px;margin-left:22px;float:left;">
                         <cfinclude template="/includes/gallery_engine.cfm" />
                     </div>
                    </td>
                   </tr>
                </table>
                </td>
                </tr>
                <div align="center" id="cart_summary" style="z-index:6;">
           </div>

           <tr>
             <td>
                <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center">
                           <tr> <td> <div align="center" style="margin-top:30px;"> <!--- Paging links ---> <cfif getgallery.recordcount GT 5> <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm"> </cfif> </div> </td> </tr> </table> </td> </tr> </div> <tr><td align=center><br> <cfoutput> <cfinclude template="/includes/linkexchangebystone.cfm"> <cfif subcat neq ""> <cfinclude template="/marketing/stonelinks.cfm"> </cfif> </cfoutput> </td></tr> </table>
	<!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
		<tr>
		<td>
		<div align="center" style="margin-top:30px;">
		--- Paging links ---
		<br>
		<br><br>
		</div>
		</td>
		</tr>
		</table>
		--->
	<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />
		<cfset session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >
		    <cfcatch type="application">
		        	<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)>
		<CFINCLUDE template="stoneinfo.inc">
	</cfif>
	</div>
	<!--- Footer --->
	<!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
	<cfinclude template="/mainfooter.cfm">
	<!--- End footer --->
	<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
		<div>
			<cfoutput>
				<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
					Contend Edit
				</a>
			</cfoutput>
			</div>
	</cfif>
	</div>
	<!---
		<cfinclude template="/googleadsforlist.htm">--->
	</BODY> </HTML>
	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<!---
	<CFSET _end=GetTickCount()>
	<CFSET executiontime=_end-_start>
	<cfoutput>blah:#executiontime#</cfoutput>
	--->
</cfif>



</cfcache>cfcache> <cfcache  action="cache" timespan="#createtimespan(0,3,0,0)#" useQueryString="true">
 <cfif not isdefined("url.notmvc")>
<cfinclude template="silver_jewelry_gallery_slow.cfm" />
<cfelse>
<cftry>
	<cfparam name=session.cartid default="">
	<!---
		<CFSET _start=GetTickCount()> --->
	<cfparam name="groupname" default="">
	<!--- used in folders like shaped, rare-stones --->
	<cfparam name="inventory" default="" />
	<cfparam name="occasion" default=""  />
	<cfparam name="occasionmenu" default=""  />
	<cfparam name="session.name" default=""  />
	<cfparam name="url.supcode" default=""  />
	<cfparam name="supcode" default=""  />
	<cfparam name="sortorder" default="disporder" />
	<cfparam name="located" default="" />
	<cfparam name="stored" default="" />
	<cfparam name="metatitle" default="" />
	<cfparam name="metadescription" default="" />
	<cfparam name="description" default="" />
	<CFPARAM NAME="subcat" DEFAULT= "" />
	<CFPARAM NAME="subcat2" DEFAULT= "" />
	<cfparam name="categ" default="jewelry" />
	<cfparam name="metakeywords" default="" />
	<cfparam name="LatestStartingBackMonths" default="1" />
	<cfparam name="ringsize" default="" />
	<cfparam name="url.ringsize" default="" />
	<cfparam name="url.category" default="" />
	<cfparam name="pagedescription" default="" />
	<cfparam name="screensize" default="big" />
	<cfparam name="style" default="" />
	<cfparam name="url.style" default="#style#" />
	<cfparam name="silverjewelry" default="" />
	<CFPARAM NAME="displaycolumns" DEFAULT="4" />
	<CFPARAM NAME="display" DEFAULT="4" />
	<cfparam name="light" default="pink" />
	<cfparam name="dark" default="##D64578" />
	<CFPARAM NAME="numpages" DEFAULT="0" />
	<cfparam name="jewelrysize" default="" />
	<cfparam default="106" name="stonelistht" />
	<CFPARAM NAME="category" DEFAULT="all" />
	<CFPARAM NAME="priceless" DEFAULT="" />
	<CFPARAM NAME="category2" DEFAULT="all" />
	<cfparam default="662222" name="l" />
	<cfparam name="invstatus" default=-3	/>
	<cfparam name="url.start" default="1" />
	<CFPARAM NAME="start" DEFAULT= "1" />
	<CFPARAM NAME="edit" DEFAULT= "" />
	<CFPARAM NAME="newtstart" DEFAULT= "1" />
	<CFPARAM NAME="url.subcat" DEFAULT="amethyst" />
	<CFPARAM NAME="advancedsearch" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch1" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch2" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch3" DEFAULT= "" />
	<CFPARAM NAME="color" DEFAULT= "" />
	<CFPARAM NAME="Bcolor" DEFAULT= "white" />
	<CFPARAM NAME="salestatus" DEFAULT="" />
	<CFPARAM NAME="newcart" DEFAULT="" />
	<CFPARAM NAME="invent" DEFAULT="" />
	<CFPARAM NAME="j" DEFAULT="" />
	<CFPARAM NAME="pricegreater" DEFAULT="0" />
	<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/" />
	<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/" />
	<cfif occasion is 'oos'>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	<cfelse>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,1,0,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
	 </cfquery>
	</cfif>
	<!---<cftry>--->
			<cfif url.start LTE 0>
				<cfset start = 1 />
			</cfif>
			<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
			<cfoutput>
				<style media="screen"   type="text/css" >
					<!--
						html, body {
						        height: 100%;
						     }
						     ##container {
						        height: 100%; position: relative; z-index: 2;
						     }

						###category#_horiz {
						text-decoration:underline;

						}
						##ajax_context
						{
						display:none;
						}
						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart,</cfif>
							</cfloop>
							.comma_ender
						{
						background:url("/images/added.png") no-repeat  right center;
						height:12px;
						width:12px;
						}

						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
							</cfloop> .comma_ender1
						{
						background-color:##DFE;
						}
						-->
				</style>
			</cfoutput>
			<cfif  len(session.bulkbuyer.id) or 1>
				<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
			<cfelse>
				<link href="/styles/hub.css" rel="stylesheet" type="text/css" >
			</cfif>
			<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
			<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
			<link rel="shortcut icon" href="/favicon.ico" >
			<cfif session.quick_add or 1>
				<!--- we need the js for retail for info on make for me. --->
				<!-- morphing switched off here and in quick_add
					<script type="text/javascript" language="JavaScript" src="/js/mootools_.js"></script>-->
				<cfif cgi.server_name contains 'wholesale' and 0>
					<!-- why load this for non wholesale because MOD info uses this-->
					<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js?ver=2"></script>
					<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
				</cfif>
			</cfif>
			<script type="text/javascript" src="/js/global.js?ver=2.1"></script>
			<cfquery name="contentbypage" datasource="gemssql">
	Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
			<cfif contentbypage.recordcount GT 0>
				<cfif cgi.server_name contains 'wholesale'>
					<cfset metatitle="#contentbypage.title# Handmade">
					<cfset metadescription="#contentbypage.metadescription# Handmade">
					<cfset metakeywords="#contentbypage.keywords# Handmade">
					<cfset pagedescription="#contentbypage.description#">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
					<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
					<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
					<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
				<cfelse>
					<cfset metatitle="#contentbypage.title#">
					<cfset metadescription="#contentbypage.metadescription#">
					<cfset metakeywords="#contentbypage.keywords#">
					<cfset pagedescription="#contentbypage.description#">
				</cfif>
			</cfif>
			<cfoutput>
				<TITLE>
					<cfif url.start GT 1>
						Gallery starting from #url.start#th item.
					</cfif>
					#titlecase(metatitle)#
					<cfif ringsize neq "">
						Rings #ringsize#
					</cfif>
					<cfif cgi.server_name contains 'wholesale'>
						Wholesale
					</cfif>
					#titleCase(subcat)# #style#
					<cfif color neq "">
						#titleCase(color)#
					</cfif>
					<cfif groupname neq "">
						#titlecase(groupname)# #categ#
					</cfif>
				</TITLE>
				<cfif occasion eq "oos">
					<meta name="robots" content="noindex,nofollow">
				</cfif>
				<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif><cfif color neq "">
				#color# </cfif>
				<cfif subcat neq "">
					#subcat#
				</cfif>
				<cfif groupname neq "">
					#groupname#
				</cfif>
				#p#, #metakeywords#">
				<meta name="author" content="Anup Pandey" >
				<cfif cgi.server_name contains "semiprecious.in">
					<meta name=ICBM content="28.5573901, 77.1571443" />
					<meta name="geo.position" content="28.5573901;77.1571443" />
					<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
				</cfif>
			</cfoutput>
			<META content="20 days" name=revisit-after >
			<!-- Deluxe Menu -->
			<!-- (c) 2009, by Deluxe-Menu.com -->
			<cfsilent>
				<cfif cgi.https is "on">
					<cflocation url="http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" />
				</cfif>
				<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
				</cfif>
				<cfif #cgi.server_name# contains "forcesofindia">
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
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
				<!--- the above code is run every time a gallery page is invoked. A more sensible thing
					would be to set the above flag either in login page or cart page where we can detect that
					person is shopping --->
				<cfif ringsize neq "">
					<cfif ringsize does not contain 'size'>
						<cfset ringsize='size ' & ringsize>
					</cfif>
				</cfif>
				<cfif cgi.server_name contains "handmadelaptopcase.com">
					<cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset session.india=1>
					<cfset session.country = "india">
				</cfif>
				<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
				<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
					<cfif session.bulkbuyer.id eq "">
					<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
					</cfif>
					</cfif>--->
				<cfset sj = "">
				<cfif session.mail eq application.admin_email>
					<cfset url.edit =  'mamamia'>
					<cfset invstatus= -5>
				</cfif>
				<cfset  top = 114 />
				<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
				<cfif cgi.server_name contains "wholesale">
					<cfparam name="displayrows" default="4">
				<cfelse>
					<cfparam name="displayrows" default="4">
				</cfif>
				<cfif category is "jewelry">
					<cfif url.category neq "">
						<cfset category=url.category>
					<cfelse>
						<cfset category="">
					</cfif>
				</cfif>
				<CFIF CATEGORY  EQ "">
					<CFSET CATEGORY ="all">
				</CFIF>
				<cfif category is 'beads' and session.mail neq application.admin_email>
					<cfset invstatus=0>
				</cfif>
				<cfif category is "bracelets">
					<cfset displaycolumns="4">
				</cfif>
				<cfif category is 'beads'>
					<cfset displayrows=7>
					<cfset displaycolumns="4">
				</cfif>
				<CFSET CATEGORY2=CATEGORY>
				<cfif subcat contains "smokey" or subcat contains "smoky">
					<cfset subcat ="smoky quartz">
				</cfif>
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
				<!--- <script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script> --->
				<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
				<cfif category eq 'all' or category eq "">
					<cfset categ='jewelry'>
				</cfif>
				<cfif cgi.server_name contains "wholesale">
					<CFPARAM NAME="url.sortorder" DEFAULT="disporderwhole" >
				<cfelse>
					<cfif dateformat(now(),"dddd") eq "Sunday">
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Monday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Thursday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Friday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelse>
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					</cfif>
				</cfif>
				<cfparam name="sortorder" default="disporder">
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
				<cfif priceless neq "">
					<cfset sortorder='price desc'>
					<cfset url.sortorder =sortorder>
				</cfif>
				<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
				<cfif isnumeric(advancedsearch)>
					<cflocation url="detail.cfm?newitem=#advancedsearch#">
				</cfif>
				<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
					<cflocation url="/wholesale_login.cfm">
				</cfif>
				<cfinclude template="checkinjection.cfm">
				<cfparam name="grouping" default="">
				<cfif style is 'silver beaded'>
					<cfset style='Silverbeaded'>
				</cfif>
				<cfif not len(occasion)>
					<!--- to avoid this processing for solr based searches which use occasion as the indicator --->
					<cfif advancedsearch neq "">
						<cfif  advancedsearch contains 'silver'>
							<cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
							<cfset url.style='Silver'>
						</cfif>
						<cfif  advancedsearch contains 'neck'>
							<cfset category='necklaces'>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklace"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklaces"," ")>
						</cfif>
						<cfif  advancedsearch contains ' earr'>
							<cfset category='earrings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"earring"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"earrings"," ")>
						</cfif>
						<cfif  advancedsearch contains ' ring'>
							<cfset category='rings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"rings"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"ring"," ")>
						</cfif>
						<cfif  advancedsearch contains ' brace'>
							<cfset category='bracelets'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelet"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelets"," ")>
						</cfif>
						<cfif  advancedsearch contains ' pend'>
							<cfset category='pendants'>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendant"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendants"," ")>
						</cfif>
						<cfif  advancedsearch contains 'bead'>
							<cfset category='beads'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bead"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"beads"," ")>
						</cfif>
						<cfif  advancedsearch contains 'heal'>
							<cfset category='healing'>
							<cfset advancedsearch=replacenocase(advancedsearch,"healing"," ")>
						</cfif>
					</cfif>
				</cfif>
				<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring;
 }

  session.gallery = 'gemstone_jewelry_gallery.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping
IF (advancedsearch is not "") {
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark ='';
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors = Application.color_list;
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=20;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
				<!--- meta tags addition for groups--->
				<cfif groupname neq "">
					<cfif cgi.server_name contains 'wholesale'>
						<cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="Wholesale semiprecious gemstone #groupname# jewelry">
						<cfset metakeywords="Wholesale #groupname# #subcat# #categ#  in gemstones">
					<cfelseif session.country is "india">
						<cfset metatitle="#groupname# #subcat# #categ# and Jewellery in gemstones">
						<cfset metadescription="Online store for gifting authentic semiprecious gemstone #groupname# jewellery">
						<cfset metakeywords="#groupname# #subcat# #categ# gemstone jewelry">
					<cfelse>
						<cfset metatitle="#groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="#subcat# gemstone #categ# and healing #groupname# #style# sterling silver #start#">
						<cfset metakeywords="#groupname# #subcat# #categ# #style# gemstone jewelry">
					</cfif>
				</cfif>
				<!--- end meta tags for groups ---->
				<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
				<cfset currentfile='#Trim(CGI.path_info)#'>
				<!--- speed up things - this removed to reduce hits to the database
					<CFIF start EQ 1 and advancedsearch neq "">
					<cftry>
					<CFQUERY DATASOURCE="gemssql" NAME="searched">
					insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    )
					</cfquery>
					<cfcatch type="database">
					<cfquery DATASOURCE="gemssql" >
					Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
					</cfquery>
					Nothing in this selection. Please click <a href="/">here<a/> to continue shopping.
					</cfcatch>
					<cfcatch type="any">
					Sorry, an error has occured, please email us at cs@semiprecious.com
					</cfcatch>
					</cftry>
					</CFIF>
					--->
				<cfif not isdefined("form.submit5")>
					<!---<cftry>--->
					<cfif isdefined("form.search_criteria")>
						<cfset advancedsearch = form.search_criteria />
						<cfset occasion = "solr" />
						<cfif isnumeric(trim(form.search_criteria))>
							<cflocation url="jewelry_item.cfm?newitem=#trim(form.search_criteria)#" addtoken="no" />
						<cfelse>
							<cfset occasion = "solr" />
						</cfif>
					<cfelseif occasion is "solr">
						<cfset form.search_criteria = url.advancedsearch />
					</cfif>
					<CFOUTPUT>
						<h2>
							#stored# #occasion#
						</h2>
					</CFOUTPUT>
					<cftry>
						<cfswitch expression="#occasion#">
							<cfcase value="xmas">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getxmasitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="clearance">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getclearanceitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="supplier">
								<cfif not isdefined("url.supcode")>
									Please provide storage code like H or PJ or P
									<cfabort />
								</cfif>
								<cfquery datasource="gemssql" name="getlist"  >
				  <cfinclude template="/includes/getsupitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="oos">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/getoositemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="custom">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/customitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="solr">
								<!---	<cfif not find( expand ,Form.search_criteria)>
									<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfelse>
									<cfset criteria_ = replace(Form.search_criteria,' expand ',' ')/>
									</cfif>
									--->
								<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfoutput>
									here: #form.search_criteria#
								</cfoutput>
								<cfset occasionmenu = "Searched #replace(form.search_criteria,' ',' Or ', 'all')#"/>
								<!--- we don't want to go beyond one page display. Else we have to build the critieria into the next and previous navigation links also --->
								<!---
									<cfquery dbtype="query" name="getlist">
									SELECT distinct [key] as newitem
									FROM sq
									order by  score desc
									</cfquery>
									<cfset qry = "solr" />--->
								<!---
									<cfdump var="#sq#" />
									--->
								<cfquery datasource="gemssql" name="getlist">
		                                                            <cfinclude template="/includes/getrecordsitemidsSearch.cfm" />
	                                                    	</cfquery>
							</cfcase>
							<cfdefaultcase>
								<cftry>
									<cfquery datasource="gemssql" name="getlist">
		                                                                   <cfinclude template="/includes/getrecordsitemids.cfm" />
	                                                            	</cfquery>
									<cfcatch type="any">
										<cfset getlist.recordcount = 0 />
										<!---<cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
											type="html" >
											Following query gave no result:
											#category# #subcat#
											<cfif isdefined("cfcatch.sql")>
											#cfcatch.sql#,
											</cfif>
											#cgi.path_info#
											#cfcatch.message#
											</cfmail>--->
										Following query gave no result: #category# #subcat# #cfcatch.message# #cfcatch.detail#
									</cfcatch>
								</cftry>
							</cfdefaultcase>
						</cfswitch>
						<cfif getlist.recordcount GT 0>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = #getlist.newitem#
	</cfquery>
						<cfelse>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = 7130
	</cfquery>
						</cfif>
						<cfcatch type="any">
							<cfoutput>
								Nothing in this selection. Please click
								<a href="/#category#.cfm">
									here
								<a/>
									to continue shopping.
							</cfoutput>
							<cfset getlist2.cat = category /> <cfset getlist2.recordcount = 0 /> <cfset getlist.recordcount = 0 /> <cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER#
 #subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,
#advancedsearch1#,#advancedsearch2#
 http://www.semiprecious.com/silver_jewelry_gallery.cfm?#cgi.QUERY_STRING#  #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
</cfmail>
						</cfcatch>
					</cftry>
					<!---<cfcatch type="database">
						<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
						</cfcatch>
						</cftry>---> <!---
						<cfquery name="getlist" dbtype="query">
						Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
						buylink ,  orderprice from getlist
						</cfquery>---> <!---
						<cfcatch type="database">
						<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
						type="html" >
						#cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
						#subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
						#cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
						<CFSET url.sortorder = 'datetaken desc' />
						</cfmail>
						</cfcatch>--->
				</cfif>
				<cfif category is ""> <cfset category=categ> </cfif> <cfif category is ""> <cfset category="All"> </cfif>
			</cfsilent>
			<cfoutput> <meta name="description" content="Our <cfif p is 'jewelry' or p is 'necklaces' or p is 'pendants'>handcrafted<cfelse>handmade</cfif> <cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# gemstone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# <cfif p is "jewelry">comes<cfelseif p is "healing"> items come<cfelse>come</cfif> in many varieties. We are your source for<cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# stone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# in silver, beads, necklaces, pendants, rings, earrings, bracelets & healing.<cfif url.start GT 1>Gallery starting from #url.start#th item.</cfif>"> </cfoutput>
		</HEAD>
		<body style="margin-top:0" > <div style="width:100%;position:absolute;top:0;left:0;z-index:3" align="Center"> <div style="width:960px;position:relative;top:-10pt;left:0;"> <div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;"> </div> </div> </div>
 <div align="center" id="container"> <!--- set up for ajax add to cart ---> <form><input type="hidden" id="ajax_context" value=gallery></form> <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
			---> <cfif isdefined("url.quick_add")> <cfset session.quick_add = url.quick_add /> </cfif> <cfinclude template="/header#session.country#.cfm"> <CFIF not isdefined("gETLIst.recordcount")> <br /> <span class="error">No item found. PLEASE TRY AGAIN.</span> <cfif subcat is 'amber'> <cfinclude template="pippinindex.htm"> </cfif> <cfinclude template="footer.htm"> <CFSET enddisplay= start + display -1 > </div> </body>
	</html>
	<cfabort /> </cfif> <CFSET numpages=round(GetList.RecordCount/display)> <CFSET enddisplay= start + display -1> <cfif start gt getlist.recordcount> <cfset start = getlist.recordcount> </cfif> <cfif start lt 1> <cfset start = 1> </cfif> <!---<cfinclude template="includes/themes.cfm">---> <cfoutput>
                <cfif getlist.recordcount LT 13>
                   <cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures ---> </cfif>
                   <cfset display = displaycolumns*displayrows>
                            <CFIF GetList2.cat is not "">
                                        <input type='hidden' name='category' value='#GetList2.cat#' />
                                      <CFELSE>
                                      <input type='hidden' name='category' value='#category#' />
                                </cfif> <input type='hidden' name='url.sortorder' value='#url.sortorder#' /> <!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
		LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->
<cfset tw =  606>
<div id="container1">
    <h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >&nbsp; <script type="text/javascript">
              document.getElementById("filter_summary").display = "block";
          </script>
          <cfif len(occasionmenu)> #occasionmenu#
             <cfelse> <!--- <cfif session.country neq 'india'> --->
                 <cfif color neq "" or subcat neq "">
                      <cfif len(advancedsearch)>
                              <cfelse> <!--- Selection:  --->
                                       <Cfif isnumeric(priceless)> &nbsp;
                                            Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;<br /> </Cfif> <!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or Beaded</cfif></b><br>---> <cfif len(trim(subcat)) > <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")> <img src="/images/dots1.gif" style="display:inline;" /> <a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">#subcat# home</a>&nbsp;&nbsp;&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> <cfif listfindnocase(Application.cufflinkstones,subcat)> <a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.necklacestones,subcat)> <a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.Braceletstones,subcat)> <a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.ringstones,subcat)> <a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.earringstones,subcat)> <a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.pendantstones,subcat)> <a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.beadstones,subcat)> <a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
                                             </cfif>
                                             <cfelseif  color neq "">
                                                       <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">#color# Pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">#color# Rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">#color# Earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">#color# Bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">#color# Necklaces</a>&nbsp; <cfelseif  salestatus is 3 > <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp; </cfif> <cfif category EQ "All" > <span style="color:black;background-color:#light#;font-size=12 px;">All Categories</span>&nbsp; </cfif> </cfif> </cfif> &nbsp; <!--- <cfelse> ---> <cfif session.country eq 'India'> <cfif pricegreater neq 0 or priceless neq ""> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> ---> #category# <cfif pricegreater neq 0> From #round_format(pricegreater)# </cfif> <cfif priceless neq ""> Up To #round_format(priceless)# </cfif> <!--- </span> ---> <cfelse> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> ---> <!--- <cfset kws = replace(cgi.script_name,".cfm","") /> ---> <cfset kws = #contentbypage.title# /> <cfif IsDefined('nameid') AND nameid neq ''> #nameid# <cfelse> #Kws# </cfif> <!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> ---><!--- </cfloop> ---> <!--- </span> ---> </cfif> </cfif> </span> </cfif> <!-- #color#, #len(trim(subcat))#--> </h1> </cfoutput> <CFSET columns=1> <CFSET rows=1> <CFSET enddisplay= start + display-1>
                                          <CFSET currentrow= start>
                                       <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
                                               <tr >

             <!---
              <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
              <td valign="top"  align="left" > <cfset itemCount = 0>
                  <cfset itemlist = 0> <cfset price_color_filter = "" />
                  <div id="semiprecious_gallery" style="margin-top:1px;overflow:visible;position:relative;float:right;margin-right:6px;" >
                  <CFIF getList.recordcount eq 0>
                  <div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:627px;text-align:justify;font-size:12px;color:black;">
                           <cfoutput>
                           Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
                          <cfif salestatus is 3> that are on sale </cfif>
                          <cfif pricegreater GT 0>
                              within price range #format(priceless)# to #format(pricegreater)#
                          </cfif>
                          <!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
        		<cfinclude template="/googleadsforlist.htm">
        		---->
                     </cfoutput>
             <cfset silver = "">
             <cfif isdefined("url.relocated")>
               <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
		OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  ---> <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail> <cfelse> <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
		--->
            </cfif>
            </div> <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
		#session.mail#,#cgi.QUERY_STRING# .
		</cfmail>
		--->
            <cfabort />
          </div></td></tr></table></body></html>
          </cfif>

           <!--- gallery portion starts here --->
         <div align="left" >
                         <cfif (Not len(session.name) or session.mail eq application.admin_email) and start lt 2>
                             <div align="left" style="width:100%; border-collapse:collapse; border:thin;">
                               <cfoutput>
                                   <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span>
                                </cfoutput>
                             </div>
                        </cfif>

         <span class="found_header">Showing <cfoutput>#Getlist.recordcount# #titlecase(color)# #titlecase(subcat)#
         <cfif groupname neq ""> #titlecase(groupname)#</cfif> #titlecase(url.style)# <cfif len(category) GT 3> #titlecase(category)#<cfelse> Items
         </cfif>
         <cfif pricegreater neq "0"> Over #format(pricegreater)#</cfif>
         <cfif priceless neq ""> Under #format(priceless)#</cfif> </cfoutput>
         </span>&nbsp;
         <!---<div >
          <cfinclude template="/includes/searchdropdowns.cfm" />

          <cfif subcat neq "" or groupname neq "" or pricegreater neq "0" or priceless neq "">
             <a href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath() )#</cfoutput> >
             Clear Filters</a></cfif>
            </div> --->
             <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>--->
          <cfif start is 1>
          <cfif session.cartitem[1][1] is 0>
          <h3 id="infotable"  style="margin-left:20px;"  align="justify" >
           <cfif subcat is 'pearl'>
           <font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.
         </font>
         </cfif> <!---#pagedescription#
          <cfif color neq "">
		Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
		</cfif>--->
             . </h3>
             </cfif>
             </cfif>
             <cfif session.mail eq application.admin_email> <!--- place to put display code ---> <cfoutput><cfif occasion is 'oos'>OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE</cfif></cfoutput> </cfif> <cfset quick_add = session.quick_add /> <!---<cfinclude template="/includes/gallery_engine.cfm" />
		<div align="center" style="margin-top:30px;">
		<!--- Paging links ---> <!---
		<CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">---> <!---  <div style="text-align:center;margin-bottom:2px;">
		<cfoutput>
		<span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
		</cfoutput>
		</div>
		End Paging links --->
               </div>
               <div align="center" id="cart_summary" style="z-index:6;"></div> <!--- End Matt Bayuk - SGM ---> <!---
		<cfinclude  template="statsrecord.cfm">--->
             </div><!--- semipeciou_gallery --->
               <div style="float:left;display:inline;width:100px;">
                       <cfset leftgemstonedisplay="block" />
                        <cfif color neq "" >
                               <cfset leftcolordisplay="block" />
                         </cfif>
                  <!---
		<cfif pricegreater neq 0 or priceless neq "">
		    <cfset leftpricedisplay = "inline" />
		    <span style="font-weight:bold">
                           <cfinclude template="/includes/price_color_filter.cfm" />
                   </span>
		</cfif>
		removed because now we ave a color bar above gallery---> <cfif category neq 'gems' and cgi.server_name does not contain 'wholesale'> <br> <CFINCLUDE TEMPLATE="leftmenus.cfm"> </cfif> </div> </td></tr> <!--- <tr> <td>
		<a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
		</td>
		</tr>---> ---> </td> </tr>
                        <tr> <td>
                 <table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
                 <tr>
                 <td valign="top">
                 <div style="float:left;display:inline;width:158px;">
                                <cfset leftgemstonedisplay="block" /> <cfif color neq "" > <cfset leftcolordisplay="block" /> </cfif>
                                <cfif category neq 'gems' and category neq "cufflinks" >
                                        <div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
                                                <CFINCLUDE TEMPLATE="leftmenus.cfm">
                                        </div>
                                </cfif>
                                <!---
                                            <p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                        		        <cfif session.country neq 'india'>
                            		<cfcache action="serverCache" timespan="1">
                            		    <cfinclude template="/includes/grouplist.cfm">
                            		</cfcache>
                                    </cfif>
                            --->
                </div>
                </td>
                <td align="center" valign="top">
                    <div style="margin-top:12px;margin-left:22px;float:left;">
                         <cfinclude template="/includes/gallery_engine.cfm" />
                     </div>
                    </td>
                   </tr>
                </table>
                </td>
                </tr>
                <div align="center" id="cart_summary" style="z-index:6;">
           </div>
         
           <tr>
             <td>
                <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center">
                           <tr> <td> <div align="center" style="margin-top:30px;"> <!--- Paging links ---> <cfif getgallery.recordcount GT 5> <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm"> </cfif> </div> </td> </tr> </table> </td> </tr> </div> <tr><td align=center><br> <cfoutput> <cfinclude template="/includes/linkexchangebystone.cfm"> <cfif subcat neq ""> <cfinclude template="/marketing/stonelinks.cfm"> </cfif> </cfoutput> </td></tr> </table>
	<!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
		<tr>
		<td>
		<div align="center" style="margin-top:30px;">
		--- Paging links ---
		<br>
		<br><br>
		</div>
		</td>
		</tr>
		</table>
		--->
	<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />
		<cfset session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >
		    <cfcatch type="application">
		        	<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)>
		<CFINCLUDE template="stoneinfo.inc">
	</cfif>
	</div>
	<!--- Footer --->
	<!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
	<cfinclude template="/mainfooter.cfm">
	<!--- End footer --->
	<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
		<div>
			<cfoutput>
				<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
					Contend Edit
				</a>
			</cfoutput>
			</div>
	</cfif>
	</div>
	<!---
		<cfinclude template="/googleadsforlist.htm">--->
	</BODY> </HTML>
	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<!---
	<CFSET _end=GetTickCount()>
	<CFSET executiontime=_end-_start>
	<cfoutput>blah:#executiontime#</cfoutput>
	--->
</cfif>



</cfcache> <cfcache  action="cache" timespan="#createtimespan(0,3,0,0)#" useQueryString="true">
 <cfif not isdefined("url.notmvc")>
<cfinclude template="silver_jewelry_gallery_slow.cfm" />
<cfelse>
<cftry>
	<cfparam name=session.cartid default="">
	<!---
		<CFSET _start=GetTickCount()> --->
	<cfparam name="groupname" default="">
	<!--- used in folders like shaped, rare-stones --->
	<cfparam name="inventory" default="" />
	<cfparam name="occasion" default=""  />
	<cfparam name="occasionmenu" default=""  />
	<cfparam name="session.name" default=""  />
	<cfparam name="url.supcode" default=""  />
	<cfparam name="supcode" default=""  />
	<cfparam name="sortorder" default="disporder" />
	<cfparam name="located" default="" />
	<cfparam name="stored" default="" />
	<cfparam name="metatitle" default="" />
	<cfparam name="metadescription" default="" />
	<cfparam name="description" default="" />
	<CFPARAM NAME="subcat" DEFAULT= "" />
	<CFPARAM NAME="subcat2" DEFAULT= "" />
	<cfparam name="categ" default="jewelry" />
	<cfparam name="metakeywords" default="" />
	<cfparam name="LatestStartingBackMonths" default="1" />
	<cfparam name="ringsize" default="" />
	<cfparam name="url.ringsize" default="" />
	<cfparam name="url.category" default="" />
	<cfparam name="pagedescription" default="" />
	<cfparam name="screensize" default="big" />
	<cfparam name="style" default="" />
	<cfparam name="url.style" default="#style#" />
	<cfparam name="silverjewelry" default="" />
	<CFPARAM NAME="displaycolumns" DEFAULT="4" />
	<CFPARAM NAME="display" DEFAULT="4" />
	<cfparam name="light" default="pink" />
	<cfparam name="dark" default="##D64578" />
	<CFPARAM NAME="numpages" DEFAULT="0" />
	<cfparam name="jewelrysize" default="" />
	<cfparam default="106" name="stonelistht" />
	<CFPARAM NAME="category" DEFAULT="all" />
	<CFPARAM NAME="priceless" DEFAULT="" />
	<CFPARAM NAME="category2" DEFAULT="all" />
	<cfparam default="662222" name="l" />
	<cfparam name="invstatus" default=-3	/>
	<cfparam name="url.start" default="1" />
	<CFPARAM NAME="start" DEFAULT= "1" />
	<CFPARAM NAME="edit" DEFAULT= "" />
	<CFPARAM NAME="newtstart" DEFAULT= "1" />
	<CFPARAM NAME="url.subcat" DEFAULT="amethyst" />
	<CFPARAM NAME="advancedsearch" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch1" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch2" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch3" DEFAULT= "" />
	<CFPARAM NAME="color" DEFAULT= "" />
	<CFPARAM NAME="Bcolor" DEFAULT= "white" />
	<CFPARAM NAME="salestatus" DEFAULT="" />
	<CFPARAM NAME="newcart" DEFAULT="" />
	<CFPARAM NAME="invent" DEFAULT="" />
	<CFPARAM NAME="j" DEFAULT="" />
	<CFPARAM NAME="pricegreater" DEFAULT="0" />
	<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/" />
	<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/" />
	<cfif occasion is 'oos'>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	<cfelse>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,1,0,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
	 </cfquery>
	</cfif>
	<!---<cftry>--->
			<cfif url.start LTE 0>
				<cfset start = 1 />
			</cfif>
			<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
			<cfoutput>
				<style media="screen"   type="text/css" >
					<!--
						html, body {
						        height: 100%;
						     }
						     ##container {
						        height: 100%; position: relative; z-index: 2;
						     }

						###category#_horiz {
						text-decoration:underline;

						}
						##ajax_context
						{
						display:none;
						}
						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart,</cfif>
							</cfloop>
							.comma_ender
						{
						background:url("/images/added.png") no-repeat  right center;
						height:12px;
						width:12px;
						}

						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
							</cfloop> .comma_ender1
						{
						background-color:##DFE;
						}
						-->
				</style>
			</cfoutput>
			<cfif  len(session.bulkbuyer.id) or 1>
				<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
			<cfelse>
				<link href="/styles/hub.css" rel="stylesheet" type="text/css" >
			</cfif>
			<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
			<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
			<link rel="shortcut icon" href="/favicon.ico" >
			<cfif session.quick_add or 1>
				<!--- we need the js for retail for info on make for me. --->
				<!-- morphing switched off here and in quick_add
					<script type="text/javascript" language="JavaScript" src="/js/mootools_.js"></script>-->
				<cfif cgi.server_name contains 'wholesale' and 0>
					<!-- why load this for non wholesale because MOD info uses this-->
					<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js?ver=2"></script>
					<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
				</cfif>
			</cfif>
			<script type="text/javascript" src="/js/global.js?ver=2.1"></script>
			<cfquery name="contentbypage" datasource="gemssql">
	Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
			<cfif contentbypage.recordcount GT 0>
				<cfif cgi.server_name contains 'wholesale'>
					<cfset metatitle="#contentbypage.title# Handmade">
					<cfset metadescription="#contentbypage.metadescription# Handmade">
					<cfset metakeywords="#contentbypage.keywords# Handmade">
					<cfset pagedescription="#contentbypage.description#">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
					<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
					<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
					<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
				<cfelse>
					<cfset metatitle="#contentbypage.title#">
					<cfset metadescription="#contentbypage.metadescription#">
					<cfset metakeywords="#contentbypage.keywords#">
					<cfset pagedescription="#contentbypage.description#">
				</cfif>
			</cfif>
			<cfoutput>
				<TITLE>
					<cfif url.start GT 1>
						Gallery starting from #url.start#th item.
					</cfif>
					#titlecase(metatitle)#
					<cfif ringsize neq "">
						Rings #ringsize#
					</cfif>
					<cfif cgi.server_name contains 'wholesale'>
						Wholesale
					</cfif>
					#titleCase(subcat)# #style#
					<cfif color neq "">
						#titleCase(color)#
					</cfif>
					<cfif groupname neq "">
						#titlecase(groupname)# #categ#
					</cfif>
				</TITLE>
				<cfif occasion eq "oos">
					<meta name="robots" content="noindex,nofollow">
				</cfif>
				<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif><cfif color neq "">
				#color# </cfif>
				<cfif subcat neq "">
					#subcat#
				</cfif>
				<cfif groupname neq "">
					#groupname#
				</cfif>
				#p#, #metakeywords#">
				<meta name="author" content="Anup Pandey" >
				<cfif cgi.server_name contains "semiprecious.in">
					<meta name=ICBM content="28.5573901, 77.1571443" />
					<meta name="geo.position" content="28.5573901;77.1571443" />
					<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
				</cfif>
			</cfoutput>
			<META content="20 days" name=revisit-after >
			<!-- Deluxe Menu -->
			<!-- (c) 2009, by Deluxe-Menu.com -->
			<cfsilent>
				<cfif cgi.https is "on">
					<cflocation url="http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" />
				</cfif>
				<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
				</cfif>
				<cfif #cgi.server_name# contains "forcesofindia">
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
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
				<!--- the above code is run every time a gallery page is invoked. A more sensible thing
					would be to set the above flag either in login page or cart page where we can detect that
					person is shopping --->
				<cfif ringsize neq "">
					<cfif ringsize does not contain 'size'>
						<cfset ringsize='size ' & ringsize>
					</cfif>
				</cfif>
				<cfif cgi.server_name contains "handmadelaptopcase.com">
					<cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset session.india=1>
					<cfset session.country = "india">
				</cfif>
				<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
				<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
					<cfif session.bulkbuyer.id eq "">
					<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
					</cfif>
					</cfif>--->
				<cfset sj = "">
				<cfif session.mail eq application.admin_email>
					<cfset url.edit =  'mamamia'>
					<cfset invstatus= -5>
				</cfif>
				<cfset  top = 114 />
				<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
				<cfif cgi.server_name contains "wholesale">
					<cfparam name="displayrows" default="4">
				<cfelse>
					<cfparam name="displayrows" default="4">
				</cfif>
				<cfif category is "jewelry">
					<cfif url.category neq "">
						<cfset category=url.category>
					<cfelse>
						<cfset category="">
					</cfif>
				</cfif>
				<CFIF CATEGORY  EQ "">
					<CFSET CATEGORY ="all">
				</CFIF>
				<cfif category is 'beads' and session.mail neq application.admin_email>
					<cfset invstatus=0>
				</cfif>
				<cfif category is "bracelets">
					<cfset displaycolumns="4">
				</cfif>
				<cfif category is 'beads'>
					<cfset displayrows=7>
					<cfset displaycolumns="4">
				</cfif>
				<CFSET CATEGORY2=CATEGORY>
				<cfif subcat contains "smokey" or subcat contains "smoky">
					<cfset subcat ="smoky quartz">
				</cfif>
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
				<!--- <script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script> --->
				<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
				<cfif category eq 'all' or category eq "">
					<cfset categ='jewelry'>
				</cfif>
				<cfif cgi.server_name contains "wholesale">
					<CFPARAM NAME="url.sortorder" DEFAULT="disporderwhole" >
				<cfelse>
					<cfif dateformat(now(),"dddd") eq "Sunday">
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Monday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Thursday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Friday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelse>
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					</cfif>
				</cfif>
				<cfparam name="sortorder" default="disporder">
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
				<cfif priceless neq "">
					<cfset sortorder='price desc'>
					<cfset url.sortorder =sortorder>
				</cfif>
				<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
				<cfif isnumeric(advancedsearch)>
					<cflocation url="detail.cfm?newitem=#advancedsearch#">
				</cfif>
				<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
					<cflocation url="/wholesale_login.cfm">
				</cfif>
				<cfinclude template="checkinjection.cfm">
				<cfparam name="grouping" default="">
				<cfif style is 'silver beaded'>
					<cfset style='Silverbeaded'>
				</cfif>
				<cfif not len(occasion)>
					<!--- to avoid this processing for solr based searches which use occasion as the indicator --->
					<cfif advancedsearch neq "">
						<cfif  advancedsearch contains 'silver'>
							<cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
							<cfset url.style='Silver'>
						</cfif>
						<cfif  advancedsearch contains 'neck'>
							<cfset category='necklaces'>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklace"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklaces"," ")>
						</cfif>
						<cfif  advancedsearch contains ' earr'>
							<cfset category='earrings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"earring"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"earrings"," ")>
						</cfif>
						<cfif  advancedsearch contains ' ring'>
							<cfset category='rings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"rings"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"ring"," ")>
						</cfif>
						<cfif  advancedsearch contains ' brace'>
							<cfset category='bracelets'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelet"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelets"," ")>
						</cfif>
						<cfif  advancedsearch contains ' pend'>
							<cfset category='pendants'>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendant"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendants"," ")>
						</cfif>
						<cfif  advancedsearch contains 'bead'>
							<cfset category='beads'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bead"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"beads"," ")>
						</cfif>
						<cfif  advancedsearch contains 'heal'>
							<cfset category='healing'>
							<cfset advancedsearch=replacenocase(advancedsearch,"healing"," ")>
						</cfif>
					</cfif>
				</cfif>
				<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring;
 }

  session.gallery = 'gemstone_jewelry_gallery.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping
IF (advancedsearch is not "") {
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark ='';
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors = Application.color_list;
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=20;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
				<!--- meta tags addition for groups--->
				<cfif groupname neq "">
					<cfif cgi.server_name contains 'wholesale'>
						<cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="Wholesale semiprecious gemstone #groupname# jewelry">
						<cfset metakeywords="Wholesale #groupname# #subcat# #categ#  in gemstones">
					<cfelseif session.country is "india">
						<cfset metatitle="#groupname# #subcat# #categ# and Jewellery in gemstones">
						<cfset metadescription="Online store for gifting authentic semiprecious gemstone #groupname# jewellery">
						<cfset metakeywords="#groupname# #subcat# #categ# gemstone jewelry">
					<cfelse>
						<cfset metatitle="#groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="#subcat# gemstone #categ# and healing #groupname# #style# sterling silver #start#">
						<cfset metakeywords="#groupname# #subcat# #categ# #style# gemstone jewelry">
					</cfif>
				</cfif>
				<!--- end meta tags for groups ---->
				<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
				<cfset currentfile='#Trim(CGI.path_info)#'>
				<!--- speed up things - this removed to reduce hits to the database
					<CFIF start EQ 1 and advancedsearch neq "">
					<cftry>
					<CFQUERY DATASOURCE="gemssql" NAME="searched">
					insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    )
					</cfquery>
					<cfcatch type="database">
					<cfquery DATASOURCE="gemssql" >
					Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
					</cfquery>
					Nothing in this selection. Please click <a href="/">here<a/> to continue shopping.
					</cfcatch>
					<cfcatch type="any">
					Sorry, an error has occured, please email us at cs@semiprecious.com
					</cfcatch>
					</cftry>
					</CFIF>
					--->
				<cfif not isdefined("form.submit5")>
					<!---<cftry>--->
					<cfif isdefined("form.search_criteria")>
						<cfset advancedsearch = form.search_criteria />
						<cfset occasion = "solr" />
						<cfif isnumeric(trim(form.search_criteria))>
							<cflocation url="jewelry_item.cfm?newitem=#trim(form.search_criteria)#" addtoken="no" />
						<cfelse>
							<cfset occasion = "solr" />
						</cfif>
					<cfelseif occasion is "solr">
						<cfset form.search_criteria = url.advancedsearch />
					</cfif>
					<CFOUTPUT>
						<h2>
							#stored# #occasion#
						</h2>
					</CFOUTPUT>
					<cftry>
						<cfswitch expression="#occasion#">
							<cfcase value="xmas">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getxmasitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="clearance">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getclearanceitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="supplier">
								<cfif not isdefined("url.supcode")>
									Please provide storage code like H or PJ or P
									<cfabort />
								</cfif>
								<cfquery datasource="gemssql" name="getlist"  >
				  <cfinclude template="/includes/getsupitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="oos">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/getoositemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="custom">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/customitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="solr">
								<!---	<cfif not find( expand ,Form.search_criteria)>
									<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfelse>
									<cfset criteria_ = replace(Form.search_criteria,' expand ',' ')/>
									</cfif>
									--->
								<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfoutput>
									here: #form.search_criteria#
								</cfoutput>
								<cfset occasionmenu = "Searched #replace(form.search_criteria,' ',' Or ', 'all')#"/>
								<!--- we don't want to go beyond one page display. Else we have to build the critieria into the next and previous navigation links also --->
								<!---
									<cfquery dbtype="query" name="getlist">
									SELECT distinct [key] as newitem
									FROM sq
									order by  score desc
									</cfquery>
									<cfset qry = "solr" />--->
								<!---
									<cfdump var="#sq#" />
									--->
								<cfquery datasource="gemssql" name="getlist">
		                                                            <cfinclude template="/includes/getrecordsitemidsSearch.cfm" />
	                                                    	</cfquery>
							</cfcase>
							<cfdefaultcase>
								<cftry>
									<cfquery datasource="gemssql" name="getlist">
		                                                                   <cfinclude template="/includes/getrecordsitemids.cfm" />
	                                                            	</cfquery>
									<cfcatch type="any">
										<cfset getlist.recordcount = 0 />
										<!---<cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
											type="html" >
											Following query gave no result:
											#category# #subcat#
											<cfif isdefined("cfcatch.sql")>
											#cfcatch.sql#,
											</cfif>
											#cgi.path_info#
											#cfcatch.message#
											</cfmail>--->
										Following query gave no result: #category# #subcat# #cfcatch.message# #cfcatch.detail#
									</cfcatch>
								</cftry>
							</cfdefaultcase>
						</cfswitch>
						<cfif getlist.recordcount GT 0>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = #getlist.newitem#
	</cfquery>
						<cfelse>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = 7130
	</cfquery>
						</cfif>
						<cfcatch type="any">
							<cfoutput>
								Nothing in this selection. Please click
								<a href="/#category#.cfm">
									here
								<a/>
									to continue shopping.
							</cfoutput>
							<cfset getlist2.cat = category /> <cfset getlist2.recordcount = 0 /> <cfset getlist.recordcount = 0 /> <cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER#
 #subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,
#advancedsearch1#,#advancedsearch2#
 http://www.semiprecious.com/silver_jewelry_gallery.cfm?#cgi.QUERY_STRING#  #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
</cfmail>
						</cfcatch>
					</cftry>
					<!---<cfcatch type="database">
						<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
						</cfcatch>
						</cftry>---> <!---
						<cfquery name="getlist" dbtype="query">
						Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
						buylink ,  orderprice from getlist
						</cfquery>---> <!---
						<cfcatch type="database">
						<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
						type="html" >
						#cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
						#subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
						#cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
						<CFSET url.sortorder = 'datetaken desc' />
						</cfmail>
						</cfcatch>--->
				</cfif>
				<cfif category is ""> <cfset category=categ> </cfif> <cfif category is ""> <cfset category="All"> </cfif>
			</cfsilent>
			<cfoutput> <meta name="description" content="Our <cfif p is 'jewelry' or p is 'necklaces' or p is 'pendants'>handcrafted<cfelse>handmade</cfif> <cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# gemstone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# <cfif p is "jewelry">comes<cfelseif p is "healing"> items come<cfelse>come</cfif> in many varieties. We are your source for<cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# stone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# in silver, beads, necklaces, pendants, rings, earrings, bracelets & healing.<cfif url.start GT 1>Gallery starting from #url.start#th item.</cfif>"> </cfoutput>
		</HEAD>
		<body style="margin-top:0" > <div style="width:100%;position:absolute;top:0;left:0;z-index:3" align="Center"> <div style="width:960px;position:relative;top:-10pt;left:0;"> <div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;"> </div> </div> </div>
 <div align="center" id="container"> <!--- set up for ajax add to cart ---> <form><input type="hidden" id="ajax_context" value=gallery></form> <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
			---> <cfif isdefined("url.quick_add")> <cfset session.quick_add = url.quick_add /> </cfif> <cfinclude template="/header#session.country#.cfm"> <CFIF not isdefined("gETLIst.recordcount")> <br /> <span class="error">No item found. PLEASE TRY AGAIN.</span> <cfif subcat is 'amber'> <cfinclude template="pippinindex.htm"> </cfif> <cfinclude template="footer.htm"> <CFSET enddisplay= start + display -1 > </div> </body>
	</html>
	<cfabort /> </cfif> <CFSET numpages=round(GetList.RecordCount/display)> <CFSET enddisplay= start + display -1> <cfif start gt getlist.recordcount> <cfset start = getlist.recordcount> </cfif> <cfif start lt 1> <cfset start = 1> </cfif> <!---<cfinclude template="includes/themes.cfm">---> <cfoutput>
                <cfif getlist.recordcount LT 13>
                   <cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures ---> </cfif>
                   <cfset display = displaycolumns*displayrows>
                            <CFIF GetList2.cat is not "">
                                        <input type='hidden' name='category' value='#GetList2.cat#' />
                                      <CFELSE>
                                      <input type='hidden' name='category' value='#category#' />
                                </cfif> <input type='hidden' name='url.sortorder' value='#url.sortorder#' /> <!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
		LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->
<cfset tw =  606>
<div id="container1">
    <h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >&nbsp; <script type="text/javascript">
              document.getElementById("filter_summary").display = "block";
          </script>
          <cfif len(occasionmenu)> #occasionmenu#
             <cfelse> <!--- <cfif session.country neq 'india'> --->
                 <cfif color neq "" or subcat neq "">
                      <cfif len(advancedsearch)>
                              <cfelse> <!--- Selection:  --->
                                       <Cfif isnumeric(priceless)> &nbsp;
                                            Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;<br /> </Cfif> <!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or Beaded</cfif></b><br>---> <cfif len(trim(subcat)) > <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")> <img src="/images/dots1.gif" style="display:inline;" /> <a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">#subcat# home</a>&nbsp;&nbsp;&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> <cfif listfindnocase(Application.cufflinkstones,subcat)> <a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.necklacestones,subcat)> <a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.Braceletstones,subcat)> <a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.ringstones,subcat)> <a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.earringstones,subcat)> <a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.pendantstones,subcat)> <a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.beadstones,subcat)> <a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
                                             </cfif>
                                             <cfelseif  color neq "">
                                                       <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">#color# Pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">#color# Rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">#color# Earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">#color# Bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">#color# Necklaces</a>&nbsp; <cfelseif  salestatus is 3 > <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp; </cfif> <cfif category EQ "All" > <span style="color:black;background-color:#light#;font-size=12 px;">All Categories</span>&nbsp; </cfif> </cfif> </cfif> &nbsp; <!--- <cfelse> ---> <cfif session.country eq 'India'> <cfif pricegreater neq 0 or priceless neq ""> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> ---> #category# <cfif pricegreater neq 0> From #round_format(pricegreater)# </cfif> <cfif priceless neq ""> Up To #round_format(priceless)# </cfif> <!--- </span> ---> <cfelse> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> ---> <!--- <cfset kws = replace(cgi.script_name,".cfm","") /> ---> <cfset kws = #contentbypage.title# /> <cfif IsDefined('nameid') AND nameid neq ''> #nameid# <cfelse> #Kws# </cfif> <!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> ---><!--- </cfloop> ---> <!--- </span> ---> </cfif> </cfif> </span> </cfif> <!-- #color#, #len(trim(subcat))#--> </h1> </cfoutput> <CFSET columns=1> <CFSET rows=1> <CFSET enddisplay= start + display-1>
                                          <CFSET currentrow= start>
                                       <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
                                               <tr >

             <!---
              <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
              <td valign="top"  align="left" > <cfset itemCount = 0>
                  <cfset itemlist = 0> <cfset price_color_filter = "" />
                  <div id="semiprecious_gallery" style="margin-top:1px;overflow:visible;position:relative;float:right;margin-right:6px;" >
                  <CFIF getList.recordcount eq 0>
                  <div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:627px;text-align:justify;font-size:12px;color:black;">
                           <cfoutput>
                           Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
                          <cfif salestatus is 3> that are on sale </cfif>
                          <cfif pricegreater GT 0>
                              within price range #format(priceless)# to #format(pricegreater)#
                          </cfif>
                          <!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
        		<cfinclude template="/googleadsforlist.htm">
        		---->
                     </cfoutput>
             <cfset silver = "">
             <cfif isdefined("url.relocated")>
               <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
		OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  ---> <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail> <cfelse> <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
		--->
            </cfif>
            </div> <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
		#session.mail#,#cgi.QUERY_STRING# .
		</cfmail>
		--->
            <cfabort />
          </div></td></tr></table></body></html>
          </cfif>

           <!--- gallery portion starts here --->
         <div align="left" >
                         <cfif (Not len(session.name) or session.mail eq application.admin_email) and start lt 2>
                             <div align="left" style="width:100%; border-collapse:collapse; border:thin;">
                               <cfoutput>
                                   <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span>
                                </cfoutput>
                             </div>
                        </cfif>

         <span class="found_header">Showing <cfoutput>#Getlist.recordcount# #titlecase(color)# #titlecase(subcat)#
         <cfif groupname neq ""> #titlecase(groupname)#</cfif> #titlecase(url.style)# <cfif len(category) GT 3> #titlecase(category)#<cfelse> Items
         </cfif>
         <cfif pricegreater neq "0"> Over #format(pricegreater)#</cfif>
         <cfif priceless neq ""> Under #format(priceless)#</cfif> </cfoutput>
         </span>&nbsp;
         <!---<div >
          <cfinclude template="/includes/searchdropdowns.cfm" />

          <cfif subcat neq "" or groupname neq "" or pricegreater neq "0" or priceless neq "">
             <a href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath() )#</cfoutput> >
             Clear Filters</a></cfif>
            </div> --->
             <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>--->
          <cfif start is 1>
          <cfif session.cartitem[1][1] is 0>
          <h3 id="infotable"  style="margin-left:20px;"  align="justify" >
           <cfif subcat is 'pearl'>
           <font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.
         </font>
         </cfif> <!---#pagedescription#
          <cfif color neq "">
		Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
		</cfif>--->
             . </h3>
             </cfif>
             </cfif>
             <cfif session.mail eq application.admin_email> <!--- place to put display code ---> <cfoutput><cfif occasion is 'oos'>OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE</cfif></cfoutput> </cfif> <cfset quick_add = session.quick_add /> <!---<cfinclude template="/includes/gallery_engine.cfm" />
		<div align="center" style="margin-top:30px;">
		<!--- Paging links ---> <!---
		<CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">---> <!---  <div style="text-align:center;margin-bottom:2px;">
		<cfoutput>
		<span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
		</cfoutput>
		</div>
		End Paging links --->
               </div>
               <div align="center" id="cart_summary" style="z-index:6;"></div> <!--- End Matt Bayuk - SGM ---> <!---
		<cfinclude  template="statsrecord.cfm">--->
             </div><!--- semipeciou_gallery --->
               <div style="float:left;display:inline;width:100px;">
                       <cfset leftgemstonedisplay="block" />
                        <cfif color neq "" >
                               <cfset leftcolordisplay="block" />
                         </cfif>
                  <!---
		<cfif pricegreater neq 0 or priceless neq "">
		    <cfset leftpricedisplay = "inline" />
		    <span style="font-weight:bold">
                           <cfinclude template="/includes/price_color_filter.cfm" />
                   </span>
		</cfif>
		removed because now we ave a color bar above gallery---> <cfif category neq 'gems' and cgi.server_name does not contain 'wholesale'> <br> <CFINCLUDE TEMPLATE="leftmenus.cfm"> </cfif> </div> </td></tr> <!--- <tr> <td>
		<a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
		</td>
		</tr>---> ---> </td> </tr>
                        <tr> <td>
                 <table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
                 <tr>
                 <td valign="top">
                 <div style="float:left;display:inline;width:158px;">
                                <cfset leftgemstonedisplay="block" /> <cfif color neq "" > <cfset leftcolordisplay="block" /> </cfif>
                                <cfif category neq 'gems' and category neq "cufflinks" >
                                        <div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
                                                <CFINCLUDE TEMPLATE="leftmenus.cfm">
                                        </div>
                                </cfif>
                                <!---
                                            <p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                        		        <cfif session.country neq 'india'>
                            		<cfcache action="serverCache" timespan="1">
                            		    <cfinclude template="/includes/grouplist.cfm">
                            		</cfcache>
                                    </cfif>
                            --->
                </div>
                </td>
                <td align="center" valign="top">
                    <div style="margin-top:12px;margin-left:22px;float:left;">
                         <cfinclude template="/includes/gallery_engine.cfm" />
                     </div>
                    </td>
                   </tr>
                </table>
                </td>
                </tr>
                <div align="center" id="cart_summary" style="z-index:6;">
           </div>
         
           <tr>
             <td>
                <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center">
                           <tr> <td> <div align="center" style="margin-top:30px;"> <!--- Paging links ---> <cfif getgallery.recordcount GT 5> <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm"> </cfif> </div> </td> </tr> </table> </td> </tr> </div> <tr><td align=center><br> <cfoutput> <cfinclude template="/includes/linkexchangebystone.cfm"> <cfif subcat neq ""> <cfinclude template="/marketing/stonelinks.cfm"> </cfif> </cfoutput> </td></tr> </table>
	<!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
		<tr>
		<td>
		<div align="center" style="margin-top:30px;">
		--- Paging links ---
		<br>
		<br><br>
		</div>
		</td>
		</tr>
		</table>
		--->
	<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />
		<cfset session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >
		    <cfcatch type="application">
		        	<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)>
		<CFINCLUDE template="stoneinfo.inc">
	</cfif>
	</div>
	<!--- Footer --->
	<!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
	<cfinclude template="/mainfooter.cfm">
	<!--- End footer --->
	<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
		<div>
			<cfoutput>
				<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
					Contend Edit
				</a>
			</cfoutput>
			</div>
	</cfif>
	</div>
	<!---
		<cfinclude template="/googleadsforlist.htm">--->
	</BODY> </HTML>
	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<!---
	<CFSET _end=GetTickCount()>
	<CFSET executiontime=_end-_start>
	<cfoutput>blah:#executiontime#</cfoutput>
	--->
</cfif>



</cfcache> <cfcache  action="cache" timespan="#createtimespan(0,3,0,0)#" useQueryString="true">
 <cfif not isdefined("url.notmvc")>
<cfinclude template="silver_jewelry_gallery_slow.cfm" />
<cfelse>
<cftry>
	<cfparam name=session.cartid default="">
	<!---
		<CFSET _start=GetTickCount()> --->
	<cfparam name="groupname" default="">
	<!--- used in folders like shaped, rare-stones --->
	<cfparam name="inventory" default="" />
	<cfparam name="occasion" default=""  />
	<cfparam name="occasionmenu" default=""  />
	<cfparam name="session.name" default=""  />
	<cfparam name="url.supcode" default=""  />
	<cfparam name="supcode" default=""  />
	<cfparam name="sortorder" default="disporder" />
	<cfparam name="located" default="" />
	<cfparam name="stored" default="" />
	<cfparam name="metatitle" default="" />
	<cfparam name="metadescription" default="" />
	<cfparam name="description" default="" />
	<CFPARAM NAME="subcat" DEFAULT= "" />
	<CFPARAM NAME="subcat2" DEFAULT= "" />
	<cfparam name="categ" default="jewelry" />
	<cfparam name="metakeywords" default="" />
	<cfparam name="LatestStartingBackMonths" default="1" />
	<cfparam name="ringsize" default="" />
	<cfparam name="url.ringsize" default="" />
	<cfparam name="url.category" default="" />
	<cfparam name="pagedescription" default="" />
	<cfparam name="screensize" default="big" />
	<cfparam name="style" default="" />
	<cfparam name="url.style" default="#style#" />
	<cfparam name="silverjewelry" default="" />
	<CFPARAM NAME="displaycolumns" DEFAULT="4" />
	<CFPARAM NAME="display" DEFAULT="4" />
	<cfparam name="light" default="pink" />
	<cfparam name="dark" default="##D64578" />
	<CFPARAM NAME="numpages" DEFAULT="0" />
	<cfparam name="jewelrysize" default="" />
	<cfparam default="106" name="stonelistht" />
	<CFPARAM NAME="category" DEFAULT="all" />
	<CFPARAM NAME="priceless" DEFAULT="" />
	<CFPARAM NAME="category2" DEFAULT="all" />
	<cfparam default="662222" name="l" />
	<cfparam name="invstatus" default=-3	/>
	<cfparam name="url.start" default="1" />
	<CFPARAM NAME="start" DEFAULT= "1" />
	<CFPARAM NAME="edit" DEFAULT= "" />
	<CFPARAM NAME="newtstart" DEFAULT= "1" />
	<CFPARAM NAME="url.subcat" DEFAULT="amethyst" />
	<CFPARAM NAME="advancedsearch" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch1" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch2" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch3" DEFAULT= "" />
	<CFPARAM NAME="color" DEFAULT= "" />
	<CFPARAM NAME="Bcolor" DEFAULT= "white" />
	<CFPARAM NAME="salestatus" DEFAULT="" />
	<CFPARAM NAME="newcart" DEFAULT="" />
	<CFPARAM NAME="invent" DEFAULT="" />
	<CFPARAM NAME="j" DEFAULT="" />
	<CFPARAM NAME="pricegreater" DEFAULT="0" />
	<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/" />
	<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/" />
	<cfif occasion is 'oos'>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	<cfelse>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,1,0,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
	 </cfquery>
	</cfif>
	<!---<cftry>--->
			<cfif url.start LTE 0>
				<cfset start = 1 />
			</cfif>
			<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
			<cfoutput>
				<style media="screen"   type="text/css" >
					<!--
						html, body {
						        height: 100%;
						     }
						     ##container {
						        height: 100%; position: relative; z-index: 2;
						     }

						###category#_horiz {
						text-decoration:underline;

						}
						##ajax_context
						{
						display:none;
						}
						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart,</cfif>
							</cfloop>
							.comma_ender
						{
						background:url("/images/added.png") no-repeat  right center;
						height:12px;
						width:12px;
						}

						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
							</cfloop> .comma_ender1
						{
						background-color:##DFE;
						}
						-->
				</style>
			</cfoutput>
			<cfif  len(session.bulkbuyer.id) or 1>
				<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
			<cfelse>
				<link href="/styles/hub.css" rel="stylesheet" type="text/css" >
			</cfif>
			<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
			<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
			<link rel="shortcut icon" href="/favicon.ico" >
			<cfif session.quick_add or 1>
				<!--- we need the js for retail for info on make for me. --->
				<!-- morphing switched off here and in quick_add
					<script type="text/javascript" language="JavaScript" src="/js/mootools_.js"></script>-->
				<cfif cgi.server_name contains 'wholesale' and 0>
					<!-- why load this for non wholesale because MOD info uses this-->
					<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js?ver=2"></script>
					<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
				</cfif>
			</cfif>
			<script type="text/javascript" src="/js/global.js?ver=2.1"></script>
			<cfquery name="contentbypage" datasource="gemssql">
	Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
			<cfif contentbypage.recordcount GT 0>
				<cfif cgi.server_name contains 'wholesale'>
					<cfset metatitle="#contentbypage.title# Handmade">
					<cfset metadescription="#contentbypage.metadescription# Handmade">
					<cfset metakeywords="#contentbypage.keywords# Handmade">
					<cfset pagedescription="#contentbypage.description#">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
					<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
					<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
					<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
				<cfelse>
					<cfset metatitle="#contentbypage.title#">
					<cfset metadescription="#contentbypage.metadescription#">
					<cfset metakeywords="#contentbypage.keywords#">
					<cfset pagedescription="#contentbypage.description#">
				</cfif>
			</cfif>
			<cfoutput>
				<TITLE>
					<cfif url.start GT 1>
						Gallery starting from #url.start#th item.
					</cfif>
					#titlecase(metatitle)#
					<cfif ringsize neq "">
						Rings #ringsize#
					</cfif>
					<cfif cgi.server_name contains 'wholesale'>
						Wholesale
					</cfif>
					#titleCase(subcat)# #style#
					<cfif color neq "">
						#titleCase(color)#
					</cfif>
					<cfif groupname neq "">
						#titlecase(groupname)# #categ#
					</cfif>
				</TITLE>
				<cfif occasion eq "oos">
					<meta name="robots" content="noindex,nofollow">
				</cfif>
				<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif><cfif color neq "">
				#color# </cfif>
				<cfif subcat neq "">
					#subcat#
				</cfif>
				<cfif groupname neq "">
					#groupname#
				</cfif>
				#p#, #metakeywords#">
				<meta name="author" content="Anup Pandey" >
				<cfif cgi.server_name contains "semiprecious.in">
					<meta name=ICBM content="28.5573901, 77.1571443" />
					<meta name="geo.position" content="28.5573901;77.1571443" />
					<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
				</cfif>
			</cfoutput>
			<META content="20 days" name=revisit-after >
			<!-- Deluxe Menu -->
			<!-- (c) 2009, by Deluxe-Menu.com -->
			<cfsilent>
				<cfif cgi.https is "on">
					<cflocation url="http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" />
				</cfif>
				<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
				</cfif>
				<cfif #cgi.server_name# contains "forcesofindia">
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
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
				<!--- the above code is run every time a gallery page is invoked. A more sensible thing
					would be to set the above flag either in login page or cart page where we can detect that
					person is shopping --->
				<cfif ringsize neq "">
					<cfif ringsize does not contain 'size'>
						<cfset ringsize='size ' & ringsize>
					</cfif>
				</cfif>
				<cfif cgi.server_name contains "handmadelaptopcase.com">
					<cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset session.india=1>
					<cfset session.country = "india">
				</cfif>
				<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
				<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
					<cfif session.bulkbuyer.id eq "">
					<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
					</cfif>
					</cfif>--->
				<cfset sj = "">
				<cfif session.mail eq application.admin_email>
					<cfset url.edit =  'mamamia'>
					<cfset invstatus= -5>
				</cfif>
				<cfset  top = 114 />
				<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
				<cfif cgi.server_name contains "wholesale">
					<cfparam name="displayrows" default="4">
				<cfelse>
					<cfparam name="displayrows" default="4">
				</cfif>
				<cfif category is "jewelry">
					<cfif url.category neq "">
						<cfset category=url.category>
					<cfelse>
						<cfset category="">
					</cfif>
				</cfif>
				<CFIF CATEGORY  EQ "">
					<CFSET CATEGORY ="all">
				</CFIF>
				<cfif category is 'beads' and session.mail neq application.admin_email>
					<cfset invstatus=0>
				</cfif>
				<cfif category is "bracelets">
					<cfset displaycolumns="4">
				</cfif>
				<cfif category is 'beads'>
					<cfset displayrows=7>
					<cfset displaycolumns="4">
				</cfif>
				<CFSET CATEGORY2=CATEGORY>
				<cfif subcat contains "smokey" or subcat contains "smoky">
					<cfset subcat ="smoky quartz">
				</cfif>
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
				<!--- <script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script> --->
				<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
				<cfif category eq 'all' or category eq "">
					<cfset categ='jewelry'>
				</cfif>
				<cfif cgi.server_name contains "wholesale">
					<CFPARAM NAME="url.sortorder" DEFAULT="disporderwhole" >
				<cfelse>
					<cfif dateformat(now(),"dddd") eq "Sunday">
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Monday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Thursday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Friday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelse>
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					</cfif>
				</cfif>
				<cfparam name="sortorder" default="disporder">
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
				<cfif priceless neq "">
					<cfset sortorder='price desc'>
					<cfset url.sortorder =sortorder>
				</cfif>
				<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
				<cfif isnumeric(advancedsearch)>
					<cflocation url="detail.cfm?newitem=#advancedsearch#">
				</cfif>
				<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
					<cflocation url="/wholesale_login.cfm">
				</cfif>
				<cfinclude template="checkinjection.cfm">
				<cfparam name="grouping" default="">
				<cfif style is 'silver beaded'>
					<cfset style='Silverbeaded'>
				</cfif>
				<cfif not len(occasion)>
					<!--- to avoid this processing for solr based searches which use occasion as the indicator --->
					<cfif advancedsearch neq "">
						<cfif  advancedsearch contains 'silver'>
							<cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
							<cfset url.style='Silver'>
						</cfif>
						<cfif  advancedsearch contains 'neck'>
							<cfset category='necklaces'>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklace"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklaces"," ")>
						</cfif>
						<cfif  advancedsearch contains ' earr'>
							<cfset category='earrings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"earring"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"earrings"," ")>
						</cfif>
						<cfif  advancedsearch contains ' ring'>
							<cfset category='rings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"rings"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"ring"," ")>
						</cfif>
						<cfif  advancedsearch contains ' brace'>
							<cfset category='bracelets'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelet"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelets"," ")>
						</cfif>
						<cfif  advancedsearch contains ' pend'>
							<cfset category='pendants'>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendant"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendants"," ")>
						</cfif>
						<cfif  advancedsearch contains 'bead'>
							<cfset category='beads'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bead"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"beads"," ")>
						</cfif>
						<cfif  advancedsearch contains 'heal'>
							<cfset category='healing'>
							<cfset advancedsearch=replacenocase(advancedsearch,"healing"," ")>
						</cfif>
					</cfif>
				</cfif>
				<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring;
 }

  session.gallery = 'gemstone_jewelry_gallery.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping
IF (advancedsearch is not "") {
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark ='';
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors = Application.color_list;
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=20;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
				<!--- meta tags addition for groups--->
				<cfif groupname neq "">
					<cfif cgi.server_name contains 'wholesale'>
						<cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="Wholesale semiprecious gemstone #groupname# jewelry">
						<cfset metakeywords="Wholesale #groupname# #subcat# #categ#  in gemstones">
					<cfelseif session.country is "india">
						<cfset metatitle="#groupname# #subcat# #categ# and Jewellery in gemstones">
						<cfset metadescription="Online store for gifting authentic semiprecious gemstone #groupname# jewellery">
						<cfset metakeywords="#groupname# #subcat# #categ# gemstone jewelry">
					<cfelse>
						<cfset metatitle="#groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="#subcat# gemstone #categ# and healing #groupname# #style# sterling silver #start#">
						<cfset metakeywords="#groupname# #subcat# #categ# #style# gemstone jewelry">
					</cfif>
				</cfif>
				<!--- end meta tags for groups ---->
				<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
				<cfset currentfile='#Trim(CGI.path_info)#'>
				<!--- speed up things - this removed to reduce hits to the database
					<CFIF start EQ 1 and advancedsearch neq "">
					<cftry>
					<CFQUERY DATASOURCE="gemssql" NAME="searched">
					insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    )
					</cfquery>
					<cfcatch type="database">
					<cfquery DATASOURCE="gemssql" >
					Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
					</cfquery>
					Nothing in this selection. Please click <a href="/">here<a/> to continue shopping.
					</cfcatch>
					<cfcatch type="any">
					Sorry, an error has occured, please email us at cs@semiprecious.com
					</cfcatch>
					</cftry>
					</CFIF>
					--->
				<cfif not isdefined("form.submit5")>
					<!---<cftry>--->
					<cfif isdefined("form.search_criteria")>
						<cfset advancedsearch = form.search_criteria />
						<cfset occasion = "solr" />
						<cfif isnumeric(trim(form.search_criteria))>
							<cflocation url="jewelry_item.cfm?newitem=#trim(form.search_criteria)#" addtoken="no" />
						<cfelse>
							<cfset occasion = "solr" />
						</cfif>
					<cfelseif occasion is "solr">
						<cfset form.search_criteria = url.advancedsearch />
					</cfif>
					<CFOUTPUT>
						<h2>
							#stored# #occasion#
						</h2>
					</CFOUTPUT>
					<cftry>
						<cfswitch expression="#occasion#">
							<cfcase value="xmas">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getxmasitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="clearance">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getclearanceitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="supplier">
								<cfif not isdefined("url.supcode")>
									Please provide storage code like H or PJ or P
									<cfabort />
								</cfif>
								<cfquery datasource="gemssql" name="getlist"  >
				  <cfinclude template="/includes/getsupitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="oos">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/getoositemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="custom">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/customitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="solr">
								<!---	<cfif not find( expand ,Form.search_criteria)>
									<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfelse>
									<cfset criteria_ = replace(Form.search_criteria,' expand ',' ')/>
									</cfif>
									--->
								<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfoutput>
									here: #form.search_criteria#
								</cfoutput>
								<cfset occasionmenu = "Searched #replace(form.search_criteria,' ',' Or ', 'all')#"/>
								<!--- we don't want to go beyond one page display. Else we have to build the critieria into the next and previous navigation links also --->
								<!---
									<cfquery dbtype="query" name="getlist">
									SELECT distinct [key] as newitem
									FROM sq
									order by  score desc
									</cfquery>
									<cfset qry = "solr" />--->
								<!---
									<cfdump var="#sq#" />
									--->
								<cfquery datasource="gemssql" name="getlist">
		                                                            <cfinclude template="/includes/getrecordsitemidsSearch.cfm" />
	                                                    	</cfquery>
							</cfcase>
							<cfdefaultcase>
								<cftry>
									<cfquery datasource="gemssql" name="getlist">
		                                                                   <cfinclude template="/includes/getrecordsitemids.cfm" />
	                                                            	</cfquery>
									<cfcatch type="any">
										<cfset getlist.recordcount = 0 />
										<!---<cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
											type="html" >
											Following query gave no result:
											#category# #subcat#
											<cfif isdefined("cfcatch.sql")>
											#cfcatch.sql#,
											</cfif>
											#cgi.path_info#
											#cfcatch.message#
											</cfmail>--->
										Following query gave no result: #category# #subcat# #cfcatch.message# #cfcatch.detail#
									</cfcatch>
								</cftry>
							</cfdefaultcase>
						</cfswitch>
						<cfif getlist.recordcount GT 0>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = #getlist.newitem#
	</cfquery>
						<cfelse>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = 7130
	</cfquery>
						</cfif>
						<cfcatch type="any">
							<cfoutput>
								Nothing in this selection. Please click
								<a href="/#category#.cfm">
									here
								<a/>
									to continue shopping.
							</cfoutput>
							<cfset getlist2.cat = category /> <cfset getlist2.recordcount = 0 /> <cfset getlist.recordcount = 0 /> <cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER#
 #subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,
#advancedsearch1#,#advancedsearch2#
 http://www.semiprecious.com/silver_jewelry_gallery.cfm?#cgi.QUERY_STRING#  #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
</cfmail>
						</cfcatch>
					</cftry>
					<!---<cfcatch type="database">
						<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
						</cfcatch>
						</cftry>---> <!---
						<cfquery name="getlist" dbtype="query">
						Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
						buylink ,  orderprice from getlist
						</cfquery>---> <!---
						<cfcatch type="database">
						<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
						type="html" >
						#cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
						#subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
						#cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
						<CFSET url.sortorder = 'datetaken desc' />
						</cfmail>
						</cfcatch>--->
				</cfif>
				<cfif category is ""> <cfset category=categ> </cfif> <cfif category is ""> <cfset category="All"> </cfif>
			</cfsilent>
			<cfoutput> <meta name="description" content="Our <cfif p is 'jewelry' or p is 'necklaces' or p is 'pendants'>handcrafted<cfelse>handmade</cfif> <cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# gemstone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# <cfif p is "jewelry">comes<cfelseif p is "healing"> items come<cfelse>come</cfif> in many varieties. We are your source for<cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# stone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# in silver, beads, necklaces, pendants, rings, earrings, bracelets & healing.<cfif url.start GT 1>Gallery starting from #url.start#th item.</cfif>"> </cfoutput>
		</HEAD>
		<body style="margin-top:0" > <div style="width:100%;position:absolute;top:0;left:0;z-index:3" align="Center"> <div style="width:960px;position:relative;top:-10pt;left:0;"> <div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;"> </div> </div> </div>
 <div align="center" id="container"> <!--- set up for ajax add to cart ---> <form><input type="hidden" id="ajax_context" value=gallery></form> <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
			---> <cfif isdefined("url.quick_add")> <cfset session.quick_add = url.quick_add /> </cfif> <cfinclude template="/header#session.country#.cfm"> <CFIF not isdefined("gETLIst.recordcount")> <br /> <span class="error">No item found. PLEASE TRY AGAIN.</span> <cfif subcat is 'amber'> <cfinclude template="pippinindex.htm"> </cfif> <cfinclude template="footer.htm"> <CFSET enddisplay= start + display -1 > </div> </body>
	</html>
	<cfabort /> </cfif> <CFSET numpages=round(GetList.RecordCount/display)> <CFSET enddisplay= start + display -1> <cfif start gt getlist.recordcount> <cfset start = getlist.recordcount> </cfif> <cfif start lt 1> <cfset start = 1> </cfif> <!---<cfinclude template="includes/themes.cfm">---> <cfoutput>
                <cfif getlist.recordcount LT 13>
                   <cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures ---> </cfif>
                   <cfset display = displaycolumns*displayrows>
                            <CFIF GetList2.cat is not "">
                                        <input type='hidden' name='category' value='#GetList2.cat#' />
                                      <CFELSE>
                                      <input type='hidden' name='category' value='#category#' />
                                </cfif> <input type='hidden' name='url.sortorder' value='#url.sortorder#' /> <!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
		LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->
<cfset tw =  606>
<div id="container1">
    <h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >&nbsp; <script type="text/javascript">
              document.getElementById("filter_summary").display = "block";
          </script>
          <cfif len(occasionmenu)> #occasionmenu#
             <cfelse> <!--- <cfif session.country neq 'india'> --->
                 <cfif color neq "" or subcat neq "">
                      <cfif len(advancedsearch)>
                              <cfelse> <!--- Selection:  --->
                                       <Cfif isnumeric(priceless)> &nbsp;
                                            Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;<br /> </Cfif> <!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or Beaded</cfif></b><br>---> <cfif len(trim(subcat)) > <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")> <img src="/images/dots1.gif" style="display:inline;" /> <a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">#subcat# home</a>&nbsp;&nbsp;&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> <cfif listfindnocase(Application.cufflinkstones,subcat)> <a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.necklacestones,subcat)> <a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.Braceletstones,subcat)> <a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.ringstones,subcat)> <a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.earringstones,subcat)> <a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.pendantstones,subcat)> <a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.beadstones,subcat)> <a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
                                             </cfif>
                                             <cfelseif  color neq "">
                                                       <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">#color# Pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">#color# Rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">#color# Earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">#color# Bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">#color# Necklaces</a>&nbsp; <cfelseif  salestatus is 3 > <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp; </cfif> <cfif category EQ "All" > <span style="color:black;background-color:#light#;font-size=12 px;">All Categories</span>&nbsp; </cfif> </cfif> </cfif> &nbsp; <!--- <cfelse> ---> <cfif session.country eq 'India'> <cfif pricegreater neq 0 or priceless neq ""> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> ---> #category# <cfif pricegreater neq 0> From #round_format(pricegreater)# </cfif> <cfif priceless neq ""> Up To #round_format(priceless)# </cfif> <!--- </span> ---> <cfelse> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> ---> <!--- <cfset kws = replace(cgi.script_name,".cfm","") /> ---> <cfset kws = #contentbypage.title# /> <cfif IsDefined('nameid') AND nameid neq ''> #nameid# <cfelse> #Kws# </cfif> <!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> ---><!--- </cfloop> ---> <!--- </span> ---> </cfif> </cfif> </span> </cfif> <!-- #color#, #len(trim(subcat))#--> </h1> </cfoutput> <CFSET columns=1> <CFSET rows=1> <CFSET enddisplay= start + display-1>
                                          <CFSET currentrow= start>
                                       <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
                                               <tr >

             <!---
              <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
              <td valign="top"  align="left" > <cfset itemCount = 0>
                  <cfset itemlist = 0> <cfset price_color_filter = "" />
                  <div id="semiprecious_gallery" style="margin-top:1px;overflow:visible;position:relative;float:right;margin-right:6px;" >
                  <CFIF getList.recordcount eq 0>
                  <div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:627px;text-align:justify;font-size:12px;color:black;">
                           <cfoutput>
                           Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
                          <cfif salestatus is 3> that are on sale </cfif>
                          <cfif pricegreater GT 0>
                              within price range #format(priceless)# to #format(pricegreater)#
                          </cfif>
                          <!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
        		<cfinclude template="/googleadsforlist.htm">
        		---->
                     </cfoutput>
             <cfset silver = "">
             <cfif isdefined("url.relocated")>
               <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
		OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  ---> <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail> <cfelse> <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
		--->
            </cfif>
            </div> <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
		#session.mail#,#cgi.QUERY_STRING# .
		</cfmail>
		--->
            <cfabort />
          </div></td></tr></table></body></html>
          </cfif>

           <!--- gallery portion starts here --->
         <div align="left" >
                         <cfif (Not len(session.name) or session.mail eq application.admin_email) and start lt 2>
                             <div align="left" style="width:100%; border-collapse:collapse; border:thin;">
                               <cfoutput>
                                   <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span>
                                </cfoutput>
                             </div>
                        </cfif>

         <span class="found_header">Showing <cfoutput>#Getlist.recordcount# #titlecase(color)# #titlecase(subcat)#
         <cfif groupname neq ""> #titlecase(groupname)#</cfif> #titlecase(url.style)# <cfif len(category) GT 3> #titlecase(category)#<cfelse> Items
         </cfif>
         <cfif pricegreater neq "0"> Over #format(pricegreater)#</cfif>
         <cfif priceless neq ""> Under #format(priceless)#</cfif> </cfoutput>
         </span>&nbsp;
         <!---<div >
          <cfinclude template="/includes/searchdropdowns.cfm" />

          <cfif subcat neq "" or groupname neq "" or pricegreater neq "0" or priceless neq "">
             <a href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath() )#</cfoutput> >
             Clear Filters</a></cfif>
            </div> --->
             <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>--->
          <cfif start is 1>
          <cfif session.cartitem[1][1] is 0>
          <h3 id="infotable"  style="margin-left:20px;"  align="justify" >
           <cfif subcat is 'pearl'>
           <font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.
         </font>
         </cfif> <!---#pagedescription#
          <cfif color neq "">
		Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
		</cfif>--->
             . </h3>
             </cfif>
             </cfif>
             <cfif session.mail eq application.admin_email> <!--- place to put display code ---> <cfoutput><cfif occasion is 'oos'>OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE</cfif></cfoutput> </cfif> <cfset quick_add = session.quick_add /> <!---<cfinclude template="/includes/gallery_engine.cfm" />
		<div align="center" style="margin-top:30px;">
		<!--- Paging links ---> <!---
		<CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">---> <!---  <div style="text-align:center;margin-bottom:2px;">
		<cfoutput>
		<span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
		</cfoutput>
		</div>
		End Paging links --->
               </div>
               <div align="center" id="cart_summary" style="z-index:6;"></div> <!--- End Matt Bayuk - SGM ---> <!---
		<cfinclude  template="statsrecord.cfm">--->
             </div><!--- semipeciou_gallery --->
               <div style="float:left;display:inline;width:100px;">
                       <cfset leftgemstonedisplay="block" />
                        <cfif color neq "" >
                               <cfset leftcolordisplay="block" />
                         </cfif>
                  <!---
		<cfif pricegreater neq 0 or priceless neq "">
		    <cfset leftpricedisplay = "inline" />
		    <span style="font-weight:bold">
                           <cfinclude template="/includes/price_color_filter.cfm" />
                   </span>
		</cfif>
		removed because now we ave a color bar above gallery---> <cfif category neq 'gems' and cgi.server_name does not contain 'wholesale'> <br> <CFINCLUDE TEMPLATE="leftmenus.cfm"> </cfif> </div> </td></tr> <!--- <tr> <td>
		<a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
		</td>
		</tr>---> ---> </td> </tr>
                        <tr> <td>
                 <table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
                 <tr>
                 <td valign="top">
                 <div style="float:left;display:inline;width:158px;">
                                <cfset leftgemstonedisplay="block" /> <cfif color neq "" > <cfset leftcolordisplay="block" /> </cfif>
                                <cfif category neq 'gems' and category neq "cufflinks" >
                                        <div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
                                                <CFINCLUDE TEMPLATE="leftmenus.cfm">
                                        </div>
                                </cfif>
                                <!---
                                            <p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                        		        <cfif session.country neq 'india'>
                            		<cfcache action="serverCache" timespan="1">
                            		    <cfinclude template="/includes/grouplist.cfm">
                            		</cfcache>
                                    </cfif>
                            --->
                </div>
                </td>
                <td align="center" valign="top">
                    <div style="margin-top:12px;margin-left:22px;float:left;">
                         <cfinclude template="/includes/gallery_engine.cfm" />
                     </div>
                    </td>
                   </tr>
                </table>
                </td>
                </tr>
                <div align="center" id="cart_summary" style="z-index:6;">
           </div>
         
           <tr>
             <td>
                <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center">
                           <tr> <td> <div align="center" style="margin-top:30px;"> <!--- Paging links ---> <cfif getgallery.recordcount GT 5> <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm"> </cfif> </div> </td> </tr> </table> </td> </tr> </div> <tr><td align=center><br> <cfoutput> <cfinclude template="/includes/linkexchangebystone.cfm"> <cfif subcat neq ""> <cfinclude template="/marketing/stonelinks.cfm"> </cfif> </cfoutput> </td></tr> </table>
	<!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
		<tr>
		<td>
		<div align="center" style="margin-top:30px;">
		--- Paging links ---
		<br>
		<br><br>
		</div>
		</td>
		</tr>
		</table>
		--->
	<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />
		<cfset session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >
		    <cfcatch type="application">
		        	<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)>
		<CFINCLUDE template="stoneinfo.inc">
	</cfif>
	</div>
	<!--- Footer --->
	<!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
	<cfinclude template="/mainfooter.cfm">
	<!--- End footer --->
	<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
		<div>
			<cfoutput>
				<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
					Contend Edit
				</a>
			</cfoutput>
			</div>
	</cfif>
	</div>
	<!---
		<cfinclude template="/googleadsforlist.htm">--->
	</BODY> </HTML>
	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<!---
	<CFSET _end=GetTickCount()>
	<CFSET executiontime=_end-_start>
	<cfoutput>blah:#executiontime#</cfoutput>
	--->
</cfif>



</cfcache> <cfcache  action="cache" timespan="#createtimespan(0,3,0,0)#" useQueryString="true">
 <cfif not isdefined("url.notmvc")>
<cfinclude template="silver_jewelry_gallery_slow.cfm" />
<cfelse>
<cftry>
	<cfparam name=session.cartid default="">
	<!---
		<CFSET _start=GetTickCount()> --->
	<cfparam name="groupname" default="">
	<!--- used in folders like shaped, rare-stones --->
	<cfparam name="inventory" default="" />
	<cfparam name="occasion" default=""  />
	<cfparam name="occasionmenu" default=""  />
	<cfparam name="session.name" default=""  />
	<cfparam name="url.supcode" default=""  />
	<cfparam name="supcode" default=""  />
	<cfparam name="sortorder" default="disporder" />
	<cfparam name="located" default="" />
	<cfparam name="stored" default="" />
	<cfparam name="metatitle" default="" />
	<cfparam name="metadescription" default="" />
	<cfparam name="description" default="" />
	<CFPARAM NAME="subcat" DEFAULT= "" />
	<CFPARAM NAME="subcat2" DEFAULT= "" />
	<cfparam name="categ" default="jewelry" />
	<cfparam name="metakeywords" default="" />
	<cfparam name="LatestStartingBackMonths" default="1" />
	<cfparam name="ringsize" default="" />
	<cfparam name="url.ringsize" default="" />
	<cfparam name="url.category" default="" />
	<cfparam name="pagedescription" default="" />
	<cfparam name="screensize" default="big" />
	<cfparam name="style" default="" />
	<cfparam name="url.style" default="#style#" />
	<cfparam name="silverjewelry" default="" />
	<CFPARAM NAME="displaycolumns" DEFAULT="4" />
	<CFPARAM NAME="display" DEFAULT="4" />
	<cfparam name="light" default="pink" />
	<cfparam name="dark" default="##D64578" />
	<CFPARAM NAME="numpages" DEFAULT="0" />
	<cfparam name="jewelrysize" default="" />
	<cfparam default="106" name="stonelistht" />
	<CFPARAM NAME="category" DEFAULT="all" />
	<CFPARAM NAME="priceless" DEFAULT="" />
	<CFPARAM NAME="category2" DEFAULT="all" />
	<cfparam default="662222" name="l" />
	<cfparam name="invstatus" default=-3	/>
	<cfparam name="url.start" default="1" />
	<CFPARAM NAME="start" DEFAULT= "1" />
	<CFPARAM NAME="edit" DEFAULT= "" />
	<CFPARAM NAME="newtstart" DEFAULT= "1" />
	<CFPARAM NAME="url.subcat" DEFAULT="amethyst" />
	<CFPARAM NAME="advancedsearch" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch1" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch2" DEFAULT= "" />
	<CFPARAM NAME="advancedsearch3" DEFAULT= "" />
	<CFPARAM NAME="color" DEFAULT= "" />
	<CFPARAM NAME="Bcolor" DEFAULT= "white" />
	<CFPARAM NAME="salestatus" DEFAULT="" />
	<CFPARAM NAME="newcart" DEFAULT="" />
	<CFPARAM NAME="invent" DEFAULT="" />
	<CFPARAM NAME="j" DEFAULT="" />
	<CFPARAM NAME="pricegreater" DEFAULT="0" />
	<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/" />
	<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/" />
	<cfif occasion is 'oos'>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	<cfelse>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,1,0,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
	 </cfquery>
	</cfif>
	<!---<cftry>--->
			<cfif url.start LTE 0>
				<cfset start = 1 />
			</cfif>
			<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
			<cfoutput>
				<style media="screen"   type="text/css" >
					<!--
						html, body {
						        height: 100%;
						     }
						     ##container {
						        height: 100%; position: relative; z-index: 2;
						     }

						###category#_horiz {
						text-decoration:underline;

						}
						##ajax_context
						{
						display:none;
						}
						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart,</cfif>
							</cfloop>
							.comma_ender
						{
						background:url("/images/added.png") no-repeat  right center;
						height:12px;
						width:12px;
						}

						<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
						     			 <cfif session.cartitem[jc][1] gt 0 > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
							</cfloop> .comma_ender1
						{
						background-color:##DFE;
						}
						-->
				</style>
			</cfoutput>
			<cfif  len(session.bulkbuyer.id) or 1>
				<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
			<cfelse>
				<link href="/styles/hub.css" rel="stylesheet" type="text/css" >
			</cfif>
			<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
			<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
			<link rel="shortcut icon" href="/favicon.ico" >
			<cfif session.quick_add or 1>
				<!--- we need the js for retail for info on make for me. --->
				<!-- morphing switched off here and in quick_add
					<script type="text/javascript" language="JavaScript" src="/js/mootools_.js"></script>-->
				<cfif cgi.server_name contains 'wholesale' and 0>
					<!-- why load this for non wholesale because MOD info uses this-->
					<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js?ver=2"></script>
					<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
				</cfif>
			</cfif>
			<script type="text/javascript" src="/js/global.js?ver=2.1"></script>
			<cfquery name="contentbypage" datasource="gemssql">
	Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
			<cfif contentbypage.recordcount GT 0>
				<cfif cgi.server_name contains 'wholesale'>
					<cfset metatitle="#contentbypage.title# Handmade">
					<cfset metadescription="#contentbypage.metadescription# Handmade">
					<cfset metakeywords="#contentbypage.keywords# Handmade">
					<cfset pagedescription="#contentbypage.description#">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
					<cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
					<cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
					<cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
				<cfelse>
					<cfset metatitle="#contentbypage.title#">
					<cfset metadescription="#contentbypage.metadescription#">
					<cfset metakeywords="#contentbypage.keywords#">
					<cfset pagedescription="#contentbypage.description#">
				</cfif>
			</cfif>
			<cfoutput>
				<TITLE>
					<cfif url.start GT 1>
						Gallery starting from #url.start#th item.
					</cfif>
					#titlecase(metatitle)#
					<cfif ringsize neq "">
						Rings #ringsize#
					</cfif>
					<cfif cgi.server_name contains 'wholesale'>
						Wholesale
					</cfif>
					#titleCase(subcat)# #style#
					<cfif color neq "">
						#titleCase(color)#
					</cfif>
					<cfif groupname neq "">
						#titlecase(groupname)# #categ#
					</cfif>
				</TITLE>
				<cfif occasion eq "oos">
					<meta name="robots" content="noindex,nofollow">
				</cfif>
				<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif><cfif color neq "">
				#color# </cfif>
				<cfif subcat neq "">
					#subcat#
				</cfif>
				<cfif groupname neq "">
					#groupname#
				</cfif>
				#p#, #metakeywords#">
				<meta name="author" content="Anup Pandey" >
				<cfif cgi.server_name contains "semiprecious.in">
					<meta name=ICBM content="28.5573901, 77.1571443" />
					<meta name="geo.position" content="28.5573901;77.1571443" />
					<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
				</cfif>
			</cfoutput>
			<META content="20 days" name=revisit-after >
			<!-- Deluxe Menu -->
			<!-- (c) 2009, by Deluxe-Menu.com -->
			<cfsilent>
				<cfif cgi.https is "on">
					<cflocation url="http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" />
				</cfif>
				<cfif cgi.server_name does not contain "www." and find(".", cgi.server_name, find(".", cgi.server_name)+1) eq 0>
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
				</cfif>
				<cfif #cgi.server_name# contains "forcesofindia">
					<cfif cgi.query_string neq "">
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
					<cfelse>
						<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
					</cfif>
					<cfheader statuscode="301" statustext="Moved permanently">
					<cfheader name="Location" value="#newurl#">
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
				<!--- the above code is run every time a gallery page is invoked. A more sensible thing
					would be to set the above flag either in login page or cart page where we can detect that
					person is shopping --->
				<cfif ringsize neq "">
					<cfif ringsize does not contain 'size'>
						<cfset ringsize='size ' & ringsize>
					</cfif>
				</cfif>
				<cfif cgi.server_name contains "handmadelaptopcase.com">
					<cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
				<cfelseif cgi.server_name contains "semiprecious.in">
					<cfset session.india=1>
					<cfset session.country = "india">
				</cfif>
				<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
				<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
					<cfif session.bulkbuyer.id eq "">
					<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
					</cfif>
					</cfif>--->
				<cfset sj = "">
				<cfif session.mail eq application.admin_email>
					<cfset url.edit =  'mamamia'>
					<cfset invstatus= -5>
				</cfif>
				<cfset  top = 114 />
				<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
				<cfif cgi.server_name contains "wholesale">
					<cfparam name="displayrows" default="4">
				<cfelse>
					<cfparam name="displayrows" default="4">
				</cfif>
				<cfif category is "jewelry">
					<cfif url.category neq "">
						<cfset category=url.category>
					<cfelse>
						<cfset category="">
					</cfif>
				</cfif>
				<CFIF CATEGORY  EQ "">
					<CFSET CATEGORY ="all">
				</CFIF>
				<cfif category is 'beads' and session.mail neq application.admin_email>
					<cfset invstatus=0>
				</cfif>
				<cfif category is "bracelets">
					<cfset displaycolumns="4">
				</cfif>
				<cfif category is 'beads'>
					<cfset displayrows=7>
					<cfset displaycolumns="4">
				</cfif>
				<CFSET CATEGORY2=CATEGORY>
				<cfif subcat contains "smokey" or subcat contains "smoky">
					<cfset subcat ="smoky quartz">
				</cfif>
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
				<!--- <script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
					<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script> --->
				<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
				<cfif category eq 'all' or category eq "">
					<cfset categ='jewelry'>
				</cfif>
				<cfif cgi.server_name contains "wholesale">
					<CFPARAM NAME="url.sortorder" DEFAULT="disporderwhole" >
				<cfelse>
					<cfif dateformat(now(),"dddd") eq "Sunday">
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Monday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder">
					<cfelseif dateformat(now(),"dddd") eq "Thursday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelseif dateformat(now(),"dddd") eq "Friday" >
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					<cfelse>
						<CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
					</cfif>
				</cfif>
				<cfparam name="sortorder" default="disporder">
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
				<cfif priceless neq "">
					<cfset sortorder='price desc'>
					<cfset url.sortorder =sortorder>
				</cfif>
				<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
				<cfif isnumeric(advancedsearch)>
					<cflocation url="detail.cfm?newitem=#advancedsearch#">
				</cfif>
				<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
					<cflocation url="/wholesale_login.cfm">
				</cfif>
				<cfinclude template="checkinjection.cfm">
				<cfparam name="grouping" default="">
				<cfif style is 'silver beaded'>
					<cfset style='Silverbeaded'>
				</cfif>
				<cfif not len(occasion)>
					<!--- to avoid this processing for solr based searches which use occasion as the indicator --->
					<cfif advancedsearch neq "">
						<cfif  advancedsearch contains 'silver'>
							<cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
							<cfset url.style='Silver'>
						</cfif>
						<cfif  advancedsearch contains 'neck'>
							<cfset category='necklaces'>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklace"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"necklaces"," ")>
						</cfif>
						<cfif  advancedsearch contains ' earr'>
							<cfset category='earrings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"earring"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"earrings"," ")>
						</cfif>
						<cfif  advancedsearch contains ' ring'>
							<cfset category='rings'>
							<cfset advancedsearch=replacenocase(advancedsearch,"rings"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"ring"," ")>
						</cfif>
						<cfif  advancedsearch contains ' brace'>
							<cfset category='bracelets'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelet"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"bracelets"," ")>
						</cfif>
						<cfif  advancedsearch contains ' pend'>
							<cfset category='pendants'>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendant"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"pendants"," ")>
						</cfif>
						<cfif  advancedsearch contains 'bead'>
							<cfset category='beads'>
							<cfset advancedsearch=replacenocase(advancedsearch,"bead"," ")>
							<cfset advancedsearch=replacenocase(advancedsearch,"beads"," ")>
						</cfif>
						<cfif  advancedsearch contains 'heal'>
							<cfset category='healing'>
							<cfset advancedsearch=replacenocase(advancedsearch,"healing"," ")>
						</cfif>
					</cfif>
				</cfif>
				<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring;
 }

  session.gallery = 'gemstone_jewelry_gallery.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping
IF (advancedsearch is not "") {
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark ='';
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors = Application.color_list;
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=20;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
				<!--- meta tags addition for groups--->
				<cfif groupname neq "">
					<cfif cgi.server_name contains 'wholesale'>
						<cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="Wholesale semiprecious gemstone #groupname# jewelry">
						<cfset metakeywords="Wholesale #groupname# #subcat# #categ#  in gemstones">
					<cfelseif session.country is "india">
						<cfset metatitle="#groupname# #subcat# #categ# and Jewellery in gemstones">
						<cfset metadescription="Online store for gifting authentic semiprecious gemstone #groupname# jewellery">
						<cfset metakeywords="#groupname# #subcat# #categ# gemstone jewelry">
					<cfelse>
						<cfset metatitle="#groupname# #subcat# #categ# in gemstones">
						<cfset metadescription="#subcat# gemstone #categ# and healing #groupname# #style# sterling silver #start#">
						<cfset metakeywords="#groupname# #subcat# #categ# #style# gemstone jewelry">
					</cfif>
				</cfif>
				<!--- end meta tags for groups ---->
				<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
				<cfset currentfile='#Trim(CGI.path_info)#'>
				<!--- speed up things - this removed to reduce hits to the database
					<CFIF start EQ 1 and advancedsearch neq "">
					<cftry>
					<CFQUERY DATASOURCE="gemssql" NAME="searched">
					insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    )
					</cfquery>
					<cfcatch type="database">
					<cfquery DATASOURCE="gemssql" >
					Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
					</cfquery>
					Nothing in this selection. Please click <a href="/">here<a/> to continue shopping.
					</cfcatch>
					<cfcatch type="any">
					Sorry, an error has occured, please email us at cs@semiprecious.com
					</cfcatch>
					</cftry>
					</CFIF>
					--->
				<cfif not isdefined("form.submit5")>
					<!---<cftry>--->
					<cfif isdefined("form.search_criteria")>
						<cfset advancedsearch = form.search_criteria />
						<cfset occasion = "solr" />
						<cfif isnumeric(trim(form.search_criteria))>
							<cflocation url="jewelry_item.cfm?newitem=#trim(form.search_criteria)#" addtoken="no" />
						<cfelse>
							<cfset occasion = "solr" />
						</cfif>
					<cfelseif occasion is "solr">
						<cfset form.search_criteria = url.advancedsearch />
					</cfif>
					<CFOUTPUT>
						<h2>
							#stored# #occasion#
						</h2>
					</CFOUTPUT>
					<cftry>
						<cfswitch expression="#occasion#">
							<cfcase value="xmas">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getxmasitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="clearance">
								<cfquery datasource="gemssql" name="getlist" >
		  <cfinclude template="/includes/getclearanceitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="supplier">
								<cfif not isdefined("url.supcode")>
									Please provide storage code like H or PJ or P
									<cfabort />
								</cfif>
								<cfquery datasource="gemssql" name="getlist"  >
				  <cfinclude template="/includes/getsupitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="oos">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/getoositemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="custom">
								<cfquery datasource="gemssql" name="getlist" >
			  <cfinclude template="/includes/customitemids.cfm" />
		</cfquery>
							</cfcase>
							<cfcase value="solr">
								<!---	<cfif not find( expand ,Form.search_criteria)>
									<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfelse>
									<cfset criteria_ = replace(Form.search_criteria,' expand ',' ')/>
									</cfif>
									--->
								<cfset criteria_ = replace(replacenocase(replacenocase(Form.search_criteria,'and','AND','ALL'),'or','OR','ALL'),' ',' AND ')/>
								<cfoutput>
									here: #form.search_criteria#
								</cfoutput>
								<cfset occasionmenu = "Searched #replace(form.search_criteria,' ',' Or ', 'all')#"/>
								<!--- we don't want to go beyond one page display. Else we have to build the critieria into the next and previous navigation links also --->
								<!---
									<cfquery dbtype="query" name="getlist">
									SELECT distinct [key] as newitem
									FROM sq
									order by  score desc
									</cfquery>
									<cfset qry = "solr" />--->
								<!---
									<cfdump var="#sq#" />
									--->
								<cfquery datasource="gemssql" name="getlist">
		                                                            <cfinclude template="/includes/getrecordsitemidsSearch.cfm" />
	                                                    	</cfquery>
							</cfcase>
							<cfdefaultcase>
								<cftry>
									<cfquery datasource="gemssql" name="getlist">
		                                                                   <cfinclude template="/includes/getrecordsitemids.cfm" />
	                                                            	</cfquery>
									<cfcatch type="any">
										<cfset getlist.recordcount = 0 />
										<!---<cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
											type="html" >
											Following query gave no result:
											#category# #subcat#
											<cfif isdefined("cfcatch.sql")>
											#cfcatch.sql#,
											</cfif>
											#cgi.path_info#
											#cfcatch.message#
											</cfmail>--->
										Following query gave no result: #category# #subcat# #cfcatch.message# #cfcatch.detail#
									</cfcatch>
								</cftry>
							</cfdefaultcase>
						</cfswitch>
						<cfif getlist.recordcount GT 0>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = #getlist.newitem#
	</cfquery>
						<cfelse>
							<cfquery datasource="gemssql" name="getlist2" >
		select * from items with (nolock) where newitem = 7130
	</cfquery>
						</cfif>
						<cfcatch type="any">
							<cfoutput>
								Nothing in this selection. Please click
								<a href="/#category#.cfm">
									here
								<a/>
									to continue shopping.
							</cfoutput>
							<cfset getlist2.cat = category /> <cfset getlist2.recordcount = 0 /> <cfset getlist.recordcount = 0 /> <cfmail to="anup@semiprecious.com"  subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER#
 #subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,
#advancedsearch1#,#advancedsearch2#
 http://www.semiprecious.com/silver_jewelry_gallery.cfm?#cgi.QUERY_STRING#  #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
</cfmail>
						</cfcatch>
					</cftry>
					<!---<cfcatch type="database">
						<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
						</cfcatch>
						</cftry>---> <!---
						<cfquery name="getlist" dbtype="query">
						Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
						buylink ,  orderprice from getlist
						</cfquery>---> <!---
						<cfcatch type="database">
						<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
						type="html" >
						#cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
						#subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
						#cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
						<CFSET url.sortorder = 'datetaken desc' />
						</cfmail>
						</cfcatch>--->
				</cfif>
				<cfif category is ""> <cfset category=categ> </cfif> <cfif category is ""> <cfset category="All"> </cfif>
			</cfsilent>
			<cfoutput> <meta name="description" content="Our <cfif p is 'jewelry' or p is 'necklaces' or p is 'pendants'>handcrafted<cfelse>handmade</cfif> <cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# gemstone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# <cfif p is "jewelry">comes<cfelseif p is "healing"> items come<cfelse>come</cfif> in many varieties. We are your source for<cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# stone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# in silver, beads, necklaces, pendants, rings, earrings, bracelets & healing.<cfif url.start GT 1>Gallery starting from #url.start#th item.</cfif>"> </cfoutput>
		</HEAD>
		<body style="margin-top:0" > <div style="width:100%;position:absolute;top:0;left:0;z-index:3" align="Center"> <div style="width:960px;position:relative;top:-10pt;left:0;"> <div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;"> </div> </div> </div>
 <div align="center" id="container"> <!--- set up for ajax add to cart ---> <form><input type="hidden" id="ajax_context" value=gallery></form> <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
			---> <cfif isdefined("url.quick_add")> <cfset session.quick_add = url.quick_add /> </cfif> <cfinclude template="/header#session.country#.cfm"> <CFIF not isdefined("gETLIst.recordcount")> <br /> <span class="error">No item found. PLEASE TRY AGAIN.</span> <cfif subcat is 'amber'> <cfinclude template="pippinindex.htm"> </cfif> <cfinclude template="footer.htm"> <CFSET enddisplay= start + display -1 > </div> </body>
	</html>
	<cfabort /> </cfif> <CFSET numpages=round(GetList.RecordCount/display)> <CFSET enddisplay= start + display -1> <cfif start gt getlist.recordcount> <cfset start = getlist.recordcount> </cfif> <cfif start lt 1> <cfset start = 1> </cfif> <!---<cfinclude template="includes/themes.cfm">---> <cfoutput>
                <cfif getlist.recordcount LT 13>
                   <cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures ---> </cfif>
                   <cfset display = displaycolumns*displayrows>
                            <CFIF GetList2.cat is not "">
                                        <input type='hidden' name='category' value='#GetList2.cat#' />
                                      <CFELSE>
                                      <input type='hidden' name='category' value='#category#' />
                                </cfif> <input type='hidden' name='url.sortorder' value='#url.sortorder#' /> <!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
		LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->
<cfset tw =  606>
<div id="container1">
    <h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >&nbsp; <script type="text/javascript">
              document.getElementById("filter_summary").display = "block";
          </script>
          <cfif len(occasionmenu)> #occasionmenu#
             <cfelse> <!--- <cfif session.country neq 'india'> --->
                 <cfif color neq "" or subcat neq "">
                      <cfif len(advancedsearch)>
                              <cfelse> <!--- Selection:  --->
                                       <Cfif isnumeric(priceless)> &nbsp;
                                            Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;<br /> </Cfif> <!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or Beaded</cfif></b><br>---> <cfif len(trim(subcat)) > <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")> <img src="/images/dots1.gif" style="display:inline;" /> <a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">#subcat# home</a>&nbsp;&nbsp;&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> <cfif listfindnocase(Application.cufflinkstones,subcat)> <a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.necklacestones,subcat)> <a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.Braceletstones,subcat)> <a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.ringstones,subcat)> <a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.earringstones,subcat)> <a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.pendantstones,subcat)> <a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.beadstones,subcat)> <a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
                                             </cfif>
                                             <cfelseif  color neq "">
                                                       <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">#color# Pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">#color# Rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">#color# Earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">#color# Bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">#color# Necklaces</a>&nbsp; <cfelseif  salestatus is 3 > <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp; </cfif> <cfif category EQ "All" > <span style="color:black;background-color:#light#;font-size=12 px;">All Categories</span>&nbsp; </cfif> </cfif> </cfif> &nbsp; <!--- <cfelse> ---> <cfif session.country eq 'India'> <cfif pricegreater neq 0 or priceless neq ""> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> ---> #category# <cfif pricegreater neq 0> From #round_format(pricegreater)# </cfif> <cfif priceless neq ""> Up To #round_format(priceless)# </cfif> <!--- </span> ---> <cfelse> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> ---> <!--- <cfset kws = replace(cgi.script_name,".cfm","") /> ---> <cfset kws = #contentbypage.title# /> <cfif IsDefined('nameid') AND nameid neq ''> #nameid# <cfelse> #Kws# </cfif> <!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> ---><!--- </cfloop> ---> <!--- </span> ---> </cfif> </cfif> </span> </cfif> <!-- #color#, #len(trim(subcat))#--> </h1> </cfoutput> <CFSET columns=1> <CFSET rows=1> <CFSET enddisplay= start + display-1>
                                          <CFSET currentrow= start>
                                       <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
                                               <tr >

             <!---
              <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
              <td valign="top"  align="left" > <cfset itemCount = 0>
                  <cfset itemlist = 0> <cfset price_color_filter = "" />
                  <div id="semiprecious_gallery" style="margin-top:1px;overflow:visible;position:relative;float:right;margin-right:6px;" >
                  <CFIF getList.recordcount eq 0>
                  <div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:627px;text-align:justify;font-size:12px;color:black;">
                           <cfoutput>
                           Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
                          <cfif salestatus is 3> that are on sale </cfif>
                          <cfif pricegreater GT 0>
                              within price range #format(priceless)# to #format(pricegreater)#
                          </cfif>
                          <!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
        		<cfinclude template="/googleadsforlist.htm">
        		---->
                     </cfoutput>
             <cfset silver = "">
             <cfif isdefined("url.relocated")>
               <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
		OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  ---> <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail> <cfelse> <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
		--->
            </cfif>
            </div> <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
		#session.mail#,#cgi.QUERY_STRING# .
		</cfmail>
		--->
            <cfabort />
          </div></td></tr></table></body></html>
          </cfif>

           <!--- gallery portion starts here --->
         <div align="left" >
                         <cfif (Not len(session.name) or session.mail eq application.admin_email) and start lt 2>
                             <div align="left" style="width:100%; border-collapse:collapse; border:thin;">
                               <cfoutput>
                                   <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span>
                                </cfoutput>
                             </div>
                        </cfif>

         <span class="found_header">Showing <cfoutput>#Getlist.recordcount# #titlecase(color)# #titlecase(subcat)#
         <cfif groupname neq ""> #titlecase(groupname)#</cfif> #titlecase(url.style)# <cfif len(category) GT 3> #titlecase(category)#<cfelse> Items
         </cfif>
         <cfif pricegreater neq "0"> Over #format(pricegreater)#</cfif>
         <cfif priceless neq ""> Under #format(priceless)#</cfif> </cfoutput>
         </span>&nbsp;
         <!---<div >
          <cfinclude template="/includes/searchdropdowns.cfm" />

          <cfif subcat neq "" or groupname neq "" or pricegreater neq "0" or priceless neq "">
             <a href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath() )#</cfoutput> >
             Clear Filters</a></cfif>
            </div> --->
             <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>--->
          <cfif start is 1>
          <cfif session.cartitem[1][1] is 0>
          <h3 id="infotable"  style="margin-left:20px;"  align="justify" >
           <cfif subcat is 'pearl'>
           <font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.
         </font>
         </cfif> <!---#pagedescription#
          <cfif color neq "">
		Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
		</cfif>--->
             . </h3>
             </cfif>
             </cfif>
             <cfif session.mail eq application.admin_email> <!--- place to put display code ---> <cfoutput><cfif occasion is 'oos'>OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE</cfif></cfoutput> </cfif> <cfset quick_add = session.quick_add /> <!---<cfinclude template="/includes/gallery_engine.cfm" />
		<div align="center" style="margin-top:30px;">
		<!--- Paging links ---> <!---
		<CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">---> <!---  <div style="text-align:center;margin-bottom:2px;">
		<cfoutput>
		<span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
		</cfoutput>
		</div>
		End Paging links --->
               </div>
               <div align="center" id="cart_summary" style="z-index:6;"></div> <!--- End Matt Bayuk - SGM ---> <!---
		<cfinclude  template="statsrecord.cfm">--->
             </div><!--- semipeciou_gallery --->
               <div style="float:left;display:inline;width:100px;">
                       <cfset leftgemstonedisplay="block" />
                        <cfif color neq "" >
                               <cfset leftcolordisplay="block" />
                         </cfif>
                  <!---
		<cfif pricegreater neq 0 or priceless neq "">
		    <cfset leftpricedisplay = "inline" />
		    <span style="font-weight:bold">
                           <cfinclude template="/includes/price_color_filter.cfm" />
                   </span>
		</cfif>
		removed because now we ave a color bar above gallery---> <cfif category neq 'gems' and cgi.server_name does not contain 'wholesale'> <br> <CFINCLUDE TEMPLATE="leftmenus.cfm"> </cfif> </div> </td></tr> <!--- <tr> <td>
		<a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
		</td>
		</tr>---> ---> </td> </tr>
                        <tr> <td>
                 <table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
                 <tr>
                 <td valign="top">
                 <div style="float:left;display:inline;width:158px;">
                                <cfset leftgemstonedisplay="block" /> <cfif color neq "" > <cfset leftcolordisplay="block" /> </cfif>
                                <cfif category neq 'gems' and category neq "cufflinks" >
                                        <div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
                                                <CFINCLUDE TEMPLATE="leftmenus.cfm">
                                        </div>
                                </cfif>
                                <!---
                                            <p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
                        		        <cfif session.country neq 'india'>
                            		<cfcache action="serverCache" timespan="1">
                            		    <cfinclude template="/includes/grouplist.cfm">
                            		</cfcache>
                                    </cfif>
                            --->
                </div>
                </td>
                <td align="center" valign="top">
                    <div style="margin-top:12px;margin-left:22px;float:left;">
                         <cfinclude template="/includes/gallery_engine.cfm" />
                     </div>
                    </td>
                   </tr>
                </table>
                </td>
                </tr>
                <div align="center" id="cart_summary" style="z-index:6;">
           </div>
         
           <tr>
             <td>
                <table id="container2"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center">
                           <tr> <td> <div align="center" style="margin-top:30px;"> <!--- Paging links ---> <cfif getgallery.recordcount GT 5> <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm"> </cfif> </div> </td> </tr> </table> </td> </tr> </div> <tr><td align=center><br> <cfoutput> <cfinclude template="/includes/linkexchangebystone.cfm"> <cfif subcat neq ""> <cfinclude template="/marketing/stonelinks.cfm"> </cfif> </cfoutput> </td></tr> </table>
	<!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
		<tr>
		<td>
		<div align="center" style="margin-top:30px;">
		--- Paging links ---
		<br>
		<br><br>
		</div>
		</td>
		</tr>
		</table>
		--->
	<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />
		<cfset session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >
		    <cfcatch type="application">
		        	<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)>
		<CFINCLUDE template="stoneinfo.inc">
	</cfif>
	</div>
	<!--- Footer --->
	<!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
	<cfinclude template="/mainfooter.cfm">
	<!--- End footer --->
	<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
		<div>
			<cfoutput>
				<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
					Contend Edit
				</a>
			</cfoutput>
			</div>
	</cfif>
	</div>
	<!---
		<cfinclude template="/googleadsforlist.htm">--->
	</BODY> </HTML>
	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<!---
	<CFSET _end=GetTickCount()>
	<CFSET executiontime=_end-_start>
	<cfoutput>blah:#executiontime#</cfoutput>
	--->
</cfif>



</cfcache>