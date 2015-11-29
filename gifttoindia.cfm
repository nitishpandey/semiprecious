<html>
<head>
<title>Gifting Jewellery To India</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">

</head>

<body topmargin="0"><div align="center">
<cfinclude template="header.cfm">

<br>
<cfif isdefined("form.hrcid")>
  <span class="details"> 
  <cfparam default="" name="form.contact">
  <cfparam default="" name="form.message">
  <cfparam default="" name="form.hrcid">
  <cfquery datasource="semiprecious" >
  update cartstatus set paymode='G2I', couponcode='#form.hrcid#' where cartid 
  = #form.cartid# 
  </cfquery>
  <cfmail cc="nitish@semiprecious.com" server="mail23.webcontrolcenter.com" from="service@semiprecious.com" to="anup@semiprecious.com"
   subject="haldiram free jewelry offer" type="html"  FAILTO="nitishpandey@rediffmail.com">
    The details of the recepient are : #form.name#, #form.contact#, <br>
    #form.message# <br>
    SP Cartid is : #form.cartid#. HR Cartid is : #form.hrcid#. Total before discount : #amt#.  HR Cartid not verified for value, 
    existence or if clubbed with any other offer. You may want to check. or may 
    not. after all a sale has happened. but wait for the payment against the SP 
    Cartid to come. 
  </cfmail>
  <div  style="width:800px;" align="left">Congratulation! Your gift has been confirmed to be delivered to the following addres:</span> 
  <!---  <cfif amt GT 13> --->
  <br>
  <cfif form.amt GT 0>
    <cfset amount = 0.67*amt>
    <cfif form.hrcid eq "">
      <cfset amount = 0.75*amt>
    </cfif>
    <cfoutput> Delivery Address: 
      <div style="border:1px groove black; display:block;margin-left:30px;width:200px;"> 
        #form.name#<br>
        #form.message#.<br>
        #form.contact#</div>

      <strong>Final Amount Payable: #Dollarformat(amount)#</strong> </cfoutput> </div>
    <table width="620" border="0" align="center">
      <tr align=center bgcolor="#CCCCCC" > 
        <cfset description = "katkarpur dept adm info (subsc,hroff,sh?,)">
        <td colspan=3 ><font color="white"><b> PAYMENT OPTIONS</b></font></td>
      </tr>
      <cfif session.mail is "">
        <cfhttp method="get" url="http://www.cheap-jewelry.com/authorizenet/simtoembed.asp?x_description=#urlencodedformat(description)#&x_amount=#amount#&x_invoice_num=#form.cartid#&currency=USD">
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
          <td colspan="2" valign="middle" bgcolor="#DADAA9" class="row2"><p><strong><font color="#000000">Use 
              American Express, Master or Visa card. Click logo on to pay.</font></strong><br>
              [Please note: You need not fill the shipping Address again. Just 
              Leave it blank]</p>
            </td>
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
            If you wish, simply provide your Phone no. &amp; cartid (#form.cartid#). We will call back.</td>
          <td class="details"> <strong><font color="##94359F">Phone order </font></strong></td>
        </tr>
        <tr> 
          <td bgcolor="##DADAA9" class="row2"><p><strong>Attn:</strong><strong>Anup 
              Pandey<br>
              1216 Dexford Dr<br>
              Austin, TX-78753 <br>
              </strong></p></td>
          <td bgcolor="##DADAA9" class="row2"><strong>Please mention behind the 
            Check/Money Order:</strong> <p><strong> cart ID:</strong><strong>#form.cartid#<br>
               </p></td>
          <td valign="middle" bgcolor="##FFFFFF"><strong><font color="##FFFFFF"><a href="checkdetails.cfm?itemid=g2i(#form.cartid#)">Check/Money 
            Order</a></font></strong><font color="##FFFFFF"><br>
            </font> </td>
        </tr>
      </cfoutput> 
    </table>
  </cfif>
  <cfelse>
  <cfform action="gifttoindia.cfm" method="post">
    <cfoutput> 
      <input type="hidden" name="cartid" value="#url.cartid#">
      <input  type="hidden" value="#url.amt#" name="amt">
    </cfoutput> 
    <table width="589" align="center" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" you can change the email id that we will send our 'new item' and discount mailers 
to. ></td>
        <td width="545" bgcolor="#CCCC99">Please Fill In Details of Recepient 
          In India:</td>
        <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle"></td>
      </tr>
      <tr> 
        <td bgcolor="#CCCC99">&nbsp;</td>
        <td align="center" bgcolor="#FFFFFF"> <table width="100%" border="1" class="tdcenter">
            <tr> 
              <td width="44%" bgcolor="#CCCC99">Haldiram Cartid (Optional)</td>
              <td width="56%" bgcolor="#FFFFFF">: 
                <cfinput name="hrcid" type="text" size="20" required="no" validate="integer" id="name"></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCC99">Name :</td>
              <td bgcolor="#FFFFFF">: 
                <cfinput required="yes" maxlength="36" message="Please Provide Name of recepient." type="text" name="name"  id="name"></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCC99">Shipping Address :</td>
              <td bgcolor="#FFFFFF"> <textarea name="message" cols="33" id="message"></textarea></td>
            </tr>
            <tr> 
              <td bgcolor="#CCCC99">Contact Details (Phone/Email/Fax) </td>
              <td bgcolor="#FFFFFF">: 
                <cfinput name="contact" type="text" size="30" required="yes" id="contact"></td>
            </tr>
            <tr bgcolor="#666633"> 
              <td align="center">&nbsp; <input type="reset" name="Reset" value="Reset" class="greenbutton"> 
              </td>
              <td align="center"> <input type="submit" name="Submit" value="Submit" class="greenbutton"></td>
            </tr>
          </table></td>
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
<div align="center" class="cart"><b>Semiprecious.com is delighted to help  overseas relations connect with their loved ones in India.<br>
                                  - Remember 'Jewelry gifts are forever'! </b></div>
<div  style="width:800px;" align="left"><span class="details"><br>
You can also contact us on email: anup@semiprecious.com, call: 512 589 9009. Mailing 
Address: Stacy Pandey, 1216 Dexford Drive, Austin, TX, 78753.</span> </div>
<cfinclude template="footer.htm">
</div></body>
</html>
