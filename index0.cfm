<!---
<cfhttp url="http://semiprecious-com.securec71.ezhostingserver.com/index.php?" method="GET" redirect="yes" resolveURL="yes" />
<cfif cfhttp.statuscode is "200 OK">
            <cfoutput>
            #cfhttp.filecontent#
            </cfoutput>
        <cfelse>
            <cfinclude template="/index1.cfm" />
</cfif>--->

            <cfinclude template="/index1.cfm" />