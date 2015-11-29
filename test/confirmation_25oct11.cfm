<cfparam name=agentcode default="">
<!--- <CFIF cgi.HTTP_REFERER DOES NOT CONTAIN 'CART' > 
	<CFLOCATION URL='#session.cart#?country=#session.address.country_code#' />
</CFIF>
 --->
<!-------------Authorize.net code processing--------------------->
<cflock scope="session" throwontimeout="no" timeout="30"  type="exclusive">
<cfparam name="form.country" default="USA" /> <!--- not sure why should we have to cfpaaram, but doing as a quick back up for now. nitish --->
<cfparam name="x_address" default=""> <!--- by anup --->
<cfparam name="x_auth_code" default=""> 
<cfset confirm_mail = session.mail />
	
<cfif isdefined("form.clientcreditcard")>
<cfset x_first_name=#form.x_first_name#>
<cfset x_last_name=#form.x_last_name#>
<cfset x_address1=#form.x_address1#>
<cfset x_address2=#form.x_address2#>
<cfset x_city=#form.x_city#>
<cfset x_state=#form.x_state#>
<cfset x_zip=#form.x_zip#>
<cfset x_phoneno=#form.x_phoneno#>
<cfset x_country=#form.x_country#>
<cfset x_email=#form.x_email#>
<cfset confirm_mail = x_email />
<cfset x_ship_to_first_name=#form.x_ship_to_first_name#>
<cfset x_ship_to_last_name=#form.x_ship_to_last_name#>
<cfset x_ship_to_address1=#form.x_ship_to_address1#>
<cfset x_ship_to_address2=#form.x_ship_to_address2#>
<cfset x_ship_to_city=#form.x_ship_to_city#>
<cfset x_ship_to_state=#form.x_ship_to_state#>
<cfset x_ship_to_zip=#form.x_ship_to_zip#>
<cfset x_ship_to_country=#form.x_ship_to_country#>
<cfset clientcreditcard=#form.clientcreditcard#>
<cfset card_type=#form.card_type#>
<cfset expmonth=#form.expmonth#>
<cfset expyear=#form.expyear#>
<cfset ccv2=#form.ccv2#>
<cfset x_amount=#form.x_amount#>
<cfset x_invoice_num=#form.x_invoice_num#>


<cfhttp method="Post" url="https://secure.authorize.net/gateway/transact.dll">
<cfhttpparam type="Formfield" name="x_login" value="63pLVu46e">
<cfhttpparam type="Formfield" name="x_tran_key" value="3Ah65k686zrC9A9v">

<cfhttpparam type="Formfield" name="x_delim_data" value="TRUE">
<cfhttpparam type="Formfield" name="x_delim_char" value="|">
<cfhttpparam type="Formfield" name="x_relay_response" value="FALSE">

<cfhttpparam type="Formfield" name="x_type" value="AUTH_CAPTURE">
<cfhttpparam type="Formfield" name="x_method" value="CC">
<cfhttpparam type="Formfield" name="x_card_num" value="#form.clientcreditcard#">
<cfhttpparam type="Formfield" name="x_exp_date" value="#form.expmonth##form.expyear#">

<cfhttpparam type="Formfield" name="x_amount" value="#form.x_amount#">
<cfhttpparam type="Formfield" name="x_description" value="Payment for the order - #form.x_invoice_num#">

<cfhttpparam type="Formfield" name="x_first_name" value="#form.x_first_name#">
<cfhttpparam type="Formfield" name="x_last_name" value="#form.x_last_name#">
<cfhttpparam type="Formfield" name="x_address" value="#form.x_address1# #form.x_address2#">
<cfhttpparam type="Formfield" name="x_city" value="#form.x_city#">
<cfhttpparam type="Formfield" name="x_state" value="#form.x_state#">
<cfhttpparam type="Formfield" name="x_zip" value="#form.x_zip#">
<cfhttpparam type="Formfield" name="x_email" value="#form.x_email#">
<cfhttpparam type="Formfield" name="x_country" value="#form.x_country#">

<cfhttpparam type="Formfield" name="x_ship_to_first_name" value="#form.x_ship_to_first_name#">
<cfhttpparam type="Formfield" name="x_ship_to_last_name" value="#form.x_ship_to_last_name#">
<cfhttpparam type="Formfield" name="x_ship_to_address" value="#form.x_ship_to_address1# #form.x_ship_to_address2#">
<cfhttpparam type="Formfield" name="x_ship_to_city" value="#form.x_ship_to_city#">
<cfhttpparam type="Formfield" name="x_ship_to_state" value="#form.x_ship_to_state#">
<cfhttpparam type="Formfield" name="x_ship_to_zip" value="#form.x_ship_to_zip#">
<cfhttpparam type="Formfield" name="x_ship_to_country" value="#form.x_ship_to_country#">

<cfhttpparam type="Formfield" name="x_test_request" value="0">
<cfhttpparam type="Formfield" name="x_invoice_num" value="#form.x_invoice_num#">

</cfhttp>

<cfset post_response=Replace(cfhttp.filecontent,"||","| |", "all")>
<cfset post_response=Replace(post_response,"||","| |", "all")>
<cfset response_array=ListToArray(post_response, "|")>
<cfif (response_array[1] eq 1) >
	 <cfset err_mess = "Payment Completed" />
	<cfset transid = response_array[7] />
	<cfset invoiceid = response_array[8] /> 
	<cfset tamount= response_array[10] />
		<CFSET session.cartitem=ArrayNew(2)  />
		<Cfset session.cartitem[1][1] = 0  />
		<Cfset session.cartitem[1][4] = 0  />
		<Cfset session.cartitem[1][2] = 0  />
		<Cfset session.cartitem[1][3] = 0  />
		<Cfset session.cartitem[1][5] = 0  />

		<cfset session.totalqty = 0>
		<cfset session.grandtotal = 0>
		
	 <cfset form.x_invoice_num= replace(form.x_invoice_num,'G','')>
	<cfset form.x_invoice_num= replace(form.x_invoice_num,'O','')>
	<cfset form.x_invoice_num= replace(form.x_invoice_num,'P','')>
	<cfset form.x_invoice_num= replace(form.x_invoice_num,'D','')>
	<cfsilent>
	 <cfif len(form.x_email)>
		<cfinvoke component="cartcontrol.cartmonitor"  method="setbuyeremail">
	        <cfinvokeargument name="cartid" value="#form.x_invoice_num#">
	        <cfinvokeargument name="overwrite" value="no">
	        <cfinvokeargument name="email" value="#form.x_email#">
		</cfinvoke>
	</cfif>
    <cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
		     <cfinvokeargument name="cartid" value="#form.x_invoice_num#"/>
		     <cfinvokeargument name="mode" value="auth.net"/>
 			 <cfinvokeargument name="txnid" value="#transid#"/>
		</cfinvoke>
	</cfsilent>
  <!---	<cfinvoke component="cartcontrol.cartmonitor" method="setpaymode" returnvariable="flag" >
		<cfinvokeargument name="cartid" value="#form.x_invoice_num#">
		<cfinvokeargument name="paymode" value="auth.net">
	</cfinvoke>

	<cfinvoke component="inventory" method="updatepercart" returnvariable="lag" >
		<cfinvokeargument name="cartid" value="#form.x_invoice_num#">
	</cfinvoke> 
	--->
<cftry>
	<cfinvoke component="cartcontrol.cartmonitor" method="addpurchase" returnvariable="result" >
        <cfinvokeargument name="cartid" value="#form.x_invoice_num#">
        <cfinvokeargument name="email" value="#form.x_email#">
        <cfinvokeargument name="shippingname" value="#form.x_ship_to_first_name# #form.x_ship_to_last_name#">
        <cfinvokeargument name="billingname" value="#form.x_first_name# #form.x_last_name#">
        <cfinvokeargument name="billingaddress" value="#form.x_address1# <br /> #form.x_address2#">
        <cfinvokeargument name="billingcity" value="#form.x_city#">
        <cfinvokeargument name="billingstate" value="#form.x_state# #form.x_zip#">
        <cfinvokeargument name="billingcountry" value="#form.x_country#">
        <cfinvokeargument name="billingphone" value="#form.x_phoneno#">
        <cfinvokeargument name="shippingaddress" value="#form.x_ship_to_address1#">
        <cfinvokeargument name="shippingaddress2" value="#form.x_ship_to_address2#">
        <cfinvokeargument name="shippingcity" value="#form.x_ship_to_city#">
        <cfinvokeargument name="shippingstate" value="#form.x_Ship_to_state#">
        <cfinvokeargument name="shippingzip" value="#form.x_ship_to_zip#">
        <cfinvokeargument name="shippingcountry" value="#form.x_ship_to_country#">
	</cfinvoke>
    <cfcatch type="Any">
  <cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com"  subject="Shipping Address Confirmation" type="HTML" >
     <cfdump var="#cfcatch#" />
   </cfmail>
		
    </cfcatch>
</cftry>
<cftry>
		<cfinvoke component="invitationandcredit"  method="buyer_type" returnvariable="tflag" >
				<cfinvokeargument  name="buyer_email" value="#form.x_email#" />
			</cfinvoke>

