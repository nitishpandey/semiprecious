<cftry>
<cfinclude template="daily_deals_bl.cfm" />
<cfinclude template="daily_deals_ui.cfm" />
<cfcatch type="any">
	<cfoutput>#cfcatch.detail#, #cfcatch.message# </cfoutput>
		<cfmail cc="stacyanup@gmail.com" to="anup@semiprecious.com"  subject="what a dheel" server="mail23.webcontrolcenter.com" from="service@semiprecious.com" >
	<cfdump var="#application.daily_deals#" />
	Hmmm #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type# <cfdump var='#cfcatch.tagcontext#' />
		</cfmail>

	</cfcatch>
	</cftry>
