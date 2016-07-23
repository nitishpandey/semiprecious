<!--- Latest all categories combined--->

<cfloop list="rings,earrings,necklaces,pendants,bracelets,beads,gems,healing" index="cat">

<cfset category="#cat#">

<cfinclude template="homelatest.cfm">

</cfloop>