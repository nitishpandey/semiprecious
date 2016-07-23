<!--- <cftry> --->
<cfparam name="del" default="no">
<cfparam name="url.id" default="#session.mail#" />

<cfparam name="id" default="#url.id#" />

	<cfset title="Your Jewellery Wish List Managed By Semiprecious.com" />

<cfif findnocase('guest',session.mail) >
	<cfset id = "">
<cfelse>
    <cfset id = session.mail />
</cfif>


	<CFINCLUDE TEMPLATE="/header#session.country#.cfm" >
<div id="container2">
<![if !IE]>
<div align="center" style="float:left;width:174px;">
	<CFINCLUDE TEMPLATE="/leftmenus.cfm" >
</div>
<![endif]>
    <div id="content_inner" style="float:left;margin-left:4px">
    	
                <div class="content_inner">
                	<div class="left_inner">
                            	    <div class="had">
                                	<h2>Helping You Manage Your Favourite Designs</h2>
                                </div>
                        <br />
                        <div class="contentstar">
                         <p>
                            	Wish list is like your personal gallery where you can record everything that you liked on semiprecious.com and you want to put off the purchase for later. 
                                You can come back after a month and it would still be there.
                            </p>
                            <br />
                           
                            <p>
                         
                                <a class="link" href="http://www.semiprecious.com/wish.cfm?order=xasdfpadf;ladsfas" style="color:#333">See In Order of Additions</a>&nbsp;
								
                                <a class="link" href="http://www.semiprecious.com/wish.cfm?oder" style="color:#333">See Category wise</a>
								
                            </p>
                            <cfif id is "">
                                <p>
                                	<![if !IE]>
                                        <span class="contactusBtn">
                                            *&nbsp;To view your wish list please <a class="link"  href='simpleloginform.cfm' style="color:#fff"><u>Sign in</u></a> 
                                            with your email address. 
                                        </span>
                                    <![endif]>
                                    <!--[if gte IE 6]>
                                        <span>
                                            *&nbsp;To view your wish list please <a class="link" href='simpleloginform.cfm' >Sign in</a> 
                                            with your email address. 
                                        </span>
                                    <![endif]-->
                                </p>
                            <cfelse>
                            	<cfif isdefined("newitem") and len(session.mail) >
				<CFQUERY NAME="wishinsert" DATASOURCE="gemssql">
                                    	delete from wish where email = '#id#' and newitem ='#newitem#'
                                    </CFQUERY>
									
									<cfif del is "no">
                                    	<CFQUERY NAME="wishinsert" DATASOURCE="gemssql">
                                    	INSERT INTO wish(email, newitem,subcat,dateadded) VALUES('#id#', '#newitem#','#category#',#Createodbcdate(Now())#)
                                    	</CFQUERY>
                                
                                    </cfif>
									<cfoutput>
										<p style="color:##CC0000">Item number #newitem# added/deleted. </p>
									</cfoutput>
			</cfif>
                                
                                
                                <cfif isdefined("url.order")>
                                    <CFQUERY DATASOURCE="gemssql" NAME="wishlist">
                                        SELECT   newitem, dateadded,subcat
                                        FROM wish
                                        WHERE email='#id#' order by dateadded desc, subcat asc
                                    </CFQUERY>
									<cfset msg = 'Latest Items Added Shown First'/>
								<cfelse>
                                    <CFQUERY DATASOURCE="gemssql" NAME="wishlist">
                                        SELECT   newitem, dateadded,subcat
                                        FROM wish
                                        WHERE email='#id#' order by subcat asc,dateadded desc
                                    </CFQUERY>
									<cfset msg = 'Same Types  of Items Shown Together'/>
								</cfif>
                              				<table border="0" cellspacing="2px" style="width:724px;border:1px ridge #dedede;" >
								<tr><td colspan=6 align=center><p style="color:#333"><b>Your Wish List -<cfoutput>#msg#</cfoutput></b></p></td></tr>
								<cfset count ="0" />

								<cfoutput query="wishlist">
                                	<cfif count eq 0>
                                    	<tr>
									</cfif>
									<td align="center" >
										<div class="look">
                                        	<a href='jewelry_item.cfm/#wishlist.newitem#.htm'  >
												<img src='images/#subcat#/thumb/#newitem#.jpg' vspace='0' hspace='0' width="80" border='0'>
                                            </a>
										</div>
                                        <![if !IE]>
											<a href="jewelry_item.cfm?itemnumber=#newitem#" class="contactusBtn" >&nbsp;&nbsp;Buy&nbsp;&nbsp;</a>
                                        <![endif]>
                                        <!--[if gte IE 6]>
                                            <a href="jewelry_item.cfm?itemnumber=#newitem#" class="contactusBtn" >Buy</a>
                                        <![endif]-->
										<p>
                                        	Date Added: #DateFormat(dateadded, "mmm/dd/yyyy")#  <br />
                                            Remove: [<a href='wish.cfm?del=yes&amp;newitem=#newitem#'><font color=red>X</font></a>]
                                        </p>
									</td>
									<cfset count = count + 1>
									<cfif count eq 6></tr><cfset count = 0></cfif>
								</cfoutput>
                                <cfif count>
                                    <cfloop from="#count#" to="5" index="j">
                                    <td>&nbsp;</td></cfloop>
                                    </tr>
                                </cfif>
                                <tr><td colspan="6">
                                	<![if !IE]>
                                        <span class="contactusBtn" style="cursor:text">
                                            &nbsp;&nbsp;*Items older than 1 year in your wish list are automatically removed.&nbsp;&nbsp;
                                        </span>
                                    <![endif]>
                                    <!--[if gte IE 6]>
                                    	<br><br>
                                        <span class="contactemail" style="cursor:text">
                                            *Items older than 1 year in your wish list are automatically removed.
                                        </span>
                                    <![endif]-->
                                </td></tr>
                                </table>
							</cfif>
                            <cfoutput>
								<!---- add a universally applicable code to clean up wish list here -...remove records older than 1 year --->
                                <table>
                                    <tr><td>&nbsp;</td><td colspan=5><br>
    									
                                        <![if !IE]>
                                        <a href="gemstone_jewelry_gallery.cfm?#session.filter#" class="contactusBtn">
                                            &nbsp;&nbsp;Back To The Gallery&nbsp;&nbsp;
                                        </a>&nbsp;&nbsp;
                                        <a class="contactusBtn" href="login.cfm">
                                            &nbsp;&nbsp;Back to your Account&nbsp;&nbsp;
                                        </a>
                                        <![endif]>
                                        
                                        <!--[if gte IE 6]>
                                        <a href="gemstone_jewelry_gallery.cfm?#session.filter#" class="contactusBtn">
                                            Back To The Gallery
                                        </a>&nbsp;&nbsp;
                                        <a class="contactusBtn" href="login.cfm">
                                            Back to your Account
                                        </a>
                                        <![endif]-->
                                    </td></tr> 
                                </table>
							</cfoutput>
						</div>
                    </div>
                </div>
  </div>
            <!---<hr style="margin-bottom:-3px" align="center" width="960px" color="#a4d5df"/>--->
            <div style="margin-bottom:0px" align="center">
				<CFINCLUDE TEMPLATE="mainfooter.cfm" />
			</div>
			</body>
	</html>
<!--- <cfcatch type="any">
<cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
</cfcatch>
</cftry> --->