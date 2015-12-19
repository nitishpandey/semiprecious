   <cfset groupname='Mens'>
   <cfif isdefined("url.category")>
   <cfif url.category is "jewelry">
   <cfset url.category = "all">
   </cfif>
   </cfif>
   <cfinclude template='/gemstone_jewelry_gallery.cfm'>
   
