<table width="930px" id="container1" cellpadding="0"  cellspacing="0" >
	<tr valign=top> 
    	<!--- <td CELLPADDING="0" width="142px" ><!--- BEGIN LEFT SIDE STUFF --->
  			<cfset leftgemstonedisplay="inline" />
   			><CFINCLUDE TEMPLATE="/leftmenus.cfm" >
   		</td> --->
   		<td valign=top align="center" >
  		<table   border="0" cellspacing="0"  bgcolor=white width="902px" cellpadding="0" style="margin-top:0px;" >
      		<tr  valign="top" >
        		<td   valign="top" align="Center" >
        			<table   bgcolr="#ff7777" cellspacing="0" cellpadding="0" border="0"  align="center"  >
              			<!--DWLayoutTable-->
              			<tr valign="top" >
                 			<!--- Main image --->
                			<td width="560px" height="450px" align="center" padding-top:"2px" >
                				<table border="0" cellpadding="0" cellspacing="0" style="padding:1px" >
	                				<tr  valign="middle" >
	                					<td valign="middle" align="center">
											<cfoutput>
                                            <cfoutput>
                                                <h1 class="form_heading" style="color:black;">
                                                    <cfif cgi.server_name contains 'wholesale'>Wholesale </cfif>#titlecase(details.subcat)# #titlecase(details.grouping)# 
                                                    <cfif details.subcat2 neq ""> #titlecase(details.subcat2)#</cfif> 
                                                    <cfif details.style is 'silver setting'>92.5 Sterling Silver<cfelse>#titlecase(details.style)#</cfif>
                                                    <cfif details.cat neq 'healing'>#titlecase(left(details.cat, len(details.cat)-1))#</cfif>
                                                </h1>
                                                <cfset frameHeight = ''>
                                                <cftry>
                                                	<cfimage source="#application.rootfolder#\images\#folder#\#width#\#imagename#" action="info" structname="wd" />
                                                	<cfcatch type="any">
                                                    	<cflocation url="/OnNoImage.cfm?newitem=#newitem#">
                                                    </cfcatch>
                                                </cftry>
                                                <cfif wd.height GT 400 >
                                                	<cfset frameHeight = 400>
                                                <cfelse>
													<cfset frameHeight = #wd.height#>
                                                </cfif>
                                                
                                                <table border="0">
                                                    <tr>
                                                        <td valign="top">
                                                            <cfif details.morepics GT 0 and (not len(width))>
                                                                <div style="border: 0px gray ridge;padding-top:0px;background-color:white" align="left" > 
                                                                    <cfoutput>
                                                                    	<cftry> 
                                                                            <img src ='/images/#folder#/<CFIF #NameID# is "" >#newitem#.jpg<CFELSE>#NameID#.jpg</CFIF>'  
                                                                            alt="unique #subcategory# #category# Jewelry"   height="70px" border="1" style="cursor:pointer" 
                                                                            onMouseOver="swapMainImage('/images/#folder#/#imagename#');"  alt='unique #subcategory# #category# Jewelry' > 
                                                                            <cfif fileexists('#application.rootfolder#/images/#folder#/#imagename#')>
                                                                                <cfimage source="#application.rootfolder#/images/#folder#/#imagename#" action="info" structname="og" />
                                                                            </cfif>
                                                                            <cfcatch type="any">
                                                                                <cflocation url="/OnNoImage.cfm?newitem=#newitem#">
                                                                            </cfcatch>
                                                                        </cftry>
                                                                        </td>
                                                                        <td>
                                                                        <cfloop index="picCount" from="1" to=#details.morepics#>
                                                                            <CFIF #NameID# is "" >
                                                                                <cfset imagename2= newitem & "-" & picCount & ".jpg" />
                                                                            </CFIF>
                                                                            <cfif fileexists('#application.rootfolder#/images/jewelry/#category#/#imagename2#')>
                                                                                <cftry>
                                                                                	<cfimage source="#application.rootfolder#/images/jewelry/#category#/#imagename2#" action="info" structname="dg" />
                                                                                	<img src ="/images/jewelry/#category#/#imagename2#" alt="unique #subcategory# #category# Jewelry"  
                                                                                border="1" height="70px" style="cursor:pointer" 
                                                                                onMouseOver="swapMainImage('/images/jewelry/#category#/#imagename2#');" >
                                                                                    <cfcatch type="any">
                                                                                        <cflocation url="/OnNoImage.cfm?newitem=#newitem#">
                                                                                    </cfcatch>
                                                                                </cftry>
                                                                                 <cfif og.height gt dg.height>
                                                                                    <cfset frameHeight = #og.height#>
                                                                                <cfelse>
                                                                                    <cfset frameHeight = #dg.height#>
                                                                                </cfif>
                                                                            <cfelse>
                                                                                <CFQUERY datasource="gemssql" >
                                                                                    update items set morepics = morepics - 1 where newitem = #newitem#
                                                                                </cfquery> 
                                                                            </cfif> 
                                                                        </cfloop>
                                                                        <!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---> 
                                                                    </cfoutput>
                                                                </div>
                                                            </cfif>
                                                        </td>
                                                        <td valign="top" style="padding-left:5px" align = "left">
                                                            <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.semiprecious.com/jewelry_item.cfm?newitem=#newitem#&amp;layout=standard&amp;show_faces=false&amp;width=250&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:35px;" allowTransparency="true">
                                                            </iframe><br>
                                                            <font size=-1>
                                                                Enlarge:
                                                            </font>
                                                            <a href="/images/pictureonly.cfm?category=#category#&itemid=#newitem#" alt="#ucase(subcategory)# #ucase(details.subcat2)#" >
                                                                <img src="/images/magglass.jpg" border="0" width="25" height="24">
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <cfif frameHeight gt 400>
                                                	<cfset frameHeight = 400>
                                                </cfif>
                                                <cfset frameHeight = #frameHeight# + 10>
                                                <table style="width:460px;height:#frameHeight#px; margin-top:1%" cellpadding="1px" style="table-layout:fixed">
                                                    <tr>
                                                        <td width="40%" align="center">
                                                        	<div>
                                                                <!--- <img  src="/images/spacer_.gif" height="240px;" style="float:left;height:200px;width:1px;display:inline;" /> ---> 
                                                                 <!--- <cfimage source="#application.rootfolder#\images\#folder#\#width#\#imagename#" action="info" structname="wd" /> ---> 
                                                              <cfif wd.height GT wd.width and wd.height GT 375>
                                                                    <img  height="375px" id="mainimage" style="display:inline; vertical-align:middle" src ='/images/#folder#/#width#/#imagename#' alt="unique #subcategory# #category# Jewelry" border="0"/>
                                                               <cfelseif wd.width GTE wd.height and wd.width GT 450>
                                                                    <img  width="450px" id="mainimage" style="display:inline;vertical-align:middle" src ='/images/#folder#/#width#/#imagename#'   alt="unique #subcategory# #category# Jewelry"  border="0" />
                                                                <cfelse>
                                                                    <img   id="mainimage" style="display:inline;vertical-align:middle" src ='/images/#folder#/#width#/#imagename#'   alt="unique #subcategory# #category# Jewelry"  border="0" />
                                                                </cfif>	
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </cfoutput>
    									</td>
                                    </tr>
                  					<tr>
                                    	<td>
											<cfoutput>
                                                <cfif not len(width)>  
                                                    <table style="display:table">
                                                        <tr width="400px">
                                                            <td> 
                                                                <!--- <table>
                                                                    <tr>
                                                                        <td align=left>
                                                                            <iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.semiprecious.com/jewelry_item.cfm?newitem=#newitem#&amp;layout=standard&amp;show_faces=false&amp;width=250&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:35px;" allowTransparency="true"></iframe>
                                                                        </td>
                                                                        <td align=left>		 
                                                                            <font size=-1>
                                                                                Enlarge:
                                                                            </font>
                                                                                <a href="/images/pictureonly.cfm?category=#category#&itemid=#newitem#" alt="#ucase(subcategory)# #ucase(details.subcat2)#" >
                                                                                    <img src="/images/magglass.jpg" border="0" width="25" height="24" >
                                                                                </a>
                                                                                        
                                                                        </td>
                                                                    </tr>
                                                                </table> --->
                                                            </td>
                                                        </tr> 
                                                        <tr>
                                                            <td valign=top>
                                                                <div align="left" style="padding-left:2px"  >
                                                                    <font color="black" face="Verdana, Arial, Helvetica, sans-serif" >
                                                                        <h3>
                                                                            #description#
                                                                        </h3>
                                                                        &nbsp;<br>
                                                                        <cfif details.size neq 0> 
                                                                            <b>Size:</b>
                                                                        </cfif> 
                                                                        <cfif details.size neq "" >
                                                                            <cfif details.size is 0 and details.storage neq 'Angela' and cgi.server_name does not contain 'wholesale'>
                                                                
                                                                            <cfelseif category is 'rings'>
                                                                                Size will be between 6 to 9 US Size
                                                                            </cfif>
                                                                            <cfif details.size LT 100>
                                                                                <cfif details.size LT 1 and details.size neq 0 and category is 'rings'>
                                                                                    Adjustable
                                                                                <cfelseif details.size neq 0>
                                                                                    #details.size#
                                                                                </cfif>
                                                                                <cfif category is "necklaces" or category is "bracelets" or category is "bags" or category is 'healing' or category is 'chains'>
                                                                                    inches
                                                                                <cfelseif (category is "pendants"or category is "earrings" or category is "brouches") and details.size LT 7>
                                                                                    inches
                                                                                <cfelseif details.size GT 0.2>
                                                                                    mm
                                                                                </cfif>
                                                                            <cfelse>
                                                                                #Round(evaluate(details.size/25.4))#inches
                                                                            </cfif>
                                                                        </cfif>
                                                                        <cfif details.weight neq "0" and details.weight neq "" >
                                                                            <br><b>Weight: </b>#decimalformat(details.weight)#
                                                                            <cfif category is "gems" >
                                                                                Ct.
                                                                            <cfelse>
                                                                                gm
                                                                            </cfif>
                                                                        </cfif>
                                                                                    
                                                                        <CFIF invent LT 1 and orderonrequest is 1>
                                                                            <p>
                                                                                <div style="padding-right: 10px; padding-left: 10px; font-size:11pt;background-color:##CC66CC;color:white">
                                                                                    This item is MOO (Made On Order). It will take 3 to 4 weeks to deliver
                                                                                </div>
                                                                            </p>                    
                                                                        </cfif>
                                                          
                                                                        <cfif category is 'beads'>
                                                                            ** Unless specified differently, all strands are 16 inches.                          
                                                                            <br />
                                                                        </cfif>
                                                                        <br />
                                                                    </font>
                                                                    <font color=red>**</font>
                                                                    Size and color of natural stones may vary slightly
                                                                </div>   
                                                                <cfif category eq "rings" >
                                                                <!---        <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a>--->
                                                                <cfelseif category is 'pendants'><p>&nbsp;
                                                                    <a href='/chains.cfm'>Buy chains for your pendants</a>
                                                                <cfelseif category eq "necklaces" >
                                                                    <a href='http://www.semiprecious.com/jewelry_education/necklace_sizing.htm' class="highlightred" >Necklace Size Guide</a><br />
                                                                </cfif>
                                                                <br />
                                                            </td>
                                                        </tr> 
                                                    </table>
                                                </cfif>
                                            </cfoutput>
                        

											<!--- include file to display clustered items, and other category items by Anup--->
                                            
                                            <cfquery datasource="gemssql" name="getcluster">
                                                select distinct top 5 styles.itemid , 0 as orderbuy, styles.cat,inventory 
                                                from styles, itemsindia as items 
                                                where styles.itemid=items.newitem and (status = 0 or status=3) 
                                                and items.newitem=itemid and inventory>0 
                                                and styleid in
                                                (select  styleid from styles where itemid = #itemnumber#) 
                                                and itemid <>#itemnumber# 
                                                union
                                                Select top 5 newitem as itemid, 1 as orderbuy, cat, inventory 
                                                from itemsindia as items where subcat='#subcategory#' 
                                                and cat <>'#details.cat#' 
                                                and inventory>0 
                                                order by orderbuy  
                                            </cfquery>
                                                    
                                            <!--- <cfif getcluster.recordcount gt 0 >
                                                <div style="position:relative;">
                                                    <div id="zoom_like_these" style="position:absolute;top:0px;left:363px;width:250px;text-align:center;padding:2px;">
                                                    </div>
                                                    <div id="easy_string" style="display:none;">
                                                        <div style="width:inherit;text-align:center;cursor:pointer" class="grayplacard" onClick="document.getElementById('zoom_like_these').innerHTML='';">
                                                            Close Zoom Window
                                                        </div>
                                                        <div style="width:inherit;text-align:center;" class="component_box"><strong>
                                                            To Buy Click on Thumb Nail or Picture Below</strong>
                                                        </div>
                                                    </div>
                                                    <div style="position:relative;border:1px gray solid;padding:0;margin:0;border-top:2px black solid;" > 
                                                        <span style="position:absolute;top:-10px;left:30px;background-color:black;border:1px gray solid;border-left:2px black solid;border-right:2px black solid;">
                                                            &nbsp;
                                                            <font color="white" >
                                                                YOU MAY ALSO LIKE THESE &dArr;&nbsp;
                                                            </font></b>
                                                        </span>
                                                    <table border=0 cellpadding=4>
                                                    <cfset coll=0>
                                                        <tr>
                                                        <cfloop query="getcluster">
                                                            <cfset coll=coll+1>
                                                            <td align="center">
                                                                <a title="click to buy this design" href="/jewelry_item.cfm?newitem=#itemid#" >
                                                                    <img title="click to buy this design" alt="click here to buy this design" src="/images/#cat#/thumb/#itemid#.jpg" border=0>
                                                                    <cfif not getcluster.inventory and not getcluster.orderonrequest ><br /><i>
                                                                        sold out</i>
                                                                    </cfif>
                                                            </td>
                                                            <cfif coll is 4>
                                                                </tr><tr>
                                                                <cfset coll=0>
                                                            </cfif>
                                                        </cfloop>
                                                        <cfset missingTDs=#evaluate(4-coll)#>
                                                        <cfloop from="1" to="#missingtds#" index=k>
                                                            <td></td>
                                                        </cfloop>
                                                        </tr>
                                                    </table>
                                                </div>	
                                            </cfif> --->
              								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           
                                        </td>
                                    </tr>
                                </table>
								<!--- End Item Description --->
                  			<!--- End main image --->
                            </td>
                   			<!--- Right side start --->
                			<td valign="top" align=center width="140px" >
        											
								<!--- <CFFORM ACTION="https://#cgi.SERVER_NAME#/#session.cart#?country=#session.address.country_code#&amp;secure=true&cartid=#session.cartid#" METHOD="POST" NAME="wishbuy"  style="display:inline;"> --->
                                <CFFORM ACTION="https://#cgi.SERVER_NAME#/#session.cart#?secure=true&cartid=#session.cartid#" METHOD="POST" NAME="wishbuy"  style="display:inline;">
                  				<cfif session.mail is application.admin_email>
                    				<cfif category is 'bags'>
                      					<a href="/editbags.cfm?newitem=#newitem#"  />EDIT</a>
									<cfelse>
                      					<a href="/admintools/edititem.cfm?newitem=#newitem#"  />EDIT</a>
                    				</cfif>
                  				           				</cfif>
                  				<!--- End next/edit button --->
                  				<div align="left"><br />
                                	<cfif IsDefined('newitem')>
                                        <br>Item Id: #newitem#<br>
                                    </cfif>
                    				<CFIF price eq 0 and (len(session.bulkbuyer.id) is 0 )>
										Not for retail sale
                      				<CFELSEif len(session.bulkbuyer.id) and price eq 0>
                      					Not available for wholesale
                      				<cfelse>
                      					<cfif status eq 0 or status eq 3 >
                        					<font color="black" >
											<cfif len(session.bulkbuyer.id)>
												Wholesale Price:
                          					<cfelse>
                            					<br>Price:   
                          					</cfif>
                        					<span class="reg_price">#format(price)#</span>
											</FONT>
										</cfif>
                        				<cfif cgi.server_name neq "63.135.126.234" >

                          					<cfif not len(session.bulkbuyer.id)>
												<CFIF  status eq 3>
                              						<b><font color="red" size=-2><br>Sale!</font>:#format(saleprice)#</b>
												<cfelse>
													<br />
                            					</CFIF>
                          					</cfif>
                                              <div id="ajaxoutput" align="center" >
                                              <span id="erroraddingitem"  class="hidden" >Select  Failed!</span>
                                              <INPUT TYPE="hidden" NAME="bought" VALUE="buy" >
                                              <!---       <CFIF invent LT 1 and details.storage does not contain 'CM'><font color="##FF9966" >4 week delivery</font><cfelse>--->
                                              
                                              <!---</cfif>--->
                                              <br />
											  <CFIF (invent LTE 0) and not details.orderonrequest >
                                                    Sold Out <br />
                    								[	Email us if you would like us to make this design on Order]
                                                    <br />
                                              <cfelse>
							
						   						<cfif optcount and not (url.optionid)>
	                        	 					<cfquery datasource="gemssql" name="opts" >
	            			      						select description, optionid, valueadd from options where itemid = #newitem#  
	                  								</cfquery>
                            	  					<cfif opts.recordcount >    
							  		 					<div  class="optionsinlin"  style="width:100%;text-align:left" >
								  							Option 
                                                            <!--- <span style="color:red">
                                                            	&rarr;
                                                            </span> --->	 
															<cfset cfselect_required = "false">
								  		 	 				<cfset only_option = "false">
								  		 	 				<cfset start_row = 1>
															<cfif category is 'rings' and not len(session.bulkbuyer.id)>
                                                                 <cfif not findnocase('may',opts.description[1])>
                                                                     <cfset cfselect_required = "true">
                                                                     <cfset only_option = "selected">
                                                                     <cfset start_row = 2>
                                                                 </cfif>
                                                            <cfelse>
                                                                 <cfif findnocase('must',opts.description[1]) and category neq 'rings'>
                                                                  	<cfset cfselect_required = "true">
                                                                  	<cfset start_row = 2>
                                                                  	<cfset only_option = "selected">
                                                            	</cfif>
                                                        	</cfif>
								  		 
     														<cfselect style="display:inline;" id="optionidpulldown" name="optionid" required="#cfselect_required#"   >
                           										<cfif opts.recordcount GT 2 >    
																	<cfloop query="opts" startrow="#start_row#" >
        	                        									<cfif valueadd>
										    								<cfif len(session.bulkbuyer.id) > 
																				<!--- do not do this math in SQL as it rounds of to an integer --->		
																				<cfset _valueadd = valueadd/2 />
																			<cfelse>
																				<cfset _valueadd = valueadd />
																			</cfif>
		                              										<!--- if there is a change in price because of this option --->
		                             	    								<cfif url.optionid eq opts.optionid>
		                            	     	       							<option value="#opts.optionid#" selected>#listgetat(description,1)#(+$#_valueadd#)</option>
		                                       								<cfelse>
		                                	 	       							<option value="#opts.optionid#" >#listgetat(description,1)#(+$#_valueadd#)</option>
		                                	  								</cfif>
    	                           										<cfelse>
		                                   	  								<cfif url.optionid eq opts.optionid>
		                                    		    						<option value="#opts.optionid#" selected>#listgetat(description,1)#</option>
		                                     								<cfelse>
		                                    		    						<option value="#opts.optionid#" >#listgetat(description,1)#</option>
		                                  	 								</cfif>
	                                 									</cfif>
                               										</cfloop>  
																<cfelse>
								 									<!---  <option value="#opts.optionid[1]#" >#opts.description[1]#</option> --->
								   									<cfif opts.valueadd[2]>
																		<cfif len(session.bulkbuyer.id) > <!--- do not do this math in SQL as it rounds of to an integer --->
																			<cfset _valueadd = opts.valueadd[2]/2 />
																		<cfelse>
																			<cfset _valueadd = opts.valueadd[2] />
																		</cfif>
							                                      		<!--- if there is a change in price because of this option --->
							                 							<option value="#opts.optionid[2]#" #only_option#>#listgetat(opts.description[2],1)# Adds: $#_valueadd#</option>
							            							 <cfelse>
							     										<option value="#opts.optionid[2]#" #only_option#>#listgetat(opts.description[2],1)#</option>
							             							 </cfif>
																</cfif> 
															</cfselect>					 
														<cfelse>
								    						<input type="hidden" name="optionid"  id="optionid" value="0" >
														</cfif>
					     							<cfelse>
												
														<cfif url.optionid>
			                          						<cfquery datasource="gemssql" name="opts" >
								            					select description from options where itemid   = #newitem# and optionid = #url.optionid#  
				              								</cfquery>
				                  							<div style="width:100%;text-align:left;height:20px;"> 		
                                                            	Option 
                                                                <!--- <a name="instock" style="color:red;text-decoration:none;">
					                           					&rarr;</a> --->                         
 																<div  class="optionsinline"> #opts.description# </div>
                                                            </div>
				             								[<a href="jewelry_item.cfm?itemnumber=#newitem#" style="color:blue">Click Here For Other Options</a>]
				                  						</cfif>
														<input type="hidden" name="optionid"  id="optionid" value="#url.optionid#" >
			                            			</cfif>
												</div>
			                            		<!--- End item options displays --->
			                            		<div  style="padding: 2px; height: 22px; width: 98%; text-align: left;" >
				                                	<!--- Id:#newitem#<br><br> --->  
												<!--- <span style="float:right;vertical-align:top;padding-top:0;">  --->
													<cfif invent LT 4>
							   							<cfif  invent LTE 0 >
								   							<cfif orderonrequest is 1>
								  								<cfset invent = 10 />
								 									Qty
								  								<cfelse>
								  									Sold Out
								  								</cfif>
								   							<cfelse>
                              									Only #invent# in stock 
															</cfif>  
														<cfelse>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Qty
														</cfif>
                    		  							<!--- <a name="instock" style="color:red;text-decoration:none;">
					                           				<br>&rarr;
                                                        </a> --->                         
			             								<br>
                                                        <select id="quantity" style="margin-bottom:2px;" name="quantity" >
                                                            <cfloop from="1" to="#invent#" index="j">
                                                                <cfif url.existqty eq j>
                                                                    <option value="#j#" selected >#j# in Cart</option>
                                                                <cfelse>
                                                                    <option value="#j#" >Buy #j#</option>
                                                                </cfif>
                                                                
                                                            </cfloop><option value="0" >Remove</option>
                                                        </select>
						 							</span>
						 						</div>
                                                <br><br>		
						 						<div style="text-align:left;height:62px;">
                                                	<br>
						 							<cfif (details.inventory GT 0) or details.orderonrequest>
														<!--- <span style="float:right;height:22px"> ---> 
															<input style="display:inline;width:101px;height:21px;margin-top:1px;font-weight:600;" 
                                                            class="action_button" type=submit value="Add to Cart" name="Add to cart">        
        	
															<input type="button" class="hidden" id="a2cw" value="Wait..." >
														<!--- </span> --->
                                                        <br>
														<cfif session.country is "india" >
															<font color="##CC0000"><b>SHIPS in 24 hrs</b></font>
                              							<cfelse>
								 							<cfif details.inventory GT 0 >
			                         							<cfif details.storage contains 'IN'>
										     						<span style="color:red;text-decoration:underline;cursor:pointer;" onClick="document.getElementById('delivery').innerHTML=document.getElementById('del').innerHTML;" >
                                                                    	Delivery?
                                                                    </span>
																	<span id="delivery">
																		<span id="del" style="display:inline-block;">
                                                                        	Regular: 
																			<cfoutput>
                                                                            	#dateformat(dateadd('d',12,now()),"d-mmm")#<br />
																				Priority: #dateformat(dateadd('d',10,now()),"d-mmm")#<br />
																				Express: #dateformat(dateadd('d',8,now()),"d-mmm")#
																			</cfoutput>
                                                                        </span>
                                                                    </span>
			                                					<cfelse>
                                                                    <span style="color:green;;text-decoration:underline;cursor:pointer;" onClick="document.getElementById('delivery').innerHTML=document.getElementById('del').innerHTML;" >
                                                                        Delivery?
                                                                    </span>
                                                                    <span id="delivery">
                                                                        <span id="del" style="display:inline-block;">
                                                                            Regular: 
                                                                            <cfoutput>
                                                                                #dateformat(dateadd('d',8,now()),"d-mmm")#<br />
                                                                                Priority: #dateformat(dateadd('d',7,now()),"d-mmm")#<br />
                                                                                Express: #dateformat(dateadd('d',5,now()),"d-mmm")#
                                                                            </cfoutput>
                                                                        </span>
                                                                    </span>
		                              							</cfif>
		                          							<cfelseif details.orderonrequest>
		                              							<cfif details.inventory LTE 0 and details.orderonrequest>
			                         								<span>     
                                                                    <a href="javascript:alert('This design is manufactured on demand. This request will add 1 more week to your cart shipment.')" class="error1">
                                                                    	This item Made on Order
                                                                    </a>
									 							</cfif>
		                          							</cfif>
                            							</cfif>
                          							</cfif>
 													&nbsp; &nbsp; &nbsp;
                                                </span>
                                            </div>
			                          </cfif>
       									<div style="text-align:left">
  										<a href='#session.gallery#?#session.filter####newitem#_anchor'  class="login_link">Back to Gallery</a>
										<br>
									 	<INPUT TYPE="button" id="a2wl" class="login_link" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List" />
										<font color=gray>
                                        	<br><br>Need more
											than available?<br> Call/email us
                                       	</font>
									 	
                                        <cftry>
                    						<cfif  details.clustercount mod 2><br>
                      							<input type="hidden" name="style"  value="1" >
                      							<span  class="look" ><a href="/gemstone.cfm?itemid=#newitem#&type=look" style="color:white;" >
                                                	This Design in Other Stones</a>
                                                </span>
											<cfelse>
												<div style="height:80px;width:20px;">&nbsp;</div>
                    						</cfif>
                    						<cfcatch type="any" >
                      							<cfquery datasource="gemssql" >
			            							update items set clustercount =  0  where newitem = #details.newitem#
				 								</cfquery>
                    						</cfcatch>
                  						</cftry>
                                        <cftry>
											<cfif  details.clustercount GT 1>
                                              <!--- 2 and 3 => set , 1, 3 indicate style --->
                                              <input type="hidden" name="set" value="1" >
                                              <span  class="set" ><a href="/gemstone.cfm?itemid=#newitem#&type=set" >Make A Set</a></span>
                                            </cfif>
                                            <cfcatch type="any" >
                                              <cfquery datasource="gemssql" >
                                                update items set clustercount =  0  where newitem = #details.newitem#
                                             </cfquery>
                                            </cfcatch>
                                      	</cftry>
                                        <br />
                                        <cfif category is  "beads" and len(session.bulkbuyer.id)>
                                            <a href="/semiprecious-stone-beads.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory# #category#</cfoutput></a>
                                        <cfelseif category is 'gems'>
                                                <a href="/gems.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory#<br> #category#</cfoutput></a>
                                        <cfelse>
                                            <a href="/gemstone_jewelry_gallery.cfm?category=#category#&subcat=#subcategory#" >More <cfoutput>#subcategory#<br> #category#</cfoutput></a>
                                          </cfif>
                                          <br /><br />
										<cfoutput>
                  							<a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >Ask Us</a>
										</cfoutput><br />
                                        <a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >
                                            <img src="/images/help.gif" border="0" vspace="0" hspace="0" align="absmiddle" width="43" height="30" >
                                        </a> 
			                          	</div>
			                         <!--  <a style="display:block;margin-top:14px;width:100px;height:20px;border:1px purple solid ;text-decoration:none;" class="greenbutton" accesskey="Z" href="/wish.cfm"  >See Wish List</a>
									  --> 
			                          
			                          <!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#>Tell a Friend</a>--->
			                          <INPUT TYPE="hidden" NAME="cart" VALUE="#session.cart#" />
			                          <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#" />
			                          <input type="hidden" name="invent" value="#invent#" />
			                          <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#" />
			                          <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="
									   <cfif  len(session.bulkbuyer.id)>
							 #decimalformat(details.wholesaleprice)#
							 <cfelse>
							<CFIF status is 3>#decimalformat(details.saleprice*session.sale_factor)#<cfelse>#decimalformat(details.price)#</cfif></cfif>" />
			                          <INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#" />   
			                          <!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
                          <cfelse>
			                          
										Item Not Available.
			                          Need it? Email us.
			                          
                    	    </cfif>
                      </CFIF>
					</CFFORM>
                  
        	         </div>
</div>
	                  <br /> 
     
</td></cfoutput>


		<td align="center" >
					<!--- &nbsp;&nbsp;&nbsp;&nbsp;<cfoutput><a title	 ="Check Cart and start checkout" href="/#session.cart#?country=#urlencodedformat(session.address.country_code)#&amp;pehp=3e.2210&amp;cartid=#session.cartid#" ></cfoutput><img alt="shopping cart and start checkout" src=/images/add_to_cart_icon.jpg></a><br />&nbsp;&nbsp;&nbsp;&nbsp;<b>CART</b><br><br>
					--->
				<cfparam name="category" default="jewelry" >
                <cfparam name="numbershow" default=6>
		          <cfif session.cartid mod 2>
			        <cfif category is "pendants" or category is "necklaces" >
            	      <cfset numbershow=4>
                	</cfif>
	                <cfquery name="findGroup" datasource="gemssql" >
						Select top 1 groupname from itemsbyGroup where itemid=#itemnumber# 
					</cfquery>
					<cfif findgroup.recordcount gt 0>
            	    <cfquery name="groupitems" datasource="gemssql" >
						Select top #numbershow# itemID from itemsBygroup, items where itemsbygroup.itemid = newitem and GroupName='#findGroup.groupname#' 
					<cfif category neq "All" >and category = '#category#'</cfif> and category <>'gems' and itemid <> #itemnumber# and inventory>0 and (items.status =0 or items.status=3) order by disporder
					</cfquery>
                <cfif groupitems.recordcount GT 0 and  len(findGroup.groupname)>
				 <cfoutput query="groupitems" >
				 		<a href=/detail.cfm?newitem=#itemid#><img src=/images/#category#/thumb/#itemID#.jpg border=0 width=75></a><br />
                    </cfoutput>
					<cfoutput>
						<a href="/shaped/#findGroup.groupname#-gemstone-#category#.cfm">More #findGroup.groupname# #category#</a>
					</cfoutput>
                <cfelse> <!--- not in any theme, show same stone items in different categories--->
					<cfquery name="othercatbestsellers" dbtype="query" >
						Select top 6 newitem, cat from detailsinmemory where subcat='#subcategory#' and cat <>'#details.cat#' and cat <> 'beads' and cat<>'gems' and (status=0 or status=3) and inventory>0 order by newitem 
					</cfquery>
					 <cfoutput>More...<br /></cfoutput>
				 <cfoutput query="othercatbestsellers" ><a href="detail.cfm?newitem=#newitem#"><img src="/images/#othercatbestsellers.cat#/thumb/#newitem#.jpg" border="0" width="75"></a><br />
                    </cfoutput>
										<cfset subcat3 = replace(trim(subcategory)," ","")>
										<cfoutput><a href="/#subcat3#_jewelry.cfm">More #subcategory# Jewelry</a>
					</cfoutput>
                
				</cfif>
				<cfelse>
				&nbsp;
				</cfif>
				</cfif>
                <!--- End 4th column --->
            </td>

		<td align="right">
          	<cfif getcluster.recordcount gt 0 >
        		<div style="position:relative;">
        			<div id="zoom_like_these" style="position:absolute;top:0px;left:363px;width:250px;text-align:center;padding:2px;"></div>
						<div id="easy_string" style="display:none;">
                        	<div style="width:inherit;text-align:center;cursor:pointer" class="grayplacard" onClick="document.getElementById('zoom_like_these').innerHTML='';">
                            		Close Zoom Window
                            </div>
						<div style="width:inherit;text-align:center;" class="component_box">
                        	<strong>
                            	To Buy Click on Thumb Nail or Picture Below
                            </strong>
                        </div>
					</div>
					<!--- <div style="position:relative;border:1px gray solid;padding:0;margin:0;border-top:2px black solid;" > 
        				<span style="position:absolute;top:-10px;left:30px;background-color:black;border:1px gray solid;border-left:2px black solid;border-right:2px black solid;">&nbsp; --->
                        <table border=0 cellpadding=4 style="border-collapse:collapse" width="180px" align="right">
                        	<tr>
                            	<td>
                                	
                                	<strong>CONSIDER THESE &dArr;</strong>
                                </td>
                            </tr>
                            <cfoutput query="getcluster">
                                <tr>
                                    <td align="right">
                                        <a title="click to buy this design" href="/jewelry_item.cfm?newitem=#itemid#" >
                                            <img title="click to buy this design" alt="click here to buy this design" src="/images/#cat#/thumb/#itemid#.jpg" border=0 width="75px">
                                        </a>
                                        <cfif not getcluster.inventory and not getcluster.orderonrequest >
                                            <br /><i>sold out</i>
                                        </cfif>
                                    </td>
                                </tr>
                            </cfoutput>
                        </table>
                    </div>	
        		</cfif>
          	</td>


                </tr>
            </table>
       </TD>
      </tr></table></td></tr>
        <tr><td align="center" colspan="2" >
        <!--- Footer --->
             <cfinclude template="/mainfooter.cfm" >
         <!--- End footer --->

        </td>
		</tr>
      
      <!-- cgi -->
    </TABLE>