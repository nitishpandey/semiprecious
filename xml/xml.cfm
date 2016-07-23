<cfquery name="bad" datasource="gemssql">
    SELECT *
    FROM items FOR XML RAW
</cfquery>

<cfquery dbtype="query" name="good">
    select 'xml' as xmlstring from bad where 0=1
    union all
    select * from bad
</cfquery>

<cfsetting showDebugOutput="No">
<cfcontent type="text/xml">
<cfoutput query="good">
   #xmlstring#
</cfoutput>