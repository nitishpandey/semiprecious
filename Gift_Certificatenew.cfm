<cfparam name="name" default="">
<cfparam name="amt" default="">
<cfparam name="gifter" default="">

<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Description" content="Jewelry Gift Certificates valued more than amount paid.">
<meta http-equiv="keywords" content="Jewelry, Gift Certificate, semiprecious, gemstone,jewellery">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

<title>Its a season of gifting</title>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0">
<div align="center">
<cfinclude template="header.cfm">
<cfif name EQ "" or amt EQ "">
<br>
 <div  style="width:800px;" align="left"> <span class="headerfont">
 <em><font color="#FF0080">A fantastic way to give gifts this season to your  mother, girlfriend, aunt, sister, secretary or even your boss! </font></em> 
 <br>
With Semiprecious.com Gift Certificates/Vouchers you get the following advantages:
 <ul style="margin-top:2px;"><li>Semiprecious.com gives the buyer (you)  a gift worth 20% of the gift certificate value. So you get more value for your money.</li>
 <li>The gift certificate (email or by post) goes right away and your friend can buy almost right away.</li><li> Moreover, since everyone has his own taste, giving the freedom to choose to your friend leaves nothing to chance.</li></ul>
 </span>
 Example:If you buy a gift certificate for $100 for your friend, then you can choose jewelry worth $15 for yourself.  Or you can pick jewelry worth more than $15 and pay only the difference, while your friend gets to shop for $100.00.
  Thats wow!, no?</div>
  <!--- Get $20 value for $15<br>
Get $30 value Certificate for $20<br>
Get $50 value for $30<br>
Get $100 value for $60<br>
Get $200 value for $100!!! --->
 <br>
 <div align="center">
  <cfform method=post action="Gift_Certificatenew.cfm">
    <div  style="width:800px;" align="left"><font color="#808080">Well, just don't say 'Wow!',  Buy a gift coupon now!</font> 
    </div><br>
    <table width="616" border="1"  bordercolor="#666600"cellspacing="0" cellpadding="0">
      <tr><td class="biggreenwhite" colspan="2">Step1: Fill in the form below and click on 'Generate Gift Certificate'</td></tr><tr> 
        <td width="345" bgcolor="#DADA99">Gift Certificate for <br>
          (Name to be shown on Gift Certificate)</td>
        <td  nowrap>: <cfinput type="text"  size=40 name="Name" required="yes"></td>
      </tr>
      <tr> 
        <td bgcolor="#DADA99">Your Name (On certificate)</td>
        <td nowrap>: 
          <cfinput type="text"  size=40 name="gifter" required="yes"></td>
      </tr>
<tr>        <td bgcolor="#DADA99">Message For Your Friend</td>
        <td nowrap>: 
          <cfinput type="text"  maxlength="60" size=40 name="wishes" required="yes" message="Enter details for validation by your friend"></td>
      </tr>

      <tr> 
        <td bgcolor="#DADA99">Your Email <br>
          (Will be used for validation when redeeming)</td>
        <td nowrap>: 
          <cfinput type="text"  size=40 name="validity" required="yes" message="Enter details for validation by your friend"></td>
      </tr>
      <tr> 
        <td bgcolor="#DADA99">Gift Certificate (US Dollars) <br>
(We will gift you 20% worth Jewelry of your choice)</td>
        <td>:$ 
          <cfinput type="text" value="100" size="5" required="yes"  validate="integer" name="amt"> 
          <!---        <SELECT NAME="amt" SIZE="1" VALUE="Gift Amount">
          <option selected value="200">$200</option>
          <OPTION value="100">100</option>
          <OPTION value="50">50</option>
          <OPTION value="30">30</option>
          <OPTION value="20">20</option>
        </select> --->
        </td>
      </tr>
      <tr > 
        <td>&nbsp;</td>
        <td align="center"> <input name="Submit" type=Submit class="greenbutton" value="Generate Gift Certificate"> 
        </td>
      </tr>
    </table>
  </cfform>  </div>
  <div  style="width:800px;" align="left"><span class="details">Pay online after generating and printing/emailing the certificate 
  or call <cfoutput>#Application.tollfree# </cfoutput>with your credit card number and billing address.(Shipping 
  address will be taken from person redeeming the certificate at the time of redemption).</span> 
</div>
<cfinclude template="footer.htm">
  <cfabort>
</cfif>    <cflock name="setcartid" type="exclusive" timeout="10">
        <cfset application.cartid = application.cartid + 1>
        <cfset session.cartid = application.cartid >
      </cflock>
<cfoutput ><br>
  <div  style="width:800px;" align="left"><span class="headerfont">Gift Certificate successfully generated. You can now 
  print the following Gift Certificate and mail it to #form.name#. You may also simply email the certificate id and instructions 
  given on the certificate to your friend. Ceritificate can be redeemed by your friend by clicking on the 
  '<em>Gift Certificate</em>' link on home page and using the id : </span><span class="cart">SP-DEC-#session.cartid#</span><span class="headerfont"> and providing '<strong>#form.validity#</strong>' for validation. </span><br>
  <br></div>
