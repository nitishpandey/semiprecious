<!--- activating appends earlier cart items to existing carts. as of now part of the code does not check if the item is being repeated between
current cart and earlier cart being copied 20 Jun 10 , Niitish--->
<!--- recovers any cart for admin. for others using cartid in URL if the buyer is null. Else, buyer should match the session.mail or buyer should match email in URL
--->
<cfparam name="url.email" default='' />
<cfparam name="msg" default='Use Cart Id or Your Email Id to Refill an Earlier Cart' />

<cftry>

<cfset as = 0 />
<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
<cfif isdefined("url.visit_email")>
	 <cfif len(url.visit_email)>
	<cfquery   datasource="gemssql" name="ve" >
	select top 1 cartid from cartstatus where  buyer = '#trim(urldecode(url.visit_email))#'
	</cfquery>
	<cfif ve.recordcount>
	<cfset form.cartid = ve.cartid />
	<cfelse>
	<cfset msg = 'no cart found with the provided email id. Please try with someother emailid'>
	</cfif>
	</cfif>
</cfif>

<cfif isdefined("form.cartid") or isdefined("url.cartid") >
	<cfif isdefined("url.cartid")>
		<cfset form.cartid = url.cartid>
	</cfif>
	<cfset as = form.cartid />
		<cfif form.cartid is 0>
	        <cfset k = structdelete(form,"cartid") />
        </cfif>
</cfif>

<cfif isdefined("form.cartid")>
 <cfif form.cartid is session.cartid >
    <cflocation url="/#session.cart#?country=#session.address.country_code#&cartid=#session.cartid#&activated=1"   addtoken="false" />
</cfif>
<cftry>

  <cfquery datasource="gemssql" name="quota">
		select buyer ,couponcode from cartstatus where   cartid = '#form.cartid#'  <cfif session.mail neq application.admin_email> and (buyer = '#session.mail#' or buyer = '#application.wholesale_guest#' or buyer is null or buyer = '' or buyer = '#url.email#') </cfif>
  </cfquery>
	<cfcatch type="database">
	  Sorry, an error has occured, please call us to let us know - 1 866 819 7692
	</cfcatch>
</cftry>
  <cfif quota.recordcount is 0 ><!--- then check for cartstatus may have email id that is not of a member hence would not be an issue recovering such a cart --->
            <cftry>
						<cfquery datasource="gemssql" name="quota">
                select buyer ,couponcode from cartstatus where   cartid = #form.cartid#
          </cfquery>
						<cfcatch type="database">
	  				Sorry, an error has occured, please call us to let us know - 1 866 819 7692
									</cfcatch>
				</cftry>
   			<cfinvoke component="invitationandcredit" method="buyer_type" returnvariable="b_type"  >
					<cfinvokeargument name="buyer_email" value="#quota.buyer#">
				</cfinvoke>
		  <cfif b_type neq 'none'>
		  <!---	<cfset quota.recordcount = 0 />  let every cart be recovered --->
              <cfset url.tacdid = 'anonymous' />
			   <!--- hence we recover but treat as confirmed so one person recovering someone else's cart does not tamper with it. --->
		  </cfif>
  </cfif>
  <cfif  quota.recordcount >
    <cfif len(quota.buyer)><!--- means guest password in ws is essential or we will not enter this part --->
<!---sptm--->    	<cfquery datasource="gemssql" name="r">
			   SELECT name  FROM bulkbuyers   WHERE email= '#quota.buyer#'
		  </cfquery>
  		  <cfif r.recordcount or (quota.buyer is application.wholesale_guest) or (quota.couponcode is 'regwsale')><!--- coupon is useful for tracking ws buyers who enter email id on the cart page --->
 				   <cfif not len(session.bulkbuyer.id)>
					   <cflocation url="http://www.semipreciouswholesale.com/activate_cart.cfm?#cgi.QUERY_STRING#&msg=acting&acemat" addtoken="false"  />
				   </cfif>
				  <cfset wholesale = 1 />
			  <cfelseif (session.bulkbuyer.id eq application.wholesale_guest)><!--- do not take a logged in ws customer to sp.com in any case --->
				  <cfset wholesale = 0 />
					 <cfif  len(session.bulkbuyer.id)>
						<cflocation url="http://www.semiprecious.com/activate_cart.cfm?#cgi.QUERY_STRING#&msg=#quota.buyer#tempfini&acemat" addtoken="false"  />
				   </cfif>
				   <cfelse>
				   <cfif  len(session.bulkbuyer.id)>
					   <cfset wholesale = 1 />
				   <cfelse>
					   <cfset wholesale = 0 />

				   </cfif>
