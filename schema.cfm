<cfquery datasource="gemssql" name="d" >
select distinct(groupname) as d from itemsbygroup
</cfquery>
<cfdump var='#d#'>