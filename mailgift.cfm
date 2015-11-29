<html>
<head>
<title>Gifting Jewelry</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body >
<cfinclude template="header.cfm">
<cfif isdefined("form.email")>
<cfmail bcc="nitish@semiprecious.com" subject="gift from #form.gifter#" server="mail23.webcontrolcenter.com" from="#form.gifter# at service@semiprecious.com"
 to="#form.email#" type="html" failto="#form.gifteremail#">
You must have a HTML enabled mail reader to view the following content.
 #form.gift#
 </cfmail>
</cfif>
<cfoutput><br>
<br>
 The following gift mailed to #form.email#.
 #form.gift#</cfoutput>
<br><cfoutput> <font size="-1">If you havent paid yet, please select a payment mode below</font>: 
<table width="620" border="1" >
  <tr> 
    <td  valign="middle"  bgcolor="##FFFFFF" class="details">Pay by Discover, 
      American Express, JCB, Diners, Mastercard, Visa, Checks using Secure 2CHECKOUT.COM 
      Gateway.<br>
      (Please note you need not fill in shipping address. That will be taken from 
      the gift reciever)</td>
    <td valign="middle" bgcolor="##FFFFFF"> <a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase.2c?sid=12845&cart_order_id=#form.cart#GC&total=#form.amount#"><img  src="http://www.semiprecious.com/images/co.jpg" alt="Use Secure 2Checkout"  hspace="0" vspace="0" border="0"    ></a> </cfoutput> 
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">OR</td>
  </tr>
  <tr>
    <td colspan="2" align="center"  bgcolor="#CCCC99"> Call 1 512 589 9009 with your credit card 
      number and billing address</td>
  </tr>
</table>
<strong>Note</strong>: The gift certificate is yet to be activated. It will be 
activated immediately on confirmation of payment. After payment in case you decide to not 
use the gift we will gladly refund your payment minus the nominal service charges 
if paid to 2Checkout by us. 
<p>

 Thankyou for using the Gift Service.
<cfinclude template="footer.htm">

</body>
</html>
