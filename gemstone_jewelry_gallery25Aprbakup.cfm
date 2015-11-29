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
string =rtrim(string);	
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

<cftry>

<cfif  session.desc_flag ><!--- include the original look gallery if description is on--->
      
	<cfsilent>
<cfif cgi.https is "on">
  <cflocation
url="http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" />
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
<cfparam name="inventory" default="">
<cfparam name="located" default="">
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="description" default="">
<cfparam name="categ" default="jewelry">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="ringsize" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="start" default="1">
<cfparam name="url.start" default="1">
<cfif ringsize neq "">
  <cfif ringsize does not contain 'size'>
    <cfset ringsize='size ' & ringsize>
  </cfif>
</cfif>
<cfif cgi.server_name contains "handmadelaptopcase.com">
  <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
  <cfelseif cgi.server_name contains "semiprecious.in">
  <cfset session.india=1>
</cfif>
<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <cfif session.bulkbuyer.id eq "">
    <cflocation url=login.cfm?email=pondyiitd@yahoo.com>
  </cfif>
</cfif>--->
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
<cfif session.mail eq 'acemattt@vsnl.com'>
  <cfset url.edit =  'mamamia'>
  <cfset invstatus= -5>
</cfif>
<cfparam default="662222" name="l">
<cfset  top = 114 />
<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <cfparam name="displayrows" default="7">
  <cfelse>
  <cfparam name="displayrows" default="4">
</cfif>
<CFPARAM NAME="displaycolumns" DEFAULT="5">
<CFPARAM NAME="numpages" DEFAULT="0">
<cfparam name="jewelrysize" default="">
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="all" >
<CFPARAM NAME="category2" DEFAULT="all" >
<cfif category is "jewelry"><cfset category=""></cfif>

<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="all">
</CFIF>
<cfif category is 'beads' and session.mail neq "acemat@vsnl.com">
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
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="subcat2" DEFAULT= "">
<cfif subcat contains "smokey" or subcat contains "smoky">
  <cfset subcat ="smoky quartz">
</cfif>
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
</cfsilent>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<script language="JavaScript" src="/js/mm_menu.js"></script>
<script language="JavaScript" src="/js/topmenu.js"></script>
<cfif cgi.server_name contains 'wholesale'>
<script language="JavaScript" src="/wholesale-jewellery/wholesalemenu.js"></script>
</cfif>
<script language="JavaScript" src="/js/imageswap.js"></script>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/favicon.ico" />
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script>
<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
<cfsilent>
<cfif category eq 'all' or category eq "">
  <cfset categ='jewelry'>
</cfif>
<CFINCLUDE TEMPLATE="setup.cfm">

<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <CFPARAM NAME="url.sortorder" DEFAULT="wholesaleprice" >
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
<CFPARAM NAME="pricegreater" DEFAULT="0">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cfif isnumeric(advancedsearch)>
  <cflocation url="detail.cfm?newitem=#advancedsearch#">
</cfif>
<cfif advancedsearch contains "wholesale" or advancedsearch contains "bulk">
  <cflocation url="/wholesale_login.cfm">
</cfif>
<cfinclude template="checkinjection.cfm">
<cfparam name=grouping default="">
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

  session.gallery = 'list' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
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
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">
<cfif groupname neq "">
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
    <cfset metadescription="Wholesale semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
    <cfset metakeywords="Wholesale <cfoutput>#groupname# #subcat# #categ#</cfoutput>  in gemstones">
    <cfelse>
    <cfset metatitle="#groupname# #subcat# #categ# in gemstones">
    <cfset metadescription="semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
    <cfset metakeywords="<cfoutput>#groupname# #subcat# #categ#</cfoutput> gemstone jewelry">
  </cfif>
</cfif>
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
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
  <CFQUERY NAME="GetList" DATASOURCE="gemssql" >
<cfinclude template="includes/getrecords.cfm">
</cfquery>
  <!---<cfcatch type="database">
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
<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
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
  <CFQUERY DATASOURCE="gemssql" NAME="GetList">
  select disporder, newitem, CAT, subcat, NameID,  storage, thumblink, imagelink,   price  , saleprice, status, wholesaleprice, 
  Description
 , subcat, style, inventory, buylink  case status when 3 then saleprice else price end as orderprice from Items 
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
  order by  cat, saleprice 
  </cfquery>
