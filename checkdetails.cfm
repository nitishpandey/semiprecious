<CFPARAM name="newitem" default="">
<CFPARAM name="url.itemid" default="">
<cfparam name="url.amount" default="0">
<cfparam name="form.amount" default="0" >
<cfparam name="form.STREET_ADDRESS" default="" >
<cfparam name="form.city" default="" >
<cfparam name="form.country" default="" >
<cfparam name="form.zip" default="" >
<cfparam name="form.state" default="" >

<html>
<head>
<title>Payment By Check/Money Order</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyright {
	font: 9px "Times New Roman", Times, serif;
	color: #CCCCCC;
}
-->
</style>
</head>
<body topmargin="0"  >
 <cfinclude template="header.cfm">
 <div align="center">
<!--- <CFINCLUDE template="js/hoverstonemenu.cfm"> --->
 <!--- <script language="JavaScript" src="js/menu_com.js" type="text/JavaScript"></script> --->
 <cfif isdefined("form.message") or isdefined("form.whole")>
<cfparam default="wholecoupon" name="form.message">
<!---<cfif isdefined("form.whole")>
<cfset wholeval = randrange(randrange(1000,2500),randrange(13300,22900))>
<cfset wholeval = mid(form.name,3,1) & wholeval & left(trim(form.name),3)>
<cfset wholeval = left(replace(wholeval," ",'sp'),8)>
<cfset session.wholesale = wholeval>
    <br>
    Your Bulk Discount code is '<strong><font color="#FF0000"><cfoutput>#wholeval#</cfoutput></font></strong>'. Fill this code at the cart page before checking 
    out to instantly get the discount.<br>
    Each coupon code is valid only for purchase by you (verified against email/name) 
    . To provide better tracking of our whole sale deals we suggest you <a href="apply.cfm">subscribe</a> 
    and <a href="simplelogin.cfm">login</a> before making the purchase. This is 
    completely optional.<br>
     <br>
  <strong>Please note:</strong> Completely 
    automated bulk purchase process has been providing our bulk purchase customers a lot of convenience.  However, due to complete automation the prices billed are sometimes less than our cost price or an items in the desired quantity is not available in stock. On such items we undertake a revision in price or intimate non-availability of 
    items  later stage. This is done rarely and is discussed with you before taking any decision on the shipment. 
    <cfquery datasource="semiprecious"> <!--- note couponcode is going to pname, because it has to be unique --->
insert into properties (pname,pvalue) values ( '#wholeval#','whole')
</cfquery>

</cfif>
 <cfflush interval="10"> --->
<cfset mailcontent=form.name & ', '&form.contact &', ' & form.message>
<cfset sendsave = 0>
<cfset mailto = "anup.pandey@corporate.ge.com">
<cfset bccto = "">
  
<cfif form.contact is 'test'>
  
    
<cfset mailto = "nitish@semiprecious.com">
</cfif>

<cfset subject = form.name & "'s Message">
<cfset mailerror = 0> <!--- 1 = >  error --->

<cfmail  from="#trim(form.contact)#" to="anup@semiprecious.com,smriti@semiprecious.com" subject="Check : #cartdetails#" cc="nitish@semiprecious.com"  >

#form.name# wants to make check payment. <br />
#form.message#.
Address :<br />
 #form.street_address#, #form.city#, 
 #form.state#&nbsp;&nbsp;&nbsp; #form.zip#, 
#form.country#
  Email id/Phone is  #form.contact#.<hr />
DO NOT REPLY TO THIS

</cfmail>
<cfinvoke component="cartcontrol.cartmonitor" method="addpurchase" returnvariable="result" >
<cfinvokeargument name="cartid" value="#cartdetails#">
<cfinvokeargument name="email" value="#form.contact#">
<cfinvokeargument name="shippingname" value="#form.name#">
<cfinvokeargument name="shippingaddress" value="#form.street_address#">
<cfinvokeargument name="shippingcity" value="#form.city#">
<cfinvokeargument name="shippingstate" value="#form.state#">
<cfinvokeargument name="shippingzip" value="#form.zip#">
<cfinvokeargument name="shippingcountry" value="#form.country#">
</cfinvoke>
<cfif find('@',form.contact)>

<cfmail to="#trim(form.contact)#" from="cs@semiprecious.com" subject="Check Payment at semiprecious.com">
This is an automated mail. Please do not reply to this.


Items in Semiprecious.com  cart #session.cartid# reserved for next 8 days pending  receipt of your check or money order.

Please address the payment for #format(form.amount)# in favour of : Semiprecious.com

Mailing Address:


Anup Pandey
1512 Anise Drive
Austin, TX-78741
USA

For any query you can contact us on stacy@semiprecious.com or visit the site for toll free number and mailing details.<br>
Thankyou for shopping with Semiprecious.com.
</cfmail>
</cfif>


<cfquery datasource="gemssql">
update cartstatus set paymode = 'chck' where cartid = #session.cartid#
</cfquery>

<cfinvoke component="cartcontrol.cartmonitor" method="setbuyeremail" >
<cfinvokeargument name="cartid" value="#session.cartid#">
<cfinvokeargument name="email" value="#trim(form.contact)#">
</cfinvoke>

<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#session.cartid#">
</cfinvoke>

<!--- <cfsilent>
<cfmodule template="customtags/mailsemipreciouscom.cfm" debug="1" mailto="#Variables.mailto#" ccto="#Variables.ccto#"  subject="#form.name#'s Query" mailcontent="#variables.mailcontent#" />
 ---><!--- <cfinclude template="newsletters/mailer.cfm"> --->
<!--- </cfsilent> --->
<cfif mailerror>
There was an error in recording your message. Sorry for the inconvenience. You can contact us by sending us 
mail at anup@semiprecious.com or call us on .... any time. 

