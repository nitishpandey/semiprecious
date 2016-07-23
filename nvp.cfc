<!---
  --- nvp
  --- ---
  ---
  --- author: Administrator
  --- date:   11/8/14
  --->
<cfcomponent accessors="true" output="false" persistent="false">
	<cffunction name="getresponse" access="private" output="false" >
	<cfargument name="forms_data" required="true" />
	<cfargument name="country" required="true" />
	<cfargument name="state" required="true" />

	<!---  Code Added By Ankur  [5/2/2012] [START]--->
		<CFHTTP URL="https://api-3t.paypal.com/nvp" METHOD="POST">
			<CFHTTPPARAM NAME="METHOD" VALUE="DoDirectPayment" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="ACCT" VALUE="#reReplace(arguments.forms_data.clientcreditcard, " ", "", "ALL")#" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="PAYMENTACTION" VALUE="sale" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="USER" VALUE="anup_api1.semiprecious.com" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="PWD" VALUE="PYTVSU9YAE2YS4UP" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="VERSION" VALUE="64.0" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="SIGNATURE" VALUE="A7T95Eh2U0RMQZIyxXQZamGOkSsqAA8Bg3greVy3QsHCrUjhQkHPSPgI" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="CREDITCARDTYPE" VALUE="#arguments.forms_data.card_type#" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="CVV2" VALUE="#arguments.forms_data.ccv2#" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="EXPDATE" VALUE="#arguments.forms_data.expmonth##form.expyear#" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="CURRENCYCODE" VALUE="USD" TYPE="FormField" ENCODED="YES">
			<CFHTTPPARAM NAME="AMT" VALUE="#decimalformat(arguments.forms_data.x_amount)#" TYPE="FormField" ENCODED="YES">
			<cfhttpparam type="Formfield" name="FIRSTNAME" value="#arguments.forms_data.x_first_name#">
			<cfhttpparam type="Formfield" name="LASTNAME" value="#arguments.forms_data.x_last_name#">
			<cfhttpparam type="Formfield" name="STREET" value="#arguments.forms_data.x_address1# #form.x_address2#">
			<cfhttpparam type="Formfield" name="CITY" value="#arguments.forms_data.x_city#">
			<cfhttpparam type="Formfield" name="STATE" value="#arguments.state#">
			<cfhttpparam type="Formfield" name="ZIP" value="#arguments.forms_data.x_zip#">
			<cfhttpparam type="Formfield" name="EMAIL" value="#arguments.forms_data.x_email#">
			<cfhttpparam type="Formfield" name="INVNUM" value="#arguments.forms_data.x_invoice_num#">
			<cfhttpparam type="Formfield" name="COUNTRYCODE" value="#arguments.country#">
			<cfhttpparam type="Formfield" name="x_ship_to_first_name" value="#session.x_ship_to_first_name#">
			<cfhttpparam type="Formfield" name="x_ship_to_last_name" value="#session.x_ship_to_last_name#">
			<cfhttpparam type="Formfield" name="x_ship_to_address" value="#session.x_ship_to_address1# #session.x_ship_to_address2#">
			<cfhttpparam type="Formfield" name="x_ship_to_city" value="#session.x_ship_to_city#">
			<cfhttpparam type="Formfield" name="x_ship_to_state" value="#session.x_ship_to_state#">
			<cfhttpparam type="Formfield" name="x_ship_to_zip" value="#session.x_ship_to_zip#">
			<cfhttpparam type="Formfield" name="x_ship_to_country" value="#session.x_ship_to_country#">
		</CFHTTP>
               <cfreturn cfhttp.FileContent />
	</cffunction>
	<cffunction name="getNVPResponse" access="public" returntype="struct">
		<cfargument name="forms_data" required="true" />
		<cfargument name="country" required="true" />
		<cfargument name="state" required="true" />


		<cfset nvpString = urldecode(getResponse(arguments.forms_data,arguments.country, arguments.state)) />
			<cfset var responseStruct = StructNew()>
			<cfset var keyValStruct = StructNew()>
			<cfset var keys = "">
			<cfset var Values = "">
			<cfset nvpArray = ArrayNew(1) >
			<cfset keyArray = ArrayNew(1) >
			<cfset valueArray = ArrayNew(1) >
			<cfset key = "">
			<cfset value = "">
			<cfset currentValue = "">
			<cfset tempVal = "">
			<cfset count = 1 >
			<cfset tempvalue = "">
			<cfset  lennvp =  0>
			<cfloop from="1" to="#len(nvpString)#" index="i">
				<cfset lennvp = lennvp + 1>
				<cfset index = 1>
				<cfif #Mid(nvpString, i, 1)# is not "&">
					<cfset tempVal = tempVal & #Mid(nvpString, i, 1)#>
				</cfif>
				<cfif #Mid(nvpString, i, 1)# is "&" OR "#lennvp#" is "#len(nvpString)#">
					<cfset nvpArray[count] = #trim(tempVal)#>
					<cfset count =  count + 1>
					<cfset tempVal = "">
				</cfif>
			</cfloop>
			<cfloop from="1" to="#ArrayLen(nvpArray)#" index="i">
				<cfset currentValue = #nvpArray[i]#>
				<cfloop from="1" to= "#len(currentValue)#" index="i">
					<cfif #Mid(currentValue, i, 1)# is "=">
						<cfbreak>
					<cfelse>
						<cfset tempValue = tempValue & #Mid(currentValue, i, 1)#>
					</cfif>
				</cfloop>
				<cfset keyArray[index] = #trim(tempValue)#>
				<cfset index = #index# + 1>
				<cfset tempValue = "">
			</cfloop>
			<cfset vals = "">
			<cfset key = "">
			<cfloop from="1" to="#ArrayLen(nvpArray)#" index="i">
				<cfset vals  = #nvpArray[i]# >
				<cfset key = #keyArray[i]#>
				<cfset value = #RemoveChars(vals ,1, (len(key) +1))#>
				<cfset valueArray[i] = value>
				<cfset x = StructInsert(responseStruct,#trim(key)#,#trim(value)#)>
			</cfloop>
	
			<cfreturn responseStruct>
		</cffunction>

</cfcomponent>