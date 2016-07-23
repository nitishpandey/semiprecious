<cfset salestatus=3> 
	 <cfset category="pendants">
	 	<!--- 
		--->		<Cftry>
		<Cfset cgi.query_string ='salestatus=3&category=pendants' /> 
		<cfcatch type="any">
		<cfoutput>#cfcatch.message#</cfoutput></cfcatch>
		</cftry>

		<cfinclude  template='gemstone_jewelry_gallery.cfm' > 

