<html>
<head>
<title>Haldiram Free Jewelry Offer</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">

</head>

<body leftmargin="0" topmargin="0">
<cfparam default="" name="form.contact">
<cfparam default="" name="form.message">
<cfinclude template="header.cfm">
<br>
<cfif isdefined("form.hrcid")>
<cfquery datasource="gemssql" >
  update cartstatus set paymode='HROFF', couponcode='#form.hrcid#' where cartid = #form.cartid#
  </cfquery>
  <cfmail cc="nitish@semiprecious.com" server="mail23.webcontrolcenter.com" from="service@semiprecious.com" to="anup@semiprecious.com"
   subject="haldiram free jewelry offer" type="html"  FAILTO="nitishpandey@rediffmail.com">
   The details of the recepient are : #form.contact#, <br>
  #form.name# <br>
  #form.Address#,  #form.Address2#,
  #form.city#,
  #form.state#, #form.zip#
  #form.country#.
  Semiprecious.com Cartid is : #form.cartid#.
   HaldiramUSA.com Cartid is : #form.hrcid#. 
   Total before discount : #amt#.  25 % discount  offered. Check   haldiram cartid existence or if clubbed with any other offer. You may want to check. or may not. after all a sale has happened.
   but wait for the payment against the SP  Cartid to come.
   </cfmail>
    Your discounted order has been confirmed subject to the condition that the haldiram cart provided by you is worth more than $ 50 and has not been clubbed with any other offer.
    Thankyou. <br>
<hr />
 
<!---  <cfif amt GT 13> --->
<cfif amt GT 0>
  
  
  <cfset amount = 0.75*amt>
<cfoutput>Items Cost : #amt#.  Please make the balance payment of #Dollarformat(amount)#.  
<SCRIPT LANGUAGE="JavaScript">
<!-- Original:  Sven David Hildebrandt (shildebr@online.no) -->
<!-- Web Site:  http://home.hia.no/~sdhild99 -->
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->
<!-- Begin
function goToURL() { window.location = "https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase.2c?sid=12845&cart_order_id=#session.cartid#&total=#decimalformat(amount)#"; }
//  End -->

</script></cfoutput>
      <table width="620" border="0" align="center">
          <tr align=center >  <cfset description = "For semiprecious inventory handlers (subsc,hroff,sh?,)">
        
            <td colspan=3 bgcolor="#000033" ><font color="white"><b>MULTIPLE PAYMENT 
              OPTIONS! SELECT ANY ONE</b></font></td>
          </tr>
         
           <cfif session.mail is "">
            <cfhttp method="get" url="http://www.cheap-jewelry.com/authorizenet/simtoembed.asp?x_description=#urlencodedformat(description)#&x_amount=#amount#&x_invoice_num=#session.cartid#&currency=USD">
            </cfhttp>
            <cfelse>
            <CFQUERY DATASOURCE="semiprecious" NAME="login">
            SELECT firstname, email, address1, address2, city, zip FROM memberinfo 
            WHERE email='#session.mail#' 
            </CFQUERY>
            <!--- dont get lastname because that is actually password --->
            <cfhttp method="get" url="http://www.cheap-jewelry.com/authorizenet/simtoembed.asp?x_description=#urlencodedformat(description)#&x_amount=#amount#&x_invoice_num=#session.cartid#&x_email=#session.mail#&x_first_name=#trim(login.firstname)#&x_address=#urlencodedformat(login.address1)##urlencodedformat(login.address2)#&x_city=#urlencodedformat(login.city)#&x_zip=#urlencodedformat(login.zip)#&currency=USD">
            </cfhttp>
          </cfif>
		  <cfif cfhttp.statuscode contains "200">
            <tr valign=top> 
   <!--- for auth.net --->
              <!--- for auth.net --->
             
              <td colspan="2" valign="middle" bgcolor="#DADAA9" class="row2"><strong><font color="#000000">Use 
                Master or Visa card. Click logo on to pay.<br>
                 <span class="unnamed1"><a href="http://www.authorize.net">Know 
                more about authorize.net if you have any security concerns</a></span></font></strong><span class="unnamed1"><font color="#000000"> 
                (By Wells Fargo)</font></span></td> 
              <td valign="middle" bgcolor="#FFFFFF"> <cfoutput>#cfhttp.FileContent#</cfoutput> </td>
            </tr>
          </cfif>
          

          <tr> 
                         <td colspan="2" valign="middle" bgcolor="#DADAA9" class="row2"><strong>Using 
              Credit Card through Paypal, Paypal no longer requires signing up, 
              smooth process. Click on logo to pay.</strong></td>
            <td valign=middle bgcolor="#FFFFFF"> <cfoutput> 
                <!--- #amount# + #description#  o/p for debugging--->
                <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="anup@semiprecious.com">
                  <input type="hidden" name="currency_code" value="USD">
                  <input type="hidden" name="item_name" value='#URLEncodedformat(session.cartid)#'>
                  <input type="hidden" name="amount" value='#decimalformat(amount)#'>
                  <input type="image" src="http://www.semiprecious.com/images/pp3.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                </form>
                <!---<cfset amount = decimalformat(evaluate(total*(1-discount/100)-rcredit+shipping))> 
