<cfparam name="name" default="">
<cfparam name="amnt" default="">
<cfparam name="gifter" default="">

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Description" content="Jewelry Gift Certificates valued more than amount paid.">
<meta http-equiv="keywords" content="Jewelry, Gift Certificate, semiprecious, gemstone,jewellery">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<title>New Page 1</title>
</head>

<body>
<cfinclude template="header.cfm">
<cfif name EQ "" or amnt EQ "">
  <img src=http://www.semiprecious.com/images/semiprecious.gif><br>
  <h4><b>Get more value than amount you pay! </b></h4>
  <p><b>Choose your amount and we will add 25% value from our side!</b></p>
  <p><b>So for a gift coupon if you pay $100.00 we add $25.00 to it. Using the 
    coupon <br>
    your friend can purchase jewelry worth $125.00.</b> 
    <!--- Get $20 value for $15<br>
Get $30 value Certificate for $20<br>
Get $50 value for $30<br>
Get $100 value for $60<br>
Get $200 value for $100!!! --->
    <br>
    Also shipping is FREE on Gift Certificate Redemtions. <br>
    Pay online after generating certificate or after printing out the Gift Certificate 
    or call 1 512 589 9009 with your credit card number and billing address.(Shipping 
    address will be taken from person redeeming the certificate at the time of 
    redemption). <br>
    For validation we the person (redeemer) must give us the payee's (your) name 
    and email or phone number as validation. </p>  <cfform method=post action="Gift_Certificate.cfm">
    <br>
    <br>
  <table width="606" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="350">Gift Certificate for <br>
          (Name to be shown on Gift Certificate)</td>
        <td width="256">:
<cfinput type="text"  size=40 name="Name" required="yes"></td>
    </tr>
    <tr>
      <td>Your Name</td>
      <td>: 
        <cfinput type="text"  size=40 name="gifter" required="yes"></td>
    </tr>    <tr>
      <td>Your Name,Email or Phone No.<br>
(Will be used for validation when redeeming)</td>
      <td>: 
        <cfinput type="text"  size=40 name="validity" required="yes"></td>
    </tr>
    <tr>
      <td>Amount on Gift Certificate</td>
      <td>: 
          <cfinput type="text" value="20" size="5" required="yes"  validate="integer" name="amt">
 <!---        <SELECT NAME="amnt" SIZE="1" VALUE="Gift Amount">
          <option selected value="200">$200</option>
          <OPTION value="100">100</option>
          <OPTION value="50">50</option>
          <OPTION value="30">30</option>
          <OPTION value="20">20</option>
        </select> ---></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
        <td align="center">
<input name="Submit" type=Submit value="Generate Gift Certificate">
        </td>
    </tr>
  </table>

  </cfform>
  <cfabort>
</cfif>
<cfinclude template="uniquecartid.cfm">
<cfoutput>You can Print the following Gift Certificate or simply mail the gift 
  id to #form.name#. <br>
  He can redeem it using the 'Collect Gift Coupon' link on home page by using 
  the id : SP-DEC-#session.cartid#<br>
  and providing the following for cross-validation:#form.validity#. <br>
  Note: In case you decide to revoke (not use) the gift we will gladly refund 
  your payment minus the nominal service charges paid to 2Checkout</cfoutput> 
by us. 
<cfquery datasource="gemssql">
insert into gifts values (#session.cartid#,'NEW','#form.validity#',#amt#,'#form.gifter#')
</cfquery>

<cfset amt = round(amt*1.25) + 1>
<table border="1" width="800">
  <tr>
    <td width="100%">
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="58%" rowspan="3"><img border="0" src="central.gif" width="395" height="174">
            <p><font face="Monotype Corsiva" size="4"><b>WWW.SEMIPRECIOUS.COM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </b></font></td>
          <td width="142%"><b><font face="Arial Black" size=3>&nbsp;Gifted to:</font></b> 
            <p><font face="Lucida Handwriting" size="5">
            <cfoutput>#Name#</font></p>
            <p>&nbsp;</td>
        </tr>
		<tr><td>SP-DEC-#session.cartid#</cfoutput><cfset session.cartid = 0> <!--- should not accidentally shop on this cartid ---></td></tr>
        <tr>
          <td width="142%"> <b>TOTAL VALUE</b>: <b><font face="Arial Alternative" size="6">$<cfoutput>#amnt#</cfoutput></font></b>
            <p><font face="Arial Alternative" size="1">To redeem send email to <a href="mailto:anup@semiprecious.com">stacy@semiprecious.com</a> or call 512 589 9009
            with item(s) from www.semiprecious.com worth approx. $<cfoutput>#amnt#</cfoutput>. Include
            shipping address and the name: <cfoutput>#gifter#</cfoutput>.</font></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<p>
<cfif amnt eq 20>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=15.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $15 for $20 Certificate</a>
<cfelseif amnt eq 30>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=20.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $20 for $30 Certificate</a>
<cfelseif amnt eq 50>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=30.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $30 for $50 Certificate</a>
<cfelseif amnt eq 100>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=60.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $60 for $100 Certificate</a>
<cfelseif amnt eq 200>
    <a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=100.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click 
    to Pay $100 for $175 Certificate</a> 
  </cfif>
<p>
OR Call 512 589 9009


<cfinclude template="footer.htm">

</body>

</html>
