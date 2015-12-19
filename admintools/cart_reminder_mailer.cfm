<cffunction name="buyer_country" >
	<cfargument name="buyer_email" type="string" required="yes">
	<cfquery datasource="sptm" name="valid">
		    select country from bulkbuyers where   id = '#arguments.buyer_email#'
		    </cfquery>
	<cfif valid.recordcount>
		<cfif len(valid.country)>
			<cfset _location.country = valid.country />
		</cfif>
	<cfelse>
		<cfquery datasource="gemssql" name="valid">
					    select country from memberinfo where email = '#arguments.buyer_email#'
				   </cfquery>
		<cfif valid.recordcount>
			<cfif len(valid.country)>
				<cfset _location.country = valid.country />
			</cfif>
		</cfif>
	</cfif>
	<cfif not isdefined('_location.country')>
		<cfset look_up_array = [['.fr','france'],['.gr','greece'],['.de','germany']] />
		<cfset _location.country = ''>
		<cfloop from="1" to="#arraylen(look_up_array)#" index="j">
			<cfif find(look_up_array[j][1],buyer_email,find('@',buyer_email)+2) >
				<cfset _location.country = look_up_array[j][2]>
				<cfbreak />
			</cfif>
		</cfloop>
	</cfif>
	<cfreturn _location.country />
</cffunction>