<cfif tflag is 'none'><!--- this means relay backs will not switch a retail buyer to a wholesale buyer --->
		
			<cfset subscribe_type = '' />
			<cfquery datasource="gemssql" name="buyer_type">
   				select couponcode  from cartstatus with (nolock) where cartid = #form.x_invoice_num#
  			</cfquery>
	
			<cfif buyer_type.couponcode is 'regwsale'>
				<cfset subscribe_type = 'wholesale' />
		       </cfif>
	
		<cfinvoke component="invitationandcredit" method="SIGNUP" returnvariable="signedup" >
			<CFINVOKEARGUMENT name="cartid" VALUE="#form.x_invoice_num#"  />
			<CFINVOKEARGUMENT value="#form.x_email#" name="buyer_email"    />
			<CFINVOKEARGUMENT VALUE="#form.x_phoneno#" name="phonenumber"   />
			<CFINVOKEARGUMENT  value="#form.x_country#" name="buyer_country"   />
			<CFINVOKEARGUMENT  name="status" value="1"  />
            <cfinvokeargument name="subscribe_type" value="#subscribe_type#" />
			<CFINVOKEARGUMENT value="#form.x_first_name# #form.x_last_name#" name="buyer_first_name"  />
			<CFINVOKEARGUMENT value="" name="buyer_last_name"    />
	</cfinvoke>
</cfif> 
 
        <cfcatch type="any">
            <cfmail  to="nitish@semiprecious.com,anup@semiprecious.com" from="cs@semiprecious.com"  subject="sign up on confirmation" >
        #cfcatch.detail#,#cfcatch.message#
        </cfmail>
        
        </cfcatch>
	</cftry>
    

<cfsavecontent variable="final_address">
<cfinclude template="/includes/spam_proof.cfm" />
<cfoutput>   
		<br />
     <table cellpadding="0" cellspacing="0" ><tr><td align="left"><p>Order Summary<br />

		 <br>
          <strong>Invoice Number</strong> : #form.x_invoice_num#<br>
        
          <strong>Amount Paid</strong> : USD #form.x_amount#<br>
         
        </p></td><td style="border-left:1px black solid;padding-left:4px;text-align:right;width:350px;color:darkblue;">
		Keep Track Of Your Order:
					<a href="https://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.#session.tld#/itemsell.cfm?cartid=#form.x_invoice_num#"  style="border:none; overflow:hidden; width:340px; height:35px;" >Place On My Facebook Account</a>
					</td>
					</tr>
					</table>
<br>

        <table border="0" style="width:600px;border-bottom:1px red solid;" bordercolordark="##666600"><tr bgcolor="pink">
<td><strong>Billing Address</strong></td>
            <td> <strong>Shipping Details </strong></td>
          </tr>

<tr><td valign="top">Name : #form.x_first_name# &nbsp;#form.x_last_name#<br />
Address: #form.x_address1#<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#form.x_address2#<br />
City : #form.x_city#<br />
State : #form.x_state#<br />
Zip : #form.x_zip#<br />
Country : #form.x_country#<br />
Phone :#form.x_phoneno#<br />
Email :#form.x_email#<br /></td>
<td valign="top">
#form.x_ship_to_first_name# &nbsp;#form.x_ship_to_last_name#<br />
#form.x_ship_to_address1#<br />
#form.x_ship_to_address2#<br />
#form.x_ship_to_city#<br />
#form.x_ship_to_state#<br />
#form.x_ship_to_zip#<br />
#form.x_ship_to_country#
</td></tr>
</table>
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

</cfoutput>
</cfsavecontent>
	 <!----
	 <cfquery datasource="gemssql" >
			  update cartstatus set paymode='auth.net' where cartid = #invoiceid#
  </cfquery>
  
 --------------- further updates goes here------------------->
  

	  	
  <!--- where is this file??
	<cflocation addtoken="yes" url="authorizesuccess.cfm?trnx=#invoiceid#&transamt=#tamount#">
--->
<cfelse>

	<cfset err_mess =response_array[4]>
				        <cfmail to="anup@semiprecious.com" from="cs@semiprecious.com" subject=" #form.x_invoice_num# auth.net"  type="html">
   #err_mess#,<cfdump var='#form#' />
   </cfmail>
</cfif>
</cfif>

<cftry>
<cfset remove_rows = "" />
<cfset AOD = 0 />
<cfif isdefined("url.aodtest")>
	<cfset aod = 1>
</cfif>
<cfset aodtext = '' />
<cfset gift_value = 0 />
  <cfparam name="tpdiscount" default="0">
  <cfparam name="shipto" default="">
  <cfparam name="street1" default="">
  <cfparam name="street2" default="">
  <cfparam name="phonenumber" default="">
  <cfparam name="modtps" default="n">
  <cfparam name="city" default="">
  <cfparam name="state" default="">
  <cfparam name="ship_state" default="">
  <cfparam name="zip" default="">
  <cfparam name="form.email" default="">
  <cfparam name="country" default="">
  <cfparam name="admindiscount" default=0>
  <cfparam name="volumediscount" default=1>
  <cfparam name="loyalty_discount" default=0 type="numeric" >
  <cfparam name="bypassmin" default=1000>
  <cfparam name="minimum" default=50>
  <cfparam name="texas" default="">
  <cfparam name="note" default="">
  <cfparam name="form.note" default="">
  <cfparam name="shipwhen" default="48 hrs">
  <cfparam name="giftmsg" default="">
  <CFPARAM NAME="j" DEFAULT="">
  <CFPARAM NAME="qty" DEFAULT="0">
  <CFPARAM NAME="total" DEFAULT="0">
  <cfparam name="bags" default="no">
  <cfset salestax = 0 />
  <CFPARAM NAME="inrcost" DEFAULT="0">
  <cfif country neq "USA" and country neq "United States">
    <cfset nonUS = 0>
  </cfif>
  <cfset volumediscount = 1 />
  <cfset handlingcharges = 0.00>
  <cfset saletotal = 0>
  <!--- this has to be set then why use cfparam? this is aboviouslfy faster --->
  <!--- for tracking the cost in indian rupees, stored in cartstatus table --->
  <CFINCLUDE TEMPLATE="setup.cfm">
  <CFPARAM NAME="discount" DEFAULT="0">
  <CFPARAM NAME="amount" DEFAULT="0">
  <CFPARAM NAME="rcredit" DEFAULT="0">
  <cfparam name="noofsalesitem" default="0">
  <CFPARAM NAME="itemlist" DEFAULT="">
  <CFPARAM NAME="newearned" DEFAULT="0">
  <CFPARAM NAME="tcredit1" DEFAULT="0">
  <cfparam name="session.filter" default="salestatus=3">
  <CFPARAM NAME="tcredit" DEFAULT="0">
  <CFPARAM NAME="creditleft" DEFAULT="0">
  <cfparam name="form.specialhandling" Default=0 />
  <cfparam name="shipping" Default="0" />
  <CFPARAM NAME= "SpecialHandling" DEFAULT="#form.specialhandling#">
  <CFPARAM NAME= "GiftWrap" DEFAULT=0>
  <CFPARAM NAME= "couponcode" DEFAULT="">
  <CFPARAM NAME= "agentcode" DEFAULT="">
  <CFPARAM NAME= "coupon_saving" DEFAULT="0" type="numeric" />
  <CFPARAM NAME= "couponflag" DEFAULT="0" />
  <CFPARAM NAME= "coupon_msg" DEFAULT="" />
  <CFPARAM NAME= "nonUS" DEFAULT="0">
  <cfparam name="url.filter" default="">

<cfif agentcode contains 'AG'>
<cfset tpdiscount = 0.05>
      <cfset tpsale = 1>		</cfif>

  <cfif isdefined("form.subtotal")>
	  <cfif form.country neq "USA" and form.country neq "United States" and form.country neq "AU">
			<cfif len(session.bulkbuyer.id)>
				  <cfset shipping=14.99>
			<cfelse>
                     <cfif form.subtotal  GTE application.retail_free_shipping>
                                    <cfset shipping=4.99 />
                            <cfelse>
                                    <cfset shipping = 4.99 />
                        </cfif>
			</cfif>	
	  <cfelse>
			<cfif len(session.bulkbuyer.id)>
				  <cfset shipping=9.99>
			<cfelse>
                <cfif form.subtotal  GTE application.retail_free_shipping>
					  <cfset shipping=0 />
				  <cfelse>
					  <cfset shipping=4.99 />
				</cfif>
			</cfif>
	</cfif>
