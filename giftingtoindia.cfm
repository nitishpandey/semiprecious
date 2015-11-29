<html>
<head>
<title>Gifting Jewellery To India</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">

</head>

<body>
<cfparam default="" name="form.contact">
<cfparam default="" name="form.message">
<cfinclude template="header.cfm">
<br>
<cfif isdefined("form.hrcid")>
  <cfquery datasource="semiprecious" >
  update cartstatus set paymode='HROFF', couponcode='#form.hrcid#' where cartid 
  = #session.cartid# 
  </cfquery>
  <cfmail cc="nitish@semiprecious.com" server="mail23.webcontrolcenter.com" from="service@semiprecious.com" to="anup@semiprecious.com"
   subject="haldiram free jewelry offer" type="html"  FAILTO="nitishpandey@rediffmail.com">
    The details of the recepient are : #form.contact#, <br>
    #form.message# <br>
    SP Cartid is : #session.cartid#. HR Cartid is : #form.hrcid#. Total before discount : #amt#. Now only offered 25 % discount. HR Cartid not verified for value, 
    existence or if clubbed with any other offer. You may want to check. or may 
    not. after all a sale has happened. but wait for the payment against the SP 
    Cartid to come. 
  </cfmail>
  Your discounted order has been confirmed subject to the condition that the address provided 
 by you is in India. Thankyou. <br>
  <hr />
  <!---  <cfif amt GT 13> --->
  <cfif amt GT 0>
 
    <cfset amount = 0.67*amt>
    <cfoutput>  #Dollarformat(amount)#    </cfoutput> 
    <table width="620" border="0" align="center">
      <tr align=center > 
        <cfset description = "semiprecious adm info (subsc,hroff,sh?,)">
        <td colspan=3 bgcolor="#000033" ><font color="white"><b> PAYMENT 
          OPTIONS</b></font></td>
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
            <span class="unnamed1"><a href="http://www.authorize.net">Know more 
            about authorize.net if you have any security concerns</a></span></font></strong><span class="unnamed1"><font color="#000000"> 
            (By Wells Fargo)</font></span></td>
          <td valign="middle" bgcolor="#FFFFFF"> 
            <cfoutput>#cfhttp.FileContent#</cfoutput> </td>
        </tr>
        <cfelse>
        <!--- NOT ACTIVATED 
              (<cfoutput>#cfhttp.statuscode#</cfoutput>) --->
      </cfif>
      <cfoutput> 
        <tr> 
          <td colspan="2" bgcolor="##DADAA9" class="row2"> <strong>Call 512 589 
            9009 (USA). order over the phone using a secure payment gateway</strong>. 
            If you wish, simply provide your Phone no. &amp; cartid (#session.cartid#). We will call back.</td>
          <td bgcolor="##666600"> <strong><font color="##FFFFFF">Phone order </font></strong></td>
        </tr>
        <tr> 
          <td bgcolor="##DADAA9" class="row2"><p><strong>Attn:</strong><strong>Anup 
              Pandey<br>
              1216 Dexford Dr<br>
              Austin, TX-78753 <br>
              </strong></p></td>
          <td bgcolor="##DADAA9" class="row2"><strong>Please mention behind the 
            Check/Money Order:</strong> <p><strong> cart ID:</strong><strong>#session.cartid#<br>
              HR CID:#hrcid# </p></td>
          <td valign="middle" bgcolor="##666600"><strong><font color="##FFFFFF">Check/Money 
            Order</font></strong><font color="##FFFFFF"><br>
            </font> </td>
        </tr>
      </cfoutput> 
    </table>
  </cfif>
  <cfset session.cartid = 0>
  <cfelse>
  Please fill in the following details. 
  <cfform action="haldiramofferorder.cfm" method="post">
    <cfoutput>
      <input type="hidden" name="cartid" value="#session.cartid#">
      <input  type="hidden" value="#url.amt#" name="amt">
    </cfoutput> 
    <table width="589" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" you can change the email id that we will send our 'new item' and discount mailers 
to. ></td>
        <td width="545" bgcolor="#CCCC99">&nbsp;</td>
        <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle"></td>
      </tr>
      <tr> 
        <td bgcolor="#CCCC99">&nbsp;</td>
        <td align="center" bgcolor="#FFFFFF"> <table width="100%" border="1" class="tdcenter">
            <tr> 
              <td width="44%" bgcolor="#CCCC99">Haldiram Cartid </td>
              <td width="56%" bgcolor="#FFFFFF">: 
                <cfinput name="hrcid" type="text" validate="integer" size="40" required="yes" id="name"></td>
            </tr>

            <tr> 
              <td bgcolor="#CCCC99">Name &amp; Shipping Address :</td>
              <td bgcolor="#FFFFFF">: 
                <textarea name="message" cols="36" id="message"></textarea></td>
            </tr>            <tr> 
              <td bgcolor="#CCCC99">Contact Details (Phone/Postal/ Email/Fax) 
              </td>
              <td bgcolor="#FFFFFF">: 
                <cfinput name="contact" type="text" size="40" required="yes" id="contact"></td>
            </tr>
            <tr bgcolor="#669966"> 
              <td align="center">&nbsp; <input type="reset" name="Reset" value="Reset" class="greenbutton"> 
              </td>
              <td align="center"> <input type="submit" name="Submit" value="Submit" class="greenbutton"></td>
            </tr>
          </table>
          
        </td>
        <td bgcolor="#CCCC99">&nbsp;</td>
      </tr>
      <tr> 
        <td><img src="../images/jewelry_box_4.gif" width="22" height="22" align="absmiddle"></td>
        <td bgcolor="#CCCC99">&nbsp;</td>
        <td><img src="../images/jewelry_box_2.gif" width="22" height="22" align="absmiddle" ></td>
      </tr>
    </table>
  </cfform>
</cfif>
<span class="details"><br>
You can also contact us on email: anup@semiprecious.com, call: 512 589 9009. Mailing 
Address: Stacy Pandey, 1216 Dexford Drive, Austin, TX, 78753.</span> 
<cfinclude template="footer.htm">

</body>
</html>
