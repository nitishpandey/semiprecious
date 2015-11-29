<cftry><!--
	Get the current time
-->
<cfset TheTimeDate=Now()>
<!--
	Convert the current time to the Greenwhich Mean Time
	(which is the required time that the Authorize.Net
	transaction server uses to verify xp_fingerprint)
-->
	<cfset UCT=DateConvert('local2UTC', TheTimeDate)>
<!--
	Create the required UNIX timestamp (seconds since midnight, January 1, 1970)
-->
	<cfset FirstDate= dateadd('m',-1,Now())>
	<cfset SecondDate='1/1/1970'>
	<cfset UCT2=DateDiff("s",SecondDate,UCT)>
<!---
	Test the timestamp and subsequent output
	(this is not required, but we've included it
	here to demonstrate what this might look like)
	<cfoutput>
	Look inside the code to find out how to generate the required UNIX timestamp in ColdFusion:<br>
 seconds since 1/1/1970: #UCT2#<br><br>
	</cfoutput>
	We set the fpTime variable for later use in the form that will get submitted to Authorize.Net
--->
	<cfset fpTime=#UCT2#>


<!---
	We set the loginid variable for later use in the form that will get submitted to Authorize.Net

	You could, of course, obtain the log-in ID in a number of other ways.

	Remember, this is only a demonstration to give you an idea of what
	might be involved in performing SIM transactions, using ColdFusion.
	Login ID:<br>
<cfoutput>#loginid#</cfoutput><br><br>


	We set the sequence variable for later use in the form that will get submitted to Authorize.Net

	You could, of course, obtain this number in a number of other ways.
	Ideally, you would obtain this number through the integration of a
	database and correlate the number ot your invoice sequence.

--->

	<cfset sequence=#RandRange(123, 987)#>
<!---	Randomly generated sequence number:<br>
	<cfoutput>#sequence#</cfoutput><br><br>

	Finally, we have all the information to generate a valid fingerprint.

	Since this requires the HMAC-MD5 algorithm — which is not built into
	ColdFusion yet — we are using the external custom tag:
	hmac.cfm

	If you have this freely available custom tag installed in one of the
	many possible locations for CF custom tags, the following code will
	execute properly.


	Resulting fingerprint: <br>
<cfoutput>#fp#</cfoutput><br><br>

--->	<cf_hmac data="ant481302002^#sequence#^#fpTime#^#amount#^" key="66Lq5Hwx8U43HQ3K">
	<cfset fp=#digest#>
	
<cfset header = '<table width=100% bgcolor="##DADA99"  ><tr><td valign=top><font size="+3">www.Semiprecious.com</font><br />
</td></tr>	</table><style><!-- body { horizontal-align:center;} table {  font-size:12px;border:1px black ridge;}--></style>' />
<cfset footer = '<table bgcolor="##DADA99" width="100%"><tr><td>In case of  any problem <a href="http://www.semiprecious.com/contactus.cfm">contact us</a>.<br /><a href="http://www.semiprecious.com/undocredit.cfm?creditfor=#session.cartid#&em=#session.mail#&dest=shop">Do More Shopping?</a></td></tr></table>' />

	<!--	<FORM ACTION="https://certification.authorize.net/gateway/transact.dll" name="simForm">-->
	<!--Uncomment the line ABOVE for shopping cart test accounts or BELOW for live merchant accounts-->
<FORM ACTION="https://secure.authorize.net/gateway/transact.dll" method="post" name="simForm"  style="display:inline;"> 
		<INPUT type="hidden" NAME="x_fp_sequence" value="<cfoutput>#sequence#</cfoutput>" >
		<INPUT type="hidden" NAME="x_fp_timestamp" value="<cfoutput>#fpTime#</cfoutput>" >
		<INPUT type="hidden" NAME="x_fp_hash" value="<cfoutput>#fp#</cfoutput>" >
		<input type="hidden" name="x_color_background" value="#CACAAA" />
		<input type="hidden" name="x_color" value="#000000" />
		
		<input type="hidden" name="x_login" value="ant481302002">
		<input type="hidden" name="x_amount" value="<cfoutput>#amount#</cfoutput>">
		<input type="hidden" name="x_invoice_num" value="<cfoutput>#session.cartid#</cfoutput>">
		<input type="hidden" name="x_method" value="CC" >
		<input type="hidden" name="x_type" value="AUTH_CAPTURE" >
		<cfif session.mail is "">
		<input type="hidden" name="x_description" value="Priority, In Stock, Pre-Xmas">
		<cfelse>
		<cfquery datasource="semiprecious" name="login">
            SELECT firstname, email, address1, address2,state,country, phonenumber,city, zip FROM memberinfo 
            WHERE email='#session.mail#' 
            </cfquery>
            <cfoutput>		<input type="hidden" name="x_description" value="Txn Info (member,,,)">
		<input type="hidden" name="x_address" value="#login.address1# #login.address2#" >
		<input type="hidden" name="x_zip" value="#login.zip#" >
		<input type="hidden" name="x_city" value="#login.city#" >
				<input type="hidden" name="x_state" value="#login.state#" >
						<input type="hidden" name="x_country" value="#login.country#" >
		<input type="hidden" name="x_email" value="#login.email#" >
				<input type="hidden" name="x_phone" value="#login.phonenumber#" >
		<input type="hidden" name="x_first_name" value="#trim(login.firstname)#" >
		<input type="hidden" name="x_last_name" value="" >
		</cfoutput></cfif>
		
		 <inputy type="hidden" name="x_receipt_link_URL" value="http://www.semiprecious.com/authorizereciept.cfm" >
        <inputy type="hidden" name="x_receipt_link_method" value="LINK" >
		<INPUT TYPE="HIDDEN" NAME="x_relay_response" VALUE="true" >
		<INPUT type="hidden" name="x_show_form" value="PAYMENT_FORM" >
							<input type="hidden" name="x_header_html_payment_form" value='<cfoutput>#header#' >	<INPUT type="hidden" name="x_footer_html_payment_form" value='#footer#' /></cfoutput>
<input type="image" src="http://www.semiprecious.com/images/authnet.gif" border="0" name="submit" alt="Make payments with Wells Fargo">
	</FORM>
<cfcatch type="any"><cfrethrow /></cfcatch></cftry>