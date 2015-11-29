<cfquery datasource="sptm" password="rangeela" username="nitish" name="parts">
		select * from bulkbuyers
		where email = 'Lelha57@aol.com'
		
	</cfquery>
    <cfdump var="#parts#">
    <cfoutput query = "parts">
		#email#<br>
		</cfoutput>
		