<A HREF="https://secure.paypal.x.com/xclick/business=anup%40semiprecious.com&quantity=1&item_name=#URLEncodedformat("jewelry_#qty#")#&item_number=#URLEncodedformat(session.cartid)##couponcode#&amount=#decimalformat(evaluate(total*(1-discount/100)-rcredit))#&shipping=#decimalformat(shipping)#&return=http%3A//www.semiprecious.com/list.cfm" target="_blank"  onClick="javascript:alert('You will be taken to Paypal Secure Server to make payment to us. Quantity column in Paypal will always show 1 even if you buy more than 1. You will get a confirmation email from us within 24 hrs of your order. You will be making payment to Dynamic Web, if you have any concerns call us toll free:1-512-589-9009 email: anup@semiprecious.com. Thank you !')"><img src='images/pp3.gif' border=0></A>
--->
              </cfoutput> </td>
          </tr>

        <cfoutput>  <tr> 
            
            <td colspan="2" bgcolor="##DADAA9" class="row2"> <strong>Call 512 589             9009 (USA). order over the phone using a secure payment gateway</strong>. 
              If you wish, simply provide your Phone no. &amp; cartid (#form.cartid#). We will  call back.</td>
            <td bgcolor="##666600"> <strong><font color="##FFFFFF">Phone order</font></strong></td>
          </tr>
          <tr> 
           
            <td bgcolor="##DADAA9" class="row2"><p><strong>Attn:</strong><strong>Anup 
                Pandey<br>
                1216 Dexford Dr<br>
                Austin, TX-78753 <br>
                </strong></p>
              </td>
            <td bgcolor="##DADAA9" class="row2"><strong>Please mention behind the 
              Check/Money Order:</strong> 
              <p><strong> cart ID:</strong><strong>#form.cartid#<br> Haldiram cart:#form.hrcid#
			</p>
              </td> 
            <td valign="middle" bgcolor="##666600"><strong><font color="##FFFFFF"><a href="checkdetails.cfm?itemid=#form.cartid#&amount=#amount#">Check/Money Order</a></font></strong></td>
          </tr>
		  
       </cfoutput> </table>  </cfif>
	   <cfset session.cartid = 0>

  <cfelse><cfquery datasource="gemssql" >
  update cartstatus set paymode='HROFF' where cartid = #url.cid#
  </cfquery>
  <cfform action="haldiramofferorder.cfm" method="post">
<cfoutput><input type="hidden" name="cartid" value="#session.cartid#">	<input  type="hidden" value="#url.amt#" name="amt"></cfoutput>
<table width="800" border="1" class="tdcenter">
<tr class="topnavigator"><td colspan="2">  Please fill in the Shipping details : 
</td></tr>
  <tr> 
      <td width="40%" bgcolor="#CCCC99">Haldiram Cartid </td>
    <td width="60%" bgcolor="#FFFFFF">: 
      <cfinput name="hrcid" type="text" validate="integer" size="20" required="yes" id="hrcid"></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99">Contact Details (Phone/Email) </td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="contact" type="text" size="30" required="no" id="contact"></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99">Name </td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="name" type="text" size="40" required="yes" id="name"></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99">Address</td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="Address" type="text" size="40" required="yes" ></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99">Address</td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="Address2" type="text" size="30" required="no" ></td>
  </tr>

  <tr> 
    <td bgcolor="#CCCC99">City</td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="city" type="text" size="40" required="yes" ></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99">State - Zip</td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="state" type="text" size="34" required="yes" >-<cfinput name="zip" type="text" size="20" required="no" ></td>
  </tr>
  <tr> 
    <td bgcolor="#CCCC99">Country</td>
    <td bgcolor="#FFFFFF">: 
      <cfinput name="country" type="text" size="40" required="yes" ></td>
  </tr>
 
  <tr> 
        <td bgcolor="#CCCC99">Message</td>
    <td bgcolor="#FFFFFF">: 
      <textarea name="message" cols="36" id="message">Enter Message If This is a Gift.</textarea></td>
  </tr>
  <tr bgcolor="#669966"> 
    <td align="center">&nbsp;

      <input type="reset" name="Reset" value="Reset" class="greenbutton"> </td>
    <td align="center"> <input type="submit" name="Submit" value="Submit" class="greenbutton"></td>
  </tr>
</table>
</cfform>
</cfif>
<span class="details"><a href="confirmation.cfm">Back To Other Payment Options</a><br>
You can also contact us on email: anup@semiprecious.com, call: 512 589 9009. Mailing 
Address: Stacy Pandey, 1216 Dexford Drive, Austin, TX, 78753.</span> 
<cfinclude template="footer.htm">

</body>
</html>
