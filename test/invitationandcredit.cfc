<cfcomponent persistent="false">
<cfinclude template="/includes/udf#session.country#.cfm" />
<cffunction name="top_up_referral_coupon" access="public" output="false">
	<cfargument name="buyer_email" required="true" default="#session.mail#" >
	<cfargument name="coupon_type" required="true" default="referral_35" >
    	  <cfquery  datasource="gemssql" name="valid">
		    select max_value,status,code from bulkbuyercoupons where 	coupon_type = '#arguments.coupon_type#'	and    email = '#arguments.buyer_email#' 
		    </cfquery>
		    <cfif valid.recordcount is 0 >
		  
		    <cfset coupon = couponcalc() />
		  		<cfquery  datasource="gemssql" name="valid">
					insert into bulkbuyercoupons (email,coupon_type,code,discount,date_issued,max_value,status) 
									values ('#arguments.buyer_email#', '#arguments.coupon_type#', '#coupon#', 35,'#datepart('yyyy',now())#-#datepart('m',now())#-#datepart('d',now())#',17,'inactive' )
				</cfquery>
				
		   
		    <Cfelse>
		    		<cfquery datasource="gemssql" >
									update bulkbuyercoupons set max_value = max_value + 17  where email = '#arguments.buyer_email#' and coupon_type = '#arguments.coupon_type#' 
							</cfquery> 
		    
		    <cfif valid.status is 'inactive'>
		    <cfif valid.max_value GT 83>
			    <cfquery datasource="gemssql" >
									update bulkbuyercoupons set status = 'active'  where email = '#arguments.buyer_email#' and coupon_type = '#arguments.coupon_type#' 
							</cfquery> 
		    
		    </cfif>
		    </cfif>
		    
		    </cfif>
<cfreturn />
</cffunction>

 <cffunction name="buyer_type" access="public" output="false"  >
  <cfargument name="buyer_email" type="string" required="yes">
   <cfset buyer_type = 'none' />
    	  <cfquery  datasource="gemssql" name="valid">
		    select country from bulkbuyers where  id = '#arguments.buyer_email#' 
		    </cfquery>
		      <cfif valid.recordcount>
		         <cfset buyer_type = 'wholesale'/>
		          <cfelse>
		    	  <cfquery datasource="gemssql" name="valid">
					    select country from memberinfo where email = '#arguments.buyer_email#' 
				   </cfquery>
			       <cfif valid.recordcount >
					   <cfset buyer_type = 'retail'/>
		         
				   </cfif>
		    </cfif>
<cfreturn buyer_type />
</cffunction>
 
