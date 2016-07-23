<html>
<head>
<title>Thank you for shopping with Semiprecious.com or its associated sites</title>


<cflocation addtoken="no" url="/cartcontrol/cartmonitor.cfc?method=emptycart&next_visual=index.cfm?msg=pp" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">
</head>
<cfparam default="notfound" name="ship_name">
<cfparam name="payment"  default="na" type="string" />
<cfparam name="ship_state"  default="" type="string" />
<cfparam name="billing_name" default=" " type="string" />
<cfparam name="ship_zip" default="0000" type="string" />
<cfparam name="phonenumber" default="" />
<cfparam name="payment_status" default="" />
<cfparam name="txn_id" default="" />

<cfset store = '#session.tld#' />
<cfset email = ""  />
<cfset subscribe = 1 /> 
<!--- since in paypal we do not get buyer and shipping address separately we do not subscribe the buyer in case it is a gift. 
Because we then have the=shippers address but only the buyers email --->
<body topmargin="0">
<!---<cfinclude template="header.cfm">--->
<cftry>
   <cfparam default="0" name="session.cartid">
		<CFSET session.cartitem=ArrayNew(2)  />
		<Cfset session.cartitem[1][1] = 0  />
		<Cfset session.cartitem[1][4] = 0  />
		<Cfset session.cartitem[1][2] = 0  />
		<Cfset session.cartitem[1][3] = 0  />
		<Cfset session.cartitem[1][5] = 0  />

		<cfset session.totalqty = 0 />
		<cfset session.grandtotal = 0 />
		

<p><font size="+2">T</font><strong>hank</strong> you for shopping with us.Your   transaction through paypal has been completed, and a receipt for your purchase 
  has been emailed to you. </p>
<p>If you are a paypal member you may log into your account at <a href="http://www.paypal.com" target="image">www.paypal.com</a> 
  to view details of this transaction. </p>
<cfif isdefined("url.tx") and session.cartid neq 0>
	  <cfparam default="" name="phone" />
  <cftry>
   <!---<cfhttp method="get" url="http://www.semiprecious.com/pdt.cfm" throwonerror="no" >--->
   <cfhttp method="post" url="https://www.paypal.com/cgi-bin/webscr" throwonerror="no" >
	  <cfhttpparam name="at" value="0986t69kHjXFWGts0sZl1SNutf_U52hcayT4_AMAg-sVvHGGk_SM7p6ERaC"  type="formfield">
	  <cfhttpparam name="tx" value="#url.tx#" type="formfield">
	  <cfhttpparam name="cmd" value="_notify-synch" type="formfield">
  </cfhttp>

 <cfset pdt = trim(cfhttp.FileContent)>
<cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com"    subject="payment paypal" >
<cfif isdefined("pdt")>http response:
	<cfdump var="#pdt#" />
</cfif>
</cfmail>
<cfset billing_name= "" />
<cfset billing_last_name= "" />
<cfset billing_first_name= "" />
<cfset ship_state = "-" />
  <cfloop list="#pdt#" delimiters="#chr(13)##chr(10)#" index="j">
  <cftry>
    <cfif listfind(j,'address_name','=')>
	  <cfset ship_name =   urldecode(listgetat(j,2,'='))>
	<cfelseif listfind(j,'last_name','=')>
 		 <cfset billing_first_name =  urldecode(listgetat(j,2,'='))>
  		<cfset buyer_name = billing_name /> <!--- required by subscribebuyer.cfm --->
 	<cfelseif listfind(j,'first_name','=')>
 		  <cfset billing_last_name = urldecode(listgetat(j,2,'='))>
  		<cfset buyer_name = billing_name /> <!--- required by subscribebuyer.cfm --->
  <cfelseif listfind(j,'address_country','=')>
	  <cfset ship_country = urldecode(listgetat(j,2,'='))>