</cfif>
<cfset couponcode = trim(couponcode) />
 <cfif not len(session.bulkbuyer.id)> 
	<CFIF findnocase("credit",couponcode) >
    <cfquery  datasource="gemssql" name="credit">
		 Select creditcode from credit with (nolock) where creditcode ='#couponcode#'
		</cfquery>
    <cfif credit.recordcount NEQ 1>
      <h2>INVALID CREDIT COUPON, PLEASE GO BACK AND RE-ENTER CODE or email: cs@semiprecious.com</h2>
    </cfif>
    <cfelseif couponcode eq  '7q382y39p4' or couponcode contains  '7q382' >
      <cfset tpsale = 1>
      <!--- used to identify referral or third partsimy sales --->
      <cfset tpdiscount = 0.4+tpdiscount />
      <cfset couponflag=1>
      <cfset coupon_msg = '20% discount on "on sale" prices and 40% on regular prices' />
                <cfoutput><!-- here --></cfoutput>
	    <cfelseif len(couponcode)>
	 	   <cfset couponcode = trim(couponcode)>
    		<cfset dot =  find('.',couponcode)>
			<cfif dot eq len(couponcode)>
	              <cfset couponcode = left(couponcode,len(couponcode)-1)>
            </cfif>
            <cfquery  datasource="sptm" name="valid">
                    select max_value,code,discount from bulkbuyercoupons where 	   email = '#session.mail#' and code = '#couponcode#'and status = 'active' 
              </cfquery>
				<cfif valid.recordcount>
                      <cfset tpsale = 1>
                      <!--- used to identify referral or third party sales --->
                      <cfset tpdiscount = valid.discount/100>
                      <cfset couponflag=1>
                              
                      <cfset coupon_msg = 'Discount Coupon Used.' />
                  <cfelse>
                        <cfquery  datasource="sptm" name="valid">
                                    select status from bulkbuyercoupons where 	   email = '#session.mail#' and code = '#couponcode#'
                          </cfquery>
                          <cfif valid.recordcount>
                              <cfset coupon_msg = 'Your discount coupon is ' & valid.status & "."/>
                              <cfset couponflag = 1 />
                                <cfset tpsale = 1>
                                 <cfset tpdiscount = 0 />
                              
                          <cfelse>
		      			<cfhttp url="http://www.semiprecious.com/bo/giftcoupon/coupon.aspx?action=checks&couponcode=#urlencodedformat(couponcode)#" >
	
						<cfif listgetat(trim(cfhttp.filecontent),1) is "unused">
								<cfset gift_value = listgetat(trim(cfhttp.filecontent),2) />
                              <cfset coupon_msg = 'Congratulations! Your gift redeemed' />

						   <cfelseif listgetat(trim(cfhttp.filecontent),1) is "invalid" or listgetat(trim(cfhttp.filecontent),1) is "used">
						   	<cfset gift_value = -1 />
                              <cfset coupon_msg = 'Sorry the gift certificate provided (#couponcode#) is already used or is invalid' />

						   <cfelse>
                              <cfset coupon_msg = 'Not a valid coupon.' />
							</cfif>
                          
                          </cfif>
                              
                </cfif>
  </CFIF>
</cfif>
	  <cfif form.email contains '@' and ( (not len(session.mail)) or (session.bulkbuyer.id eq application.wholesale_guest))>
   		<cfset confirm_mail = form.email>
    		<cfquery datasource="gemssql" name="updatcart">
					update buyingrecord set email = '#confirm_mail#' where cartid = '#session.cartid#' 
	          </cfquery>
	          <cfif len(session.bulkbuyer.id)>
					  	<cfquery datasource="sptm" name="purchaserinfo">
					            SELECT * FROM bulkbuyers  WHERE email='#confirm_mail#' 
					    </cfquery>
						<cfif purchaserinfo.RecordCount>
							<cfset city = purchaserinfo.city />
							<cfset state = purchaserinfo.state />
							<cfset Street2 = purchaserinfo.address2 />
							<cfset zip = purchaserinfo.zip />
							<cfset Street1 = purchaserinfo.address />
							<cfset country = purchaserinfo.country />
							<cfset phonenumber = purchaserinfo.phoneno />
							<cfset shipto = purchaserinfo.name />
						</cfif>
			<cfelse>
			  	<cfquery datasource="gemssql" name="purchaserinfo">
			            SELECT * FROM memberinfo with (NOLOCK)  WHERE email='#confirm_mail#' 
			    </cfquery>
			  <!---  <cfif purchaserinfo.recordcount is 0>
			  	<cfquery datasource="sptm" name="purchaserinfo">
				              SELECT city, state, address2, address as address1, name as firstname, phoneno as phonenumber,country,zip FROM bulkbuyers  WHERE email='#confirm_mail#' 
				</cfquery>					  
			    </cfif>--->
				<cfif purchaserinfo.RecordCount>
					<cfset city = purchaserinfo.city />
					<cfset state = purchaserinfo.state />
					<cfset Street2 = purchaserinfo.address2 />
					<cfset zip = purchaserinfo.zip />
					<cfset Street1 = purchaserinfo.address1 />
					<cfset country = purchaserinfo.country />
					<cfset phonenumber = purchaserinfo.phonenumber />
					<cfset shipto = purchaserinfo.firstname />
				</cfif>
			</cfif>
	</cfif>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset www = "wholesale" />
    <cfelse>
    <cfset www = "www" />
  </cfif>
  <!---  <CFIF couponcode is "">
<CFSET couponcode = "afid">
<cfelse>
<cfset afid = couponcode>	
</cfif> --->
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
  <HTML>
  <HEAD>
  <TITLE>Select Secure Checkout to buy Jewelry or Bags</TITLE>
  <link rel="shortcut icon" href="/favicon.ico" />
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
      <script src="headhunting/js/jquery-1.5.min.js"></script>
	<script>
	 $(document).ready(function(){
	  $("div#err_box").hide();
	 $("select#x_country" ).change(
	 function()
	   {
	   $("input#check_country").val($(this).val());
	   }
	 
	 );
	 
	  $("input#authbutt" ).click(
	  function($e)
	  {
		return true;
	    $("div#err_box ul").html("") ;
      if ($("input#check_country").val() == "" )
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Billing Country Not Selected</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_city").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Billing City Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_state").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Billing State Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_ship_to_first_name").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Ship To First Name Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_ship_to_last_name").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Ship To Last Name Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_ship_to_city").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Ship To City Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_ship_to_state").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Ship To State Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
      if ($("input#x_first_name").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Billing First Name Not Provided</li>");
		   $("div#err_box").show("fast");
		  }
		  
      if ($("input#x_last_name").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>Billing Last Name Not Provided</li>");
		   $("div#err_box").show("fast");
		  }

	  if ($("input#clientcreditcard").val() == "")
		  {
	      $e.preventDefault();
          $("div#err_box ul").append("<li>No Credit Card Number Provided</li>");
		   $("div#err_box").show("fast");
		   }
     
	  
	  }
	  );
	$("span#close_err_box").click(
	function()
	{
      $("div#err_box ul").empty();
	  $("div#err_box").hide("fast");
	}
	);   
	
	 $('#sameas').click(
	  function(){
	    if( $('input#sameas:checked').val() == 'on')
			{	
                $('#x_ship_to_first_name').val(   $('#x_first_name').val());
				$('#x_ship_to_last_name').val (   $('#x_last_name').val());
				$('#x_ship_to_address1').val ( $('#x_address1').val());
				$('#x_ship_to_address2').val (    $('#x_address2').val());
				$('#x_ship_to_city').val  (    $('#x_city').val());
				$('#x_ship_to_state').val (   $('#x_state').val());
				$('#x_ship_to_zip').val (   $('#x_zip').val());
//				$('table#shipping').hide("slow");
         	}
			else
			{
	//			$('table#shipping').show("slow");

			}
		 }
	 );
	 }
	 );
	 </script>

  <script language="JavaScript" src="/js/global.js"></script>
  </HEAD>
  <!---onLoad="javascript:location.href='#grand_total';"--->
  <BODY  style="margin-top:0"  >
  <div align="center" id="container" >
  <div id="container1" style="width:930px">
  <CFINCLUDE TEMPLATE="/#session.country#/header.cfm">
  <cfset timestamp = Now() >
  <cfset couponcode = trim(couponcode)>
	<cflock    timeout = "0"   scope = "Session"       throwOnTimeout = "no"   type = "exclusive"> 
  <cfif  session.cartid GT 0 and cgi.HTTP_REFERER contains 'cart.cfm' >
			    <cfquery datasource="gemssql" name="confirmedstatuscheck">
						<!--- neq 'null' because in manual updates of status often cost is 0.00 and paymode moves to chck or pp --->
			            SELECT  buyer FROM cartstatus  with (NOLOCK) WHERE cost>0 and cartid = #session.cartid# 
			     </cfquery>
          <cfif confirmedstatuscheck.recordcount>
            <cfset session.confirmed_cartid = session.cartid />  
            <cfset session.cartid = 0 />
           <cflocation url="#session.cart#?country=#session.address.country_code#&cartid=#session.confirmed_cartid#&reloadmsg=reloaded1##checkout" addtoken="no" />--->
          </cfif>
    <cfelseif not isdefined("form.x_invoice_num")>
      	    <cfif isdefined("url.cartid")>
      	      <cfset c = url.cartid>
      	      <cfelseif isdefined("session.confirmed_cartid")>
      	      <cfset c = session.confirmed_cartid>
      	      <cfelse>
      	      <cfset c  = "">
      	    </cfif>
    <cflocation url="#session.cart#?country=#session.address.country_code#&cartid=#c#&reloadmsg=reloaded##checkout" addtoken="no" />
	<cfelse>
	<cfset session.cartid = form.x_invoice_num />
	<cfset amount = form.x_amount />
	 <table>
	 		<tr>
                      <td bgcolor="#FFFFFF" valign=top align="right" style="width:440px">
 <cfinclude template="/authorizenet/simtoembed.cfm" />
