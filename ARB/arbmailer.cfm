<cfset email = #URL.email#>
<cfset invoiceNumber = #URL.invoiceNumber#>
<cfset cartid = #URL.invoiceNumber#>
<cfset amount = #URL.amount#>
<cfset totalAmount = 3 * amount >
<cfset subscriptionID = #URL.subscriptionID#>
<cfset cart = #URL.cart#>


<!--- <cfdump var="#cart#">  --->



<cfmail  to="#email#" from="cs@semiprecious.com" server="mail23.webcontrolcenter.com" subject="Subscription Order no. #invoiceNumber# Sent for Approval" type="html">

<html>
<head>
<title>&lt;Authorize.Net ARB Subscription&gt;</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="http://www.semiprecious.com/ARB/CSS/upc.css">
</head>
<body>
<br>
<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
  	<tr align="left" valign="top" bgcolor="000000"> 
    	<td colspan="3" bgcolor="FFFFFF" class="header"><div align="center"><b> SUBSCRIPTION 
       		 ORDER REQUEST</b></div></td>
  	</tr>
		
	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Invoice no.:</div></td>
    	<td width="361" colspan="2">#invoiceNumber#</td>
  	</tr>
  			
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Merchant:</div></td>
    	<td width="361" colspan="2">Semiprecious.com</td>
  	</tr>	
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Total Amount:</div></td>
    	<td width="361" colspan="2">$#totalAmount#</td>
  	</tr>	
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Subscription Amount:</div></td>
    	<td width="361" colspan="2">$#amount# (Recurring)</td>
  	</tr>				
  					
 	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 				<td width="121" class="field_name" ><div align="left">Subscription ID:</div></td>
    				<td width="361" colspan="2"> <b>#subscriptionID#</b></td>
  					</tr> 
	<tr align="left" valign="top" bgcolor="f0f0f0" > 
   	 	<td width="124" class="field_name" ><div align="left">Subscription Status:</div></td>
    	<td width="361" colspan="2"><b>Order sent for subscription approval.</b>    	</td>
  	</tr>
  	

</table>
	<br>

<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    	<td  class="field_name" ><div align="left"></div></td>
    	<td  class="field_name" ><p><strong>What's Next?</strong></p>      </td>
  	</tr>

    						  
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    						  <td height="29" align="center" valign="middle" class="field_name" ><font size= "+0" >&##x2022;</font></td>
    						  <td class="field_name" >Your billing subscription request has been sent for subscription approval.<br>It usually takes less than
    						  24 hours for the approval process. You will receive an e-mail as soon as it's done. Once approved, your
    						  order will be despatched immediately upon fulfillment.</td>
    						  <!-- <tr align="left" valign="top" bgcolor="f0f0f0" > 
    						  <td height="29" align="center" valign="middle" class="field_name" ><font size= "+0" >&##x2022;</font></td>
    						   <td class="field_name" >You may want to Print this page for your records. Remember to mention the Subscription ID
    						  and the Invoice no. in your communications with us for this order.</td>  -->
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    	<td height="29" align="center" valign="middle" class="field_name" ><font size= "+0" >&##x2022;</font></td>
    	<td class="field_name" >Need help? <a href="mailto:cs@semiprecious.com?subject=ARB%20Payment%20Invoice%20#invoiceNumber#">E-mail us </a>
    	and we'll take care of any issues you might be having.</td>
  	</tr>
</table>
</body>
</html>
</cfmail>


<!--- EMPTY THE CART BELOW --->
<CFSET session.cartitem=ArrayNew(2)  />
<Cfset session.cartitem[1][1] = 0  />
<Cfset session.cartitem[1][4] = 0  />
<cfset session.totalqty = 0>
<cfset session.grandtotal = 0>

<!--- EMPTY THE CART BELOW  AND SEND A FORM POSTING THE INFO --->
<form action="http://www.semiprecious.com/cart.cfm" method="post" name="theForm" id="theForm">
<input type="hidden" name="arb" value="<cfoutput>1</cfoutput>">
<input type="hidden" name="cartid" value="<cfoutput>#cartid#</cfoutput>">
</form>

<script>
document.theForm.submit();
</script>
         