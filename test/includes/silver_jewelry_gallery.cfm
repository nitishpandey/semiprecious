<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<cfparam name="groupname" default=""> <!--- used in folders like shaped, rare-stones --->
<cfparam name="inventory" default="">
<cfparam name="located" default="">
<cfparam name="stored" default="">
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="description" default="">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="subcat2" DEFAULT= "">
<cfparam name="categ" default="jewelry">
<cfparam name="metakeywords" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="ringsize" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="#style#">
<cfparam name="silverjewelry" default="">
<CFPARAM NAME="displaycolumns" DEFAULT="4">
<CFPARAM NAME="display" DEFAULT="4">
<cfparam name="light" default="yellow" />
<cfparam name="dark" default="gray" />
<CFPARAM NAME="numpages" DEFAULT="0">
<cfparam name="jewelrysize" default="">
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="all" >
<CFPARAM NAME="priceless" DEFAULT="">
<CFPARAM NAME="category2" DEFAULT="all" >
<cfparam default="662222" name="l"><cfparam name="invstatus" default=-3	>
<cfparam name="url.start" default="1">
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="url.subcat" DEFAULT=amethyst>
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
<CFPARAM NAME="pricegreater" DEFAULT="0">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">

<cftry>
<html>
<head>
<script type="text/javascript" language="JavaScript" src="/js/global.js"></script>
<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js"></script>
<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
<cfoutput>
	<style media="screen"   type="text/css" >
<!--
###category#_horiz {
background-color:white;
text-decoration:none;
color:black;
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
<cfif 0 and cgi.server_name contains 'wholesale'>
<script language="JavaScript" type="text/javascript" src="/wholesale-jewellery/wholesalemenu.js"></script>

</cfif>
<cfif  len(session.bulkbuyer.id)>
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

<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
    <cfelseif cgi.server_name contains "semiprecious.in">
    <cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
    <cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
    <cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
    <cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
    <cfelse>
    <cfset metatitle="#contentbypage.title# in gemstones">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#, gemstone jewelry">
    <cfset pagedescription="#contentbypage.description#">
  </cfif>
</cfif>

<cfoutput>
  <TITLE >
  <cfif metatitle neq "" >
    #titlecase(metatitle)# (#titlecase(style)#)
    <cfelse>
    <cfif cgi.server_name contains 'wholesale'>
Wholesale </cfif>#titleCase(color)# #titleCase(subcat)# #style# Gemstone #titlecase(p)#
  </cfif>
  </TITLE>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif>Affordable #color# #subcat#, Gemstone, #p#, Austin"</cfif>>
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
  <cfparam name="displayrows" default="7">
  <cfelse>
  <cfparam name="displayrows" default="4">
</cfif>

<cfif category is "jewelry"><cfset category=""></cfif>

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
<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
  <cflocation url="/wholesale_login.cfm">
</cfif>
<cfinclude template="checkinjection.cfm">
<cfparam name="grouping" default="">
<cfif style is 'silver beaded'>
  <cfset style='Silverbeaded'>
</cfif>
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
   display=21;
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
    <cfelse>
    <cfset metatitle="#groupname# #subcat# #categ# in gemstones">
    <cfset metadescription="semiprecious gemstone #groupname# jewelry">
    <cfset metakeywords="#groupname# #subcat# #categ# gemstone jewelry">
  </cfif>
</cfif>

<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(CGI.path_info)#'>
<!--- speed up things  --->
<CFIF start EQ 1 and advancedsearch neq "">
  <cftry>
    <CFQUERY DATASOURCE="gemssql" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery>
    <cfcatch type="database">
      <cfquery DATASOURCE="gemssql"  name="">
  	Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
</cfquery>
    </cfcatch>
    <cfcatch type="any">
Sorry, an error has occured, please call us to let us know - 1 866 819 7692
    </cfcatch>
  </cftry>
</CFIF>
<cfif not isdefined("form.submit5")>
  <!---<cftry>--->

<CFOUTPUT><h2>#stored#ANGELA</h2></CFOUTPUT>

