    <cfquery name="contentbypage" datasource="gemssql">
	        Select  * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.script_name),"/","")#'
   </cfquery>

<cfset title = contentbypage.title />
<cfsavecontent variable="inheader">
<cfoutput>

<style>
##content a {text-decoration:Underline}
</style>
<meta name="keywords" content="#contentbypage.keywords#">
<meta name="description" content="#contentbypage.metadescription#">
  <meta name="author" content="Anup Pandey" >
 
<META content="60 days" name=revisit-after >
 </cfoutput>
  </cfsavecontent>

 <cfinclude template="/header.cfm">
<div id="container2" style="width:950px">
<div style="width:80%;" id="content">
<cfoutput>#contentbypage.description#</cfoutput>
</div>
<div align="center" style="position:relative;top:400px">
 <cfinclude template="/mainfooter.cfm">
</div>
</body>
</html>