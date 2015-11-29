<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFPARAM NAME="nonUSA" DEFAULT="">
<CFPARAM NAME="session.mail" DEFAULT="">
<CFPARAM NAME="session.bulkbuyer.id" DEFAULT="">
<CFPARAM NAME="texas" DEFAULT="0">
<CFPARAM NAME="shipping" DEFAULT="0">
<CFPARAM NAME="session.bulkbuyer.minamt" DEFAULT= "100">
<cfinclude template=setup.cfm>
<CFPARAM NAME="description" DEFAULT="">
<CFPARAM NAME="shipping" DEFAULT="0">
<cfparam name="form.optionid" default="0">
<cfif isdefined("form.ajaxcheck") >
  <cfset session.ajaxcheck = form.ajaxcheck />
</cfif>
<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com" and session.bulkbuyer.id does not contain "@">
  <cfset session.bulkbuyer.id = "guest">
</cfif>--->
<cfset handlingcharges = 10.00>
<!--- also set in confirmation page --->
<cfparam default="100" name="invent">
<cfparam default="0" name="valueadd" />
<CFPARAM NAME="Price" DEFAULT= "0">
<CFPARAM NAME="category" DEFAULT= "">
<cfparam name="form.set" default="0">
<cfparam name="form.style" default="0">
<CFPARAM NAME="newitem" DEFAULT= "">
<CFPARAM NAME="cart" DEFAULT= "">
<cfparam name="volumediscount" default="0.975" />
<CFPARAM NAME="bought" DEFAULT="">
<CFPARAM NAME="quantity" DEFAULT="1" type="numeric" >
<CFPARAM NAME="j" DEFAULT=0>
<CFPARAM NAME="newQty" DEFAULT="">
<CFPARAM NAME="TotalQty" DEFAULT=0>
<cfparam name="session.gallery" default="list">
<cfset testing = 0>
<!---<cfset session.mail="test32@aol.com">--->
<cfif session.cartid eq 0 >
<cfset session.cartid = 0>
<cfset session.cartitem[1][1] = 0>
<cfset session.cartitem[1][2] = 0>
<cfset session.cartitem[1][3] = 0>
<cfset session.cartitem[1][4] = 0>
<cfset session.cartitem[1][5] = 0>
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
<cfif session.cartid>

 <cfif testing eq 1><cfoutput>Cartid found:#session.cartid#<br /></cfoutput>  </cfif>

   	   <cfquery datasource="gemssql" name="paidstatuscheck">
               SELECT cartid, paymode, status FROM cartstatus WHERE cartid = '#session.cartid#' AND paymode<>'null' and paymode is not null
        </cfquery>
        <cfif paidstatuscheck.recordcount gt 0 >
		<!--- clear session for cart thats paid already --->
		 <cfloop condition="Arraylen(session.cartitem) gt 1" >
           <cfset temp = ArrayDeleteAt(session.cartitem, Arraylen(session.cartitem)) >
         </cfloop>
		 <cfset session.cartitem[1][1] = 0>
         <cfset session.cartitem[1][2] = 0>
         <cfset session.cartitem[1][3] = 0>
         <cfset session.cartitem[1][4] = 0>
         <cfset session.cartitem[1][5] = 0>
         <cfset session.cartid = 0>
        
        	<cflock name="setcartid" type="exclusive" timeout="10">
             	<cfset application.cartid = application.cartid + 1>
        	<cfset session.cartid = application.cartid >
          	   	</cflock>
		</cfif>


 <!--- Check if current cart is paid, or if current cart has a different email attached to it. --->
   <cfif session.mail contains "@"> 
 <cfif testing eq 1> <cfoutput>email found:#session.mail#<br /></cfoutput>  </cfif>
     <cfquery datasource="gemssql" name="currentcart">
        SELECT top 1 cartid, email FROM buyingrecord
        WHERE cartid = '#session.cartid#'
       AND email = '#session.mail#' and email <>'na' order by cartid desc
      </cfquery>
      <cfif currentcart.recordcount eq 0 >
<cfif testing eq 1>  <cfoutput>cart/email not found in buyingrecord<br /></cfoutput></cfif> 
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
         <cfset session.cartitem[1][2] = 0>
         <cfset session.cartitem[1][3] = 0>
         <cfset session.cartitem[1][4] = 0>
         <cfset session.cartitem[1][5] = 0>
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
<cfif testing eq 1><cfoutput>No cart id<br /></cfoutput></cfif>
  <!--- if there is no cartid, but mail, check the db and if the email is in the db copy it to the session --->
  <!--- no cartid means that they have not come to this page before during this session or have not added any items to the cart.  --->
  <!--- if they have added items, there will be a cart id --->
  <cfif session.mail contains "@">
<cfif testing eq 1><cfoutput>mail found<br /></cfoutput></cfif>
    <!--- First we check the buyingrecord table for the email --->
    <cfquery datasource="gemssql" name="currentbuyingrecordcart">
       SELECT top 1 cartid FROM buyingrecord WHERE email = '#session.mail#' order by cartid desc
     </cfquery>
    <cfset cartfound = 0>
    <cfif currentbuyingrecordcart.recordcount neq 0>
<cfif testing eq 1><cfoutput>cartid found in buyingrecord #currentbuyingrecordcart.recordcount# items<br />
      </cfoutput></cfif>
      <!--- Email was found in buyingrecord db, check to see if any are unpaid --->
      <cfloop query="currentbuyingrecordcart">
        <cfquery datasource="gemssql" name="paidstatuscheck">
             SELECT status, cartid, paymode FROM cartstatus 
             WHERE cartid = '#currentbuyingrecordcart.cartid#' 
             AND paymode = 'null' and paymode is not null
           </cfquery>
        <cfif paidstatuscheck.recordcount neq 0>
