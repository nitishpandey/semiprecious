<cftry>
<CFPARAM name=nospam default="">
<CFPARAM name="newitem" default="">
<cfparam name="category" default="all" />
<cfparam name="url.folder" default="necklaces" />
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(CGI.script_name),"/","")#'
	</cfquery>
	<cfoutput>


<cfif contentbypage.recordcount GT 0>
        <cfset metatitle="#contentbypage.title#">
        <cfset metadescription="#contentbypage.metadescription#">
        <cfset metakeywords="#contentbypage.keywords#">
   <cfelse>
   <cfset metatitle="Know about jewelry safe keeping and quality">
        <cfset metadescription="For #CGI.path_info# Semiprecious.com team has put together it's experience and research in form of these articles around different sterling silver semiprecious jewelry. Your queries and comments are invited.">
        <cfset metakeywords="sterling silver, jewelry, silver, semiprecious, gemstones, polishing, authenticity, genuine, carats" />

</cfif>


<cfset title = #metatitle# />
<cfsavecontent variable="inheader">
  <meta name="keywords" content="#metakeywords#">
  <meta name="author" content="Anup Pandey" >
  <meta name="description" content="#metadescription#">
  </cfsavecontent>
</cfoutput>



  <CFINCLUDE TEMPLATE="/header#session.country#.cfm">

  <div style="float:left;<cfif mobile>100%<cfelse></div>
</div>
</div></cfif>width:755px;margin-top:1px;">
      <!--- END LEFT SIDE STUFF --->

   <!--- <CFINCLUDE template="js/hoverstonemenu.cfm"> --->
	<cfoutput>#contentbypage.description# </cfoutput></div>


<cfoutput><p style="clear:left;"> Please also read
	<cfif contentbypage.linkto contains 'http'>
	<a href="#contentbypage.linkto#">
	<cfelse>
	<a href="/#contentbypage.linkto#">
	</cfif>#contentbypage.linktodisplay#</a></p></cfoutput>

	 <cfinclude template="/mainfooter.cfm" />
   <cfcatch type = "any">
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