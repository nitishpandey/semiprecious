<cftry>
<cfparam name="initialamt" default="300" type="Numeric">

<cfparam name="lateramt" default="300" type="numeric">
<cfparam name="form.email" default="">
<cfparam default="#form.email#" name="form.id">
<cfparam name="form.address2" default="-">
<cfif isdefined("url.state")><!--- chrome at times doesn't do a post --->
<cfset form = url />
</cfif>
<cfparam default="" name="form.phoneno">
<cfparam default="USA" name="form.country">
<html>
<head>
<title>Register as Whole Sale Buyer or as a Reseller</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css">
	
</head>

<body topmargin="0" background="" >
<div align="center" >
<div style="width:906px;background-color:white;">
<cfinclude template="header.cfm">
<div  style="width:904px;padding-top:20px;" align="center">
    <h2>Wholelsale Buyer Registration</h2>
  </div>
 <cfif not isdefined("form.state")>
				<span class="details"><div align="center">
				  <div align="justify" style="width:900px;display:none;">Congratulations for having decided 
				    to choose us as your wholesale supplier. As the first step fill in the following 
				    details to register yourself as a 'Wholesale' buyer. You can start shopping at wholesale prices right after filling this short form. </div>
				</div></span>
				<p>  <div  align="left" style="width:700px;color:#030;text-transform:none;text-align:justify"> 
				
				<p>   Already registered? <a class="login_link" href="/simpleloginform.cfm">click here to start shopping</a> at wholesale site.<br /></p>
				
				WHOLESALE PRICING IS ONLY FOR RESELLERS WITH PROPER BUSINESS LICENSES AND TAX IDS 
				AND MINIMUM PURCHASE IS REQUIRED.
				  IF YOU ARE NOT A RESELLER, <a class="side_link" href="http://www.semiprecious.com/apply.cfm">GET DISCOUNTS HERE</a><p />
				</div>
				<div style="position:static;">
					<div style="width:700px;border:0px ridge blue;margin-top:10px;">
								 <div   align="left">
							<!---			<span class="detail">As a registered wholesale buyer you must take note of the following  conditions. </span>
									<ul style="margin-top:-2px;">
									  <Li>First purchase of <cfoutput>#format(initialamt)# minimum.</Li>
									  <li>First purchase returns - <strong>no questions asked and zero cost to you</strong>.</li>
									  <Li>There is<strong> no minimum qty per item</strong> requirement</Li>
									 <li>Later purchases of <cfoutput>#format(lateramt)#</cfoutput> atleast can get you instalment payment plan</li>
									  <li>All purchases will be charged #format(10)# flat rate shipping &amp; handling charges for USA delivery, #format(25)# for other countries.</li>
									  <!---<li onClick="MM_showHideLayers('thirdparty','','show')">As a whole sale buyer 
									    you will also be provided the <u>affiliate/reseller</u> facility for free</li>--->
									  <li>Can it get any better? No! So register now.</li>
									</ul>--->
								</div>
								
						</div>
				        <div align="center" style="display:block;position:relative;width:700px;height:350px;">
					        	 <DIV style="left:2px;top:2px;;border:2px ridge #ff9700;padding:2px;margin:6px;">
				 	 	  				<cfform action="/wholesaleregistered.cfm" method="post">
									 
											 <div            class="form_heading">Registration Form</div>
						<!--- 												<div class="form_label" >Business License<cfinput class="form_input" type="text" name="sfda" required="yes" /></div> --->
														 
														 <table>
														 
											  <tr><td align="left">
											 <div align="left"><b><p>Contact Information</div>
</td><td></td></tr><tr><td> 
												Name: </td><td><cfinput  type="text" name="name" size=50 required="yes" /></td></tr>
										<tr><td>	Email: </td><td><cfinput  type="text" name="email" size=50 required="yes" /></td></tr>
											      <tr><td>     	Confirm Email:</td><td>
															<cfinput  type="text" name="confirmemail" required="yes" size=50 /></td></tr>
															<tr><td>Phone No.:</td><td> <cfinput size=20  name="phoneno" type="text" required="yes" /></td></tr> 
											            <tr><td colspan=2>&nbsp;</td></tr>

								  <tr><td align="left">
							 <div align="left"><b><p>Shipping Address</div>