<cfif testing eq 1><cfoutput>cartid #currentbuyingrecordcart.cartid# found in cartstatus<br />
          </cfoutput></cfif>
          <!--- Unpaid cart found.  Session will be cleared and new cartID issued with option to activate unpaid cart--->
		  <cfset upaidcartfound="yes">
		  		 <cfloop condition="Arraylen(session.cartitem) gt 1" >
           <cfset temp = ArrayDeleteAt(session.cartitem, Arraylen(session.cartitem)) >
         </cfloop>
		 <cfset session.cartitem[1][1] = 0>
         <cfset session.cartitem[1][2] = 0>
         <cfset session.cartitem[1][3] = 0>
         <cfset session.cartitem[1][4] = 0>
         <cfset session.cartitem[1][5] = 0>
         <cfset session.cartid = 0>
        
        	<cflock name="setcartid" type="exclusive" timeout="10">
             	<cfset application.cartid = application.cartid + 1>
        	<cfset session.cartid = application.cartid >
          	   	</cflock>

		  
          <cfset cartfound = 0>
          <cfelse>
<cfif testing eq 1><cfoutput>cartid #currentbuyingrecordcart.cartid# not found in cartstatus<br />
          </cfoutput></cfif>
        </cfif>
      </cfloop>
      <cfelse>
<cfif testing eq 1><cfoutput>email not found in db<br /></cfoutput></cfif>
    </cfif>
    <!--- End email found in db --->
    <!--- if there is no cartid and no mail, check cookies --->
  <cfelse>
<cfif testing eq 1><cfoutput>No cartid, no mail<br /></cfoutput></cfif>
    <!--- if there is a cookie, pull the cartid from the db --->
    <cfif isDefined('cookie.cartid') >
