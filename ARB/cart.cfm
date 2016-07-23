<Cftry>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFPARAM NAME="nonUSA" DEFAULT="">
<cfset leftgemstonedisplay="inline" />
<cfset expedited_possible = 1 />	
<cfparam name="incrementcartid" default="" />
<CFPARAM NAME="texas" DEFAULT="0" />
<CFPARAM NAME="shipping" DEFAULT="2.99" />
<CFPARAM NAME="session.bulkbuyer.minamt" DEFAULT= "200" />
<cfinclude template=setup.cfm>
<CFPARAM NAME="description" DEFAULT="" />
<cfparam name="loyaltycredit" default="0" />
<cfparam name="form.optionid" default="0" />
<cfparam name="form.set" default="0" />
<cfparam name="form.style" default="0" />
<cfif isdefined("form.ajaxcheck") >
  <cfset session.ajaxcheck = form.ajaxcheck />
</cfif>
<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com" and session.bulkbuyer.id does not contain "@">
  <cfset session.bulkbuyer.id = "guest">
</cfif>--->
<cfset handlingcharges = 3.99>
<!--- also set in confirmation page --->
<cfparam default="100" name="invent" />
<cfparam default="0" name="valueadd" />
<CFPARAM NAME="Price" DEFAULT= "0" />
<CFPARAM NAME="category" DEFAULT= "" />
<CFPARAM NAME="newitem" DEFAULT= "" />
<CFPARAM NAME="cart" DEFAULT= "" />
<cfparam name="volumediscount" default="1" />
<CFPARAM NAME="bought" DEFAULT="" />
<CFPARAM NAME="quantity" DEFAULT="1" type="numeric" />
<CFPARAM NAME="j" DEFAULT=0 type="numeric" />
<CFPARAM NAME="newQty" DEFAULT="" />
<CFPARAM NAME="TotalQty" DEFAULT=0 type="numeric" >
<cfparam name="session.gallery" default="list">
<cfset testing = 0>
<cfif isdefined("url.resendmail")>
<cfquery datasource="sptm" password="rangeela" username="nitish" name="exists">
				select email from bulkbuyers  where email = '#urldecode(url.resendmail)#'
			</cfquery>
			<cfif exists.recordcount>
<cfmail from="service@semiprecious.com" subject="wholesale jewelry affiliation programme" to="#trim(urldecode(url.resendmail))#" bcc="scorpionitish@yahoo.com"  server="mail23.webcontrolcenter.com" type="html" failto="nitish@semiprecious.com">
			<div align="center" style="border:2px ridge ##666600;padding:4px;">Wholesale.<font color="##558633" size="+2">Semi</font><font color="##ff8000;" size="+2">precious.com</font></div><div style="border:0px ridge ##666600;padding:6px;text-align:left"> 
			Hi ,</div><div style="text-align:justify">
			         &nbsp;&nbsp; 
					Welcome to a collection of huge range of designs in semi precious stones  and all at stunning prices. 
					
			        Once you activate your account your minimum purchase is #format(application.bulkbuyer.minamt)#. Above #format(300)# you can use easy payment plan. No minimum quantity per design. Shipping charges are as low as they can be .
			        <br>
			         So let's get started. Your activation number is  <strong> 48290.</strong> Click on the link given here or cut paste this URL on your browser address - <a href="http://wholesale.semiprecious.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(urldecode(url.resendmail))#">http://wholesale.semiprecious.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(urldecode(url.resendmail))#</a>. 
			          Please use this number for activating your account. This is required 
			          to confirm that you have provided us a valid email address. Hoping to 
			          do  mutually profitable business.</div> <div style="text-align:left">Regards, <br />- Semiprecious.com 
			          Team </div><div align="center" style="background-color:##CCECCC;margin-top:0px;height:10px;">&nbsp;
			</div>
			<hr />
			 </cfmail>
<cfmail from="service@semiprecious.com" subject="Your registration at wholesale store" to="#trim(urldecode(url.resendmail))#" bcc="scorpionitish@yahoo.com"  server="mail23.webcontrolcenter.com"  failto="nitish@semiprecious.com">
			Wholesale.semiprecious.com 
			Hi ,
			     
					Welcome to a collection of huge range of designs in semi precious stones  and all at stunning prices. 
					
			        Once you activate your account your minimum purchase is #format(application.bulkbuyer.minamt)#. Above #format(300)# you can use easy payment plan. No minimum quantity per design. Shipping charges are as low as they can be .
			        
			         So let's get started. Your activation number is  48290. Cut paste this URL on your browser address - http://wholesale.semiprecious.com/whole_login.cfm?activationnumber=48290&amp;email=#trim(urldecode(url.resendmail))#. 
			          Please use this number for activating your account. This is required 
			          to confirm that you have provided us a valid email address. Hoping to 
			          do  mutually profitable business.
Regards, 
- Team Semiprecious.com 
			          
			 </cfmail>

			 <cfelse>
			 <cfset url.resendmail = '' />
			</cfif>
</cfif>
<!---<cfset session.mail="test32@aol.com">--->
<cfif session.cartid eq 0 >
	<cfif isdefined("session.confirmed_cartid")>
		<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />

	<cfelse>
		<cfinclude template="cartfromcookie2.cfm" />
	</cfif>
</cfif>

  <cfif not isdefined("session.cartitem")>
		<cfset session.cartitem = 0 />
		<cfset session.cartitem = arraynew(2) />
		<cfset session.cartitem[1][1] = 0>
	<cfset session.cartitem[1][2] = 0>
	<cfset session.cartitem[1][3] = 0>
	<cfset session.cartitem[1][4] = 0>
	<cfset session.cartitem[1][5] = 0>
		<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />

</cfif>

<!---<cfset quantity = 3>
<cfset price = 10.00>
<cfset optionid= "1">
<cfset bought = "buy">
<cfset newitem= "1038">
---><!--- used to determine on cart page whether the buyer should be routed to list.cfm or listcluster.cfm when he clicks on continue shopping --->
<cfset saletotal = 0>
<!--- this has to be set then why use cfparam? this is aboviouslfy faster --->
 <CFIF newQty NEQ "">
  <cfset session.cartitem[newitem][4]= newQty>
</CFIF>
<!---<CFSET session.cartitems = listDeleteAt(session.cartitems,delAt)>--->
<!--- one less than actual qty --->
<!--- dont do the logics done below on cartid because that is always set to 1 on application.cfm page for
reasons of not knowing where all it may be required. it could not be removed after uniquecartid was introduced
--->

<!---  setting to repeat  does not in anyway hamper 
the processing of the order by the customer, the trusted 3rd party or you the vendor.
it only tells that the carts were not abandoned from the confirmation page   --->
<!--- to go to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of confirmation  page or
return to confirm page from a paypal's first page will not cause cartid to be incremented --->

<!--- <CFQUERY DATASOURCE="semiprecious" NAME="getcredit1">
SELECT earned, newearned FROM memberinfo WHERE email='#session.mail#' 
</CFQUERY> --->

<cfif testing eq 1><cfoutput>Start<br /></cfoutput></cfif>

<cfif session.cartid gt 0>

   	   <cfquery datasource="gemssql" name="confirmedstatuscheck">
               SELECT cartid, paymode, status FROM cartstatus WHERE cartid = '#session.cartid#' AND paymode='null' and paymode is not null and cost >0
        </cfquery>
		<cfif confirmedstatuscheck.recordcount gt 0>
<!--- do nothing Nitish: 14 Mar --->
<!---			<cfset session.confirmedunpaid = session.cartid />
			  		<cfset incrementcart="yes">
					<cflock name="setcartid" type="exclusive" timeout="10">
            	        <cfset application.cartid = application.cartid + 1>
            		    <cfset session.cartid = application.cartid >
            			<cfset incrementcart="done">
					</cflock>
