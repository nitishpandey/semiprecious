<cfparam name="initialamt" default="250" type="Numeric">
<cfparam name="lateramt" default="125" type="numeric">
<html>
<head>
<title>Register as Whole Sale Buyer or as a Reseller</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css"><script language="JavaScript" type="text/JavaScript">
<!--
<cfif isdefined("url.msg")>
<cfoutput>
alert('#url.msg#...Please Login now');
</cfoutput>
</cfif>
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->

function MM_changeProp(objName,x,theProp,theValue) { //v6.0
  var obj = MM_findObj(objName);
  if (obj && (theProp.indexOf("style.")==-1 || obj.style)){
    if (theValue == true || theValue == false)
      eval("obj."+theProp+"="+theValue);
    else eval("obj."+theProp+"='"+theValue+"'");
  }
}
//-->
</script>
</head>

<body>
<cfinclude template="header.cfm">
<cfinclude template="udf.cfm">
<br>
<span class="details">Use this form to register yourself as a 'Whole Sale' buyer 
or as a reseller (Affiliate). After the registration login to view and shop at 
wholesale prices. </span> 
<cfform action="bulkbuyerregister.cfm" method="post">
  <table width="591" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="22"><img src="../images/Untitled-1.gif" width="22" height="22" align="absmiddle"></td>
      <td width="531" bgcolor="#CCCC99">&nbsp;</td>
      <td width="22"><img src="../images/Untitled-3.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center" background="images/bottom_bg.gif" bgcolor="#FFFFFF"> 
        <table align="center" bgcolor="#FFFFFF">
          <tr> 
            <td bgcolor="#FFFFFF">Email:</td>
            <td><cfinput type="text" name="email" required="yes"></td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF">Your Id:</td>
            <td><cfinput type="text"  name="id" required="yes"></td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF">Name:</td>
            <td><cfinput type="text" name="name" required="yes"></td>
          </tr>
          <!--       <tr>
            <td bgcolor="#FFFFFF">Minimum Amount:</td>
            <td> -->
          <input type="hidden" name="minamt" required="yes" value="<cfoutput>#initialamt#</cfoutput>">
          <tr> 
            <td bgcolor="#FFFFFF">Password:</td>
            <td><cfinput type="text" name="password" required="yes"></td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF">Shipping Address:</td>
            <td><cfinput type="text" name="address" required="yes"></td>
          </tr>
		  <input type="hidden" name="paymode" value="na">
     <!--      <tr> 
            <td bgcolor="#FFFFFF">Paymode:</td>
            <td><cfinput type="text" name="paymode" required="no"></td>
          </tr>
          <tr>  -->
            <td align="center" bgcolor="#FFFFFF"> <input name="reset" type="reset" tabindex="2"> 
            </td>
            <td align="center" bgcolor="#FFFFFF"> <input name="submit" type="submit" value="Register"> 
            </td>
          </tr>
        </table>
        
      </td>
      <td bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td><img src="../images/Untitled-4.gif" width="22" height="22" align="absmiddle"></td>
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td><img src="../images/Untitled-2.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
  </table>
</cfform>
<font color="#C10000">Please Note: </font>As a whole sale buyer you must comply 
with the following requirements
<ul>
  <Li>First purchase of $ <cfoutput>#initialamt#</cfoutput> atleast</Li>
  <li>Later purchases of $ <cfoutput>#lateramt#</cfoutput> atleast.</li>
  <li>Affiliates Program:<span class="details"> You will receive three 'Third 
    party discount coupons' meant for your customers. You get to decide how much 
    discount you want to allot to each coupon (upto a maximum of 35%). Your customers 
    can then use those discount coupons for purchases from semiprecious.com. The 
    profits from these sales will be transferred to you. <a href="as.htm"  onClick="MM_changeProp('thirdparty','','style.visibility','visible','DIV'); return false;">This 
    is how it works</a> .</span></li>
</ul>


