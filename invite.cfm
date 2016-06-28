<CFINCLUDE TEMPLATE="/header#session.country#.cfm" />

<div id="container2" style="padding:0 2px 0 2px">
<div id="lllmmm" style="float:left;width:145px;margin-left:10px;"><!--- BEGIN LEFT SIDE STUFF --->

      <CFINCLUDE TEMPLATE="leftmenus.cfm">

</div>
      <!--- END LEFT SIDE STUFF --->

	<div style="background:white;float:right;width:744px;margin-top:1px;margin-right:22px;">
					<div  style="width:730px;margin:20px 0px;" align="left"><h3>Invite your friends to  shop at our jewelry store</h3></div>
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
																		<cfinvokeargument name="Allowrepeat" value="true">

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
								        <cfif len(invited_list)>
											<cfoutput><br />
													<div class="green_band_ticked_ht" style="width:670px;margin:4px;">
													<span style="float:left;margin-left:50px;padding-top:5px;padding-bottom:5px;">Invited &rarr;</span><br /> 
                                                                                                        #invited_list#</div>
											</cfoutput>
									   </cfif>
									   <cfif len(not_invited_list)>
												<cfoutput>
												<div class="error2" style="width:670px;margin:4px;height:40px;">
													<span style="float:left;margin-left:20px;">Following Email Ids are not valid or have been already invited &rarr;</span><br /> #not_invited_list#
												</div>
												</cfoutput>

									   </cfif>
<!--- TODO: Nitish nov 14. moved from sptm to gemssql --->
<cftry>

						 			 <cfquery  datasource="gemssql" name="valid">
										    select code, max_value,status from bulkbuyercoupons where 	   email = '#session.mail#' and coupon_type = 'referral_35'
								    </cfquery>
