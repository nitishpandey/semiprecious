<cfparam name="url.email" default="" />
<cfif len(url.email)>
	<cfset url.allowrepeat = 'true' />
	<cfinvoke component="invitationandcredit" method="invite" returnvariable="q" argumentcollection="#url#">
	</cfinvoke>
</cfif>
<html>
	<head>
		<title>
			Semiprecious Jewelry Application by Dynamic Web
		</title>
		<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="/js/imageswap.js"></script>
	</head>
	<BODY BGCOLOR="white" onLoad="document.getElementById('form1').submit();" topmargin='0'   >
		<div align="center">
			<CFINCLUDE TEMPLATE="/header#session.country#.cfm">
			<div id="container1">
				<div id="container2">
					<table  cellspacing="0" cellpadding="0" border="0" style="padding:0 10">
				<tr style="width:930px;" align="center">
					<!---<td valign="top"  ><!--- BEGIN LEFT SIDE STUFF --->
					<CFINCLUDE TEMPLATE="leftmenus.cfm">
					<!--- END LEFT SIDE STUFF --->
					</td>--->
					<td align="left" valign="top" >
						<div class="grayplacard" style="width:90%;text-align:left;padding-left:2px;font-weight:bold">
							Semiprecious Cash For Real Discounts
						</div>
						<div align="center">
							<cfif len(session.mail)>
								<cfinvoke component="invitationandcredit" method="listfriends"  returnvariable="q" >
								</cfinvoke>
								<h3 style="Float:left;margin-top:20px">
									Friends Invited By You
								</h3>
								<table align="center"   border="0" style="margin:20px;">
									<tr class="form_heading">
										<Td>
											Friend's Email Id
										</Td>
										<td>
											Date Invited
										</td>
										<TD>
											Semiprecious.com Cash You Get %age of His/Her Shopping
										</TD>
										<td>
											Date Signed Up
										</td>
									</tr>
									<cfoutput query="q">
										<tr>
											<td>
												#email#&nbsp;
											</td>
											<td>
												#dateformat(dateinvited,'mm-dd-yyyy')#
											</td>
											<td>
												&nbsp;#creditpart#
											</td>
											<td>
												<cfswitch expression="#len(datesignedup)#">
													<cfcase value="0">
														<cfif url.email is email>
															<span class="bg_green">
																Invitation Sent
															</span>
														<cfelse>
															<a class="link" href="?email=#email#">
																Not Yet. Click To Invite Again
															</a>
														</cfif>
													</cfcase>
													<cfdefaultcase >
														#dateformat(datesignedup,'mm-dd-yyyy')#
													</cfdefaultcase>
												</cfswitch>
											</td>
										</tr>
									</cfoutput>
								</table>
								<ul class="arrow_ul" style="text-align:left;margin-top:20px;">
									<!---     <span class="details">Your email is  in the 'Friends Email' list automatically with a credit value of 10%.
										<br />This means you get 10% credit for next purchase from this purchase.<br />
										To use these these credits you must always login while shopping.<br />
										</span>  --->
									<li>
										You earn semiprecious.com cash every time you
										<a href="invite_new.cfm" class="reg_price link">
											invite a friend
										</a>
										to our store.
										<br />
										Every time they shop we give you semiprecious.com cash worth 7.5% of their total purchase value. Every time!
									</li>
									<li>
										You can use this cash every time you shop at semiprecious.com. And we give you semiprecious.com cash worth 20% of your own purchase.
									</li>
									<li>
										Discount is calculated on every item in your cart. It gives you 20% off on every regular priced item and 10% off on every item on sale.
									</li>

									<li>
										After above calculation of discount, the total discount cannot exceed the semiprecious.com cash available with you
									</li>

									<li>
										The discount using the semiprecious.com cash is not available if any other discount offer has been used.
									</li>
								</ul>
								<cftry>
									<cfinvoke component="invitationandcredit" method="viewcredits"  returnvariable="q">
									</cfinvoke>
<hr />
									<div style="float:left;margin-top:20px;">
                                                                            <h4>
										semiprecious.com Cash Usage Report
									</h4>
</div>
									<div style="margin-left:30px;margin-top:10px;">
										<cfoutput>
											Total Semiprecious.com Cash Earned Till Date: #format(q.totalcredit)#.
											<br />
											Semiprecious.com Cash Used Up So Far : #format(evaluate(q.totalcredit - q.balancecredit))#
											<br />
											<strong>
											Balance Semiprecious.com Cash Available:
											</strong>
											#format(q.balancecredit)#.
											<br />
											<cfif q.lastcartid neq -1>
												The Last Cart Id Semiprecious.com Cash Was Used For: #q.lastcartid#
												<br />
												Semiprecious.com Cash Used For Above Cart: #format(q.lastcreditvalue)#.
												<br />
											</cfif>
										</cfoutput>
									</div>
									<hr />
									<div align="justify">
										You don't have to use the full semiprecious.com cash in one go, you can use it in multiple trips to the store :)
									</div>
									<p>
										&nbsp;
									</p>
									</div>
									<cfcatch>
										<span style="error1">
											No semiprecious.com cash found.
										</span>
									</cfcatch>
								</cftry>
							<cfelse>
								<hr />
								<br />
								<br />
								<span style="background-Color:yellow;border:1px red solid;padding:6px;display:block;">
									<span class="error1">
										To use semiprecious.com cash you must first login
									</span>
								</span>
								<br />
								<ul>
									<li>
										If you have shopped earlier with us or have signed up
										<a href="simpleloginform.cfm">
											Login
										</a>
										to avail loyalty semiprecious.com cash.
									</li>
									<li>
										If you haven't yet signed up with us
										<a href="apply.cfm">
											sign up
										</a>
										and avail semiprecious.com cash from your and your friends' purchases and
										<cfoutput>
											#format(application.signup_points)#
										</cfoutput>
										semiprecious.com cash right now!
									</li>
								</ul>
							</cfif>
						</div>
						</td></tr></table>
					</div>	
			</div>
			<div id="mainfooter"> 
				<cfinclude template="mainfooter.cfm"> 
			</div>
		</div>

	</body>
</html>