<cfset session.confirmed_cartid = session.cartid />

 <cfset session.cartid = 0 />
 </td><td>&nbsp;</td></tr>
 </table>
 </div>
</div>
<cfinclude template="mainfooter.cfm" />
 </body>
 </html>
 <cfabort />
  </cfif>
</cflock>
  <!--- session cartid  calculated --->
 <!--- deleted by anup <cfif not len(session.bulkbuyer.id)>
  	<cfquery datasource="gemssql" name="deletedata">
		Delete  from buyingrecord  where cartid= #session.cartid# and bought is null
	</cfquery>
   </cfif>--->
  <!--- now ascertain discount details ---> 
  <!--- is there a coupon code ---> 
  <!--- <cfif couponcode neq "">
      <cfquery datasource="sptm" username="nitish" password="rangeela" name="ws">
		  select discount , email from bulkbuyercoupons where code = '#couponcode#' 
	  </cfquery>
      <cfif ws.recordcount>
        <!--- is it tps --->
        <!--- <cfquery datasource="sptm" username="nitish" password="rangeela" name="wsdetails">
		    select membershipdate,status from bulkbuyers where id = '#ws.id#' 
	    </cfquery> --->
        <cfif 1 or (wsdetails.status and wsdetails.membershipdate GT Now())>
          <cfset tpsale = 1>
          <cfset tpdiscount = ws.discount/100>
          <cfset bbid = ws.id>
        </cfif>
      </cfif>
      <!--- is it tps/ not --->
    </cfif>
     ---><!--- Totals Table --->
</div>
  <table width="730px" id="container1" style="margin-top:8px;border-bottom:2px gray solid;" border="0" align="center" cellpadding="0" cel	lspacing="0" >
  <cftry >
    
    <!--- Loop over each item in cart --->
<cfset clr  = 1 />

    <cfif session.cartitem[1][1]>
	 <cfset Variables.itemcount = Arraylen(session.cartitem) />
      <cfloop index="k" to="1" from="#ArrayLen(session.cartitem)#" step="-1">
		<cfquery name="qprice" datasource="gemssql">
     SELECT      <cfif session.cartitem[k][5]>options.valueadd, options.description as optsdesc,</cfif> items.inventory, items.orderonrequest, cat, subcat + ' ' + cat  as description, basecost,price, saleprice, status,     wholesaleprice  FROM Items with (nolock) 
     <cfif session.cartitem[k][5]>, options with (nolock) </cfif>
     WHERE newitem=#session.cartitem[k][1]#      
	<cfif session.cartitem[k][5]> 
				and options.itemid = items.newitem and options.optionid = #session.cartitem[k][5]# 
	</cfif>
   </cfquery>
        
<cfflush  />    
<cfif clr>
    
<cfset clr = 0 />

		<cfelse>

    
<cfset clr = 1 />
		</cfif>
		<cfoutput query="qprice">
		    <cfset inventoryatsale = 1 />
       
			<cfif  (qprice.inventory LTE 0) and qprice.orderonrequest >
				 <cfset AOD = AOD + 1 />
			        <cfset inventoryatsale = -1 />
				<cfset aodtext ='
					<span style="background-color:white;color:red;border:0px red solid;padding:1px;">
					This design will be custom made against your order. This will take about 10 days and your cart will ship in about 3 weeks from Austin.</span>' />
					
				</cfif>
			<!---	<td>
					<img src="http://#session.tld#/images/#qprice.cat#/thumb/#session.cartitem[k][1]#.jpg" width="50px;">
			</td>--->
				<cfset aodtext = '' />
            <cfif isdefined("qprice.basecost") and qprice.basecost neq "">
              <cfif qprice.basecost>
                <cfset Variables.basecost = (Round((qprice.basecost*10)/application.exchangerate))/10>
                <cfelse>
                <cfset Variables.basecost = (round(3.5*qprice.price))/10>
              </cfif>
              <cfelse>
              <cfset Variables.basecost = (round(3.5*qprice.price))/10>
            </cfif>
            <cfif qprice.inventory or qprice.orderonrequest>
				  <cfif qprice.inventory LT session.cartitem[k][4] and not qprice.orderonrequest >
            	      <cfset session.cartitem[k][4] = qprice.inventory />
						<cfquery datasource="gemssql" name="updatcart">
								update buyingrecord set quantity = #session.cartitem[k][4]# where itemid = '#session.cartitem[k][1]#' and cartid = '#session.cartid#' and optionid = '#session.cartitem[k][5]#'
				           </cfquery>
				</cfif>
				  <cfset Variables.qty= session.cartitem[k][4]+ Variables.qty>
            <cfif isdefined("tpsale") and not len(session.bulkbuyer.id) and tpdiscount >
              <cfif qprice.status is 3 >
	                <cfset noofsalesitem = noofsalesitem + session.cartitem[k][4] />
					<cfif qprice.saleprice is "" or qprice.saleprice eq 0.00 > 
						  <cfset checkoutprice=0.8*qprice.price*(1-tpdiscount/2) >
                          <cfset coupon_saving = 0.8*qprice.price - checkoutprice +coupon_saving />
                      <cfelse>
						  <cfset checkoutPrice=decimalformat(qprice.saleprice*(1-tpdiscount/2)) >
                          <cfset coupon_saving = decimalformat(qprice.saleprice) - checkoutprice +coupon_saving />
                    </cfif>
                <cfelse>
                    <cfset checkoutprice = decimalformat((1-tpdiscount)*qprice.price)>
                    <cfset coupon_saving = decimalformat(qprice.price) - Variables.checkoutprice + Variables.coupon_saving />
              </cfif>
           <cfelseif len(session.bulkbuyer.id) >
              <cfset checkoutPrice=decimalformat(qprice.wholesaleprice) />
              <cfset session.cartitem[k][3] = checkoutPrice />
            <Cfelse>
	        	     <cfif qprice.status is 3 >
             			<cfset noofsalesitem = noofsalesitem + session.cartitem[k][4] />
            	        <cfset checkoutPrice= decimalformat(qprice.saleprice) />
							 <cfif qprice.saleprice is "" or qprice.saleprice eq 0.00 >
                                  <cfset checkoutprice=0.75*qprice.price >
                               </cfif>
	                      <cfelse>
				                <cfset checkoutprice=decimalformat(qprice.price) />
					   </cfif>
                   <cfset session.cartitem[k][3] = Variables.checkoutprice />
            </cfif>
            <cfset valueadd = 0>
            <cftry>
              <cfif session.cartitem[k][5]>
                <cfif len(session.bulkbuyer.id) >
                  <cfset valueadd = decimalformat(qprice.valueadd/2) />
                  <cfelse>
                  <cfset valueadd = decimalformat(qprice.valueadd) />
                </cfif>
                <cfset session.cartitem[k][3] = session.cartitem[k][3] + Variables.valueadd />
                <cfset checkoutprice = Variables.checkoutprice + Variables.valueadd>

              </cfif>
              <cfcatch type="expression">
                <!---             <cfdump var="#cfcatch#">  --->
                <cfset session.cartitem[k][5] = 0>
              </cfcatch>
            </cftry>
          <cfset inrcost =  Variables.basecost*session.cartitem[k][4] + inrcost>
        <cfset total= checkoutprice*session.cartitem[k][4] + Variables.total>
        <cfif qprice.status is 3>
          <cfset saletotal = Variables.saletotal + Variables.checkoutprice*session.cartitem[k][4] >
        </cfif>
        <cfif confirm_mail IS NOT "">
          <!---<CFSET newcredit=#evaluate(total*(1-discount/100)*0.10)#>
<CFSET #creditleft#=#tcredit1# - #rcredit#>
 from 15th sep the email field can be used for email actually , it was being used for cartid so far
