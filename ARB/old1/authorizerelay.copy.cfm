
<cfparam default="" name="form.x_invoice_num">
<html>
<head>

<cfif find('jandj',form.x_invoice_num)>
<cfset store = 'Jewelsandjewels'>
<cfset form.x_invoice_num = mid(form.x_invoice_num,6,len(form.x_invoice_num)-5)>
<cfelseif find('young',form.x_invoice_num)>
<cfset store = 'YoungUltd'>
<cfset form.x_invoice_num = mid(form.x_invoice_num,6,len(form.x_invoice_num)-5)>
<cfelseif find('jng',form.x_invoice_num)>
<cfset store = 'JNGems'>
<cfset form.x_invoice_num = mid(form.x_invoice_num,4,len(form.x_invoice_num)-3)>

<cfelse>
<cfset store = 'semiprecious'>
</cfif>
<cfoutput><title>#store#.com The One stop shop for semi precious and silver jewelry</title></cfoutput>
</head>
<body bgcolor="white">
<div align="center">
<table width=80% bgcolor="#D3D3AA" ><tr><td valign=top align="center"><font size="+3">www.<cfoutput>#store#</cfoutput>.com</font><br />
<em>Processed by Authorize.net</em></td></tr>	</table><br>
<br>
</div>
<div align="justify">
<cftry> 
<cfparam default="" name="form.x_response_reason_code">
<cfparam default="" name="form.x_response_reason_text">
<cfparam default="" name="form.x_trans_id">

<cfparam default="" name="form.x_amount">


<CFPARAM name="form.x_first_name" default="">
<CFPARAM name="form.x_last_name" default="">
<CFPARAM name="form.x_address" default="">
<CFPARAM name="form.x_city" default="c">
<CFPARAM name="form.x_state" default="s">
<CFPARAM name="form.x_zip" default="">
<CFPARAM name="form.x_country" default="">
<cfparam name="form.x_phone" default="0">
<cfparam name="form.x_email" default="na">

<CFPARAM name="form.x_ship_to_first_name" default="#Ucase(form.x_first_name)#">
<CFPARAM name="form.x_ship_to_last_name" default="">
<CFPARAM name="form.x_ship_to_address" default="#ucase(form.x_address)#">
<CFPARAM name="form.x_ship_to_city" default="#ucase(form.x_city)#">
<CFPARAM name="form.x_ship_to_state" default="#ucase(form.x_state)#">
<CFPARAM name="form.x_ship_to_zip" default="#form.x_zip#">
<CFPARAM name="form.x_ship_to_country" default="#form.x_country#">
<cfif not len(trim(form.x_ship_to_first_name))>
<cfset form.x_ship_to_first_name = form.x_first_name >
</cfif> 
<cfif not len(trim(form.x_ship_to_address))>
<cfset form.x_ship_to_address = form.x_address >
<cfset form.x_ship_to_last_name = form.x_last_name >
</cfif> <cfif not len(trim(form.x_ship_to_city))>
<cfset form.x_ship_to_city = form.x_city >
</cfif> <cfif not len(trim(form.x_ship_to_state))>
<cfset form.x_ship_to_state = form.x_state >
</cfif> <cfif not len(trim(form.x_ship_to_zip))>
<cfset form.x_ship_to_zip = form.x_zip >
</cfif> <cfif not len(trim(form.x_ship_to_country))>
<cfset form.x_ship_to_country = form.x_country >
</cfif>
<cfif not len(trim(form.x_email))>
<cfset form.x_email = "NA">
</cfif> 
<cfif not len(trim(form.x_phone))>
<cfset form.x_phone = "NA">
</cfif> 
<cfswitch expression="#form.x_response_code#">
<cfcase value="1">
<cfoutput>
        <p>Your Transaction is complete and a confirmation has been emailed to 
          you in case you did provide your email address.</p>
        <p>You may want to note down the following details or take a print out 
          of this page.<br>
<br>
          The authorize.net <strong>approval code</strong> is #form.x_auth_code#.<br>
		 <br>

          <strong>Transaction Id</strong> : #form.x_trans_id#<br>
          <br>
          <strong>Invoice Number and #store#.com cartid</strong> : #form.x_invoice_num#<br>
          <br>
          <strong>Amount Paid</strong> : USD #form.x_amount#<br>
          <br>
          <strong>Payment Method</strong> : #form.x_method#<br />
          <br>
        </p>
        <table border="1" bordercolordark="##666600"><tr bgcolor="##CCCCCC">
<td><strong>Billing Address:</strong></td>
            <td> <strong>Shipping Details: </strong></td>
          </tr>

<tr><td valign="top">Name : #form.x_first_name# &nbsp;#form.x_last_name#<br />
Address: #form.x_address#<br />

City : #form.x_city#<br />
State : #form.x_state#<br />
Zip : #form.x_zip#<br />
Country : #form.x_country#<br />
Phone :#form.x_phone#<br />
Email :#form.x_email#<br /></td>
<td valign="top">
#form.x_ship_to_first_name# &nbsp;#form.x_ship_to_last_name#<br />
#form.x_ship_to_address#<br />
#form.x_ship_to_city#<br />
#form.x_ship_to_state#<br />
#form.x_ship_to_zip#<br />
#form.x_ship_to_country#
</td></tr>
</table>

</cfoutput>

<cfset  email = form.x_email>
<cfset phone = form.x_phone>
<cfset phonenumber = form.x_phone >
<cfset buyer_street_address  = form.x_address>
<cfset buyer_name = form.x_first_name & ' ' & form.x_last_name>
<cfset buyer_city =  form.x_city>
<cfset buyer_state =  form.x_state>
<cfset buyer_zip =  form.x_zip>
<cfset buyer_country =  form.x_country><br />




