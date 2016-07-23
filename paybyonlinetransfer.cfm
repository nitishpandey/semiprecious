<CFPARAM name="newitem" default="">
<CFPARAM name="url.itemid" default="">
<cfparam name="form.phone" default="0">
<html>
<head>
<title>Payment By Check/Money Order</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" src="/js/mm_menu.js"></script>

<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.copyright {
	font: 9px "Times New Roman", Times, serif;
	color: #CCCCCC;
}
-->
</style>
</head>
<body topmargin="1" leftmargin="1" >

<div align="center">
<!--- <CFINCLUDE template="js/hoverstonemenu.cfm"> --->
<!--- <script language="JavaScript" src="js/menu_com.js" type="text/JavaScript"></script> ---> 
 <cfinclude template="/header#session.country#.cfm">
<div id="container2" >
<div style="width:97%;background:white;">
<h2 style="float:left;margin-left:180px;top:-50px">Pay By Cheque</h2><br /><br />
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
  insert into properties (pname,pvalue) values ( '#whole
  val#','whole') 
</cfif>
<cfflush interval="10"> --->


<cfset mailcontent=form.name & ', '&form.contact &', ' & form.message>
<cfset sendsave = 0>
<cfset mailto = "anup@semiprecious.com">
<cfset ccto = "#application.admin_email#">
<cfset bccto = "">
  <cfif form.contact is 'test'>
    
<cfset mailto = "cs@semiprecious.com">
</cfif>

<cfset subject = form.name & "'s Message">
<cfset mailerror = 0> <!--- 1 = >  error --->

<cfmail server="mail23.webcontrolcenter.com" from="#trim(form.contact)#" to="anup@semiprecious.com, acemat@vsnl.com" subject="Check payment at semiprecious.in"  >
#form.name# wants to make payment by by Cheque or Demand Draft<br>
Shipping Address :<br>
  #form.message#. <br>
 Email id/Phone :<br>
  #form.contact#,#form.phone#.
<strong>This mail is from semiprecious.in. Do not reply to this.</strong>

</cfmail>
<cfif find('@',form.contact)>
<cfmail server="mail23.webcontrolcenter.com" to="#trim(form.contact)#" from="service@semiprecious.com" subject="Check Payment at semiprecious.com" cc="nitish@semiprecious.com"  >
This is an automated mail. Please do not reply to this.<br>
<div style="width:800px;border:1px ridge ##FDFDFD;">
Semiprecious.com/india  cart #form.cartid#. reserved for awaited cheque/DD.<br>
Check or Draft in favour of <strong>Pragati Exports</strong> should be mailed to :<br>
      
B-67 triveni nagar<br>
Near gopalpura bye pass<br>
Jaipur 302018<br>
Rajasthan<br>
	</p>
You can view your cart items by going to http://www.semiprecious.com/indiacartview.cfm?cartid=#form.cartid#.<br>
For any query you can contact us on prashanthandicraft@gmail.com or visit the site for other contact details.<br>
Thank you for shopping with us.
</div>


For Semiprecious.com/india
</cfmail>
</cfif>
<cfquery datasource="gemssql">
update cartstatus set paymode = 'ichck', buyer = '#trim(form.contact)#' where cartid = #form.cartid#
</cfquery>
<!---  <cfloop index="k" from="1" to="#ArrayLen(session.cartitem)#">
 <cfquery datasource="gemssql" name="insertdata">
    INSERT INTO buyingrecord(cartid,email, itemid, quantity, affiliateID,datebought,optionid) 
    VALUES(#session.cartid#,'#form.contact#',#session.cartitem[k][1]#, #session.cartitem[k][4]#,'coupon',#now()#,#session.cartitem[k][5]#) 
    </cfquery>
  </cfloop> 
 
 <cfsilent>
<cfmodule template="customtags/mailsemipreciouscom.cfm" debug="1" mailto="#Variables.mailto#" ccto="#Variables.ccto#"  subject="#form.name#'s Query" mailcontent="#variables.mailcontent#" />
 ---><!--- <cfinclude template="newsletters/mailer.cfm"> --->
<!--- </cfsilent> --->
<cfif mailerror>
  There was an error in recording your message. Sorry for the inconvenience. You 
  can contact us by sending us mail at prashanthandicraft@gmail.com or call us any 
  time of the day. 
  <cfelse>
<br>
<br>
  <div class="details"> 
   
     ONLINE BANK TRANSFER TO:<p>
	 Account no: 508701010033282
	Union bank of India
 Overseas branch<br>
 1, viveka nand marg, C-scheme<br>
 Jaipur, India<br>
Swift Code : UBININBBOJP<br>       
IFSC code is UBIN0550876
	</p>
    <p><span class="details">You can view your cart items by going to http://www.semiprecious.in/indiacartview.cfm?cartid=<cfoutput>#form.cartid#</cfoutput>.<br>
Please mention behind the Check/Money Order: </span> 
      <span class="details">cart ID:<strong><cfoutput>#form.cartid#</cfoutput></strong></span> <br>
      You may contact us for any kind of query any time on email: prashanthandicraft@gmail.com
      or phone: 91-759-714-4276<br>
      <br>
      Thankyou. <cfoutput><br>
      <a href="list.cfm?#session.filter#" class="headerfont">Click 
      Here for more Shopping</cfoutput> </a></p>
   <!--- <table width="100%"><tr><td> <script type="text/javascript"><!--
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
             </td></tr></table> ---></div>
	  <!--- <script language="JavaScript">
alert("Thankyou for your Query. We  will get in touch with you.");

</script> --->
</cfif>
<cfelse>
       <div   class="details"> <div align="center">
    <div align="justify" style="width:620px;margin-top:24px;"> <font size="2">
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
	  
    1) ONLINE BANK TRANSFER TO:<p>
		<B>PRAGATI EXPORTS<br>
	<B>Account no: 50870101003328<br>
	Union Bank of India
 Overseas branch<br>
 1 Vivekanand Marg, C-scheme<br>
 Jaipur, India<br>
Swift Code : UBININBBOJP<br>       
IFSC code is UBIN0550876</B>
 <p>
 2) Submit the form with your name, email and shipping address so that we  may reserve the items placed in your cart.     </font></div>
  </div></div></div>

      <cfform action="paybycheck.cfm" method="post" enctype="multipart/form-data" name="a" target="_parent">      
	   <div  align="center" class="details"> <br>
  <table width="591" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" align="absmiddle"></td>
      <td width="547" bgcolor="#CCCC99">To select some other payment option click <a href="indiaconfirmation.cfm">here</a></td>
      <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"> <table width="100%" border="1" class="tdcenter">
          <tr> 
            <td width="42%" bgcolor="#CCCC99">Your Name</td>
            <td width="58%" bgcolor="#FFFFFF">: 
              <cfinput name="name" type="text" size="40" required="yes" id="name"></td>
          </tr>
          <tr> 
            <td bgcolor="#CCCC99">Phone No. (With STD Code)</td>
            <td bgcolor="#FFFFFF">:
			<cfif len(session.bulkbuyer.id)>
			<cfset jack = session.bulkbuyer.id>
			<cfelseif session.mail neq "">
			<cfset jack = session.mail>
					</cfif> 
          
                <cfinput name="contact" type="text" size="40" required="no" id="phone">
             </td>
          </tr>
		  <tr> 
            <td bgcolor="#CCCC99">Your Email Id</td>
            <td bgcolor="#FFFFFF">:
			<cfif len(session.bulkbuyer.id)>
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
            <td bgcolor="#CCCC99">Shipping Address</td>
            <td bgcolor="#FFFFFF">: 
              <textarea name="message" cols="36" id="message"> </textarea></td>
          </tr>