</cfoutput> 
<cfset amt1 = amt>
<cfset session.buyeramt = 0.2*amt />
<cfquery datasource="gemssql">
insert into gifts values (#session.cartid#,'NEW','#form.validity#',#amt#,'#form.gifter#')
</cfquery>
<cfset giftcontent = '<table border="2" bordercolor="blue" width="800">
  <tr>
    <td >
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="58%" rowspan="3"><img border="0" src="http://www.semiprecious.com/central.gif" width="395" height="174">
            <p><font face="Monotype Corsiva" size="4"><b>WWW.SEMIPRECIOUS.COM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </b></font></td>
          <td width="42%"><b><font face="Arial Black" size=3>Jewelry&nbsp;Gift from #form.gifter#   For</font></b> 
            <p><font face="Lucida Handwriting" size="5">
            <cfoutput>#Name#</font></p>
          </td>
        </tr>
		<tr>
          <td>#form.wishes#</cfoutput> 
            <!--- should not accidentally shop on this cartid --->
          </td>
        </tr>
        <tr>
          <td  > <b>TOTAL VALUE</b>: <b><font face="Arial Alternative" size="6">$<cfoutput>#amt#</font></b> <p><font face="Arial Alternative" size="1"><strong>#form.gifter#</strong> has sent you this gift voucher. You can visit www.semiprecious.com and 
              use the "Gift Certificate" Link on the home page to buy items worth 
              #dollarformat(amt)#. <br>
              Please provide the following information while shopping:<br>
              1. Gift Id: SP-DEC-#session.cartid#<br>
              2. Validitating Codel: #form.validity# </cfoutput></font></td>
        </tr>
      </table>
    </td>
  </tr>
</table>'>
<cfoutput>#giftcontent#<br>
</cfoutput>
<cfform action="mailgift.cfm" method="post">
Step 2: Email the gift right now.
Just fill in the reciever's email address here  :<cfinput type="text" required="yes" message="Please provide email address"
 maxlength="70" name="email">
 
<cfoutput> <input type="hidden" value='#giftcontent#' name="gift" />
 <input type="hidden" value="#form.gifter#" name="gifter" />
 <input type="hidden" value="#form.validity#" name="gifteremail" />
<input type="submit"  value="eMail Gift Certificate" />
<input type="hidden" value="#amt1#" name="amount" />
<input type="hidden" value="#form.wishes#" name="wishes" />
<input type="hidden" value="#session.cartid#" name="cart" />
</cfoutput>
</cfform>
  
<span class="details"> <br>
Any questions mail to stacy@semiprecious.com or call 512 589 9009 now.</span> 
<br>

  <!--- <cfif amt eq 20>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=15.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $15 for $20 Certificate</a>
<cfelseif amt eq 30>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=20.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $20 for $30 Certificate</a>
<cfelseif amt eq 50>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=30.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $30 for $50 Certificate</a>
<cfelseif amt eq 100>
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=60.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click to Pay $60 for $100 Certificate</a>
<cfelseif amt eq 200>
    <a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase1c.2c?sid=12845&order_number=11766184&cart_order_id=726363&total=100.00&demo=&company_name=Semiprecious.com&web_site=www.semiprecious.com&acc_can=Y&acc_int=Y&diff_ship=Y&can_handling=0.00&int_handling=1.95&ship_name=&ship_street_address=&ship_city=&ship_state=&ship_zip=&ship_country=&quote=&card_holder_name=&street_address=&city=&state=&zip=&country=&phone=&email=">Click 
    to Pay $100 for $175 Certificate</a> 
  </cfif> --->

     <cfoutput>Step 3: Select a payment mode: 
	 <div align="center">
<table  width="620" border="1" >
  <tr> 
    <td  valign="middle"  bgcolor="##FFFFFF" class="details">Pay by Discover, 
      American Express, JCB, Diners, Mastercard, Visa, Checks using Secure 2CHECKOUT.COM 
      Gateway.<br>
      (Please note you need not fill in shipping address. That will be taken from 
      #form.name#.)</td>
    <td valign="middle" bgcolor="##FFFFFF"> <a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase.2c?sid=12845&cart_order_id=#session.cartid#GC&total=#amt1#"><img  src="http://www.semiprecious.com/images/co.jpg" alt="Use Secure 2Checkout"  hspace="0" vspace="0" border="0"    ></a> 
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">OR</td>
  </tr>
  <tr>
    <td colspan="2" align="center" bgcolor="##CCCC99"> Call #Application.tollfree# with your credit card 
      number and billing address</td>
  </tr>
</table>
<strong>Step 4:</strong> Once the gift certificate is paid for  we will forward you a discount code worth #Dollarformat(session.buyeramt)# and you can make your discounted purchase. </cfoutput> 
<p>
</div>
<cfset session.gifter = 1>
<cfset session.cartid = 0>
<cfinclude template="footer.htm">
</div>
</body>

</html>
