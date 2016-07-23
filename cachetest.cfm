<cfset md = structnew() />

<cfparam name="url.subcat" default="lemon quartz">
<cfoutput>#url.subcat# is here
</cfoutput>
<cfcache action="servercache"  id="as"  >

<cfinclude template="stoneshub.cfm" />
</cfcache>