<cfoutput>    <input type="hidden" name="amount" value="#url.amt#"></cfoutput>
<cfoutput>    <input type="hidden" name="cartid" value="#url.cartid#"></cfoutput>
	      <tr bgcolor=""> 
            <td align="center" bgcolor="#FDFDFD">&nbsp; <input type="reset" name="Reset" value="Reset" class="greenbutton"> 
            </td>
            <td align="center" bgcolor="#FDFDFD"> <input type="submit" name="Submit" value="Submit" class="greenbutton"></td>
          </tr>
        </table>
        
      </td>
      <td bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td><img src="../images/jewelry_box_4.gif" width="22" height="22"></td>
      <td bgcolor="#CCCC99"> For order status  email: prashanthandicraft@gmail.com
         or call: +91-759-714-4276</td>
      <td><img src="../images/jewelry_box_2.gif" width="22" height="22"></td>
    </tr>
  </table>
  </cfform>
 You will recieve the address and pay to details on submitting the above form and also by email.

<p>
<!--- <!-- <cfinclude template="index1.cfm"> --> --->
<br>
      <span class="copyright">The Content, Designs,  Jewelry, 
      and Functionality of this website are the property of Semiprecious.com &copy; and are
      protected by Copyright and Trademark Law. </span></div>  

</cfif>   
</div>
</div>  
<cfinclude template="mainfooter.cfm" />
  </div>
    </body>
</html>