</cfif>
</cfsilent>
<CFIF not isdefined("gETLIst.recordcount")>
 
  <body topmargin="0">
    <cfif cgi.server_name contains "semiprecious.in">
      <cfinclude template="india/header.cfm">
      <cfelse>
      <cfinclude template="header.cfm">
    </cfif>
    <br>
    <span class="error">No  item found. PLEASE TRY AGAIN.</span>
    <cfif subcat is 'amber'>
      <cfinclude template="pippinindex.htm">
    </cfif>
    <cfinclude template="footer.htm">
    <CFSET enddisplay= start + display -1 >
  </body>
  <cfabort />
</cfif>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>
<cfif category is "ALL" or category is "">
  <cfset p = "Jewelry">
  <cfelse>
  <cfset p = category>
</cfif>
<CFOUTPUT>
  <TITLE style="text-transform:capitalize;">
  <cfif metatitle neq "">
    #metatitle#
    <cfelse>
    <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
Wholesale </cfif>#titleCase(color)# #titleCase(subcat)# #style# Gemstone #titlecase(p)#
  </cfif>
  </TITLE>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gemstone, #p#, Austin"</cfif>>
  <meta name="author" content="Anup Pandey" />
  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. <cfif getlist.recordcount GT 0><CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#getlist.description#. Shipped from Austin, TX. </cfloop></cfif>'</cfif>>
</cfoutput>
<META content="20 days" name=revisit-after>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/js/imageswap.js"></script>

<!-- Deluxe Menu -->
    <noscript><p><a href="http://deluxe-menu.com">Javascript Menu by Deluxe-Menu.com</a></p></noscript>
    <script type="text/javascript" src="/newtopmenu.files/dmenu.js"></script>
    <!-- (c) 2009, by Deluxe-Menu.com -->
</HEAD><cfif start gt getlist.recordcount>
  <cfset start = getlist.recordcount>
</cfif>
<cfif start lt 1>
  <cfset start = 1>
</cfif>
<BODY  topmargin="0">
<div align="center">
<!---<cfinclude template="includes/themes.cfm">--->
<cfif cgi.server_name contains "semiprecious.in">
  <CFINCLUDE TEMPLATE="india/header.cfm">
  <cfelse>
  <CFINCLUDE TEMPLATE="header.cfm">
</cfif>
<cfif color neq "">
  <CFINCLUDE TEMPLATE="colorinfo.inc">
</cfif>
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
    <table style="margin-left:0px;width:906px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;padding:0 ;"  border="0" cellspacing="0"  cellpadding="0">
      <tr style="width:904px;">
        <td valign="top" align="center" width="906px" nowrap class="grayplacard">&nbsp;
          <cfif len(advancedsearch)>
            <cfelse>
            <!--- Selection:  --->
            <Cfif isnumeric(priceless)>
              &nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
            </Cfif>
            <cfif len(subcat) >
              <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
              <cfif listfindnocase(Application.necklacestones,subcat)>
                <a href="#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;
              </cfif>
              <cfif listfindnocase(Application.Braceletstones,subcat)>
                <a href="#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;
              </cfif>
              <cfif listfindnocase(Application.ringstones,subcat)>
                <a href="#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;
              </cfif>
              <cfif listfindnocase(Application.earringstones,subcat)>
                <a href="#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;
              </cfif>
              <cfif listfindnocase(Application.pendantstones,subcat)>
                <a href="#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;
              </cfif>
              <cfif listfindnocase(Application.beadstones,subcat)>
              <a href="#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;
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
          &nbsp;  </td>
      </tr>
    </table>
  </cfif>
