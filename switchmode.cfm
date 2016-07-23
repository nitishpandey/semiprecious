
<cfif len(session.bulkbuyer.id)>
		<cfset session.bulkbuyer.id = "" />
<cfset session.quick_add = 0 />

	<cfelse>
<cfset session.quick_add = 1 />

		<cfset session.bulkbuyer.id = session.mail />
</cfif>

<cflocation url="whole_login.cfm">

