<!---
  --- silver_jewelry_gallery1
  --- -----------------------
  ---
  --- Used by silver_jewelry_gallery.cfm
  ---
  --- author: nitish
  --- date:   11/16/14
  --->
<cfcomponent hint="Used by silver_jewelry_gallery.cfm" accessors="true" output="false" persistent="false">
<cffunction name="titlecase">
<cfargument name="text" required="false" default="" />

<cfscript>

var string = arguments.text;

	if (len(string) gt 1)
	{
		string = lcase(string);

		if (refind("^[a-z]", string))  {
		string = ucase(left(string, 1)) & right(string,
(len(string) - 1 ));
		}

		next = refind("[[:space:][:punct:]][a-z]", string);

		while (next)  {
			if (next lt (len(string) - 1)) {
			string = left(string, (next)) & ucase(mid(string,
next+1, 1)) &  right(string, (len(string) - (next + 1)));
			} else {
			string = left(string, (next)) &
ucase(right(string, 1));
			}

		next = refind("[[:space:][:punct:]][a-z]", string, next);
		}
	} else {
	string = ucase(string);

	}
/* post fixes */
/* Recall that "Replace()" is case sensitive */
string = Replace(string," Of "," of ","ALL");
string = Replace(string," And "," and ","ALL");
string = Replace(string,"'S ","'s ","ALL");
string = Replace(string," At "," at ","ALL");
string = Replace(string," The "," the ","ALL");
string = Replace(string," For "," for ","ALL");
string = Replace(string," De "," de ","ALL");
string = Replace(string," Y "," y ","ALL");
string = Replace(string," In "," in ","ALL");

</cfscript>
<cfreturn string />
</cffunction>

<cffunction  name="reset_variables" returntype="any" access="public" >

<Cfset var k = structclear(Variables) />
<cfreturn 1 />

</cffunction>

<cffunction  name="cfparam" returntype="any" access="public" >

<cfargument name="text" required="true"  />

   <cfset ____init = 1 />
   <!--- let's get in the variables from the calling view template in case it has set any defaults ---->
	<cfscript>
	structAppend(Variables,arguments.text) ;
    </cfscript>

    <!---- set default variables that can be used both by head content creation process or by the key content generation engine --->
	<cfparam name=session.cartid default="">
	<cfparam name="groupname" default="">
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
	<cfparam name="subcat" DEFAULT= "" />
	<cfparam name="subcat2" DEFAULT= "" />
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
	<cfparam name="displaycolumns" DEFAULT="4" />
	<cfparam name="display" DEFAULT="4" />
	<cfparam name="light" default="pink" />
	<cfparam name="dark" default="##D64578" />
	<cfparam name="numpages" DEFAULT="0" />
	<cfparam name="jewelrysize" default="" />
	<cfparam default="106" name="stonelistht" />
	<cfparam name="category" DEFAULT="all" />
	<cfparam name="priceless" DEFAULT="" />
	<cfparam name="category2" DEFAULT="all" />
	<cfparam default="662222" name="l" />
	<cfparam name="invstatus" default=-3	/>
	<cfparam name="url.start" default="1" />
	<cfparam name="start" DEFAULT= "1" />
	<cfparam name="edit" DEFAULT= "" />
	<cfparam name="newtstart" DEFAULT= "1" />
	<cfparam name="url.subcat" DEFAULT="amethyst" />
	<cfparam name="advancedsearch" DEFAULT= "" />
	<cfparam name="advancedsearch1" DEFAULT= "" />
	<cfparam name="advancedsearch2" DEFAULT= "" />
	<cfparam name="advancedsearch3" DEFAULT= "" />
	<cfparam name="color" DEFAULT= "" />
	<cfparam name="Bcolor" DEFAULT= "white" />
	<cfparam name="salestatus" DEFAULT="" />
	<cfparam name="newcart" DEFAULT="" />
	<cfparam name="invent" DEFAULT="" />
	<cfparam name="j" DEFAULT="" />
	<cfparam name="pricegreater" DEFAULT="0" />
	<cfparam name="imagepath" DEFAULT="http://www.semiprecious.com/images/" />
	<cfparam name="masterpath" DEFAULT="http://www.semiprecious.com/" />
         <cfset leftgemstonedisplay="block" /> <cfif color neq "" > <cfset leftcolordisplay="block" /></cfif>

				<cfquery name="contentbypage" datasource="gemssql">
	                            Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(cgi.script_name),"/","")#'
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
                          <cfelse>
                          <cfif category is "" or category is "All">
                              <cfset title_cat = "semiprecious jewelry" />
                          <cfelse>
                              <cfset title_cat = category />
                          </cfif>
                          	<cfset metatitle="Collection of #title_cat# ">
                          <cfif salestatus  is 3>
                          <cfset metatitle="On Sales #category# ">
                          </cfif>

			</cfif>
			<cfsavecontent variable="temp">
                 <cfif findnocase( "latest",cgi.script_name)>
                  New Arrivals  for
                 <Cfelseif findnocase("cheap",cgi.script_name)>
                 Affordable selection for
				   <Cfelseif findnocase("clearance",cgi.script_name)>
                 On Sale
                 </cfif>
					<cfoutput>
					<cfif url.start GT 1>
						#title_cat# Designs starting from #url.start#th item.
					</cfif>
					#titlecase(metatitle)#
					<cfif ringsize neq "">
						Rings size #ringsize#
					</cfif>
					<cfif cgi.server_name contains 'wholesale'>
						Wholesale
					</cfif>
				 made in #titleCase(subcat)# #style#
					<cfif trim(color) neq "">
					 &nbsp; in	#titleCase(color)#
					</cfif>
					<cfif trim(groupname) neq "">
					&nbsp; from 	#titlecase(groupname)# #title_cat#
					</cfif>
					</cfoutput>
				</cfsavecontent>

				<cfset title = temp />

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
				<cfinclude template="/checkinjection.cfm">
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
				<!--- end meta tags for groups
				<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'D:\home\semiprecious.com\wwwroot\',''),'\','/')#'>


				 speed up things - this removed to reduce hits to the database
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
				<cfset currentfile='#Trim(cgi.script_name)#'>
				<cfif isdefined("url.quick_add")>
					<cfset session.quick_add = url.quick_add />
				</cfif>

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
									<cfquery datasource="gemssql" name="getlist">
		                                         <cfinclude template="/includes/getrecordsitemids.cfm" />
	                        		  </cfquery>

							</cfdefaultcase>
						</cfswitch>
						<cfif getlist.recordcount GT 0>
							<cfquery datasource="gemssql" name="getlist2" >
								select * from items with (nolock) where newitem = #getlist.newitem#
							</cfquery>
						<cfelse>
							<cfquery datasource="gemssql" name="getlist2" >
								select * from items with (nolock) where newitem = 1430
							</cfquery>
						</cfif>
						<cfcatch type="any">

							<cfset getlist2.cat = category />
							<cfset getlist2.recordcount = 0 />
							 <cfset getlist.recordcount = 0 />
						<cfmail to="anup@semiprecious.com"  server="mailA40" subject="nothing in getrecords...gallery reporting" from="service@semiprecious.com"
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
						<cfmail to="anup@semiprecious.com" server="#application.mail_server#" subject="error in list query1" from="service@semiprecious.com"
						type="html" >
						#cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
						#subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
						#cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
						<CFSET url.sortorder = 'datetaken desc' />
						</cfmail>
						</cfcatch>--->
				</cfif>

				<cfif category is "">
					<cfset category=categ>
				</cfif>
				<cfif category is "">
					<cfset category="All">
				</cfif>
					<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
				<cfif url.start LTE 0>
				<cfset url.start = 1 />
			</cfif>

			<cfset tw =  606>
					<CFSET numpages=round(GetList.RecordCount/display)>
			<CFSET enddisplay= start + display -1>
				<cfif start gt getlist.recordcount>
					<cfset start = getlist.recordcount>
				</cfif> <!---<cfinclude template="includes/themes.cfm">--->
				<cfif getlist.recordcount LT 13>
                   <cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures --->
				</cfif>

					<cfset itemCount = 0>
                  <cfset itemlist = 0>
				  <cfset price_color_filter = "" />
 <cfreturn variables />
