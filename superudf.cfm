<cfif isdefined("session.india")>
<cfinclude template="udfindia.cfm">
<cfelse>
<cfinclude template="udf.cfm">
</cfif>