<cfswitch expression="#occasion#">
	<cfcase value="xmas">
		<cfquery datasource="gemssql" name="getlist" >
  <cfinclude template="/includes/getxmasitemids.cfm" />
		</cfquery>

	</cfcase>
		<cfcase value="supplier">
		<cfif not isdefined("url.supcode")>
			Please provide storage code like H or PJ or P
			<cfabort />
			</cfif>
		<cfquery datasource="gemssql" name="getlist" >
  <cfinclude template="/includes/getsupitemids.cfm" />
		</cfquery>
</cfcase>
		<cfcase value="oos">
		<cfquery datasource="gemssql" name="getlist" >
  <cfinclude template="/includes/getoositemids.cfm" />
		</cfquery>

	</cfcase>

	<cfdefaultcase>
		<cfquery datasource="gemssql" name="getlist" >
		    <cfinclude template="/includes/getrecordsitemids.cfm" />
		</cfquery>
	</cfdefaultcase>
</cfswitch>
 <!---<cfcatch type="any">
<cfoutput>#cfcatch.sql#,#cfcatch.detail#,#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
 <cfcatch type="database">
<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
</cfcatch>
</cftry>--->
  <!--- 
<cfquery name="getlist" dbtype="query">
Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from getlist
   </cfquery>--->
  <!---
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
<cfif isdefined("form.submit5")>
  <cftry>
   <CFQUERY DATASOURCE="gemssql" NAME="GetList">
  select disporder, newitem, CAT, subcat, NameID,  storage, thumblink, imagelink,   price  , saleprice, status, wholesaleprice,rate, 
  Description
 , itemnumber as optcount, subcat, style, inventory, buylink  case status when 3 then saleprice else price end as orderprice from Items 
  <cfif isdefined("form.submit5")>
    where (saleprice 
    <cfif form.price EQ 0>
      < 1000 ) 
      <cfelse>
      <cfif form.price EQ 5>
        < 5.1) 
        <cfelse>
        <cfif #form.price#  EQ 10>
          < 10.1 ) 
          <cfelse>
          <cfif #form.price# EQ 20>
            < 20.1) 
            <cfelse>
            <cfif #form.price# EQ 1020>
              < 20.1) and (saleprice > 9.99) 
              <cfelse>
              > 19.99) 
            </cfif>
          </cfif>
        </cfif>
      </cfif>
    </cfif>
    <cfif style neq "">
       and (style = #style#)
    </cfif>
    <cfif not isDefined("form.cat1")>
      <cfif isDefined("form.cat")>
        and (cat in (#PreserveSingleQuotes(form.cat)#)) 
      </cfif>
    </cfif>
    <cfif not isDefined("form.subcat1")>
      <cfif isDefined("form.subcat")>
        and (subcat like (%#PreserveSingleQuotes(form.subcat)#%)) 
      </cfif>
    </cfif>
    <cfelse>
    <cfif isDefined("form.submit1")>
      <cfif not isDefined("form.cat1")>
        <cfif isDefined("form.cat")>
          where (cat in (#PreserveSingleQuotes(form.cat)#)) 
        </cfif>
      </cfif>
      <cfelse>
      <cfif isDefined("form.submit3")>
        <cfif not isDefined("form.subcat1")>
          <cfif isDefined("form.subcat")>
            where(subcat in (#PreserveSingleQuotes(form.subcat)#)) 
          </cfif>
        </cfif>
        <cfelse>
        <cfif isDefined("form.submit2")>
          where (saleprice 
          <cfif #form.price# EQ 0>
            < 1000 ) 
            <cfelse>
            <cfif #form.price# EQ 5>
              < 5.1) 
              <cfelse>
              <cfif #form.price#  EQ 10>
                < 10.1 ) 
                <cfelse>
                <cfif #form.price# EQ 20>
                  < 20.1) 
                  <cfelse>
                  <cfif #form.price# EQ 1020>
                    < 20.1) and (saleprice > 9.99) 
                    <cfelse>
                    > 19.99) 
                  </cfif>
                </cfif>
              </cfif>
            </cfif>
          </cfif>
          <cfelse>
          <h3>How on earth did we land up here !</h3>
        </cfif>
      </cfif>
    </cfif>
  </cfif>
  <cfif session.country is "india"> and storage like 'IN%' </cfif>order by  cat, saleprice 
  </cfquery>  
  <cfcatch type="Any" >
  <cfoutput>#cfcatch.Message#,#cfcatch.sql#</cfoutput>
  </cfcatch>
  </cftry>

</cfif>
</cfsilent>
<cfoutput>
	  <meta name="description" content= '<cfif metadescription neq ""> <cfif getlist.recordcount GT 0>
  <CFLOOP QUERY="Getlist" startrow="#start#" endrow="#evaluate(start+1)#">#xmlformat(getlist.description)#. 
  Shipped from Austin, TX. </cfloop></cfif> "#metadescription#" <cfelse><cfif cgi.server_name contains 'wholesale'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. 
  <cfif getlist.recordcount GT 0>
  <CFLOOP QUERY="Getlist" startrow="#start#" endrow="#evaluate(start+5)#">#xmlformat(getlist.description)#. 
  Shipped from Austin, TX. </cfloop></cfif></cfif>'>
</cfoutput>
  
  </HEAD>
  <body style="margin-top:0" lang="en-US">
  <div align="center">
  <!--- set up for ajax add to cart --->
 <form><input type="hidden" id="ajax_context" value=gallery /></form>
 
 <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
 --->
 <cfif isdefined("url.quick_add")>
 <cfset session.quick_add = url.quick_add />
 </cfif>
 <cfinclude template="/header#session.country#.cfm">
   <CFIF not isdefined("gETLIst.recordcount")>
     <br>
    <span class="error">No  item found. PLEASE TRY AGAIN.</span>
    <cfif subcat is 'amber'>
      <cfinclude template="pippinindex.htm">
    </cfif>
    <cfinclude template="footer.htm">
    <CFSET enddisplay= start + display -1 >
	</div>
  </body>
</html>
  <cfabort />
</cfif>

<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>
<cfif start gt getlist.recordcount>
  <cfset start = getlist.recordcount>
</cfif>
<cfif start lt 1>
  <cfset start = 1>
</cfif>


<!---<cfinclude template="includes/themes.cfm">--->
 
    

<cfoutput>
  <cfif getlist.recordcount LT 13>
    <cfset displayrows = 6 />
    <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures --->
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
    <div align="center" style="width:930px;margin-top:6px;" nowrap class="grayplacard">&nbsp;
          <cfif len(advancedsearch)>
            <cfelse>
            <!--- Selection:  --->
            <Cfif isnumeric(priceless)>
              &nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
            </Cfif>
            <cfif len(subcat) >
                <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
              <img src="/images/dots1.gif" style="display:inline;" />
			<cfif listfindnocase(Application.cufflinkstones,subcat)>
              <a href="#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="beads of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
         	<cfif listfindnocase(Application.necklacestones,subcat)>
                <a href="#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
              <cfif listfindnocase(Application.Braceletstones,subcat)>
                <a href="#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
              <cfif listfindnocase(Application.ringstones,subcat)>
                <a href="#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
              <cfif listfindnocase(Application.earringstones,subcat)>
                <a href="#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
              <cfif listfindnocase(Application.pendantstones,subcat)>
                <a href="#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
              <cfif listfindnocase(Application.beadstones,subcat)>
              <a href="#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
              </cfif>
		
              <cfelseif  color neq "">
              In #color#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
              <cfelseif  salestatus is 3 >
              <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
            </cfif>
            <cfif category EQ "All" >
              <span style="color:maroon;background-color:#light#;font-size=12 px;">All</span>&nbsp;
            </cfif>
          </cfif>
          &nbsp;  </div>
  </cfif>
</cfoutput>
<CFSET columns=1>
<CFSET rows=1>
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>
<table id="container1" width="930px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
  <tr >
  
  <!---<cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
  <td valign="top"  align="left" width="930px;" ><!--- BEGIN LEFT SIDE STUFF --->
   <!--- END LEFT SIDE STUFF --->
  
    
    <cfif subcat neq "bulk lots" and (cgi.server_name contains "wholesale." or session.bulkbuyer.id neq "")>
  <div align="center" style="padding-left:60px;;width:760px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  >

	   <font color=red><b>FOR BULK LOTS CLICK</b></font> <a href=/bulklots.cfm>HERE</a>
      </div>
    </cfif>
<!---	<cfif cgi.server_name does not contain 'wholesale'>
<center>  <h2>MEMORIAL DAY 50% OFF SALE ON NOW ON MOST ITEMS</h2></center>
</cfif>--->
  <!--- not working. takes you to the ring hub thats all. Date 29 Mar 2010. Nitish
		<cfif category eq "rings">
			
           					<div style="padding:2px;background-color:#EEE"><strong>RINGS BY SIZE:</strong> <a href="/rings.cfm?ringsize=4">Size 4</a> | <a href="/rings.cfm?ringsize=5">Size 5</a> | <a href="/rings.cfm?ringsize=6">Size 6</a> | <a href="/rings.cfm?ringsize=7">Size 7</a> | <a href="/rings.cfm?ringsize=8">Size 8</a> |  <a href="/rings.cfm?ringsize=9">Size 9</a> | <a href="/rings.cfm?ringsize=10">Size 10</a></div>

                    		</cfif>
							
							--->
<!---<cfif salestatus is 3>
<p>
<h2>SORRY THE BLACK FRIDAY SALE AT COST HAS ENDED. HOWEVER, COME BACK FOR CYBER MONDAY WHEN 2500 DESIGNS WILL BE AT 35% OFF SALE. 35% off our real regular prices. We do not show a false price and then show 35% off.<br> TO BE REMINDED BY EMAIL, <a href=/apply.cfm>SIGN UP</a></h2>
<CFABORT>
</cfif>---> 
  <!--- Paging links --->
<!---  <CFINCLUDE TEMPLATE="gallerypaging.cfm">--->
  <!--- End Paging links --->
  <!--- No items found --->
  <!--- End no items found --->
  <!--- Start Matt Bayuk - SGM --->
	  	<cfset itemCount = 0>
	  	<cfset itemlist = 0>
	 	<cfset price_color_filter = "" />
		<div style="float:left;display:inline;">
  			<cfset leftgemstonedisplay="inline" />
				<cfif color neq "" >
  						<cfset leftcolordisplay="inline" />
				</cfif>
					<!---
						<cfif pricegreater neq 0 or priceless neq "">
							<cfset leftpricedisplay = "inline" />
							<span style="font-weight:bold"><cfinclude template="/includes/price_color_filter.cfm" /></span>
						</cfif> 
					removed because now we ave a color bar above gallery--->
					 <CFINCLUDE TEMPLATE="leftmenus.cfm">
				</div> 


 <div id="semiprecious_gallery" style="overflow:visible;position:relative;float:right;margin-right:2px;" >
<div style="width:700px; text-align:center;" >
    <cf_steps step="1" />
 </div>
<!--- <cfif not len(subcat)>
<cftry>
    <cfset temp_filter="pricegreater=#pricegreater#&priceless=#priceless#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&category=#category#&stored=#stored#" >
 <cfoutput>
 	<DIV style="position:absolute;left:2px;border:1px gray solid;padding:1px;font-weight:500;color:gray;">Color? <span style="background-color:##CCCCCC;"><a class="headerfont #color#any_color" href="/gemstone_jewelry_gallery.cfm?#temp_filter#&amp;acemat">&nbsp;Any&nbsp;</a><span style="background-color:white;">&nbsp;</span><cfloop list="#application.color_list#" index="j"><a class="headerfont #color#_#j#" href="/gemstone_jewelry_gallery.cfm?#temp_filter#&amp;color=#j#&amp;acemat">&nbsp;#j#&nbsp;</a><span style="background-color:white;">&nbsp;</span></cfloop></span></span>
<span onClick="this.className='hidden';" class="translucent_box" STYLE="position: absolute; top: -1;left:-1px;text-transform:capitalize;">Showing #color# #p# <cfif len(pricegreater)>#round_format(pricegreater)# <cfelse>up</cfif><cfif len(priceless)>to #round_format(priceless)#<cfelse>upwards</cfif>. <strong><span style="color:red;text-decoration:underline;cursor:pointer;">In this Price Range Select Color Here</span></strong> To change price range use left menu. 
</span>
             </dIV>
			<div style="height:19px;">&nbsp;</div><!--- required to occupy this pace since this is styled to position absolute the space is prone to being occupied by other elements ---> </cfoutput>
<cfcatch type="any">
</cfcatch>
</cftry>   
    </cfif>                                                  
 --->  
<CFIF getList.recordcount is 0>
     <div style="margin-top:10px;margin-left:50px;border : 1px solid #ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;">
     	<cfoutput>
     		 Sorry no matches found for your criteria &rarr;#category# #subcat# #advancedsearch# #color# #format(priceless)# to #format(pricegreater)#.  Please try with some other selectors given in left panel and top panel. 
    	</cfoutput>
    <cfset silver = "">
    <cfif isdefined("url.relocated")>
      <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE 
							      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
      <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="#application.mail_server#" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail>
      <cfelse>
      <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
								--->
    </cfif>
    Often designs and range is discontinued due to  declining     interest.
    <form action="gemstone_jewelry_gallery.cfm" method="post"  style="display:inline;" >
      <br>
      Search:
      <input type='text' maxlength="24" size="12" value="" name='advancedsearch'>
      <input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
    </FORM>
    </div>
    
    <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="#application.mail_server#" subject="a criteria that is out of stock" type="html" >
						#session.mail#,#cgi.QUERY_STRING# .
						</cfmail>
						--->
  </cfif>
<div align="justify">  
		<b><font size=+1 color=purple>You are seeing:</b> <cfoutput>#titlecase(color)##titlecase(subcat)#<cfif groupname neq ""> #titlecase(groupname)#</cfif> #titlecase(url.style)#<cfif len(category) GT 3> #titlecase(category)#</cfif><cfif priceless neq ""> under #format(priceless)#</cfif>
		<cfif pricegreater neq "0"> and over #format(pricegreater)#</cfif></cfoutput></font> &nbsp;&nbsp;&nbsp; 
<cfif groupname neq ""><a href=/gemstone_jewelry_gallery.cfm?category=<cfoutput>#category#</cfoutput>>Clear Filters</a></cfif></div>  
	
  <cfif start is 1>
      <cfif session.desc_flag or 1>
  <div id="infotable"   align="justify" > 
      <cfif category is 'ornaments'>
    	<b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b> 
        <cfelseif subcat is 'pearl'>
<b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b>
      </cfif>
      <cfoutput>#pagedescription# <!--- <cfif color neq "">
  Showing #category# with #color# color.  <CFINCLUDE TEMPLATE="colorinfo.inc">
</cfif>--->
  <cfif session.mail is application.admin_email>
			#session.mail#
              <a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
            </cfif>
			</cfoutput>
        </Div>   </cfif>
      </cfif>


<!--- <cfinclude template="/includes/searchdropdowns.cfm" />
 ---><!--- place to put display code --->
<cfset quick_add = session.quick_add />
<cfinclude template="/includes/gallery_engine.cfm" />
  <div align="center" style="margin-top:30px;">
  <!--- Paging links --->
    <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">
	<!---  <div style="text-align:center;margin-bottom:2px;">
	  <cfoutput>
	  <span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
	 </cfoutput>
    </div>
	 End Paging links --->
	
</div>
<div align="center" id="cart_summary" style="z-index:6;"></div>
						
  <!--- End Matt Bayuk - SGM --->
  <cfinclude  template="statsrecord.cfm">
</div><!--- semipeciou_gallery --->
  </td></tr>
  <!--- <tr> <td>
    
   <a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
  </td>
  
  </tr>--->
  
    <tr>
      <td align="center"><!--- Footer --->
  <cfoutput>
    <cfinclude template="/includes/linkexchangebystone.cfm">
    <cfif subcat neq "">
      <cfinclude template="/marketing/stonelinks.cfm">
    </cfif>
        <cfinclude template="/mainfooter.cfm">
        <!--- End footer --->
      </td>
    </tr>
    <tr>
      <td id="wholesale"  align=middle>
      <a href="http://www.handmadelaptopcase.com"><img alt="stylish bags for netbooks and laptops" src="http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg" ></a>
	   </td>
    </tr>

    </table >
    
     </cfoutput>

<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />

	    <cfset session.filter="&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >

  <cfcatch type="application">
  </cfcatch>
</cftry>
<cfif (subcat is not "" or color is not "") and not len(session.mail)>
  <CFINCLUDE template="stoneinfo.inc">
</cfif>
</div>
</BODY>
</HTML>
<cfcatch type="any">
	<cfoutput>#cfcatch.message#, #cfcatch.detail#</cfoutput>
	</cfcatch>
	</cftry>