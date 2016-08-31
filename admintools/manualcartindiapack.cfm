
<cfset arguments.tracking1 = '1Z9E84A36652242408' />
<cfset arguments.shippedby = 'UPS-india' />
<cfset cartlist = '97407
97852
98464
98617
98646
98738
98796
98797
98837
98882
98893
98894
98902
98904
98905
98906
98918
98921
98926
98928
98934
98948
98998
98999
99011
99026
99029
99031
99035
99054
99062
99072
99075
99086
99093
99095
99099
99102
'>
	<cfset count = 0 />
	<cfset mailcount = 0 />
	<cfset dbcount = 0 />

<cfloop list="#cartlist#" index="cd" delimiters="#chr(13)##chr(10)# " >
					<cfset cc = trim(cd) />
					<cfinclude template="update_india_ship.cfm" />
					<cfset count = count + 1 />
								 <cfquery name="erecord" datasource="gemssql">
                	                    select shippedBy from cartissues where cartid =  #cc#
                                    </cfquery> 
										     <cfif erecord.recordcount >
                    				            	<cfset dbcount = dbcount + 1 />
								                    <cfquery name="updaterecord" datasource="gemssql">
                                                        update cartissues set IssueClosedBy = 'hema', openDate ='#dateformat(now(),'mm/dd/yy')#', Tracking1 = '#arguments.Tracking1#' ,shippedBy= '#arguments.shippedBy#' where cartid =     #cc#
                                                    </cfquery>
		                                      <cfelse>
					                                	<cfset dbcount = dbcount + 1 />
	                                                    <cfquery name="updaterecord" datasource="gemssql">
	     	                                               insert into cartissues (IssueClosedBy, openDate,Tracking1,Tracking2,shippedBy,cartid) values ('hema' ,'#dateformat(now(),'mm/dd/yy')#',  '#arguments.tracking1#' ,'' ,  '#arguments.shippedBy#', #cc#)
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
                    									<cfquery name="d" datasource="gemssql">
                    										select couponcode from cartstatus where cartid = #cc#
                    									</cfquery>
                    										<cfset dom = 'www.semiprecious.com'>
               												<cfif d.couponcode is 'regwsale'>
                    													<cfset dom = 'www.semipreciouswholesale.com'>
                  											<cfelseif d.couponcode is 'india'>
                    												<cfset dom = 'www.semiprecious.in'>
                 											</cfif>
												
														<cftry>						
                                                   	  	<cfmail   to="#custemail.email#" bcc="scorpionitish@yahoo.com" server="mail23.webcontrolcenter.com"  from = "service@semiprecious.com"  subject = "Your jewelry order shipped"   replyto = "service@semiprecious.com" type="html" >
                                      								       
                                      												<div style="width:700px;border:2px gray solid;padding:2px;margin-top:20px;padding-top:10px;">
	                                      							Dear customer,<br /> 
    	                                  									This email is to inform you that your order has been packed  and shipped on 15 Dec for our office in Austin, USA. It will be shipped from Austin to your address.
                                      <br />                            
									                                                <br>The parcel's tracking number is #arguments.tracking1# for #arguments.shippedby#.
									   <br />								You can access your order/cart using the follwing link:
                                      									    http://#dom#/cartview.cfm?cartid=#cc#
                                      <br />										Alternately, you may visit the #dom# home page and on the top right, click the Track Orders link. 
										<br />										Then enter one of the requested fields to find your cart and order information.
                                      <br />         								If you have any questions, please email cs@semiprecious.com with your Cart ID number, #cc# and your name.
                                      <br />
                                      										
                                      <br />												Thank you for shopping with us,
                                      <br />
                                      												Customer Service Team
                                      										</div>          
                                      							         </cfmail> 
		                                                        	<cfset mailcount = mailcount + 1 />

													<cfcatch type="any">
														<cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput>
													</cfcatch>
				                        </cftry>          						

						</cfif> 
           </cfloop>
<cfoutput>count: #count#, dbcount = #dbcount#, mailcount = #mailcount# </cfoutput>