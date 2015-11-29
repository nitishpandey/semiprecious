

 <cfset ipaddress=#cgi.remote_addr#>
		    <cfhttp method="get" port=8010 url="http://www.maxmind.com/a?l=eacapVSk6Lsy&i=#ipaddress#" timeout="25"></cfhttp>
             
		<cfset resultMaxMind = cfhttp.FileContent>

            <!---   <cfcatch type="Any">
                        <cfset result = "XX">
                </cfcatch>
				--->

<h2><cfoutput>#resultMaxMind#</cfoutput></h2>