<cfelse>
<br>
<br>
<div  style="width:800px;" align="left">  <div class="details"> Your payment details recorded. The items in your cart will be reserved for you for next 8 days.<br>
Please mail the check to:<br>
  <cfif cgi.server_name IS "semiprecious.com">
(Make the check in favor of Semiprecious.com)
<br>
Anup Pandey<br>
1512 Anise Drive<br>
Austin, TX - 78741<br>
<cfelse>
(Make the check in favor of Acematrix Industries)
<br>
WZ-106/18<br>
Rajouri Garden Extn<br>
New Delhi 110027<br>
Please mention on the Check or Money Order: Cart ID:<cfoutput>#session.cartid#</cfoutput>
</cfif>         
<cfoutput>
 <a href="list.cfm?#session.filter#" class="headerfont">Click Here for more
      Shopping</cfoutput> </a></div>   <table width="800px"><tr><td> <script type="text/javascript"><!--
				google_ad_client = "pub-2709788135063072";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_format = "728x90_as";
				google_ad_channel ="";
				google_ad_type = "text";
				google_color_border = "CCCCCC";
				google_color_bg = "FFFFFF";
				google_color_link = "000000";
				google_color_url = "666666";
				google_color_text = "333333"; 
			//--></script> 
              <script type="text/javascript"
				  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
             </td></tr></table></div>
	  <!--- <script language="JavaScript">
alert("Thankyou for your Query. We  will get in touch with you.");

</script> --->
</cfif>
<cfelse>

   
       <div   class="details"> <div align="center">
    <div align="justify" style="width:620px;"> <font size="2"> <br>
      <!---     <cfoutput>
        <p><strong>On wholesale/bulk purchases we give 50 % </strong>discount 
          <strong>(on non-sale prices)</strong> immediately. <br>
To get the discounted bill you must :<br>
1. use the bulk purchase code  <br>
and<br>
2. Your first purchase must be of value USD $ 250.00 (after discount).<strong><br>
3. Your later purchases will have to be minimum  $100 (after discount).<br>

The discount code/coupon code will be generated for you now</strong> when you submit the form given
          below. The coupon code will be then filled in your cart automatically to 
		  calculate a discounted total.</p>    
    If you are not looking for a bulk purchase you can 
      </cfoutput>  --->
      Please submit the form with your name,email and shipping address. We will 
      reserve the items placed in your cart for next 10 days till the check or 
      money order is recieved.<br>
      Thankyou.</font></div>
  </div></div>

      <cfform action="checkdetails.cfm" method="post" enctype="multipart/form-data" name="a" target="_parent">      
	  <cfoutput><input type="hidden" name="cartdetails" value="#url.itemid#"></cfoutput>
   <div  align="center" class="details"> <br>
  <table width="591" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" align="absmiddle"></td>
      <td width="547" bgcolor="#CCCC99">&nbsp;</td>
      <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"> <table width="100%" border="1" class="tdcenter">
          <tr> 
            <td width="35%" bgcolor="#FFFFFF">Your Name</td>
            <td width="65%" bgcolor="#FFFFFF">
<cfinput name="name" type="text" size="40" required="yes" id="name"></td>
          </tr>
<cfoutput>		  <input type="hidden" name="amount" value="#url.amount#" /></cfoutput>
          <tr> 
            <td bgcolor="#FFFFFF">Email/Phone No.</td>
            <td bgcolor="#FFFFFF">
<cfif isdefined("session.bulkbuyer.id")>
                
			<cfset jack = session.bulkbuyer.id>
			<cfelseif session.mail neq "">
			<cfset jack = session.mail>
			
			</cfif> 
              <cfif  isdefined("jack")>
			  
                <cfoutput> 
                  <cfinput name="contact" type="text" size="40" value="#jack#" required="no" id="contact">
                </cfoutput>
                <cfelse>
                <cfinput name="contact" type="text" size="40" required="no" id="contact">
              </cfif> </td>
          </tr>
		  
          <tr> 
            <td bgcolor="#FFFFFF">Shipping Address</td>
            <td bgcolor="#FFFFFF"> 
              <input type="text" name="street_address" maxlength="40" size="30">
              Street Address<br>
              <input type="text" name="city" size="30" maxlength="25">
              City<br>
              <input type="text" name="state" size="30" maxlength="25">
              State<br>
              <input type="text" name="zip" size="26" maxlength="25">
              ZIP<br>
              <input type="text" name="country" size="36" maxlength="25">
              Country<br>
              <textarea name="message" cols="36"  rows="2" id="message">Cartid :<cfif  isdefined("url.itemid")  ><cfoutput>#url.itemid#</cfoutput>.</cfif> Put your message here , if any.</textarea></td>
          </tr>
          <tr bgcolor="#669966"> 
            <td align="center" bgcolor="#666600">&nbsp; <input type="reset" name="Reset" value="Reset" class="greenbutton"> 
            </td>
            <td align="center" bgcolor="#666600"> <input type="submit" name="Submit" value="Submit" class="greenbutton"></td>
          </tr>
        </table>
        
      </td>
      <td bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td><img src="../images/jewelry_box_4.gif" width="22" height="22"></td>
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td><img src="../images/jewelry_box_2.gif" width="22" height="22"></td>
    </tr>
  </table>
  </cfform>

  <script>	        document.forms[0].name.focus();
	 </script>
<p>
<!--- <!-- <cfinclude template="index1.cfm"> --> --->
<br>
      <span class="copyright">The Content, Designs,  Jewelry, 
      and Functionality of this website are the property of Semiprecious.com &copy; and are
      protected by Copyright and Trademark Law. </span></div>  

</cfif>     
</div>  
    </body>
</html>
