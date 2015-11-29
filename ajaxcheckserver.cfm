<cfcontent type="text/xml" />
<cfif isdefined("url.var")>
<cfset session.ajaxcheck = 1 />
<cfset value = url.var*1.00  + 0/>
<cfoutput>
<response><localmethod>ajaxcheck</localmethod><returnvalue>#value#</returnvalue></response>
</cfoutput>
<cfelse>
<response><localmethod>ajaxcheck</localmethod><returnvalue>0</returnvalue></response>
</cfif>
