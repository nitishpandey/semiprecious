<html>
<head>
<title>Change Your Subscription Email Id</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.warning {
	font: bold 14px "Courier New", Courier, mono;
	color: #FF3366;
}
-->
</style>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0">
<div align="center">
<CFINCLUDE TEMPLATE="../#session.country#/header.cfm">
<cfif isdefined("form.email2") or isdefined("form.email1")>
		<cfif form.email1 EQ form.email2>
				<cfquery  datasource="semiprecious" name="q_valid1">
				select * from memberinfo where  email = '#form.email#'
				</cfquery>
				<cfquery  datasource="sptm" name="q_valid2">
				select * from bulkbuyers where  email = '#form.email#'
				</cfquery>
			
			<cfif q_valid1.recordcount  or q_valid2.recordcount  >
				<cfquery datasource="semiprecious">
				update memberinfo set email = '#form.email1#' where email = '#form.email#'
				</cfquery>
				<cfquery datasource="sptm" username="nitish" password="rangeela">
				update bulkbuyers set email = '#form.email1#', id= '#form.email1#' where email = '#form.email#'
				</cfquery>
				
				
				<cfquery datasource="gemssql">
				update  cartstatus set buyer = '#form.email1#' where buyer = '#form.email#'
				</cfquery>
				
				<cfquery datasource="gemssql">
				update  purchase set email = '#form.email1#' where email like '%/#form.email#'
				</cfquery>
				
				<cfquery datasource="sptm" username="nitish" password="rangeela">
				update  invite_credits set email = '#form.email1#' where email= '#form.email#'
				</cfquery>
				
				<cfquery datasource="sptm" username="nitish" password="rangeela">
				update  invited set email = '#form.email1#' where email= '#form.email#'
				</cfquery>
				
				<cfquery datasource="sptm" username="nitish" password="rangeela">
				update  invited set byemail = '#form.email1#' where byemail= '#form.email#'
				</cfquery>
				
				<cfquery datasource="gemssql">
				update  crmkey set email = '#form.email1#' where email= '#form.email#'
				</cfquery>
				
				
				
				<cfquery datasource="gemssql">
				update  buyingrecord set email = '#form.email1#' where email = '#form.email#'
				</cfquery>
				<cfoutput>Mailers will now be sent to your email id '#form.email2#'.
				<br />
				            Click <a href="/simpleloginform.cfm">Here</a> to Login.</cfoutput> 
          <cfelse>
		  <br>
          <span class="warning">Invalid Emailid (original)... </span>. 
          <a href="">Try Again</a> . 
        </cfif> <!--- if q_valid.recordcount --->
<cfelse>
<cfoutput>Your new Email id has been entered incorrectly ( #form.email1# and #form.email2#).<br />
 <a href="">Click here</a> to fill details 
          again.</cfoutput> 
      </cfif> <!--- if not defined formemail2 --->
<cfelse>
<!--- if form.email = form.email2 --->
<br>

<div align="center"  class="details">  <cfform ACTION="http://www.semiprecious.com/admintools/changeemailid.cfm" METHOD="POST">
<span style="width:600px;">Here you can change the email id that 
  we will send our  mailers to... </span> 
    <table width="591" border="0" cellspacing="0" cellpadding="0">
      <tr> 
          <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" align="absmiddle" id you can change the email that we will send our 'new item' and discount mailers 
to. ></td>
        <td width="531" bgcolor="#CCCC99">&nbsp;</td>
        <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle"></td>
      </tr>
      <tr> 
        <td bgcolor="#CCCC99">&nbsp;</td>
        <td align="center" bgcolor="#FFFFFF"> <table width="308" border="1" cellpadding="1">
            <tr> 
              <td width="128" bgcolor="#DADA99">New Email id</td>
              <td width="164">: 
                <cfinput name="email2" type="text" required="yes"></td>
            </tr>
            <tr> 
              <td bgcolor="#DADA99">Confirm New Id</td>
              <td>: 
                <cfinput name="email1" type="text" required="yes"></td>
            </tr>
            <tr> 
              <td bgcolor="#DADA99">Old Email id</td>
              <td>:
                <cfif isdefined("url.email")>
                  <cfoutput> 
                    <cfinput required="yes" value="#url.email#" type="text" name="email">
                  </cfoutput> 
                  <cfelse>
                  <cfinput required="yes"  type="text" name="email">
                </cfif></td>
            </tr>
    <!---         <tr> 
              <td bgcolor="#DADA99">Password</td>
              <td>: 
                <cfif isdefined("url.password")>
                  <cfoutput>
                    <cfinput type="password"  value="#url.password#" required="yes" name="lastname">
                  </cfoutput> 
              <cfelse>
              <cfinput type="password" required="yes" name="lastname"></cfif></td></tr> --->
          </table></td> 
          <td bgcolor="#CCCC99">&nbsp;</td>
      </tr>
      <tr bgcolor="#666600">
        <td>&nbsp;</td>
        <td align="center"><input name="submit" type="submit" class="greenbutton"value="Change Email/Id"> 
        </td> <td>&nbsp;</td>
      </tr>
    </table>
    </cfform>
</div>
</cfif>
   <cfinclude template="/mainfooter.cfm"> 
</div>
</body>
</html>
