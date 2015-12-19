   <cfquery datasource="sptm" name="valid" username="nitish" password="rangeela">
      select  email from bulkbuyers order by membershipdate asc
      </cfquery>
	  
<cfoutput query="valid">#email#,</cfoutput>