</cffunction>

<cffunction name="set_header_content" access="public" returntype="string" hint="Creates js and css code and packs in a variable that is already catered for in header.cfm">
						<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
		<cfset var somevariable = 0 />
		<cfsavecontent variable="somevariable">
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


				<cfif occasion eq "oos">
					<meta name="robots" content="noindex,nofollow">
				</cfif>
				<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif><cfif color neq "">
				#color# </cfif>
				<cfif subcat neq "">
					#subcat#
					<cfelse>
					sterling silver
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
                       <meta name="viewport" content="width=device-width, initial-scale=1" />
			<META content="20 days" name=revisit-after >

			<cfif  len(session.bulkbuyer.id) or 1>
				<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
			<cfelse>
				<link href="/styles/hub.css" rel="stylesheet" type="text/css" >
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
						<meta name="description" content="Our <cfif p is 'jewelry' or p is 'necklaces' or p is 'pendants'>handcrafted<cfelse>handmade</cfif> <cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# gemstone</cfif><cfif subcat neq ""> #subcat#</cfif>
						#p# <cfif p is "jewelry">comes<cfelseif p is "healing"> items come<cfelse>come</cfif> in many varieties. We are your source for<cfif groupname neq ""> #groupname#</cfif><cfif color neq ""> #color# stone</cfif><cfif subcat neq ""> #subcat#</cfif> #p# in silver, beads, necklaces, pendants, rings, earrings, bracelets & healing.<cfif url.start GT 1>Gallery starting from #url.start#th item.</cfif>">
			</cfoutput>
			</cfsavecontent>
		<cfreturn somevariable />
</cffunction>

<cffunction name="get_inmemory_resultset" output="false" access="public"   returntype="query"    displayname="initialise" >

	<cfif occasion is 'oos'>

		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,30,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	<cfelse>
		<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,30,0)#">
select restockdate, disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
	 </cfquery>
	</cfif>
	<!--- question is what all scope get checked when i check for a variable's value or existence (even when using cfparam) without a scope prefix --->

 <cfreturn itemsinmemory />

</cffunction>
  <cffunction name="set_p" output="false" access="public"      displayname="initialise variable p"  returntype="string"  >

			<cfif category is "ALL" or category is "">
				<cfset p = "Jewelry">
			<cfelse>
				<cfset p = category>
			</cfif>
			<cfreturn p />
   </cffunction>

 <cffunction name="set_start" output="false" access="public"      displayname="initialise variable p"  returntype="numeric"  >
	<cfif url.start LTE 0>
				<cfreturn 1 />
</cfif>
	<cfreturn url.start />
</cffunction>
</cfcomponent>