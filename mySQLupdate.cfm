

<cfquery name="Recordset1" datasource="sptm">
	update bulkbuyers set email='mummeypl@earthlink.net' where email = 'mummeypl@bellsouth.net' 
</cfquery>

<cfquery name="Recordset1" datasource="sptm">
	select email from bulkbuyers where email='mummeypl@earthlink.net' 
</cfquery>

<cfoutput query="recordset1">#email#	</cfoutput>
