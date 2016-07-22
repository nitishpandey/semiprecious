<cfparam name="payment_status" default="xx" />
<cfparam name="txn_id" default="0" />
<cfparam name="mode" default="tt" />
<cfparam name="cartid" default="120670" />

<cfquery datasource="gemssql" name="updatcart">
	update cartstatus 
	set PAYMODE='#mode#',STATUS='#payment_status#'
	where cartid = #cartid#
</cfquery>