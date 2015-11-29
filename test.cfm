<cfquery name="d" datasource="gemssql">
select * from users
</cfquery>
<cfdump var="#d#" />