will have to check the sideeffects. One is in itemsell.cfm which picks out cartid from emailid field ---> 
          <!--- increment session.cartid here --->
          <cfset subscriber = "member">
          <cfset emailtemp   = confirm_mail>
          <cfelse>	
          <cfset subscriber = "priority">
          <cfset emailtemp = 'na'>
        </cfif>
        <cfset approved = 0>
        <!--- for the query below, approved is used for shipped/not shipped, bought column is used to indicate status of  item when it was bought, the column  type is char --->
       	 <cfif not len(session.bulkbuyer.id)>
  		<!---	<cfinclude template="recorditem.cfm" /> --->
			  <cfquery datasource="gemssql" name="insertdata">
			    INSERT INTO buyingrecord(approved,cartid,email, itemid, quantity, affiliateID,datebought,optionid,rate,bought,inventoryatsale)       VALUES(0,#session.cartid#,'#emailtemp#',#session.cartitem[k][1]#, #session.cartitem[k][4]#,'#couponcode#',#timestamp#,#session.cartitem[k][5]#,#checkoutprice#,'#qprice.status#',#inventoryatsale#) 
		      </cfquery>
		  <cfelse>
			  <cfquery datasource="gemssql" name="insertdata">
			    update buyingrecord set inventoryatsale = #Variables.inventoryatsale# where cartid = #session.cartid# 
                           and optionid = #session.cartitem[k][5]# and itemid = #session.cartitem[k][1]#		      </cfquery>  

		  </cfif>
          <cfelse>
          <cfset remove_rows = listappend(remove_rows,k) />
        
           <cfset session.cartitem[k][4] = 0 /> <!--- cannot simply delete it as we are looping and array size will diminish --->
					<cfquery datasource="gemssql" name="updatcart">
				              delete from buyingrecord where itemid = #session.cartitem[k][1]# and cartid = #session.cartid# and optionid = #session.cartitem[k][5]#
				    </cfquery>
		  </cfif>
          </cfoutput>
       
      </cfloop>
		<cfif listlen(remove_rows)>
         <cfset counter = 0 />
          <cfloop list="#listsort(remove_rows,'numeric','asc')#"  index="kk">
			  <cfset kk = kk - counter />
			<cfset pop = arraydeleteat(session.cartitem,kk) />	
<!---      			  <cftry>
			<cfsilent>
            <cfinvoke method="additem" component="cartcontrol.cartmonitor" returnvariable="added"  >
            <cfinvokeargument name="quantity" value="0" />
            <cfinvokeargument name="newitem" value="#session.cartitem[kk][1]#" />
            <cfinvokeargument name="optionid" value="#session.cartitem[kk][5]#" />
            </cfinvoke>
            </cfsilent>
			<cfcatch type="any">
			<cfoutput>#cfcatch.Detail#</cfoutput>
            </cfcatch> 
            </cftry>
     --->   
		<cfset counter = counter + 1 />
          </cfloop>
      </cfif>
      <cfelse>
     <cflocation url="#session.cart#?country=#session.address.country_code#&rep=7" />
    </cfif>
    <!--- End loop over each item in cart ---> 
    <!---     <cfquery datasource="gemssql" name="indiaitems">
	select newitem from buyingrecord, items where items.newitem=buyingrecord.itemid and cartid=#session.cartid# and storage like 'IN-%'
	</cfquery>  <cfif bags is "yes">
  <cfset shipping = qty *4.99>
  <cfelse>---> 
    <!---  </cfif>---> 
    <cfoutput> 
      
      <!--- If there is a total amount --->
      <cfif total>
<cfif not len(shipping)>
<cfset shipping = 2.99 />
</cfif>
        <cfset shipping=shipping + SpecialHandling +  nonUS >
        <!--- Subtotal ---> 
        
        <!--- End Subtotal ---> 
        <!--- Shipping and Handling lines --->
        
		<cfif Giftwrap neq "0">
		      <cfset gw = "G">
		
			  <cftry>
					  <cfquery datasource="gemssql" >
						insert into giftmsg values (#Session.cartid#,'#giftmsg#', '#note#')
					</cfquery>
				<cfcatch type="any">
				        <cfmail to="cs@semiprecious.com" from="cs@semiprecious.com" subject="Gift cart "  type="html">
						#giftmsg# for cart #session.cartid#
		                </cfmail>
		
				</cfcatch>
				</cftry>
				    <tr>
		          <td colspan="4" style="padding:4px;font:16px;font-family:courier;border:red 2px dashed;color:black;">
					<a style="text-decoration:none;" name="payment">Msg with Gift</a>: <cfoutput>#giftmsg#</cfoutput></td>
		            <td  align="right" >Gift Wrap:</td>
		            <td align="right"><strong>Yes</strong>	<!--- value beign added and shown as shipping #format(GiftWrap)# ---></td>
		        </tr>
      <cfelse>
		      <cfset gw = "">
				    <tr>
		          <td colspan="6" style="padding:4px">
       <a style="text-decoration:none;" name="payment">&nbsp;</a></td></tr> </cfif>
        
		<cfif session.bulkbuyer.id eq "" and not isdefined("url.save")>
          <cfif texas neq "">
            <tr>
              <td colspan="5" align="right" ><cfset salestax = texas />
Sales Tax:</td>
              <td align="right" >#dollarformat(texas)#</td>
            </tr>
          </cfif>
          <cfif GiftWrap GT 0>
            <cfset shipping=shipping + GiftWrap >
          </cfif>
          <cfif texas neq "">
            <cfset shipping = texas + shipping />
          </cfif>
        </cfif>
        
        <!--- End shipping and handling line --->
      </cfif>
      <!--- End if there is a total amount
        <tr  >
          <td colspan="5" align="center" ><strong>Credits</strong></td>
        </tr> --->
      <cfset discountvalue = 0>
    </cfoutput>
    <cfif Specialhandling eq "1.00">
      <cfset sh = "P">
      <cfelseif Specialhandling GT "7.00">
      <cfset sh = "E">
      <cfelseif Specialhandling GT "15.00">
      <cfset sh = "F">
      <cfelseif Specialhandling GT "25.00">
      <cfset sh = "R">
      <cfelse>
      <cfset sh = "">
    </cfif>
    <!--- Save giftwrap message --->
        <cfset amount = evaluate(total*(1-discount/100)-rcredit+shipping)>
    <cfif isdefined("session.giftid")>
      <cfif session.giftamt GT 0>
        <!--- no shipping --->
        <cfset amount = amount - session.giftamt>
        <cfset session.giftamt = 0>
        <cfif amount LTE 0>
          <cfset amount = 0>
        </cfif>
        <cfset shipping = 'gift'>
        <cfset couponcode = session.giftid>
        <tr>
          <td colspan="6" align="center" class="headerfontsmall">GIFT AMOUNT REDUCED 
            FROM TOTAL. GIFTID NOT VALID IN FUTURE.<br>
            If you wish to shop more using the same giftid you must <a href="havegiftcoupon.cfm">re-validate</a> the certificate.<br>
            If not then please make balance payment <strong>if any</strong> and 
            mail us the giftid and this cartid.</td>
        </tr>
      </cfif>
    </cfif>
    <cfif session.bulkbuyer.id neq "" and not isdefined("url.save")>
	      <cfif bypassmin lt session.bulkbuyer.minamt>
			<cfset minimum= bypassmin>
         <cfelse>
	        <cfset minimum = session.bulkbuyer.minamt >
	      </cfif>
      <!--- was set at bulkbuyerlogin.cfm --->
      <cfset sh = specialhandling />
      <cfif   amount Lt 0.99*minimum>
        <!--- <script language="JavaScript">
alert("For whole sale purchase pse make purchases of atleast $200 (after discount) before you can check out.");
</script> --->
        <cfset wholefault =1 >
        <cfelse>
        <tr>
          <td colspan="6" align="right"  ><cfset bbdf = 0 />
            <cfif amount GT 1999>
              <div  class="green_band_ticked">
              <cfset bbdf = (100 - session.bulkbuyer.twothousanddiscount)/100  />
              Volume Discount of <cfoutput>#session.bulkbuyer.twothousanddiscount#</cfoutput>% Applied
			  </div>
              <cfelseif amount GT 999>
              <div  class="green_band_ticked">
              <cfset bbdf = (100 - session.bulkbuyer.thousanddiscount)/100  />
              Volume Discount  of <cfoutput>#session.bulkbuyer.thousanddiscount#</cfoutput>% Applied
			  </div>
              <cfelseif amount GT 499>
              <div  class="green_band_ticked">
              <cfset bbdf = (100 - session.bulkbuyer.fivehundreddiscount)/100  />
              Volume discount of <cfoutput>#session.bulkbuyer.fivehundreddiscount#</cfoutput>% Applied
    			  </div>

              </cfif>
					  <cfif amount GT 299>
			                <div  class="green_band" style="padding-bottom:4px">
				<cfoutput>
			    <cfif amount GT 1450> Shop for  #format(2000)# get #session.bulkbuyer.twothousanddiscount#% off 
				   <cfelseif amount GT 740> Shop for  #format(1000)# get #session.bulkbuyer.thousanddiscount#% off  
					  <cfelseif amount GT 299>
					 Shop for  #format(500)# get #session.bulkbuyer.fivehundreddiscount#% off
				  </cfif>
				  </cfoutput>
	    	    </div>
				</cfif>
    	
        <cfif bbdf >
          <cfset amount = bbdf*(amount-shipping) />
          <cfset coupon_saving = coupon_saving + amount*(1-bbdf)/bbdf />
          <cfset amount = amount + shipping />
          <cfquery datasource="gemssql" name="insertdata">
                	update buyingrecord set rate = #bbdf#*rate where cartid = #session.cartid# 
                </cfquery>
        </cfif>
        </td>
        </tr>
        <cfset amount = amount + handlingcharges>
      </cfif>
      <cfelse>
      <tr align="center" >
      <cfif (len(confirm_mail) and not isdefined("url.save")  and not isdefined("tpsale")) or len(session.bulkbuyer.id)  >
        <td colspan=5 align="right"  >Items Total:</td>
        <td align="right"><cfoutput>#format(evaluate(total+coupon_saving))#</cfoutput></td>
        </tr>
        <cfif coupon_saving GT 0 and (not Len(session.bulkbuyer.id)) and not isdefined("tpsale")>
          <tr class="" >
            <td colspan=5 align=right><cfoutput>#couponcode# #coupon_msg#</cfoutput>.  <!--Your Loyalty Points <strong>Not</strong> Reduced. 
              
              | Total --> Discount :</td>
            <td align="center" class="error1"><cfoutput>#format(coupon_saving)#</cfoutput></td>
          </tr>
          <cfelseif confirm_mail is session.mail and not len(session.bulkbuyer.id) and session.loyalty_points> <!--- set in cart page and login page --->
           <tr>
          <td colspan=5 align="right" > <cfoutput>#coupon_msg#</cfoutput>
	       <font color="maroon">Loyalty Discount:</font></td>
          <td align="right"><cftry>
              <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q">
              <cfinvokeargument name="mail" value="#confirm_mail#" />
              </cfinvoke>
              <cfcatch type="any">
                <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Here Could not reverse "  type="html">
                  #cfcatch.detail#, #cfcatch.message# for #confirm_mail#,
                </cfmail>
                <!--- 	<cfoutput>#cfcatch.detail#, #cfcatch.message# for #confirm_mail#
			</cfoutput> 
			 --->
              </cfcatch>
            </cftry>
            <cfif total><cfinvoke component="invitationandcredit" method="usecredit" returnvariable="reducedtotal" >
              <cfinvokeargument name="amounttopay" value="#total#">
              <cfinvokeargument name="saleitemamount" value="#saletotal#">
              <cfinvokeargument name="finalize" value="#session.cartid#">
              <!--- a non zero value will finalize but if it is an existing cartid it will only show credit used for that cartid , that not just compute but reduced from total credit available .  Plus using cartid helps us see if the cart is new or old , if old then what credit was used , that is then used again with out reducing from total ---> 
              </cfinvoke>
              <cfelse>
              <cfset reducedtotal = total />
            </cfif>
            </font>
            <cfset loyalty_discount = total - reducedtotal />
			 <cfset bbdf = reducedtotal/total />
            <cfset coupon_saving = loyalty_discount />
            <cfset amount = reducedtotal + shipping/>
        
            <!--- out here now reduce the rate entered for each item in the database --->
			</td>
          </tr> 
		</cfif>
      
      </cfif>
   
    </cfif>
    <cfset amountpayable = amount>
    <cfif isdefined("wholefault")>
      <cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
      <cfinvokeargument name="cartid" value="#session.cartid#">
      <cfinvokeargument name="costprice" value="#inrcost#">
      <cfinvokeargument name="cost" value="#amount#">
      <cfinvokeargument name="tps" value="n">
      <cfinvokeargument name="timestamp" value="#timestamp#">
      <cfinvokeargument name="couponcode" value="wsalefault">
      <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
      <cfinvokeargument name="tqty" value="#qty#">
      <cfinvokeargument name="shipping" value="#shipping#|#nonUS#|#sh#|#GW#|">
      </cfinvoke>
      <tr >
        <td colspan="1" align="center" valign="middle" >&nbsp;</td>
        <td colspan="4" align="center" valign="middle" style="padding:2px;background-color:#FFE4EC;border:2px solid #A50A25;color:#A50A25;font-size:2em;" > Wholesale purchase requires minimum order of <cfoutput>#format(minimum)#. <a href="#session.gallery#?#session.filter#" class="gray_url">Click Here to Shop for More Stuff</a></cfoutput>&nbsp;
          If you wish to shop less then please visit <a href=http://www.semiprecious.com>www.semiprecious.com</a>.     &nbsp;</td>
        <td colspan="1" align="center" valign="middle" >&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6">&nbsp;</td>
      </tr>
      <tr>
        <td  colspan="6"><font face="Arial, Helvetica, sans-serif" size="+1">To shop for less than the minimum wholesale amount you may switch to retail mode and make purchases at retail prices. <a href="/switchtoretailmode.cfm" class="side_link">Click here to switch and go to gallery</a></font> .</td>
      </tr>
      </table>
      <cfelse>
      <cfif isdefined("tpsale")>
        <!---       <cfquery datasource="sptm" username="nitish" password="rangeela" >
		    delete from thirdpartysales where id = '#bbid#' and cartid ='#session.cartid#' 
	    </cfquery>
          
          <!--- used for putting y/n into cartstatus table --->
          <cfquery datasource="sptm" username="nitish" password="rangeela" >
    insert into thirdpartysales (id,cartid,amtrcvd,discount,coupon,shipping) values 
    ('#bbid#','#session.cartid#',#amount#, #evaluate("100*tpdiscount")#,'#couponcode#',#shipping# 
    ) 
    </cfquery>
     --->
        <cfset modtps = 'y'>
        <cfelse>
        <cfset modtps = 'n'>
      </cfif>
      <cfoutput>
        <cfif ((coupon_saving and (not loyalty_discount) and couponflag)  and isdefined("tpsale") ) or len(session.bulkbuyer.id) >
          <tr class="" >
            <td colspan="5" align="right">Items Total:</td>
            <td align="right">#format(evaluate(coupon_saving+amount-shipping))#</td>
          </tr>
          <cfif coupon_saving>
            <tr class="" >
              <td colspan="5" align="right">#coupon_msg#. Your Total Savings/Discount:</td>
              <td align="center" class="error1" style="text-align:right;">#format(coupon_saving)#</td>
            </tr>
          </cfif>
		  <cfelseif gift_value GT 0>
		     <cfset topay = amount - shipping />
		  	    <cfif gift_value GT topay>
			      <cfset gift_value = topay >
			   </cfif>
			   <cfset topay = topay - gift_value />
               <cfset bbdf = topay/(topay+gift_value) />
			
			<cfset amount = topay + shipping />
				  <cfquery datasource="gemssql" >
                	update buyingrecord set rate = #bbdf#*rate where cartid = #session.cartid# 
                </cfquery>
              
		      <tr class="" >
              <td colspan="5" class="error1" align="right">#coupon_msg#. Gift Value:</td>
              <td align="center" class="error1" style="text-align:right;">#format(gift_value)#</td>
            </tr>
			 <cfelseif gift_value LT 0 and cgi.server_name does not contain 'laptop'>
		
		      <tr class="" >
              <td colspan="5" class="error1" align="right">#coupon_msg#. </td>
              <td align="center" class="error1" style="text-align:right;">&nbsp;</td>
            </tr>
        </cfif>
        <tr class="" >
          <td colspan="5" align="right">Final Items Total:</td>
          <td align="right">#format(amount-shipping)#</td>
        </tr>
        <tr>
          <td colspan="5" align="right" >Shipping &amp; Handling:</td>
          <td align="right">#format(shipping)#</td>
        </tr>
        
        <!--- Grand total line --->
        <tr  class="" >
          <td  colspan="5" align='right' class="tableheader1" style="padding:5px;"><cfif application.live_support and 0 >
              <div style="display:inline;border:1px ridge ##0A0 ;margin-top:4px;padding:2px 4px" align=center> <a class="login_link" onClick="open_live_support()" href="javascript://"><img style="text-decoration:none;" src="/images/callus.png" height="20px" VALIGN="center" border=0 />&nbsp;<span style="position:relative;bottom:4px">Online Help</span></a> </div>
            </cfif>
            <cfif confirm_mail is application.admin_email>
              <cfset amount=amount  -admindiscount>
            </cfif>
            <font size="+1" color="gray">Grand total:</font></td>
          <td align="right" style="padding:1px;border:1px 0 1px 0 solid gray"><strong>#format(amount)#</strong></td>
        </tr>
        <!--- End grand total line --->
        </table>
        
        <!--- End totals table ---> 
      </cfoutput>
      <cfif Giftwrap neq "0">
        <cfset gw = "G">
        <cfelse>
        <cfset gw = "">
      </cfif>
      <cfif isdefined("url.save")>
        <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q"> </cfinvoke>
        <div align="center">
          <div style="width:740px;text-align:center;font-size:12px;">
            <div style="width:738px;text-align:center;background-color:#666600;color:white;"> Your Cart Contents have been Saved. </div>
            <cfif len(confirm_mail) and confirm_mail contains '@' >
              <cfset mailto = confirm_mail>
              <cfmail bcc="nitish@semiprecious.com" to="#mailto#" failto="nitish@semiprecious.com" from="service@semiprecious.com" subject="Shop later at semiprecious.com"  type="html">
                Your cart contents have been saved with the cartid #session.cartid#. Please use the <a href="http://www.semiprecious.com/fillcart.cfm?cartid=#session.cartid#">activate 
                cart</a> link given on the home page to continue this shopping. And you 
                can do this from any computer any place! [Link is http://www.semiprecious.com/fillcart.cfm]<br>
                Thankyou.<br>
                - Sales Team, Semiprecious.com <br>
                <strong> Note:</strong> Saving of cart does not imply protection against 
                price revisions and stock non-availability on your return. Semiprecious.com 
                assures you of excellent quality, price and service.
              </cfmail>
              <div align="left">Details of cart saved and instructions for activating it have been mailed to you. </div>
              <cfelse>
              Help instructions could not be mailed to you.  If you are registered and logged     in the system would e-mail you the cartid and instructions.
            </cfif>
            <div class="noticebox" align="justify">
            <cfoutput> <strong> Please note the saved cartid: #session.cartid#. </strong><br>
              <ul>
                <li> To continue this shopping later you can <br>
                  Use the <a href="http://www.semiprecious.com/fillcart.cfm">activate   cart</a> link given on the right side of home page<br>
                  http://www.semiprecious.com/fillcart.cfm?cartid=#session.cartid# </li>
                <li class="details"> To continue with this shopping  right now click <a href="gemstone_jewelry_gallery.cfm?#session.filter#">here</a> </li>
                <li class="details">To make payment please specify the basic shipping instructions <a href="cart.cfm">here</a></li>
              </ul>
              <strong>Note: </strong>Saving of cart does not protect against price revisions 
              and stock non-availability when you return to shop
              </div>
            </cfoutput></div>
        </div>
        <cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
        <cfinvokeargument name="cartid" value="#session.cartid#">
        <cfinvokeargument name="costprice" value="#inrcost#">
        <cfinvokeargument name="cost" value="#amount#">
        <cfinvokeargument name="tps" value="#modtps#">
        <cfinvokeargument name="timestamp" value="#timestamp#">
        <cfinvokeargument name="couponcode" value="saved">
        <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
        <cfinvokeargument name="tqty" value="#qty#">
        <cfinvokeargument name="shipping" value="#shipping#|#nonUS#|#sh#|#GW#|#AOD#">
        </cfinvoke>
        <cfelse>
        <cftry>
          <cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
          <cfinvokeargument name="cartid" value="#session.cartid#">
          <cfinvokeargument name="costprice" value="#inrcost#">
          <cfinvokeargument name="cost" value="#amount#">
          <cfinvokeargument name="tps" value="#modtps#">
          <cfinvokeargument name="timestamp" value="#timestamp#">
          <cfinvokeargument name="couponcode" value="#couponcode#">
          <cfinvokeargument name="saving" value="#coupon_saving#">
          <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
          <cfinvokeargument name="tqty" value="#qty#">
          <cfinvokeargument name="shipping" value="#shipping#|#nonUS#|#sh#|#GW#|#AOD#">
          </cfinvoke>
          <cfcatch type="any">
            <cfmail cc="nitish@semiprecious.com" to="anup@semiprecious.com"  subject="Error at confirmation" from="cs@semiprecious.com">
              #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message# ----- (tell tale sign)[credit for #session.cartid#?]
              <CFIF ISDEFINED("FORM")>
                <CFDUMP VAR="#FORM#" />
              </CFIF>
              #CFCATCH.TYPE#
            </cfmail>
          </cfcatch>
        </cftry>
        <!--- Only one checkout for handmadelaptopcase --->
        <cfif cgi.server_name contains 'handmadelaptopcase'>
          <form action="https://www.eProcessingNetwork.Com/cgi-bin/wo/order.pl" method="post">
            <input type="hidden" name="ItemQty" value="1">
            <input type="hidden" name="ItemDesc" value="invoice/CartID:<cfoutput>#session.cartid#</cfoutput>">
            <input type="hidden" name="ItemCost" value="<cfoutput>#amount#</cfoutput>">
            <input type="submit" value="Standard Checkout">
            <input type="hidden" name="ePNAccount" value="0409369">
            <input type="hidden" name="ReturnToURL" value="http://www.handmadelaptopcase.com">
            <input type="hidden" name="BackgroundColor" value="White">
            <input type="hidden" name="TextColor" value="Black">
          </form>
          <cfset session.amount=amount>
          <!--- Display multiple checkout methods --->
          <cfelse>
          <table width="730px;"  align="center"		border="0" style="background-color:white;" cellspacing="0" cellpadding="0">
            <cfif session.affil eq "share">
              <tr>
                <td align="center" style="background-color:#DDD"><div ><font size="" color="#000099"><a name="grand_total" style="text-decoration:none;"><strong>Pay Below</strong></a></font> or <cfoutput><a href="#session.filter#&em=#confirm_mail#&dest=shop" >Continue Shopping</a></cfoutput> &nbsp;</div></td>
              </tr>
              <tr>
                <td  height="20"  align="center" class="greenbutton"><img src="/images/secure_lock_2.gif" width="16" height="17" style="display:inline;" border="0" vspace="0" hspace="0" align="absmiddle"> <b> Most Secure &amp; Best CREDIT CARD PAYMENT SYSTEM </b></td>
              </tr>
              <tr>
                <td align="center" bgcolor="#FFFFFF" class="row2b">
				
				<table style="margin:auto" width="90%" border="0" cellpadding="0" >
                    <tr>
                      <td bgcolor="#FFFFFF" align="center">
	    <!--- this does not work if server time is not giving correct conversion to UTC. So check GMT time and tehc conversion that the code is giving. Adjust server time manually to cater for the difference --->
							<cfinclude template="/authorizenet/simtoembed.cfm" />
						</td>
                      <cfset session.amount=amount>
                    </tr>
                  </table>
				</td>
              </tr>
              <cfelse>
              
              <!---   <tr>
                  <td  height="20"  align="center" class="greenbutton"><img src="images/secure_lock_2.gif" width="16" height="17" style="display:inline;" border="0" vspace="0" hspace="0" align="absmiddle"> <b> MOST SECURE AND BEST CREDIT CARD PAYMENT SYSTEMS </b></td>
                </tr>--->
              <tr>
                <td align="center" bgcolor="#FFFFFF" >
						<div style="position:relative;">
		<!---		<cfif AOD>
			        <div id="aodnote" 
	           style="padding:4px;border:2px dashed orange;background:white;position:absolute;text-align:left;top:1px;left:10px;width:99%; height: 254px;">
            <br />
            In your cart were one or more items that will made after the order is placed  
           While other items will ship within 1 to 2 days, Made on Order will reach you in maximum of 3 weeks separately.
					  Please click on the button below to acknowledge the extended time to ship. Any expedited shipping options selected will only be applied to in stock items, not to Make on Order items<br />
           
                              <div align="center" class="action_button" style="padding-top:4px;color:white;float:right;margin-top:30px;width:480px;" onClick="document.getElementById('aodnote').style.display='none';">  
								              I have read the &#39;Make On Order&#39; delayed shipment information
								</div>
		        </div>
				</cfif>--->
						
				  <table    border="0" cellpadding="0" >
                    <tr>
                      <td align=right valign=top  >
<span style="margin:auto;width:740px">Your Cart ID is: <cfoutput> <b> #session.cartid# </b> <br>You can access it any time from:</span><br>
                          #cgi.SERVER_NAME#/myorder </cfoutput></td><td>&nbsp;</td></tr>
                    <tr>
                      <td style="margin:auto;width:720px" align=left valign=top colspan="2">
					  <ul class="arrow_ul">
                          <li><h3><a style="text-decoration:none;" name="payment"><b>Enter credit card below</b> or use paypal by clicking here:                         
                        <cfoutput>  <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post"  style="display:inline;">
                            <input type="hidden" name="cmd" value="_xclick">
                            <cfif cgi.server_name neq "www.ornamentscollect.com">
                              <input type="hidden" name="business" value="anup@semiprecious.com">
                              <cfelse>
                              <input type="hidden" name="business" value="lizzy@ornamentscollect.com">
                            </cfif>
                            <input type="hidden" name="currency_code" value="USD">
                            <input type="hidden" name="item_name" value='#session.cartid##sh##Gw#' />
							<input type="hidden" name="invoice" value='#session.cartid#' />
							
                            <input type="hidden" name="amount" value='#decimalformat(amount)#'>
                            <input width="70px" type="image" src="https://www.semiprecious.com/images/paypal_logo.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                            <!--- Newly added variables--Start --->
                            <input type="hidden" name="custom" value="#session.cartid#">
                            <!--- Newly added variables--End --->
                          </form></cfoutput>
</h3>
							 <!---As a security feature authorize.net button is <span style="color:red">valid for next 3 minutes</span> only.---> </li>
                        </ul></td>
                    </tr>
						  <tr>
                      <td valign=top align="right" style="width:480px">
 <cfinclude template="/authorizenet/simtoembed.cfm" />
 </td><td>&nbsp;</td></tr><tr><td>
            <cfset session.amount=amount>
<p><br><p>
                        <b><font color=#3333FF><p>MORE PAYMENT OPTIONS BELOW:</font></b>
             
<!---
                       <p style="font-weight:bold;">Easy Installment Plan</p>
                        
                        <cfif  session.bulkbuyer.id eq "" and not (cgi.server_name contains "wholesale")>
		                        	<cfif amount GTE application.arb_amount >
		                            (Enter Valid Phone Number on next page)<br />
		                            <form name="ARB" action="https://www.semiprecious.com/ARB/form_arb_create.php" method="post" style="display:inline;">
		                              <input type="image" src="/ARB/images/ARB_button.gif" border="0" name="submit" alt="Pay in Installments" width="137" height="24">
		                              <cfoutput>
		                                <input type="hidden" name="fullName" value="#Shipto#">
		                                <input type="hidden" name="address" value="#Street1# #Street2#">
		                                <input type="hidden" name="city" value="#City#">
		                                <input type="hidden" name="state" value="#State#">
		                                <input type="hidden" name="zip" value="#zip#">
		                                <input type="hidden" name="country" value="#country#" />
		                                <input type="hidden" name="phonenumber" value="#phonenumber#" />
		                                <input type="hidden" name="email" value="#confirm_mail#">
		                                <input type="hidden" name="amount" value="#decimalformat(amount)#" />
		                                <input type="hidden" name="invoiceNumber" value="#session.cartid#">
		                                <input type="hidden" name="cart" value="#SerializeURLData(session.cartitem)#" />
		                              </cfoutput>
		                            </form>
		                            <cfelse>
		                            <span class="error1">Not available.<br />
		                            </span>Available for purchases above <cfoutput>#format(application.arb_amount)#</cfoutput>
		                          </cfif>  --->
           <!---               <cfelseif not (session.bulkbuyer.id contains 'guest')>
	                          <cfif amount GTE application.bulkbuyer.arb_minamt >
		    	                        (Enter Valid Phone Number on next page) <br />
		                            <form name="ARB" action="https://www.semiprecious.com/ARB/form_arb_create.php" method="post" style="display:inline;">
		                              <input type="image" src="/ARB/images/ARB_button.gif" border="0" name="submit" alt="Pay in Installments" width="137" height="24">
		                              <cfoutput>
		                                <input type="hidden" name="fullName" value="#Shipto#">
		                                <input type="hidden" name="address" value="#Street1# #Street2#">
		                                <input type="hidden" name="city" value="#City#">
		                                <input type="hidden" name="state" value="#State#">
		                                <input type="hidden" name="zip" value="#zip#" />
		                                <input type="hidden" name="phonenumber" value="#phonenumber#">
		                                <input type="hidden" name="country" value="#country#">
		                                <input type="hidden" name="email" value="#confirm_mail#">
		                                <input type="hidden" name="amount" value="#decimalformat(amount)#">
		                                <input type="hidden" name="invoiceNumber" value="#session.cartid#">
		                                <input type="hidden" name="cart" value="#SerializeURLData(session.cartitem)#">
		                              </cfoutput>
		                            </form>
                            <cfelse>
		                            <span class="error1">Not available.<br />
		                            </span>Available for verified wholesale buyers and <br />
		                            for purchases above <cfoutput>#format(application.bulkbuyer.arb_minamt)#</cfoutput>
                          </cfif>
                          <cfelse>
                          Email Validation &amp; Minimum Purchase Required
                        </cfif>
				--->
                      &nbsp;
                        <p> Pay Through Paypal (Takes Checks Also)
                        <cfoutput>
                          <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post"  style="display:inline;">
                            <input type="hidden" name="cmd" value="_xclick">
                            <cfif cgi.server_name neq "www.ornamentscollect.com">
                              <input type="hidden" name="business" value="anup@semiprecious.com">
                              <cfelse>
                              <input type="hidden" name="business" value="lizzy@ornamentscollect.com">
                            </cfif>
                            <input type="hidden" name="currency_code" value="USD">
                            <input type="hidden" name="item_name" value='#session.cartid##sh##Gw#' />
							<input type="hidden" name="invoice" value='#session.cartid#' />
							
                            <input type="hidden" name="amount" value='#decimalformat(amount)#'>
                            <input width="150px" type="image" src="https://www.semiprecious.com/images/paypal_logo.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                            <!--- Newly added variables--Start --->
                            <input type="hidden" name="custom" value="#session.cartid#">
                            <!--- Newly added variables--End --->
                          </form>
                          <p> 		
													<!---  <cfset GoogleCart =  createObject("component","googleCheckOut/GoogleCheckout")>
								#googleCart.CreateForm()#--->
                        </cfoutput></td><td>&nbsp;</td>
                    </tr>
                  </table>
				 </div>
					</td>
              </tr>
            </cfif>
            <tr>
              <td align="center" class="greenbutton">Any questions or concerns? Please <a href="CONtactus.cfm">Contact us</a>. </td>
            </tr>
            <tr>
              <td align="center" ><cfinclude template="/mainfooter.cfm" /></td>
            </tr>
          </table>
        </cfif>
        
        <!--moved up by Anup--->
        <cfquery datasource="gemssql" >
		delete from purchase where cartid = '#session.cartid#'
</cfquery>
        <cfset session.confirmed_cartid = session.cartid />
        <CFQUERY DATASOURCE="gemssql" >
insert into purchase (ship,cartid,  firstname, address1,  city, state,zip, country,email) 
values (0,'#session.cartid#','#shipTo#','#street1# #street2#',
'#city#', '#state#', '#zip#','#country#','#confirm_mail#' )
		update cartstatus set buyer = '#confirm_mail#', agentcode='#agentcode#' where cartid  = '#session.cartid#'
	</cfquery>
        
        <!--moved up by Anup--->
        
        <cfset session.cartid = 0 />
        
        <!--- now the cartid will not increase on refresh but otherwise it will ---> 
        <!--- handmade --->
      </cfif>
    </cfif>
    <cfcatch type="any">
      <cfmail to="anup@semiprecious.com"  subject="Error at confirmation" from="cs@semiprecious.com">
        #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message# [credit for #session.cartid#?]
        <CFIF ISDEFINED("FORM")>
          <CFDUMP VAR="#FORM#" />
		  <cfelse>
		  <CFDUMP VAR="#session#" />
		  
        </CFIF>
    	<cfdump var="#cfcatch.tagcontext#" />
      </cfmail>
      <cfif cfcatch.detail contains 'deadlock'>
line 1424       <!--- <cflocation url="#session.cart#?country=#session.address.country_code#&msg=svrload"   />--->
      </cfif>
      <hr />

      <div class="error1" style="width:800px;">An Error Occured while processing your request. This message comes up in most   cases because the session was timed out for security reasons. This happens when 
        the site sees no activity from your side for a long time. Rarely the session   also expires because of server restarts. Whatever be the reason, we are sorry 
        for the inconvenience caused.<span class="side_link"><a href="cart.cfm"> Please Try again</a></span> <br />
        If the error persists you may  call 1-512 589 9009 or email cs@semiprecious.com. 
        We will take order over the phone. <br />
      </div>
      <hr />
      <cfrethrow />
    </cfcatch>
  </cftry>
  
  <!---
<img src="https://www.pricegrabber.com/conversion.php?retid=10080">
--->
  <script language="javascript1.1" >
  <!--
 //branch for native XMLHtpRequest ojbect
//alert('i called successfully');
var req;
function processReqChange()
{
	return;
}
<cfoutput>
<cftry>
 var url = '/cartcontrol/cartmonitor.cfc?method=testconfirm&cartid=#session.confirmed_cartid#';
<cfcatch type="any"></cfcatch></cftry> </cfoutput>
 
 if (window.XMLHttpRequest) {
//alert('i called successfully');
  req = new XMLHttpRequest();
  req.onreadystatechange = processReqChange;
  req.open("GET",url,true);
  req.send(null); 
 }
 else if ( window.ActiveXObject) {
  	req = new ActiveXObject("Microsoft.XMLHTTP");
	if (req) {
			 //alert(url);
			// req.onreadystatechange = processReqChange;
			 req.open("GET",url,true);
			 req.send();
	         } 
  		   }
 
  //-->
  </script>
  </body>
  </html>
  <CFCATCH TYPE="any">
    
<!---    <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Confirmation page "  type="html"> --->
      <cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput>
	<cfdump var='#cfcatch.TagContext[1]#'>

	  <!---
    </cfmail> --->
    <!--- the message to display --->
    An error occured in connecting to the DB due to heavy traffic. Please reload the cart page to continue shopping.
	
  </CFCATCH>
</cftry>
</cflock>
<cffunction
	name="SerializeURLData"
	access="public"
	returntype="string"
	output="false"
	hint="Serializes the given data using WDDX. Optionally encodes for URL.">
  
  <!--- Define arguments. --->
  <cfargument
		name="Data"
		type="any"
		required="true"
		hint="ColdFusion struct or array data."
		/>
  <cfargument
		name="Encode"
		type="boolean"
		required="false"
		default="true"
		hint="Flag for URL encoded format."
		/>
  
  <!--- Create local scope. --->
  <cfset var LOCAL = StructNew() />
  
  <!---
		Serialize the data using WDDX. This will convert the
		ColdFusion data into WDDX standards XML data.
	--->
  <cfwddx
		action="CFML2WDDX"
		input="#ARGUMENTS.Data#"
		output="LOCAL.WDDXData"
		usetimezoneinfo="false"
		/>
  
  <!---
		Check to see if we are encoding the data for URL.
		If do this here, then the user has to be carful NOT
		to run URLEncodedFormat() on the returned data
		(that would be like double-escaping it).
	--->
  <cfif ARGUMENTS.Encode>
    
    <!--- Return the encoded data. --->
    <cfreturn URLEncodedFormat(
			LOCAL.WDDXData
			) />
    <cfelse>
    
    <!--- Return the data as-is. --->
    <cfreturn LOCAL.WDDXData />
  </cfif>
</cffunction>