<cfif isdefined("url.action")>
	<cfswitch expression="#url.action#" >
		<cfcase value="schedule">
			<cfschedule action = "run"
				task = "cart_reminder_mailer"
				operation = "HTTPRequest"
				url = "http://www.semiprecious.com/admintools/cart_reminder_mailer.cfm?action=run"
				startDate = "5/18/10"
				startTime = "12:25 PM"
				interval = "daily"
				requestTimeOut = "600" />
			done
		</cfcase>
		<cfcase value="run">
			<!--- pick up cartids that have mail ids and content for today - 3 --->
			<cfscript>
				check_date = now();
				check_date1 = createodbcdate(dateAdd('d', -2, check_date));
				check_date2 = createodbcdate(dateAdd('d', -3, check_date));
			</cfscript>
			<cftry>
				<cfquery datasource="gemssql" name="carts">
			  		select  distinct buyer as buyers from cartstatus  where indate <  #check_date1# and indate >  #check_date2# and paymode = 'null' order by buyer
			   </cfquery>
				<cfif carts.recordcount>
					<cfset prospects = arrayNew(2) />
					<cfloop query="carts">
						<cfif len(buyers) >
							<cfquery datasource="gemssql" name="later_attempt">
											   select cartid , paymode from cartstatus  where buyer = '#buyers#' and indate > #check_date1#
										  </cfquery>
							<cfif not later_attempt.recordcount>
								<cfquery datasource="gemssql" name="same_date_paid">
													  select  buyer from cartstatus  where buyer = '#buyers#' and indate <  #check_date1# and indate >  #check_date2# and paymode <> 'null'
												   </cfquery>
								<cfif  same_date_paid.recordcount is 0 >
									<cfquery datasource="gemssql" name="earlier_attempt">
																   select indate, cartid,couponcode  from cartstatus  where buyer = '#buyers#' and indate > #check_date2# order by cartid desc
															  </cfquery>
									<cfset prospects[arraylen(prospects)+1][1]= earlier_attempt.cartid />
									<cfset prospects[arraylen(prospects)][2]= carts.buyers />
									<cfset prospects[arraylen(prospects)][3]= earlier_attempt.couponcode />
									<cfset prospects[arraylen(prospects)][4]= buyer_country(carts.buyers) />
									<cfset prospects[arraylen(prospects)][5]= earlier_attempt.indate />
									<!--- is it french --->
									<!--- is it french --->
								</cfif>
							</cfif>
						</cfif>
					</cfloop>
				</cfif>
				<cfloop index="ind" from="1" to="#arraylen(prospects)#">
					<cfset tld = 'com' />
					<cfif prospects[ind][3] is "india">
						<cfset sitetogo = "www.semiprecious.in" />
						<cfset tld = 'in' />
					<cfelseif prospects[ind][3] is "regwsale" >
						<cfset sitetogo = "www.semipreciouswholesale.com" />
					<cfelse>
						<cfquery datasource="sptm" name="r">
								   SELECT name  FROM bulkbuyers   WHERE email= '#prospects[ind][2]#'
							  </cfquery>
						<cfif r.recordcount>
							<cfset sitetogo = "www.semipreciouswholesale.com" />
						<cfelse>
							<cfset sitetogo = "www.semiprecious.com" />
						</cfif>
					</cfif>
					<cfset germany_msg = 'Hallo, <br />Das ist eine automatische E-Mail. Es wird nur einmal gesandt. Die Verbindung wird Ihnen unten helfen, Ihr Einkaufen zu vollenden, das Sie auf unserem Lager anfingen. Sie können auf die Verbindung klicken oder es in Ihrer WWW-Browser-Adressbar verwenden.<br /> Danke, <br />Halbedel Mannschaft' />
					<cfset france_msg = "Bonjour, <br />C'est un courrier electronique automatique. Il est envoyé seulement une fois. Le lien ci-dessous vous aidera  à accomplir vos courses que vous avez commencées sur notre magasin de bijouterie. Vous pouvez cliquer sur le lien ou l'utiliser dans votre bar d'adresse de navigateur.<br />Merci, <br />Equipe Semiprecious" />
					<CFSET variables.SUBJECT = 'Easily continue your jewelry shopping cart'>
					<cfswitch expression="#prospects[ind][4]#">
						<CFCASE VALUE="fRANCE">
							<CFSET variables.SUBJECT =	"Votre panier faisant des achats" />
						</CFCASE>
						<CFCASE VALUe="germany">
							<CFSET variables.SUBJECT =	"Ihr Einkaufswagen" />
						</CFCASE>
					</CFSWITCH>
					<cfmail  from="cs@semiprecious.com"   replyto="cs@semiprecious.com" subject="#variables.subject#" to="#prospects[ind][2]#"
					   type="html" failto="nitishpandey@gmail.com">
							<div align="center" style="width:600px;border:2px ridge ##666600;padding:4px;"><font color="##65565B" size="+2">#sitetogo#</font></div>
								<div style="border:0px ridge ##666600;padding:6px;text-align:left">
							 <cftry>
							    #evaluate(prospects[ind][4]&"_msg")#
							 <br />Link: <a href="http://#sitetogo#/fillcart.cfm?cartid=#prospects[ind][1]#&amp;email=#prospects[ind][2]#">http://#sitetogo#/fillcart.cfm?cartid=#prospects[ind][1]#&amp;email=#prospects[ind][2]#</a>
							<br />	[In English Below]
							<cfcatch type="any">
								</cfcatch>
							</cftry>
								<br />	Dear Patron,</div>
								<div style="width:600px;text-align:justify">
                                 <p>
								      We found your shopping cart with cool designs in it. Thought we help you start off right where you left off  <a href="http://#sitetogo#/fillcart.cfm?src=cart_reminder&amp;cartid=#prospects[ind][1]#&amp;email=#prospects[ind][2]#">Click here</a> to instantly re-start your shopping.

										</p>If you need any assistance in shopping please feel free to write in or call us. We will be so glad you reached out.
									     </div>
								         <div style="text-align:left">Warm Regards,<br /> - Customer Delight Team at #sitetogo#
								         <div align="center" style="background-color:##CCCCCC;margin-top:0px;height:10px;">&nbsp;
								</div>
								<hr />

								 </div>
				 </cfmail>
					<cfmail from="cs@semiprecious.com"   replyto="cs@semiprecious.com" subject="#variables.subject#" to="#prospects[ind][2]#" >
					Hi,

					A couple of days ago you had added some great designs to your shopping cart at our store.
					If you wish to continue your shopping  click on URL below or cut and paste it in your  browser
					http://#sitetogo#/fillcart.cfm?src=cart_reminder&cartid=#prospects[ind][1]#&email=#prospects[ind][2]#.

			        If you may have any questions  please write in or call us.

				    Warm Regards,
				    - Team #sitetogo#

						</cfmail>
				</cfloop>
				<!---
					<cfdump var="#carts#" />
					<cfdump var="#later_attempt#" />
					<cfdump var="#prospects#" />
					--->
				<!--- loop over mail ids and check if any cart exists between today and today -3 neq with same email id and status paid (get list from cartstatus) --->
				<!--- we should be left with a 2 D array with mail id and cart id--->
				<!--- mail to them one by one (cfloop) mail should contain "activate cart link (fillcart2.cfm)"--->
				<cfcatch type="any" >
					<cfoutput >
						#cfcatch.Message#, #cfcatch.detail# #cfcatch.ExtendedInfo#,#cfcatch.Type#,
					</cfoutput>
				</cfcatch>
			</cftry>
			done
		</cfcase>
	</cfswitch>
<cfelse>
	Nothing done. please specify action in URL as schedule or run
</cfif>
