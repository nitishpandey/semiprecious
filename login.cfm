<cfif not isdefined("form.email")><!---- this allows someone else to submit the form while someone else is already logged in --->
	<cfif isdefined("url.email") >
	 	 <cfset form.email = url.email />
	<cfelse>
		<cfset form.email = session.mail /><!--- why do anything else in this case? --->
	</cfif>
</cfif>

		<cfif  form.email contains "@" and form.email neq application.wholesale_guest>
			<!--- clear session but not cart if login different from previous login --->	  	
        	 	<cfquery datasource="gemssql" name="validws">
				   select minamt , email, address,membershipdate,status from bulkbuyers where    email ='#trim(form.email)#' 
			    </cfquery>
			    <cfif validws.recordcount >
					<cfif not len(session.bulkbuyer.id) and  not (cgi.HTTP_REFERER contains 'semipreciouswholesale.com')><!--- true means valid wholesale member who is on ws site. no need to pass current cartid --->
	 					<cflocation addtoken="false" url="http://www.semipreciouswholesale.com/whole_login.cfm?email=#trim(form.email)#&tacdid=#session.cartid#" />
					</cfif>
				    <cfset valid.recordcount = 0 />
				<cfelse>
						<cfquery datasource="gemssql" name="valid">
			        		 SELECT * FROM memberinfo  WHERE email='#trim(form.email)#'  
						</cfquery>	
			    </cfif>
				<cfif valid.recordcount and not len(session.bulkbuyer.id)><!--- on ws site just don't entertain retail buyers--->								
					<cfquery datasource="gemssql" >
			       		update memberinfo  set loggedin = 1 where email='#trim(form.email)#'  
					</cfquery>	
						<cfif session.cartitem[1][1]>
					     	<cfquery datasource="gemssql" name="v">
			        			UPDATE buyingrecord  SET  email='#trim(form.email)#'                WHERE cartid='#session.cartid#'
							</cfquery>
							<cfquery datasource="gemssql" name="ad">
			        			UPDATE cartstatus  SET  buyer='#trim(form.email)#'                WHERE cartid='#session.cartid#'
							</cfquery>
						</cfif>
				
		<!--- creates a new session id with entry in table but does not replicate 
		  cart inthe db with new id.  --->
	         <cfelse> <!--- either not a retail member or could be a retail member on ws site. this way he can keep  both memberships --->
				  
			<cfif validws.recordcount>
				<cflocation addtoken="false" url="http://www.semipreciouswholesale.com/whole_login.cfm?email=#trim(form.email)#&next_url=#cgi.path_info#&qry=#urlencodedformat(cgi.query_string)#" />
				<cfelse>
                <cfif form.email neq application.wholesale_guest >
					<cflocation addtoken="false" url="/simpleloginform.cfm?msg=retry&email=#trim(form.email)#" /><!--- 
				<cflocation addtoken="false" url="http://www.semipreciouswholesale.com/whole_login.cfm?email=#form.email#&tacdid=#session.cartid#" /> --->
        		<cfelse>
                <cflocation addtoken="false" url="/#session.cart#?msg=retry&email=#trim(form.email)#" />
				        </cfif>
		   </cfif>	    
	 </cfif>
	<cfelseif len(form.email) >
				<cfif form.email neq application.wholesale_guest >
				<cflocation addtoken="false" url="/simpleloginform.cfm?msg=retry2&email=#trim(form.email)#" />
				<cfelse>
                <cflocation addtoken="false" url="/#session.cart#?msg=retry1&email=#trim(form.email)#" />
	            </cfif>
                <cfelse> 
				<cflocation addtoken="false" url="/simpleloginform.cfm?msg=welcome" />
		</cfif>