<cfif isdefined("form.id")>
<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
select * from bulkbuyers where email = '#form.id#'
</cfquery>
<cfif q1.recordcount GT 0>
A buyer with the email already exists! Have you already registered? Try logging in.
<cfelse>
<cfset membershipdate = createodbcdate(dateformat(dateadd('d',30,Now()),'yyyy-mm-dd'))>
<cfquery datasource="sptm" password="rangeela" username="nitish">
insert into bulkbuyers (name,email,registered,id,minamt,password,address,status <cfif isdefined("form.paymode")>,paymode</cfif>,membershipdate) 
values ('#form.name#','#form.email#',#now()#,'#form.email#', #form.minamt#, '#form.password#', '#form.address#', 1 <cfif isdefined("form.paymode")>,'#form.paymode#'</cfif>,#membershipdate# )
</cfquery>
<br>
Wholesale buyer/Reseller registered!
<!--- With following details:
    <cfoutput>#form.name#,#form.email#,ID is #form.id#, #form.minamt#, Password is #form.password#,<br>
#form.address#</cfoutput> --->
	<br>
<!-- Please remember to inform the buyer the id + password. -->
	<cfset coupon1  = couponcalc()>
		<cfset coupon2  = couponcalc()>
			<cfset coupon3  = couponcalc()>
			<!--- The following coupons generated : 
			  <cfoutput>#coupon1#|#coupon2#|#coupon3#</cfoutput> --->
			<cfquery datasource="sptm" password="rangeela" username="nitish">
insert into bulkbuyercoupons (id,name,code,discount) 
values ('#form.id#', 'coupon1', '#coupon1#', 10 )
</cfquery>
			<cfquery datasource="sptm" password="rangeela" username="nitish">
insert into bulkbuyercoupons (id,name,code,discount) 
values ('#form.id#', 'coupon2', '#coupon2#', 20 )
</cfquery>

			<cfquery datasource="sptm" password="rangeela" username="nitish">
insert into bulkbuyercoupons (id,name,code,discount) 
values ('#form.id#', 'coupon3', '#coupon3#', 30 )
</cfquery>
<cflocation addtoken="no" url="bulkbuyerlogin.cfm?msg=You%20Have%20Registered">


<br>
<!--- <cfoutput><a href="registrationinfobulkbuyer.cfm?id=#form.id#">Inform</a> the bulk buyer?</cfoutput> --->
</cfif>
 </cfif><div id="thirdparty" style="visibility:hidden;width:600;border:solid thin black;position:absolute;top:190px;left:40px;color:black;font-size:12pt;font-color:black;bg-color:white;background-color:white;padding:10px;" > 
        The Semiprecious reseller Privilege Program makes the entire Semiprecious.com 
        collection available to you - for increasing your business revenue. Once 
        you are registered with us we will provide you with 3 discount coupons, 
        which will be linked to your individual reseller ID: coupon1, coupon2 
        and coupon3. Each coupon carries a discount value. You can control and 
        change this discount value for each coupon from time to time. When your 
        customer purchases from semiprecious.com, he/she will be asked to enter 
        the coupon code to avail the discount. The customer gets the discount, 
        and you - the whole seller - gets the profit! The profit to be credited 
        to you will be calculated as the difference between the price paid by 
        your customer and the wholesale cost, reduced by 5% (for shipping & handling 
        charges). Example: Item # 988 is costing $100 on the site. Our whole sale price for 
        the item is $60.00. If your customers uses a coupon with discount of 10% 
        he/she will be billed $ (100 - 10) = $90.00. Thus the profit you earn 
        is $90 - $60 = $30.00. Subtract 5% for shipping & handling, and $27 will 
        be credited to your account. You make no investment….only profit. For 
        further clarification please write in or call us. We'll be happy to help 
        you out! :) <br>
        <a href="as.htm"  onClick="MM_changeProp('thirdparty','','style.visibility','hidden','DIV'); return false;">CLOSE</a>.</div>
     
<cfinclude template="footer.htm">
</body>
</html>
