<cfset title="Gift Friends And Idea to Buy semiprecious stones, beads, jewelry" />

<cftry>
<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
  
<table id="container2"  cellspacing="0" cellpadding="0" border="0" style="margin-top:20px;padding:0 10px 0 10px">
  <tr  align="">
    <td valign="top"  align="left" ><div style="float:left;"><!--- BEGIN LEFT SIDE STUFF --->
	
      <CFINCLUDE TEMPLATE="leftmenus.cfm"></div>
      <!--- END LEFT SIDE STUFF --->
	
	<div style="float:right;width:700px;margin-left:10px;">
							<cfif len(session.mail)>
								<cfset invited_list = "" />
								<cfset not_invited_list = "" />
							<cfif isdefined("form.invitation")>
								<cfif len(form.email1)>
								<cfloop list="#form.email1#" delimiters=", " index="f">
								 	<cfinvoke component="invitationandcredit" method="invite"  returnvariable="j">
										<cfinvokeargument name="email" value="#f#">
										<cfinvokeargument name="byemail" value="#session.mail#">
										<cfinvokeargument name="sendmail" value="1">
										<cfinvokeargument name="creditpart" value="#Application.friend_credit#">
									</cfinvoke>
								
							<cfif j>
											
							 	<cfinvoke component="invitationandcredit" method="top_up_referral_coupon"  returnvariable="j">
								 	<cfinvokeargument name="buyer_email" value="#session.mail#" >
									<cfinvokeargument name="coupon_type" value="referral_35" >
						  		</cfinvoke>
								<cfset invited_list = invited_list &'  '& f />
								<cfelse>
								<cfset not_invited_list = not_invited_list &'  '& f />
							</cfif>
							</cfloop>
							</cfif>
						</cfif>
						<div  style="width:756px;margin:20px 0px;" align="left"><h3>Invite Friends to visit and shop at Semiprecious.com</h3></div>
						<cfif len(invited_list)>
						<cfoutput><br />
						<div class="green_band_ticked_ht" style="width:700px;padding-left:25px;margin-bottom:4px;">
						<span style="float:left;margin-left:5px;">Invited Emaild Ids</span><br /> #invited_list#</div>
						</cfoutput></cfif> 
						<cfif len(not_invited_list)>
						<cfoutput>
						<div class="error2" style="width:700px;margin-bottom:4px;height:40px;">
							<span style="float:left;margin-left:2px;">Following Email Ids are not valid or have been already invited </span><br /> #not_invited_list#</div>
						</cfoutput></cfif>
<cftry>
						  <cfquery  datasource="gemssql" name="valid">
										    select code, max_value,status from bulkbuyercoupons where 	   email = '#session.mail#' and coupon_type = 'referral_35' 
								    </cfquery>
	<cfcatch type="any">
<cfset valid = querynew("code") />
</cfcatch>
</cftry>							    <cfif not valid.recordcount>
								    
						 	    	<div class="reg_price" style="position:relative;display:block">
										<strong><cfoutput>#Application.friend_credit#</cfoutput>%</strong> of every of your friend's purchase is added to your discount points 
										<img src="/images/que.gif"   onClik="document.getElementById('que_answer').innerHTML='';" onClick="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content').innerHTML;" />
											 <span id="que_answer" style="position:absolute;z-index:3;top:10px;left:112px;"></span>
									</div>
									 <div id="easy_content" style="display:none;">
										 	<div style="background-image:Url('/images/help_resources_tl.gif');width:400px;">
												  <br />How are you rewarded?
											  <div class="detailrow"  align="left"	  style="text-transform:none;background-color:white;;border-top:0px;padding:3px;text-align:justify;">
												  <cfoutput>	You collect semiprecious.com cash for every purchase made on this store by your friends or yourself. If your cart is worth #format(100)# then you get points worth #format(Application.own_credit)#. For a friend's cart of #format(100)# we add #format(Application.friend_credit)# to your points. <br />These points are used to give you a discount on your future purchases. Maximum discount you get is 20% of the cart value. So, to use $10.00 credit points, you must purchase $50.00 worth items (Because 20% of $50.00 is $10.00). This example assumes you have all items with regular price in your cart. If an item is on sale then the system will calculate discount of 10% on it. The total discount in such manner cannot exceed the credit points you have.</cfoutput> 
													<br />[<span  onClick="document.getElementById('que_answer').innerHTML='';" class="error1" style="cursor:pointer;">Close &amp; start spreading the word</span>]
										 		</div>
								 			</div>
								 		</div>
									<cfelse>
									<cfif valid.status is 'active'>
										<div class="green_band_ticked_ht" style="width:696px;margin:1px;margin-top:10px;"> Your 35% Discount Coupon <span style="background-color:white;"><cfoutput>#valid.code#</cfoutput></span> is active and ready to be used for shopping. You can use this for shopping up to <cfoutput>#format(valid.max_value)#</cfoutput><br /></div>
								<cfelse>
									<div class="green_band" style="width:700px;margin:1px;margin-top:10px;""> Your 35% Discount Coupon is <span style="background-color:white;"><cfoutput>#valid.code#</cfoutput></span>. To activate the coupon you need to invite <cfoutput>#evaluate((102-valid.max_value)/17)#</cfoutput> more friend(s)
                                                                </div>
						</cfif>
									</cfif>
						
						<div style="width:750px;display:block;position:relative;height:250px;" align="center">
							<div style="width:700px; padding: 2px; margin:26px;">
								
											<ul class="arrow_ul" style="text-align:left;">
											<li>	Type in or copy paste your	friends' email Ids. Separate them with a comma or space:
												   <form method="post" >
											   		 <input type="hidden" name="invitation" />					 
													 
													<input type="text" style="width:80%;border:1px thin black" id="email1" name="email1" />
												<br />          					
													
														<div class="form_buttons" style="margin:20px;">            
													              <input type="submit" class="ContactUsBtn" value="Invite" name="submit" /> 
													</div>    
													         <input type="hidden" name="referral_credit" value="5" />
											   </form>
						                   </li>
						                   <li><a href="/includes/google_contacts.cfm?go=referral">Invite</a> friends from your <a href="/includes/google_contacts.cfm?go=referral"><img src="/images/gmail.gif" style="height:30px;display:inline;"></a> Contact list
											</li>
											     <li><a href="/includes/yahoo_contacts.cfm?go=referral">Invite</a> friends from your <a href="/includes/yahoo_contacts.cfm?go=referral"><img src="/images/ymail.gif" style="height:30px;display:inline;"></a> Contact list
											</li> 
											</ul>
							   </div>
						</div>
						  
						  <cfelse>
						  <span  style="width:500px;border:1px red groove;hieght:20px;background-color:#DADA99">SORRY!
						  <span class="error1">To invite friends and to avail semiprecious.com cash when they make purchases 
						  you must first login </span> </span>
						</cfif>
    </td></tr><tr>
    <td align="center" valign="top">
      <cfinclude template="mainfooter.cfm" />
    </td>
  </tr>
</table>
</div></body>

</html>
<cfcatch>
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>