<cfelseif listfind(j,'residence_country','=')>
		  <cfset country = country & urldecode(listgetat(j,2,'='))>
      <cfelseif listfind(j,'address_street','=')>
		  <cfset  ship_street_address = urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'address_zip','=')>
		  <cfset  ship_zip = listgetat(j,2,'=')>
  <cfelseif listfind(j,'address_state','=')>
		  <cfset  ship_state = urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'address_city','=')>
		  <cfset  ship_city = urldecode(listgetat(j,2,'='))>
  <cfelseif listfind(j,'invoice','=')>
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
		   <cfset cart_id = replace(cart_id,'F','')>
      <cfelseif listfind(j,'payer_email','=')>
		  <cfset  email= urldecode(listgetat(j,2,'='))>
	  <cfelseif listfind(j,'payer_phone','=')>
		  <cfset  phonenumber= urldecode(listgetat(j,2,'='))>
	  <cfelseif listfind(j,'payment_gross','=')>
		  <cfset  payment= urldecode(listgetat(j,2,'='))>
	  <cfelseif listfind(j,'payment_status','=')>
		  <cfset  payment_status= urldecode(listgetat(j,2,'='))>
  	  <cfelseif listfind(j,'txn_id','=')>
		  <cfset  txn_id= urldecode(listgetat(j,2,'='))>
	  </cfif>
  <cfcatch type="any">
  <cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com,anup@semiprecious.com"    subject="pdt paypal ERROR" >
ERROR 1  , paypal rurl
#cfcatch.Detail# #cfcatch.Message# #j#
  </cfmail>
    </cfcatch>
  </cftry>
  </cfloop>
  
 <cfif not len(phonenumber)>
	 <Cfset phonenumber = 'NA'>
 </cfif>
 <cfsilent>
 <cfinvoke component="cartcontrol.cartmonitor"  method="setbuyeremail">
	<cfinvokeargument name="cartid" value="#cart_id#">
	<cfinvokeargument name="overwrite" value="yes">
	<cfinvokeargument name="email" value="#email#">
</cfinvoke>
<cfif payment_status is "Completed">
    <cfinvoke  component="cartcontrol.cartmonitor" method="updatecart" returnvariable="updateresult">
		     <cfinvokeargument name="cartid" value="#cart_id#"/>
			 <cfinvokeargument name="txnid" value="#txn_id#"/>
		     <cfinvokeargument name="mode" value="pp" />
		</cfinvoke>
<cfelse>

	<cfmail  to="anup@semiprecious.com" from="cs@semiprecious.com" subject="Paypal order not completed" >
		Will require manual update on completion, you may make a note in your tasks:<br />
		
		cartid : #cart_id#.
		May happen automatically by IPN.
	</cfmail>

	<cftry>

	<cfhttp throwonerror="yes" timeout="200" method="get" url="http://www.semiprecious.com/bo/Tasks/addTask.aspx?method=addTask&action=anup&tby=system&mainsubject=#cart_id#&subject=PP+TXN+manual+update&details=#urlencodedformat('http://www.semiprecious.com/itemsell.cfm?cartid=#cart_id#')#&ender=a" />

	<cfcatch type="any">
		<cfmail  to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Paypal order not completed error" >
		<cfdump var="#cfcatch#" />
        </cfmail>
	</cfcatch>

	</cftry>

</cfif>
		</cfsilent>
<!---<cfinvoke component="cartcontrol.cartmonitor" method="setpaymode" returnvariable="flag" >
	<cfinvokeargument name="cartid" value="#cart_id#">
	<cfinvokeargument name="paymode" value="pp">
</cfinvoke>
<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
	<cfinvokeargument name="cartid" value="#cart_id#">
</cfinvoke>
--->

<!---   <cfinclude template="parse_paypalcustomerdata">
  <cfmail to="nitish@semiprecious.com" cc="nitish@semiprecious.com" server="Mail23" subject="paypal" from="service@semiprecious.com" >
   #cart_id# / #payment#
    #cfhttp.FileContent#
</cfmail>
 --->

<cftry>
	<cfinvoke component="invitationandcredit"  method="buyer_type" returnvariable="flag" >
		<cfinvokeargument  name="buyer_email" value="#email#" />
	</cfinvoke>
<cfif flag is 'none'>
<cfinvoke component="cartcontrol.cartmonitor" method="addpurchase" returnvariable="result" >
		<cfinvokeargument name="cartid" value="#cart_id#">
		<cfinvokeargument name="email" value="#email#">
		<cfinvokeargument name="billingname" value="#billing_first_name# #billing_last_name#">
		<cfinvokeargument name="billingphone" value="#phonenumber#">
		<cfinvokeargument name="shippingname" value="#ship_name#">
		<cfinvokeargument name="shippingaddress" value="#ship_street_address#">
		<cfinvokeargument name="shippingcity" value="#ship_city#">
		<cfinvokeargument name="shippingstate" value="#ship_state#">
		<cfinvokeargument name="shippingzip" value="#ship_zip#">
		<cfinvokeargument name="shippingcountry" value="#ship_country#">