</cfoutput>
<CFSET columns=1>
<CFSET rows=1>
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>
<table id="container1" width="906px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
  <tr style="width:906px;" align="left">
  
  <!---<cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
  <td valign="top"  align="left" ><!--- BEGIN LEFT SIDE STUFF --->
  <cfset leftgemstonedisplay="inline" />
		<cfif color neq "" >
  			<cfset leftcolordisplay="inline" />
			
			
			
			</cfif>
  <CFINCLUDE TEMPLATE="leftmenus.cfm"> 
    <!--- END LEFT SIDE STUFF --->
  </td>
  <!---									</cfif>--->
  <td align="center" valign="top"  style="padding-left:2px">
  
  <table id="infotable" align="center" cellspacing="0" cellpadding="0" >
    <!---<CFINCLUDE TEMPLATE="jumpstart.cfm" />--->
    <cfif start is 1>
      <!---		<cfinclude template="jumpstartblinder.cfm" />--->
      <cfset session.filterarray = arraynew(2)>
      <cfif category is 'ornaments'>
        <tr valign="middle">
          <td valign="middle" style="color:##666600;" class="rowb">
          	<b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b> </td>
        </tr>
        <cfelseif subcat is 'pearl'>
        <Tr valign="middle">
          <td valign="middle" style="color:##666600;" class="rowb" ><b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
          </td>
        </tr>
      </cfif>
      <cfif session.desc_flag >
      <tr valign="middle" align=left>
 <td valign="middle"   class="rowb" style="border-bottom:0px #CCC ridge"  />
            <div align="justify" style="padding:0px 40px">
