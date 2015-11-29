			<cfquery datasource="gemssql" name="bulk">
		select distinct buyer from cartstatus where couponcode='regwsale' and cost>175 and outdate >=2009 and outdate <=2011	
		
		</cfquery>
			
			<cfloop query="bulk">
			
		
		
		<cfquery datasource="sptm" name="bulk">
  SELECT name as firstname, address as address1, phoneno as phonenumber, address2, city, state, country, zip FROM bulkbuyers
  WHERE email = '#bulk.buyer#'
</cfquery>

<cfoutput>
#name#, #address#, #address1# " " #address2#, #city#, #state#, #zip#, #country#, #phoneno#
</cfoutput> 
			</cfloop>
