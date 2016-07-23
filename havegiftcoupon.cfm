<html>
<head>
<title>Redeem your Gift certificate</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/rows.css" rel="stylesheet" type="text/css">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="1"><cfinclude template="header.cfm">
<cfif isdefined("form.id")>
  <cfquery datasource="semiprecious" name="check">
  select * from gifts where id = '#form.id#' and status = 'ACT' and validity = 
  '#form.validity#' 
  </cfquery>
  <cfif check.recordcount >
    <br>
    Your gift certificate validated!<br>
    <cfoutput>You can start shopping. We will give you a straight disount of #dollarformat(check.amt)#. <br>
      Further instructions will be provided to you on the check out page. Wish 
      you happy shopping experience. If you have any difficulty or questions call 
      us now at 1 512 589 9009. Thankyou.</cfoutput> 
    <cfset session.giftamt = check.amt>
    <cfset session.giftid = check.id>
    <cfelse>
    <cfquery datasource="semiprecious" name="check">
    select * from gifts where id = '#form.id#' and status = 'NEW' and validity 
    = '#form.validity#' 
    </cfquery>
    <cfif check.recordcount>
      <br>
      The gift certificate is yet to be activated. The gift certificate is activated 
      immediately after payment is confirmed. In case the payment was made using 
      2Checkout payment gateway the certificate is activated on recieving confirming 
      mail from them. This normally takes 24 hrs.<br>
      In case you think that this is incorrect please mail us the gift id and 
      we will resolve any problem.<br>
      Or try <a href="havegiftcoupon.cfm">again</a>. 
      <cfelse>
      Either the giftid or the validating key is incorrect. Please try <a href="havegiftcoupon.cfm">again</a>. 
    </cfif>
  </cfif>
  <cfelse>
  <br>
  <cfform method="post" action="havegiftcoupon.cfm">
    <img src="images/gift.gif" width="30" height="30"> Fill in the following details 
    to redeem your gift amount: 
    <table width="629"  cellspacing="0" border="1" bordercolor="#666600" cellpadding="0">
      <tr> 
        <td colspan="2" align="left"></td>
      </tr>
      <tr> 
        <td width="337" bgcolor="#DADA99">Gift Certificate Id</td>
        <td width="286" align="left">: 
          <input name="textfield" type="text" value="SP-" size="3" maxlength="2">
          - 
          <input name="textfield3" type="text" size="4" maxlength="3">
          - 
          <cfinput name="id" type="text" size="12" maxlength="30" required="yes" message="Please provide the certificate id."> 
        </td>
      </tr>
      <tr> 
        <td bgcolor="#DADA99">Validating Key (Provided on the gift certificate)</td>
        <td align="left">: 
          <cfinput name="validity" type="text" size="20" maxlength="30" required="yes" message="Please enter Validitating details."> 
        </td>
      </tr>
      <tr> 
        <td bgcolor="#666600">&nbsp;</td>
        <td align="center" bgcolor="#666600"> <input name="Submit" type="submit" class="greenbutton" value="Validate"> 
        </td>
      </tr>
    </table>
    <p><span class="details">To Buy a gift certificate for a friend click <a href="gift_certificatenew.cfm">here</a></span>.</p>
  </cfform>
</cfif>
<cfinclude template="footer.htm">
</body>
</html>