<cfoutput>             	<font color=gray size="-1">#pagedescription#</font>
		
            <cfif session.mail is application.admin_email>
              <a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
            </cfif></cfoutput>
				</div>
          </td>
        </tr>
      </cfif>
      <CFLOOP QUERY="Getlist">
        <cfset session.filterarray[currentrow][1] = newitem>
        <cfset session.filterarray[currentrow][2] = cat>
      </cfloop>
    </cfif>
  </table>
  <cfset rowsdisplayed = 0>
    <cfif subcat neq "bulk lots" and (cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "")>
  <table align="center" style=";width:760px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">

	      <tr>
        <td align="center" >&nbsp;&nbsp;&nbsp;<font color=red><b>FOR BULK LOTS CLICK</b></font> <a href=/bulklots.cfm>HERE</a></td>
      </tr>
  </table>
    </cfif>
  
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
  <table style="margin-left:0px;width:760px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;padding:0 4px;"  border="0" cellspacing="0"  cellpadding="0">
  
  <!--- No items found --->
  <CFIF getList.recordcount is 0>
    <cfoutput>
      <div style="margin-top:10px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;">
      
      Sorry no matches found for your criteria (#category# #subcat# #advancedsearch# #color# #priceless#) specified. Could be that the particular designs are out of stock. Please try with some other words in your search. <br />
    </cfoutput>
    <cfset silver = "">
    <cfif isdefined("url.relocated")>
      <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE 
							      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
      <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
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
    
    <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
						#session.mail#,#cgi.QUERY_STRING# .
						</cfmail>
						--->
    <cfif session.bulkbuyer.id is "">
      Showing some other items on Sale if available in stock:
      <cftry>
        <cfset salestatus = 3>
        <CFQUERY DATASOURCE="gemssql" NAME="GetList">
								select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								where   price >20
																	and (CAT = '#category#')
																<CFIF salestatus is 3>
									and (status = 3)
								<CFELSE>
									and (status=0 or status=3)
								</CFIF>	
								and inventory > -3) 
								<Cfswitch expression="#style#">
									<cfcase value=""></cfcase>
									<cfcase value="beaded">
										and (subcat not like 'silver%')
									</cfcase>
									<cfdefaultcase >
										and (style like '#Left(subcat,4)#%')
									</cfdefaultcase>
								</CFswitch>
								<CFIF color is not "">
									and (color like '%#color#%')
								</CFIF>
								<CFIF priceless is not "">
									and (price <= #priceless#)
								</cfif>
								<CFIF pricegreater is not "">
									and (price >= #pricegreater#)
								</CFIF>
								order by  #url.sortorder# 
							</CFQUERY>
        <cfcatch type="database">
          <b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
        </cfcatch>
      </cftry>
    </cfif>
  </cfif>
  <!--- End no items found --->
  <!--- Start Matt Bayuk - SGM --->
  <cfset itemCount = 0>
  <cfset itemlist = 0>
  <CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#enddisplay#">
    <cfif inventory GT 0>
      <cfset itemlist=listAppend(itemlist, newitem)>
    </cfif>
    <cfset itemCount = itemCount + 1>
    <CFIF COLUMNS eq 1>
      <tr align="center">
      
    </CFIF>
    <CFSET invent=inventory>
    <!--- CCH
						<td class="rowb" style="border-left:0px solid black;" width="30%" onClick="hideAll(); div#itemCount#.style.display = 'block';">
--->
    <td class="rowb" style="border-left:0px solid black;" width="20%" valign=top><cfsavecontent variable="smallContent">
        <cfif inventory GT 0>
          <cfset status_array[columns] = 1>
          <cfif  cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "">
            <cfset l = 'AA2222'>
            <cfset price_array[columns] = format(wholesaleprice)>
            <cfelse>
            <cfset price_array[columns] = format(price)>
            <cfif status is 3>
              <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                <CFSET Saleprice = 0.80*price>
              </cfif>
              <cfset status_array[columns] = format(saleprice)>
            </cfif>
          </cfif>
          <cfelse>
          <cfset status_array[columns] = 0>
          <cfset price_array[columns] = soldformat(saleprice)>
        </cfif>
        <cfset item_array[columns] = '#newitem#_#lcase(cat)#_#lcase(replace(replace(subcat," ","","All"),",","_","All"))#'>
        <cfif getlist.storage EQ 'Pippin'>
          <a href="gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm##jewelry_top"> 
          	<img src ="#thumblink#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #cat#" <cfif category is 'bracelets'>width="100"</cfif>> </a>
          <CFELSE>
          <table border=0>
            <tr valign=top>
              <td valign=top height="150" align=center 
			  style="padding-top:1px;background-repeat:repeat-x;">
			  	<a href='gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm##jewelry_top'> <img src ='images/#getlist.cat#/thumb/#newitem#.jpg'  alt="#newitem#: #getlist.style# #getlist.color# #lcase(getlist.subcat)# <cfif getlist.grouping neq ""> #lcase(getlist.grouping)# </cfif>#lcase(getlist.cat)#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" <cfif category is 'bracelets'>width="100"</cfif>>
                 <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">	
       				  <cfif getlist.storage contains 'IN-'>
                         8-10 day delivery<br>
                         3-8 day delivery
                       </cfif>
				</cfif>
                </a> </td>
            </tr>
          </table>
        </CFIF>
        </cfsavecontent>
        <cfsavecontent variable="smallContent">
        <!---		<img src ='images/#getlist.cat#/thumb/#newitem#.jpg' long`desc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black' onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')">		--->
        <table border=0>
          <cfoutput>
            <tr valign=center>
              <td valign=center height="130" align=center
			   style="padding-top:1px;background-repeat:repeat-x;">
			   	<a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#<cfif grouping neq "">_#grouping#</cfif>.htm##jewelry_top'><img src ='/images/#getlist.cat#/thumb/#newitem#.jpg' alt="#newitem#: #getlist.style# #getlist.color# #lcase(getlist.subcat)# <cfif getlist.grouping neq ""> #lcase(getlist.grouping)# </cfif>#lcase(getlist.cat)#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'></a> </td>
            </tr>
            <!---<img src='magnify.gif'  onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')"/>&nbsp;&nbsp; <a href="javascript:showDetails('#itemCount#');">Info</a><br><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Details / Buy</a>--->
            <tr>
              <td align=center valign=top class=rowb><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#<cfif grouping neq "">_#grouping#</cfif>.htm##jewelry_top'>
                <cfif subcat neq "">
                  <br>
                  #lcase(subcat)#
                </cfif>
                <cfif subcat2 neq "">
                  #lcase(subcat2)#
                </cfif>
                <cfif grouping neq "">
                  #lcase(grouping)#
                </cfif>
                <cfif category neq 'healing' and categ neq 'jewelry'>
                  #lcase(cat)#
                  <cfelse>
                  #lcase(categ)#
                </cfif>
                </a><br>
                <cfif #style# contains "silver">
                  Sterling Silver
                </cfif></td>
            </tr>
          </cfoutput>
        </table>
        <cfset column = columns />
        <cfoutput>
	 <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
		 	<cfelse>
		 <cfif inventory gt 0>
	          <font color=gray>
	          <cfif cgi.server_name contains "semiprecious.in">
	            Ships in a day
	            <cfelse>
		            <cfif getlist.storage contains 'IN-'>
			              10-12 day delivery
		              <cfelse>
			              <font color=gray>Ships in 24 hr</font>
		            </cfif>
	          </cfif>
          </font>
        </cfif>
        <br />

           <font face="arial, verdana" color="##666633" size="2">#IIF(session.desc_flag ,DE(left(description, 80) & ".."),DE("<a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm' class='side_link'>Zoom</a>"))#</font>
		   </cfif>
          <cfswitch expression="#status_array[column]#">
            <cfcase value="1">
            <a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>#price_array[column]#</a> <br>
            </cfcase>
            <cfcase value="0">
            <font color="##CC8846">Sold Out</font>#price_array[column]#
            </cfcase>
            <cfdefaultcase>
            <br>
            <a href='/gem_stone_#lcase(cat)#.cfm/#item_array[column]#.htm'> <b><font color="maroon">Sale!</font></b></a> &nbsp;&nbsp;&nbsp; <font color="##000099"><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='/gem_stone_#lcase(cat)#.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font> <br />
            Sale!
            </cfdefaultcase>
          </cfswitch>
        </cfoutput>
        </cfsavecontent>
        <cfsavecontent variable="bigContent">
        <div id="div#itemCount#" class="rowb" style="position:absolute; display:none; background-color:white; border:2px solid black; padding:4px;"> <cfoutput>
            <table cellpadding="2" cellspacing="0" border="0" width=300>
              <tr valign="top">
                <cfif columns lt 4>
                  <td align="center">#smallContent# </td>
                </cfif>
                <td width="300"><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Buy</a><br>
                  <br>
                  <div aligh=left class="listdescr">
                    <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
                      Wholesale
                    </cfif>
                    #left(description, 700)# <br>
                    <br>
                    <br>
                    <a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Buy</a><br>
                    <br>
                    <span onMouseOver="div#itemCount#.style.display='none';"><a><font size=-1>close</font></a></span> </div>
                </td>
                <cfif columns GT 3>
                  <td align="center">#smallContent# </td>
                </cfif>
              </tr>
            </table>
          </cfoutput> </div>
        </cfsavecontent>
        <cfoutput> #bigContent# #smallContent# </cfoutput> </td>
      <cfif columns EQ displaycolumns>
        <cfset rowsdisplayed = rowsdisplayed + 1>
        </tr>
        <CFSET columns=1>
        <cfelse>
        <CFSET columns=columns + 1>
      </cfif>
  </CFLOOP>
  <!--- End Matt Bayuk - SGM --->
  <cfinclude  template="statsrecord.cfm">
  <cfif columns neq 1>
    <!---- means the last box in the row was not filled before comng out of query loop--->
    <cfloop from="#columns#" to="#displaycolumns#" index="idx">
      <td class="rowb" colspan="2">&nbsp;</td>
    </cfloop>
    <cfset rowsdisplayed = rowsdisplayed + 1>
    </tr>
    
  </cfif>
  <tr> <cfoutput><td valign=bottom bgcolor=white colspan="#displaycolumns#" border=0>
    </cfoutput>
    <!--- Paging links --->
    <CFINCLUDE TEMPLATE="/gallerypaging.cfm">
    <!--- End Paging links --->
  <!---  <a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>--->
  </td>
  
  </tr>
  
  <cfoutput>
    <cfinclude template="includes/linkexchangebystone.cfm">
    <cfif rowsdisplayed LT 5 >
      <cfif rowsdisplayed  is 0>
        <cfset rowsdisplayed = 1>
      </cfif>
    </cfif>
    <cfif subcat neq "">
      <cfinclude template="/marketing/stonelinks.cfm">
    </cfif>
    <tr>
      <td align="center" colspan="6"><!--- Footer --->
        <cfinclude template="/mainfooter.cfm">
        <!--- End footer --->
      </td>
    </tr>
    <tr>
      <td  colspan="6" align=middle><a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a> </td>
    </tr>

    </table >
    
    </td>
    
  </cfoutput>
  </tr>
  
</table>
<cftry>
  <Cfif len(cgi.QUERY_STRING)>
	    <cfset session.filter=CGI.QUERY_STRING >
	    <cfset session.gallery='/gemsstone_jewelry_gallery.cfm?#CGI.QUERY_STRING#' />	
    <cfelse>
	    <cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#" >
  </Cfif>
  <cfcatch type="application">
  </cfcatch>
</cftry>
<cfif (subcat is not "" or color is not "") and not len(session.mail)>
  <CFINCLUDE template="stoneinfo.inc">
</cfif>
</div>
</BODY>
</HTML>
<cfelse> <!--- include the new look gallery if description is off--->
<cfinclude template="g_j_t.cfm" /> 
</cfif>
<cfcatch type="any">
	<cfoutput>#cfcatch.message#, #cfcatch.detail#</cfoutput>
	</cfcatch>
	</cftry>