<!--- we haven't checked if the email id is of signed up member. lets first check for wholesale because wholesale allows switch to retail mode --->
	  
		  			  <CFQUERY DATASOURCE="gemssql" NAME="login">
					SELECT lastname, nlstatus, firstname, email, address1, address2, city, state, zip, country, phonenumber, earned
					FROM memberinfo 	WHERE email='#trim(form.email)#'
			</CFQUERY>
			  <CFQUERY DATASOURCE="gemssql" NAME="b">
					SELECT top 50 buyingrecord.itemid as ii, items.cat as c, datebought 
						FROM buyingrecord,items WHERE email='#trim(form.email)#' and buyingrecord.itemid*1 = items.newitem
			</CFQUERY>
			  <cfquery dbtype="query" name="buyingrecord">
			select distinct ii , c from b 
			</cfquery>
						<CFIF login.recordcount and not len(session.mail)>
                               <cfset session.mail=login.email>
							<cfif not session.cartitem[1][1] >
							<cfquery datasource="gemssql" name="getcarts">
								Select top 1 cartid, paymode from cartstatus where buyer='#session.mail#'  and paymode <>'activated'  and cartid <> #session.cartid# and cartid <> 0 order by cartid desc
							 </cfquery>
							 <cfif getcarts.recordcount>
								 <cfif getcarts.paymode neq 'emptied'>
							 	<cfset session._cartid = getcarts.cartid />
								 <cfinclude template="/includes/cartfromcookie2.cfm" />
 						         <cfset k = structdelete(session,'_cartid') />
								 </cfif>
							</cfif>
                           </cfif>
						</cfif>


  <!--- <CFQUERY DATASOURCE="semiprecious" NAME="wishlist">
SELECT newitem, dateadded
FROM wish
WHERE email='#email#'
</CFQUERY> --->
		
		<cfsavecontent variable="inheader">
  <title>Welcome to Semiprecious Jewelry Store</title>
				  <meta name="robots" content="noindex,nofollow">
					<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
			  <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
		  	<script language="JavaScript" src="/js/imageswap.js"></script>
</cfsavecontent>		
				  	<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
				   		<div id="container2">
				   			  <table  cellspacing="0" cellpadding="2" border="0" style="background:white;padding:0 2px 0 2px">
			    <tr  align="center">
			      <td valign="top" WIDT="1px"  align="left" ><!--- BEGIN LEFT SIDE STUFF --->
			        <!--- END LEFT SIDE STUFF --->
			      </td>
			      <td align="center" valign="top" style="padding:2px;"><div align="center">
			        <CFOUTPUT>
			          <CFIF login.recordcount IS "0">
					            <div align="center" >
					              <div class="error2" style="width:390px;font-size:12px;"><br>
					                <br />
					                
					                <span style="width:360px;;">SORRY!</span> <br>
					                Email ID #form.email# not found.<br>
					                Click <a class="link" href="simpleloginform.cfm">here</a> to try again<br>
					                If you are not a member click <a href="apply.cfm?emailid=#form.email#">here</a> to sign up for discounts. </div>
					            </div>
</td></tr></table>								</div>
								</body>
								</html>
					            <cfabort  />
			            <CFELSE>
							          <cfif login.email contains "@">
									      <cfquery datasource="gemssql">
										      update memberinfo set lastvisit = #Now()# , noofvisits = noofvisits + 1 where email='#login.email#' 
									      </cfquery>
									     <cftry>
												 <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q">  
													  <cfinvokeargument name="mail" value="#login.mail#" />
												</cfinvoke>
										 <cfcatch type="any">
										 </cfcatch>
										 </cftry>
                  
								        	  <cfset session.mail=login.email>
								 	      		<cfif session.mail neq application.admin_email >
										   		   	<cfset session.desc_flag = 0 />
												</cfif>
							              <cfinclude template="sessioncustomerid.cfm" />
								              <cfset d = datepart('d',now())>
								             
								      
						
						            <div  align="left"> 
						            <div id="container3" >
						            <div class="grayplacard" style="text-align:left;width:80%;font-weight:bold;padding-left:2px;font-size:1.1em;">Your Shopping History and Shipping Details</Div>

								<div style="float:left;margin-top:4px;">						         #login.firstname# <br />
                            						              <cfset session.name = replace(login.firstname,'password','') />
                            						              #login.email#<br />
                            									  <cftry>
                            						              <CFIF #login.address1# is not "" or 1 >
                            							            Address Line 1:    #login.address1# 
                            											<br />Address Line 2: #login.address2#<br />
                            							                City: #login.city# &nbsp;<br />State: #login.state# - #login.zip# <br />Country: #login.country#<br />
                            							                Phone: #login.phonenumber#
                            											<!--- set country code --->
                                                                                </div>