<cfcatch type="any">
<cfset valid = querynew("code") />
</cfcatch>
</cftry>
								    <cfif not valid.recordcount>

								 	    	<div class="reg_price" style="position:relative;display:block;z-index:6;">
												<strong><cfoutput>#Application.friend_credit#</cfoutput>%</strong> of every of your friend's purchase is added to your semiprecious.com cash
												<img src="/images/que.gif"   onClik="document.getElementById('que_answer').innerHTML='';" onClick="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content').innerHTML;" />
													 <span id="que_answer" style="position:absolute;z-index:6;top:10px;left:112px;"></span>
											</div>
										    <div id="easy_content" style="display:none;">
											 	<div style="background-image:Url('/images/help_resources_tl.gif');width:400px;">
													  <br />How you are rewarded
												    <div class="detailrow"  align="left"	  style="z-index:6;text-transform:none;background-color:white;border:2px #E6Cf84 solid;border-top:0px;padding:3px;text-align:justify;">
													  <cfoutput>	You collect semiprecious.com cash for every purchase made on this store by your friends or yourself. If your cart is worth #format(100)# then you get semiprecious.com cash worth #format(Application.own_credit)#. For a friend's cart of #format(100)# we add #format(Application.friend_credit)# to your sempirecious.com cash. <br />This cash is used to give you a discount on your future purchases. Maximum discount you get is 20% of the cart value. So, to use $10.00 semiprecious.com cash, you must purchase $50.00 worth items (Because 20% of $50.00 is $10.00). This example assumes you have all items with regular price in your cart. If an item is on sale then the system will calculate discount of 10% on it. The total discount in such manner cannot exceed the semiprecious.com cash you have.</cfoutput>
														<br />[<span  onClick="document.getElementById('que_answer').innerHTML='';" class="error1" style="cursor:pointer;">Close &amp; start spreading the word</span>]
											 		</div>
									 			</div>
									 		</div>
									<cfelse>
											<cfif valid.status is 'active'>
													<div class="green_band_ticked_ht" style="width:670px;margin:4px;"> Your 35% Discount Coupon <span style="background-color:white;"><cfoutput>#valid.code#</cfoutput></span> is active and ready to be used for shopping. You can use this for shopping up to <cfoutput>#format(valid.max_value)#</cfoutput><br /></div>
											<cfelse>
												<div class="green_band" style="width:670px;margin:4px;"> Your 35% Discount Coupon is <span style="background-color:white;"><cfoutput>#valid.code#</cfoutput></span>. <span class="DETAIL">To activate the coupon</span> please invite <cfoutput>#evaluate((102-valid.max_value)/17)#</cfoutput> more friend(s)<br /></div>
											</cfif>
									</cfif>

									<div style="width:720px;display:block;position:relative;height:250px;" align="center">
											<div style="width:700px;  padding: 2px; margin: 6px;">
														<div class="form_heading">Invite Your Friends To Semiprecious.com</div>
																<ul class="arrow_ul" style="text-align:left;">
																		<li style="margin-bottom:20px">	Invite friends using the form below. Type in or copy paste your	friends' email Ids separated with commas or space.
																			   <form method="post" action="invite.cfm">
																		   		 <input type="hidden" name="invitation" />

																				<input type="text" style="width:80%;border:black 1px solid;" id="email1" name="email1" />
																			<br />

																					<div class="form_buttons" style="margin-left:150px;margin-top:10px;">
																				              <input type="submit" class="ContactUsBtn"   value="Invite" name="submit" />
																				</div>
																				         <input type="hidden" name="referral_credit" value="5" />
																		   </form>
													                   </li>
											                   <!--- till PHP is started on new server --->
														                   <li style="margin-bottom:20px">
															                   <a href="/includes/google_contacts.cfm?go=referral">Invite</a> friends from your <a href="/includes/google_contacts.cfm?go=referral"><img src="/images/gmail.gif" style="height:30px;display:inline;"></a> Contact list
																			</li>
																	<cfif session.country neq 'india' >
																			<li>
																				<a href="/includes/yahoo_contacts.cfm?go=referral">Invite</a> friends from your <a href="/includes/yahoo_contacts.cfm?go=referral"><img src="/images/ymail.gif" style="height:30px;display:inline;"></a> Contact list
																			</li>

																	</cfif> <!--->--->
																</ul>
												   			</div>
													</div>

												  <cfelse><br /><br />
												  	<div  style="width:540px;border:1px red groove;hieght:20px;">
												 		 <span class="reg_price">To Invite Friends and to Avail Semiprecious.com cash from Their Purchases Please Login.
													   </span>
													</div>
												</cfif>
											<br /><br />
											<cfif session.country neq "india">
                                                                                        <div style="display:inline;width:350px;position: relative; background-color: rgb(231, 2, 2); border: 2px ridge red; padding: 1px; color: white;">
											
												<img onClick="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content1').innerHTML;" onclik="document.getElementById('que_answer').innerHTML='';" style="display: inline; position: absolute; top: -7px; left: 444px;" src="/images/que.gif" />
											 <span style="position: absolute; z-index: 3; top: 6px; left: -12px; color: black;" id="que_answer"></span>
						 	 	  			We are using our advertising budget to give you big discounts. Find out how

											</div>
											</cfif>
   								 </div>

					<div style="display: none;" id="easy_content1">
					 	<div style="background-image: url(&quot;/images/help_resources_tl.gif&quot;); width: 500px;">
							<br />
							<div style="background-color: white; border: 2px solid gray; padding: 1px;">
				<span style="float: right; color: red;">[<span style="cursor: pointer;" class="error1" onClick="document.getElementById('que_answer').innerHTML='';">X</span>]</span>
	<div class="heading">
		<h2>How to get discounts from our advertising budget?</h2>
	</div>
	All online shopping stores need to spend large amounts on advertisement and promotions.
	Naturally, this adds to the product cost and you end up paying higher prices. We, at semiprecious.com, have started a novel customer participation program  customer referral program (CRP). 
Anyone can join in simple steps and benefits are substantial and immediate.
	<ul style="text-align: left; margin-left: 20px;" class="ul_arrow">
		
		<li>After you have submitted a minimum of six correct referrals, the system will provide you a special one time <span style="color: red;">35% discount coupon</span> (You get flat 35% discount on all items other than the ones on sale. For items on sale you will get discount of 17.5%).
		</li>
		<li>You can participate in this program more than once and continue to enjoy whopping discounts for your future shopping.
		</li>
		<li >We emphasize that we do not spam or share your or your friends' details with anyone for any purpose.</li>
	</ul>
	<span style="float: right; color: red;">[<span style="cursor: pointer;" class="error1" onClick="document.getElementById('que_answer').innerHTML='';">X</span>]</span>
	</div>
	</div>
 
</div>

<div>
	 <cfinclude template="mainfooter.cfm" />
        </div>

</div>
</body>

</html>