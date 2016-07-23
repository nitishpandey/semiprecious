<cfparam name="url.id" default="0" type="numeric">
<cfinclude template="nlheader.htm">
<cfif isdefined("url.customer")>
<cfoutput>Dear #url.customer#,<br />
</cfoutput>

</cfif>
<cfinclude template="nl#url.id#.htm">

<cfinclude template="nlfooter.htm">

<cfif isdefined("url.customer")>
<hr />  Click<a href="../simpleloginform.cfm"> here</a> to login
</cfif>