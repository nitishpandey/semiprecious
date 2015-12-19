
<cfset gethostip = Cgi.REMOTE_ADDR >
<cfinvoke method="isitindia" component="countryresolver" returnvariable="sink" >
 <cfinvokeargument name="ipaddress" value="#gethostip#" >
</cfinvoke>

<cfoutput>#sink# [#gethostip#]</cfoutput>
<cfdump var="#CGI#" />