<cffunction description="called only for retail member sign up on form or relay back to set up loyalty points" name="newmember" access="public"   output="false">
    <cfargument name="email" type="string" required="true" />
	<cfargument name="initialcredit" type="numeric" default="#application.signup_Credit#" required="false" />
      <cfquery datasource="gemssql" >
      delete from invite_credits where email= '#Arguments.email#'
      </cfquery>
	
      <cfquery datasource="gemssql" >
	      insert into invite_credits (email,totalcredit,lastcartid,balancecredit,referral_cart,lastcreditvalue,referral_points) values ( '#Arguments.email#',#Arguments.initialcredit#,0,#Arguments.initialcredit#,0,0,0) 
      </cfquery>
    
    	 <cfquery datasource="gemssql" name="invitedby">
    	  select byemail as bem from invited where  email = '#arguments.email#'
		</cfquery>
        <cfif session.country is 'india'>
        <cfset sitetogo = 'www.semiprecious.in' />
        <cfelse>
        <cfset sitetogo = 'www.semiprecious.com' />
        </cfif>
		<cfoutput query="invitedby">
        
         <cfmail server="MailA40" from="cs@semiprecious.com" to="#trim(bem)#" cc="#arguments.email#"  subject="Thank you"  type="html" failto="cs@semiprecious.com" >
						   <div align="center" style="border:1px ridge blue;">
							<img src="http://#sitetogo#/images/logobw.jpg">
						Would like to share with you that your friend with the email id #arguments.email# just signed up at our store #sitetogo#. Thank you! Hope you make full use of  the discount points that you earn now.
                             <hr />	 
					     </div>
					</cfmail>
			        
        </cfoutput>

	  <cfinvoke component="invitationandcredit" method="invite" returnvariable="f" >
		<cfinvokeargument name="email" value="#Arguments.email#"  >
		<cfinvokeargument name="byemail" value="#Arguments.email#"  >
		<cfinvokeargument name="creditpart" value="20"   >
		<cfinvokeargument name="sendmail" value="0"  >
    </cfinvoke>
      <cfquery datasource="gemssql" >
    	  update invited set datesignedup = '#dateformat(now(),'yyyy-mm-dd')#' where email = '#arguments.email#'
		</cfquery>
        <cfreturn />
</cffunction>
  
<cffunction access="public" name="add_to_credit"  returntype="string"  output="true" hint="called on shipping of cart">
    <cfargument name="email"  required="true" type="string">
    <cfargument name="new_credit" required="true" type="numeric">
    
        <cfquery datasource="gemssql" >
	        update invite_credits set totalcredit = totalcredit + #new_credit# ,balancecredit = balancecredit + #new_credit# where email = '#email#' 
        </cfquery>
        <cfquery datasource="gemssql"  name="bal">
  				select balancecredit from invite_credits  where email = '#email#' 
        </cfquery>
		<cfquery name="Recordset1" datasource="gemssql">
			Update memberinfo set newearned = #bal.balancecredit# WHERE memberinfo.email = '#email#'
</cfquery>
<cfreturn />
  </cffunction>

<cffunction name="signup" access="public" returntype="numeric" output="True">
    <cfargument  name="buyer_email" required="true"   />
    <cfargument default="NA" name="buyer_zip" required="false"   />
    <cfargument default="NA" name="phonenumber" required="false"   />
    <cfargument  name="buyer_street_address" required="false" default=""   />
    <cfargument default="" name="buyer_street_address2" required="false"   />
    <cfargument name="subscribe_type" required="false"  default="retail"  />
    <cfargument name="cartid" required="false"  hint="used if subscribe type is not specified explicitly. otherwise used for totpurchase only."   />
    <cfargument default="NA" name="buyer_city" required="false"   />
    <cfargument default="NA" name="buyer_state" required="false"   />
    <cfargument default="USA" name="buyer_country" required="false"   />
    <cfargument  name="status" required="false" default="0"   />
    <cfargument default="#arguments.buyer_email#" name="buyer_first_name" required="false"   />
    <cfargument default="" name="buyer_last_name" required="false"   />
    <cfargument default="#Application.bulkbuyer.minamt#" name="minamt" required="false"   />
    <cfargument default="0" name="initial_credit" required="false"   />
    <cfif session.country is "india">
	<cfset arguments.initial_credit = 0*200/application.exch["india"] />
	</cfif>
    <cfset result = 1 />
     	  <cfquery datasource="gemssql" name="buyer_type">
		          select sum(cost) as sum_cost from cartstatus  where buyer = '#buyer_email#' and outdate is not null
	      </cfquery>
		 <cfif len(buyer_type.sum_cost)><!--- it so happens that even if there is no record, the aggregate function results in an empty record being returned --->
              <cfset totpurchase = buyer_type.sum_cost />
        <cfelse>
            <cfset totpurchase = 0 />
        </cfif> 

	<cftry>
      <cfif len(session.bulkbuyer.id) or subscribe_type is 'wholesale'>
			<cfset membershipdate = createodbcdate(dateformat(dateadd('d',30,Now()),'yyyy-mm-dd'))>
					<cfquery datasource="gemssql" >
							insert into bulkbuyers (zip, phoneno,address, address2, city,state, country,name,email,registered,id,minamt,status ,membershipdate,totpurchase) 
							values ('#buyer_zip#','#phonenumber#','#buyer_street_address#','#buyer_street_address2#',
							'#buyer_city#','#buyer_state#','#buyer_country#','#buyer_first_name# #buyer_last_name#','#buyer_email#',#now()#,
							'#buyer_email#', #minamt#, #status#,#membershipdate#,#totpurchase# )
						</cfquery> 
                        
                             <cfset subscribe_type = 'wholesale' />

  			<cfelse>
                                            <cfset subscribe_type = 'retail' />
                            <CFQUERY DATASOURCE="gemssql" >
                                insert into memberinfo (email,firstname,lastname, address1,address2, city, state, zip,country,nlstatus,noofvisits,totpurchase,
                    phonenumber)
                     values ('#buyer_email#', '#buyer_first_name# #buyer_last_name#','#buyer_last_name#','#buyer_street_address#','#buyer_street_address2#', 
                     '#buyer_city#',  '#buyer_state#' , '#buyer_zip#', '#buyer_country#',0,1,#TOTPURCHASE#,'#phonenumber#')
                    </cfquery>
                         <cfinvoke component="invitationandcredit" method="newmember" >
    				           <cfinvokeargument name="email" value="#buyer_email#">
				              <cfinvokeargument name="initialcredit" value="#initial_credit#">
			        </cfinvoke>
	
                                                     
</cfif>

                        	    <cfinvoke  component="crm.crm" method="newmember" returnvariable="newmemberRet">
                                    <cfinvokeargument name="email" value="#trim(buyer_email)#"/>
                                    <cfinvokeargument name="customertype" value="#subscribe_type#"/>
                                    <cfinvokeargument name="tele" value="#phonenumber#"/>
                                </cfinvoke>
<cfcatch type="any">
<cfoutput >#cfcatch.detail#,#cfcatch.Message#
					insert into memberinfo (email,firstname,lastname, address1,address2, city, state, zip,country,nlstatus,noofvisits,totpurchase,
		phonenumber)
		 values ('#buyer_email#', '#buyer_first_name# #buyer_last_name#','#buyer_last_name#','#buyer_street_address#','#buyer_street_address2#', 
		 '#buyer_city#',  '#buyer_state#' , '#buyer_zip#', '#buyer_country#',0,1,#TOTPURCHASE#,'#phonenumber#')
</cfoutput>
<cfset result = 0 />
</cfcatch>
</cftry>


<cfreturn result >
</cffunction>
 
 <cffunction name="invite" access="public" returntype="string" output="true">
    <cfargument name="byemail" default="#session.mail#" type="string" required="false">
    <cfargument name="email" type="string" required="true">
    <cfargument name="sendmail" type="numeric" required="false" default="1">
    <cfargument name="creditpart" type="numeric" required="false" default="20">
    <cfargument name="allowrepeat" type="boolean" required="no" default="false" />
    	<!--- this credit part can be changed to 7.5 later after about 26 Jun 05 --->
    <cfset foo = 1 />
    <cfquery datasource="gemssql" name="mem">
    	select firstname from memberinfo where email = '#Arguments.byemail#' 
    </cfquery>
    
    <!--- for each email id check that he has not been invited by this person, and is a valid email id --->
    <cfquery datasource="gemssql" name="mem2">
    	select * from invited where byemail = '#Arguments.byemail#' and email = '#trim(arguments.email)#' 
    </cfquery>
    <!--- TODO: Nitish nov 14: earlier we were checking for valid email id pattern using this 
    <cfinvoke component="headhunting.admin" method="checkemail" returnvariable="result">
   		 <cfinvokeargument name="email" value="#trim(arguments.email)#">
    </cfinvoke>--->
	<cfset result.success = 1 />
		   <cfif  result.success is 0 >
		   		<cfset myresult = 0 />
		   <cfelse>
				  <cfif	(mem2.recordcount is 0) or arguments.allowrepeat> 
			    <cftry>
			      <cfif Arguments.sendmail >
					  <cfif session.country is "india">
					  	<cfset sitetogo = 'www.semiprecious.com'>
					  <Cfelse>
					  	<cfset sitetogo = 'www.semiprecious.com' >
				  	  </cfif>
			         <cfmail server="mailA40" from="cs@semiprecious.com" 
			         		to="#trim(Arguments.email)#"  
			         			 subject=" #mem.firstname# has liked our store"  type="html" failto="cs@semiprecious.com" >
						   <div align="center" style="border:1px ridge blue;">
							<img src="http://www.semiprecious.com/images/logobw.jpg">
						      <div align="justify">Hi, <br>
		   							   Would like to share this great jewelry site  #sitetogo#. This jewelry store show cases jewelry in authentic sterling silver and semiprecious gemstones.
						               They have   over 4000 designs in rings, bracelets,pendants, necklaces, earrings ,  healing (like crystals, buddha, terminators) and more...  <br>
						    	<br /> I found it a great company to shop at, and you too should pay a visit and look around.
								Click <a href="http://#sitetogo#">here</a>   or cut paste this address on your browser #sitetogo#. 
						   		And <strong>don't forget to sign-up</strong>  because when you sign up you get discounts and ofcourse i get  discount
						   		 points every time you shop. 
						  		 
								</div>
						-#mem.firstname#
								 <hr />	 
					     </div>
					</cfmail>
			        <cfmail server="mailA40" from="cs@semiprecious.com" to="#trim(Arguments.email)#"   subject="#mem.firstname# wants you to visit ..."  type="text"  failto="cs@semiprecious.com" >
			           Hi, 
					       This is an invite to the semiprecious jewelry store that has designs in  silver, pearl and semiprecious jewelry and healing stuff too!
			            They have   over 20000 designs in rings, bracelets,pendants, necklaces, earrings,  healing (like crystals, buddha, terminators) and more...  
			    
						Click #sitetogo# here   or cut paste this address on your browser #sitetogo#. 
			   			Hey, and don't forget to sign-up  because signing up gets you discounts, wishlist feature  and ofcourse i get discount 
			   			points every time you shop. Same for you.
			   			
			   			Your shopping will also give points to #mem.firstname# for real discounts.

	                    Regards,
	                    #mem.firstname#
					</cfmail>
				    <cfmail server="mailA40" from="#Arguments.byemail#" to="#Arguments.email#"   subject="see #sitetogo# jewelry invite "  type="html" failto="cs@semiprecious.com" >
					     	<div align="center" style="border:1px ridge blue;">
						      <img src="http://#sitetogo#/images/logobw.jpg">
						          <div align="justify">Hi, <br>
					               Have you seen #sitetogo# website? It's an online jewelry store that has been a  pioneer of sorts vending silver jewelry selling since 1996. 
								   I have shopped here and would recommend that you visit the store and see for yourself the fantastic designs. The prices are very good and range includes pieces in  silver, pearl and semiprecious jewelry and healing things.
					               They have   sections for bracelets,pendants, necklaces, earrings ,  healing (like crystals, buddha, terminators) and rings.  <br>
					    			<br />
										Click <a href="http://#sitetogo#">here</a>   or cut paste this address on your browser - #sitetogo#. 
						<strong>Remember to sign-up</strong>  and get discounts , wish list feature  and discount points every time you shop. 
							   Your shopping will also add credit to my  shopping account.
							</div>
                            <br />-#mem.firstname#
									 <hr />	 
					      </div>
					</cfmail>
					</cfif>
				  	<cfcatch type="database">
			        	<cfset foo = 0>
				      	<cfmail  server="mailA40" from="service@semiprecious.com" to="anup@semiprecious.com"   subject=" wants you to visit ..."  type="text"  failto="cs@semiprecious.com" >
				        	
				        	#cfcatch.message#,#cfcatch.detail#
				      	</cfmail>
					</cfcatch>
			      	<cfcatch type="any">
			    		<cfmail server="mailA40" from="service@semiprecious.com" to="anup@semiprecious.com"   subject=" wants you to visit ..."  type="text"  failto="cs@semiprecious.com" >
			        		#cfcatch.message#,#cfcatch.detail#
			        		<cfdump var="#cfcatch.tagcontext#" />
			      		</cfmail>
			    	   <cfset foo = 0 >
				     </cfcatch>
				   </cftry>
                   <cfif mem2.recordcount is 0 >
			    	     <cfquery datasource="gemssql" >
					      		insert into invited (byemail,email,dateinvited,creditpart) values ( '#Arguments.byemail#','#Arguments.email#',#Now()#,#Arguments.creditpart#)
					      </cfquery>
                          </cfif>
				<cfelse>
<!--- we allow repeate invites but don't want to return 1 since that may result in referral coupon points increase --->
                  <cfset foo = 0 />
                  </cfif>
			    	<cfset myResult=foo>
	 </cfif>
    <cfreturn myResult>
  </cffunction>
  
  <cffunction access="public" name="updatecredit"  returntype="string"  output="true" hint="called on shipping of cart">
    <cfargument name="email"  required="true" type="string">
    <cfargument name="cartid" required="true" type="numeric">
    <cfquery datasource="gemssql" name="q_status">
    	select status, cost from cartstatus where cartid = #Arguments.cartid# 
    </cfquery>
    <cfif q_status.status is 'done'>
      <cfquery datasource="gemssql"  name="q_invited">
      	select byemail,creditpart from invited where email = '#Arguments.email#' 
      </cfquery>
      <cfif q_invited.recordcount>
	  <cfloop  query="q_invited">
        <cfset newcredit = round(q_status.cost*q_invited.creditpart/100)>
        <cfquery datasource="gemssql" >
        update invite_credits set totalcredit = totalcredit + #newcredit# ,balancecredit 
        = balancecredit + #newcredit# where email = '#q_invited.byemail#' 
        </cfquery>
        <cfquery datasource="gemssql"   name="bal">
  				select balancecredit from invite_credits  where email = '#q_invited.byemail#' 
        </cfquery>
		<cfquery name="Recordset1" datasource="gemssql">
			Update memberinfo set newearned = #bal.balancecredit# WHERE memberinfo.email = '#q_invited.byemail#'
</cfquery>

  <cfmail  server="mailA40" type="html"  subject="purchase credit" from="cs@semiprecious.com" to="#q_invited.byemail#" >
   	  <img src="http://www.semiprecious.com/images/logobw.jpg">
      <div align="justify" style="width:600px;border: 1px gray ridge;">
	 <span style="background-color:yellow;border: 1px ridge black;margin-top:-10px;color:black;"> LOYALTY SHOPPING DISCOUNTS UPDATE</span><br>
          A purchase was made at our store by a friend  invited by you (or yourself).  In view of this sale your loyalty account with semiprecious.com has been  credited an additional <strong>#dollarformat(newcredit)#</strong> worth points and now total stands at <strong>#dollarformat(bal.balancecredit)#</strong>.		  
		  <ul>		  <li>To  use the points please  remember to login when shopping at the store <a href="http://www.semiprecious.com/simpleloginform.cfm?email=#q_invited.byemail#">www.semiprecious.com</a></strong>. </li> 
		  <li>When you shop you can use full or part of the points to get a discount. The remaining points can be used later. </li>
		       <li> Points get you 20% off on regular prices and 10% off on sale price. </li>	
		  		<li>Invite friends to our store and  earn points from friends' purchases too!  </li>	
		    	<li>Please do note that you cannot club any other discount offer while using the loyalty shopping points.</li>
		  </ul>
</div>  Thankyou for shopping with us. 
         - Semiprecious.com 
		  This is an automated mail. Please do not reply to this email. 
		 <hr />
        </cfmail>
          <cfif q_invited.byemail neq Arguments.email>
		   <cfmail server="mailA40" type="html"  subject="discount points awarded to your friend" from="cs@semiprecious.com" to="#Arguments.email#" >
        	  <img src="http://www.semiprecious.com/images/logobw.jpg">
      <div align="justify"  style="border:1px brown ridge;">This is an automated mail. Please do not reply to this email. <br>
	You were   invited to semiprecious.com by #q_invited.byemail#. For this purchase  of yours, we have given your friend virtual cash towards future       purchases. If you also want to invite friends and earn <strong>real</strong> credits from their purchases  just login while shopping at <a href='http://www.semiprecious.com/simpleloginform.cfm'>semiprecious.com</a>.
		</div>	 
		<div style="border:1px solid gray;"> Earn from your friends' shopping this coming holiday season.To invite friends login and click on 'invite friends' link.</div> 
		   <hr />
        </cfmail>
		</cfif>
		</cfloop>
      </cfif>
    </cfif>
  </cffunction>
  <cffunction  name="showcredits" output="true" >
    <cfargument name="email"  required="true" type="string">
    <cfquery datasource="gemssql"  name="q_credit">
    select * from invite_credits where email = '#Arguments.email#' 
    </cfquery>
    Your Total Discount Points : #format(q_credit.totalcredit)#. <br>
    Balance Points : #format(q_credit.balancecredit)#. <br>
    Points used : #format(evaluate(q_credit.totalcredit - q_credit.balancecredit))#. <br>

  </cffunction>
  
  <cffunction name="usecredit"  access="public"  displayname="usecredit" output="true" returntype="numeric" >
<!---     <cfargument name="cartid" required="true" >
 --->	
 <cfargument name="email" default="#session.mail#" required="false" type="string" >
 <cfargument name="amounttopay" required="true">
  <cfargument name="saleitemamount" required="false" default="0">
 <cfargument name="finalize" required="true" type="numeric" >
 <!--- later realized that the way we use finalize we could have used session.cartid instead --->
  <cfset computenew = 1>
   <cfset credit = 0>
<cfset df = 0.2>
<cfset dfsale = 0.1>
   	<cfif finalize    >
     <cfquery datasource="gemssql" name="refreshguard">
           Select lastcreditvalue as lc from invite_credits where  lastcartid = #Arguments.finalize#  and  email = '#Arguments.email#' 
    </cfquery>
<cfif   refreshguard.recordcount > <!--- if the cart has an entry that means credit has been finalized (reduced) for  thecart, --->
<cfset credit = refreshguard.lc />
 <cfset amounttopay = amounttopay - credit>
<cfset finalize = 0> <!--- it has already been ginalized --->
<cfset computenew = 0> <!--- already computed too  --->
 </cfif>
 </cfif>
<cfif computenew >
 <cfquery datasource="gemssql"  name="j">
          Select balancecredit as creditavailable from invite_credits where email = '#Arguments.email#' 
    </cfquery>
	<!--- not equal  to current cartid so that he should not use it twice for same cart --->

	   <cfif j.recordcount>
	   <cfset salefactor = saleitemamount/amounttopay >
	   <cfset computedcredit =  df*(amounttopay - saleitemamount) + dfsale*saleitemamount >
      <cfif j.creditavailable GT  computedcredit> <!--- this number 20% when changed has to be changed in subscribing , login , cart  and shipping mails --->
     <cfset credit = computedcredit>
	 <cfset dfsale = 1 - dfsale*credit/computedcredit >
	 	 <cfset df = 1 - df*credit/computedcredit >

     <Cfelse>
     <cfset credit = j.creditavailable>
	 <cfset dfsale = 1 - dfsale*credit/computedcredit >
	 	 <cfset df = 1 - df*credit/computedcredit >
    </cfif>
<cfelse>
<cfset dfsale =1>
<cfset df = 1 >	
	</cfif>
    <cfset amounttopay = amounttopay - credit>

</cfif>

<cfif finalize >
	<!--- now give some output to screen , not a good designe because formating should could have been lef to the page using this service--->
	<cfset df1 = df >
		<cfset df2 = df >
    <cfquery datasource="gemssql" >
       update invite_credits set balancecredit = balancecredit - #credit# , lastcreditvalue = #credit# , lastcartid = #session.cartid# where  email = '#Arguments.email#' 
    </cfquery>
	<!--- now reduce the purchase price of each item in a proportionate manner. this is useful while making refunds --->
	  <cfquery datasource="gemssql">
        update buyingrecord set rate = #df#*rate  where cartid = #session.cartid# and bought = '0'
    </cfquery>
	  <cfquery datasource="gemssql">
        update buyingrecord set rate = #dfsale#*rate  where cartid = #session.cartid# and bought = '3'
    </cfquery>


<!---     <cfquery datasource="gemssql" >
    delete from active_credits where cartid = #Arguments.cartid# 
    </cfquery>
    <cfquery datasource="gemssql" >
    insert into active_credits values ('#session.mail#',#Arguments.cartid#, #credit#) 
    </cfquery> --->
	</cfif>
	<cfoutput>#format(credit)#</cfoutput>
	<cfreturn amounttopay>
  </cffunction>
  <cffunction name="reversecredit"  access="public"  output="true" >
    <cfargument name="mail" default="#session.mail#" required="false"  type="string">
			<cfquery datasource="gemssql"   name="q">
               select  lastcartid, lastcreditvalue from invite_credits  where email = '#arguments.mail#'
           </cfquery>
		   			
		   
	<cfif q.recordcount>
	<cfquery datasource="gemssql" name="status">
	     select paymode , status as s from cartstatus where cartid = #q.lastcartid#
	</cfquery>
			   <cfif arguments.mail is 'james@vsnl.com'>
		   <cfdump var="#status#" />
<cfdump var="#q#" />
		   
		   </cfif>

	<cfif status.recordcount>
	<cfif status.s eq 'done' or status.paymode eq '2co' or status.paymode eq 'auth.net' or status.paymode eq 'pp'>
<!--- do nothing but also do not output anything here since this method is embedded in a flow of commands.
instread modify to return a flag that can be used to output msg where required	Cannot Reverse Credit. Last Cart For which credit was used has already been paid for.
	<a href="cart.cfm">Click Here To Continue</a> --->
<cfelse>
	<cfquery datasource="gemssql">
	update cartstatus set status = 'cr_rev' where cartid = #q.lastcartid#
	</cfquery>
	<cfquery datasource="gemssql"  >
         update invite_credits set lastcartid = -1 ,balancecredit = balancecredit + lastcreditvalue where email = '#arguments.mail#'
    </cfquery>
  	<cfquery datasource="gemssql"  >
          update invite_credits set lastcreditvalue  = 0 where email = '#arguments.mail#'
    </cfquery>
	
	</cfif>
	</cfif>
	</cfif>
	</cffunction>
  
  <cffunction  name="activecredits" access="public" output="true">
    <cfargument name="email" required="true" type="string">
    <cfquery datasource="gemssql"  name="q">
    select * from active_credits where email = '#Arguments.email#' 
    </cfquery>
    Following credits can be reversed:<br>
    <cfoutput query="q"> Cart id : #cartid# for a value of #dollarformat(credit)# 
      <a href="reverseinvitecredit.cfm">Add This Back to My Credit</a><br>
    </cfoutput> NOTE: Reversing a credit will also remove the cart from our records 
    and will not be shipped. 
  </cffunction>
  
  
  <cffunction name="listfriends" access="public"  output="false" returntype="query" >
    <cfargument default="#session.mail#" required="false" type="string" name="acntemail" hint="list of friends invited by this email account" />
	<cfquery datasource="gemssql"  name="q">
    select email, creditpart,datesignedup, dateinvited from invited where byemail = '#Arguments.acntemail#' 
    </cfquery>
    <cfreturn q>
  </cffunction>
  <cffunction name="viewcredits" output="false" returntype="query" access="public">
    <cfquery datasource="gemssql"  name="q">
    select * from invite_credits where email = '#session.mail#' 
    </cfquery>
    <cfreturn q>
  </cffunction>
</cfcomponent>
