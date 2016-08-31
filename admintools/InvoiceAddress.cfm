<cftry>
<cfparam name=shipto default="">

<h3>change/adding shipping address for cartid  <cfoutput>#cartid#</cfoutput></h3> 

<cfif shipto is "">
<cfif isdefined("form.copy_from_cart")>
  <cfquery name="getAddress" datasource="gemssql">
	  Select firstname, address1,address2,city,[state],[zip],[country],[email], [phonenumber] from purchase where cartid='#form.copy_from_cart#'
  </cfquery>  
<cfelse>
<cfquery name="getAddress" datasource="gemssql">
Select firstname, address1,address2,city,[state],[zip],[country],[email], [phonenumber] from purchase where cartid='#cartid#'
</cfquery>  

</CFIF>
<form name=shipio action="invoiceaddress.cfm" method=post>
<cfoutput>
Copy from cart: <input type="text" name="copy_from_cart" value="#cartid#" />
<input type="hidden" name="cartid" value="#cartid#" />
</cfoutput>
<input type="submit" />
</form>
<form name=shipinfo action="invoiceaddress.cfm" method=post>
<table><tr>
 <td  align="right"> Ship To: </td><td  align="left"><input name="Shipto" value="<cfoutput>#getaddress.firstname#</cfoutput>" size=30></td></tr>
 <tr>
 <td  align="right"x> Address Line1:</td><td  align="left"> <input name="Street1" value="<cfoutput>#getaddress.address1#</cfoutput>" size=40></td></tr><tr>
 <td  align="right"> Address Line2: </td><td  align="left"><input name="Street2" value="<cfoutput>#getaddress.address2#</cfoutput>" size=40></td></tr><tr>
 <td  align="right"> City: </td><td  align="left"><input name="City" value="<cfoutput>#getaddress.city#</cfoutput>" size=15>
  &nbsp;&nbsp;State: <input name="State" value="<cfoutput>#getaddress.state#</cfoutput>" size=10></td></tr><tr>
 <td  align="right"> ZIP/PIN-CODE: </td><td  align="left"><input name="zip" value="<cfoutput>#getaddress.zip#</cfoutput>" size=11>&nbsp;
  Country: <input name="country" value="<cfoutput>#getaddress.country#</cfoutput>" size=10></td></tr>
  
 <tr><td  align="right"> email: </td><td  align="left"><input name="email" value="<cfoutput>#getaddress.email#</cfoutput>" size=25>&nbsp;
 </td></tr>
  <tr><td  align="right"> Phone no. </td><td  align="left"><input name="phonenumber" value="<cfoutput>#getaddress.phonenumber#</cfoutput>" size=8>&nbsp;
 </td></tr>
  <tr><td  align="right">Comments:</td><td  align="left"><input name="comments" value="" size=60>&nbsp;
 </td></tr>
 </table>
 <input type=hidden name='cartid' value=<cfoutput>'#cartid#'</cfoutput>>
 <input type="submit" value="UPDATE">
</form>
<cfelse>
 <cfoutput>#cartid#</cfoutput>

<cfquery name="shipaddress" datasource="gemssql">
update purchase set [firstname]='#shipto#',[address1]='#street1#' 
      ,[address2]='#street2#'
      ,[city]='#city#'
      ,[state]='#state#'
	  ,[zip]='#zip#'
      ,[country]='#country#'
	  ,[email]='#email#'
	  ,[phonenumber]='#phonenumber#' where cartid='#cartid#'  
	  </cfquery>
		


	  	  Done
<cfinvoke component="cartcontrol.cartmonitor" method="addpurchase" returnvariable="result" >
<cfinvokeargument name="cartid" value="#cartid#">
<cfinvokeargument name="email" value="#email#">
<cfinvokeargument name="shippingname" value="#shipto#">
<cfinvokeargument name="billingname" value="#shipto#">
<cfinvokeargument name="shippingaddress" value="#street1#">
<cfinvokeargument name="shippingaddress2" value="#street2#">
<cfinvokeargument name="shippingcity" value="#city#">
<cfinvokeargument name="shippingstate" value="#state#">
<cfinvokeargument name="shippingzip" value="#zip#">
<cfinvokeargument name="billingphone" value="#phonenumber#">
<cfinvokeargument name="shippingcountry" value="#country#">
<cfinvokeargument name="comments" value="#comments#">
</cfinvoke>
		  
</cfif>
<a href="/cartstatus21.cfm?show=backoffice">Back</a>
&nbsp; 
<a href="/itemsell.cfm?cartid=#cartid#">Back to cart</a>
<cfcatch type="any">
<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
</cfcatch>
</cftry>