<!---									
											<cfif session.country neq "india">
											<div style="position:relative;border:2px dotted green; width:420px;float:left;display:inline;margin-left:10px;">

											<cfquery  datasource="sptm" name="valid">
												    select code, max_value,status from bulkbuyercoupons where 	   email = '#session.mail#' and coupon_type = 'referral_35' 
										    </cfquery>

									    <cfif valid.recordcount>
												<cfif valid.status is 'active'>
													<div class="green_band_ticked_ht" style="width:370px;margin:6px;">Your 35% Referral Discount Coupon <cfoutput>#valid.code#</cfoutput> is active and ready to be used for shopping. You can use this for shopping up to <cfoutput>#format(valid.max_value)#</cfoutput></div>
												<cfelse>
													<div class="green_band_ticked_ht" style="width:370px;margin:6px;">Your 35% Discount Coupon is <cfoutput><span style="background-color:white;">#valid.code#</span></cfoutput>. To activate the coupon please <a href="invite.cfm?starting=more" class="error">invite</a> <cfoutput>#evaluate((102-valid.max_value)/17)#</cfoutput> more friend(s)</div>
												</cfif>

										<cfelse>
											<span class="h" style="padding:4px;">
										         Special 35% discount from our advertising budget &nbsp;&nbsp;&nbsp; <a href="invite.cfm?starting=1" style="display:inline;" class="error1">Start Here</a>
											 </span> 
										</cfif>
										<img src="/images/que.gif" style="display:inline;position:absolute;top:0px;left:350px;"  onClik="document.getElementById('que_answer').innerHTML='';" onClick="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content1').innerHTML;" />
											 <span id="que_answer" style="position:absolute;z-index:3;top:10px;left:12px;"></span>
 	 					
										</div>	
										 </cfif>
										 --->
<div style="clear:both"></div>
<hr />
				 <div id="easy_content" style="display:none;">
					 	<div style="background-image:Url('/images/help_resources_tl.gif');width:400px;">
						  <br />The Loyal Shopper's Reward System
						  <div class="detailrow"  align="left"	  style="text-transform:none;background-color:white;border:2px ##E6Cf84 solid;border-top:0px;padding:3px;text-align:justify;">
						  <cfoutput>	You collect discount points for every purchase made on this store by you or your friends. For example, if your purchase is for #format(100)# then you get points worth #format(Application.own_credit)#. <br />
						  For a friend's cart of #format(100)# we add #format(Application.friend_credit)# to your points. <br />These points are used to give you a discount on your future purchases. The discount you get is 20% on all items and 10% on items on sale. You get a total discount limited by the points you have. More the points bigger the discounts. <br />
						  Let's take another example. To use $10.00 credit points, you can make a purchase $50.00  (Because 20% of $50.00 is $10.00). This example assumes you have all items with regular price in your cart. If an item is on sale then the system will calculate discount of 10% on it. The total discount in such manner cannot exceed the credit points you have.</cfoutput> 
							<br />[<span  onClick="document.getElementById('que_answer').innerHTML='';" class="error1" style="cursor:pointer;"><a href="invite.cfm?closeinfo">Close &amp; start spreading the word</a></span>]
				 		</div>
		 			</div>
		 		</div>
                            <div id="easy_content1" style="display:none;" >
					 	<div style="background-image:Url('/images/help_resources_tl.gif');width:500px;" >
							<br />
							<cfinclude template="/includes/crp.cfm" />
		 				</div>
		 		</div>
