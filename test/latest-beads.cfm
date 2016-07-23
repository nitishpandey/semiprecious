<cfset category = 'beads' >   
<cfset sortorder = 'newitem desc' >   
<cfif isdefined("MVC")>
<cfinclude template="silver_jewelry_gallery_slow.cfm" />
<cfelse>

<cfinclude template="silver_jewelry_gallery.cfm" />
</cfif>