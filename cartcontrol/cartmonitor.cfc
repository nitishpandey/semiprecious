<cfcomponent   displayName="cartmonitor" hint="used for cart status monitoring in cartstatus table">
	<cfinclude template="/includes/udf#session.country#.cfm" />

<cffunction name="sendcartasmail" output="false">
			<cfargument name="cartid" required="true" />
				<cfquery name="qe" datasource="gemssql">
					select buyer from cartstatus where cartid = #arguments.cartid#
				</cfquery>
				<cfhttp url="http://www.semiprecious.com/itemsell.cfm?cartid=#arguments.cartid#&web_store_id=avoid_cartrecover" resolveURL="yes" method="get"  />
					<cfif qe.buyer contains "@" >
							<cfmail server="MailA40" type="html" from = "cs@semiprecious.com" bcc="anup@semiprecious.com"   to="#qe.buyer#"    subject = "Cart Id: #arguments.cartid# Your jewelry order ">
								Your payment at our jewelry store has been confirmed. Please keep this mail for quick and easy reference:
								#replacenocase(replacenocase(cfhttp.filecontent,"AFF","","one"),"PRTLST","","one")#
							</cfmail>
					<cfelse>
						     <cfmail server="MailA40" type="html" from = "cs@semiprecious.com" to="anup@semiprecious.com"      subject = "Your jewelry order ">
								Your payment at our jewelry store has been confirmed. Please keep this mail for quick and easy reference:
								#cfhttp.filecontent#
							</cfmail>
					</cfif>
        	<cfreturn />
			</cffunction>
<cffunction access="public"  name="refund_item" returntype="boolean" hint="called from returns.cfm. does not help in restock. only updates cart related tables"  >
	<cfargument name="cartid" required="true" type="numeric" />
	<cfargument name="itemid" required="true" type="numeric" />
	<cfargument name="qty" required="true" type="numeric" />
	<cfargument name="optionid" required="true" type="numeric" />
	<cfargument name="restock" required="false"  default="true" type="boolean" />
	<cfargument name="shipped" required="false"  default="true" type="boolean" />
	<cfargument name="rate" required="false" type="numeric" default="0" />

	<cftry>
	<cfquery datasource="gemssql" name="brinfor">
 		select quantity,rate from buyingrecord  where cartid = #arguments.cartid# and optionid = #arguments.optionid# and itemid = #arguments.itemid#
	</cfquery>

	    <cfif brinfor.quantity GTE arguments.qty>
				<!---
				<cfquery name="pm" datasource="gemssql" >
					select paymode from cartstatus where cartid = #arguments.cartid#
				</cfquery>
				<cfquery  datasource="gemssql" ><!--- some trigger does not allow qty to change for a paid cart --->
					update cartstatus set paymode = 'null'  where cartid = #arguments.cartid#
				</cfquery>
				<cfquery  datasource="gemssql" >
					update cartstatus set paymode = '#pm.paymode#'  where cartid = #arguments.cartid#
	        	</cfquery>
				--->
				<cfquery  datasource="gemssql" >
				   update buyingrecord set quantity = quantity - #arguments.qty# where cartid = #arguments.cartid#
				   and optionid = #arguments.optionid# and itemid = #arguments.itemid#
			    </cfquery>
				<cfif arguments.rate is 0 >
					<cfset Variables.rate = brinfor.rate />
				<cfelse>
					<cfset Variables.rate = arguments.rate />
				</cfif>
			 <cfif arguments.restock or not (arguments.restock or arguments.shipped)>
				<!--- it has n;t cost us a dime so reduct cost price of the cart --->
						<cfquery datasource="gemssql" name="br">
					 		select basecost from items  where  newitem = #arguments.itemid#
						</cfquery>
						<cfif not(arguments.restock or arguments.shipped) ><!--- true for 0 and 0 only --->
							<cfquery datasource="gemssql">
							       update items set inventory = 0  where  newitem = #arguments.itemid#
							</cfquery>
						<cfelseif (arguments.restock and arguments.shipped)><!--- returned and kept in box --->
						<cfelse><!--- not shipped hence restock in shelf--->
							<cfquery datasource="gemssql">
						       update items set inventory = inventory + #arguments.qty#  where  newitem = #arguments.itemid#
							</cfquery>
						</cfif>
				<cfelse>
					<!--- reund but item not coming back so cart cost price remains  same --->
					<cfset br.basecost = 0 />
				</cfif>
				<cfquery datasource="gemssql" name="brinfor">
			       update cartstatus set cost = cost - #(arguments.qty*Variables.rate)#,  inrcost = inrcost - #(br.basecost*arguments.qty/application.exchangerate)#
				 	where cartid = #arguments.cartid#
				</cfquery>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	   <cfcatch type="any">
		    <cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput>
	   </cfcatch>
	</cftry>
</cffunction>
<cffunction  access="remote" name="testconfirm" hint="called only from confirmation.cfm page for current cartid  " output="false" >
<cfargument name="cartid" required="yes" />
		<cfquery datasource="gemssql" name="cartstatusadd">
		          update cartstatus  set totalqty = -1*totalqty where cartid = '#arguments.cartid#'
	      </cfquery>
         <cfreturn />

</cffunction>
<cffunction name="reduce_item" access="remote" returntype="String"  returnformat="plain"      output="true">
		<cfargument name="itemid" type="numeric" required="true" />
		<cfargument name="qty" type="numeric" required="false" default="0" hint="0 value means remove all" />
		<cfargument name="optionid"  type="numeric" required="false" default="0" />
 	<cftry>
	<!--- cfmx bug , accepts 1a as numeric. wonder what else!! --->
        <cflock scope="SESSION"  timeout="30" type="EXCLUSIVE"  throwontimeout="no" >
		<cfset bugvar = arguments.quantity & 'b'><!--- force a string var --->
	  	<cfif find('a',bugvar) or arguments.quantity LT 0 >
    	    <cfthrow detail="not a valid/numeric qty" errorcode="404" message="Please enter a valid numeric qty." type="custom" />
        </cfif>
		   <Cfif session.cartitem[1][1]  >
				    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
			           <cfif session.cartitem[j][1] eq Arguments.itemid and  session.cartitem[j][5] eq Arguments.optionid >
			    		  <cfset point = j />
							  <cfif (arguments.quantity is 0) or (arguments.quantity GTE session.cartitem[point][4])>
	                              <cfset arguments.quantity = session.cartitem[j][4] />
                              </cfif>
                          </cfif>
                     </cfloop>

                      	  <cfset session.grandtotal = session.grandtotal - session.cartitem[point][3]*(arguments.quantity) />
						  	<cfset session.totalqty = session.totalqty - Arguments.quantity />
							 	<cfif Arguments.quantity eq Session.cartitem[point][4] >
                                         <cfquery datasource="gemssql" name="updatecart">
                                              delete from buyingrecord where itemid = '#session.cartitem[point][1]#' and cartid = '#session.cartid#' and optionid = '#session.cartitem[point][5]#'
                                        </cfquery>
	                                 	 <cfif arraylen(session.cartitem) is 1>
                                                           <cfset session.cartitem[1][1] = 0 />
                                                          <cfquery datasource="gemssql" >
                                                                  update cartstatus set indate  =  #now()# , paymode ='emptied' where cartid = '#session.cartid#' and paymode = 'null'
                                                          </cfquery>

                                                                <cfset client.cfcartid = 0 />
                                                               <cfset session.cartid = 0 />
                                                               <cfset session.grandtotal = 0.00 />
                                           <cfelse>
                                                <cfset oms = arrayDeleteAt(session.cartitem,point) />
                                        </cfif>

                                   <cfelse>
                                               <cfset session.cartitem[point][4] = session.cartitem[point][4] - Arguments.quantity />
                                        <cfquery datasource="gemssql" name="updatecart">
                                              update buyingrecord set quantity = #session.cartitem[point][4]# where itemid = '#session.cartitem[point][1]#' and cartid = '#session.cartid#' and optionid = '#session.cartitem[point][5]#'
                                        </cfquery>
                               	 </cfif>
							<cftry>
							<cfquery datasource="gemssql" >
							   		update cartstatus set noofsaleitems  = noofsaleitems + #arguments.quantity# where cartid = #session.cartid#
						   </cfquery>
						   <cfcatch type="any">
						   <!--- this cftry is put here since this new additive SQL does not cater for earlier sessions that have null in that column --->
						   </cfcatch>
						   </cftry>

                        <!--- removed by Anup, 5/28/2012 <cfinvoke component="cartcontrol.cartmonitor" method="compute_shipping" returnvariable="os" >
                               <cfinvokeargument name="items_total" value="#session.grandtotal#" />
                               <cfinvokeargument name="country_code" value="#session.address.country_code#" />
                           </cfinvoke>--->
	      		      <cfelse>
                        <cfset quantity = 0 /><!--- 0 in quantity indicates failure to add or remove the item to cart --->
                    </cfif>
                <cfcontent type="text/html" />
                <cfxml variable="jumanjee" >
                <response>
                <localmethod>reduce_item</localmethod>
                <item>
                <optionid>#Arguments.optionid#</optionid>
                <qty>#Arguments.quantity#</qty>
                <itemid>#Arguments.itemid#</itemid>
                </item>
                <cart>
                    <currency>#session.currency#</currency>
                    <country_code>#session.address.country_code#</country_code>
                    <cartid>#session.cartid#</cartid>
                    <grandtotal>#decimalformat(value_convert(session.grandtotal))#</grandtotal>
                    <totalqty>#session.totalqty#</totalqty>
                    <shipping>#decimalformat(value_convert(os))#</shipping>

                </cart>
                </response>
                </cfxml>
					<cfset myResult= "#quantity#">
                <cfreturn jumanjee />
            </cflock>
                <cfcatch type="any">
                    <cfreturn cfcatch.detail />
                    <cfoutput>#cfcatch.Message#</cfoutput>
                        <cfset myResult = "0">
                        <cfcontent type="text/html" />
                </cfcatch>
			</cftry>

	</cffunction>
