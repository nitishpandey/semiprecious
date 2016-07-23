<CFPARAM name="newitem" default="">
<html>
<head>
<title>Whole Sale at Semiprecious.com</title>
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
<body topmargin="1" leftmargin="1" >
 <cfinclude template="header.cfm">
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
<cfset ccto = "nitishpandey@rediffmail.com">
<cfset bccto = "">
  <cfif form.contact is 'test'>
    
<cfset mailto = "nitish@semiprecious.com">
</cfif>

<cfset subject = form.name & "'s Message">
<cfset mailerror = 0> <!--- 1 = >  error --->

<cfmail from="#form.contact#" to="anup@semiprecious.com" subject="#form.name#'s wholesale " cc="nitish@semiprecious.com"  >
<cfif not isdefined("form.whole")>
#form.name#  #form.message#.  Reply  at #form.contact#.
</cfif>

</cfmail>
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

   <div class="details">  <cfif not isdefined("form.whole")>
Your query/message has been forwarded to our customer service team. <br>
  You can also contact us for any kind of query any time on email: anup@semiprecious.com, phone: 512 589 9009. 
or      Mailing Address: Stacy Pandey, 1216 Dexford Drive, Austin, TX, 78753.<br>
<br></cfif>
<cfoutput> <a href="list.cfm?#session.filter#" class="headerfont">Click Here to Continue 
      Shopping</cfoutput> </a></div>
	  <!--- <script language="JavaScript">
alert("Thankyou for your Query. We  will get in touch with you.");

</script> --->
</cfif>
<cfelse>

   
  

      <cfform action="wholeseller_reseller_contact.cfm" method="post" enctype="multipart/form-data" name="a" target="_parent">      
       <div   class="details"> 
<font size="2">
     <br>
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
  We offer excellent opportunity for wholesellers and resellers. If you are a 
  full time jewelry seller (online or have a store) or do it as a part time business 
  we would love to extend our program to you. Just fill in the form below specifying 
  your contact details and we would forward the details at the earliest.<br>
  </font> </div>
<div  align="center" class="details"> <br>
  <table width="591" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="22"><img src="../images/Untitled-1.gif" width="22" height="22" align="absmiddle"></td>
      <td width="531" bgcolor="#CCCC99">Whole Sellers Semiprecious.com Contact 
        Form</td>
      <td width="22"><img src="../images/Untitled-3.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF"> <table width="100%" border="1" class="tdcenter">
          <tr> 
            <td width="35%" bgcolor="#CCCC99">Your Name</td>
            <td width="65%" bgcolor="#FFFFFF">: 
              <cfinput name="name" type="text" size="40" required="yes" id="name"></td>
          </tr>
          <tr> 
            <td bgcolor="#CCCC99">Contact Details (Phone/Postal/ Email/Fax) </td>
            <td bgcolor="#FFFFFF">: 
              <cfif session.mail neq "">
                <cfoutput> 
                  <cfinput name="contact" type="text" size="40" value="#session.mail#" required="yes" id="contact">
                </cfoutput>
                <cfelse>
                <cfinput name="contact" type="text" size="40" required="yes" id="contact">
              </cfif> </td>
          </tr>
          <tr> 
            <td bgcolor="#CCCC99"><p>Your Message (If any):</p>
              </td>
            <td bgcolor="#FFFFFF">: 
              <textarea name="message" cols="36" id="message"> <cfif  isdefined("url.newitem")  > (For item ## <cfoutput>#url.newitem#</cfoutput>).  </cfif></textarea></td>
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
      <td><img src="../images/Untitled-4.gif" width="22" height="22"></td>
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td><img src="../images/Untitled-2.gif" width="22" height="22"></td>
    </tr>
  </table>
  </cfform>
	
      You can also contact us on email: anup@semiprecious.com, call: 512 589 9009. 
      Mailing Address: Stacy Pandey, 1216 Dexford Drive, Austin, TX, 78753.<br>
<cfoutput> <a href="list.cfm?#session.filter#" class="headerfont">Continue 
      Shopping</cfoutput> </a>  
    <script>	        document.forms[0].name.focus();
	 </script>
<p>
<!--- <!-- <cfinclude template="index1.cfm"> --> --->
<br>
      <span class="copyright">The Content, Designs,  Jewelry, 
      and Functionality of this website are the property of Semiprecious.com &copy; and are
      protected by Copyright and Trademark Law. </span></div>  

</cfif>     
  
    </body>
</html>
