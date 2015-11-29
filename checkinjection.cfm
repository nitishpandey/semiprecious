		<!--- to check for SQL injection attacks --->
		<cfif sortorder contains ('<') or sortorder contains ('>') or sortorder contains ('''') or sortorder contains ('"')
or sortorder contains (')') or sortorder contains ('(')
 or color contains ('<') or color contains ('>') or color contains ('''') or color contains ('"')
or color contains (')') or color contains ('(')
 or category contains ('<') or category contains ('>') or category contains ('''') or category contains ('"')
or category contains (')') or category contains ('(')
 or priceless contains ('<') or priceless contains ('>') or priceless contains ('''') or priceless contains ('"')
or priceless contains (')') or priceless contains ('(')
 or start contains ('<') or start contains ('>') or start contains ('''') or start contains ('"')
or start contains (')') or start contains ('(')>

<cflocation addtoken="no" url="http://www.semiprecious.com">
</cfif>