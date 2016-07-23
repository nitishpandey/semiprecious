<cfset title="Jewelry Buyers' Loyalty Discount Login" />

<cfparam default="" name="url.msg" type="string" />
<cfswitch expression="#url.msg#">
<cfcase value="tempfini">
	<cfset welcome_msg = "Looks like your shopping session was restarted at the server end. You are requested to log in again" />
</cfcase>
<cfcase value="retry">
<cfif len(session.bulkbuyer.id)>
<cfset signup_url = 'wholesale_register.cfm'>
<cfelse>
<cfset signup_url = 'apply.cfm'>

</cfif>
	<cfset welcome_msg = "<span style='color:red'>No account found for this email id. If you are signed up please see that you have entered the correct email id</span>. Click here to <a href='#signup_url#'>sign up</a> for discounts." />
</cfcase>

<cfdefaultcase>o
	<cfset welcome_msg = "Sign in to use and earn semiprecious.com cash for discounts (As per T&amp;C)" />
</cfdefaultcase>
</cfswitch>



<!---<cfif isdefined("session.bulkbuyer.id") >:
	<cfif session.bulkbuyer.id neq "pondyiitd@yahoo.com">
			<cfif len(trim(session.bulkbuyer.id))>
			     <cflocation addtoken="no"  url="whole_login.cfm">
			<cfelse>
			    <cfset structdelete(session,'bulkbuyer')>
			</cfif>
	</cfif>
	<cfif len("session.mail") or isdefined("url.email")>
			<cfif isdefined("url.email") and len(url.email)>
			    <cflocation addtoken="no" url="login.cfm?email=#url.email#" >
			</cfif>
			<cfif len(session.mail)>
			    <cflocation addtoken="no" url="login.cfm?email=#session.mail#" >
			</cfif>
	</cfif>
</cfif>
--->
    <CFINCLUDE TEMPLATE="/header#session.country#.cfm">
    <div id="container2">
  <table  style="width:100%"  >
    <tr >
      <td valign="top"  align="left" style="width:174px"  ><!--- BEGIN LEFT SIDE STUFF --->
        <CFINCLUDE TEMPLATE="leftmenus.cfm">
        <!--- END LEFT SIDE STUFF --->
      </td>
      <td align="center" valign="top" style="padding:2px 0;">
      	
  <div  style="height:540px;padding-top:10px;margin-bottom:10px;margin-left:2px;background:white;" align="center"> 
   
<div style="height:540px;padding-top:10px;margin-bottom:10px;margin-left:2px;background:white;" align="center"> 
   
  <div id="banner" style="margin-top:30px;">
<cfoutput>#welcome_msg#</cfoutput></div>
  
  
  <div style="width:482px;padding:0;margin-top:30px;">
<form name="CFForm_1" id="CFForm_1" action="/login.cfm" method="get" onsubmit="return _CF_checkCFForm_1(this)">
 
               <div class="component_box" style="background:white;width:440px;padding:16px;">
                Your Email Id <span>
               		<input name="email" id="email" type="text" class="inputtext" size="30" width="30"></span> <div align="center" style="margin-top:14px;">
					<input name="submit" type="submit" value="&nbsp;Login&nbsp;" class="ContactUsBtn" /> </div>
			   </div>
  </form>

</div>
<div style="width:465px;margin:40px;border:1px solid black;background:white;padding:2px;" align="center">
<div style="width:440px;background:gray;color:white;padding:12px;" align="center">
<a href="apply.cfm" style="color:white;">New? Sign up in less than a minute</a> &nbsp;&nbsp;
<!-- <a href="wholesale_register.cfm">Wholesale 
  or Bulk Buyers Register Here </a> --></div></div>
  <div style="width:726px;margin-top:40px;margin-bottom:40px;display:none" align="justify"> <span class="details"><br>
   <strong> Benefits as a member: </strong>You'll get a credit of $5.00 right away for 
    allowing us to stay in touch with you on email.  Further, you'll receive a 20% credit for every 
    purchase you make. This credit will be used for giving you discount in your next purchase. In simple words we want to reward our regular and loyal customers. 
	From time to time, we also give you 
    discount coupons for specific items. These will be sent to you through our newsletters and email.
    As a member you can invite friends to shop at semiprecious.com and each 
    time a friend of yours buys at our store we give YOU points that can be used for calculating your discounts. Finally, it is &nbsp; &nbsp;<a href="unsubscribe.cfm">easy 
  to Unsubscribe</a>. So give it a shot and  <a href="apply.cfm">Sign-up</a> NOW!</span> </div>
    
      </div>
      
  <div style="width:726px;margin-top:40px;margin-bottom:40px;display:none" align="justify"> <span class="details"><br>
 <cfoutput>  <strong> Benefits as a member: </strong>You'll get a credit of #format(application.signup_credit)# right away for 
    allowing us to stay in touch with you on email.  Further, you'll receive a #application.own_credit#% credit for every 
    purchase you make. This credit will be used for giving you discount in your next purchase. In simple words we want to reward our regular and loyal customers. 
	From time to time, we also give you 
    discount</cfoutput> coupons for specific items. These will be sent to you through our newsletters and email.
    As a member you can invite friends to shop at semiprecious.com and each 
    time a friend of yours buys at our store we give YOU points that can be used for calculating your discounts. Finally, it is &nbsp; &nbsp;<a href="unsubscribe.cfm">easy 
  to Unsubscribe</a>. So give it a shot and  <a href="apply.cfm">Sign-up</a> NOW!</span> </div>
    
      </td>
    </tr>
  </table>
  </div>
  
    <cfinclude template="mainfooter.cfm">

	</div>
	  </div>
  
</body>
</html>
