<cfcomponent name="cfgoogleCheckOut" displayname="CFGoogleCheckOut" hint="Create checkout carts using the Google CheckOut API">
<!--- 
*******************************************************************************
 Copyright (C) 2006 Scott Pinkston
  
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
  
      http://www.apache.org/licenses/LICENSE-2.0
  
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*******************************************************************************

Component: cfgooglecheckOut
Created By: Scott Pinkston (spinkston@ozarka.edu)
Creation Date: 6/29/2006
Description:


Requirements:
cf_hmac module



		
http://www.adobe.com/cfusion/exchange/index.cfm?view=sn131&extID=1003921
Tim McCarthy (tim@timmcc.com)

 --->
	
	<!--- enter your merchantkey & ID (found on the ) --->
	
<cfset variables.Merchantkey = "o92f7R3tKc5WeJEAOqe-YA" />
	<cfset variables.MerchantID = "405161742452052" />
	
	<!--- change to live url when finished testing --->
	
	<cfset variables.g_url = "https://checkout.google.com/cws/v2/Merchant/">
	
<!---<cfset variables.g_url = "https://sandbox.google.com/cws/v2/Merchant/">

--->
	<cfset variables.ContinueURL = "http://www.semiprecious.com" />

	<cfset variables.EditCartURL = "http://www.semiprecious.com/confirmation.cfm" />


	<cffunction name="GetMerchantKey" output="false" returntype="string" description="returns the merchant Key for checkout">
		<cfreturn variables.MerchantKey>
	
</cffunction>


	<cffunction name="GetMerchantID" output="false" returntype="string" description="returns the merchantID">
		<cfreturn variables.MerchantID>
	</cffunction>

	<cffunction name="GetHttpAUTH" output="false" returntype="string" description="returns the encoded AUTH key for basic user authentication">
		<cfset var strCredential = getMerchantID() & ":" & getMerchantKey()>
		<cfreturn toBase64(strCredential)>
	</cffunction>
	
	<cffunction name="init" access="public" description="Initialize the object">
		<cfset var str = "">
		<cfreturn str>	
	</cffunction>

	<cffunction name="CreateCartXML" output="false" returntype="string" description="Creates the xml for google checkout">
		<cfargument name="CustNumber" required="false" type="string" default="">	

		<cfset var CartXMLHeader = "">
		<cfset var CartXMLItems = "">
		<cfset var CartXMLfooter = "">
		<Cfset var CartXML = "">
		
		<cfset var CartItems = GetCartItems()>

		<cfoutput>
		<cfsavecontent variable="cartXMLHeader">
		<?xml version="1.0" encoding="UTF-8"?>
		<checkout-shopping-cart xmlns="http://checkout.google.com/schema/2">
		 
 <shopping-cart>
		    <items>
		</cfsavecontent>

		
<cfsavecontent variable="cartXMLItems">
		
<cfloop query="cartItems">
	      <item>
        	<item-name>#itemName#</item-name>
	   	    <item-description>#itemDesc#</item-description>
        	<unit-price currency="USD">#itemPrice#</unit-price>
	        <quantity>#itemQuantity#</quantity>
	      </item>
		</cfloop>
		</cfsavecontent>

		<cfsavecontent variable="cartXMLFooter">
		    </items>
		 	<merchant-private-data>
					<merchant-note>#arguments.CustNumber#</merchant-note>
		 	</merchant-private-data> 
		  </shopping-cart>
		  <checkout-flow-support>
		    <merchant-checkout-flow-support/>
			   	<edit-cart-url>#Variables.EditCartURL#</edit-cart-url>
				<continue-shopping-url>#Variables.ContinueURL#</continue-shopping-url>
		  </checkout-flow-support>

		</checkout-shopping-cart>
		</cfsavecontent>	
	
	</cfoutput>
		<cfset cartXMLData = cartXMLheader & cartXMLItems & cartXMLFooter>
		<cfreturn cartXMLData>
		
	</cffunction>
	
	
<cffunction name="GetCartItems" returntype="query" output="false" description="Gets the list of cart items">
		<cfset var cartitems = "">
	
<Cfset var temp = "">
		
		
<!--- Replace this with real data --->



<cfset cartitems = QueryNew("itemName,itemDesc,itemPrice,itemquantity")>
		
	
		
			<cfset temp = QuerySetCell(cartitems, "itemName", "CartID:", 1)>
		
			<cfset temp = QuerySetCell(cartitems, "itemDesc", "Total Payment for Semiprecious.com Cart", 1)>
	
			<cfset temp = QuerySetCell(cartitems, "itemPrice", "34", 1)>
	
			<cfset temp = QuerySetCell(cartitems, "itemQuantity", "1", 1)>



 	<cfreturn cartitems>
		
	
</cffunction>
	
	


<cffunction name="HMAC_SHA1" output="false" description="Creates the HMAC_SHA1 encrypted cart & key" returntype="string">
		<cfargument name="cartXML" required="true" type="string">

		<!--- call the module cf_hmac --->	
		<cf_hmac key="#getMerchantKey()#" data="#Arguments.cartXML#" hash_function="sha1">
			
		<cfreturn toBase64(BinaryDecode(digest, "hex"))>
	</cffunction>
	
	<cffunction name="CreateForm" output="false" description="Creates the form & submit button" returntype="string">
		<cfargument name="CustNumber" required="false" type="string" default="">	
		<cfset var cartXML = CreateCartXML(custNumber=arguments.custNumber)>
		<cfset var signature = HMAC_SHA1(cartXML)>
		<cfset var g_form = "">
		
		<cfoutput>
		<cfsavecontent variable="g_form">
		<form action="#variables.g_url##GetMerchantID()#/checkout" method="post">
		  <input type="hidden" name="cart" value="#toBase64(cartXML)#">
		  <input type="hidden" name="signature" value="#signature#">
		  <input type="image" name="Google Checkout" alt="Fast checkout through Google" src="http://checkout.google.com/buttons/checkout.gif?merchant_id=#GetMerchantID()#&w=180&h=46&style=white&variant=text&loc=en_US" height="46" width="180">
		</form>
		</cfsavecontent>
		</cfoutput>
		
		<cfreturn g_form>
	</cffunction>	
		
</cfcomponent>	