<!--- in last name below i am storing the payer's name  . in the firstname the shipping to name --->

<!--- cannnot capture email because it is itself or a part of a constraint that throws error when same value 
is repeated , hence email is of no use, instead it will be used to put email+cartid 
--->   <cfset form.x_invoice_num= replace(form.x_invoice_num,'G','')>
<cfset form.x_invoice_num= replace(form.x_invoice_num,'O','')>
<cfset form.x_invoice_num= replace(form.x_invoice_num,'P','')>
<cfset form.x_invoice_num= replace(form.x_invoice_num,'D','')>
<cfinvoke component="cartcontrol.cartmonitor" method="addpurchase" returnvariable="result" >
<cfinvokeargument name="cartid" value="#form.x_invoice_num#">
<cfinvokeargument name="email" value="#form.x_email#">
<cfinvokeargument name="shippingname" value="#form.x_ship_to_first_name# #form.x_ship_to_last_name#">
<cfinvokeargument name="billingname" value="#form.x_first_name# #form.x_last_name#">
<cfinvokeargument name="billingaddress" value="#form.x_address#">
<cfinvokeargument name="billingcity" value="#form.x_city#">
<cfinvokeargument name="billingstate" value="#form.x_state# #form.x_zip#">
<cfinvokeargument name="billingcountry" value="#form.x_country#">
<cfinvokeargument name="billingphone" value="#form.x_phone#">
<cfinvokeargument name="shippingaddress" value="#form.x_ship_to_address#">
<cfinvokeargument name="shippingcity" value="#form.x_ship_to_city#">
<cfinvokeargument name="shippingstate" value="#form.x_Ship_to_state#">
<cfinvokeargument name="shippingzip" value="#form.x_ship_to_zip#">
<cfinvokeargument name="shippingcountry" value="#form.x_ship_to_country#">
</cfinvoke>
<p>&nbsp;</p>
  <cfinvoke component="cartcontrol.cartmonitor" method="setpaymode" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#form.x_invoice_num#">
<cfinvokeargument name="paymode" value="auth.net">
</cfinvoke>
<cfinvoke component="cartcontrol.cartmonitor"  method="setbuyeremail">
<cfinvokeargument name="cartid" value="#form.x_invoice_num#">
<cfinvokeargument name="overwrite" value="no">
<cfinvokeargument name="email" value="#email#">
</cfinvoke>

<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#form.x_invoice_num#">
</cfinvoke> 
 <cfif store eq 'semiprecious'> 
 <cfset cart_id = form.x_invoice_num>
 <cfset payment = form.x_amount >
<cfinclude template="subscribebuyer.cfm">
  The top of this following page link will show the status of your cart : 
  <cfoutput><font color="##800000">http://www.semiprecious.com/itemsell.cfm?cartid=#form.x_invoice_num#</font></cfoutput></cfif> 
<p>&nbsp;</p>
<hr> </cfcase>
<cfcase value="2"><br>
The transaction has been declined due to:
<cfoutput><span class="error1">[Authorize.net Code:#form.x_response_reason_code#]&nbsp;#form.x_response_reason_text#.</span><br>
Click <a href="##" onClick="javascript:history.go(-1); return false;">Here</a> to Return to The payment form.
<br>
  <cfif store eq 'semiprecious'>      or <a href="http://www.semiprecious.com/cart.cfm">try</a> some other 
        payment mode. </cfif></cfoutput>
</cfcase>
<cfcase value="3">
There was an error encountered while completing your request.<cfoutput><br>
<font color="red">[Authorize.net Code:#form.x_response_reason_code#]&nbsp;#form.x_response_reason_text#.</font><br><br>

Click <a href="##" onClick="javascript:history.go(-1); return false;">Here</a> to Return to The payment form to make the necessary corrections.
<br>
      <cfif store eq 'semiprecious'>   or <a href="http://www.semiprecious.com/cart.cfm">try</a> some other 
        payment mode.</cfif> </cfoutput>
</cfcase><br>

</cfswitch>
<cfcatch type="database">
The following error occured while processing your request:
<cfoutput>#cfcatch.Message# (#cfcatch.Detail#).<br /> Please make the required corrections and try again.Click <a href="##" onClick="javascript:history.go(-1); return false;">Here</a> to Return to The payment form. <br>
        If the error persists please <!--- <a href="http://www.semiprecious.com/contactus.cfm?cartid=#form.x_invoice_num#">contact 
        us</a> ---> with the error details and the cartid (<strong>#form.x_invoice_num#</strong>).<br>

Thankyou.
</cfoutput>

</cfcatch>

</cftry> 
<br>
</div><cfoutput><a href="http://www.#store#.com">Return to #store#.com</a></cfoutput><hr />
<cfinclude template="googleads.htm">

<!-- Google Code for purchase Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1072681239;
var google_conversion_language = "en_US";
var google_conversion_format = "2";
var google_conversion_color = "CCCC00";
if (1) {
  var google_conversion_value = 1;
}
var google_conversion_label = "purchase";
//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/1072681239/imp.gif?value=1&label=purchase&script=0">
</noscript>

 <img src="https://shareasale.com/sale.cfm?amount=<cfoutput>#form.x_amount#&tracking=#form.x_invoice_num#</cfoutput>&transtype=TYPEOFTRANSACTION&merchantID=24548" width="1" height="1">

 
</body>
</html>
 