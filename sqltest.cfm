  <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select top 10 cat from anup.items
</cfquery>

<cfoutput>#GetList.Recordcount#</cfoutput>