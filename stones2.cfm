<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">


<cfparam name="ringsize" default="">
<cfif ringsize neq ""><cfif ringsize does not contain 'size'><cfset ringsize='size ' & ringsize></cfif></cfif>

 <cfif cgi.server_name contains "handmadelaptopcase.com">
  <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
  </cfif>
  
<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
	<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
 		<cfif session.bulkbuyer.id eq "">
  			<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
 	 	</cfif>
	</cfif>

<cfscript>
/*
 * function - titleCase()
 * accepts and returns string data
 * this function is similar to LCase or UCase,
 * it was designed for the college database which was provided
 * in ALLCAPS.
 * questions? http://artlung.com/feedback/
 * 2003/04/22
*/

function titleCase(string)  {
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


return string;
}
</cfscript>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<!--Start Kampyle Exit-Popup Code--> 
<script type="text/javascript">
var k_push_vars = {
	"view_percentage": 30,
	"popup_font_color": "#000000",
	"popup_background": "#F8D763",
	"header": "Your feedback is important to us!",
	"question": "Would you be willing to give us a short (1 minute) feedback?",
	"footer": "Thank you for helping us improve our website",
	"yes": "Yes",
	"no": "No",
	"text_direction": "ltr",
	"images_dir": "http://cf.kampyle.com/",
	"yes_background": "#76AC78",
	"no_background": "#8D9B86",
	"site_code": 4132262
}
</script>
<script type="text/javascript" src="http://cf.kampyle.com/k_push.js"></script>
<!--End Kampyle Exit-Popup Code-->

<!-- Start Kampyle Css -->
<link rel="stylesheet" type="text/css" media="screen" href="http://cf.kampyle.com/k_button.css" />
<!-- End Kampyle Css -->
<script language="JavaScript" src="js/mm_menu.js"></script>
<script language="JavaScript" src="js/topmenu.js"></script>
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/favicon.ico" />
<SCRIPT language="JavaScript" type="text/javascript">
<!-- Yahoo! Inc.
var ysm_accountid  = "10CC04QGR59A2PT01M2RHEVOJN0";
document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' " 
+ "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid 
+ "></SCR" + "IPT>");
// -->
</SCRIPT>
<script language="JavaScript" src="js/mm_menu.js"></script>
<script language="JavaScript" src="js/topmenu.js"></script>
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />

<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="">
<cfif style neq "" and url.style eq ""><cfset url.style=style></cfif>
<cfparam name="silverjewelry" default="">
<cfset sj = "">
 <cfparam name="invstatus" default=-3	>
 <cfif session.mail eq 'acemat@vsnl.com'>
 <cfset url.edit =  'mamamia'>
 <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">
<cfset  top = 114 /> <!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
 <cfparam name="displayrows" default="5">
 <cfelse>
 <cfparam name="displayrows" default="5">
 </cfif>
 
<CFPARAM NAME="displaycolumns" DEFAULT="3">

<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
 
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="ALL" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq "acemat@vsnl.com"><cfset invstatus=0></cfif>
<cfif category is "bracelets" or category is 'beads'><cfset displayrows=3><cfset displaycolumns="5"></cfif>
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
 		<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
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
<cfif sortorder neq ""><cfset url.sortorder =sortorder>	</cfif>
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
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="url.subcat" DEFAULT= subcat>
<cfparam name="url.category" default=category />
<CFPARAM NAME="advancedsearch" DEFAULT= "">
 <CFPARAM NAME="advancedsearch1" DEFAULT= "">
<CFPARAM NAME="advancedsearch2" DEFAULT= ""> 
<CFPARAM NAME="advancedsearch3" DEFAULT= "">
<CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "white">
<CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT=""> 
<CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="pricegreater" DEFAULT="">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> 
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">

<cfif isnumeric(advancedsearch)> <cflocation url="detail.cfm?newitem=#advancedsearch#"></cfif>
<cfinclude template="checkinjection.cfm">

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

  session.gallery = 'list' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
