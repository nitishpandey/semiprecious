<!--- <cfif isdefined("cart_order_id")>
<cfset cart_id = cart_order_id>
</cfif> --->
<CFPARAM name="cart_id" default="1111">
<CFPARAM name="order_number" default="NA">
<CFPARAM name="card_holder_name" default="NA">
<cfparam name="email" default="NA">
<CFPARAM name="ship_name" default="#card_holder_name#">
<CFPARAM name="updateinventory" default="Yes">
<CFPARAM name="street_address" default="NA">
<CFPARAM name="ship_street_address" default="#street_address#">
<CFPARAM name="city" default="NA">

<CFPARAM name="ship_city" default="#city#">
<CFPARAM name="state" default="NA">
<CFPARAM name="ship_state" default="#state#">
<CFPARAM name="zip" default="NA">
<CFPARAM name="ship_zip" default="#zip#">
<CFPARAM name="country" default="NA">
<CFPARAM name="ship_country" default="#country#">
<cfset cart_id = replace(cart_id,'G','')>
    <cfset cart_id = replace(cart_id,'O','')>
 <cfset cart_id = replace(cart_id,'P','')>
 
<cfmail subject="2co"  from="service@semiprecious.com" to="anup@semiprecious.com" cc="nitish@semiprecious.com" server="mail23.webcontrolcenter.com" >
#cart_id#
</cfmail>

<!---
<cfif updateinventory is "yes">
<CFQUERY DATASOURCE="semiprecious" NAME="updateinvent">
update items set inventory=inventor-quantity where items.newitem=buyingrecord.itemid*1 and email='#cart_id#'
</cfquery>
<cfset updateinventory="">
</cfif>
--->


<head>
<title>Thank you for shopping at Semiprecious.com / Cheap-jewelry.com</title>
</head>
<body bgcolor='white' topmargin="1" style="border:2px ridge #DADA99;margin:4px;color:#668866">
<br>
  <cfif isdefined("session.gifter")>
  <cfif session.gifter eq 1>
  <cfset session.gifter = 0>
 Your friend  can redeem the gift SP-DEC-<cfoutput>#cart_id#</cfoutput> (The number is the semiprecious.com cartid) using the '<em>Gift Certificate</em>' link on home page. <br>
Also we expect the billing and shipping addresses to be different for the purchase to qualify as a 'Gift'.<br>
    Thankyou. 
    <cfabort />
</cfif>
</cfif>
Purchase Payment Completed through 2Checkout Secure Payment Gateway.<br />
 You can use this url any time to know the status of your cart : <cfoutput><font color="##800000">http://www.semiprecious.com/cartview.cfm?cartid=#cart_id#</font></cfoutput> 
<p>&nbsp;</p> 
Thankyou for shopping with Semiprecious.com.
<br /> Do call or write in in case of any clarification/suggestions or requests. We would be most glad to here from you.
<cftry>
<cfquery datasource="semiprecious" >
  update cartstatus set paymode='2co' where cartid = #cart_id#
  </cfquery>
    <CFQUERY DATASOURCE="semiprecious" NAME="updateinvent">
        update items, buyingrecord set items.lastbought=#now()#, items.totalqtysold= 
        items.totalqtysold + buyingrecord.quantity, items.inventory=items.inventory- buyingrecord.quantity 
        where  buyingrecord.cartid=#cart_id#  and items.newitem=buyingrecord.itemid*1 
        </cfquery>
		<cftry>
<CFQUERY DATASOURCE="semiprecious" NAME="addPurchase">
insert into purchase (email, cartid, firstname, address1, city, state, country) values ('#cart_id#/#email#','#cart_id#', '#ship_name#','#ship_street_address#', 
'#ship_city#',  '#Ship_state#' & ' ' & '#ship_zip#', '#ship_country#')
</cfquery>
<cfcatch type="database"><!--- Will happen if the cartid shipping address already entered. ---></cfcatch></cftry>





<cfcatch type="any">
Following Error Occured while updating payment status.
<Cfoutput>#cfcatch.Detail#, #cfcatch.Message#</Cfoutput><br>
The error will not effect your purchase in any manner. However, we would like to avoid the annoying error. We would appreciate if
you could inform us of the above error so that our technical team can resolve it. <br>
Sorry for the inconvenience.
</cfcatch>
</cftry><cfinclude template="subscribebuyer.cfm">

<hr> <cfif isdefined("session.cartid")>
	<cfset session.cartid = 0>
</cfif>

<cfinclude template="googleads.htm">
  <cfinclude template="footer.htm">
</body>
</html>