<cffunction name="compute_shipping" access="PUBLIC" description="called from cart" output="NO" returntype="NUMERIC" >
       <cfargument name="items_total"  required="YES"  type="NUMERIC" hint="the amount of purchase. not useful for ws " />
       <cfargument name="country_code"  required="YES" hint="no USA default to avoid oversight" />
          <!--- compute new standard shipping . code picked from cart. should be abstracted into one page compute_shipping.cfm --->
                           	     <cfif len(session.bulkbuyer.id) >
									<cfif country_code is "USA" or country_code is "AU" >
                                         <cfset shipping=9.99 />
                                    <cfelse>
                                         <cfset shipping=25 />
                                    </cfif>
	                            <cfelse>
                                <cfif country_code is "USA" or country_code is "AU"  >
                                    <cfif items_total  GTE application.retail_free_shipping>
                                        <cfset shipping=0 />
                                    <cfelse>
                                        <cfset shipping = 4.99 />
                                    </cfif>
                                  <CFELSE>
                                    <cfif items_total  GTE application.retail_free_shipping>
                                        <cfset shipping=14.99 />
                                    <cfelse>
                                        <cfset shipping = 24.99 />
                                    </cfif>
                                </CFIF>

                               </cfif>
                   <cfreturn shipping />
          </cffunction>

