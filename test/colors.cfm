  <cfcache action="cache" timespan="#CreateTimeSpan(0,2,0,0)#"> 
  <cftry>
<cfsilent>
<cfif #cgi.server_name# contains "semiprecious.in">
<cfif cgi.query_string neq "">
	<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
<cfelse>
	<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
</cfif>

<cfheader statuscode="301" statustext="Moved permanently">
<cfheader name="Location" value="#newurl#"> 
</cfif>
<cfif #cgi.server_name# does not contain "www.">
  <cfset newurl= "http://www.#CGI.SERVER_NAME##lcase(CGI.SCRIPT_NAME)#">
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
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="sortorder" default="newitem">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="pendantsdone" default="no">
<cfparam name="earringsdone" default="no" />
<cfparam name="braceletsdone" default="no" />
<cfparam name="subcat" default="" />
<cfparam name="url.ringsize" default="" />
<cfparam name="ringsize" default="" />
<CFPARAM NAME="color" DEFAULT= "gray" />
<cfparam name="category" default="" />
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="" />
<cfparam name="url.style" default="">


<cfif cgi.server_name contains "handmadelaptopcase.com">
  <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
</cfif>

</cfsilent>


<cfsilent>

<CFINCLUDE TEMPLATE="setup.cfm">
<cfparam name="sortorder" default="">
<cfif sortorder neq "">
  <cfset url.sortorder =sortorder>
</cfif>
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
</cfsilent>


<cfset categ=category>
<cfif category is "All">
  <cfset categ="jewelry">
</cfif>

<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='#replace(Trim(cgi.script_name),"/","")#'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <cfset metatitle="Wholesale #color# #categ#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
    <cfelse>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
  </cfif>
</cfif>
<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(cgi.script_name)#'>


  <cfif category is "ALL" or category is "">
    <cfset p = "Jewelry">
    <cfelse>
    <cfset p = category>
  </cfif>
  <cfsavecontent variable="inheader">
  <CFOUTPUT>
  <script language="JavaScript" src="js/mm_menu.js"></script>
<!-- Deluxe Menu -->
    <noscript><p><a href="http://deluxe-menu.com">Javascript Menu by Deluxe-Menu.com</a></p></noscript>
    <script type="text/javascript" src="newtopmenu.files/dmenu.js"></script>
    <!-- (c) 2009, by Deluxe-Menu.com -->
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
  
  <TITLE style="text-transform:capitalize;"><cfif metatitle neq "">#metatitle#    <cfelse>    <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>Wholesale    </cfif>    #titleCase(color)# #titleCase(subcat)# #style# #titlecase(p)# gem stone  </cfif></TITLE>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif> #color# Gem stone,  #p#"</cfif>>
  <meta name="author" content="Anup Pandey" />
  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#color# #style# #p# gem stone jewelry, retail and wholesale.'</cfif>>
</cfoutput>
<META content="30 days" name=revisit-after>
<script language="JavaScript" src="/js/imageswap.js"></script>
</cfsavecontent>

  <CFINCLUDE TEMPLATE="/header#session.country#.cfm">
  
<div id="container2">
<table  width="100%" cellspacing="0" cellpadding="0" border="0" style="padding:0 1px 0 1px">
  <tr >
  
  <cfif cgi.server_name does not contain "wholesale" or category eq "beads">
    <td  valign="top" width="184px"  >
	<!--- BEGIN LEFT SIDE STUFF --->
			<cfset leftcolordisplay="inline" />

      <CFINCLUDE TEMPLATE="leftmenus.cfm">
      <!--- END LEFT SIDE STUFF --->
    </td>
  </cfif>
  <td align="center" valign="top" style="background:white;padding:0px;">
  
  <cfset rowsdisplayed = 0>
  <table style="margin-left:0px;width:760px;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
    <tr>
      <td height="225" align="center" valign="top" colspan="2">
      <img src=/images/colored-stones/<cfoutput>#color#</cfoutput>-gemstone.jpg border=0></td>
    </tr>
        <CFINCLUDE TEMPLATE="hubs-bycolor.cfm">


    <cfif pagedescription neq "" or session.mail is application.admin_email>
      <Tr valign="middle">
        <td valign="middle" style="color:##666600;" class="rowb" colspan="2"><b><font color=gray size="-2"><i><cfoutput>#pagedescription#</cfoutput></i></font></b><br>
          <cfif session.mail is application.admin_email>
            <a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
          </cfif>&nbsp;
        </td>
      </tr>
    </cfif>


    <cfinclude template="includes/linkexchangebystone.cfm">

    <tr>
      <td  colspan="2" align=middle><a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
       </td>
    </tr>
    <cfif subcat neq "">
      <cfinclude template="marketing/stonelinks.cfm">
    </cfif>
  </table >
  </td>

  </tr>
</table>
</div>  
<cfinclude template="/mainfooter.cfm">
</div>
</BODY>
</HTML>
<cfcatch type="any">
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>

  