<!--- <cfset session.mail = quota.buyer /> not setting this because we dont want copying of cart to always mean logging in as that buyer.--->
			  </cfif>
	<cfelseif len(session.bulkbuyer.id)>
    	<cfset wholesale = 1 />
    	<cfset r.recordcount = 0  />
   <cfelse>
	   <cfset wholesale = 0 />
	   <cfset r.recordcount = 0  />
  </cfif>
  <!--- if cartid did not reach confirmation then move it to new cart by simple update of cartid in buying record if we have a new cartid, else just update
  session.cartid through reuse --->
<cftry>

		      <cfquery datasource="gemssql" name="confirmedstatuscheck"><!--- neq 'null' because in manual updates of status often cost is 0.00 and paymode moves to chck or pp --->
			            SELECT  buyer FROM cartstatus WHERE (cost>0 or paymode<> 'null') and cartid = #form.cartid#
			     </cfquery>
	<cfcatch type="database">
	  Sorry, an error has occured, please call us to let us know - 1 866 819 7692
	</cfcatch>
</cftry>
			      <cfif confirmedstatuscheck.recordcount or isdefined("url.tacdid") or session.mail is application.admin_email or  quota.buyer is '' or quota.buyer is application.wholesale_guest>
						  <!--- this funny named variable tacdid comes from whole_login when whole_login is called by login.cfm on sp.com as a baton of existing cartid at sp.com . it is used in activate but to not to reuse the cartid given.thus the handle to this cart is new on ws site --->
				   <cfquery datasource="gemssql" name="q">
						  select itemid, quantity,optionid from buyingrecord where cartid = #form.cartid#
					  </cfquery>
					    <cfif q.recordcount>
					      <CFLOOP query="q"   >
                          <!---
						      <cfquery datasource="gemssql" name="q2">
							      select cat from items     where newitem = #itemid#
						      </cfquery>
						      <cfif q2.inventory>
							        <CFSET p  =q2.price>
							        <cfif q2.status eq 3>
								          <CFSET p =q2.saleprice>
							        </cfif>
							        <cfif wholesale>
			  				          <cfif q2.wholesaleprice  eq 0.00 or q2.wholesaleprice is "">
								            <CFSET p =  q2.price/2>
								            <cfelse>
									            <CFSET p =  q2.wholesaleprice>
							          </cfif>
							        </cfif>
									<cfset iedcache = randrange(1,30230) />
								   <cfset    	_url ='#cgi.server_name#/cartcontrol/cartmonitor.cfc?
								   method=additem&newitem=#itemid#&
								   quantity=#quantity#&category=#q2.cat#&price=#p#&optionid=#q.optionid#&iedcache=#iedcache#&#session.URLToken#' />

                                    	<cfhttp method="get" throwonerror="yes" url="#_url#"    />
                               </cfif>
							   --->
							       <cfset f.newitem = itemid />
							       <cfset f.quantity = quantity />
                                   <cfset f.optionid = optionid />
                                   <cfset f.add_to_db = 1 />
                                  	 <cftry>
											<cfinvoke method="additem" attributecollection="#f#" component="cartcontrol.cartmonitor" returnvariable="added"  />

                                        <cfcatch type="any">
                                        <cfdump var="#cfcatch#" />
                                        <cfoutput>#cfcatch.detail#</cfoutput>
                                        <cfabort />
                                        </cfcatch>
                                        </cftry>

						    </cfloop>

						  </cfif>
						<cfelse>
							<cfset discountedprice="no">
								<cfif not session.cartitem[1][1]>
									<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" >
										<cfinvokeargument name="reuse_cartid" value="#form.cartid#" />
									</cfinvoke>
								   <cfset startrow = 1 />
								<cfelse>
								  <cfquery datasource="gemssql" name="subtle_error" >
						 			select T1.itemid as dup_i from buyingrecord as T1,  buyingrecord as T2 where  T1.cartid = #session.cartid# and T2.cartid = #form.cartid# and T1.itemid = T2.itemid  and T1.optionid = T2.optionid
								  </cfquery>
								  <cfloop query="subtle_error" >
										<cfquery datasource="gemssql" >
											 delete from buyingrecord  where cartid = #form.cartid# and itemid= #dup_i#
										  </cfquery>
									  </cfloop>
									<cfquery datasource="gemssql" >
									  update cartstatus set  paymode  = 'activated' where cartid = #form.cartid#
									  </cfquery>
								 </cfif>
							  <cfquery datasource="gemssql" name="q">
								  select itemid, quantity,optionid from buyingrecord where cartid = #form.cartid#
							  </cfquery>

								<cfif q.recordcount>
							    	<cfquery datasource="gemssql" >
					   				  update buyingrecord set  cartid = #session.cartid# where cartid = #form.cartid#
									  </cfquery>
								    <CFLOOP query="q"   >
 									      <cfquery datasource="gemssql" name="q2">
									      select cat, price,wholesaleprice, saleprice, inventory, status from items where newitem = #itemid#
									      </cfquery>
								      <cfif q2.inventory>
