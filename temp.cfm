<cftry><html>
<head>
	
</head>
<body>
					 	<cfscript>
						application.indiaphone= '';
						</cfscript>

	<!-- restore cart 89094 -->
	<cftry>
      <cfoutput>#client.cfcartid#</cfoutput>
      <cfcatch type="any"></cfcatch>
      </cftry>
		<cfset x = GetHttpRequestData()>

<cfset c = 0 />
<cfdump var="#x#" expand="yes">

<cftry> 
<cfset catchid = 0 />
	<cfloop list="#x.headers.cookie#" delimiters=";= " index="p">
		<cfif p is 'cartid'>
		<cfset catchid = 1 />
		<cfelseif catchid>
		<cfset catchid = 0 />
			<cfif p GT c>
				<cfset c = p>
			</cfif>
		</cfif>

	</cfloop>
    
    <cfcatch type="any">no cookies</cfcatch></cftry>

<cfoutput>Biggest Number: #c#,  </cfoutput>

			  	   							<cfquery datasource="sptm" name="ws_loggedin"><!--- is he a wholesale member? --->
											   SELECT email  FROM bulkbuyers WHERE email = 'martha' and loggedin = '1'
											</cfquery>

These are the cookies AS set by server: <cfdump var="#cookie#" expand="NO" />
These are current server session:	<cfdump var="#SESSION#" />

						<cfset c = 0 />
						<cfset catchid = 0 />
</body>
</html><cfcatch type="any">
<cfoutput>#cfcatch.message#</cfoutput>
<cfdump var="#cfcatch#" />
</cfcatch></cftry>