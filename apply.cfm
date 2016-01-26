<CFPARAM name="URL.EMAILID" default="" />
<CFPARAM NAME="login" DEFAULT="">
<cfquery datasource="gemssql" name="q">
select max(nlstatus) as maxnlstatus from memberinfo
</cfquery>
<cfset title="Semiprecious.com Pendants, Rings and Silver Jewelry Online Store"/>

<cfsavecontent variable="inheader">
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="/CFIDE/scripts/cfform.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript" SRC="/js/global.js"></SCRIPT>
    <script src="headhunting/js/jquery-1.5.min.js"></script>

<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--

function  _CF_checkCFForm_1(_CF_this)
{
	if  (!_CF_hasValue(_CF_this.firstname, "TEXT",true))
	{
		if  (!_CF_onError(_CF_this, _CF_this.firstname, _CF_this.firstname.value, "Name is required."))
		{
								alert("Please Fill In Your Name.");
return false;
		}
	}

	if  (!_CF_hasValue(_CF_this.email, "TEXT" ,true))
	{
		if  (!_CF_onError(_CF_this, _CF_this.email, _CF_this.email.value, "Please Fill in the emailid. "))
		{
							alert("Email Id is Required.");
	return false;
		}
	}

	if  (document.getElementById('country_dropdown').selectedIndex == 0 )
	{

					alert("Please Select Your Country");
					return false;

	}


	return true;
}


//-->
</SCRIPT>
</cfsavecontent>
<CFINCLUDE TEMPLATE="/header#session.country#.cfm">

<div id="container2">
<table id="container3" cellspacing="0" cellpadding="0" border="0" style="padding:0 4px 0 4px">
  <tr  align="center">

  <!---<td valign="top"  align="center" ><!--- BEGIN LEFT SIDE STUFF --->
    <CFINCLUDE TEMPLATE="leftmenus.cfm">
    <!--- END LEFT SIDE STUFF --->
  </td>--->
  <td align="center" valign="top" style="padding:2px;">

<cfoutput>
      <CFIF login IS NOT "">
        <b><font color='red'>Sorry, we did not find any account under the email
        address of #login#. Please sign up first. </font></b>
      </CFIF>
    </cfoutput>
  <div class="grayplacard" style="float:left;width:80%;text-align:left;padding-left:2px;font-weight:bold;">Sign Up </div>

    <FORM NAME="CFForm_1" ACTION="apply2.cfm" METHOD="POST" style="display:inline;" onSubmit="return _CF_checkCFForm_1(this)">
<table border="0" cellpadding="0" cellspacing="0" style="margin-top:20px; padding:1px;background:white;">

   <tr>
        <td width="300px" align="left" valign="top" style="padding:8px;">
        <cfoutput>
     <font color="red">*</font>Email Id<br /><INPUT TYPE="text" NAME="email" value="#url.emailid#" title="Your email id will be sign up name and contact for shipments etc." CLASS="inputtext" size="40" /><br />
          <font color="red">*</font>Name<br />
            <INPUT TYPE="text" NAME="firstname" CLASS="inputtext"  size="40" /><br />
           <font color="red">*</font>Country:
		   <cfif session.country is "india">
		   <input type="hidden" name="country" value="india" />India
		   <cfelse><br />
		   <cfinclude template="includes/countries_drop_down.htm" />
		   </cfif>
		   <!-- <INPUT TYPE="text" NAME="country" CLASS="rings" size="40"> -->
		   <br /><span style="color:red;margin-top:20px;"><a  class="link" href="##" onClick="javascript:flipDisplay('optional_apply_info')">Fill in optional information</a> <br /></span>
		  <div style="display:none;" id="optional_apply_info">
     <br /><span style="color:gray;">  Phone Number:</span></cfoutput>
	  <br /> <INPUT TYPE="text" NAME="phonenumber" CLASS="rings" size="40"/><br />
<div style="position:relative;margin-top:20px;margin-bottom:20px;padding:10px;padding-top:14px;width:220px;" class="component_box">
<span style="width:160px;background-image:url('headhunting/images/hash.gif')	;color:black;position:absolute;top:-16px;left:5px;background-color:white;padding:2px;border:1px gray solid;" class="single_row"> Recieve Offers On</span>      Your Birthday<br>
Date: <select name="dob"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select> - Month: <select name="mob"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>           <br>
Your anniversary<br>
Date: <select name="doa"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select> - Month: <select name="moa"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>           <br>
  </div>
	    <span  >      Address Line 1:</span><br />
            <input class="rings" TYPE="text" NAME="address1"	 size="40" /><br />

           <span  >   Address Line 2:</span><br />
            <input class="rings" type="text" name="address2" size="40" /><br />

            <span  >  City:</span><br />
            <INPUT TYPE="text" NAME="city" CLASS="rings" size="40" /><br />

            <span  >  ZIP Code:</span><br />
            <INPUT TYPE="text" NAME="zip" CLASS="rings" size="40" /><br />


      <span  >  State/Province:</span><br /> <INPUT TYPE="text" NAME="state" CLASS="rings" size="40"><br />
         </div>
          </p>
          <!-- discontinued due to referral program. to minimise change form variables added as hidden variables
