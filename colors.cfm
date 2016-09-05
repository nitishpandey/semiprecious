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
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='#replace(Trim(CGI.SCRIPT_NAME),"/","")#'
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
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="subcat" default="" />
<CFPARAM NAME="color" DEFAULT= "pink" />

<cfparam name="screensize" default="big">
<cfparam name="style" default="" />
<cfparam name="url.style" default="">


<cfif cgi.server_name contains "handmadelaptopcase.com">
  <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
</cfif>

</cfsilent>





<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">


<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(CGI.path_info)#'>


  <cfsavecontent variable="inheader">
  <CFOUTPUT>
<cfif metatitle neq "">
  <cfset title = "#metatitle#  in #color#">

  <cfelse>
<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>

<cfset title = "Wholesale">
<cfelse>
<cfset title = "" />

</cfif>
<cfset title = title & "  #titleCase(color)#   gem stone jewelry in Sterling Silver" />
</cfif>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif> #color# Gem stone,  #p#"</cfif>>
  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#color# #style# #p# gem stone jewelry, retail and wholesale.'</cfif>>
</cfoutput>
<META content="30 days" name=revisit-after>
<script language="JavaScript" src="/js/imageswap.js"></script>
</cfsavecontent>

  <CFINCLUDE TEMPLATE="/header.cfm">

<div id="container2">
<table  width="100%" cellspacing="0" cellpadding="0" border="0" style="padding:0 1px 0 1px">
  <tr >

  <cfif cgi.server_name does not contain "wholesale" >
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
<cfinclude template="/mainfooter.cfm">
<cfcatch type="any">
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>
