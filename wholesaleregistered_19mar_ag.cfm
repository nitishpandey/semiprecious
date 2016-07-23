<cftry>
<cfparam name="initialamt" default="300" type="Numeric">
<cfparam name="lateramt" default="300" type="numeric">
<cfparam name="form.email" default="">
<cfparam default="#form.email#" name="form.id">
<cfparam name="form.address2" default="-">
<cfparam default="" name="form.phoneno">
<cfparam default="USA" name="form.country">
<html>
<head>
<title>Register as Wholesale Buyer </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" background="" >
<div align="center" >
<div style="width:930;background-color:white;" id="container1">
<cfinclude template="/#session.country#/header.cfm">
<div  style="width:900;padding-top:20px;" align="left">
    <h3>Wholelsale Buyer Registration</h3>
  </div>
 <cfif not isdefined("form.state")>
 <h2><span class="error2">Please note that if you are using Chrome Browser you may not be able to register. Chrome browser has a documented bug that 
 sometimes it fails to submit the form details properly. Request you to use Firefox or Safari or Internet Explorer to register. Thank you.</span></h2>
<div align="center">
	<a href="javascript:history.go(-1)">Please click here to try again</a	>
</div>
		<cfelse>
			<cfset form.email = trim(form.email)>
			<cfset form.id = form.email>
			<cfquery datasource="sptm"  name="q1">
			select * from bulkbuyers where id = '#trim(form.id)#'
			</cfquery>
			<cfif q1.recordcount >
							<cfquery datasource="sptm"  name="qe">
							select * from bulkbuyers where id = '#trim(form.id)#'and (status = 1 or status = 2 or status = 0)
							</cfquery>
							<cfif qe.recordcount >
							<!--- this is registeration attempt. why log them in? 		<cf_wholelogin id="#form.id#" />
							<cfelse>    <br>
							
							 --->	<br /><br />
							 	<span class="error1">Looks like  you have already registered.</span> 
										If you have recieved the verification code please use the form below to activate your membership. If you have already verified your email id then please go ahead and log in from the login page.
										<div align="center" style="margin-top:50px;">
								       		<form action="/whole_login.cfm"  method="get">
												<table align="center" width="400px;" border="0" class="component_box">
													<tr><td class="form_heading" >Wholesale Purchase Activation Form</td>
													<tr><td align="center">Activation Number (Check Your Mail Box):<input type="text" name="activationnumber" value="" size="8" /></td></tr>
													<tr><td align="center"><input type="hidden" name="email" value="<cfoutput>#form.id#</cfoutput>" />
													<input type="submit" class="action_button" value=" Activate Wholesale Account " /></td></tr>
												</table>
										    </form>
											<div style="font-weight:800;margin-top:30px;">Note</div> If you haven't recieved the activation email yet you should check your spam mail folder. If you still do not find your activation mail you can write in to us at cs@semiprecious.com. Our customer service team will be happy to guide you.
									  </div>
					    </cfif>
			    <cfelse>
						<cfset membershipdate = createodbcdate(dateformat(dateadd('d',30,Now()),'yyyy-mm-dd'))>
						 <cfif len(session.bulkbuyer.id)>
							<cfquery datasource="gemssql" >
								delete from memberinfo where memberinfo.email = '#trim(form.email)#'
							</cfquery>
						</cfif>
						
					  <cfif isdefined("form.country") >
  						<cfset country_name= "na" />
						<cfinvoke component="countryresolver" method="get_country_name" returnvariable="country_name" >
  							<cfinvokeargument name="code" value="#form.country#">
  						</cfinvoke>  
				  </cfif>
			
				  <cftry>
	<cfquery datasource="sptm" name="sdlk">
									insert into bulkbuyers (zip, phoneno,address2,city,state, country,name,email,registered,id,minamt,mailcount,address,status <cfif isdefined("form.paymode")>,paymode</cfif>,membershipdate) 
							values ('#form.zip#','#form.phoneno#','#form.address2#','#form.city#','#form.state#','#country_name#','#trim(form.name)#','#trim(form.email)#',#now()#,'#trim(form.email)#', #form.minamt#, 0, '#form.address1#', 0 <cfif isdefined("form.paymode")>,'#form.paymode#'</cfif>,#membershipdate# )
	</cfquery>
						<cfcatch type="any">
						<cfoutput>#cfcatch.detail##cfcatch.message#,
					
						</cfoutput>
						</cfcatch>
						</cftry>
						<cfquery datasource="gemssql" name="cust_exists">
							select * from crmkey where email = '#trim(form.email)#'
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
				<span style="width:800px;padding:4px;display:block;border:1px gray groove;text-align:justify;"><strong>Thank you for interest in partnering with us!</strong>
				<ul>
				<li>
				Your request for a Wholesale buyer/Reseller account has been recieved.
				</li>
				<cfif len(session.bulkbuyer.id)>
					<cflocation addtoken="true" url="whole_login.cfm?email=#form.email#" />
						<li>You can shop at wholesale prices rightaway &rarr; <a href='http://www.semipreciouswholesale.com/whole_login.cfm?email=<cfoutput>#form.email#</cfoutput>' class="side_link">Shop now</a>.If you are not a real reseller, your order(s) will be cancelled.
						<!--- keeping this as www and not whole because we do not know if the min amt session var will be respected --->
				<br /><strong>To shop in retail mode (no minimum purchase) please <a href="http://www.semiprecious.com/switchtoretailmode.cfm" class="side_link">click here</a></strong>.
				</li>
				</cfif>
				<li>A confirmation mail would be sent to you on <cfoutput><span class="side_link">#form.email#</span></cfoutput>. [<span class="error1">This mail could go into your spam folder</span>]
				</li>
				<li>Use the activation number provided in the email to confirm your email id. Once confirmed you will be able to shop 
				at wholesale prices but with the requirement of a minimum purchase. 
				</li>
				<li style="font-size:1.1 em;color:blue;">
				To prevent our mails going into your spam mail box we have sent an automatic test mail right away. Please visit your mail box and check your spam box. Make sure the mail
				from our domain semiprecious.com is moved to the inbox.
				<cfmail from="cs@semiprecious.com" subject="request for wholesale jewelry account" to="#trim(form.id)#">
				Thank you for your interest in our business. We will contact you soon by phone to open your account with us
				</cfmail> 
				
				</li>
				
				</ul>
				 
				
				
			<!---			
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
				</cfif>--->
			</span>
			
				<!---  
				<cfquery datasource="semiprecious" name="mem">
					delete from invite_credits where byemail = '#form.email#'
				</cfquery>
				With following details:
				    <cfoutput>#form.name#,#form.email#,ID is #form.id#, #form.minamt#, Password is #form.password#,<br>
				#form.address#</cfoutput> Please remember to inform the buyer the id + password. 
					<cfset coupon1  = couponcalc()>
						<cfset coupon2  = couponcalc()>
							<cfset coupon3  = couponcalc()>
							 The following coupons generated : 
							  <cfoutput>#coupon1#|#coupon2#|#coupon3#</cfoutput> 
							<cfquery datasource="sptm" >
									insert into bulkbuyercoupons (id,name,code,discount) 
									values ('#form.id#', 'coupon1', '#coupon1#', 5 )
							</cfquery>
							<cfquery datasource="sptm" >
								insert into bulkbuyercoupons (id,name,code,discount) 
								values ('#form.id#', 'coupon2', '#coupon2#', 10 )
							</cfquery>
				
							<cfquery datasource="sptm" >
									insert into bulkbuyercoupons (id,name,code,discount) 
									values ('#form.id#', 'coupon3', '#coupon3#', 15 )
							</cfquery>--->
				<!---- below mail also being sent from cart page. should be kept in synch by modularizing the mail content , nitish, 20 May 2010--->
				<cfif not len(session.bulkbuyer.id)>
				<cfmail from="service@semiprecious.com" subject="wholesale jewelry affiliation programme" to="#trim(form.id)#" bcc="anup@semiprecious.com"  
				 type="html" failto="nitish@semiprecious.com">
				<div align="center" style="border:2px ridge ##666600;padding:4px;">www.<font color="##ff8000;" size="+2">Semiprecious</font><font color="##558633" size="+2">Wholesale</font>.com</div><div style="border:0px ridge ##666600;padding:6px;text-align:left"> 
					Hi #form.name#,</div><div style="text-align:justify">

				  We will call you at #form.phoneno# to finalize your account. If you have not submitted your number, please email it to us at semiprecioushelp@gmail.com

					Thank you
					
					
					Anup Pandey
				 </cfmail>
				 <cfmail from="service@semiprecious.com" subject="Your registration at wholesale store" to="#trim(form.id)#" bcc="anup@semiprecious.com"  
				   failto="cs@semiprecious.com">
													
					  Hello
						
						We will call you to open your wholesale account with semipreciouswholesale.com
						
						thank you
						
						Anup Pandey      
				 </cfmail>
	
				</cfif>
				
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
<cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput>
<cfdump var="#cfcatch.tagcontext#" />
</cfcatch>
</cftry> 