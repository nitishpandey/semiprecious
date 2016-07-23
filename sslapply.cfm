<CFPARAM NAME="login" DEFAULT="">

<cfquery datasource="semiprecious" name="q">
select max(nlstatus) as maxnlstatus from memberinfo
</cfquery>

<html>
<head>
<title>Semiprecious.com membership application</title>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<BODY BGCOLOR="white" text='black' link="black" vlink=black alink=black topmargin='0'>
<CFINCLUDE TEMPLATE="/header.cfm"> <cfoutput> 
      <CFIF login IS NOT "">
        <font color='red'><b>Sorry, we did not find any records under the email 
        address of #login#. Please apply below so you can avail of discount coupons 
        sent by emails.</font></b> 
      </CFIF>
    </cfoutput> 
	<table>
      <tr> 
        
    <td width="222" valign="middle" nowrap> 
      <h3> Subscription Form</h3>
        </td>
        
    <td width="522" align="left" valign="middle" nowrap>Please note: Subscription 
      is optional. It is not compulsory or necessary for making purchases.</td>
      </tr>
    </table>
    
<TABLE border=0 cellPadding=1 cellSpacing=1 width=100%>
  <TR> 
    <TD colspan="3"> <CFFORM ACTION="apply2.cfm" METHOD="POST"> Please enter the 
      requested information. Entries marked with a '<font color="red" size="1">*</font>' 
      are compulsory . </TD>
    <TD width="17%" rowspan="3"> </TD>
  </TR>
  <TR> 
    <TD width="17%" rowspan="2" align="left" valign="top"> Name<font color="red" size="1">*</font>:<br> 
      <CFinput class="inputtext" TYPE="text" NAME="firstname" REQUIRED="Yes" MESSAGE="Name is required.">
      Address 1:<br> <input class="inputtext" TYPE="text" NAME="address1" /><br>
      Address 2:<br>
      <input class="inputtext" type="text" name="address2" /><br>
      City:<br> 
      <CFinput class="inputtext" TYPE="text" NAME="city" required="no">
      <font color="red" size="1">&nbsp;</font>Zip:<br> <CFinput class="inputtext" TYPE="text" NAME="zip"><br>
      <br> <br> </TD>
    <TD width="17%" rowspan="2" align="left" valign="top"> 
      Email<font color="red" size="1">*</font>:<br> <CFinput class="inputtext" TYPE="text" NAME="email" Required="yes" message="Please Fill in the emailid. " >
      <font color="red" size="1">&nbsp;</font>State/Province:<br> <CFinput message="Please provide a state/province" class="inputtext" TYPE="text" NAME="state" required="no" >
      Country<font color="red" size="1">*</font>:<br> <CFinput class="inputtext" TYPE="text" NAME="country" required="yes" message="Please fill in your country name." >
      Phone Number<font color="red" size="1">*</font>:<br> <CFinput class="inputtext" TYPE="text" NAME="phonenumber"  required="yes">
      <p>&nbsp;        &nbsp;&nbsp;&nbsp;&nbsp; 
        <INPUT name="submit" TYPE="submit" VALUE="Subscribe" class="greenbutton">
      </p>
      </TD>
    <TD width="49%" align="left"><table  border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="22"><img src="../images/Untitled-1.gif" width="22" height="22" align="absmiddle"></td>
          <td  bgcolor="#CCCC99">&nbsp;</td>
          <td width="22"><img src="../images/Untitled-3.gif" width="22" height="22" align="absmiddle"></td>
        </tr>
        <tr> 
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF">
<table border="2" bordercolor="#663300" bgcolor="#FFFFFF">
              <tr> 
                <td width="392"> <span class="error1"> Subscribers get the following</span> 
                  <ul>
                    <li>Discount Coupon via email once a month to apply discounts 
                      of 10 to 30% on specific items or total order. </li>
                    <li>The monthly email would announce items on <b>sale</b> 
                      and list of <b>new items</b>.</li>
                    <li>And other privileges including wish list.</li>
                  </ul>
                  <p><strong>Privacy Statement:</strong><span class="title">Your 
                    email address will not be sold or given to anyone, merely 
                    to be used to record your credits and purchases for internal 
                    use. Your phone number will only be used if your email fails 
                    since you may have changed your email address. </span></p>
                  <p>To unsubscribe you can send an email to anup@semiprecious.com 
                    with subject 'unsubscribe' or visit <a href="http://www.semiprecious.com/unsubscribe.cfm">http://www.semiprecious.com/unsubscribe.cfm</a></p></td>
              </tr>
            </table>
            
          </td>
          <td bgcolor="#CCCC99">&nbsp;</td>
        </tr>
        <tr> 
          <td><img src="../images/Untitled-4.gif" width="22" height="22" align="absmiddle"></td>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td><img src="../images/Untitled-2.gif" width="22" height="22"></td>
        </tr>
      </table></td>
  </TR>
  <TR> 
    <TD align="center" valign="bottom">  
      <INPUT name="nlstatus" TYPE="hidden" VALUE="#q.maxnlstatus#"> <br></CFFORM> 
    </TD>
  </TR>
</TABLE>
   <cfinclude template="/footer.htm"> 
</body>
</html>