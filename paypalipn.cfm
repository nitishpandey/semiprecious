<html>
<head>
<title>Thankyou for shopping with Semiprecious.com</title>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>
<cfparam default="notfound" name="ship_name">
<cfparam name="payment"  default="na" type="string" />
<cfparam name="ship_state"  default="" type="string" />
<cfparam name="ship_zip"  default="" type="string" />
<cfparam name="billing_name" default=" " type="string" />
<cfparam name="phonenumber" default="" />
<cfset email = "" />

<cfset subscribe = 1 /> <!-- since in paypal we do not get buyer and shipping address separately we do not subscribe the buyer in case it is a gift. Because we then have the
shippers address but only the buyers' email --->
<body topmargin="0">
<cfinclude template="header.cfm">
<cfparam default="0" name="session.cartid">
<p><font size="+2">T</font><strong>hank</strong> you for shopping with us.Your   transaction through paypal has been completed, and a receipt for your purchase 
  has been emailed to you. </p>
<p>If you are a paypal member you may log into your account at <a href="http://www.paypal.com" target="image">www.paypal.com</a> 
  to view details of this transaction . </p>
  <cfif isdefined("url.tx") and session.cartid neq 0>
  <cfparam default="" name="phone" />
  <cftry>
   <cfhttp method="get" url="http://www.semiprecious.com/pdt.cfm" throwonerror="no" >
   <cfhttp method="post" url="https://www.paypal.com/cgi-bin/webscr" throwonerror="no" >
  <cfhttpparam name="at" value="0986t69kHjXFWGts0sZl1SNutf_U52hcayT4_AMAg-sVvHGGk_SM7p6ERaC"  type="formfield">
  <cfhttpparam name="tx" value="#url.tx#" type="formfield">
  <cfhttpparam name="cmd" value="_notify-synch" type="formfield">
  </cfhttp>
  <cfset pdt = trim(cfhttp.FileContent)>
  <cfloop list="#pdt#" delimiters="#chr(13)##chr(10)#" index="j">
  <cftry>
    <cfif listfind(j,'address_name','=')>
  <cfset ship_name =   urldecode(listgetat(j,2,'='))>
<cfelseif listfind(j,'first_name','=')>
  <cfset billing_name = urldecode(listgetat(j,2,'='))>
  <cfset buyer_name = billing_name /> <!--- required by subscribebuyer.cfm --->
  <cfelseif listfind(j,'address_country','=')>
  <cfset ship_country = urldecode(listgetat(j,2,'='))>

     <!---    <cfif listfind(j,'residence_country','=')>
  <cfset country = country & urldecode(listgetat(j,2,'='))>
  </cfif> --->
      <cfelseif listfind(j,'address_street','=')>
  <cfset  ship_street_address = urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'address_zip','=')>
  <cfset  ship_zip = listgetat(j,2,'=')>
  <cfelseif listfind(j,'address_state','=')>
  <cfset  ship_state = urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'address_city','=')>
  <cfset  ship_city = urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'item_name','=')>
  <cfset  cart_id= urldecode(listgetat(j,2,'='))>
  <Cfif cart_id is 'foihh' >
<cfset foi = 1 />
</cfif>
  <cfif findnocase('g',cart_id)>
  <!---- because in case of a gift order the adress being conveyed to us by paypal is not necessarily that of the buyer . But can we subscribe a buyer without a postal address? --->
  <cfset subscribe = 0 >
  </cfif>
     <cfset cart_id = replace(cart_id,'G','')>
      <cfset cart_id = replace(cart_id,'O','')>
       <cfset cart_id = replace(cart_id,'P','')>
       <cfset cart_id = replace(cart_id,'D','')>
        <cfelseif listfind(j,'payer_email','=')>
  <cfset  email= urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'payer_phone','=')>
  <cfset  phonenumber= urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'payment_gross','=')>
  <cfset  payment= urldecode(listgetat(j,2,'='))>
  </cfif>
  <cfcatch type="any">
    </cfcatch>
  </cftry>
  </cfloop>
  
<cfinvoke component="cartcontrol.cartmonitor" method="setpaymode" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#cart_id#">
<cfinvokeargument name="paymode" value="pp">
</cfinvoke>
<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#cart_id#">
</cfinvoke>
 <cfif not len(phonenumber)>
 <Cfset phonenumber = 'NA'>
 </cfif>
 <cfinvoke component="cartcontrol.cartmonitor"  method="setbuyeremail">
<cfinvokeargument name="cartid" value="#cart_id#">
<cfinvokeargument name="overwrite" value="no">
<cfinvokeargument name="email" value="#email#">
</cfinvoke>

<cfinvoke component="cartcontrol.cartmonitor" method="addpurchase" returnvariable="result" >
	<cfinvokeargument name="cartid" value="#cart_id#">
	<cfinvokeargument name="email" value="#email#">
	<cfinvokeargument name="shippingname" value="#ship_name#">
	<cfinvokeargument name="billingname" value="#billing_name#">
	<cfinvokeargument name="shippingaddress" value="#ship_street_address#">
	<cfinvokeargument name="shippingcity" value="#ship_city#">
	<cfinvokeargument name="shippingstate" value="#ship_state#">
	<cfinvokeargument name="shippingzip" value="#ship_zip#">
	<cfinvokeargument name="billingphone" value="#phonenumber#">
	<cfinvokeargument name="shippingcountry" value="#ship_country#">
</cfinvoke>
<!---   <cfinclude template="parse_paypalcustomerdata">
  <cfmail to="nitish@semiprecious.com" cc="nitish@semiprecious.com" server="Mail23" subject="paypal" from="service@semiprecious.com" >
   #cart_id# / #payment#
    #cfhttp.FileContent#
</cfmail>
 --->

<cfif subscribe >

<cfset buyer_street_address  = ship_street_address />
<cfset buyer_city =  ship_city />
<cfset buyer_state =  ship_state />
<cfset buyer_zip =  ship_zip />
<cfset buyer_country =  ship_country />
<cfinclude template="subscribebuyer.cfm" />
</cfif>
You can  use this url any time to know the status of your cart : <cfoutput><font color="##800000">http://www.semiprecious.com/cartview.cfm?cartid=#cart_id#</font></cfoutput>
<cfcatch type="any">  
<cfmail from="service@semiprecious.com" timeout="30" to="anup@semiprecious.com" cc="nitish@semiprecious.com"   subject="pdt ERROR" >
ERROR WHILE CAPTURING PDT #cfcatch.Detail# #cfcatch.Message#
  </cfmail></cfcatch>  </cftry>
  <cfelse>
Payment recieved.  Your Order  marked for processing. 
<!---<cfmail from="service@semiprecious.com" timeout="30" to="anup@semiprecious.com" cc="nitish@semiprecious.com" server="mail23"  subject="pdt" >
 CAPTURING PDT  CHECK TIME OF MAIL TO SEE WHICH CART SHOULD HAVE BEEN PAID FOR BUT DID NOT GET UPDATED
  </cfmail>
 this part of the the cfif is called twice after once of the previous part --->
  </cfif>
 <hr>
 <cfinclude template="googleads.htm">
  <cfinclude template="footer.htm">
     <cfset session.cartid = "0">
	 <cfif isdefined("foi")>
	 <script language="JavaScript">
	
 location = "http://www.forcesofindia.com/headhunting/switch.cfc?method=action&controlvariable=signupforminvited&employer=corporate"; 

	 </script>
	 </cfif>
</body>
</html>
