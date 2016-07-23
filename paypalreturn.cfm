<cfparam name="payment_status" default="new" />
<cfparam name="txn_id" default="0" />
<cfparam name="mode" default="new" />
<cfparam name="xcartid" default="120680" />

<cfif payment_status is "Completed">
	<cfquery datasource="gemssql" name="aa">
		update cartstatus 
		set PAYMODE='pp',STATUS='done'
		where cartid = #xcartid#
	</cfquery>
<cfelse>
	<cfquery datasource="gemssql" name="aa">
		update cartstatus 
		set PAYMODE='pp',STATUS='NA'
		where cartid = #xcartid#
	</cfquery>	
</cfif>