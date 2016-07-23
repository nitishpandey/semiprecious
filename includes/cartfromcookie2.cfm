<!--- this code does not generate a new cartid. that is the responsibility of the calling code. it also does not add items into db with the new cartid
	since we know that a visit to cart table will do that and visit to cart page is inevitable. finally the new cart id 's entry in cartstatus table is made by the
	code in cartmonitor --->
<cfset goahead = false />
<cfif isDefined('session._cartid') >
	<cfif session._cartid neq 0>
		<cfset goahead = true />
	</cfif>
</cfif>
<cfif goahead>
	<cfset session.desc_flag = 0 />
	<cfset session.check1 =  session._cartid />
	<cfquery datasource="gemssql" name="currentcart">
	           SELECT * FROM buyingrecord WHERE buyingrecord.cartid = #session._cartid#
          </cfquery>
	<cfset recover_cart = false />
	<cfset do_login = false />
	<cfif currentcart.recordcount >
		<cfset session.check2 =  currentcart.email />
		<cfif  currentcart.email contains "@"   >
			<cfif len(session.bulkbuyer.id)>
				<cfquery datasource="sptm" name="ws_loggedin"><!--- is he a logged in wholesale member? --->
											   SELECT email  FROM bulkbuyers WHERE email = '#currentcart.email#' and loggedin = '1'
											</cfquery>
				<cfif ws_loggedin.recordcount or isdefined("url.cartid")>
					<!--- cartid in url could be from non www redirection --->
					<cfset session.check3 =  1 />
					<cfset recover_cart = true />
					<cfif   ws_loggedin.recordcount >
						<cfset do_login = true>
					</cfif>
				<cfelse>
					<cfset session.check4 =  1 />
					<cfquery datasource="sptm" name="ws_member"><!--- is he a logged out wholesale member? --->
												   SELECT email  FROM bulkbuyers WHERE email = '#currentcart.email#'
												</cfquery>
					<cfif ws_member.recordcount is 0 >
						<cfset recover_cart = true />
					<cfelse>
						<cfset session.login_reminder = true />
					</cfif>
				</cfif>
			<cfelse>
				<cfset session.check6 =  1 />
				<cfquery datasource="gemssql" name="ret_loggedin"><!--- is he a wholesale member? --->
											   SELECT email  FROM memberinfo WHERE email = '#currentcart.email#' and loggedin = '1'
											</cfquery>
				<cfif ret_loggedin.recordcount or isdefined("url.cartid")>
					<cfset session.check7 =  1 />
					<cfset recover_cart = true />
					<cfset do_login = true>
				<cfelse>
					<cfset session.check8 =  1 />
					<cfquery datasource="gemssql" name="ret_member"><!--- is he a wholesale member? --->
												   SELECT email  FROM memberinfo WHERE email = '#currentcart.email#'
												</cfquery>
					<cfif ret_member.recordcount is 0 >
						<cfset session.check9 =  1 />
						<cfset recover_cart = true />
					<cfelse>
						<cfset session.login_reminder = true />
					</cfif>
				</cfif>
			</cfif>
		<cfelse>
			<cfset recover_cart = true />
		</cfif>
		<cfif recover_cart>
			<cfset session.check5 =  1 />
			<cfquery datasource="gemssql" name="notpaid">
	             		  SELECT cartid,cost, status, paymode, buyer FROM cartstatus WHERE  cartid = '#session._cartid#' AND paymode='null' and paymode is not null
	    		 </cfquery>
			<cfif notpaid.recordcount  >
				<!--- not paid so worthwhile to recover the cart --->
				<cfquery datasource="gemssql" name="confirmedstatuscheck">
				               SELECT cartid, status, paymode, buyer FROM cartstatus WHERE cost>0 and cartid = '#session._cartid#' AND paymode='null' and paymode is not null
				            </cfquery>
				<cfif confirmedstatuscheck.recordcount >
					<cfset discountedprice="yes">
					<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />
				<cfelse>
					<cfset discountedprice="no">
					<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" >
						<cfinvokeargument name="reuse_cartid" value="#session._cartid#" />
					</cfinvoke>
				</cfif>
				<cfloop  query="currentcart">
					<!--- need to replace below process with invocation of add to cartmonitor 20 Jun, Nitish--->
					<cfset f.newitem = currentcart.itemid />
					<cfset f.quantity = currentcart.quantity />
					<cfset f.optionid = currentcart.optionid />
					<cfif discountedprice >
						<cfset f.add_to_db = 1 />
					<cfelse>
						<cfset f.add_to_db =  0 />
					</cfif>
					<cfset f.mail = currentcart.email />
					<cftry>
						<cfinvoke method="additem" attributecollection="#f#" component="cartcontrol.cartmonitor" returnvariable="added"  />
						<!---      <cfquery datasource="gemssql" name="catcheck">
							SELECT cat FROM Items WHERE newitem = #currentcart.itemid#
							</cfquery>
							<cfset session.cartitem[currentrow][1] = currentcart.itemid>
							<cfset session.cartitem[currentrow][2] =catcheck.cat>
							<cfset session.cartitem[currentrow][4] =currentcart.quantity>
							<cfset session.cartitem[currentrow][5] =currentcart.optionid>
							<cfif len(session.bulkbuyer.id)>
							<cfquery datasource="gemssql" name="pricecheck">
							select wholesaleprice,price from items where newitem = #currentcart.itemid#
							</cfquery>
							<cfif pricecheck.wholesaleprice is 0>
							<cfset session.cartitem[currentrow][3] =pricecheck.price/2 />
						<cfelse>
							<cfset session.cartitem[currentrow][3] =pricecheck.wholesaleprice />
							</cfif>
						<cfelse>
							<cfquery datasource="gemssql" name="pricecheck">
							select saleprice, price,status from items where newitem = #currentcart.itemid#
							</cfquery>
							<cfif pricecheck.status is 3>
							<cfset session.cartitem[currentrow][3] =pricecheck.saleprice />
						<cfelse>
							<cfset session.cartitem[currentrow][3] =pricecheck.price />
							</cfif>
							</cfif>
							<cfif currentcart.optionid >
							<cftry>    	<cfquery datasource="gemssql" name="opts">
							select valueadd from options where itemid = #currentcart.itemid#   and optionid = #currentcart.optionid#
							</cfquery>
							<cfif session.bulkbuyer.id neq "">
							<cfset valueadd = opts.valueadd/2>
						<cfelse>
							<cfset valueadd = opts.valueadd>
							</cfif>
							<cfset session.cartitem[currentrow][3] = session.cartitem[currentrow][3] + Variables.valueadd>
							--->
						<cfcatch type="any">
							<cfdump var="#cfcatch.tagcontext#" />
							<cfoutput>
								#cfcatch.message#
							</cfoutput>
							<cfabort />
						</cfcatch>
					</cftry>
					<!---		</cfif>
						<cfset added = currentrow />
						<cfif discountedprice>
						<cfquery datasource="gemssql" >
						INSERT INTO buyingrecord (email, itemid, quantity, cartid, optionid, rate )
						VALUES ('#currentcart.email#', #session.cartitem[added][1]#, #session.cartitem[added][4]#, #session.cartid#, #session.cartitem[added][5]#, #session.cartitem[added][3]# )
						</cfquery>
						</cfif> --->
				</cfloop>
			</cfif>
			<!--- recover cart if not paid for --->
		</cfif>
		<!--- recover cart as per cookie/member/loggedin status --->
		<cfif session.cartitem[1][1]>
			<cfloop from="1" to="#arraylen(session.cartitem)#" index="counter" >
				<cfset session.grandtotal = session.grandtotal + session.cartitem[counter][3]*session.cartitem[counter][4] />
				<cfset session.totalqty = 	session.totalqty + session.cartitem[counter][4] />
			</cfloop>
		</cfif>
		<cfif do_login and currentcart.email neq application.wholesale_guest and ( (session.mail eq application.wholesale_guest) or (len(session.mail) is 0)) >
			<!--- not len session mail helps ensure stop infinite loop since this is also called upon log in --->
			<cfsilent >
				<cfset form.email = currentcart.email />
				<Cfinclude template="/login.cfm" />
			</cfsilent>
		</cfif>
	</cfif>
	<!--- if cookie caught --->
</cfif>
<!--- cookie caught? --->
<cftry>
	<cfset session.grandtotal = 0 />
	<cfset session.totalqty = 0 />
	<cfif session.cartitem[1][1]>
		<cfloop from="1" to="#arraylen(session.cartitem)#" index="counter" >
			<cfset session.grandtotal = session.grandtotal + session.cartitem[counter][3]*session.cartitem[counter][4] />
			<cfset session.totalqty = 	session.totalqty + session.cartitem[counter][4] />
		</cfloop>
	</cfif>
	<!---
		<cfquery datasource="gemssql" name="cartstatusadd">
		INSERT INTO cartstatus (cartid, status, paymode, cost, indate, buyer)
		VALUES ('#session.cartid#', 'new', 'null', '0', #now()#, '#session.mail#')
		</cfquery>
		--->
	<cfcatch type="any">
		<cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Could not reverse " server="mail23@webcontrolcenter.com" type="html">
				  #cfcatch.detail#, #cfcatch.message# for #session.mail#
	    </cfmail>
	</cfcatch>
</cftry>