<span class="detail"> <strong>ONE TIME OFFER! Invite friends </strong>right now
           to get <cfoutput>#format(5)# points for each friend invited (This is for helping us advertise). <strong>That makes it #format(10)#</cfoutput></strong> in your account!<br></span>
          Email of Friend 1: <br />
          <INPUT TYPE="text" NAME="friend1" CLASS="rings" style="border-color:blue"  size="40"/><br>
          Email of Friend 2: <br />
          <INPUT TYPE="text" NAME="friend2" CLASS="rings" style="border-color:blue" size="40"/><br /><br />
          (<em>This offer is optional <a name="signup_button">&amp;</a> available only at sign-up.</em>)<br />
          </p>-->
            <INPUT TYPE="hidden" NAME="friend1" CLASS="rings" value="" />
              <INPUT TYPE="hidden" NAME="friend2" CLASS="rings" value="" />
          <br /><div align="center">
          <INPUT name="submit" TYPE="submit" VALUE=" &nbsp;Sign Up  &nbsp; " class="ContactUsBtn"  /></div>

      <INPUT name="nlstatus" TYPE="hidden" VALUE="#q.maxnlstatus#" /> <br />

          </td>
    <td align="center" valign="top" style="padding:10px;">
    <table  border="0"  style="margin-left:4px;"cellspacing="0" cellpadding="0">
        <tr>
          <td align="center" bgcolor="#FFFFFF">
<table border="0" bordercolor="#663300" bgcolor="#FFFFFF">
              <tr>
                    <td width="392" align="center"
					 class="notice_box_title"> Signed in advantages
					</td></tr><tr><td>
                     <cfoutput>  <ul>
                      <!---  <li><span style="color:red">Get <cfif session.country is 'india'> #format(200/application.exch['india'])# <cfelse>#format(5)#</cfif> loyalty points </span> right now in your account <EM>for signing
                          up </EM></li>
                        <li> Use loyalty points for cash discounts: #application.own_credit#% for most items and #application.own_credit/2#% of the price of sale items</li>

                         <li> You get #application.own_credit#% of value of purchases (sales items, beads, designer items not included)

                          as loyalty points to get a discount in next purchase</li>

                        <li><strong>Invite friends now to  get additional  discount </strong> for the very first
                          purchase</li>
                        <li>The benefits add up when you tell a friend about us - Invited friends help you <span style="background-color: white">you
                           </span>get #application.friend_credit#% of their purchase value added to your discount points.
						   </li>--->
                        <li>Monthly emails will announce items on <b>sale</b>
                          and a list of <b>new items</b>.</li>

                      </ul></cfoutput>
</td></tr>
<tr><td align="center" class="notice_box_title">
                  <strong>Privacy Statement</strong>
				  </td></tr><tr><td>
				  <span class="title"> <b>No Spams.</b> We only use your communication information to send you discount mailers, shipments, issues, refunds etc.
                        </span>
                  <p>Unsubscribe any  time by visiting http://www.semiprecious.com/unsubscribe.cfm
                   </p></td>
              </tr>
            </table>
            <!---
       <p style="text-align:center"  class="notice_box_title">How does the discount system work?</p>



          <p class="itemdetailsboxgreen" style="width:100%;margin-top:2px;"><span style="color:white;margin-top:2px;">Our system automatically adds  credit to your account from every purchase made by you or your  friends.
		  This credit in your account  is  then used  to reduce your billing amount up to 20% in every later purchase. As long as you have credits in your account, you can get 20% off regular prices and 10% off the sale prices.
		  </span>
		  </p>
		  ---><p>
		  <!-- <a class="login_link" href="/wholesale_register.cfm">For buying in bulk or for retail business selling register here</a> --></p></td></tr>
      </table>
      </td>
  </tr>
   </table>
</FORM>

</td>
</tr>

</table>
</div>
</div>
</div>
<cfinclude template="mainfooter.cfm" />