<div style="float:right;margin-right:10px;">
<!-- 	<div class="heading_bg" style="height:55px; width:150px;border:2px ##6D6 groove;text-align:center;color:padding:4px;margin:6px;margin-left:0px;">
                  <a class="login_link" href="invite.cfm">Invite friends to Earn Discount Points worth #format(5)# for every friend invited</a> 
				  </div>
 -->		
					    <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q"> 
						</cfinvoke>
        
<cfsilent>	        
               <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="grandtotal" >
			                    <cfinvokeargument name="amounttopay" value="10000">
			                    <cfinvokeargument name="finalize" value="0">
              </cfinvoke>
		</cfsilent>
		           <cfif grandtotal LT 10000>  
				   <span class="set" style="width:150px;"><strong>
				   	<!---<a href="/viewinvitecredits.cfm"> --->
					 Semiprecious.com Cash  <!---</a> --->
					 #dollarformat(10000-grandtotal)#
					 <cfset session.loyalty_points = true />
					  </strong>
                                    </span>
				</cfif>	
                        </div>
				  											
										<cfset session.address.address1 = login.address1 />
										<cfset session.address.address2 = login.address2 /> 
										<cfset session.address.zip = login.zip />
										<cfset session.address.city = login.city />
                                                                                <cfset session.address.state = login.state />
										<cfset session.address.country = login.country />
										<cfset session.address.country_code = '' />
			 							<cfset session.address.phone = login.phonenumber />
										<cfset k =  listfindnocase(('australia,new zealand,united states of america,united kingdom,canada,india'),login.country) />
										<cfswitch expression="#k#">

										<cfcase value="6">
										<cfset session.address.country_code = 'IN' />
										</cfcase>										<cfcase value="3">
										<cfset session.address.country_code = 'USA' />
										</cfcase>
										<cfcase value="5">
										<cfset session.address.country_code = 'CA' />
										</cfcase>
									
										<cfcase value="4">
										<cfset session.address.country_code = 'GB' />
										</cfcase>
										<cfcase value="1">
										<cfset session.address.country_code = 'AU' />
										</cfcase>
										<cfcase value="2">
										<cfset session.address.country_code = 'nz' />
										</cfcase>
										<cfdefaultcase>
										<cfset session.address.country_code = login.country />
										</cfdefaultcase>
								
										</cfswitch>
			<!--- country code set --->
						              </cfif>
									  <cfcatch type="any">
									  </cfcatch>
									  </cftry>
						            </div>
				             </cfif>
				      </div>

				
         
          
		  <div  style="width:100%" align="left">
            <span  style="font-weight:bold;"><u>Edit Your Profile</u></span>
            <table border="0" width="758">
              <tr>
                <td valign="top"><ul class="arrow_ul">
                                <li>Change your account <a class="link" href="/myaccount/changeemailid.cfm">email id </a>.</li>
           
		            <li>Update your <a class="link" href="/myaccount/updateprofile.cfm?email=#login.email#">shipping address</a>.</li>
                  </ul>
               </td>
                <!--- <td align="center"><div  style="width:758px;" align="left"><span  style="font-weight:bold;"><u>Member Features</u></span>
            <ul style="line-height:18px;" class="arrow_ul">
     	       <li>You can <a class="error1" href="/logout.cfm">logout</a> and continue your shopping later from anywhere</li>       