</td><td></td></tr>
<tr><td>											Address Line 1: </td><td><cfinput  type="text" size=70 name="address1" required="no"></td></tr>
												<tr><td>Address Line 2: </td><td><cfinput type="text" size=70 name="address2" required="no" /></td></tr>
												<tr><td>City:</td><td><cfinput  type="text" name="city" required="yes"></td><tr>
											    <tr><td>
												State: </td><td><cfinput type="text" name="state" required="no" /></td></tr>
											
											<tr><td>Postal Code:</td><td> <cfinput type="text" name="zip" required="yes" /></td></tr>
					            <input type="hidden" name="minamt" required="yes" value="<cfoutput>#initialamt#</cfoutput>">
											            <input type="hidden" name="password" value="password" />
											             
																	 <tr><td>Country: </td><td>
																	   <cfinclude template="includes/countries_drop_down.htm" />
											              	
											            <input type="hidden" name="paymode" value="na">
																	</td></tr>
																	<tr><td colspan=2 align=center>
											            <!--      <tr> 
											            <td bgcolor="#FFFFFF">Paymode:</td>
											            <td><cfinput class="form_input" type="text" name="paymode" required="no"></td>
											          </tr>
											          <tr>  -->
<br>

											              <input name="submit" type="submit"   size=20 class="action_button" value="      Register       "> 
											         <input type="hidden" name="cartid" value="<cfoutput>#session.cartid#</cfoutput>" />
									   </cfform>
					                   
				 </td></tr>
				</table>
								           <div id="chat_box" style="height:2px;width:300px;position:absolute;top:2px;right:0px;">
										   <!--- if live support is on and in use change height of chat box dynamically else it interferes even when not visible with the interaction
										   withform--->
									    	 <cfif application.live_support><div            class="form_heading"> Any Concerns? Talk To Us</div>
							    <iframe id="zoho_chat_frame"style='overflow:hidden;width:100%;height:100%;' frameborder='0' border='0' src='http://chat.zoho.com/csupport.sas?k=2789d7d560fbd32107172ed8136b26912293d7c778c1bd7eec315fbf44b2e3bd5547739b0c0e4f1d&chaturl=customersupport&V=000000-70a9e1-eff4f9-70a9e1-Pick%20the%20Perfect%20Jewelry'>
											 </iframe>
										  </div>
								  </cfif>
						    </div>
				 		 </div>
					</div>
		<cfelse>
			<cfset form.email = trim(form.email)>
			<cfset form.id = form.email>
			<cfquery datasource="sptm" password="rangeela" username="nitish" name="q1">
			select * from bulkbuyers where id = '#form.id#'
			</cfquery>
			<cfif q1.recordcount >
							<cfquery datasource="sptm" password="rangeela" username="nitish" name="qe">
							select * from bulkbuyers where id = '#form.id#'and (status = 1 or status = 2 or status = 0)
							</cfquery>
							<cfif qe.recordcount >
									<cf_wholelogin id="#form.id#" />
							<cfelse>    
									<span class="error1">Looks like  you have already registered.</span> 
										If you have recieved the verification code please use the form below to activate your membership. If you have already verified your email id then please go ahead and log in from the login page.
										<div align="center">
								       		<form action="http://www.semipreciouswholesale.com/whole_login.cfm"  method="get">
												<table align="center" width="400px;" border="0" class="component_box">
													<tr><td class="form_heading" >Wholesale Purchase Activation Form</td>
													<tr><td align="center">Activation Number (Check Your Mail Box):<input type="text" name="activationnumber" value="" size="8" /></td></tr>
													<tr><td align="center"><input type="hidden" name="email" value="<cfoutput>#form.id#</cfoutput>" />
													<input type="submit" style="background-color:#ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge #9BA" value="Activate Wholesale Account" /></td></tr>
												</table>
										    </form>
											<span style="font-weight:800">Note</span>: If you haven't recieved the activation email yet you should check your spam mail folder. If you still do not find your activation mail you can write in to us at cs@semiprecious.com. Our customer service team will be happy to guide you.
									  </div>
					    </cfif>
			    <cfelse>
						<cfset membershipdate = createodbcdate(dateformat(dateadd('d',30,Now()),'yyyy-mm-dd'))>
						<!--- first remove from retail buyers list --->
						<cfquery datasource="semiprecious" >
						delete from memberinfo where memberinfo.email = '#form.email#'
						</cfquery>
						  
					  <cfif isdefined("form.country") >
  						<cfset country_name= "na" />
						<cfinvoke component="countryresolver" method="get_country_name" returnvariable="country_name" >
  							<cfinvokeargument name="code" value="#form.country#">
  						</cfinvoke>  
				  </cfif>
						<cfquery datasource="sptm" >
							insert into bulkbuyers (zip, phoneno,address2,city,state, country,name,email,registered,id,minamt,mailcount,address,status <cfif isdefined("form.paymode")>,paymode</cfif>,membershipdate) 
							values ('#form.zip#','#form.phoneno#','#form.address2#','#form.city#','#form.state#','#country_name#','#form.name#','#form.email#',#now()#,'#form.email#', #form.minamt#, 0, '#form.address1#', 0 <cfif isdefined("form.paymode")>,'#form.paymode#'</cfif>,#membershipdate# )
						</cfquery>
						<cfquery datasource="gemssql" name="cust_exists">
							select * from crmkey where email = '#form.email#'
						</cfquery>
						<cfif cust_exists.recordcount >
							<cfquery datasource="gemssql">
								update crmkey set customertype = 'wholesale', tele = '#form.phoneno#' where email = '#form.email#'
							</cfquery>
							
						<cfelse>
							<cfquery datasource="gemssql">
								insert into crmkey (email,customertype,newmsg,tele) values ('#form.email#','wholesale',0,'#form.phoneno#')
							</cfquery>
						</cfif>
				<br>
			<!---	<cfif find('aol.com',form.email)>
				<cflocation url="http://www.semiprecious.com/simpleloginform.cfm?msg=Please+login+now." addtoken="no" />
				</cfif>--->
				<!--- for just registered, not verified, potentially snoopy retail buyers --->
				<span style="width:800px;padding:4px;display:block;border:1px gray groove;text-align:justify;"><strong>Thank you</strong>
				<ul>
				<li>
				Your request for a Wholesale buyer/Reseller account with Semiprecious.com has been registered.
				</li>
				<li>You can shop at wholesale prices rightaway &rarr; <a href='http://www.semiprecious.com/lemonquartz_necklaces.cfm' class="side_link">Shop now</a>.If you are not a real reseller, your order(s) will be cancelled.<!--- keeping this as www and not whole because we do not know if the min amt session var will be respected --->
				</li>
				<li>A confirmation mail would be sent to you on <cfoutput><span class="side_link">#form.email#</span></cfoutput>. [<span class="error1">At times this mail could go into your spam folder</span>]
				Use the activation number provided in the email to confirm your membership. Once confirmed you will be able to shop for a lesser minimum amount and also avail instalment payment facility.
				</li>
				</ul>
				 
				
				
			<strong>To shop in retail mode (no minimum purchase) please <a href="switchtoretailmode.cfm" class="side_link">click here</a></strong>.			
	    	<div align="center">
	       	<form action="http://www.semipreciouswholesale.com/whole_login.cfm"  method="get">
				<table align="center" width="400px;" border="0" class="component_box">
				<tr><td class="form_heading" >Partnership Activation Form</td>
				<tr><td align="center">Activation Number (Check Your Mail Box):<input type="text" name="activationnumber" value="" size="8" /></td></tr>
				<tr><td align="center"><input type="hidden" name="email" value="<cfoutput>#form.email#</cfoutput>" />
				<input type="submit" style="background-color:#ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge #9BA" value="Activate Wholesale Account" /></td></tr>
				</table>
			    </form>
			  </div>
			</span>
				<cfquery datasource="gemssql" name="j">
				select totpurchase from memberinfo where email = '#form.email#'
				</cfquery>
				<cfif j.recordcount>
					<cfquery datasource="sptm"  username="nitish" password="rangeela">
						update  bulkbuyers set totpurchase = #j.totpurchase# where email = '#form.email#'
					</cfquery>
					<cfquery datasource="gemssql" name="mem">
						delete from memberinfo where email = '#form.email#'
					</cfquery>
				</cfif>
				<!---  
				<cfquery datasource="semiprecious" name="mem">
				delete from invite_credits where byemail = '#form.email#'
				</cfquery>
				With following details:
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
									values ('#form.id#', 'coupon1', '#coupon1#', 5 )
							</cfquery>
							<cfquery datasource="sptm" password="rangeela" username="nitish">
								insert into bulkbuyercoupons (id,name,code,discount) 
								values ('#form.id#', 'coupon2', '#coupon2#', 10 )
							</cfquery>
				
							<cfquery datasource="sptm" password="rangeela" username="nitish">
									insert into bulkbuyercoupons (id,name,code,discount) 
									values ('#form.id#', 'coupon3', '#coupon3#', 15 )
							</cfquery>
				<!---- below mail also being sent from cart page. should be kept in synch by modularizing the mail content , nitish, 20 May 2010--->
				<cfmail from="service@semiprecious.com" subject="wholesale jewelry affiliation programme" to="#trim(form.id)#" bcc="scorpionitish@yahoo.com"  server="mail23.webcontrolcenter.com" type="html" failto="nitish@semiprecious.com">
				<div align="center" style="border:2px ridge ##666600;padding:4px;">wholesale.<font color="##558633" size="+2">Semi</font><font color="##ff8000;" size="+2">precious.com</font></div><div style="border:0px ridge ##666600;padding:6px;text-align:left"> 
				Hi #form.name#,</div><div style="text-align:justify">
				         &nbsp;&nbsp;You have been succesfully registered for shopping at semipreciouswholesale.com at wholesale prices. 
						Welcome to a collection of huge range of designs in semi precious stones  and all at stunning prices. Let me assure you that you are 
				        shopping with a company that will always keep your interests foremost service and quality has to match your expectation or you are not going to continue a long term relationship.
						There is no minimum quantity per design and shipping charges are as low as they can be .
				        <br>
				          So let's get started. Your activation number is  <strong> 48290.</strong> Click on the link given here or cut paste this URL on your browser address - <a href="http://semipreciouswholesale.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(form.id)#">http://www.semiprecious.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(form.id)#</a>. 
				          Please use this number for activating your account. This is required 
				          to confirm that you have provided us a valid email address. Hoping to 
				          do  mutually profitable business.</div> <div style="text-align:left">Regards, <br />- Semiprecious.com 
				          Team </div><div align="center" style="background-color:##CCECCC;margin-top:0px;height:10px;">&nbsp;
				</div>
				<hr />
				 </cfmail>
				 <cfmail from="service@semiprecious.com" subject="Your registration at wholesale store" to="#trim(form.id)#" bcc="scorpionitish@yahoo.com"  server="mail23.webcontrolcenter.com"  failto="nitish@semiprecious.com">
						semipreciouswholesale.com 
Hi ,
  Welcome to a collection of huge range of designs in semi precious stones  and all at stunning prices. 

 No minimum quantity per design. Shipping charges are as low as they can be .
        
So let's get started. Your activation number is  48290. Cut paste this URL on your browser address - http://semipreciouswholesale.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(form.id)#. 
Please use this number for activating your account. This is required to confirm that you have provided us a valid email address. Hoping to 
do  mutually profitable business.
Regards, 
	- Team Semipreciouswholesale.com 
				 </cfmail>
	
				 
				<!--- <cflocation addtoken="no" url="wholesale_login.cfm?msg=You%20Have%20Been%20Registered&email=#trim(form.id)#"> --->
				
				
				<br>
				<!--- <cfoutput><a href="registrationinfobulkbuyer.cfm?id=#form.id#">Inform</a> the bulk buyer?</cfoutput> --->
			</cfif>
 </cfif>
 
 
 
 <br />
       
<div id="thirdparty" style="visibility:hidden;width:600;border:solid thin black;position:absolute;top:190px;left:40px;color:black;font-size:12pt;font-color:black;bg-color:white;background-color:white;padding:10px;" > 
        The Semiprecious reseller Program makes the entire Semiprecious.com 
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
        charges). Example: If item # 988 is costing $100 on the site. Our whole sale price for 
        the item is $50.00. If your customers uses a coupon with discount of 10% 
        he/she will be billed $ (100 - 10) = $90.00. Thus the profit you earn 
        is $90 - $50 = $40.00. Subtract 5% for shipping & handling, and $37.5 will 
        be credited to your account. <strong>You make no investment</strong>�.only profits. For 
        further information please write in or call us. We'll be happy to help 
        you out! :) <br>
        <a href="as.htm"  onClick="MM_changeProp('thirdparty','','style.visibility','hidden','DIV'); return false;">CLOSE</a>.</div>
     <br />
	 <br />
	 <br />
	 <br />
	 
<cfinclude template="mainfooter.cfm">
</div>
</div>
</body>
</html>

<cfcatch type="any">
<cfoutput>#cfcatch.detail#,#cfcatch.message#
</cfoutput>
<cfdump var="#cfcatch.tagcontext#" />
</cfcatch>
</cftry> 