<cffunction  access="remote" name="emptycart" hint="called only from cart.cfm page for current cartid  and then back to cart page. reuses current cartid" output="false" >
		<cfargument name="next_visual" default="#session.cart#" type="string"    required="false" />

			<CFSET session.cartitem=ArrayNew(2)  />
			<Cfset session.cartitem[1][1] = 0  />
			<Cfset session.cartitem[1][4] = 0  />
			<Cfset session.cartitem[1][2] = 0  />
			<Cfset session.cartitem[1][3] = 0  />
			<cfset session.totalqty = 0>
			<cfset session.grandtotal = 0>
		<!--- we are making cartid 0 to make a consistent status that cartid 0 and empty cart is always true in both directions --->
		<cfquery datasource="gemssql" name="cartstatusadd">
		          select paymode from cartstatus  where cartid = '#session.cartid#' and paymode = 'null' and cost = '0'
	      </cfquery>

		  <cfif cartstatusadd.RecordCount>
			  <cfquery datasource="gemssql" >
			          update cartstatus set indate  =  #now()# , paymode ='emptied' where cartid = '#session.cartid#'
		      </cfquery>
			<cfquery datasource="gemssql" name="eck">
	               delete  FROM buyingrecord WHERE cartid = '#session.cartid#'
	        </cfquery>
		</cfif>
		  <cfset session.cartid = 0 />
		      <cfset client.cfcartid = 0 />
		  <cflocation addtoken="no" url="/#arguments.next_visual#"  />
		 <cfreturn />
	</cffunction>

	<cffunction name="new_cartid" access="remote" hint="requires that session.mail,session.bulkbuyer.id and session.country be defined before this is called" returnType="string"  output="false">
	<cfargument name="reuse_cartid" default="0" type="numeric"    required="false" />
	<cfargument name="web_store_id" default="" type="string"    required="false" />
 	<cfif arguments.reuse_cartid>
		<cfquery datasource="gemssql" name="cartstatusadd">
		        update cartstatus set indate  =  #now()# , status = 'new', cost = '0' where cartid = '#session.cartid#'
	     </cfquery>
	     <cfset session.cartid = arguments.reuse_cartid />

	<cfelse>
    	<cfif isDefined('form.x_invoice_num')>
            <cfquery datasource="gemssql" name="qryCheckPayMode">
                    select paymode,cartid
                    from cartstatus
                    where cartid = #form.x_invoice_num#
            </cfquery>
        </cfif>
		<cfif IsDefined('qryCheckPayMode') AND qryCheckPayMode.paymode eq 'null'>
            <cfset session.cartid = qryCheckPayMode.cartid />
        <cfelse>
            <cflock name="setcartid" type="exclusive" timeout="110">
                <cfset application.cartid = application.cartid + 1 />
                <cfset session.cartid = application.cartid >
                <cfoutput>#session.cartid#</cfoutput>
                <cfif arguments.web_store_id is 'nari'>
                    <cfset cc = 'nari' />
                    <cfset session.mail = 'franchisee@naristore.com' />
                        <cfquery datasource="gemssql" name="cartstatusadd">
                                 INSERT INTO cartstatus (cartid,couponcode, status, paymode, cost, indate, buyer,noofsaleitems,totalqty)
                                  VALUES ('#session.cartid#','#cc#', 'new', 'null', '0', #now()#, '#session.mail#',0,0)
                        </cfquery>
                    <cfabort />
                </cfif>
            </cflock>
            <cfif len(session.bulkbuyer.id)>
                <cfset cc = 'regwsale' />
            <cfelseif session.country is 'india'>
                <cfset cc = 'india' />
            <cfelse>
                <cfset cc = '' />
            </cfif>
            <cftry>
                <cfquery datasource="gemssql" name="cartstatusadd">
                         INSERT INTO cartstatus (cartid,couponcode, status, paymode, cost, indate, buyer,noofsaleitems,totalqty)
                         VALUES ('#session.cartid#','#cc#', 'new', 'null', '0', #now()#, '#session.mail#',0,0)
                </cfquery>
                <cfcatch type="any">
                    <cfdump var=#arguments# />
                    <cfdump var=#session# />
                </cfcatch>
            </cftry>
            <cfif isdefined("session.confirmed_cartid")><!--- coming from confirmation page  --->
                <cfset k = structDelete(session,"confirmed_cartid")/> <!--- don't need to come here every time --->
                <cfif session.cartitem[1][1]>
                    <cftry>
                        <cfif session.country is 'india'>
                            <cfset country_factor =	application.exch["india"]/application.exch["row"] />
                        <cfelse>
                            <cfset country_factor = 1 />
                        </cfif>
                        <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">
                               <cfquery datasource="gemssql" name="updatecart">
                                                INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
                                                VALUES ('#session.mail#', #session.cartitem[jc][1]#, #session.cartitem[jc][4]#, #session.cartid#, #session.cartitem[jc][5]#, #country_factor*session.cartitem[jc][3]# )
                                </cfquery>
                         </cfloop>
                        <cfquery datasource="gemssql" name="MOOSTATUS">
                            update buyingrecord
                            set makeondemand=1
                            from buyingrecord, items
                            where items.newitem=buyingrecord.itemid
                            and cartid=#session.cartid# and inventory < 1
                            and orderonrequest=1
                        </cfquery>
                        <cfcatch type="any">
                            <cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput>
                        </cfcatch>
                    </cftry>
                </cfif>
            </cfif>
        </cfif>
	 </cfif>
   <!--- <cfcookie expires="now"  name="cartid"  />  --->
   	<cfcookie name="cartid" value="#session.cartid#" expires="29"  />
	<cfset client.CFCARTID = session.cartid />
	<cfreturn session.cartid />

	</cffunction>


	<cffunction access="public" name="get_quantity" returntype="Numeric" hint="returns total count of items in cart. generates new cart id if new cart id being generated and updates in cart table">
	<cfargument name="shipping_details" type="string" hint="cgi and script name combo; helps know where it all started" />

	<cftry>
		<cfif session.cartitem[1][1]><!--- cart has stuff, make sure it is put in the db with current cart id (could be returning from confirm page and hence got a new cart id ) --->
			<cfif session.cartid is 0 >
	        	<cfinvoke  method="new_cartid" />
			</cfif>
				<cfset var vQty = 0 />
	              <cfloop index="vCount" from="1" to="#ArrayLen(session.cartitem)#">
	                   <cfset vQty = vQty + session.cartitem[vCount][4] />
	             </cfloop>
	      <!---   tells where the person is right now; quite unnecessary and slows down the system
		   	<cfquery datasource="gemssql" >
		    		update cartstatus set	shippingdetails = '#argument.shipping_details#' where cartid = #session.cartid#
				</cfquery> --->
     	</cfif>

		<cfcatch type="any">
			<cfrethrow />
		</cfcatch>
		</cftry>
<cfreturn vQty />
	</cffunction>

<cffunction name="visit_email" access="remote" returntype="any"  output="true">
	<cfargument name="visit_email_"  required="true" />
	<cfargument name="cartid"  required="no" default="#session.cartid#" />

		<cfquery datasource="gemssql">
			update cartstatus set buyer = '#arguments.visit_email_#' where cartid = #arguments.cartid#
		</cfquery>

	<cfreturn 1 />
</cffunction>

<cffunction name="latestcartid" access="remote"  output="true">
	<cfargument name="status" default="new" required="false" />
   <cfquery datasource="gemssql" name="s">
 	select cartid from cartstatus where indate > #createodbcdate(dateadd('d',-15,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  <cfswitch expression="#Arguments.status#" ><cfcase value="new" > or  paymode in ('authphone', 'auth.net','pp','chck') </cfcase></cfswitch> order by
	cartid desc
	</cfquery>
  <cfcontent type="text/xml" />
<!--- why this pi is not welcome? is the server sending on its own?   <?xml version="1.0" ?> --->
  <response><localmethod>latestcartid</localmethod><latestpaidcartid>#s.cartid#</latestpaidcartid></response>
		<cfset myResult="foo">
	<cfreturn />
	</cffunction>

<cffunction name="additem" access="remote" returntype="String"  returnformat="plain"      output="true">
	<cfargument name="newitem" type="numeric" required="true" />
	<cfargument name="quantity" type="numeric" required="true" />
	<cfargument name="cartid"  hint="Required for remote calls or admin actions that do not have session continuity. In server calls will not pass in this value while others will give a non-zero" type="numeric" required="false" default="0" />
	<cfargument name="web_store_id" default="" type="string"    required="false" />
	<cfargument name="price" type="numeric" required="false" default="0" />
	<cfargument name="category" type="string" required="false" default="" />
   	<cfargument name="mail" type="string" required="false" default="#session.mail#" />
	<cfargument name="optionid"  type="numeric" required="false" default="0" />
	<cfargument name="add_to_db"  type="numeric" required="false" default="1" hint="if you want to add to session only and not to db, used when reusing existing buying record entries" />
	<cfargument name="check_inv" hint="makes sure to add only the qty available in stock or less"  type="numeric" required="false" default="1" />

	 <cftry>
           <cflock scope="SESSION"  timeout="30" type="EXCLUSIVE"  throwontimeout="no" >
		<cfif (not isnumeric(arguments.quantity)) or arguments.quantity LT 0 >
    	    <cfthrow detail="not a valid qty" errorcode="501" message="Please enter a valid numeric qty." type="custom" />
        </cfif>

		<cfif arguments.quantity >
			<cfif  not isdefined("session.cartid")><!--- this is not expected actually --->
	    		<cfinvoke method="new_cartid"  />
	         <cfelseif   session.cartid is 0>
					<cfif arguments.cartid is 0 >
		         			<cfinvoke method="new_cartid"  />
		                    <cfset arguments.cartid = session.cartid />
						<cfelse>
							 <cfquery datasource="gemssql" name="storecheck">
									select couponcode from cartstatus where cartid = #arguments.cartid#
							 </cfquery>
							<cfif (storecheck.couponcode neq arguments.web_store_id) and (session.mail neq application.admin_email)>
								 <!--- need to put a check here that provided number is a valid number so that it does not screw up existing carts --->
						    	<cfreturn 0 />
							</cfif>
					</cfif>
	<!---     <cfif isdefined("cookie.cartid")> if there would be 0 cartid implies that session_startup did not find any cookie so why check here again
			 <cfinclude template="/includes/cartfromcookie2.cfm" />
		 </cfif> --->
		 <cfelse>
		  <cfset arguments.cartid = session.cartid />
		</cfif>
 	</cfif>

 	<cftry>
		<cfquery datasource="gemssql" name="qprice">
			select  cat, inventory ,wholesaleprice, price,saleprice,status from items where newitem = #Arguments.newitem#
		 </cfquery>
	 	<cfset ab = qprice.inventory />
		<cfif arguments.quantity >
		  	<cfif arguments.check_inv>
					<cfinvoke method="item_in_cart_inventory" component="cartmonitor" returnvariable="can_add" >
						<cfinvokeargument name="newitem" value="#arguments.newitem#" />
						<cfinvokeargument name="optionid" value="#arguments.optionid#" />
						<cfinvokeargument name="qty" value="#arguments.quantity#" />
					</cfinvoke>
				<cfif arguments.quantity neq can_add >
					<cfif arguments.add_to_db is 0 >
						  <cfif can_add neq 0>
			                	 <cfquery datasource="gemssql" name="updatecart">
								        UPDATE buyingrecord      SET quantity = #can_add#
								                WHERE cartid='#arguments.cartid#'
								                AND itemid =#arguments.newitem#
										        AND optionid=#arguments.optionid#
					            </cfquery>
		        	    <cfelse>
					          <cfquery datasource="gemssql" name="updatecart">
								delete from buyingrecord
								                WHERE cartid='#arguments.cartid#'
								                AND itemid =#arguments.newitem#
										         AND optionid=#arguments.optionid#
					            </cfquery>
				        </cfif>
 					</cfif>
				</cfif>
				<cfset arguments.quantity = can_add />
			<!--- the quantity that can be added, could be even 0 . will not enter add remove loop--->
			<cfelse>
				<cfset can_add = arguments.quantity  />
		  </cfif>
		<cfelse>
			<cfset can_add = 1 /><!--- we need can_add = 1 when quantity is 0 for removing the item. the differentiation is done after entering the can_add loop --->
		</cfif>
	<cfif can_add >
		<cfif arguments.quantity><!--- if it is a real add operation, not a remove operation and permitted quantity is GT 0--->
	<cfif Arguments.price is 0>
	 <cfif  len(session.bulkbuyer.id)>
		<cfset arguments.price = qprice.wholesaleprice />
	 <cfelse>
 		<cfif qprice.status eq 3>
			<cfset Arguments.price = qprice.saleprice*session.sale_factor />
		<cfelse>
			<cfset arguments.price = qprice.price />
		</cfif>
	</cfif>
	<!--- discover price from sql --->
  </cfif>
  <cfif Arguments.optionid>
	  	  <cfquery datasource="gemssql" name="opts">
      		select description,  valueadd from options where itemid = #Arguments.newitem# and optionid = #Arguments.optionid#
				</cfquery>
				<cfif isnumeric(opts.valueadd)>
				 	<cfif len(session.bulkbuyer.id)>
						 <cfset Arguments.price = Arguments.price + opts.valueadd/2>
					 <cfelse>
				 		<cfset Arguments.price = Arguments.price + opts.valueadd>
					</cfif>

				</cfif>
	  </cfif>
	 <cfset Arguments.category = qprice.cat >
	<cfif session.country is 'india'>
        <cfset country_factor = 			 		application.exch["india"]/application.exch["row"] />
  <cfelse>
  <cfset country_factor = 1 />
  </cfif>

<Cfif session.cartitem[1][1] EQ 0 >
<cfset j = 1 />
<cfif session.mail neq application.admin_email ><!--- for every one except admin mail, switch off --->
      	<cfset session.desc_flag = 0 />
	</cfif>
	      <CFSET session.cartitem[1][1] =Arguments.newitem>
		  <CFSET session.cartitem[1][2] = Arguments.category>
		  <CFSET session.cartitem[1][3] =Arguments.price>
		  <CFSET session.cartitem[1][4] =Arguments.quantity>
		  <CFSET session.cartitem[1][5] =Arguments.optionid>
		  <cfif arguments.add_to_db>
			  <!--- a delete query added here because a session less add would result always in an insert. Then when we have same item already in DB for this cartid an insert would create PK error. Hence a delete, which is redundant for a session full case --->
		             <cfquery datasource="gemssql" >
					delete from buyingrecord
					                WHERE cartid='#arguments.cartid#'
					                AND itemid =#arguments.newitem#
							         AND optionid=#arguments.optionid#
		            </cfquery>

				  <cfquery datasource="gemssql" name="updatecart">
					   INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
				                    VALUES ('#arguments.mail#', #session.cartitem[j][1]#, #session.cartitem[j][4]#, #arguments.cartid#, #session.cartitem[j][5]#, #country_factor*session.cartitem[j][3]# )
				 </cfquery>

				<cfquery datasource="gemssql" >
				   	 update cartstatus set totalqty  = #arguments.quantity# where cartid = #arguments.cartid#
			   </cfquery>

		 </cfif>
 <cfset added = 1>
  <cfelse>
<cfset added = 0>
	   <cfif arguments.add_to_db ><!--- if there is no add to db implies we would have the necessary design arelady in session and also removed common items from DB already and no need to compare with session. --->
			    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
		           <cfif session.cartitem[j][1] eq Arguments.newitem and  session.cartitem[j][5] eq Arguments.optionid >
		    		   	  <cfset session.grandtotal = session.grandtotal - session.cartitem[j][3]*session.cartitem[j][4] />
						  <cfset session.totalqty = session.totalqty - session.cartitem[j][4] />
					      <cfset quty = Arguments.quantity - session.cartitem[j][4] />
						 <CFSET session.cartitem[j][2] =Arguments.category> <!--- only qty is required but cate and price are reentered just to make sure --->
		                 <CFSET session.cartitem[j ][3] =Arguments.price>
		                 <CFSET session.cartitem[j][4] =Arguments.quantity>
						 <CFSET session.cartitem[j][5] =Arguments.optionid>
					 <cfquery datasource="gemssql" name="updatecart">
					        UPDATE buyingrecord      SET quantity = '#session.cartitem[j][4]#' <cfif session.mail neq "">, email='#arguments.mail#'</cfif>
					                WHERE cartid='#arguments.cartid#'
					                AND itemid ='#session.cartitem[j][1]#'
							         AND optionid=#session.cartitem[j][5]#
		            </cfquery>

						   <cftry>
						 <cfquery datasource="gemssql" >
						   		update cartstatus set totalqty  = totalqty + #quty# where cartid = #arguments.cartid#
					   </cfquery>
						<cfcatch type="any">
						   <!--- this cftry is put here since this new additive SQL does not cater for earlier sessions that have null in that column--->
						   <cfoutput>#cfcatch.message#,#cfcatch.detail# ....</cfoutput><cfabort />
                           </cfcatch>
						   </cftry>
				  		<cfset added = 1>
					<cfbreak />
		      	</CFIF>
			  </cfloop>
	  </cfif>
	       <cfif not added>
<!---New Added
<cfoutput>#arraylen(session.cartitem)#</cfoutput> --->
		 <cfset cartal = arraylen(session.cartitem) + 1>
	     <CFSET session.cartitem[cartal][1] = Arguments.newitem>
         <CFSET session.cartitem[cartal][2] = Arguments.category>
         <CFSET session.cartitem[cartal][3] = Arguments.price>
         <CFSET session.cartitem[cartal][4] = Arguments.quantity>
		 <CFSET session.cartitem[cartal][5] = Arguments.optionid>
		  <cfif arguments.add_to_db>
					 <CFSET J = CARTAL />
					     <cfquery datasource="gemssql" name="updatecart">
				   INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
				                    VALUES ('#arguments.mail#', #session.cartitem[j][1]#, #session.cartitem[j][4]#, #arguments.cartid#, #session.cartitem[j][5]#, #country_factor*session.cartitem[j][3]# )
				 </cfquery>
				</cfif>
				<cftry>
				<cfquery datasource="gemssql" >
				   		update cartstatus set totalqty  = totalqty + #Arguments.quantity# where cartid = #arguments.cartid#
			   </cfquery>
			   <cfcatch type="any">
						   <!--- this cftry is put here since this new additive SQL does not cater for earlier sessions that have null in that column--->
						<cfoutput>#cfcatch.message#,#cfcatch.detail#</cfoutput><cfabort />

                           </cfcatch>
						   </cftry>

  		   <cfset added = 1>
      </cfif>
	  </Cfif>


	  	    <cfset session.grandtotal = session.grandtotal + Arguments.price*Arguments.quantity />
	  	    <cfset session.totalqty   = session.totalqty + Arguments.quantity  />
<!--- a very bad design but anyway . will change later but
we know that right now this code is being called only by ajax code

<cfset session.ajaxcheck = 1>
--->
	 <cfelse>
	   <cfset quantity = -1000 /><!---- -10000 indicates failure to remove --->
	   	   <Cfif session.cartitem[1][1]  >
				    <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
			           <cfif session.cartitem[j][1] eq Arguments.newitem and  session.cartitem[j][5] eq Arguments.optionid >
			    		   	  <cfset session.grandtotal = session.grandtotal - session.cartitem[j][3]*session.cartitem[j][4] />
							  <cfset session.totalqty = session.totalqty - session.cartitem[j][4] />
							  <cfset quantity = 0 - session.cartitem[j][4] />
					        <cfquery datasource="gemssql" name="updatecart">
				              delete from buyingrecord where itemid = '#session.cartitem[j][1]#' and cartid = '#arguments.cartid#' and optionid = '#session.cartitem[j][5]#'
				            </cfquery>
							<cftry>
							<cfquery datasource="gemssql" >
							   		update cartstatus set noofsaleitems  = noofsaleitems + #session.cartitem[j][4]# where cartid = #arguments.cartid#
						   </cfquery>
						   <cfcatch type="any">
						   <!--- this cftry is put here since this new additive SQL does not cater for earlier sessions that have null in that column --->
<cfoutput>#cfcatch.message#,#cfcatch.detail#</cfoutput><cfabort />
                           						   </cfcatch>
						   </cftry>
			   <cfset session.cartitem[j][4] = 0 />

					    	<cfif arraylen(session.cartitem) is 1>
										   <cfset session.cartitem[1][1] = 0 />
			                    		  <cfquery datasource="gemssql" >
										          update cartstatus set indate  =  #now()# , paymode ='emptied' where cartid = '#arguments.cartid#' and paymode = 'null'
									      </cfquery>


          		<cfset client.cfcartid = 0 />
								       <cfset session.cartid = 0 />
                                	   <cfset session.grandtotal = 0.00 />
								   <cfelse>
								  	<cfset oms = arrayDeleteAt(session.cartitem,j) />
							  </cfif>
					     							<cfbreak />
			      	</CFIF>
				  </cfloop>
				  <cfelse>
				  		             <cfquery datasource="gemssql" >
					delete from buyingrecord
					                WHERE cartid='#arguments.cartid#'
					                AND itemid =#arguments.newitem#
							         AND optionid=#arguments.optionid#
		            </cfquery>

				  <cfset quantity = 0 />
		  </cfif>

	</cfif>
<cfelse>
	<cfset quantity = 0 /><!--- 0 in quantity indicates failure to add or remove the item to cart --->
</cfif>
			<cfcontent type="text/html" />
			<cfxml variable="jumanjee" >
			<response>
			<localmethod>additem</localmethod>
			<newitem>
			<optionid>#Arguments.optionid#</optionid>
			<qtyadded>#quantity#</qtyadded>
			<qtyinstock>#ab#</qtyinstock>
			<itemnumber>#Arguments.newitem#</itemnumber>
			</newitem>
			<cart>
			    <currency>#session.currency#</currency>
                <country_code>#session.address.country_code#</country_code>
				<cartid>#arguments.cartid#</cartid>
				<grandtotal>#format(session.grandtotal)#</grandtotal>
				<totalqty>#session.totalqty#</totalqty>
			</cart>
			</response>
			</cfxml>
					<cfset myResult= "#quantity#">
			<cfreturn jumanjee />
			<cfcatch type="any">
           	<cfmail to="stacyanup@gmail.com" from="cs@semiprecious.com" subject="add item issue 1 "  type="html">
  							#cfcatch.detail#, #cfcatch.message# #cgi.script_name#.
				</cfmail>
			</cfcatch>
			</cftry>
	</cflock>
<cfcatch type="any">
			<cfmail to="stacyanup@gmail.com" from="cs@semiprecious.com" subject="add item issue 2"  type="html">
  							#cfcatch.detail#, #cfcatch.message# #cgi.script_name#.
				</cfmail>
</cfcatch>
	</cftry>
 </cffunction>

<cffunction name="addShippingDetail" hint="called from confirmation.cfm" returntype="string"   access="public">
	<cfargument name="cartid" type="string" required="true" >
    <cfargument name="shippingaddress" type="string" required="true" />
    <cfargument name="shippingaddress2" type="string" required="false" default=" " />
    <cfargument name="shippingcity" type="string" required="true">
    <cfargument name="shippingstate" type="string" required="true">
    <cfargument name="shippingzip" type="string" required="true">
    <cfargument name="shippingcountry" type="string" required="true">
    <cfargument name="shippingname" type="string" required="true">
		<cfargument name="comments" type="string" required="true">

	  <CFQUERY DATASOURCE="gemssql" NAME="shipin">
select count(*) from        purchase     WHERE cartid='#Arguments.cartid#'
</cfquery>
<cfif shipin.recordcount is 0>
	  <CFQUERY DATASOURCE="gemssql" NAME="addShippingDetail">

        INSERT INTO purchase (cartid,firstname, address1,address2,  city, state,zip, country, comments)
        VALUES ('#Arguments.cartid#', '#Arguments.shippingname#','#Arguments.shippingaddress#', '#Arguments.shippingaddress2#',
        		'#Arguments.shippingcity#', '#Arguments.shippingstate#','#Arguments.shippingzip#', '#Arguments.shippingcountry#', '#Arguments.comments#')
    </cfquery>
</cfif>

</cffunction>

<!--- changes by ankur --->
<cffunction name="addpurchase" hint="called from return urls of paypal and auth.net" returntype="string"   access="public">
        <cfargument name="cartid" type="string" required="true" >
        <cfargument name="shippingaddress" type="string" required="true" />
        <cfargument name="shippingaddress2" type="string" required="false" default=" " />
        <cfargument name="shippingcity" type="string" required="true">
        <cfargument name="shippingstate" type="string" required="true">
        <cfargument name="shippingzip" type="string" required="true">
        <cfargument name="shippingcountry" type="string" required="true">
        <cfargument name="shippingname" type="string" required="true">
        <cfargument name="billingname" type="string" required="false" default=" ">
        <cfargument name="email" type="string" required="false" default="">
        <cfargument name="billingaddress" type="string" required="false" default="NA">
        <cfargument name="billingcity" type="string" required="false" default="NA">
        <cfargument name="billingstate" type="string" required="false" default="NA">
        <cfargument name="billingzip" type="string" required="false" default="NA">
        <cfargument name="billingcountry" type="string" required="false" default="NA">
        <cfargument name="billingphone" type="string" required="false" default="NA">
				<cfargument name="comments" type="string" required="false" default="NA">

		<!--- firstname in purchase table store ship to name, and last name stores billing name
		commented out by Anup - 01/20/10, commented back in by Anup 4 April 2010--->
		<cfif arguments.email contains "/"> <!--- happens when you udpate and the email is existing in cartid/email format --->
            <cfset arguments.email = listgetat(arguments.email,2,"/") />
        </cfif>
        <CFQUERY DATASOURCE="gemssql" NAME="qryGetShipDetail">
        	SELECT	firstname
            FROM	purchase
            WHERE	cartid = '#Arguments.cartid#'
        </CFQUERY>

        <cfif qryGetShipDetail.recordcount eq 0>
        	<CFQUERY DATASOURCE="gemssql" NAME="addPurchase">
				INSERT INTO
                purchase (ship,email, cartid, lastname, billingaddress1, billingcity,billingstate,billingcountry,phonenumber,
                          firstname, address1,address2,  city, state,zip, country, comments)
				VALUES (0,'#Arguments.cartid#/#Arguments.email#','#Arguments.cartid#',
                       '#Arguments.billingname#','#Arguments.billingaddress#','#Arguments.billingcity#',
                       '#Arguments.billingstate# #Arguments.billingzip#','#Arguments.billingcountry#',
                       '#Arguments.billingphone#','#Arguments.shippingname#','#Arguments.shippingaddress#',
                       '#Arguments.shippingaddress2#', '#Arguments.shippingcity#',  '#Arguments.shippingstate#',
                       '#Arguments.shippingzip#', '#Arguments.shippingcountry#', '#Arguments.comments#')
            </CFQUERY>
        <cfelse>
            <CFQUERY DATASOURCE="gemssql" NAME="addPurchase">
                UPDATE	purchase
                SET		ship = 0,
                        email = '#Arguments.cartid#/#Arguments.email#',
                        lastname = '#Arguments.billingname#',
                        billingaddress1 = '#Arguments.billingaddress#',
                        billingcity = '#Arguments.billingcity#',
                        billingstate = '#Arguments.billingstate# #Arguments.billingzip#',
                        billingcountry = '#Arguments.billingcountry#',
                        phonenumber = '#Arguments.billingphone#'
                WHERE	cartid = '#Arguments.cartid#'
            </cfquery>
        </cfif>
</cffunction>


<cffunction access="public" name="setbuyeremail"  >
<cfargument name="email" required="true" >
<cfargument name="cartid" required="true" >
<cfargument name="overwrite" required="false"  default="no" type="boolean">
<cfset flag = 0>
<cfif arguments.overwrite>
<cfset flag = 1>
<cfelse>
<cfquery datasource="gemssql" name="test">
      select buyer from cartstatus  where cartid = #Arguments.cartid#
	  </cfquery>
	<cfif (not find('@',test.buyer)) or test.buyer is 	application.wholesale_guest >
		<cfset flag = 1>
	</cfif>
</cfif>

<cfif flag>
<cftry>
<cfquery datasource="gemssql">
      update cartstatus set buyer = '#Arguments.email#' where  cartid = #Arguments.cartid#
</cfquery>
<cfquery datasource="gemssql">
update buyingrecord set email = '#Arguments.email#' where   cartid = #Arguments.cartid#
</cfquery>

      <cfcatch type="Any">

  <cfmail server="MailA40" from="service@semiprecious.com" timeout="30" to="nitish@semiprecious.com"   subject="cartmonitor set buyer email Confirmation" type="HTML" >
     <cfdump var="#cfcatch#" />
   </cfmail>

    </cfcatch>
</cftry>

</cfif>


</cffunction>
   <cffunction name="newcart" displayName="add a new cartid" hint="adds a new cart with status new" access="public" output="true">
	    <cfargument name="cartid" displayName="cartid" hint="no hint" type="numeric" required="false" default="#session.cartid#" />
	    <cfargument name="costprice" displayname="cost price" default="0" type="numeric" />
	    <cfargument name="timestamp"  required="true" displayname="Date time of cart initiation" />
		<cfargument name="tps" required="true" default="n" hint="Is it a third party sale? y or n" displayname="thirdpartysale" />
		<cfargument name="shipping"  required="true" displayname="Shipping and Handling Details" />
	    <cfargument name="cost" displayName="cost" hint="total selling price of the shipment" type="numeric" />
	    <cfargument name="saving" displayName="discount" hint="absolute discount that has been given on this cart" type="numeric" default="0" required="true" />
	    <cfargument name="couponcode" displayName="couponcode" hint="no hint" type="string" default="none">
	    <cfargument name="saleitems" displayName="saleitems" hint="qty of items with sale status" type="numeric" default="0" />
	    <cfargument name="tqty" displayName="no of items" hint="qty of items" type="numeric" default="1">
    	<cfset indate = #arguments.timestamp#>
   		<cfset result = 0> <!--- newcart body
<CFPARAM name="check1.buyer" default="anup@semiprecious.com"> --->
	<cftransaction action="begin" > <!--- we saw an event for a cart that the cartstatus entry was missing. Implying that the delete stmt ran but not the insert stmt. To avoid this we are
putting the two in a txn claus. The other options is to just use an update as is done after and outside this txn clause. We are choosing to do both. This is because
we cannot assume that this method is invoked only for an existing cart. If the cart does not exist then an update will fail. If the cart does exist then
in case the insert fails for whatever reason then whether then delete would be rolled back and update would work. Of course again an update would fail when
txn fails and also cart does not exist from before 03 Aug 2010--->
	  	<cfquery datasource="gemssql" >
	    	delete from cartstatus where cartid = #arguments.cartid#
	    </cfquery>
       <cfquery datasource="gemssql" >
		    insert into cartstatus (buyer,tps,totalqty,cartid,shippingdetails,status,inrcost,cost,couponcode,noofsaleitems,paymode,indate)
		    values ( '#session.mail#','#arguments.tps#',#arguments.tqty#,#arguments.cartid#,'#Arguments.shipping#', 'new',#Arguments.costprice#,#arguments.cost#,'#arguments.couponcode#',#arguments.saleitemsno#,'null',#indate#)
	   </cfquery>
		<cfset result = 1>
  </cftransaction>
  <!-- <cfoutput>#arguments.saving#,#arguments.cost#, #arguments.couponcode# kll</cfoutput> -->
    <!---   <cfquery datasource="gemssql" >
   update cartstatus set buyer = '#session.mail#',tps = '#arguments.tps#',totalqty = #arguments.tqty#      ,shippingdetails = '#Arguments.shipping#',status = 'new',inrcost = #Arguments.costprice#,cost = #arguments.cost#,
      couponcode = '#arguments.couponcode#',noofsaleitems = #arguments.saleitemsno#,paymode = 'null',indate = #indate# where cartid = #arguments.cartid#

   </cfquery> --->

	<cfreturn result/>
  </cffunction>
  <cffunction name="expire" access="public" hint="This first lists the candidates and then on confirmation expires them" output="true">
    <cfargument default="32" required="false" type="numeric" name="age" displayname="time period for expiry" >
    <cfargument required="false" type="string" name="commit" displayname="Tell wether list or commit ">
    <cfset refdate = createodbcdate(Dateformat(dateadd('d',-1*Arguments.age,now()),'yyyy-mm-dd'))>
    <cfif isdefined("Arguments.commit")>
      Not done for now, just a dry run. The query run would be <cfoutput>update
        cartstatus set status = 'expire' where status = 'new' and indate </cfoutput>
      <cfoutput> < #refdate# </cfoutput>. Need to change that new to expire.
      <cfquery datasource="gemssql" >
      update cartstatus set status = 'expire' where status = 'new' and indate < #refdate#
      </cfquery>
      Done.
      <cfelse>
      <cfquery  datasource="gemssql" name="count">
      select cartstatus.* from cartstatus where status = 'new' and indate < #refdate#
      </cfquery>
      <cfoutput query="count">
        <table>
          <tr>
            <td>#cartid#</td>
            <td>#Indate#</td>
            <td>#cost#</td>
          </tr>
        </table>
      </cfoutput> <cfoutput >There are #count.recordcount#. Click <a href="expirecarts.cfm?age=#Arguments.age#&commit=1">here</a>
        to expire them.</cfoutput>
    </cfif>
  </cffunction>
  <cffunction name="setpaymode" access="public" returntype="string">
		<cfargument name="paymode" type="string" required="true" />
		<cfargument name="cartid" type="numeric" required="true" />
		<cfargument name="txnid" type="string" required="false" default="" />

            <cfquery datasource="gemssql" name='s' >
            select sum(rate*quantity) as dr , sum(cost*quantity) as ic from buyingrecord where  cartid = #Arguments.cartid#
            </cfquery>
            <cfquery datasource="gemssql" >
              update cartstatus set <cfif arguments.txnid neq ""> merchantsID = '#left(arguments.txnid,30)#',</cfif> cost = #s.dr#, inrcost = #s.ic#/45, indate  =  #now()#, paymode='#Arguments.paymode#' where cartid = #Arguments.cartid#
            </cfquery>
			<cfquery datasource="gemssql" >
			  update buyingrecord  set approved =1  where cartid = #Arguments.cartid#
			</cfquery>

		<cfset myResult="foo">
		<cfreturn myResult>
	</cffunction>

  <cffunction name="updatecart" returntype="boolean" displayName="update a new cartid" hint="provide shipping details, mode of payment " access="public" output="true">
    <cfargument name="cartid" displayName="cartid" hint="no hint" type="numeric" required="true" />
	<cfargument name="txnid" type="string" displayName="Txn id returned by gateway" hint="no hint"  required="false" default="" />
    <cfargument name="mode" displayName="payment mode" default="switch" hint="how txn done. Switch implies final shipment of order. Paymode implies payment of cart has been just confirmed and not shipping right now." type="string" required="false" />
    <cfargument name="shipping" displayName="shipping_details" hint="any reference of means of shipping" type="string" default="none" required="NO" />
	<cfargument name="shippedby" displayName="what courier service" hint="UPS india for india to US" type="string" required="false" default=""  />
    <cfargument name="tracking1" displayName="stage 1 tracking detail. mostly from india to Austin" hint="any reference of means of shipping" type="string" required="false" default="none" />

    <!--- newcart body --->
	<cfquery datasource="gemssql" name="check">
    	select * from cartstatus where cartid = #arguments.cartid#
    </cfquery>
    <cfset cc = arguments.cartid />
	    <cfset shippedby = arguments.shippedby />
    <cfif check.recordcount>
        <cfquery datasource="gemssql" name="oco">
            select sum(rate*quantity) as t  from buyingrecord where cartid = #arguments.cartid#
        </cfquery>
          <cfif (check.status is 'new' or check.status is 'cr_rev') and check.paymode neq 'null' ><!--- means a paid cart that has not shipped (done in status => shipped) --->
    				<cfset outdate = createodbcdatetime(now())>
                        <cfif check.couponcode is 'india'>
                                <cfif arguments.tracking1 neq 'none'>
                                      <cfquery name="erecord" datasource="gemssql">
                	                    select shippedBy from cartissues where cartid =  #cc#
                                    </cfquery>
										     <cfif erecord.recordcount >
                                                    <cfquery name="updaterecord" datasource="gemssql">
                                                        update cartissues set IssueClosedBy = '#session.apptt#', openDate ='#dateformat(now(),'mm/dd/yy')#', Tracking1 = '#arguments.Tracking1#' , Tracking2 = '#arguments.tracking1#' ,shippedBy= '#arguments.shippedBy#' where cartid =     #cc#
                                                    </cfquery>
			                                      <cfelse>
                                                    <cfquery name="updaterecord" datasource="gemssql">
     	                                               insert into cartissues (IssueClosedBy, openDate,Tracking1,Tracking2,shippedBy,cartid) values ('#session.apptt#' ,'#dateformat(now(),'mm/dd/yy')#',  '#arguments.tracking1#' ,'#arguments.tracking1#' ,  '#arguments.shippedBy#', #cc#)
        	                                        </cfquery>
            	                           </cfif>
                  			    		       <cfquery name="custemail" datasource="gemssql">
                  								Select RIGHT(dbo.purchase.email, CASE LEN(EMAIL)                    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0 WHEN 4 THEN 0 WHEN 5 THEN 0 WHEN 6 THEN 0 ELSE len(email)
                  				                      - LEN([PURCHASE].[CARTID]) - 1 END) AS EMAIL from purchase where cartid ='#cc#'
                  								</cfquery>
                  								<cfif findnocase('@',custemail.email)>
                    									<cfif findnocase('/',custemail.email)>
                    										<cfset custemail.email = right(custemail.email,len(custemail.email)-findnocase('/',custemail.email))>
                    									</cfif>

                    									<cfset dom = 'www.semiprecious.com'>

																				<cfset sendmail = 1 />
																				<cfif sendmail>
                                    <cfmail server="MailA40" from = "service@semiprecious.com" bcc="anup@semiprecious.com"   to="#custemail.email#"    subject = "Your jewelry order is packed"
											  type="html"  >

                                      												<div style="width:700px;border:2px gray solid;padding:2px;margin-top:20px;padding-top:10px;">
	                                      							Dear customer,<br />
    	                                  									This email is to inform you that your order has been packed  is on its way to your specified address.
                                      <br />
									                                                <br>The parcel's tracking number is #arguments.tracking1# for #arguments.shippedby#.

									   You can access your order/cart using the follwing link:
                                      									    http://#dom#/cartview.cfm?cartid=#cc#
                                      <br />										Alternately, you may visit the #dom# home page and on the top right, click the Track Orders link.
																		Then enter one of the requested fields to find your cart and order information.
                                      <br />         								If you have any questions, please email cs@semiprecious.com with your Cart ID number, #cc# and your name.
                                      <br />

                                      												Thank you,
                                      <br>

                                      												Customer Service Team
                                      										</div>
                                      							         </cfmail>
                                  				[@		</cfif>
                                        	</cfif>
			                                </cfif>
							<cfinclude template="/admintools/update_india_ship.cfm" />

                          <cfelse><!--- non india --->
				          <cfif arguments.tracking1 neq 'none'>
		                         <!--- here we need to add code to update if tracking1 already exists and probably tracking2 --->
                                <cfquery name="erecord" datasource="gemssql">
            	                    select Tracking1 from cartissues where cartid =  #cc#
                                </cfquery>
                                <cfif erecord.recordcount >
									<cfif arguments.mode is 'switch'>
							                <cfif erecord.Tracking1 is ''>
						                                <cfquery name="updaterecord" datasource="gemssql">
					                                        update cartissues set IssueClosedBy = '#session.apptt#', openDate ='#dateformat(now(),'mm/dd/yy')#', Tracking1 = '#arguments.tracking1#', Tracking2 = '#arguments.tracking1#' ,shippedBy= '#form.shippedBy#' where cartid =     #cc#
					                                    </cfquery>
			                                    <cfelse>
					                                <cfquery name="updaterecord" datasource="gemssql">
				                                        update cartissues set IssueClosedBy = '#session.apptt#', openDate ='#dateformat(now(),'mm/dd/yy')#',  Tracking2 = '#arguments.tracking1#' ,shippedBy= '#form.shippedBy#' where cartid =     #cc#
				                                    </cfquery>

			                                </cfif>

									<cfelse>

			                                    <cfquery name="updaterecord" datasource="gemssql">
			                                        update cartissues set IssueClosedBy = '#session.apptt#', openDate ='#dateformat(now(),'mm/dd/yy')#', Tracking1 = '#arguments.tracking1#' ,shippedBy= '#form.shippedBy#' where cartid =     #cc#
			                                    </cfquery>
									</cfif>
                                <cfelse>
									<cfif arguments.mode is 'switch'>
		                                    <cfquery name="updaterecord" datasource="gemssql">
		                                        insert into cartissues (IssueClosedBy, openDate,Tracking1,Tracking2,shippedBy,cartid) values ('#session.apptt#' ,'#dateformat(now(),'mm/dd/yy')#',  '#arguments.tracking1#' ,'#arguments.tracking1#' ,  '#form.shippedBy#', #cc#)
		                                    </cfquery>

                                       <cfelse>
		                                    <cfquery name="updaterecord" datasource="gemssql">
		                                        insert into cartissues (IssueClosedBy, openDate,Tracking1,shippedBy,cartid) values ('#session.apptt#' ,'#dateformat(now(),'mm/dd/yy')#',  '#arguments.tracking1#' ,  '#form.shippedBy#', #cc#)
		                                    </cfquery>
									</cfif>
                                </cfif>
							<cfinclude template="/admintools/update_india_ship.cfm" />
										<cfquery name="custemail" datasource="gemssql">
						Select RIGHT(dbo.purchase.email, CASE LEN(EMAIL)                    WHEN 0 THEN 0 WHEN 1 THEN 0 WHEN 2 THEN 0 WHEN 3 THEN 0 WHEN 4 THEN 0 WHEN 5 THEN 0 WHEN 6 THEN 0 ELSE len(email)
				                      - LEN([PURCHASE].[CARTID]) - 1 END) AS EMAIL from purchase where cartid ='#cc#'
								</cfquery>
								<cfif find('@',custemail.email)>
									<cfif find('/',custemail.email)>
										<cfset custemail.email = right(custemail.email,len(custemail.email)-findnocase('/',custemail.email))>
									</cfif>

											<cfset dom = 'www.semiprecious.com'>
							 						<cfif check.couponcode is 'regwsale'>
														<cfset dom = 'www.semipreciouswholesale.com'>

													</cfif>
								<cfset sendmail = 1 />
									<cfif sendmail>

									<cfmail server="MailA40" from = "service@semiprecious.com" bcc="semiprecioushipping@gmail.com"   to="#custemail.email#"    subject = "Your jewelry order is packed"
											  type="html"  >
					       					<div style="width:700px;border:2px gray solid;padding:2px;margin-top:20px;padding-top:10px;">
												Dear customer,<br />
												<cfif arguments.mode is 'switch'>
															This email is to inform you that your order has been packed and is on it's way to your specified address.
							                        <cfelse>
															This email is to inform you that your order has been packed at our jewelery making center and is on it's way to our shipping center in Austin, TX. Arrival to Austin takes 4 to 6 business days depending on UPS delivery and customs. When the order is packed and shipped in Austin, you will get another email with a tracking number.
                                						</cfif>
                                                <br>The parcel's tracking number is #arguments.tracking1# for #arguments.shippedby# courier service.
												<br />You can access your order/cart using the follwing link:
                                                                            http://#dom#/cartview.cfm?cartid=#cc#
                                                <br> Alternately, you may visit the #dom# home page and on the top right, click the Track Orders link. Then enter one of the requested fields to find your cart and order information.
                                                <br>If you have any questions, please email cs@semiprecious.com with your Cart ID number, #cc# and your name.
                                                <br>
												            Thank you,
                                                <br>
												Customer Service Team
										</div>
							         </cfmail>
						@]		</cfif><!--- if sendmail --->
    	            	</cfif><!--- if contains @ --->
	                </cfif><!--- if tracking given hence send mail ---->
             </cfif><!--- india non -india --->
         <cftry>
			<cfif arguments.mode is 'switch'>
                   <cfswitch expression="#check.paymode#">
        	            <cfcase value="authphone">
            		        <cfset paymode = 'wellsphone'>
                   	</cfcase>
                    <cfcase value="ichck">
                	    <cfset paymode = 'ichk'>
                    </cfcase>
                    <cfcase value="ccavenu">
                        <cfset paymode = 'ccav'>
                    </cfcase>
                    <cfcase value="ebs">
                    	<cfset paymode = 'EeBbesS'>
               		 </cfcase>
                    <cfcase value="chck">
	                	<cfset paymode = 'check'>
                    </cfcase>
                    <cfcase value="auth.net">
                	    <cfset paymode = 'wellsCC'><!--- or AUTH.net or arb1 ??? --->
                    </cfcase>
                    <cfcase value="pp">
            	         <cfset paymode = 'paypal'>
                    </cfcase>
                    <cfcase value="goog">
        	            <cfset paymode = 'Google'>
                    </cfcase>
                    <cfcase value="arb1">
    	                <cfset paymode = 'WellsCC'>
                    </cfcase>
                    <cfdefaultcase><!--- if the current paymode is not part of stage2 paymodes --->
	                    <cfset paymode = 'unspec'>
                    </cfdefaultcase>
                </cfswitch>
		        <cfquery datasource="gemssql">
			   		update cartstatus set  status='done',paymode='#paymode#', cost = '#oco.t#',	outdate=#outdate#      where cartid = #arguments.cartid#
		        </cfquery>
            </cfif>

        <cfcatch type="database" >#cfcatch.detail#</cfcatch></cftry>

		<cfquery datasource="GEMssql" >
			update memberinfo set totpurchase = totpurchase  + #check.cost# where email   = '#check.buyer#'
		</cfquery>
				<cfquery  datasource="gemssql" >
				update bulkbuyers set totpurchase = totpurchase  + #check.cost# where email   = '#check.buyer#'
			</cfquery>
		<!--- invite credits  not to be carrried out for wholesale purchases.--->
		<cfif  find('@',check.buyer,3) and check.couponcode neq 'regwsale'>
			<cfinvoke component="invitationandcredit" method="updatecredit"  returnvariable="v">
                <cfinvokeargument name="cartid" value="#arguments.cartid#">
                <cfinvokeargument name="email" value="#check.buyer#">
			</cfinvoke>
		</cfif>

<!---
		<cftry>

		<cfmail  to="#check.buyer#" from="cs@semiprecious.com" server="mail23" subject="Order Packed" >
 Hi,

 Your order  with cart ID #Arguments.cartiD# has been packed and will be in the mail within the next few hours.

 You will soon get an email with tracking number. You can also look up tracking by going to this page:

 http://www.semiprecious.com/itemsell.cfm?cartid=#Arguments.cartiD#

 OR

 http://www.semiprecious.com/crm/trackorder.cfm

Best way to get questions answered is by emailing us at cs@semiprecious.com

 Thank you.
 Regards,

 Shipping Department
 Semiprecious.com

 In case of any query or concern please call us or email us at cs@semiprecious.com.
 Visit our website   http://www.semiprecious.com/login.cfm?email=#check.buyer#  for details.
</cfmail><cfcatch type="any"><cfoutput>#cfcatch.detail#</cfoutput></cfcatch></cftry> --->

        <!--- how to process , lastdate when each item was sold .This task is being done in the itemsell.cfm page
		--->
				  <br />
    		  Updated Cart status (in cartstatus table).
			<cfreturn "true">
	        <cfelseif check.paymode is 'null' and listfindnocase(application.paymode_stage1,arguments.mode) >
	             <cfinvoke component="cartcontrol.cartmonitor" method="setpaymode" returnvariable="flag" >
		                <CFINVOKEARGUMENT name="cartid" VALUE="#arguments.cartid#"  />
                	    <cfinvokeargument name="paymode" value="#arguments.mode#" />
                 	    <cfinvokeargument name="txnid" value="#arguments.txnid#" />
           	    </cfinvoke>
				<cfif arguments.cartid GT 105690>
			     <cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
		                <CFINVOKEARGUMENT name="cartid" VALUE="#arguments.cartid#"  />
	   	        </cfinvoke>
				</cfif>
				<cftry>
                     <cfif len(check.couponcode)>
			      			<cfhttp url="http://www.semiprecious.com/bo/giftcoupon/coupon.aspx?action=checks&couponcode=#urlencodedformat(check.couponcode)#" method="get" />
							<cfif listgetat(trim(cfhttp.filecontent),1) is "unused">
								<cfhttp url="http://www.semiprecious.com/bo/giftcoupon/coupon.aspx?action=usecoupon&couponcode=#trim(urlencodedformat(check.couponcode))#&cartid=#arguments.cartid#" method="get" />
							</cfif>
					</cfif>
				<cfcatch type="any">
					  <cfmail server="MailA40" from="service@semiprecious.com" timeout="30" to="anup@semiprecious.com"   subject="coupon error" type="HTML" >
					     <cfdump var="#cfcatch#" />
					   </cfmail>

				</cfcatch>
				</cftry>
			<cfif arguments.cartid GT 105690>

	        <cfset dummy = sendcartasmail("#arguments.cartid#") />
			</cfif>
			            Added as paid and inventory reduced. Click <a href="javascript:history.go(-1);">here</a>
			            <cfreturn "true">
                <cfelse>
                <br>
                Cart Already Updated with status done (in the cart status table)! Nothing
                to do, nothing done. Or it is not a paid cart. If to update to new paymode please specfy the mode in arguments.

                    <cfreturn "false">
              </cfif>
      <cfelse>
          No such cartid <cfoutput>#arguments.cartid#.</cfoutput> Click <a href="javascript:history.go(-1);">here</a>
          to continue.
        <cfreturn "false">
    </cfif>
	  </cffunction>

  <cffunction name="rupdatecart" displayName="reverse a cartid" hint="reverses the status from done to new" returntype="boolean" access="public" output="true">
    <cfargument name="cartid" displayName="cartid" hint="no hint" type="numeric" required="false" default="0">
    <!--- newcart body --->
    <cfquery datasource="gemssql" name="check">
  	  select * from cartstatus where cartid = #arguments.cartid#
    </cfquery>
<cfset flag = 0 />
    <cfif check.recordcount>
	<cfswitch expression="#check.paymode#">
	<cfcase value="wellsphone">
		<cfset paymode = 'authphone'>
<cfset flag =  1 />
	</cfcase>
    	<cfcase value="ichk">
		<cfset paymode = 'ichck'>
<cfset flag =  1 />
		</cfcase>
    	<cfcase value="ccav">
			<cfset paymode = 'ccavenu'>
<cfset flag =  1 />
		</cfcase>
    	<cfcase value="EeBbesS">
		<cfset paymode = 'ebs'>
<cfset flag =  1 />
	</cfcase>
		<cfcase value="check">
	<cfset paymode = 'chck'>
<cfset flag =  1 />
	</cfcase>
	<cfcase value="wellsCC">
	<cfset paymode = 'auth.net'><!--- or AUTH.net or arb1 ??? --->
<cfset flag =  1 />
	</cfcase>
	<cfcase value="paypal">
	 <cfset paymode = 'pp'>
<cfset flag =  1 />
	</cfcase>
	<cfcase value="Google">
	<cfset paymode = 'goog'>
<cfset flag =  1 />
	</cfcase>
	<cfdefaultcase><!--- if the current paymode is not part of stage2 paymodes --->
	<cfset paymode = 'null'>
<cfset flag =  1 />

	</cfdefaultcase>
	</cfswitch>

		   <cfif paymode is 'null' and not (check.paymode is 'null')>
  					<cfinvoke component="inventory" method="rupdatepercart" returnvariable="flag" >
						<cfinvokeargument name="cartid" value="#cartid#">
				</cfinvoke>

  </cfif>
  <cfif flag>
        <cfquery datasource="gemssql">
        	update cartstatus set status='new' , paymode='#paymode#' where cartid = #arguments.cartid#
        </cfquery>
        <!--- how to process , lastdate when each item was sold .This task is being done in the itemsell.cfm page
		--->
         Reversed Cart status (in cartstatus table).

				<cfreturn true>
                <cfelse>
                <cfreturn false />
        </cfif>
      <cfelse>
      No such cartid <cfoutput>#arguments.cartid#.</cfoutput> Click <a href="javascript:history.go(-1);">here</a>
      to continue.
	  		<cfreturn "false">
    </cfif>
  </cffunction>

 <cffunction access="remote" output="true" returntype="String"   description="provides current cart items in xml output" hint="provide cartid or it will assume session.cartid"    name="cart_summary" >
  	<cfargument default="#session.cartid#" name="cartid" required="false" type="numeric" />
	<!--- in the future version this function will take cartid and pick up cart details from the db --->
	 <cftry>
	  <cfset TotalQty= 0 />
	  <!---<cfcontent type="text/xml" />

<response>
<localmethod>cart_summary</localmethod>
<cart_summary>
<items>
 <CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
      <cfset valueadd =0>
      <cfif session.cartitem[j][4] gt 0>
              <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	            SELECT newitem,price,status, wholesaleprice, saleprice, cat, storage, subcat+ ' ' + cat as description,clustercount,status,storage,thumblink FROM Items WHERE   newitem = #session.cartitem[j][1]#
                </CFQUERY>
    	   <item>
	   <description>#qprice.description#
	   </description>
	       <itemid>#qprice.newitem#</itemid>
		   <category>#qprice.cat#</category>
	       <quantity>#session.cartitem[j][4]#</quantity>
	   <cfset valueadd= 0/>
	   <cfset optsdesc = "" />
	    <cfif session.cartitem[j][5]>
                <cfquery datasource="gemssql" name="opts">
      				select description,  valueadd from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
				<cfset optsdesc = opts.description />
                  <cfif isnumeric(opts.valueadd)>
                  	 <cfif session.bulkbuyer.id NEQ "">
               			  <cfset valueadd = opts.valueadd/2 >

                  <!---- volumediscount is given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
             			     <cfelse>

               		     <cfset valueadd = opts.valueadd>

               	   </cfif>

                            </cfif>
							</cfif>
		<option>
	   		<option_id>#session.cartitem[j][5]#</option_id>
	   		<option_description>#optsdesc#</option_description>
	   		<option_value_add>#valueadd#</option_value_add>
	   </option>
	   <price>
	   <regular>#qprice.price#</regular>
	   <sale>#qprice.saleprice#</sale>
	   <wholesale>#qprice.wholesaleprice#</wholesale>
	   	   </price>
	   <status>#qprice.status#</status>
	   <time_to_delivery>  <cfif qprice.storage contains "IN-">
               10-12 days
			    <cfelse>
               Expedited Shipping Option
              </cfif>
			  </time_to_delivery>
	   </item>
	 </cfif>

            <cfset TotalQty=session.cartitem[j][4]+TotalQty>

    </CFLOOP>
	</items>
<grandtotal>#session.grandtotal#</grandtotal>
<totalqty>#totalqty#</totalqty>
</cart_summary>
</response>---><cfsavecontent variable="summary">

<div 	 class="component_box">
 <DIV  STYLE="WIDTH:96%;font-weight:bold;text-align:center;border-bottom:1px gray ridge;">Your Shopping Summary &rarr; Number of Items: #session.totalqty# | Amount :<span style="color:red"> #format(session.grandtotal)#</span> </DIV>

 <cfif session.cartitem[1][1] >
 <table border="0" style="width: 490px;">
 <tbody><tr width="" background-color="gray" class="form_heading"><th align="center" width="15%">Design</th>
 <th align="center" width="10%">Price</th>
 <th align="center" width="9%">Qty</th>
 <th align="center" width="10%">Amount</th>
 <th align="center" width="15%">Modify</th></tr>
</tbody></table>
 <div style="width:492px;border:0px green solid;height:145px;overflow-x:hidden;overflow-y:scroll;text-align:center;">
 <table border="1" style="width:490px">

 <CFLOOP  INDEX="j"  to="1" from="#ArrayLen(session.cartitem)#" step="-1">
      <cfset valueadd =0>
 <Tr ><!--- this allows calling page to set style as per their choice --->
      <td width="17%" align="center"  >
 			 <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	        	    SELECT newitem,price,status, wholesaleprice, saleprice, cat, storage, subcat+ ' ' + cat as description,clustercount,status,storage,thumblink FROM Items WHERE   newitem = #session.cartitem[j][1]#
              </CFQUERY>
   		<img src="/images/#qprice.cat#/thumb/#qprice.newitem#.jpg" width="60px" />
		<cfset valueadd= 0/>
	    <cfset optsdesc = "" />
	      <cfif session.cartitem[j][5]>
                <cfquery datasource="gemssql" name="opts">
      				select description,  valueadd from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
				<cfset optsdesc = opts.description />
                  <cfif isnumeric(opts.valueadd)>
                  	 <cfif session.bulkbuyer.id NEQ "">
               			  <cfset valueadd = opts.valueadd/2 >
                  <!---- volumediscount is given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
             			     <cfelse>

               		     <cfset valueadd = opts.valueadd>

               	   </cfif>

                            </cfif>
							</cfif><br />
					<span class="a#session.cartitem[j][1]#_#session.cartitem[j][5]#">		ID: #session.cartitem[j][1]#
							<br />#optsdesc#</span>
	</td>
	   <cfif len(session.bulkbuyer.id)>
	   	<cfset price_now = qprice.wholesaleprice + valueadd/2 />

	   <cfelse>
	   	<cfif qprice.status is 3>
	   		<cfset price_now = qprice.saleprice*session.sale_add + valueadd />
	   	<cfelse>
	   		<cfset price_now = qprice.price + valueadd />

	   	</cfif>
	   </cfif>
	   <td width="12%" align="center" >#format(price_now)#</td>
	<td width="10%" align="center" > #session.cartitem[j][4]#</td><td width="12%" align="center" >#format(evaluate(price_now*session.cartitem[j][4]))#
	</td>
	<td width="14%" align="center" >

	<a href='/jewelry_item.cfm?quantity=#session.cartitem[j][4]#&amp;newitem=#qprice.newitem#&amp;optionid=#session.cartitem[j][5]#&amp;k&amp;##jewelry_top'>	EDIT    </a><br />
	<a style="color:red" href='/jewelry_item.cfm?quantity=0&amp;newitem=#qprice.newitem#&amp;optionid=#session.cartitem[j][5]#&amp;k&amp;##jewelry_top'>	Remove    </a>


	</td>

	</Tr>
		    <cfset TotalQty=session.cartitem[j][4]+TotalQty />

    </CFLOOP></table>
	</div>


	<!---<DIV CLASS="row3" STYLE="border:1px solid ##484;text-align:center;padding:2px;WIDTH:98%;">
	| <a href="/#session.country#cart.cfm" style="text-decoration:underline;">Start Check Out</a> | <a style="text-decoration:underline;" href="javascript:" onClick="document.getElementById('cart_summary').innerHTML= '';"> Close Summary</a> |

	</DIV>--->
<cfelse>
     <div class="error2"> Shopping cart is empty </div>
	 </cfif>
 </div>
</cfsavecontent>
			<cfcatch type="any">
			<cfset myResult = "0">
			<cfcontent type="text/html" />
			<cfset summary = cfcatch.detail />
			<cfoutput>#cfcatch.detail#</cfoutput>
			<error>#cfcatch.Message#</error>
			</cfcatch>
			</cftry>
<cfreturn summary />
  </cffunction>

 <cffunction name="item_in_cart_inventory" access="remote" output="false"  description="checks if current item in cart is within inventory availability" hint="call this function before adding any item to cart"
	 returntype="Numeric"   >
	 <cfargument name="newitem" required="true" displayname="item id" type="numeric"  hint="note that option id is required at this stage" />
	<cfargument name="optionid" required="false" default="0" type="numeric"  displayname="option id" hint="note that option id is required at this stage" />
	<cfargument name="qty" required="true" type="numeric"  displayname="qty being added" hint=" required at this stage" />

 <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	            SELECT inventory as iv, orderonrequest FROM Items WHERE   newitem = #arguments.newitem#
                </CFQUERY>
      <cfif qprice.iv GT 0 >
				<cfset avail_qty = qprice.iv />
				<CFLOOP  INDEX="j"  from="1" to="#ArrayLen(session.cartitem)#">
				<cfif session.cartitem[j][1] is newitem>
					<cfif session.cartitem[j][5] neq arguments.optionid>
						<cfset avail_qty = avail_qty - session.cartitem[j][4] />
					</cfif>
				</cfif>
				</cfloop>
<cfelseif qprice.orderonrequest GT 0>
<cfset avail_qty = 10 />
  <cfelse>
	<cfset avail_qty = 0 />
</cfif>
<cfif qty GT avail_qty >
<cfReturn avail_qty />
</cfif>
<cfReturn qty />
</cffunction>
</cfcomponent>