<li> Maintain your <a href="wish.cfm" class="login_link">wishlist</a> 
</li>
<li> If an out of stock item in your wishlist is stocked up, we send you a short note to let you know</li>
 <!--  <li>To return a jewelry item you can call us or write in. need to generate an item <a href="returnticket1.cfm">return ticket</a> </li>-->
                    <!-- <li>View Items in your previous <a href="returnticketview.cfm">return ticket</a></li>-->
                  <!--  <li>We would like to hear from you. Send us a <a href="contactus.cfm">message</a>, <a href="marketing/feedback.cfm">feedback</a> or query</li>
                  
              <li> Get loyalty discounts - Tell your friends about this jewelry  store by <a href="invite.cfm?starting=1">inviting friends</a>. If you do this we thank you with discounts on your purchase...you earn 7.5% credit from each of their purchase!
                
<br />
                (<b >Example of how you benefit from the loyalty points: If one of your invited friends shops for #format(100)# you can get #format(application.friend_credit)# discount in your next purchase</b>) </li>
              <li> <a href="viewinvitecredits.cfm">View</a> list of friends invited </li>
              
            <li>The system treats you as your best friend and you get #application.own_credit#% credit from each purchase for discount in a later purchase(s). How it gets used up is:

<ul>

                <li>Maximum discount you get is 20% of the cart value. So, to use #format(10)# credit points, you must purchase #format(50)# worth items (Because 20% of #format(50)# is #format(10)#). 
				This example assumes you have all items with regular price in your cart. If an item is on sale then the system will calculate discount of 10% on it.
				The total discount in such manner cannot exceed the credit points you have.
  </li><li>That's not all. You also earn points from this new purchase that  you can use in your next purchase. Yes it is a loyal customer reward. </li>
                          
</ul>-->

<li>Read the <a href="newsletters/nlviewerwithurlid.cfm?id=#login.nlstatus#&customer=#login.firstname#">latest newsletter</a>. </li> 
            </ul>
          </div>
          
       		  </td> --->
              </tr>
            </table>
        
          </span>
          </div>
          <hr />
                 <div style="overflow-y:scroll;text-align:left; padding:2px;margin-top:30px; width:90%">
                                      <cfinclude template="myaccount/previouscarts.cfm">
                                      </div>
          <br />
          <!---     <CFTABLE QUERY="wishlist" COLHEADERS border="yes" htmltable="yes">
          <CFCOL	HEADER="Item Number" align="left" 
	TEXT="<a href='jewelry_item.cfm?itemnumber=#wishlist.newitem#'>#wishlist.newitem#</a>">
          <CFCOL
	HEADER="Date Added"
	TEXT="#wishlist.dateadded#">
        </cftable> --->
         
         <hr />
         <cfif buyingrecord.recordcount neq 0>
           <div align="center" style="margin:1px;margin-top:10px;border:ridge 2px "> 
           <div align="left"class="grayplacard" style="text-align:left;width:100%">Gallery of designs bought or liked by you in the past 1 year </div>
			            <!--- Total Credit Availible: #DollarFormat(login.earned)# --->
			            
			              <CFLOOP QUERY="buyingrecord">
			                <Cfif not (currentrow mod 6) >
			                  <br />
			                </Cfif>
			                <a href="jewelry_item.cfm/#ii#.htm"><img src="images/#c#/thumb/#ii#.jpg" vspace="0" height="60" hspace="0" border="0"></a>
			              </cfloop>
			            </div>
			          </cfif>
			  </cfif>
        </cfoutput>
        <!---  <CFTABLE QUERY="buyingrecord" COLHEADERS>
      <CFCOL
	HEADER="Date Bought"
	TEXT="#Dateformat(buyingrecord.datebought, "mm/dd/yyyy")#">
      <CFCOL
	HEADER="Item ID"
	TEXT="<a href='jewelry_item.cfm?itemnumber=#buyingrecord.itemid#'>#buyingrecord.itemid#</a>">
      <CFCOL
	HEADER="Credit Earned"
	TEXT="#DollarFormat(buyingrecord.earned)#">
    </cftable> --->
        <br>
        <br>
        <br>
      </td>
    </tr>
 
  </table>
   </div>   <cfinclude template="mainfooter.cfm" />

  </div>
  </body>
  </html>
  