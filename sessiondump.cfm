<cftry>
<cfdump var="#session#"/>
<cfoutput>#session.cartid#</cfoutput>
<cfcatch type="any">
...error
<cfoutput>#cfcatch.detail#</cfoutput>
</cfcatch>
</cftry>