IF (advancedsearch is not "") {
 category ="" ;
 subcat = "";
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
 colors ='Red,Blue,Gray,Orange,Green,Maroon,Black,Pink,White,Maroon,Purple';
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=21;
   displaycolumns = 5;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
<cfset categ=category><cfif category is "All"><cfset categ="jewelry"></cfif>
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">
<cfif groupname neq "">
		<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> 
			<cfset metatitle="Wholesale #groupname# #subcat# #categ#">
			<cfset metadescription="Wholesale semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
			<cfset metakeywords="Wholesale <cfoutput>#groupname# #subcat# #categ#</cfoutput> jewelry">
		<cfelse>
			<cfset metatitle="#groupname# #subcat# #categ#">
			<cfset metadescription="semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
			<cfset metakeywords="<cfoutput>#groupname# #subcat# #categ#</cfoutput> jewelry">
		</cfif>

<cfelse>

	<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='#replace(Trim(cgi.script_name),"/","")#'
	</cfquery>
	<cfif contentbypage.recordcount GT 0>
		<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> 
			<cfset metatitle="Wholesale #subcat# #categ#">
			<cfset metadescription="Wholesale #contentbypage.metadescription#">
			<cfset metakeywords="Wholesale #contentbypage.keywords#">
			<cfset pagedescription="Wholesale #contentbypage.description#">
			<cfelse>
			<cfset metatitle="#subcat##color# #categ#">
			<cfset metadescription="#contentbypage.metadescription#">
			<cfset metakeywords="#contentbypage.keywords#">
			<cfset pagedescription="#contentbypage.description#">
		</cfif>
	</cfif>

</cfif>
<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(cgi.script_name)#'>


<!--- speed up things  --->
<CFIF start EQ 1 and advancedsearch neq "">

  <cftry>
    <CFQUERY DATASOURCE="gemssql" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery>
	<cfcatch type="database">
	  <cfquery DATASOURCE="gemssql"  name="">
  	Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'</cfquery>
	</cfcatch>
<cfcatch type="any">
	  	Sorry, an error has occured, please call us to let us know - 1 866 819 7692 
	</cfcatch>

</cftry>
  </CFIF>
<cfif not isdefined("form.submit5")>
<cftry>
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >
<cfinclude template="includes/getrecords.cfm">
</cfquery>
<cfcatch type="database">
<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
</cfcatch>
</cftry>
<!--- 
<cfquery name="getlist" dbtype="query">
Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from getlist
   </cfquery>--->
<!---
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

<CFIF not isdefined("gETLIst.recordcount")>
	<body topmargin="0" background="/images/leftbackground.jpg">
		<div align="center">
			<cfinclude template="header.cfm">
			<br>
			<span class="error">No  item found. PLEASE TRY AGAIN.</span>
			<cfif subcat is 'amber'>
				<cfinclude template="pippinindex.htm">
			</cfif>
			<cfinclude template="footer.htm">
			<CFSET enddisplay= start + display -1 >
		</div>
	</body>
	<cfabort />
</cfif>

<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>

<CFOUTPUT>
<cfif category is "ALL" or category is "">
			<cfset p = "Jewelry">
		<cfelse>
			<cfset p = category>
		</cfif> 
	<TITLE style="text-transform:capitalize;">
	<cfif metatitle neq "">#metatitle#<cfelse><cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>
			#titleCase(color)# #titleCase(subcat)# #style#  #titlecase(p)# gem stone  </cfif>
	</TITLE>
	
	<meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gem stone,  #p#"</cfif>>
	<meta name="author" content="Anup Pandey" />
	<meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. <CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. </cfloop>'</cfif>
	>
</cfoutput>

<META content="20 days" name=revisit-after>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY  topmargin="0" background="/images/leftbackground.jpg">
<div align="center">

<CFINCLUDE TEMPLATE="headerforgemstone_jewelry_gallery.cfm"> 
<cfif color neq "">
	<CFINCLUDE TEMPLATE="colorinfo.inc">
</cfif>

<cfoutput>
    
	<cfif getlist.recordcount LT 13>
		<cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures --->
	</cfif>
	
	<cfset display = displaycolumns*displayrows>
	<CFIF GetList.cat is not "">
		<input type='hidden' name='category' value='#GetList.cat#'>
	<CFELSE>
		<input type='hidden' name='category' value='#category#'>
	</cfif>
	<input type='hidden' name='url.sortorder' value='#url.sortorder#'>
	
	<cfset tw =  606>
	<cfif subcat neq "">
	<table style="margin-left:0px;width:1000px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
		<tr style="width:1000px;">
			<td valign="top" align="center" width="1000px" nowrap class="grayplacard">
				&nbsp;
				<cfif len(advancedsearch)><cfelse><!--- Selection:  ---><Cfif isnumeric(priceless)>&nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
				</Cfif><cfif len(subcat) ><cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
				<cfif listfindnocase(Application.necklacestones,subcat)><a href="#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.Braceletstones,subcat)><a href="#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.ringstones,subcat)><a href="#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.earringstones,subcat)><a href="#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.pendantstones,subcat)><a href="#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;</cfif>
				<cfelseif  color neq "">In #color#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
				<cfelseif  salestatus is 3 ><span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;</cfif><cfif category EQ "All" ><span style="color:maroon;background-color:#light#;font-size=12 px;">All</span>&nbsp;</cfif></cfif>&nbsp;
				<font face=verdana style="text-transform:capitalize">.</font>
			</td>
		</tr>
	</table>
	</cfif>
</cfoutput>	

<CFSET columns=1> 
<CFSET rows=1> 
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>

  
	<table id="container1" width="1000px" cellspacing="0" cellpadding="0" border="0">
		<tr style="width:1000px;" align="center">
<cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com" or category eq "beads">
			<td valign="top"  align="center" width="91px">
				<table cellpadding="1" cellspacing=0>
						
										<CFINCLUDE TEMPLATE="subcatvertical.cfm">
				
				</table>
				<table>
										<tr bgcolor="##FFFFCC" bordercolor="##996600"><td width=100>
										<b><cfoutput>#Category# </cfoutput>by theme</b><br>
										<cfinclude template="includes/groups.cfm">	
										</td>
										</tr>
					</table>
				

			</td>
									</cfif>
			<td align="center" valign="top" style="border:1px ##DDDDDD ridge;">
				
			<cfset rowsdisplayed = 0>
			<table style="margin-left:0px;width:850px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
					  <cfquery DATASOURCE="gemssql"  name="getlist">
					  Select distinct subcat, cat, style, inventory from qryCatSubcatBeadedAndSilverInventory where subcat='#subcat#' and inventory >0 order by cat
					  </cfquery>
					<cfset itemCount = 0>  
					<cfset itemlist = 0>
					<CFLOOP QUERY="Getlist">
					
						<cfset itemCount = itemCount + 1>
						<CFIF COLUMNS eq 1>
							<tr align="center">
						</CFIF>
						
						<td bgcolor="#FFFFFF" valign=bottom width=200><cfoutput>
						<cfquery datasource="gemssql" name="getfirstitem">
						Select top 1 newitem from items where cat='#cat#' and style like '%#getlist.style#%' and subcat='#subcat#'
						</cfquery>
						<cfoutput><table><tr align="center" valign="bottom"><td align="center" valign="bottom" height=120 width=150>
						<a href='list.cfm?subcat=#subcat#&category=#cat#&style=#getlist.Style#'><img src=images/#cat#/thumb/#getfirstitem.newitem#.jpg border=0></a>
						</td></tr></table>
						</cfoutput>
						<br><font size="+1"> <cfif cat neq "beads" and cat neq "healing"> <cfif getlist.style is 'beaded'>Stone<cfelse>Sterling Silver</cfif></cfif> #cat#<br></font>
						<a href='list.cfm?subcat=#subcat#&category=#cat#&style=#getlist.Style#'><b>[#inventory# items]</b></a><p>
						</cfoutput></td>

						
						<cfif columns EQ displaycolumns>
							<cfset rowsdisplayed = rowsdisplayed + 1>
							</tr><tr><td height=10 colspan="<cfoutput>#displaycolumns#</cfoutput>" class="green_bg side_hd"></td></tr>
							<CFSET columns=1>
						<cfelse>
							<CFSET columns=columns + 1>
						</cfif>
					</CFLOOP>
<tr><td height=10 colspan="<cfoutput>#displaycolumns#</cfoutput>" class="green_bg side_hd"></td></tr>

	<cfquery datasource="gemssql" name="getdesigner">
	Select top 4 newitem, cat from items where supplier='Angela' and inventory>0 and subcat='#subcat#'
	</cfquery>
		<cfif getdesigner.recordcount GT 0>
		
	<tr><td bgcolor="#FFFFFF" colspan="<cfoutput>#displaycolumns#" class="green_bg side_hd" height=20>Designer #subcat# Jewelry</cfoutput></td></tr>
			<tr><td bgcolor="#FFFFFF" colspan="<cfoutput>#displaycolumns#</cfoutput>"><table border=1 bordercolor="#66CCCC"><tr>
			<cfloop query="getdesigner">
			<td valign="top">
			<cfoutput><a href='designer_jewelry_angela.cfm?subcat=#subcat#&category=#getdesigner.cat#'><img src=images/#getdesigner.cat#/thumb/#getdesigner.newitem#.jpg border=0></a></cfoutput>
			</td>
			</cfloop>
			</tr></table></td></tr>
		
		</cfif>

		<cfset subcat3 = replace(trim(subcat),"_","")>
		<cfset subcat3 = replace(trim(subcat3)," ","")>
					<tr><td bgcolor="white" align="center" height=30  colspan="<<cfoutput>#displaycolumns#"><a href=#subcat3#.cfm>SEE RANDOM #subcat# JEWELRY</cfoutput></a></tr>
					<!--- End Matt Bayuk - SGM --->
				<cfinclude  template="statsrecord.cfm">
	
				    <cfif columns neq 1> <!---- means the last box in the row was not filled before comng out of query loop--->
						<cfloop from="#columns#" to="#displaycolumns#" index="idx">
							<td class="rowb" colspan="2">&nbsp;</td>
						</cfloop>
	
						<cfset rowsdisplayed = rowsdisplayed + 1></tr>
					</cfif>
					
				<cfinclude template="includes/linkexchangebystone.cfm">

                   <cfif rowsdisplayed LT 5 >
<cfif rowsdisplayed  is 0>
<cfset rowsdisplayed = 1>
</cfif>
<!---
				   <tr><td colspan="4" align="center"  class="biggreenwhite" >Random Picks from Top  Selling Designs  Shown Below</td>  <td  align="center"><a href='gemstone_jewelry_gallery.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#&groupname=#groupname#' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0"></a></td></tr--->
<!---<cf_simpleimages  cols="3"  colspan="2" rows="#evaluate(4 - rowsdisplayed)#"  boxclass="rowb" />--->
				   </cfif>   
				   <tr><td  colspan="6" align=middle>
				   <a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
				     <cfinclude template="googleadsforlist.htm"></td></tr>

<cfif subcat neq ""> <cfinclude template="marketing/stonelinks.cfm"></cfif> 
                 </table >
		</td><td valign="top" align="right" style="width:94px;">	
 <table cellpadding="3" cellspacing="0" style="horizontal-align:right;text-align:right;font-size:12px;display:block;padding:0px;margin-top:1px;">
<tr><td align="right">
<table cellpadding="0" bgcolor=white   align="right" cellspacing="0" style="horizontal-align:right;text-align:right;text-transform:capitalize;border:1px <cfoutput>#light# ridge;border-left:solid 1px #light#</cfoutput>; ">
  <tr><td> 
<a href=designer_jewelry_angela.cfm>Designer Section</a>
</td></tr>
 <tr><td class=""><a href="showsets.cfm"><u>Matching Sets</u></a></td></tr>
 <tr><td class="">&nbsp;</td></tr>
 <tr><td class="">&nbsp;</td></tr>
<cfinclude template="includes/rightpanel.cfm">

<TR>	
          <td align="center" class="darkbox"><a href=http://www.handmadelaptopcase.com><img src="laptopbags/ads/vertical120x400.jpg" alt="designer laptopbags" width="120" height="400"></a>
	
<cfif category neq 'beads'>
<script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 120;
google_ad_height = 600;
google_ad_format = "120x600_as";
google_ad_type = "text";
google_ad_channel ="";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</cfif>

</TD></TR>
</table></td></tr>
		  <tr><td>&nbsp;</td></tr>

 </table></td></tr></table>     

 	   <table width="800"    align="center" BORDER=0>
         
<tr bgcolor="white"  >
      <td align="center" valign="middle"   >&nbsp;  <a href="http://www.myexhibition.com" class="error1" target="artwindow">Host Art!</a> </td>
    <td align="center" valign="middle"  > 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>     <cfif getlist.recordcount> <tr><td colspan="2" align="center">
    <cfif isdefined("session.india") and session.India is 1>
         <a href='http://www.affiliatecurry.com/affiliate/trackingcode.php?aid=1244&linkid=B11'><img src='http://www.affiliatecurry.com/images/banner1.gif' border='0'></a><cfelse> 
			
					
			
          </cfif>
             </td> </tr></cfif>
    </table>
<cfoutput>
	<script language="JavaScript1.1">
		function showDetails(itemNum) {
			hideAll(); 
			document.getElementById('div' + itemNum).style.display = 'block';
		}
		function displayZoom(zoomImg,imageWidth) {
			$.blockUI.defaults.css = {};
			$.blockUI( {
				message: "<<<<<<<<<<<<<input type='button' id='closeZoom' value='Close' /><br><img src='" + zoomImg + "' />",
				css: {  
					width:			imageWidth + 'px',
					padding:        0,
					margin:         0,
					top:  (jQuery(window).height() - 500) /2 + 'px', 
					left: (jQuery(window).width() - imageWidth) /2 + 'px', 
					textAlign:      'center', 
					color:          '##000', 
					border:         '3px solid ##aaa',
					backgroundColor:'##fff'			
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
				imgZoom.onload = function(){
					imgZoom.onload = null;
					displayZoom(zoomImg,imgZoom.width);
				}
			}
		}
	
	</script>

 	<script language="JavaScript1.1">

		function hidex() {
			divx.style.display='none';
			
		}

		function hideAll() {
			for (i=1; i<=#itemcount#; i++) {
				eval('div'+i).style.display='none';
			}
		}
		
ShowHide('jumpstart');
	<cfif start eq 1>
ShowHide('jumpstartblinder');
</cfif>			

<cfif subcat neq "" and subcat neq "beaded">
	document.getElementById("#subcat#").style.color = "maroon";
//document.getElementById("#subcat#").style.fontWeight = "bold";
 document.getElementById("#subcat#").style.textDecoration = "none" ;
  document.getElementById("#subcat#").style.backgroundColor = "#light#";
  document.getElementById("#subcat#").parentNode.style.backgroundColor = "#light#";
  
		
  <cfif  listfind('bracelets,necklaces,earrings,pendants',category)>
  <!--- because this element is not created for healing & rings yet. This element is created inthe pop up list of the categories --->
  document.getElementById("#lcase(category)#_#subcat#").style.color = "##000066";
document.getElementById("#lcase(category)#_#subcat#").style.backgroundColor = "#light#";
 document.getElementById("#lcase(category)#_#subcat#").style.textDecoration = "none" ;
 </cfif>
   </cfif>
	<cfif len(category) GT 4 >
	document.getElementById("#lcase(category)#").style.color = "maroon";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
  <cfif  (subcat neq "" and subcat neq "beaded") or color neq ""  or salestatus eq 3 or priceless neq "">
 	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
		document.getElementById("#lcase(category)#_horiz").style.backgroundColor = "#light#";
  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;
	</cfif>
 //	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
//		document.getElementById("#lcase(category)#_horiz").style.backgroundColor = "##DADA99";
//  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;

//  document.getElementById("#lcase(category)#").style.backgroundColor = "##DADA99" ;
  
</cfif>
<cfif isdefined("url.silverjewelry")>
 	document.getElementById("#lcase(url.silverjewelry)#").style.color = "maroon";
	document.getElementById("#lcase(url.silverjewelry)#").style.backgroundColor = "#light#";
/*	document.getElementById("#lcase(url.silverjewelry)#").parentNode.style.backgroundColor = "##DADA99"; 
	*/
    document.getElementById("#lcase(url.silverjewelry)#").style.textDecoration = "none" ;
	<cfif url.silverjewelry is 1>
	document.getElementById("silver").parentNode.style.backgroundColor= "#light#";
	<cfelseif url.silverjewelry is 0 >
		document.getElementById("silver").parentNode.style.backgroundColor = "##E4E4E4";
		</cfif>
</cfif>
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/

	</script>		</cfoutput> 
	<!--- <cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
 ---><cfif isdefined("session.bulkbuyer.id")>
<script type="text/javascript" language="JavaScript1.1">
 	<!-- 
	document.getElementById("wholesale").style.color = "maroon";
	 	
  document.getElementById("wholesale").style.textDecoration = "none" ;
	//-->
	</script>
</cfif><cftry>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter=CGI.QUERY_STRING >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
</Cfif>

<cfcatch type="application"> </cfcatch></cftry>
</div>

           <cfif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
	</cfif>
<!--Start Kampyle Feedback Form Button-->
<div id="k_close_button" class="k_float kc_bottom kc_right"></div>
<div><a href="http://www.kampyle.com/feedback_form/ff-feedback-form.php?site_code=4132262&amp;form_id=5330&amp;lang=en" target="kampyleWindow" id="kampylink" class="k_float k_bottom k_right" onclick="k_button.open_ff();return false;"><img src="http://cf.kampyle.com/en-orange-band-low-right.gif" alt="Feedback Form"/></a></div>
<script src="http://cf.kampyle.com/k_button.js" type="text/javascript"></script>
<!--End Kampyle Feedback Form Button-->

 </BODY>
</HTML>
