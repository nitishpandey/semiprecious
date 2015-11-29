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

<cfif name EQ "" or amnt EQ "">
<img src=http://www.haldiramsusa.com/namkeen.jpg><br>
<h4><b>Get more value than amount you pay! </b></h4>
Get $20 value for $15<br>
Get $30 value Certificate for $20<br>
Get $50 value for $30<br>
Get $100 value for $60<br>
Get $200 value for $100!!!<br>

Also shipping is FREE on Gift Certificate Redemtions.
<br>
Pay online after generating certificate or after printing out the Gift Certificate call 1 512 589 9009 with your credit card number and billing address.(Shipping address will be taken from person redeeming the certificate at the time of redemption). The person (redeemer) must give the payee's name and email or phone number as validation.

<form method=post action="Gift_Certificate_haldi.cfm">
Gift Certificate for (name to show on Gift Certificate): 
<input type="text"  size=40 name="Name"><br>
Your Name: <input type="text"  size=40 name="gifter"><br>
Amount on Gift Certificate: <SELECT NAME="amnt" SIZE="1" VALUE="Gift Amount">
<option selected value="200">$200</option>
<OPTION value="100">100</option>
<OPTION value="50">50</option>
<OPTION value="30">30</option>
<OPTION value="20">20</option>
</select>
<input type=Submit value="Generate Gift Certificate">
</form>
<cfabort>
</cfif>

Print and cut the following Gift Certificate<p><p>

<table border="1" width="800">
  <tr>
    <td width="100%">
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="58%" rowspan="2"><img border="0" src="http://www.haldiramsusa.com/namkeen.jpg">
            <p><font face="Monotype Corsiva" size="4"><b>WWW.haldiramsUSA.COM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </b></font></td>
          <td width="142%"><b><font face="Arial Black">&nbsp;This certificate
            awarded to:</font></b> 
            <p><font face="Lucida Handwriting" size="5">&nbsp;
            <cfoutput>#Name#</cfoutput></font></p>
            <p>&nbsp;</td>
        </tr>
        <tr>
          <td width="142%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b>TOTAL VALUE</b>: <b><font face="Arial Alternative" size="6">$<cfoutput>#amnt#</cfoutput></font></b>
            <p><font face="Arial Alternative" size="1">To redeem send email to <a href="mailto:anup@semiprecious.com">anup@semiprecious.com</a> or call 512 589 9009
            with item(s) from www.haldiramsUSA.com worth approx. $<cfoutput>#amnt#</cfoutput>. Include
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
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=100.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $100 for $200 Certificate</a>
</cfif>
<p>
OR Call 512 589 9009




</body>

</html>