--->
<cftry>
				<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">	    
      			 <cfif session.cartitem[jc][4] gt 0 >
        		 	   <cfquery datasource="gemssql" name="updatecart">
                       			INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
                    			VALUES ('#session.mail#', '#session.cartitem[jc][1]#', '#session.cartitem[jc][4]#', '#session.cartid#', '#session.cartitem[jc][5]#', #session.cartitem[jc][3]# )
            			</cfquery>
	      			</cfif>
		      </cfloop>
			    <cfcatch type="any">
		  </cfcatch>
		  </cftry>
		  <cfelse>		
   	   <cfquery datasource="gemssql" name="paidstatuscheck">
               SELECT cartid, paymode, status FROM cartstatus WHERE cartid = '#session.cartid#' AND paymode<>'null' and paymode is not null
        </cfquery>
     		     <cfif paidstatuscheck.recordcount gt 0 >
					   <!--- clear session for cart thats paid already --->
        				 <cfloop condition="Arraylen(session.cartitem) gt 1" >
        			           <cfset temp = ArrayDeleteAt(session.cartitem, Arraylen(session.cartitem)) >
        		         </cfloop>
        				 <cfset session.cartitem[1][1] = 0>
        		          <cfset session.cartid = 0>
        	        
        		        	<cflock name="setcartid" type="exclusive" timeout="10">
        		             	<cfset application.cartid = application.cartid + 1>
        			        	<cfset session.cartid = application.cartid >
        	       	   		</cflock>
        		</cfif>
		</cfif>

 <!--- Check if current cart is paid, or if current cart has a different email attached to it. --->
   <cfif session.mail contains "@"> 
    <cf_wholelogin id="#session.mail#" />
			 <cfif testing eq 1> <cfoutput>email found:#session.mail#<br /></cfoutput>  </cfif>
	     <cfquery datasource="gemssql" name="currentcart">
		        SELECT top 1 cartid FROM buyingrecord  WHERE cartid = #session.cartid#
	       AND email = '#session.mail#' and email <>'na' 
	      </cfquery>
		<cfif currentcart.recordcount eq 0 >
		<!--- email doesn't match stored email.  We'll delete this session cart and start a new one. --->
<!--- Actually nothing done to session cart on logging in ..removed by Anup---->
<!---        <cfsilent>
         <cfloop condition="Arraylen(session.cartitem) gt 1" >
           <cfset temp = ArrayDeleteAt(session.cartitem, Arraylen(session.cartitem)) >
         </cfloop>
		 <cfset session.cartitem[1][1] = 0>
         <cfset session.cartitem[1][2] = 0>
         <cfset session.cartitem[1][3] = 0>
         <cfset session.cartitem[1][4] = 0>
         <cfset session.cartitem[1][5] = 0>
         <cfset session.cartid = 0>
         </cfsilent>--->
		 
      <cfelse>
		 <cfif testing eq 1> <cfoutput>cart/email found in buyingrecord<br /></cfoutput>  </cfif>
        <!--- check to see if cart got paid in the meantime --->
  <!---  MUST CHANGE status<>done --->
        <cfquery datasource="gemssql" name="paidstatuscheck">
               SELECT cost, cartid, paymode, status FROM cartstatus WHERE cartid = '#session.cartid#' AND paymode='null' and paymode is not null
        </cfquery>
        <cfif paidstatuscheck.recordcount eq 0 >
			<cfif testing eq 1>  <cfoutput>Found paid in cartstatus<br /></cfoutput></cfif>
          <!--- Cartid is already paid. Clear the current session cart --->
          
        
         <cfloop condition="Arraylen(session.cartitem) gt 1" >
           <cfset temp = ArrayDeleteAt(session.cartitem, Arraylen(session.cartitem)) >
         </cfloop>
		 <cfset session.cartitem[1][1] = 0>
         <cfset session.cartid = 0>
    
         <cfelse>
				 <cfif testing eq 1><cfoutput>Found in cartstatus<br /></cfoutput></cfif>
		 		 <cfif paidstatuscheck.cost GT 0>
		 		 <!--- found confirmed but unpaid, do not clear cart from session, but increment cartid--->
				 	<cflock name="setcartid" type="exclusive" timeout="10">
             				<cfset application.cartid = application.cartid + 1>
				        	<cfset session.cartid = application.cartid >
							          	   	</cflock>
		 		 </cfif>
        </cfif>

  </cfif>
<cfelse>
   <!--- Cartid, but no email.  We don't need  to do anything at this point --->
	<cfif testing eq 1><cfoutput>No email<br /></cfoutput>  </cfif>

</cfif>
      

</cfif>
<cfif testing eq 1><cfoutput>
<cfloop index="jz" from="1" to="#Arraylen(session.cartitem)#">
 
Point3cart: #session.cartid#,#session.cartitem[jz][1]#,#session.cartitem[jz][2]#,#session.cartitem[jz][3]#,#session.cartitem[jz][4]#,#session.cartitem[jz][5]#<br />
</cfloop>
</cfoutput></cfif>
<cfif testing eq 1><cfoutput>Point 3<br /></cfoutput>  </cfif>


<cfif not session.cartid  >
  <!--- if there is no cartid, but mail, check the db and if the email is in the db copy it to the session --->
  <!--- no cartid means that they have not come to this page before during this session or have not added any items to the cart.  --->
  <!--- if they have added items, there will be a cart id --->
		  <cfif session.mail contains "@">
		  	<cf_wholelogin id="#session.mail#" />
					<cfif testing eq 1><cfoutput>mail found<br /></cfoutput></cfif>
			    <!--- First we check the buyingrecord table for the email --->
			    <cfquery datasource="gemssql" name="currentbuyingrecordcart">
			       SELECT top 1 cartid FROM buyingrecord WHERE email = '#session.mail#' order by cartid desc
			     </cfquery>
			    <cfset cartfound = 0>
			    <cfif currentbuyingrecordcart.recordcount neq 0>
			      <!--- Email was found in buyingrecord db, check to see if any are unpaid --->
				      <cfloop query="currentbuyingrecordcart">
					        <cfquery datasource="gemssql" name="paidstatuscheck">
					             SELECT status, cartid, paymode FROM cartstatus 
					             WHERE cartid = '#currentbuyingrecordcart.cartid#' 
					             AND paymode = 'null' and paymode is not null and cost>0
					           </cfquery>
							   							   
					        <cfif paidstatuscheck.recordcount GT 0>
								
								<!--- Unpaid confirmed cart found.  Session will be cleared and new cartID issued with option to activate unpaid cart--->
									   <cfset cartfound = 0>
									   <cfset incrementcartid ="yes">
						          <cfelse>

									<cfif testing eq 1><cfoutput>cartid #currentbuyingrecordcart.cartid# not found in cartstatus<br />
							          </cfoutput>
							
									  </cfif>
						        </cfif>
				      </cfloop>
			      <cfelse>
			<cfif testing eq 1><cfoutput>email not found in db<br /></cfoutput></cfif>
	    </cfif>
			      	<cfinclude template="cartfromcookie.cfm" />

    <!--- End email found in db --->
    <!--- if there is no cartid and no mail, check cookies --->
<cfelse>
   <cfif testing eq 1><cfoutput>No cartid, no mail<br /></cfoutput></cfif>
    <!--- if there is a cookie, pull the cartid from the db --->
<cfinclude template="cartfromcookie.cfm" />    <!--- End cookie check --->
</cfif>
  <!--- End session.mail found --->

</cfif>
<!--- End pull from db update --->

<!--- update cart if they clicked on something to buy --->
<cfif bought is "buy" and newitem neq "">

  <!--- nothing in cart currently, so added item that was clicked --->
  <cfif session.cartitem[1][1] EQ 0 >
  	<cfif session.mail neq application.admin_email ><!--- for every one except admin mail, switch off --->
      	<cfset session.desc_flag = 0 />
	</cfif>
    <cfset session.cartitem[1][1] =newitem>
    <cfset session.cartitem[1][2] =category>
    <cfset session.cartitem[1][3] =price>
    <cfset session.cartitem[1][4] =quantity>
    <cfset session.cartitem[1][5] =optionid>
    <cfset added = 1>
    <cfelse>
    <!--- See if item clicked is already in cart --->
    <cfset added = 0>
    <cfloop  index="jh"  from="1" to="#ArrayLen(session.cartitem)#">
      <cfif session.cartitem[jh][1] eq newitem and  session.cartitem[jh][5] eq optionid >
<cfif testing eq 1><cfoutput>Session Item updated<br />
        </cfoutput></cfif>
        <cfset session.cartitem[jh][2] =category>
        <!--- only qty is required but cat and price are reentered just to make sure --->
       <cfset newRate = min(session.cartitem[jh][3],price) >
        <cfset session.cartitem[jh][3] =newRate>
        <cfset session.cartitem[jh][4] =quantity>
		<cfset session.cartitem[jh][5] =optionid>
        <cfset added = 1>
        <!-- Added -->
        <cfbreak />
      </cfif>
    </cfloop>
    <!--- if not, then add to cart --->
    <cfif not added >
      <!--- if any current items have 0 quantity, we'll replace that cart item --->
      <cfloop  index="jg"  from="1" to="#ArrayLen(session.cartitem)#">
        <cfif  session.cartitem[jg][4] eq 0>
<cfif testing eq 1><cfoutput>Session Item added<br />
          </cfoutput></cfif>
          <cfset session.cartitem[jg][1] =newitem>
          <cfset session.cartitem[jg][2] =category>
          <cfset session.cartitem[jg][3] =price>
          <cfset session.cartitem[jg][4] =quantity>
          <cfset session.cartitem[jg][5] =optionid>
          <cfset added = 1>
          <cfbreak />
        </cfif>
      </cfloop>
    </cfif>
    <!--- if it wasn't replaced above, then add to cart --->
    <cfif not added>
      <cfset cartal = arraylen(session.cartitem) + 1>
      <cfset session.cartitem[cartal][1] =newitem>
      <cfset session.cartitem[cartal][2] =category>
      <cfset session.cartitem[cartal][3] =price>
      <cfset session.cartitem[cartal][4] =quantity>
      <cfset session.cartitem[cartal][5] =optionid>
      <cfset added = 1>
    </cfif>
  </cfif>
</cfif>

       <!--- by anup - increment cartid if cart was confirmed before just in case its paid for but not update of status as paid but keep cart items same--->
				  				 <cfif incrementcartid is "yes">
			    					 <cfcookie name="cartid" expires="now" value="" >
	  		    				 		   <cflock name="setcartid" type="exclusive" timeout="10">
						             	<cfset application.cartid = application.cartid + 1>
							        	<cfset session.cartid = application.cartid >
		 			          	   	</cflock>
									<cfset incrementcartid is "done">
								</cfif>
<!--- if the cart is not empty, confirm that there's a cartid and update db --->

<cfif session.cartitem[1][1] neq 0 >

  <!--- if there is no cartid, create one --->
  <cfif session.cartid eq 0 >

    <cflock name="setcartid" type="exclusive" timeout="10">
      <cfset application.cartid = application.cartid + 1>
      <cfset session.cartid = application.cartid >
    </cflock>
  </cfif>

  <!--- End no cartid --->
<cftry>
  <cfquery datasource="gemssql" name="currentcart">
       SELECT itemid, optionid FROM buyingrecord WHERE cartid = #session.cartid#
     </cfquery>
<cfcatch type="any">
<Cfset currentcart.recordcount = 0 />..
</cfcatch>
</cftry>
  <cfif currentcart.recordcount gt 0>
    <!--- cartid found in buying record so update buyingrecord --->
    <cfloop query="currentcart" >

      <cfset cartmatch = 0>
<cftry>
      <cfloop  index="ja" from="1" to="#ArrayLen(session.cartitem)#">
        <!--- Check each item in buyingrecord with each item in the session cart --->
        <cfif currentcart.itemid eq session.cartitem[ja][1] and  currentcart.optionid eq session.cartitem[ja][5]>
          <cfset cartmatch = 1>
          <!--- If there is a match, update quantity --->
		          <cfif session.cartitem[ja][4] gt 0 >
		  								   	 <cfif testing eq 1><cfoutput>Cartitem updated in buyingrecord<br />
											              </cfoutput></cfif>
            <cfquery datasource="gemssql" name="updatecart">
                UPDATE buyingrecord
                from buyingrecord SET quantity = '#session.cartitem[ja][4]#',rate=#session.cartitem[ja][3]# <cfif session.mail neq "">, email='#session.mail#'</cfif>
                WHERE cartid='#session.cartid#' 
                AND itemid ='#session.cartitem[ja][1]#' 
			         AND optionid=#session.cartitem[ja][5]#
            </cfquery>
            <cfelse>
<cfif testing eq 1><cfoutput>Cartitem deleted in buyingrecord because quantity was 0<br />
            </cfoutput></cfif>
            <cfquery datasource="gemssql" name="deletecart">
              DELETE FROM buyingrecord WHERE cartid = '#session.cartid#' AND itemid = '#session.cartitem[ja][1]#' AND optionid = '#session.cartitem[ja][5]#'
             </cfquery>
          </cfif>
        </cfif>
      </cfloop>
       			  <cfcatch type="any">
		  </cfcatch>
		  </cftry>			
      <cfif cartmatch eq 0>
	  <cftry>
        <cfloop index="jb" from="1" to="#Arraylen(session.cartitem)#">
          <!--- buyingrecord item  was not found in session cart so delete it --->
			<cfif testing eq 1><cfoutput>Cartitem deleted in buyingrecord because it doesn't exist in cart<br />
			          </cfoutput></cfif>
          <cfquery datasource="gemssql" name="deletecart">
              DELETE FROM buyingrecord WHERE cartid = '#session.cartid#' AND itemid = '#session.cartitem[jb][1]#' AND optionid = '#session.cartitem[jb][5]#'
          </cfquery>
        </cfloop>  <cfcatch type="any">
		  </cfcatch>
		  </cftry>
      </cfif>
    </cfloop>
			  <cfquery datasource="gemssql" name="deletecart">
			              DELETE FROM buyingrecord WHERE cartid = '#session.cartid#' 
			          </cfquery>
      <cftry>
	    <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
		
	    
		      <cfif session.cartitem[jc][4] gt 0 >
			        <cfquery datasource="gemssql" name="updatecart">
			                    INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
			                    VALUES ('#session.mail#', '#session.cartitem[jc][1]#', '#session.cartitem[jc][4]#', '#session.cartid#', '#session.cartitem[jc][5]#', #session.cartitem[jc][3]# )
			            </cfquery>
				
		      </cfif>
		    </cfloop>  <cfcatch type="any">
		  </cfcatch>
		  </cftry>

    <cfelse>
			  <cfif incrementcartid is "yes">
					 <cfcookie name="cartid" expires="now" value="" >
  		   			   <cflock name="setcartid" type="exclusive" timeout="10">
			             	<cfset application.cartid = application.cartid + 1>
			             	<cfset session.cartid = application.cartid >
		 		   	   	</cflock>
				 	<cfset incrementcartid is "done">
			</cfif>
    <!--- cartid not already in  buyingrecord.  We can just add the session cart items to buyingrecord --->
		<cftry>
    <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
	
      <cfif session.cartitem[jc][4] gt 0 >
        <cfquery datasource="gemssql" name="updatecart">
                    INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
                    VALUES ('#session.mail#', '#session.cartitem[jc][1]#', '#session.cartitem[jc][4]#', '#session.cartid#', '#session.cartitem[jc][5]#', #session.cartitem[jc][3]# )
            </cfquery>
			<cfif testing eq 1><cfoutput>Cart item#session.cartitem[jc][1]#added<br />
			        </cfoutput></cfif>
      </cfif>
    </cfloop>  <cfcatch type="any">
		  </cfcatch>
		  </cftry>
  </cfif>
		
	  <cfquery datasource="gemssql" name="cartstatuscheck">
	      SELECT status FROM cartstatus WHERE cartid = '#session.cartid#'
	    </cfquery>
	  <cfif cartstatuscheck.recordcount eq 0>
			<cfif testing eq 1><cfoutput>Cartid not found in cartstatus, so add<br />
			    </cfoutput></cfif>
    <!--- cartstatus doesn't have a record for this particular cartid, so add it --->
	
		    <cfquery datasource="gemssql" name="cartstatusadd">
		          INSERT INTO cartstatus (cartid, status, paymode, cost, indate, buyer) 
		          VALUES ('#session.cartid#', 'set', 'null', '0', #now()#, '#session.mail#')
		      </cfquery>
    <cfelse>
		<cfif testing eq 1><cfoutput>Cartid  found in cartstatus<br />
		    </cfoutput></cfif>
	  </cfif>
</cfif>


<cfif session.cartid>
  <cfcookie name="cartid" expires="35" domain=".semiprecious.com" value=#session.cartid# >
</cfif>
<!--- end cart not empty check --->

<cfset addressset = 0>
<cfif session.mail contains "@" and session.mail contains "." and session.mail does not contain 'guest'>

<cfquery datasource="gemssql" name="purchaserinfo">
            SELECT * FROM memberinfo  WHERE email='#session.mail#' 
            </cfquery>
  <cfset addressset = 1>
  <cfelse>
  <cfif session.bulkbuyer.id contains "@" and session.bulkbuyer.id does not contain "guest">
<!---THIS CHANGED BY ANUP, BULKBUYER IS STILL IN MYSQL---> 
<cfquery datasource="sptm" name="purchaserinfo">
   SELECT firstname, lastname, address1, address2, city, state, country, zip FROM bulkbuyers
  WHERE email = '#session.bulkbuyer.id#'
</cfquery>
    <cfset addressset = 1>
 </cfif>
</cfif>
<CFSET grandTotal=0>
<cfset session.grandtotal = 0>
<CFSET subTotal=0>
<CFSET amounts=0>
<CFSET TotalQty=0>
<cfset emptyitems = 0>
  
	<cfif not isdefined("session.cartinfile")>
      <cfif session.bulkbuyer.id contains "@">
	        <cfset  session.cartinfile = session.bulkbuyer.id />
        <cfelseif  len(session.mail)>
	        <cfset session.cartinfile = session.mail />
        <cfelse>
	        <cfset session.cartinfile = datepart('d',now()) & datepart('m',now()) &  timeformat(now(),'HHmm') & randrange(10,50) & '.txt'>
        <!---	<cfif session.bulkbuyer.id is 0><cfset variables.cartinfile="guest@mail.com"></cfif>--->
      </cfif>
    </cfif>
    <cfset Variables.cartinfile = session.cartinfile>
    
<html>
<HEAD>
<TITLE>Jewelry Items selected on Semiprecious.com</TITLE>
<link rel="shortcut icon" href="/favicon.ico" />
<script language="JavaScript" type="text/javascript" src="/CFIDE/scripts/cfform.js"></script>
<cfif newitem neq "">
  <CFQUERY DATASOURCE="gemssql" NAME="stats">
						update nitish.itemstats set addToCart=addToCart+1 where itemid =#newitem#
	 </cfquery>
</cfif>
 

  <!-- Deluxe Menu -->
    <noscript><p><a href="http://deluxe-menu.com">Javascript Menu by Deluxe-Menu.com</a></p></noscript>
    <script type="text/javascript" src="newtopmenu.files/dmenu.js"></script>
    <!-- (c) 2009, by Deluxe-Menu.com -->

<style type="text/css">
<!--
input.btn {
	color:black;
	font-family:'trebuchet ms', helvetica, sans-serif;
	font-size:110%;
	font-weight:bold;
}
td.saleprice {
	color:maroon;
}
<cfif session.bulkbuyer.id neq ""> td.price {
color:maroon;
}
</cfif> .small {
 font: italic 9px "Times New Roman", Times, serif;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>

<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/imageswap.js"></script>
<cfif bought is "buy" and newitem neq "">
	<style media="screen"   type="text/css" >
<!--	 
<cfoutput>
##added_#newitem#_#form.optionid# 
{
	 background-color:##D9EDD9;
	 }
	 </cfoutput>

	 -->
	 </style>
	 <cfelse>
	 </cfif>
</HEAD>

<BODY BGCOLOR="white" leftmargin="0" topmargin='0'>
<div align="center">
  <CFINCLUDE TEMPLATE="/#session.country#/header.cfm">

<cfset layerpos = 242 + 65*arraylen(session.cartitem) />
<!--- Gift Message div --->
<div id="giftmessage" style="position:absolute; left:40px; top:<cfoutput>#layerpos#</cfoutput>px; width:343px; height:94px; z-index:3; visibility: hidden; background-color: #EEEE99; layer-background-color: #999933; border: 2px groove #666666;padding:2px;"> The message that you type here will be printed and sent along with the shipment of the gift. 
  Please keep the message sweet and short (250 characters). Thank you.
  <p onClick="MM_showHideLayers('giftmessage','','hide')" style="cursor:pointer">[CLOSE] </p>
</div>
<!--- End gift message div --->
<div id="looksethint" style="position:absolute; font-size:12px;left:200px; top:160px; width:560px; height:86px; z-index:3; visibility: hidden;  layer-background-color: #999933; border: 1px groove #666666;padding:2px;border-top:4px solid #666600;background-color:white;text-align:left;">
  <ul>
    <li><span class="lookinline">Click on  = (equal) sign to see some of the jewelry items  similar to this item.</span></li>
    <li><span class="setinline">Click on orange + (plus)  sign to  see some of the jewelry that can  make a set with this item.</span> </li>
  </ul>
  <span onMouseOver="MM_showHideLayers('looksethint','','hide')"><span   class="greenbutton">[Hide]</span> </span> </div>

<table id="container1" width="906px" cellspacing="0" cellpadding="0" border="0" style="padding:0 2px 0 4px">
<tr style="width:900px;" align="center">

<td valign="top" width="140px" align="left" ><!--- BEGIN LEFT SIDE STUFF --->

  <CFINCLUDE TEMPLATE="leftmenus.cfm">
  <!--- END LEFT SIDE STUFF --->
</td>
<td align="center" valign="top">
<div style="width:750px; text-align:center;" >
  <h3>
    <cf_steps step="3" />

  </h3>
 </div>
    		<cfif isDefined("FORM.arb")>
    		<p style="font-family:'trebuchet ms', helvetica, sans-serif; color:red; font-size:16px; text-align:center">THANK YOU, YOUR ORDER HAS BEEN SUCCESSFULLY PLACED!</P>
			</cfif>


<cfform action="" method="post" name="cartform">
  	

<cfif session.cartitem[1][1] is not 0>
<div  width="750px" style="width:740px;text-align:center;margin-top:10px;">

ITEMS REVIEW FOR CART ID: <font color=blue><cfoutput>#session.cartid#</cfoutput></font>
</div>
<TABLE bordercolor="#FFF" style="border:1px #fff solid;width:750px;" cellspacing="0" align="center"  >
<tr class="grayplacard" >

  <TH width="34%" colspan=2>Jewelry Items</TH  >

  <TH width="15%">Price</TH>
  <TH width="25%">Quantity</TH>
  <TH width="12%">Amount</TH>
    <TH width="20%" align="center"><cfif isdefined("url.country")>&nbsp;<cfelse>Remove <a href="/cartcontrol/cartmonitor.cfc?method=emptycart" onClick="javascript:return confirm('All items will be removed from the cart!');"><font color="#FF0000">All</font></a></cfif></TH>
<TH width="18%" >We Suggest</TH  ></tr>

		<cfif session.desc_flag>
			<cfif session.mail is "" > <!--- this code is reached everytime only for admin_email --->
      			<cfset session.desc_flag = 0 />
			</cfif>
		</cfif>
    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
      <cfset valueadd =0>
      <cfif session.cartitem[j][4] gt 0>
              <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	            SELECT newitem, cat, storage, subcat+ ' ' + cat as description,clustercount,status,storage,thumblink FROM Items WHERE   newitem = #session.cartitem[j][1]# 
                </CFQUERY>
        <cfif  isdefined("text")>
          <cfset text = text & ','  & session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
          <cfelse>
          <cfset text = session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
        </cfif>
        
         <cfoutput>
		 <tr  >
            <td class=""><img src=images/#qprice.cat#/thumb/#qprice.newitem#.jpg border=0 width=80></td>
			<TD   align='left'  ><span  class="listdescr"><b>Design ID:#session.cartitem[j][1]#</b><br />
              <cfif qprice.storage contains "IN-">
			  	<cfset expedited_possible = 0 />
               <cfelse>
                
                <b><font color=green>Quick Ship Possible</font></b><br />
              </cfif>
           
              #qprice.description#
              <cfif session.cartitem[j][5]>
                <cfquery datasource="gemssql" name="opts">
      		select description,  valueadd from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
                <cfif session.bulkbuyer.id NEQ "">
                  <cfif isnumeric(opts.valueadd)>
                    <cfset valueadd = opts.valueadd/2 >
                  </cfif>
                  <Cfset volumediscount = 1 />
                  <!---- volumediscount is given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
                  <cfelse>
                  <cfif isnumeric(opts.valueadd)>
                    <cfset valueadd = opts.valueadd>
                  </cfif>
                  <Cfset volumediscount = 1 />
                </cfif>
                <span class="optionsinline">[#opts.description#]</span>
              </cfif>
              </span>
              <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#">
            </TD>
			
            <cfset TotalQty=session.cartitem[j][4]+TotalQty>
    
	        <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#">
            <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#">
          	              <td  class="rowb" align="center"><cfif session.cartitem[j][4] GT 2>
                <cfset valuewithoption= volumediscount*(session.cartitem[j][3] + valueadd*1)>
                <cfelse>
                <cfset valuewithoption=session.cartitem[j][3]*1 + valueadd*1>
              </cfif>
              <cfset amounts=#evaluate(valuewithoption*session.cartitem[j][4])#>
              <cfif qprice.status is 3>
                <cfset saletotal = saletotal + amounts >
                <span class="saleprice">
                <cfelse>
                <span                 class="price">
              </cfif>
              #format(valuewithoption)# </span>
              <input type="hidden" name="price#j#" Value="#DecimalFormat(valuewithoption)#">
            </td>
            <td  class="rowb" align="center">  <span id="added_#session.cartitem[j][1]#_#session.cartitem[j][5]#">#session.cartitem[j][4]#&nbsp;&nbsp;&nbsp;&nbsp;
			<font size="2"><a href='jewelry_item.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#&existqty=#session.cartitem[j][4]#&optionid=#session.cartitem[j][5]#'>Edit Qty</a></font></span></td>
            <td  class="rowb">#format(amounts)#
              <input type="hidden" name="amount#j#" Value="#amounts#">
            </td>
            <td  class="rowb"><cfif isdefined("url.country")>&nbsp;<cfelse><a href='cart.cfm?newQty=0&newitem=#j#&optionid=#session.cartitem[j][5]#' ><font color="##CC0000">Remove</font></a>
			</cfif>
			</td><td  class="rowb" align="center" valign="middle">
					<cfswitch expression="#qprice.clustercount#">
					<cfcase value="1">
					<span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look" >&nbsp;=&nbsp;</a></span>
					</cfcase>
					<cfcase value="2"><span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">&nbsp;+&nbsp;</a></span></cfcase>
					<cfcase value="3"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look">&nbsp;=&nbsp;</a></span><hr />

<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set" >&nbsp;+&nbsp;</a></span></cfcase><cfdefaultcase >&nbsp;</cfdefaultcase></cfswitch>
					</td>

			</tr>
          </cfoutput> 
    	    <cfset subTotal= amounts + subTotal>
				<cfset Session.GrandTotal= subTotal>
        <cfelse>
        <!--- since we are now adding values with 0 value we dont do this  <cfset emptyitems = emptyitems + 1> --->
        <cfoutput>
          <input type="hidden" name="amount#j#" Value="0">
          <input type="hidden" name="price#j#" Value="0">
          <input type="hidden" name="quantity#j#" Value="0">
        </cfoutput>
      </cfif>
    </CFLOOP>
<cfset session.totalqty = Variables.totalqty />
    
	<!--- out of above loop we have presented the cart and totaled up the qty in TotalQty and value in subtotal --->
    <cfoutput>
      <cfif quantity GT invent >
        <tr>
          <td class="error1" colspan="7">For item #newitem# only #invent# in stock. #evaluate(quantity - invent)# may ship in 4 weeks or you will be refunded. </td>
        </tr>
      </cfif>
    <cfif totalQty is 0>
        <tr>
          <td colspan="7"><h4>Your shopping cart is empty....</h4>
            <span class="row2">You can use an earlier cart ID (cart number) to refill the cart. Click <a href="/fillcart.cfm"><strong>here</strong></a></span>
  
            <hr />
            <span class="row2">If you are returning with a cartid , click <a href="/fillcart.cfm"><strong>here</strong></a></span> <br>
            Note: In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them OR call us at #Application.tollfree# with your                   item numbers. Cart does not work without cookies<br>
            If you think you have cookies ON and empty cart is incorrect please click <a href="/contactus.cfm" target="_self">here</a> and inform us of this error. </td>

        </tr>

        </table>
        
        <cfinclude template="/mainfooter.cfm">
		</td></tr></table>
		</div>
		</body>
		</html>
    
    	<cfabort />
	</cfif>
    
	</cfoutput>
	
    
	<!---
			<cffile action="write" nameconflict="overwrite" file="d:\inetpub\semiprecious\carts\#Variables.cartinfile#"   addnewline="no" output="#text#"  />
			<cfcookie 
   name = "cartinfile"
   value = "#Variables.cartinfile#"
   expires = "20"
   secure = "No" />
   --->
    <!--- <cfif isdefined("cookie.cart")>
<cfoutput>Set this cookei #cookie.cart#.</cfoutput>
</cfif> --->
    
<cfif session.country is "india">
      <tr bordercolor="#FFFFFF">
          <td colspan="3"   align="center"><a href="gemstone_jewelry_gallery.cfm?<cfoutput>#session.filter#</cfoutput>">Look around for more stuff</a></td>
          <td colspan="3" bgcolor="#FFFFFF" align="center"><a href="indiaconfirmation.cfm"><font size=5>Select Payment Mode</font></a></td>
        </tr></table>
        <cfelse>
      <tr   >
          <td colspan="6" height="2"  align="center" style="border-bottom:0px dashed #999;padding-top:6px;"  ><!---
        Your confidence is important to us. Any concern?<strong> Call us now: <cfoutput>#Application.tollfree#</cfoutput> </strong>   --->
            <!---       <cfif  not (form.style + form.set)>
        Your confidence is important to us. Any concern?<strong> Call us now:</strong>1-800-620-9849 
<cfelse>
        <div class="biggreen"><cfoutput>For Item #newitem# See Items : 
            <cfif form.style>
              <span  class="lookinline"><a href="listcluster.cfm?itemid=#form.newitem#&type=look">That 
              Look Similar</a></span>&nbsp;&nbsp;
            </cfif>
            <cfif form.set>
              <span  class="setinline"><a href="listcluster.cfm?itemid=#form.newitem#&type=set">That 
              Make a Set</a></span>
            </cfif>
          </cfoutput></div>
      </cfif> --->
<!---&nbsp;&nbsp;
<div class=""><a href="/daily_deals/daily_deals.cfm"><img  border="0" align="absbottom" title="listing some items that we are selling on near cost price to delight our customers" src="http://www.semiprecious.in/daily_deals/jewelrydeals.gif" alt="semiprecious gemstone jewelry on sale" /></a>
<a class="gray_url"  onClick="javascript:goProcess('Click here to Buy More Items')">More Shopping</a>&nbsp;
<cfif not len(session.mail)><a class="gray_url" href="/apply.cfm">Sign up for discounts</a><cfelse></cfif>&nbsp;
	  		<cfif application.live_support > 

			<div style="display:inline;border:0px ridge #0A0 ;margin-top:4px;padding:2px 4px" align=center>
   <a class="login_link" onclick="open_live_support()" href="javascript://"><img style="text-decoration:none;" src="/images/callus.png" height="20px" valign="center" border=0 />&nbsp;<span style="position:relative;bottom:4px">Online Help</span></a>
</div></cfif>

</div>--->
           </td>
        </tr>
      </table>
	  
	  
      <table align="center"  border="0"  cellspacing="0" bordercolor="#bbbb99" width="752px" style="border:0px black ridge;">
      <cfif isdefined("url.country") >
  <cffile action="read" file="d:\inetpub\semiprecious\includes\countries_drop_down.htm" variable="countriestxt" />
  <cfset countriesxml = xmlParse(countriestxt) />
 <!--- <cfdump var="#countriesxml#" />--->

  <cfset country_name = XmlSearch(countriesxml, '/child::select/option[@value="#url.country#"]')[1].xmlText />

  

	     <cfif len(session.bulkbuyer.id) or cgi.server_name contains "wholesale">
	 				<cfif url.country is "USA"  >
    					 <cfset shipping=3.99>
				  	<cfelse>
						 <cfset shipping=12.99>
					</cfif>
		<cfelse>
			<cfif url.country is "USA" or url.country is "AU" or url.country is "NZ" or url.country is "GB">
    			<cfif subtotal  GTE application.retail_free_shipping>
        			<cfset shipping=0>
				<cfelse>
					<cfset shipping = 2.99 />
      			</cfif>
	  	      <CFELSE>
			  	<cfif subtotal  GTE application.retail_free_shipping>
        			<cfset shipping=9.99>
				<cfelse>
				
					<cfset shipping = 14.99 />
      			</cfif>
			</CFIF>  
		</cfif>		
			
			<cfset GrandTotal= shipping + subTotal>
			<cfset Session.GrandTotal= shipping + subTotal>
    		
	          <tr>
                <!---  <td align="center"><input name="button" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"> 
              </td> --->
                <td  align="center" height="150" width="300" nowrap>
                <!--- slowing down the page tremendously
				<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script>
				--->
				</td>
                <td  align="right" nowrap=true>
			      
			
            	  
				 <b>Total not including shipping<a name="checkout">:</a> </b>  
				 <input class="inputtext" name="GrandTotals" type="hidden"   value="<cfoutput>#format(evaluate(subTotal))#</cfoutput>"><cfoutput>#format(evaluate(subTotal))#</cfoutput>
				 	<cfoutput>
				<br />Standard Shipping: -- <input type="hidden" size="4" name="shipping"    id="shipping" value="#shipping#">
                    	
                  	<cfif shipping>#format(shipping)#<cfelse><span class="error1">Free!</span></cfif> 
					
					</cfoutput>
				 <cfset session.grandtotal = subTotal + shipping /><!--- this is used in header for display--->
                <br />
				  <cfif  session.bulkbuyer.id eq "" and not (cgi.server_name contains "wholesale")>
				   		<cfoutput>Shipping Discount for Orders over #format(application.retail_free_shipping)# [Free within US].<br /></b></cfoutput> 
						<cfif subtotal LT application.arb_amount> 
							<span class="error1">Pay in Easy instalments for<br />invoice more than <cfoutput>#format(application.arb_amount)#</cfoutput></span>
						</cfif>
		   		</cfif>
				</td>
              </tr>
              <!--- international shipping is handled by specialhandling so this is set to 0--->
            <input type="hidden" size='3' name="discount" value="0">
            <!---    when removing delayed shipping above hidden variable is to be shown and toggle in other situation ---->
            <cfif isdefined("session.giftid") and session.giftamt GT 0>
              <tr>
                <td  align="right" valign="middle"  >Gift 
                  Amt (#):</td>
                <td align="right" valign="middle"> <cfoutput>#format(session.giftamt)#</cfoutput>.00 </td>
                <input type="hidden" value="gift" name="couponcode">
              </tr>
           </cfif>
		<!---      <TR>
                <TD colspan="2"> <img src="/images/continueshopping.gif" style="cursor:pointer" onClick="javascript:goProcess('buy more')" > &nbsp;  &nbsp;<b><font color=black>OR START CHECKOUT BELOW</font></b>
				</TD>
              
              </TR> --->
			      <TR>
                <TD colspan="2"  ><span style="background-color: rgb(238, 248, 238);">Shipping to Country: <cfoutput><span class="error1">#country_name#</span>.</span> <a href="/#session.country#cart.cfm" class="side_link">Click here to change the country of dispatch</a></cfoutput>.</TD>
              
              </TR>
         <cfif len(session.bulkbuyer.id)>
		      <input type="hidden" value="regwsale" name="couponcode">
              <input type="hidden" name="GiftWrap" value="0.00" />
              <input type="hidden" name="giftmsg" value="na" />
              <input type="hidden"  name="texas" value="0" />
              
                <cfoutput>
         <input style="" name="Shipto" value="<cfif addressset eq 1>#purchaserinfo.firstname#</cfif>" type="hidden" >
				  <input  name="Street1" value="<cfif addressset eq 1>#purchaserinfo.address1#</cfif>" type="hidden" >
                <input name="Street2" value="<cfif addressset eq 1>#purchaserinfo.address2#</cfif>" type="hidden" />
				<input name="City" value="<cfif addressset eq 1>#purchaserinfo.city#</cfif>" type="hidden" />
       <input name="State" value="<cfif addressset eq 1>#purchaserinfo.state#</cfif>" type="hidden"  >

               <input name="zip" value="<cfif addressset eq 1>#purchaserinfo.zip#</cfif>" type="hidden" />
                
				  <tr>
                  <td  align="right">Country:</td>
                  <td>#country_name#<input  name="country" value="#country_name#" type="hidden" /></td>
                </tr>
			</cfoutput>
			  <cfif session.mail contains "@" and session.mail does not contain 'guest'>
				  <input type="hidden" name="email" value="<cfoutput>#session.mail#</cfoutput>" size="40">
			  <cfelse>
            	  <tr>
                	<td  align="right"><font color="red">*</font>Email: </td>
                	<td  align="left"><cfinput required="true" message="Please provide a valid email id" type="text" name="email" value="" size="40"></td>
             	 </tr>
              </cfif>
				 <tr>
                <td  align="right"><font color="red">*</font>Phone No.: </td>
                <td  align="left"><cfif addressset >
				<cfinput  name="phonenumber" value="#purchaserinfo.phonenumber#" size="30" required="yes" message="Please provide a valid phone number">
				<cfelse>
				<cfinput  name="phonenumber" value="" size="30" required="yes"  message="Please provide a valid phone number">
				
				</cfif>
				</td>
              </tr>
          <tr>
                <td  align="right"> Shipping Upgrade: 
				 </td>
				 <cfset hand_msg = "" />
                 <td  align="left">
                 <select name="SpecialHandling" onChange="javascript:grandtotal(this.form)">
                  
                      <option value="0.00" selected="true">Standard (USPS with tracking )+ $0.00</option>
						  <cfif expedited_possible  >
						   <cfif url.country  is "USA" or url.country  is "AU" or url.country  is "GB">
					    		<cfset hand_msg ="[Standard: Shipped in 24 to 48 hours and will reach USA mainland in 3 to 4 days]" />	
					  			<option value="1">Priority (2-3 Days Delivery in Mainland) + $1.00</option>
								<option value="9.9">Express (1-2 Days Delivery in Mainland) + $9.9</option>
							<cfelse>
								<cfset hand_msg ="[Standard: Shipped in 24 to 48 hours and will reach USA mainland in 10 to 14 days]" />	
								<option value="12">USPS Express (7 to 12 Days Delivery) + $12.00</option>
							</cfif>
					  	<cfelse>
                			<cfif url.country  is "USA" or url.country  is "AU" or url.country  is "GB">
					      		<cfset hand_msg ="[Standard: Shipped in 6 to 8 days from Austin, Texas and will reach  you in 8 to 12 days]" />	
						  			<option value="42">UPS (5-6 Days Delivery) + $42.00</option>
								<cfelse>
					      			<cfset hand_msg ="[Standard: Shipped in 6 to 8 days from Austin, Texas and will reach  you in 10 to 14 days]" />	
									<option value="32">UPS (5-6 Days Delivery) + $32.00</option>
								</cfif>
					  </cfif>
                  
                  </select>
				  <cfoutput><br /><span style="color:blue">#hand_msg#</span></cfoutput>
                  <cfinclude template=vacation.inc>
                </td>
              </tr>
    
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <cfelse><!--- STARTING FORM FOR RETAIL --->
              <!---			<cfif isdefined("url.texaserror")>
			  <tr class="error" ><cfelse>			<tr></cfif>
              <td align="right">Buying from Texas? (<span class="error">*</span>):</td>
              <td align="right">We will pay Sales Tax on your behalf.
			   <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
			  
			  </td></tr>--->
              <input type="hidden"  name="texas" value="0" />
              
              <tr>
                <td>&nbsp;</td>
              </tr>
              <cfoutput>
               <input type="hidden" name="Shipto" value="<cfif addressset eq 1>#purchaserinfo.firstname#</cfif>" size="40">
               <input type="hidden" name="Street1" value="<cfif addressset eq 1>#purchaserinfo.address1#</cfif>" size="40">
               <input type="hidden" name="Street2" value="<cfif addressset eq 1>#purchaserinfo.address2#</cfif>" size="40">
               <input  type="hidden" name="City" value="<cfif addressset eq 1>#purchaserinfo.city#</cfif>" size="15">
               <input type="hidden" name="State" value="<cfif addressset eq 1>#purchaserinfo.state#</cfif>" size="15">
               <input type=hidden name="zip" value="<cfif addressset eq 1>#purchaserinfo.zip#</cfif>" size="15">
                <input type="hidden" name="country" value="#country_name#" size="15">
               
              </cfoutput>
			  <cfif session.mail contains "@">
				  <input type="hidden" name="email" value="<cfoutput>#session.mail#</cfoutput>" size="40">
			  <cfelse>
              <tr>
           	    <td align="right">Email:  </td>
                
					<td  align="left">
					<cfif url.country neq "USA">
              				<cfinput required="true" message="Please provide a valid email id."  type="text" name="email" value="" size="40">
						<cfelse>
         					<cfinput required="false"   type="text" name="email" value="" size="40">
		  			</cfif>
							</td>
              	</tr>
              </cfif>
			  <tr>
                <td  align="right">Phone No.:  </td>
                <td  align="left">
              		<cfif url.country neq "USA">
						<cfif addressset eq 1>
								<cfinput required="true" message="Please provide a valid phone no."   name="phonenumber" value="#purchaserinfo.phonenumber#" size="30">
							<cfelse>
								<cfinput required="true" message="Please provide a valid phone no."   name="phonenumber"  size="30">
							
						</cfif>
					<cfelse>
							
							<cfif addressset eq 1>
								<cfinput required="false" message="Please provide a valid phone no."  name="phonenumber" value="#purchaserinfo.phonenumber#" size="30">
							<cfelse>
								<cfinput required="false" message="Please provide a valid phone no."  name="phonenumber" value="" size="30">
							</cfif>
					</cfif>
							</td>
              </tr>
             
              <tr>
                <td  align="right"> Shipping Upgrade: <br />
				 </td>
                <td  align="left">
                             <select name="SpecialHandling" onChange="javascript:grandtotal(this.form)">
                  
                      <option value="0.00" selected="true">Standard (USPS with tracking )+ $0.00</option>
						  <cfif expedited_possible  >
							 <cfif url.country  is "USA" or url.country  is "AU" or url.country  is "GB">
					    		<cfset hand_msg ="[Standard: Shipped in 24 to 48 hours and will reach USA mainland in 2 to 4 days]" />	
					  				<option value="1">Priority (2-3 Days Delivery in Mainland) + $1.00</option>
									<option value="9.9">Express (4 Days Delivery) + $9.9</option>
							<cfelse>
								<cfset hand_msg ="[Standard: Shipped in 24 to 48 hours and will reach USA mainland in 2 to 3 Weeks]" />	
								<option value="12.00">USPS Express (7 to 10 Days Delivery) + $12.00</option>
							</cfif>
					  	<cfelse>
                		
							<cfif url.country  is "USA" or url.country  is "AU" or url.country  is "GB">
					      		<cfset hand_msg ="[Standard: Shipped in 6 to 8 days from Austin, Texas and will reach  you in 9 to 12 days]" />	
						  			<option value="42.00">UPS (5-6 Days Delivery) + $42.00</option>
								<cfelse>
					      			<cfset hand_msg ="[Standard: Shipped in 6 to 8 days from Austin, Texas and will reach  you in 2 to 3 Weeks]" />	
									<option value="32.00">UPS (5-6 Days Delivery) + $32.00</option>
								</cfif>
					  </cfif>
                  
                  </select>
				  <cfoutput><span style="color:blue">#hand_msg#</span></cfoutput>
      <cfinclude template=vacation.inc>
                </td>
              </tr>
			  <cfif not len(session.bulkbuyer.id)>
              <tr>
                <td  align='right' nowrap><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="22" style="display:inline;" />&nbsp;&nbsp;<font color="#000000">Gift Wrap</font>: </td>
                <td align="left"  ><select name="GiftWrap" onclick="javascript:grandtotal(this.form)">
                    <option value="0.00" selected>No Gift Bag</option>
                    <option value="1.00" >Red Velvet Pouch: $1.00</option>
                  </select>
                </td>
              </tr>
              <tr id="giftmsg">
                <td align="right"> Message With Gift <span id="j"  style="text-decoration:underline" ><a onClick="MM_showHideLayers('giftmessage','','show')" style="cursor:pointer">[?]</a></span>:</td>
                <td align="left" nowrap ><input type="text" name="giftmsg"  onClick="javascript:this.value='';return;" value="" size="75" maxlength="245" />
                </td>
              </tr></cfif>
              <cfif len(session.mail) and session.mail contains "@">
                <tr>
                  <td align="right" style="color:red"> Loyalty Discount<a href="viewinvitecredits.cfm" alt="friends invited for jewelry site">[?]: </a></td>
                  <td align="left"><font color="#CC0000"> 
								  <cftry>
				   <cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q">
				 	  <cfinvokeargument name="mail" value="#session.mail#" />
				   </cfinvoke>
				<cfcatch type="any">
				                <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Could not reverse " server="mail23.webcontrolcenter.com" type="html">
				  #cfcatch.detail#, #cfcatch.message# for #session.mail#
				  </cfmail>
				</cfcatch>
				</cftry>
                    <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="newsubtotal" >
                    <cfinvokeargument name="amounttopay" value="#subtotal#">
                    <cfinvokeargument name="saleitemamount" value="#saletotal#">
                    <cfinvokeargument name="finalize" value="0">
                    <!--- this is basically always 0 but comes into play in confirmation page --->
                    </cfinvoke>
                    </font> (Maximum discount is 20% of current order value)</td>
                </tr>
			 <cfset loyaltycredit = subtotal - newsubtotal />
			  <cfset subtotal = newsubtotal />
			  <cfset Session.grandtotal = subtotal + shipping />
			  
			  </cfif>
			  
       
            <tr>
              <!--- Authorize.net logo --->
              <td  align="right" style="color:orange" >
              
                      <!---<td align=center><a href="http://www.centraltx.bbb.org/commonreport.html?bid=90026075"><img src="images/bblogo.gif"></a></td>--->
            	<!---	  
<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script>
--->
		  Coupon:</td><td> <input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18"><br />	    
</td>
      </tr>
      <tr>
        <td align="center" colspan="2">
                      </td></tr>
            <!---   <tr bgcolor="#FFFFFF"> 
            <td align=right>Note to shippers: (optional)</td><td align='right'>  <input type="text" name="note" size=80 maxlength="245" /></td>
          </tr>--->
           
            <tr>
              <td colspan=2></td>
            </tr>
            <!---
	  <tr bgcolor="#FFFFFF"> <td colspan="2" align="center">
 <input name="button" type="button" class="greenbutton"  onClick="javascript:goProcess('Save Cart')" value='Save Cart for Later'> 
</td>
          </tr>--->
            <!---   <tr> 
            <td colspan="2"><ul>
                <li><strong>*</strong>: Discount will be applied when you finalize 
                  your cart at checkout but before payment.</li>
                <li><strong>#</strong>: Gift Certificate Amount and basic shipping 
                  will be reduced from your amount at checkout but before payment.</li>
              </ul></td>
          </tr>
         --->
	 </cfif><!--- end of wholesale and retail section --->
	    <cfoutput>
			 
			<tr><td align='center' valign="middle" colspan="2">
			  <input type="hidden"  name="loyaltycredit" value="#decimalformat(loyaltycredit)#">
             
	   <input type="hidden"  name="subTotal" value="#decimalformat(subTotal)#"> </cfoutput>
              <!--- End Authorize.net logo --->
			
              <!---  <input name="couponcode" type="hidden" class="inputtext" value="" size="12" maxlength="18"> --->
              <b><font color="#B00000">Grand Total</font> :</b> 
                <input class="inputtext" name="GrandTotal" type="text"  <CFIF SESSION.MAIL NEQ application.admin_email>onFocus="javascript:this.blur()" </CFIF> value="<cfoutput>#format(evaluate(subTotal + shipping))#</cfoutput>" size="6" maxlength="9">
                <cfset session.grandtotal = subTotal + shipping />
                <font size=1>(Including Shipping & Tax)</font>             <input type="hidden" name="j" value="<cfoutput>#evaluate(ArrayLen(session.cartitem) - emptyitems)#</cfoutput>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;<br><span style="background-color:#ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge #9BA" onClick="javascript:goProcess('Proceed to Checkout')" >Select Payment Method</span> </td>
            </tr>
		 
<cfelse>
</form>

		 <tr><td colspan="2"  align="right"><br />Total not including shipping<a name="checkout">:</a>   
				 <b><cfoutput>#format(evaluate(subTotal))#</b>
				
				 <ul style="width:400px;text-align:left;">
				 	 <cfif not len(session.bulkbuyer.id)>
					 <li>Shipping Discounts for billing over #format(application.retail_free_shipping)#</li>
					 <li>Billing Over #format(application.arb_amount)# can avail instalment payments</li>
					 <Cfelse>
					 <li><span style="position:relative;"><img src="/images/que.gif"   onClick="document.getElementById('que_answer').innerHTML='';" onMouseOver="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content').innerHTML;" /><span id="que_answer" style="position:absolute;z-index:3;top:10px;left:40px;"></span>Verified Buyers with billing Over #format(application.bulkbuyer.arb_minamt)# can avail instalment payments</li>
					 <cfif isdefined("url.resendmail") ><cfif len(url.resendmail)><li class="error1">Your Verification Mail Sent</li><cfelse>
					 <li class="error1">No Mail Sent. You need to first <a href="wholesale_register.cfm?beaded=1" class="side_link">apply for wholesale partnership</a></li></cfif></cfif>
					 
					 </cfif>	 
				 </ul> <div id="easy_content" style="display:none;">
				 <div style="background-image:Url('/images/help_resources_tl.gif');width:400px;">
					 <div class="detailrow">
		<br /><span class="login_link">Verified wholesale buyers</span>  &amp; partners 
		<div style="background-color:white;border:2px ##E6Cf84 solid;border-top:0px;padding:2px;"> can avail a lower minimum purchase of  #format(application.bulkbuyer.minamt)#. Above #format(application.bulkbuyer.arb_minamt)# you can also avail 3 easy payment plan.
		 To qualify as our verified partner you need to verify your registration. Please do it now [<a href="wholesale_register.cfm" class="side_link">Register</a>].<br /> If you have already registered  
		 <cfif session.bulkbuyer.id contains 'guest'> <cfelse>and not received the verification then click <a href="cart.cfm?resendmail=#urlencodedformat(session.bulkbuyer.id)#" >here</a></cfif>, you should soon recieve the verification number and URL.
		 <br />If you still do not recieve the verification email or a query from our team please <span class="error1">do check your spam folder</span> and then you can write in to us at <strong>cs@semiprecious.com</strong>. <br ><div style="text-align:left;margin-left:2px">-Team Semiprecious.com-</div>
		 </div>
		 </div>
		</div>
		 
			
				 </cfoutput></td>
				 </tr>
				 
		   
 <TR>
                <TD colspan="1" valign="top"> <img src="/images/continueshopping.gif" style="cursor:pointer" height="30px" onClick="javascript:goProcess('buy more')" > &nbsp;  &nbsp;
				</td>
				<td> 
		
				<cfif (not len(session.bulkbuyer.id) ) or (len(session.bulkbuyer.id) and  (subtotal GTE session.bulkbuyer.minamt))><b><font color=black>OR START CHECKOUT BELOW</font></b><br />
				</TD>
              
              </TR>
			  <tr><td colspan="2" align="center">
				 <form action="/cart.cfm?#checkout" method="get" ><span class="saleprice">Please select country of shipment: <cfinclude template="/includes/countries_drop_down.htm" />&nbsp;
		and then click on 'Start Check Out'  button  <input type="submit" name="submit" style="border:1px solid black;background-color:#ACB;display:inline;" value="Start Check Out &rarr;" /></span> 
		  </form> 
		 <cfelse>
		 <span class="error1">[</span><span class="error2">Please Shop for Minimum <cfoutput>#format(session.bulkbuyer.minamt)#</cfoutput></span><span class="error1">]</span>
<cfoutput>	<br />	 <span class="rowb"> Shop for #format(500)# or more to earn 5% discount [Worth nearly #format(50)# when you spend #format(999)#],</span><br />
		 <span class="rowb"> Shop for #format(1000)# or more to earn 9% discount[Worth nearly #format(180)# when you spend #format(1999)#]</span>
		 <cfif arraylen(session.cartitem) LTE 2><br /><br /> <div class="detailrow" style="border:2px ##E6Cf84 solid;"><span class="login_link">All our verified wholesale buyers</span>  &amp; partners can avail a lower minimum purchase of  #format(application.bulkbuyer.minamt)#. Above #format(application.bulkbuyer.arb_minamt)# you can also avail 3 instalment payment plan.<br />
		 To qualify as our verified partner you need to verify your registration. Please do it now [<a href="wholesale_register.cfm" class="side_link">Register</a>]. If you have already registered and not received the verification 
		 <cfif session.bulkbuyer.id contains 'guest'> please fill in your email id here <form action="cart.cfm"><input type="text" name="resendmail" size="30"><input style="background-color:##ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge ##9BA" type="submit" value="Request Verification Email"></form><cfelse><form action="cart.cfm"><input type="hidden" name="resendmail" value="#session.bulkbuyer.id#" /><input type="submit" style="background-color:##ACB;display:inline;cursor:pointer;padding:2px;border:2px ridge ##9BA" value="Resend Verification Email"></form></cfif> We will resend you the verification number and URL.
		 If you still do not recieve the verification email please do check your spam folder or you can write in to us at cs@semiprecious.com. <br ><div style="text-align:left;margin-left:2px">-Team Semiprecious.com-</div>
		 </div>
		 </cfif>
		  </cfoutput>
		 </cfif>
		 &nbsp;</td></tr>
		 </cfif>
          </table></td>
      </tr>
    
    </TABLE>
    </td>
    </tr>
   <cfoutput >
      
	  <cfif not totalqty >
        <tr>
          <td colspan="6" class="details"> No Item Bought. Click <a href="index.cfm" class="unnamed1" alt="start jewelry shopping">Here</a> to Start Shopping.
            <hr />
            <cfif isdefined("session.cartinfile")>
              <cftry>
                <cfcookie 
           name = "cartinfile"
           expires = "now"        >
                <cffile action="delete"  file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
                <cfcatch type="any">
                  You can use the product categories on top navigator to make a specific choice.<br>
                </cfcatch>
              </cftry>
              <cfcookie 
   name = "cartinfile"
   expires = "now" />
            </cfif>
            <br />
            In case your browser has been set not to accept cookies, to order without           cookies, email us item numbers you want and <br>
            we will send you a secure web link to pay for them OR call us at #Application.tollfree# with your item numbers. Cart does not work 	without cookies<br>
            If you think you have cookies ON and empty cart is incorrect please           click <a href="contactus.cfm" target="_self">here</a> and inform us 
            of this error.<br />
            <br />
            <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> . 
			</td>
        </tr>
      </cfif>
      <!---         <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
        <input type="hidden" name="newearned" value="#getcredit1.newearned#"> --->
    </cfoutput>
  
  	</cfif>
  <cfelse>

  <span style="display:block;backgroundColor:yellow;width:400px;margin-top:10px;padding:10px;border:2px red groove;text-align:center;vertical-align:middle;color:#666600;font-size:12px;">Your Cart is empty. </span>
  
  <hr>
  <span class="row2">You can use an earlier cart ID (cart number) to refill the cart. Click <a href="/fillcart.cfm"><strong>here</strong></a></span>
  <br>
  In case your browser has been set not to accept cookies and you wish to order without cookies, email us item numbers you want and 
  we will send you a secure web link to pay for them OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your item numbers. Cart does not work without cookies.<br>
  If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error. <br>
  <br>
  <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm">here</a></span>
</cfif>
</tr></td></table>
</cfform>
<cfinclude template="/mainfooter.cfm">
<span style="font-color:white;color:white;">......</span>

</div>
</BODY>
<footer>


<script LANGUAGE=JAVASCRIPT>


<!--
function format(expr, decplaces){
var str="" + Math.round (eval(expr) * Math.pow(10,decplaces));
while(str.length <=decplaces){
str= "0" + str}
var decpoint= str.length - decplaces
return str.substring(0,decpoint) + "." + str.substring(decpoint,str.length);}
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menub ar=no,scrollbar=no,resizable=no,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
var texas = 1;
<cfif session.bulkbuyer.id NEQ "">
texas = 1 ;
</cfif>
function texaschecked() {
texas = 1;
return ;
}
<!--
var BrowserDetect = {
	init: function () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.userAgent,
			subString: "Chrome",
			identity: "Chrome"
		},
		{ 	string: navigator.userAgent,
			subString: "OmniWeb",
			versionSearch: "OmniWeb/",
			identity: "OmniWeb"
		},
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari",
			versionSearch: "Version"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.vendor,
			subString: "iCab",
			identity: "iCab"
		},
		{
			string: navigator.vendor,
			subString: "KDE",
			identity: "Konqueror"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{
			string: navigator.vendor,
			subString: "Camino",
			identity: "Camino"
		},
		{		// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 		// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			   string: navigator.userAgent,
			   subString: "iPhone",
			   identity: "iPhone/iPod"
	    },
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};

// -->

function goProcess(inString){

/****************************************Start of form validation***********************************************/
// Author		:	Arun
// Created By	:	AGC India
// Created Date	:	20-Jul-2009
// Copyright	:	Semiprecious.com
/**************************************************************************************************************/
if(inString=='Proceed to Checkout')
{
	<cfif cgi.server_name contains 'wholesale'>
    		  self.document.cartform.action="http://wholesale.semiprecious.com/confirmation.cfm";
	<cfelse>
			BrowserDetect.init();
		if ( BrowserDetect.browser == "explorer"  || BrowserDetect.browser == "Explorer")
					  self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm#grand_total";
				  else
					  self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm#grand_total" ;
	</cfif>
//alert(1);
try {if (!_CF_checkcartform(self.document.cartform)) return false;} catch(e){}
self.document.cartform.submit();
		return ;

	}
/*

	if  (!_CF_hasValue(cartform.Shipto, "TEXT",true))
	{
		//Validation for 'Ship To' field
		if  (!_CF_onError(cartform, cartform.Shipto, cartform.Shipto.value, "Please enter value for 'Ship To'."))
		{ 
			
			alert("Please enter value for 'Ship To'.");
			cartform.Shipto.focus();
			return false;
		}
	}

	//Validation for 'Address Line1' field
	if  (!_CF_hasValue(cartform.Street1, "TEXT" ,true))
	{
		if  (!_CF_onError(cartform, cartform.Street1, cartform.Street1.value, "Please enter value for 'Address Line1'."))
		{
			alert("Please enter value for 'Address Line1'.");
			cartform.Street1.focus();
			return false;
		}
	}

	//Validation for 'City' field
	if  (!_CF_hasValue(cartform.City, "TEXT" ,true))
	{
		if  (!_CF_onError(cartform, cartform.City, cartform.City.value, "Please enter value for 'City'."))
		{
			alert("Please enter value for 'City'.");
			cartform.City.focus();
			return false;
		}
	}

	//Validation for 'Country' field
	if  (!_CF_hasValue(cartform.country, "TEXT" ,true))
	{
		if  (!_CF_onError(cartform, cartform.country, cartform.country.value, "Please enter value for 'Country'."))
		{
			alert("Please enter value for 'Country'.");
			cartform.country.focus();
			return false;
		}
	}


*/
/****************************************End of form validation*

/****************************************End of form validation***********************************************/


	texas = 1
	
		if(inString=='Save Cart'){
			<cfif cgi.server_name contains 'wholesale'>
						self.document.cartform.action="http://wholesale.semiprecious.com/confirmation.cfm?save=1";
			<cfelse>
					self.document.cartform.action="http://www.semiprecious.com/confirmation.cfm?save=1";
			</cfif>

			self.document.cartform.submit();
				return;
	}
	if(inString=='buy more'){
<cfif session.gallery contains 'gemstone.'>
	<cfoutput>location.href='/gemstone.cfm?#session.filter#';</cfoutput>
<cfelseif session.gallery contains 'angela'>
	<cfoutput>location.href='/#session.gallery#?#session.filter#';</cfoutput>
<cfelse>
	<cfoutput>location.href='/gemstone_jewelry_gallery.cfm?#session.filter#';</cfoutput>
</cfif>
	return;
	/* 
	self.document.cartform.submit();
	return;
	*/
	}
	if(inString=='indianfranchisee'){
self.document.cartform.action="indianfranchisee.cfm";
	self.document.cartform.submit();
	return;
	}
		
}

function grandtotal(form)
	{
	var stotal = 0;
	var totalQnty = 0;
	var maxj = form.j.value;
	var gtotal = 0;

for (var k=1 ; k <= maxj; k++) {
var pr =eval("form" + ".price" + k + ".value");
var Qnty =eval("form" + ".quantity" + k + ".value");
totalQnty = totalQnty*1 + Qnty*1;
stotal = (pr*Qnty + stotal*1);
}
// alert(0);
<cfif session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale">

// form.shipping.value =  <cfoutput>#handlingcharges#</cfoutput> ;

gtotal = form.shipping.value*1 + stotal;
form.discount.value=0;

//stotal= stotal*(1-(form.discount.value/100) ) - form.loyaltycredit.value;
form.subTotal.value=format(stotal,2);
//alert(form.shipping.value*1);
//alert(form.SpecialHandling.value*1);
//alert( form.GiftWrap.value*1);
//alert(form.nonUS.value*1);
if (form.nonUS)
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1  + form.nonUS.value*1 - form.loyaltycredit.value*1;
}
else
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 - form.loyaltycredit.value*1;
}
//alert(gtotal);
<cfelse>


gtotal = form.shipping.value*1 + stotal;
form.discount.value=0;

//stotal= stotal*(1-(form.discount.value/100) ) - form.loyaltycredit.value;
form.subTotal.value=format(stotal,2);
//alert(form.shipping.value*1);
//alert(form.SpecialHandling.value*1);
//alert( form.GiftWrap.value*1);
//alert(form.nonUS.value*1);
if (form.nonUS)
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 - form.loyaltycredit.value*1 + form.nonUS.value*1;
}
else
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 - form.loyaltycredit.value*1;
}
//alert(gtotal);
//
//if (form.texas.checked)
//	{
//	gtotal = gtotal  + form.texas.value*1;
//}

</cfif>
form.GrandTotal.value=format(gtotal,2);

if (totalQnty < 2)
{
form.discount.value = 0};

}
/*
function credit(form)
{ if (form.tcredit.value*1 > 0)
	{

	form.subTotal.value=form.subTotal.value*1;
	form.tcredit.value=form.tcredit.value*1;

	if(form.subTotal.value*1 >= form.tcredit.value*1){
	form.subTotal.value = form.subTotal.value*1 - form.tcredit.value*1;
	form.rcredit.value = form.tcredit.value;
	form.tcredit.value=format(0,2);
	form.subTotal.value=format(form.subTotal.value,2);
	}
	if(form.subTotal.value*1 < form.tcredit.value*1){
	form.tcredit.value= form.tcredit.value*1 - form.subTotal.value*1;
	form.rcredit.value= form.subTotal.value;
	form.subTotal.value=format(0,2);
	form.tcredit.value=format(form.tcredit.value,2);
	form.rcredit.value=format(form.rcredit.value,2);
	}
	if (form.texas.checked)
	{
	form.GrandTotal.value =form.texas.value*1 + form.subTotal.value*1 + form.shipping.value*1 + form.GiftWrap.value*1+form.SpecialHandling.value*1;
		}
		else
		{
	form.GrandTotal.value =form.subTotal.value*1 + form.shipping.value*1 + form.GiftWrap.value*1+form.SpecialHandling.value*1;

		}
	form.GrandTotal.value = format(form.GrandTotal.value,2);
if (form.GifWrap.value == 0)
	{
	document.getElementById('giftmsg').style.visibility = hidden; 
	MM_showHideLayers('giftmsg','','hide');
	}
	else{
	document.getElementById('giftmsg').style.visibility = visible;
	MM_showHideLayers('giftmsg','','show');
	}
	}
}
*/

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
</footer>
</HTML>
<cfcatch type="any">
	<cfoutput>#cfcatch.message#, #cfcatch.extendedinfo# #cfcatch.detail#</cfoutput>
	</cfcatch>
	</cftry>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
