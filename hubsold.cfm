<cfsilent>
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="ringsize" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="grouping" default="">
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
<cfset  top = 114 />
<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <cfparam name="displayrows" default="1">
  <cfelse>
  <cfparam name="displayrows" default="1">
</cfif>
<CFPARAM NAME="displaycolumns" DEFAULT="4">
<cfparam name="jewelrysize" default="">
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="ALL" >
<CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq "acemat@vsnl.com">
  <cfset invstatus=0>
</cfif>
<cfif category is "bracelets">
  <cfset displayrows=1>
  <cfset displaycolumns="4">
</cfif>
<cfif category is 'beads'>
  <cfset displayrows=1>
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
<script language="JavaScript" src="js/mm_menu.js"></script>
<script language="JavaScript" src="js/topmenu.js"></script>
<script language="JavaScript" src="js/imageswap.js"></script>
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/favicon.ico" />
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script>
<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
<cfsilent>
<CFINCLUDE TEMPLATE="setup.cfm">
<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
  <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
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
    <CFPARAM NAME="url.sortorder" DEFAULT="newitem desc" >
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
<CFPARAM NAME="pricegreater" DEFAULT="">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cfparam name="newestStartNumber" default="1">
<cfparam name="popularStartNumber" default="1">
<cfparam name="saleStartNumber" default="1">
<cfif isnumeric(advancedsearch)>
  <cflocation url="detail.cfm?newitem=#advancedsearch#">
</cfif>
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

</cfscript>
<cfset categ=category>
<cfif category is "All">
  <cfset categ="jewelry">
</cfif>
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
	Select * from nitish.contentbypage where pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <cfset metatitle="Wholesale #contentbypage.title#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
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
 <cfif cgi.server_name contains "semiprecious.in">
 <cfinclude template="includes/getrecordsindia.cfm">
 <cfelse>
<cfinclude template="includes/getrecords.cfm">
</cfif>
</cfquery>
</cfif>
<cfif isdefined("form.submit5")>
  <CFQUERY DATASOURCE="gemssql" NAME="GetList">
  select disporder, newitem, CAT, subcat, NameID,  storage, thumblink, imagelink,   price  , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink  case status when 3 then saleprice else price end as orderprice from Items 
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
<!--- No items found --->
<CFIF not isdefined("getlist.recordcount")>
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
Wholesale
    </cfif>
    #titleCase(color)# #titleCase(subcat)# #style# Gemstone #titlecase(p)#
  </cfif>
  </TITLE>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gemstone, #p#, Austin"</cfif>>
  <meta name="author" content="Anup Pandey" />
  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. <CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. Shipped from Austin, TX. </cfloop>'</cfif>>
</cfoutput>
<META content="20 days" name=revisit-after>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD><BODY  topmargin="0">
<script language="javascript">


</script>
<!--- Include themes popup when themes is clicked --->
<cfinclude template="includes/themes.cfm">

  <cfif cgi.server_name contains "semiprecious.in">
    <CFINCLUDE TEMPLATE="india/header.cfm">
    <cfelse>
    <CFINCLUDE TEMPLATE="headerforgemstone_jewelry_gallery.cfm">
  </cfif>
  <cfif color neq "">
    <CFINCLUDE TEMPLATE="colorinfo.inc">
  </cfif>
  <cfoutput>
    <cfset display = displaycolumns*displayrows>
    <CFIF GetList.cat is not "">
      <input type='hidden' name='category' value='#GetList.cat#'>
      <CFELSE>
      <input type='hidden' name='category' value='#category#'>
    </cfif>
    <input type='hidden' name='url.sortorder' value='#url.sortorder#'>
    <cfset tw =  606>
  </cfoutput>
  <CFSET columns=1>
  <CFSET rows=1>
  <CFSET enddisplay= start + display-1>
  <CFSET currentrow= start>
  <table id="container1" width="1000px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px" >
    <tr style="width:1000px;" align="left">
        <td valign="top"  align="left" width="91px">
		<!--- BEGIN LEFT SIDE STUFF --->
<CFINCLUDE TEMPLATE="leftmenus.cfm">
          <!--- END LEFT SIDE STUFF --->
        </td>
       
      <CFINCLUDE TEMPLATE="hubs-bytheme.cfm">
      
    </tr>
  </table>
  <!--- Start footer material --->
  <table width="800"    align="center" border="0">
    <!--- Start admin row --->

    <cfif getlist.recordcount>
      <tr>
        <td colspan="2" align="center"><cfif isdefined("session.india") and session.India is 1>
            <a href='http://www.affiliatecurry.com/affiliate/trackingcode.php?aid=1244&linkid=B11'><img src='http://www.affiliatecurry.com/images/banner1.gif' border='0'></a>
            <cfelse>
          </cfif>
        </td>
      </tr>
    </cfif>
    <!--- End admin row --->

  </table>
  <br>

  <cfif isdefined("session.bulkbuyer.id")>
    <script type="text/javascript" language="JavaScript1.1">
 	<!-- 
	document.getElementById("wholesale").style.color = "maroon";
	 	
  document.getElementById("wholesale").style.textDecoration = "none" ;
	//-->
	</script>
  </cfif>
  <cftry>
    <Cfif len(cgi.QUERY_STRING)>
      <cfset session.filter=CGI.QUERY_STRING >
      <cfelse>
      <cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
    </Cfif>
    <cfcatch type="application">
    </cfcatch>
  </cftry>

<cfif (subcat is not "" or color is not "") and not len(session.mail)>
  <CFINCLUDE template="stoneinfo.inc">
</cfif>

</BODY>
</HTML>
