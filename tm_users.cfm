	<cfquery datasource="sptm" username="nitish" password="rangeela"  name="valid">
		select * from users 
		</cfquery>
		<cfdump var="#valid#" />