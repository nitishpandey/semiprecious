<!-- COLDFUSION   -->  

<!-- read post from PayPal system and add 'cmd' -->

<CFSET str="cmd=_notify-validate">

<CFLOOP INDEX="TheField" list="#Form.FieldNames#">
	<CFSET str = str & "&#LCase(TheField)#=#URLEncodedFormat(Form[TheField])#">
</CFLOOP>

<!-- post back to PayPal system to validate -->

<CFHTTP URL="https://www.sandbox.paypal.com/cgi-bin/webscr?#str#" METHOD="GET" RESOLVEURL="false"></CFHTTP>

<!-- assign posted variables to local variables -->

<CFSET payment_status=FORM.payment_status>
<CFSET txn_id=FORM.txn_id>
<CFSET payer_email=FORM.payer_email>
<CFSET cart_id=FORM.custom>
<CFSET billing_country=FORM.address_country>
<CFSET billing_zip=FORM.address_zip>
<CFSET billing_state=FORM.address_state>
<CFSET billing_city=FORM.address_city>
<CFSET billing_street=FORM.address_street>
<!-- check notification validation -->

<CFIF #CFHTTP.FileContent# is "VERIFIED">
	<cfquery  datasource="gemssql" name="txnid">
		 Select * From cartstatus Where cartid = #cart_id# And merchantsID = '#txn_id#'
	</cfquery>
	<cfif payment_status eq "Completed" And txnid.recordcount EQ 0>	
		<cftransaction>
			<CFQUERY DATASOURCE="gemssql" NAME="NewCartStatus">
				Update cartstatus
				Set merchantsID = '#txn_id#',
				paymode = 'pp',
				financialstatus = '#payment_status#'
				Where cartid = #cart_id#
			</CFQUERY>
			
			<CFQUERY DATASOURCE="gemssql" NAME="NewPurchase">
				Update purchase
				Set billingaddress1 = '#billing_street#',
				billingcity = '#billing_city#',
				billingstate = '#billing_state#',
				billingzip = '#billing_zip#',
				billingcountry = '#billing_country#'
				Where cartid = '#trim(cart_id)#'
			</CFQUERY>

			<CFQUERY DATASOURCE="gemssql" NAME="UpdateInventory">
		    		update items set inventory=inventory-quantity
     				From items, buyingrecord where buyingrecord.itemid=items.newitem and
     				buyingrecord.cartid= #cart_id#
    			</CFQUERY>

		</cftransaction>
	</cfif>
	<!-- process payment - End-->
<CFELSEIF #CFHTTP.FileContent# is "INVALID">
	<!-- log for investigation -->
	<!--- Write Log ---> 
	<cflock name="paypal_lock" type="exclusive" timeout="30"> 
		<cffile action="append" file="#GetDirectoryFromPath(GetTemplatePath())#logs/ipn_error.txt" mode="777" output="#str#" addnewline="yes">
	</cflock>
<CFELSE>
	<!-- error -->
	<cflock name="paypal_lock" type="exclusive" timeout="30"> 
		<cffile action="append" file="#GetDirectoryFromPath(GetTemplatePath())#logs/ipn_error.txt" mode="777" output="Error in Paypal IPN processing" addnewline="yes">
	</cflock>
</CFIF>
