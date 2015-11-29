<cfquery datasource="gemssql" name="d">
	select * from cartstatus where cartid in (106892,106903,106905)
</cfquery>


	<cfdump var="#d#">