</cfinvoke>
			<cfset subscribe_type = '' />
			<cfset store = 'semiprecious.com'>
			<cfquery datasource="gemssql" name="buyer_type">
   				select couponcode  from cartstatus  where cartid = #cart_id#
  			</cfquery>
			<cfif buyer_type.couponcode is 'regwsale'>
				<cfset subscribe_type = 'wholesale' />
					<cfset store = 'semipreciouswholesale.com'>
				<cfelseif buyer_type.couponcode is 'india'>
				 <cfset store = 'semiprecious.in'>
			</cfif>
			
	   
	<cfinvoke component="invitationandcredit" method="SIGNUP" returnvariable="signedup" >
  			<CFINVOKEARGUMENT VALUE="#phonenumber#" name="phonenumber"   />
			<CFINVOKEARGUMENT  value="#country#" name="buyer_country"    />
			<CFINVOKEARGUMENT name="cartid" VALUE="#cart_id#"  />
			<CFINVOKEARGUMENT value="#email#" name="buyer_email"    />
			<CFINVOKEARGUMENT  name="status" value="1"    />
			<CFINVOKEARGUMENT value="#billing_first_name# #billing_last_name#" name="buyer_first_name"  />
			<CFINVOKEARGUMENT value="#billing_last_name#" name="buyer_last_name"    />
			<cfinvokeargument name="subscribe_type" value="#subscribe_type#" />
	</cfinvoke>
</cfif> 
  
			<cfcatch type="any">
		<cfmail  to="nitish@semiprecious.com,anup@semiprecious.com" from="cs@semiprecious.com" subject="PPRURL relay Order Packed" >
	#cfcatch.detail#,#cfcatch.message#
	</cfmail>
	<cfoutput>
	The top of this following page link will show the status of your cart : 
	<font color="##800000">http://www.#store#/itemsell.cfm?cartid=#cart_id#</font></cfoutput>
	
	</cfcatch>
	</cftry>


You can  use this url any time to know the status of your cart : <cfoutput><font color="##800000">
<a href=http://www.semiprecious.com/itemsell.cfm?cartid=#cart_id#>http://www.semiprecious.com/itemsell.cfm?cartid=#cart_id#</a></font>
</cfoutput>
<cfcatch type="any">  
<cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com,anup@semiprecious.com"  subject="pdt paypal ERROR" >
ERROR 
#cfcatch.Detail# #cfcatch.Message# <cfif isdefined("cfcatch.sql")>#cfcatch.sql#</cfif>
  </cfmail></cfcatch> 
Thank you for shopping at Semiprecious.com.<br />

  Your Order Received. 
   </cftry>
  <cfelse>
Thank you for shopping at Semiprecious.com.<br />
 Your order has been  marked for processing. 
<!---<cfmail from="service@semiprecious.com" timeout="30" to="anup@semiprecious.com" cc="nitish@semiprecious.com" server="mail23"  subject="pdt" >
 CAPTURING PDT  CHECK TIME OF MAIL TO SEE WHICH CART SHOULD HAVE BEEN PAID FOR BUT DID NOT GET UPDATED
  </cfmail>
 this part of the the cfif is called twice after once of the previous part --->
  </cfif>
 <hr>

     <cfset session.cartid = "0">
	 <cfif isdefined("foi")>
	 <script language="JavaScript">
	
 		location = "http://www.forcesofindia.com/headhunting/switch.cfc?method=action&controlvariable=signupforminvited&employer=corporate"; 

	 </script>
	 </cfif>
	 <cfcatch type="any">
	 <div align=center>
	 Your Order Received. Thank you for shopping at semiprecious.com.
	 </div>
<cfmail from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com,anup@semiprecious.com"   subject="pdt paypal ERROR" >
<cfif isdefined("pdt")>
<cfdump var="#pdt#" />
</cfif>
None#cfcatch.detail#
</cfmail>
	 </cfcatch>
</cftry>
</body>
</html>
