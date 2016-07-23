<cfcomponent>
    <cffunction name="ip2country" access="remote" returntype="query">
        <cfargument name="ip" required="yes" type="string">
        <cfset var q = "">

        <cfset Aip = ListToArray(arguments.ip,'.')>
        <cfset Aip = ((Aip[1] * 16777216) + (Aip[2] * 65536) + (Aip[3] * 256) + (Aip[4]))>

        <cfquery name="q" datasource="gemssql">
            SELECT country,name
            FROM geoip
            WHERE begin_num <= <cfqueryparam cfsqltype="CF_SQL_BIGINT" value="#Aip#">
            AND end_num >= <cfqueryparam cfsqltype="CF_SQL_BIGINT" value="#Aip#">
        </cfquery>
        
        <cfreturn q>
    </cffunction>
</cfcomponent>