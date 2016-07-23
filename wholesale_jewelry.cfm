<title>Wholesale Sterling Silver and Gemstone Jewelry</title>
<CFSET url.newitem=0>
<cfif not isdefined("session.name")>
 <cfif isdefined("session.bulkbuyer.id")>
  and session.bulkbuyer.id neq "pondyiitd@yahoo.com">
  </cfif>
<cfset session.name = ''>
</cfif>
<cfinclude template="wholesale_login.cfm">