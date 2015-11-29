<cftry><CFPARAM name=nospam default="">
<CFPARAM name="newitem" default="">
<cfparam name="category" default="all" />
<cfparam name="url.folder" default="necklaces" />
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
	<cfoutput>
<cfif contentbypage.recordcount GT 0>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
   
</cfif>

<html>
<head>
  <TITLE style="text-transform:capitalize;">   #metatitle#  </TITLE>
  <meta name="keywords" content="#metakeywords#"
  <meta name="author" content="Anup Pandey" />
  <meta name="description" content="#metadescription#"/>
</cfoutput>

<style type="text/css">
<!--
.copyright {
	font: 9px "Times New Roman", Times, serif;
	color: #CCCCCC;
}
-->
</style>

<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0"  >
	<div align=center>
<cfif cgi.server_name contains "semiprecious.in">
  <CFINCLUDE TEMPLATE="/india/header.cfm">
  <cfelse>
  <CFINCLUDE TEMPLATE="/header.cfm">
</cfif>
<table id="container1" width="906px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px">
  <tr style="width:906px;" align="">
    <td valign="top"  align="left" ><!--- BEGIN LEFT SIDE STUFF --->
    
      <!--- END LEFT SIDE STUFF --->
    </td>
    <td align="left" valign="top"><!--- <CFINCLUDE template="js/hoverstonemenu.cfm"> --->
	<cfoutput>#contentbypage.description#<p> Designs in this zone: <a href="#contentbypage.linkto#">#contentbypage.linktodisplay#</a>.</cfoutput>
      <cfinclude template="/mainfooter.cfm" />
    </td>
  </tr>
</table>
</div></body>

</html>

   <cfcatch type = "Database">
   <!--- the message to display --->
      <h3>You've Thrown a Database <b>Error</b></h3>
      <cfoutput>
         <!--- and the diagnostic message from the ColdFusion server --->
         <p>#cfcatch.message#</p>
         <p>Caught an exception, type = #CFCATCH.TYPE# </p>
         <p>The contents of the tag stack are:</p>
         <cfloop index = i from = 1 
               to = #ArrayLen(CFCATCH.TAGCONTEXT)#>
            <cfset sCurrent = #CFCATCH.TAGCONTEXT[i]#>
            <br>#i# #sCurrent["ID"]# 
               (#sCurrent["LINE"]#,#sCurrent["COLUMN"]#) 
               #sCurrent["TEMPLATE"]#
         </cfloop>
      </cfoutput>
   </cfcatch>

</cftry>