<cfif testing eq 1><cfoutput>Cookie found<br />
      </cfoutput></cfif>
      <cfquery datasource="gemssql" name="currentcart">
           SELECT * FROM buyingrecord WHERE cartid = '#cookie.cartid#' and datediff(d,[datebought],#now()#)<15
          </cfquery>
      <!--- Cartid was found in db, check to see if unpaid --->
      <cfif currentcart.recordcount neq 0>
<cfif testing eq 1><cfoutput>Check cookie cartid in cartstatus<br />
        </cfoutput></cfif>
<!---  MUST CHANGE status<>done --->
        <cfquery datasource="gemssql" name="paidstatuscheck">
               SELECT cartid, status, paymode FROM cartstatus WHERE cost =0 and cartid = '#cookie.cartid#' AND paymode='null' and paymode is not null
            </cfquery>
        <cfif paidstatuscheck.recordcount gt 0 >
<cfif testing eq 1><cfoutput>Found in cartstatus<br />          </cfoutput></cfif>
          <!--- cart id is in db and is unpaid. We'll use it --->
          <cfset session.cartid = currentcart.cartid >
          <cfif session.mail eq ""> <cfset session.mail = currentcart.email ></cfif>
          <cfloop  index="jd"  from="1" to="#currentcart.recordcount#">
            <cfset session.cartitem[jd][1] = currentcart.itemid>
            <cfquery datasource="gemssql" name="catcheck">
                    SELECT cat FROM Items WHERE newitem = '#currentcart.itemid#'
                  </cfquery>
            <cfset session.cartitem[jd][2] =catcheck.cat>
            <cfset session.cartitem[jd][3] =currentcart.rate>
            <cfset session.cartitem[jd][4] =currentcart.quantity>
            <cfset session.cartitem[jd][5] =currentcart.optionid>
<cfif testing eq 1><cfoutput>Session cart item added<br />
            </cfoutput></cfif>
          </cfloop>
          <cfelse>
<cfif testing eq 1><cfoutput>Cookie cart already paid<br /></cfoutput></cfif>

          <!--- Cart was in db, but was already paid.  Cookie can be tossed. --->
          <cfcookie name="cartid" expires="now" value="" >
        </cfif>
      </cfif>
      <!--- End cookie cartid found in db --->
    </cfif>
    <!--- End cookie check --->
  </cfif>
  <!--- End session.mail found --->

</cfif>
<!--- End pull from db update --->
<cfif testing eq 1><cfoutput>
<cfloop index="jz" from="1" to="#Arraylen(session.cartitem)#">
  
Point1cart:  #session.cartid#,#session.cartitem[jz][1]#,#session.cartitem[jz][2]#,#session.cartitem[jz][3]#,#session.cartitem[jz][4]#,#session.cartitem[jz][5]#<br />
</cfloop>
</cfoutput></cfif>

<cfif testing eq 1><cfoutput>Point 1<br />
</cfoutput></cfif>
<!--- update cart if they clicked on something to buy --->
<cfif bought is "buy" and newitem neq "">
<cfif testing eq 1><cfoutput>New item added to session<br /></cfoutput>
  </cfif>
  <!--- nothing in cart currently, so added item that was clicked --->
  <cfif session.cartitem[1][1] EQ 0 >
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
    <!---    <cfset newRate = min(session.cartitem[jh][5],price) >--->
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
<cfif testing eq 1><cfoutput>
<cfloop index="jz" from="1" to="#Arraylen(session.cartitem)#">
  
'Point2cart:  #session.cartid#,#session.cartitem[jz][1]#,#session.cartitem[jz][2]#,#session.cartitem[jz][3]#,#session.cartitem[jz][4]#,#session.cartitem[jz][5]#<br />
</cfloop>
</cfoutput></cfif>
<cfif testing eq 1><cfoutput>Point 2<br />
  #ArrayLen(session.cartitem)#<br />
</cfoutput></cfif>
<cfloop  index="jf" from="1" to="#ArrayLen(session.cartitem)#">
<cfif testing eq 1><cfoutput>mail:#session.mail#item:#session.cartitem[jf][1]#quant:#session.cartitem[jf][4]#cartid:#session.cartid#optionid:#session.cartitem[jf][5]#rate:#session.cartitem[jf][3]#x<br />
  </cfoutput></cfif>
</cfloop>
<!--- if the cart is not empty, confirm that there's a cartid and update db --->
<cfif session.cartitem[1][1] neq 0 >
<cfif testing eq 1><cfoutput>Session cart not empty<br />
  </cfoutput></cfif>
  <!--- if there is no cartid, create one --->
  <cfif session.cartid eq 0 >
<cfif testing eq 1><cfoutput>Create new cartid<br />
    </cfoutput></cfif>
    <cflock name="setcartid" type="exclusive" timeout="10">
      <cfset application.cartid = application.cartid + 1>
      <cfset session.cartid = application.cartid >
    </cflock>
  </cfif>
<cfif testing eq 1><cfoutput>Current cartid:#session.cartid#<br />
  </cfoutput></cfif>
  <!--- End no cartid --->
<cfif testing eq 1><cfoutput>Find cartid in buyingrecord<br />
  </cfoutput></cfif>
  <cfquery datasource="gemssql" name="currentcart">
       SELECT * FROM buyingrecord WHERE cartid = '#session.cartid#'
     </cfquery>
  <cfif currentcart.recordcount gt 0>
    <!--- cartid found in buying record so update buyingrecord --->
    <cfloop query="currentcart" >
<cfif testing eq 1><cfoutput>Cartid found in buyingrecord<br />
      </cfoutput></cfif>
      <cfset cartmatch = 0>
<cfif testing eq 1><cfoutput>Items in session cart:#ArrayLen(session.cartitem)#<br />
      </cfoutput></cfif>
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
                SET quantity = '#session.cartitem[ja][4]#',rate=#session.cartitem[ja][3]# <cfif session.mail neq "">, email='#session.mail#'</cfif>
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
      <cfif cartmatch eq 0>
        <cfloop index="jb" from="1" to="#Arraylen(session.cartitem)#">
          <!--- buyingrecord item  was not found in session cart so delete it --->
<cfif testing eq 1><cfoutput>Cartitem deleted in buyingrecord because it doesn't exist in cart<br />
          </cfoutput></cfif>
          <cfquery datasource="gemssql" name="deletecart">
              DELETE FROM buyingrecord WHERE cartid = '#session.cartid#' AND itemid = '#session.cartitem[jb][1]#' AND optionid = '#session.cartitem[jb][5]#'
          </cfquery>
        </cfloop>
      </cfif>
    </cfloop>
  <cfquery datasource="gemssql" name="deletecart">
              DELETE FROM buyingrecord WHERE cartid = '#session.cartid#' 
          </cfquery>
      
	    <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
<cfif testing eq 1><cfoutput>mail:#session.mail#item:#session.cartitem[jc][1]#quant:#session.cartitem[jc][4]#' cartid:#session.cartid#optionid:#session.cartitem[jc][5]#rate:#session.cartitem[jc][3]#x<br />
      </cfoutput></cfif>
	    
      <cfif session.cartitem[jc][4] gt 0 >
        <cfquery datasource="gemssql" name="updatecart">
                    INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
                    VALUES ('#session.mail#', '#session.cartitem[jc][1]#', '#session.cartitem[jc][4]#', '#session.cartid#', '#session.cartitem[jc][5]#', #session.cartitem[jc][3]# )
            </cfquery>
<cfif testing eq 1><cfoutput>Cart item#session.cartitem[jc][1]#added<br />
        </cfoutput></cfif>
      </cfif>
    </cfloop>

    <cfelse>
    <!--- cartid not already in  buyingrecord.  We can just add the session cart items to buyingrecord --->
<cfif testing eq 1><cfoutput>Insert new cart into buyingrecord<br />
    </cfoutput></cfif>
    <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
<cfif testing eq 1><cfoutput>mail:#session.mail#item:#session.cartitem[jc][1]#quant:#session.cartitem[jc][4]#' cartid:#session.cartid#optionid:#session.cartitem[jc][5]#rate:#session.cartitem[jc][3]#x<br />
      </cfoutput></cfif>
      <cfif session.cartitem[jc][4] gt 0 >
        <cfquery datasource="gemssql" name="updatecart">
                    INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
                    VALUES ('#session.mail#', '#session.cartitem[jc][1]#', '#session.cartitem[jc][4]#', '#session.cartid#', '#session.cartitem[jc][5]#', #session.cartitem[jc][3]# )
            </cfquery>
<cfif testing eq 1><cfoutput>Cart item#session.cartitem[jc][1]#added<br />
        </cfoutput></cfif>
      </cfif>
    </cfloop>
  </cfif>
<cfif testing eq 1><cfoutput>Find cartid#session.cartid#in cartstatus<br />
  </cfoutput></cfif>
  <cfquery datasource="gemssql" name="cartstatuscheck">
      SELECT status FROM cartstatus WHERE cartid = '#session.cartid#'
    </cfquery>
  <cfif cartstatuscheck.recordcount eq 0>
<cfif testing eq 1><cfoutput>Cartid not found in cartstatus, so add<br />
    </cfoutput></cfif>
    <!--- cartstatus doesn't have a record for this particular cartid, so add it --->
    <cfquery datasource="gemssql" name="cartstatusadd">
          INSERT INTO cartstatus (cartid, status, paymode, cost, indate) 
          VALUES ('#session.cartid#', 'set', 'null', '0', #now()#)
      </cfquery>
    <cfelse>
<cfif testing eq 1><cfoutput>Cartid  found in cartstatus<br />
    </cfoutput></cfif>
  </cfif>
</cfif>
<cfif testing eq 1><cfoutput>
<cfloop index="jz" from="1" to="#Arraylen(session.cartitem)#">
  
Finalcart:  #session.cartid#,#session.cartitem[jz][1]#,#session.cartitem[jz][2]#,#session.cartitem[jz][3]#,#session.cartitem[jz][4]#,#session.cartitem[jz][5]#<br />
</cfloop>
</cfoutput>
</cfif>
<cfif session.cartid>
  <cfcookie name="cartid" expires="15" value=#session.cartid# >
</cfif>
<!--- end cart not empty check --->

<cfset addressset = 0>
<cfif session.mail contains "@" and session.mail contains ".">

<cfquery datasource="semiprecious" name="purchaserinfo">
            SELECT firstname, lastname, email, address1, address2,state,country, phonenumber,city, zip FROM memberinfo 
            WHERE email='#session.mail#' 
            </cfquery>
  <cfset addressset = 1>
  <cfelse>
  <cfif session.bulkbuyer.id contains "@">
 <cfquery datasource="gemssql" name="purchaserinfo">
   SELECT firstname, lastname, address1, address2, city, state, country, zip FROM bulkbuyers
  WHERE email = '#session.bulkbuyer.id#'
</cfquery>
    <cfset addressset = 1>
--->  </cfif>
</cfif>
<html>
<HEAD>
<TITLE>Jewelry Items selected on Semiprecious.com</TITLE>
<link rel="shortcut icon" href="/favicon.ico" />
<script language="JavaScript" type="text/javascript" src="/CFIDE/scripts/cfform.js"></script>

  <script type="text/javascript" src="/topmenu.files/dmenu.js"></script>
  <noscript></noscript>

  <!-- Deluxe Menu -->
    <noscript><p><a href="http://deluxe-menu.com">Javascript Menu by Deluxe-Menu.com</a></p></noscript>
    <script type="text/javascript" src="newtopmenu.files/dmenu.js"></script>
    <!-- (c) 2009, by Deluxe-Menu.com -->

<script LANGUAGE=JAVASCRIPT>
<!--

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
function goProcess(inString){

/****************************************Start of form validation***********************************************/
// Author		:	Arun
// Created By	:	AGC India
// Created Date	:	20-Jul-2009
// Copyright	:	Semiprecious.com
/**************************************************************************************************************/
if(inString=='Proceed to Checkout')
{
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

/*	//Validation for 'email' field
	if  (!_CF_hasValue(cartform.email, "TEXT" ,true))
	{
		if  (!_CF_onError(cartform, cartform.email, cartform.email.value, "Please enter value for 'Email'."))
		{
			alert("Please enter value for 'Email'.");
			cartform.email.focus();
			return false;
		}
	}
    else
	{
	   if (cartform.email.value.indexOf("@") == -1 || cartform.email.value.indexOf(".") == -1 || cartform.email.value.indexOf("@") == 0 || cartform.email.value.indexOf("@") == cartform.email.value.length -1 ||  cartform.email.value.indexOf(".") == cartform.email.value.length-1 )
	   {
			alert("Please enter a valid email address in 'Email'.");
			cartform.email.focus();
			return false;
	   }
	}
*/
	}
/****************************************End of form validation***********************************************/

	texas = 1
	if(inString=='Proceed to Checkout'){
	//if (texas == 0 )
	 //{
	 //alert("Please specify if you are buying from the state of Texas in USA or outside of Texas");
	 //return false;
	// }
	<cfif cgi.server_name contains 'wholesale'>
		  self.document.cartform.action="http://www.wholesale-gemstone-jewelry.com/confirmation.cfm";
	<cfelse>
			  self.document.cartform.action="https://www.semiprecious.com/confirmation.cfm";
	</cfif>
	
	self.document.cartform.submit();
	return;
	}
		if(inString=='Save Cart'){
			<cfif cgi.server_name contains 'wholesale'>
						self.document.cartform.action="http://www.wholesale-gemstone-jewelry.com/confirmation.cfm?save=1";
			<cfelse>
					self.document.cartform.action="https://www.semiprecious.com/confirmation.cfm?save=1";
			</cfif>

	self.document.cartform.submit();
	return;
	}
	if(inString=='Click here to Buy More Items'){
<cfif session.gallery is 'listcluster' and newitem neq ''>
	<cfoutput>self.document.cartform.action='jewelry_item.cfm?newitem=#newitem#';</cfoutput>
<cfelse>
	<cfoutput>self.document.cartform.action='gemstone_jewelry_gallery.cfm?#session.filter#';</cfoutput>
</cfif>
	self.document.cartform.submit();
	return;
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

form.shipping.value =  <cfoutput>#handlingcharges#</cfoutput> ;

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
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 + form.nonUS.value*1;
}
else
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1;
}
//alert(gtotal);
<cfelse>

if (totalQnty == 0) {
form.shipping.value =  3.99}
if (totalQnty == 1) {
form.shipping.value =  3.99}
if (totalQnty ==2) {
form.shipping.value = 3.99}
if (totalQnty > 2) {
form.shipping.value = 3.99}

if (stotal > 69) {
form.shipping.value =  0.00}

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
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1 + form.nonUS.value*1;
}
else
{
gtotal = form.shipping.value*1 + stotal*1 + form.SpecialHandling.value*1 + form.GiftWrap.value*1;
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
<cfif session.mail is 'ACEMAT@VSNL.COM'>
  <link href="/styles/npstyles11.css" rel="stylesheet" type="text/css" />
  <cfelse>
  <link href="/styles/npstyles1.css" rel="stylesheet" type="text/css" />
</cfif>
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
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/imageswap.js"></script>
</HEAD><cfif newitem neq "">
  <CFQUERY DATASOURCE="gemssql" NAME="stats">
						update nitish.itemstats set addToCart=addToCart+1 where itemid =#newitem#
	 </cfquery>
</cfif>
<BODY BGCOLOR="white" leftmargin="0" topmargin='0'>
<cfif cgi.server_name contains "semiprecious.in">
  <CFINCLUDE TEMPLATE="/india/header.cfm">
  <cfelse>
  <CFINCLUDE TEMPLATE="header.cfm">
</cfif>
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

<table id="container1" width="1000px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px">
<tr style="width:1000px;" align="center">

<td valign="top"  align="center" ><!--- BEGIN LEFT SIDE STUFF --->

  <CFINCLUDE TEMPLATE="leftmenus.cfm">
  <!--- END LEFT SIDE STUFF --->
</td>
<td align="center" valign="top">
<div style="width:800px;" align="left">
  <h3>
    <cf_steps step="3" />
    		<cfif isDefined("FORM.arb")>
    		<p style="font-family:'trebuchet ms', helvetica, sans-serif; color:red; font-size:16px; text-align:center">THANK YOU, YOUR ORDER HAS BEEN SUCCESSFULLY PLACED!
			</cfif>

  </h3>
 </div>
<p><B>PRE-CART ITEMS REVIEW FOR CARTID: <font color=blue><cfoutput>#session.cartid#</cfoutput></font></B></p>

<table border="0" cellpadding="0"  style="position:relative;margin-left:2px;"  width="794px">
<tr>
<td valign="top" align="center">
<TABLE BORDER="0"   align="center" width="794px">
<tr>
<TD align="center">
<TABLE bordercolor="#AAAA99" style="border:1px #666600 solid;" cellspacing="0" align="center"  >
<tr class="greenbutton">
  <TH width="17%">Item </TH  >
  <TH width="17%">Image </TH  >
  <TH width="12%">Price</TH>
  <TH width="16%">Quantity</TH>
  <TH width="8%">Amount</TH>
  <TH width="10%" align="left">Remove <a href="/cartcontrol/cartmonitor.cfc?method=emptycart" onClick="javascript:return confirm('All items will be removed from the cart!');"><font color="#FF0000">All</font></a></TH>
</tr>
<CFSET grandTotal=0>
<cfset session.grandtotal = 0>
<CFSET subTotal=0>
<CFSET amounts=0>
<CFSET TotalQty=0>
<cfset emptyitems = 0>
<cfif session.cartitem[1][1] is not 0>
  <cfform action="" method="post" name="cartform">
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
        <tr> <cfoutput>
            <TD  class="rowb" align='left'  ><span  class="listdescr"><b>Item ID:#session.cartitem[j][1]#</b>
              <cfif qprice.storage contains "IN-">
                <cfelse>
                <br>
                <b><font color=green>Expedited Shipping Option</font></b>
              </cfif>
              <br>
              #qprice.description#
              <cfif session.cartitem[j][5]>
                <cfquery datasource="gemssql" name="opts">
      		select description,  valueadd from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
                <cfif session.bulkbuyer.id NEQ "">
                  <cfif isnumeric(opts.valueadd)>
                    <cfset valueadd = opts.valueadd/2 >
                  </cfif>
                  <Cfset volumediscount = 0.975 />
                  <!---- volumediscount is given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
                  <cfelse>
                  <cfif isnumeric(opts.valueadd)>
                    <cfset valueadd = opts.valueadd>
                  </cfif>
                  <Cfset volumediscount = 0.95 />
                </cfif>
                <span class="optionsinline">[#opts.description#]</span>
              </cfif>
              </span>
              <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#">
            </TD><td><img src=images/#qprice.cat#/thumb/#qprice.newitem#.jpg border=0 width=80></td>
            <cfset TotalQty=session.cartitem[j][4]+TotalQty>
            <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#">
            <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#">
            <!---	  <td  class="rowb" align="center" valign="middle">
					<cfswitch expression="#qprice.clustercount#"><cfcase value="1"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look" >=</a></span>
					</cfcase><cfcase value="2"><span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">+</a></span></cfcase><cfcase value="3"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look">=</a></span><hr />

<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">+</a></span></cfcase><cfdefaultcase >&nbsp;</cfdefaultcase></cfswitch>
					</td>--->
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
            <td  class="rowb" align="center">#session.cartitem[j][4]#&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href='jewelry_item.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#&existqty=#session.cartitem[j][4]#&optionid=#session.cartitem[j][5]#'>Edit</a></font></td>
            <td  class="rowb">#format(amounts)#
              <input type="hidden" name="amount#j#" Value="#amounts#">
            </td>
            <td  class="rowb"><a href='cart.cfm?newQty=0&newitem=#j#&optionid=#session.cartitem[j][5]#' ><font color="##CC0000">Remove</font></a></td>
          </cfoutput> </tr>
        <cfset subTotal= amounts + subTotal>
        <cfelse>
        <!--- since we are now adding values with 0 value we dont do this  <cfset emptyitems = emptyitems + 1> --->
        <cfoutput>
          <input type="hidden" name="amount#j#" Value="0">
          <input type="hidden" name="price#j#" Value="0">
          <input type="hidden" name="quantity#j#" Value="0">
        </cfoutput>
      </cfif>
    </CFLOOP>
    <cfoutput>
      <cfif quantity GT invent >
        <tr>
          <td class="error1" colspan="7">For item #newitem# only #invent# in stock. #evaluate(quantity - invent)# may ship in 4 weeks or you will be refunded. </td>
        </tr>
      </cfif>
      <!---   <TR> 
                <TD class="error1" colspan="6"> WE ARE UPGRADING- NOT SHIPPING 
                  TILL 12 July! GET 5% DISCOUNT FOR THE DELAY </TD>
              </TR> --->
      <cfif totalQty is 0>
        <tr>
          <td colspan="7"><h4>Sorry, cart is empty....</h4>
            Use the Product Categories on top banner or <a href="gemstone_jewelry_gallery.cfm?#session.filter#">Click here to shop</a>.<br>
            <cfif isdefined("session.cartinfile")>
              <cftry>
                <cffile action="delete"  file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
                <cfcatch type="any">
                </cfcatch>
              </cftry>
              <cfcookie 
           name = "cartinfile"
           expires = "now"        >
            </cfif>
            <hr />
            <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> <br>
            Note: In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
            web link to pay for them OR call us at #Application.tollfree# with your                   item numbers. Cart does not work without cookies<br>
            If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error. </td>
        </tr>
        </table>
        </td>
        </tr>
        </table>
        </td>
        </tr>
        </table>
        <cfinclude template="footer.htm">
        <cfabort />
      </cfif>
    </cfoutput>
    <cfset session.totalqty = Variables.totalqty />
    <cfif totalQty is 1>
      <cfset shipping  = 3.99>
      <cfelseif totalQty is 2>
      <cfset shipping =3.99>
      <cfelseif totalQty gt 2>
      <cfset shipping  = 3.99>
      <cfif subtotal  GT 69.99>
        <cfset shipping=0>
      </cfif>
	  <cfif cgi.server_name contains "wholesale"><cfset shipping=10></cfif>
      <!---
<cfelseif j is 4>
<cfset shipping  = 2.00>
<cfelseif j is 5>
<cfset shipping  = 1.00>
<cfelseif j GT 5>
<cfset shipping  = 0.00>
--->
    </cfif>
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
    <cfif subtotal  GT 4999>
      <cfset shipping=0>
    </cfif>
    <cfset GrandTotal= shipping + subTotal>
    <cfif cgi.server_name contains ".in">
      <tr bordercolor="#FFFFFF">
          <td colspan="3"   align="center"><a href="gemstone_jewelry_gallery.cfm?<cfoutput>#session.filter#</cfoutput>">Look around for more stuff</a></td>
          <td colspan="2" bgcolor="#FFFFFF" align="center"><a href="indiaconfirmation.cfm"><font size=5>Select Payment Mode</font></a></td>
        </tr>
        <cfelse>
      <tr   >
          <td colspan="4" height="2"  align="left"   class="greenbutton"><!---
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
          </td>
          <td colspan="3"  align="center" bgcolor="#FFFFFF"><input name="button2" type="button" class="greenbutton" style="font-weight:bold" onClick="javascript:goProcess('Click here to Buy More Items')" value="Back to Shopping"></td>
        </tr>
      </table>
      </td>
      </tr>
      <tr>
        <td align="center"><table align="center"  border="0"  cellspacing="0" bordercolor="#bbbb99" width="792px" style="border:0px black ridge;">
            <cfif nonUSA eq "" or nonUSA is "No">
              <tr>
                <!---  <td align="center"><input name="button" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"> 
              </td> --->
                <td  align="right" nowrap><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script></td>
                <td  align="right" nowrap>Standard Shipping: -- <input type="hidden" size="4" name="shipping"    id="shipping" onFocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="<cfif  session.bulkbuyer.id neq ""><cfoutput>$#handlingcharges#</cfoutput><Cfelse><cfoutput>$#shipping#</cfoutput></cfif>">
                  <cfif  session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale">
                    <cfoutput>$#handlingcharges#</cfoutput>
                    <cfelse>
                    <cfoutput>$#shipping#</cfoutput> (Orders over $70 are shipped free)
                  </cfif>
				  
				 <br><br><b>Total including domestic shipping: $</b>  <input class="inputtext" name="GrandTotals" type="text"  <CFIF SESSION.MAIL NEQ "ACEMAT@VSNL.COM">onFocus="javascript:this.blur()" </CFIF> value="<cfoutput>#decimalformat(evaluate(subTotal + shipping))#</cfoutput>" size="6" maxlength="9">
                </td>
              </tr>
              <cfelse>
              <input type="hidden" size="4" name="shipping"    id="shipping" value="0">
              <cfset shipping=0>
              <!--- international shipping is handled by specialhandling so this is set to 0--->
            </cfif>
            <input type="hidden" size='3' name="discount" value="0">
            <!---    when removing delayed shipping above hidden variable is to be shown and toggle in other situation ---->
            <cfset newsubtotal = subtotal />
            <cfif isdefined("session.giftid") and session.giftamt GT 0>
              <tr>
                <td  align="right" valign="middle"  >Gift 
                  Amt (#):</td>
                <td align="right" valign="middle"> $<cfoutput>#session.giftamt#</cfoutput>.00 </td>
                <input type="hidden" value="gift" name="couponcode">
              </tr>
              <cfelseif session.bulkbuyer.id contains "@" or cgi.server_name contains "wholesale">
              <cfset shipping = handlingcharges />
              <tr>
                <cfif nonUSA is "Yes">
                  <td  align='left'>For Non USA Shipping <img src=/images/sad.gif width="44" height="43"> </td>
                  <td align="left"><cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
                    <option value="20.00" >Canada (10 days): $20.00</option>
                    <option value="25.00" >South America: $25.00</option>
                    <option value="22.00" >Europe (5  days): $22.00</option>
                    <option value="25.00" >Australia (7  days): $25.00</option>
                    <option value="35.00">Asia/Africa (7 to 15 days): $35.00</option>
                    </cfselect>
                  </td>
                  <cfelseif nonUSA is "">
			  <input type="hidden" name="nonUS" value="yes">
			  <td align=right><a href=cart.cfm?nonUSA=Yes>Non USA Orders Click Here</a></td>
  			  <td align=right><a href=cart.cfm?nonUSA=Yes>Non USA Orders Click Here</a></td> 
                </cfif>
              </tr>
              <TR>
                <TD colspan="3"> <img src="/images/continueshopping.gif" onClick="javascript:goProcess('Click here to Buy More Items')" > <br> <b><br><font color=orange>OR START CHECKOUT BELOW</font></b><br><br>Please enter the requested information. Entries marked 
                  with '<font color="red">*</font>' are required. </TD>
                <TD width="13%" rowspan="5">&nbsp;</TD>
              </TR>
              <tr>
                <td>&nbsp;</td>
              </tr>
			   <cfoutput>
                <tr>
                  <td  align="right"><font color="red" >*</font>Ship To: </td>
                  <td  align="left"><input name="Shipto" value="<cfif addressset eq 1>#purchaserinfo.firstname#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right"><font color="red">*</font>Address Line1:</td>
                  <td  align="left"><input name="Street1" value="<cfif addressset eq 1>#purchaserinfo.address1#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right"> Address Line2: </td>
                  <td  align="left"><input name="Street2" value="<cfif addressset eq 1>#purchaserinfo.address2#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right"><font color="red">*</font>City: </td>
                  <td  align="left"><input name="City" value="<cfif addressset eq 1>#purchaserinfo.city#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> State/Province: </td>
                  <td  align="left"><input name="State" value="<cfif addressset eq 1>#purchaserinfo.state#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> ZIP/PIN code: </td>
                  <td  align="left"><input name="zip" value="<cfif addressset eq 1>#purchaserinfo.zip#</cfif>" size="15">
                  </td>
                </tr>
				  <tr>
                  <td  align="right"><font color="red">*</font>Country:</td>
                  <td><input name="country" value="<cfif addressset eq 1>#purchaserinfo.country#<cfelse>USA</cfif>" size="15"></td>
                </tr>
			</cfoutput>
			  <cfif session.mail contains "@">
			  <input type="hidden" name="email" value="<cfoutput>#session.mail#</cfoutput>" size="40">
			  <cfelse>
              <tr>
                <td  align="right">Email (optional): </td>
                <td  align="left"><input type="text" name="email" value="" size="40"></td>
              </tr>
              </cfif>
			   <tr>
                <td  align="right">Phone required for non-USA orders: </td>
                <td  align="left"><input name="phonenumber" value="<cfif addressset eq 1><cfoutput>#purchaserinfo.phonenumber#</cfoutput></cfif>" size="30"></td>
              </tr>

              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <input type="hidden" value="regwsale" name="couponcode">
              <input type="hidden" name="GiftWrap" value="0.00" />
              <input type="hidden" name="giftmsg" value="na" />
              <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
              <cfelse>
              <!---			<cfif isdefined("url.texaserror")><tr class="error" ><cfelse>			<tr></cfif>
              <td align="right">Buying from Texas? (<span class="error">*</span>):</td>
              <td align="right">We will pay Sales Tax on your behalf.
			   <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
			  
			  </td></tr>--->
              <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
              <tr>
                <cfif nonUSA is "Yes">
                  <td  align='right'>Non USA Shipping <img src=/images/sad.gif height=25> </td>
                  <td align="left"><cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
                    <option value="1.00" >Canada: $4.99 (8 to 15 days) </option>
                    <option value="2.00" >Europe/Australia (7 to 10 days): $5.99</option>
                    <option value="11.00">Asia/Africa (4 to 10 days): $14.99</option>
                    <option value="11.00">Other (10 to 15 days): $14.99</option>
                    </cfselect>
                  </td>
                  <!---  <cfelseif nonUSA is "">
			  			  <input type="hidden" name="nonUS" value="0">
			  <td align="right"><a href=cart.cfm?nonUSA=Yes><b>Non USA Orders Click Here</b></a></td><td align="right"><a href=cart.cfm?nonUSA=Yes><b>Non USA Orders Click Here</b></a></td>--->
                </cfif>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <TR>
                <TD colspan="3"> <img src="/images/continueshopping.gif" onClick="javascript:goProcess('Click here to Buy More Items')" > <br> <br><b>OR START CHECKOUT BELOW IF DONE ADDING ITEMS TO CART</b><br><br>Please enter the requested information. Entries marked 
                  with '<font color="red">*</font>' are required. </TD>
                <TD width="13%" rowspan="5">&nbsp;</TD>
              </TR>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <cfoutput>
                <tr>
                  <td  align="right"><font color="red">*</font>Ship To: </td>
                  <td  align="left"><input name="Shipto" value="<cfif addressset eq 1>#purchaserinfo.firstname#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right"><font color="red">*</font>Address Line1:</td>
                  <td  align="left"><input name="Street1" value="<cfif addressset eq 1>#purchaserinfo.address1#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right"> Address Line2: </td>
                  <td  align="left"><input name="Street2" value="<cfif addressset eq 1>#purchaserinfo.address2#</cfif>" size="40"></td>
                </tr>
                <tr>
                  <td  align="right"><font color="red">*</font>City: </td>
                  <td  align="left"><input name="City" value="<cfif addressset eq 1>#purchaserinfo.city#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> State/Province: </td>
                  <td  align="left"><input name="State" value="<cfif addressset eq 1>#purchaserinfo.state#</cfif>" size="15"></td>
                </tr>
                <tr>
                  <td  align="right"> ZIP code: </td>
                  <td  align="left"><input type=text name="zip" value="<cfif addressset eq 1>#purchaserinfo.zip#</cfif>" size="15">
                  </td>
                </tr>
                <tr>
                  <td  align="right"><font color="red">*</font>Country:</td>
                  <td><input name="country" value="<cfif addressset eq 1>#purchaserinfo.country#<cfelse>USA</cfif>" size="15"></td>
                </tr>
              </cfoutput>
			  <cfif session.mail contains "@">
			  <input type="hidden" name="email" value="<cfoutput>#session.mail#</cfoutput>" size="40">
			  <cfelse>
              <tr>
                <td  align="right">Email (optional): </td>
                <td  align="left"><input type="text" name="email" value="" size="40"></td>
              </tr>
              </cfif>
			   <tr>
                <td  align="right">Phone required for non-USA orders: </td>
                <td  align="left"><input name="phonenumber" value="<cfif addressset eq 1><cfoutput>#purchaserinfo.phonenumber#</cfoutput></cfif>" size="30"></td>
              </tr>
              <tr>
                <td colspan="2"><font color=green>Only items showing expedited shipping option will ship same day if ordered by 7 PM CST.  Remaining items will come regular mail.</font></td>
              </tr>
              <tr>
                <td  align="right"> Shipping Upgrade: </td>
                <td  align="left"><select name="SpecialHandling" onclick="javascript:grandtotal(this.form)">
                    <cfif nonUSA is "" or nonUSA is "No">
                      <option value="0.00" selected>USPS with tracking (5 to 12 days) + $0.00</option>
                      <option value="1.00" >Priority Mail (2-3 days): + $1.00</option>
                      <option value="9.00">Express Mail (1-2nd day) : + $9.00</option>
                      <option value="25.00">UPS (Overnight Most Places): + $25.00</option>
                      <option value="39.00">UPS (Overnight Remote Places): + $39.00</option>
                      <cfelse>
                      <option value="0.00" selected>Government/US Mail (2 weeks) + $2.00</option>
                      <option value="15.99" >International Priority Mail (10 days) + $15.99</option>
                      <option value="25.00">Express Mail International 8 days: + $25.00</option>
                      <option value="40.00">UPS + $40.00</option>
                    </cfif>
                  </select>
                  <cfinclude template=vacation.inc>
                </td>
              </tr>
              <tr>
                <td  align='right' nowrap><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="22" style="display:inline;" />&nbsp;&nbsp;<font color="#000000">Gift Wrap</font>: </td>
                <td align="left"  ><select name="GiftWrap" onclick="javascript:grandtotal(this.form)">
                    <option value="0.00" selected>No Gift Bag</option>
                    <option value="1.00" >Red Velvet Gift Bag: $1.00</option>
                  </select>
                </td>
              </tr>
              <tr id="giftmsg">
                <td align="right"> Message With Gift <span id="j"  style="text-decoration:underline" ><a onClick="MM_showHideLayers('giftmessage','','show')" style="cursor:pointer">[?]</a></span>:</td>
                <td align="left" nowrap ><input type="text" name="giftmsg"  onClick="javascript:this.value='';return;" value="" size="75" maxlength="245" />
                </td>
              </tr>
              <cfif len(session.mail) and session.mail contains "@">
                <tr>
                  <td align="right"> Debited from Credit<a href="viewinvitecredits.cfm" alt="friends invited for jewelry site">[?]: </a></td>
                  <td align="left"><font color="#CC0000"> -
                    <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="newsubtotal" >
                    <cfinvokeargument name="amounttopay" value="#subtotal#">
                    <cfinvokeargument name="saleitemamount" value="#saletotal#">
                    <cfinvokeargument name="finalize" value="#session.cartid#">
                    <!--- this is basically always 0 but comes into play in confirmation page --->
                    </cfinvoke>
                    </font> (Max debited 20% of current order value)</td>
                </tr>
                <cfelse>
                <tr>
                  <td  align="right" valign="middle" nowrap  ><font color="#000000">Coupon code</font>: </td>
                  <td align="left" valign="left"><input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18">
                  </td>
                </tr>
                <!---	<input name="couponcode" type="hidden" class="inputtext" value="" size="12" maxlength="18"> --->
              </cfif>
            </cfif>
            <cfoutput>
              <input type="hidden"  name="loyaltycredit" value="#decimalformat(evaluate(subtotal - newsubtotal))#">
              <cfset subtotal = newsubtotal />
              <input type="hidden"  name="subTotal" value="#decimalformat(subTotal)#">
            </cfoutput>
            <tr>
              <td colspan=2>&nbsp;</td>
            </tr>
            <tr>
              <!--- Authorize.net logo --->
              <td rowspan="2" align="center" ><cfif cgi.server_name contains "semiprecious.in">
                  <cfelse>
                  <table style="margin:auto" width="120px" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <!---<td align=center><a href="http://www.centraltx.bbb.org/commonreport.html?bid=90026075"><img src="images/bblogo.gif"></a></td>--->

                      <td align="center">
					  
<span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script>
</td>
                    </tr>
                  </table>
                </cfif>
              </td>
              <!--- End Authorize.net logo --->
              <!---  <input name="couponcode" type="hidden" class="inputtext" value="" size="12" maxlength="18"> --->
              <td align='center' valign="middle" ><b><font color="#B00000">Grand Total</font> :</b> $
                <input class="inputtext" name="GrandTotal" type="text"  <CFIF SESSION.MAIL NEQ "ACEMAT@VSNL.COM">onFocus="javascript:this.blur()" </CFIF> value="<cfoutput>#decimalformat(evaluate(subTotal + shipping))#</cfoutput>" size="6" maxlength="9">
                <cfset session.grandtotal = grandtotal>
                <font size=1>(Including Shipping & Tax)</font>             <input type="hidden" name="j" value="<cfoutput>#evaluate(ArrayLen(session.cartitem) - emptyitems)#</cfoutput>">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>&nbsp;&nbsp;<br><img src=/images/checkout.gif onClick="javascript:goProcess('Proceed to Checkout')" style="cursor:pointer"> </td>
            </tr>
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
          </table></td>
      </tr>
    </cfif>
    </TABLE>
    </td>
    </tr>
    <cfoutput>
      <cfif not totalqty>
        <tr>
          <td colspan="6" class="details"> No Item Bought. Click <a href="index.cfm" class="unnamed1" alt="start jewelry shopping">Here</a> to Start Shopping.
            <hr>
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
   expires = "now"
>
            </cfif>
            <br>
            In case your browser has been set not to accept cookies, to order without           cookies, email us item numbers you want and <br>
            we will send you a secure web link to pay for them OR call us at #Application.tollfree# with your item numbers. Cart does not work 	without cookies<br>
            If you think you have cookies ON and empty cart is incorrect please           click <a href="contactus.cfm" target="_self">here</a> and inform us 
            of this error.<br>
            <br>
            <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> . </td>
        </tr>
      </cfif>
      <!---         <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
        <input type="hidden" name="newearned" value="#getcredit1.newearned#"> --->
    </cfoutput>
  </cfform>
  </td>
  </Tr>
  </table>
  <cfelse>
  </td>
  </tr>
  </table>
  <span style="display:block;backgroundColor:yellow;width:400px;margin-top:10px;padding:10px;border:2px red groove;text-align:center;vertical-align:middle;color:#666600;font-size:12px;">Your Cart is empty. Click <a href="simpleloginform.cfm?subcat=silver" class="unnamed1">here</a> to Start 
  Shopping. </span>
  <hr>
  <br>
  In case your browser has been set not to accept cookies and you wish to order without cookies, email us item numbers you want and 
  we will send you a secure web link to pay for them OR call us at <cfoutput>#Application.tollfree#</cfoutput> with your item numbers. Cart does not work without cookies.<br>
  If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error. <br>
  <br>
  <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm">here</a></span>
</cfif>
<cfinclude template="/mainfooter.cfm">
<span style="font-color:white;color:white;">......</span>
</td>
</tr>
</table>
</BODY>
<footer>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
try {
var pageTracker = _gat._getTracker(
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">"UA-12470915-1"<cfelse>
"UA-294143-2"</cfif>);
pageTracker._trackPageview();
} catch(err) {}
</script>

</footer>
</HTML>
