<CFQUERY datasource="gemssql" name="details" >
		  Select grouping, itemnumber, size, weight, style, color, storage, imagelink, inventory, price, status, saleprice,clustercount, newitem, itemnumber as optcount,description,  newitem, subcat, subcat2, cat, morepics from 
		  items where newitem=#url.option# 
	  </cfquery>
	  <cfquery name="getGroups" datasource="gemssql" >
				Select distinct groupname from itemsbygroup where itemid=#url.option#
			</cfquery>
	  <cfcontent type="text/xml" />
			<response>
			<localmethod>about_item</localmethod>
			<description>
			<cfoutput query="details">
			<cfsavecontent variable="t"><span class='green_bg side_hd'>     <cfif details.subcat neq 'wood'>
                         #ucase(subcat)# #ucase(details.subcat2)#
                          <cfloop query="getgroups" >
                            #Ucase(groupname)#
                          </cfloop>
<cfset category = details.cat />
                          <cfif category neq 'healing'>
                            #ucase(left(Category,len(category)-1))#
                            <cfelse>
                            #ucase(category)#
                            
                          </cfif></span>
                         
                        </cfif>
                        <CFIF inventory LT 1 and details.storage neq 'angela'>
This is out of stock, you can still place a request.                       
                        </cfif>
                        <br />#description#<br />
                        <b>Size:</b> 

                        <cfif details.size neq "" >
                          <cfif details.size is 0 and details.storage neq 'Angela'>
                            Select size (in inches) next to the Quantity drop down 
                          </cfif>
                          <cfif details.size LT 100>
                            <cfif details.size LT 0.2 and details.size neq 0>
							Adjustable
                              <cfelseif details.size neq 0>
                              #details.size#
                            </cfif>
                            <cfif category is "necklaces" or category is "bracelets" or category is "bags" >
inches
                              <cfelseif (category is "pendants"or category is "earrings" or category is "brouches") and details.size LT 5>
                              inches
							  <cfelseif category is "rings" >
							  (US sizing)<span class="error1">[</span>Please note we do not keep all sizes in stock. Orders for a specific size may require us to undertake customisation leading to a small delay<span class="error1">]</span>
                              <cfelseif details.size GT 0.2>
                              mm
                            </cfif>
                            <cfelse>
                            #Round(evaluate(details.size/25.4))#inches
                          </cfif>
                        </cfif>
						<cfif category is "bracelets" and details.itemnumber is "10">
							Select length above ADD TO CART button
							</cfif>

                        <cfif details.weight neq "0" and details.weight neq "" >
                          &nbsp;&nbsp;<b>Weight: </b>#details.weight#
                          <cfif category is "gems" >
Ct.
                            <cfelse>
                            gm
                          </cfif><br />
                        </cfif>
                        <cfif details.storage is 'angela'>
                          <a href='../designer_jewelry_angela.cfm'>More by Angela.</a>
                        </cfif>
                        <cfif details.storage is 'CMZP'>
                          <a href='../pettags.cfm'>Also see Pet Tags by Gymstones</a>
                        </cfif>
                        <cfif category is 'beads'>
** Unless specified differently, all strands are 16 inches.                          <br />
                          <cfif details.size neq "" and details.size GT 0>
Approx. number of beads calculate out to: #round(evaluate(16*25.4/details.size))#(this is auto calculated based on bead size entered and 16 inch strand length and can be wrong if length of strand is different or size of bead is not along the strand length)
                          </cfif>
                          <br />
                           </font>
                          <font color=red>**</font>Size and color of natural stones may vary slightly
                        </cfif>
						<cfif  clustercount mod 2>
                      <input type="hidden" name="style"  value="1" >
                         <span  class="lookinline" style="position:absolute;left:10px;top:30px;" ><a href="/gemstone.cfm?itemid=#newitem#&type=look" style="color:white;" >In Other Stones</a></span>
					</cfif>&nbsp;<cfif  details.clustercount GT 1>
                      <!--- 2 and 3 => set , 1, 3 indicate style --->
                      <input type="hidden" name="set" value="1" >
                      <span  class="setinline" style="position:absolute;left:300px;top:30px;"><a href="/gemstone.cfm?itemid=#newitem#&type=set" >Make a Set</a></span>
                    </cfif>
                   </cfsavecontent>
						#xmlformat(Variables.t)#</cfoutput>
						
			</description>
			</response>		
	
	        