<!---								        <CFSET p  =q2.price>
								        <cfif q2.status eq 3>
								          <CFSET p =q2.saleprice>
								        </cfif>
								        <cfif wholesale>
								          <cfif q2.wholesaleprice  eq 0.00 or q2.wholesaleprice is "">
									            <CFSET p =  q2.price/2>
								            <cfelse>
									            <CFSET p =  q2.wholesaleprice>
								          </cfif>
								        </cfif><!--- we can't use cartmonitor tool below because there in adding an item both array and db entries are made here we are reusing earlier db entry --->
							          <cfset iedcache = randrange(1,30230) />
									   <cfset    	_url ='#cgi.server_name#/cartcontrol/cartmonitor.cfc?method=additem&newitem=#itemid#&quantity=#quantity#&category=#q2.cat#&price=#p#&optionid=#optionid#&add_to_db=0&iedcache=#iedcache#&#session.URLToken#' />		--->
							       <cfset f.newitem = itemid />
						       <cfset f.quantity = quantity />
                                   <cfset f.optionid = optionid />
                                   <cfset f.add_to_db = 0 />

                                  	 <cftry>
											<cfinvoke method="additem" attributecollection="#f#" component="cartcontrol.cartmonitor" returnvariable="added"  />
<!---	<cfhttp method="get" throwonerror="yes" url="#_url#"    /> --->
										<cfcatch type="any">
											<cfoutput>#cfcatch.message#.,#cfcatch.detail#</cfoutput>
                                            <cfdump var='#cgi#' />
                                            <cfabort />
										</cfcatch>
										</cftry>
									    <cfelse>
										<cfquery datasource="gemssql" name="q">
											  delete  from buyingrecord where cartid = '#session.cartid#'  and itemid = #itemid#
									  </cfquery>
									</cfif>
							    </cfloop>

							  </cfif>


							</cfif>
							<cfif wholesale >
								<cflocation url="http://www.semipreciouswholesale.com/#session.cart#?as=#as#&p=1&country=#session.address.country_code#" addtoken="no"  />
							<cfelse>
								<cfif session.country is 'india'>
									<cflocation url="http://www.semiprecious.in/#session.cart#?as=#as#&country=#session.address.country_code#" addtoken="no"  />
								<cfelse>
								 <cflocation url="http://www.semiprecious.com/#session.cart#?as=#as#&country=#session.address.country_code#" addtoken="no"  />
								</cfif>
							</cfif>

							<cfelse>

  <cfquery datasource="gemssql" name="quota">
		select buyer  from cartstatus where   cartid = '#form.cartid#'
  </cfquery>
  	<cfif quota.recordcount>
		  <cfif quota.buyer neq session.mail>
  				<cfset session.login_reminder = true />

		  </cfif>
	  </cfif>
		</cfif>

  <!--- there is no else clause above. if the above processes are succesful then a reolcation to cart.cfm happens. else one reaches to the below sttmt --->
  <br />
  <span class="error2">The specified cart does not belong to you or no such cartid. Please Try again.</span><br>
  </cfif>
<br /><br />
<table width="600" style="margin-top:20px;" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="22"></td>
          <td width="531" class="grayplacard" style="text-align:left;font-weight:bold" ><cfoutput>#msg#</cfoutput></td>
          <td width="22"></td>
        </tr>
        <tr>
          <td  >&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF">
             <cfform action="activate_cart.cfm" method="get">
    &nbsp; &nbsp;&nbsp;&nbsp;Enter your cart id here:
    <cfinput name="cartid" validate="integer" type="text" required="yes" >
    <input type="submit" class="action_button" value="Fill Cart">
  </cfform>
          </td>
          <td  >&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td  >OR</td>
          <td></td>
        </tr>
             <tr>
          <td width="22"></td>
          <td width="531"  >&nbsp;</td>
          <td width="22"></td>
        </tr>
        <tr>
          <td  >&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF">
             <cfform action="fillcart.cfm" method="get">
    &nbsp; &nbsp;&nbsp;&nbsp;Enter your Emaild id here:
    <cfinput name="visit_email" type="text" required="yes" >
    <input type="submit" class="action_button" value="Find Cart">
  </cfform>
          </td>
          <td  >&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td  >&nbsp;</td>
          <td></td>
        </tr>
      </table>
	   <div  style="width:800px;margin:20px;" class="error2" align="left">Don't remember your cartid? Call us or Write in to us, we may be able to help
  you out. </div>
<cfcatch type="any">
	<cfoutput>#cfcatch.message#,#cfcatch.detail#...<cfdump var="#cfcatch#" /><cfabort /></cfoutput>
       </cfcatch>
                           </cftry>
 <cfinclude template="mainfooter.cfm">
</div>
</div>

</body>
</html>
