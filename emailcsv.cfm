<cfquery name ="r2" datasource="semiprecious">
select   firstname, email from memberinfo order by nlstatus desc,lastvisit desc 
</cfquery>
 <cfoutput query="r2"> "#email#" , </cfoutput> 
