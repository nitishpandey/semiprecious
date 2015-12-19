<div style="position:absolute;left:20px;top:4px;z-index:3;" class="welcome_shipping"  id="zw_1"></div>
 <div style="position:absolute;left:50px;top:250px;z-index:3;" class="welcome_shipping"  id="zw_2"></div>
 <div style="position:absolute;left:70px;top:540px;z-index:3;" class="welcome_shipping"  id="zw_3"></div>
 <div style="position:absolute;left:90px;top:800px;z-index:3;" class="welcome_shipping"  id="zw_4"></div>
 <div style="position:absolute;left:110px;top:1030px;z-index:3;" class="welcome_shipping"  id="zw_5"></div>
 <div style="position:absolute;left:140px;top:1300px;z-index:3;" class="welcome_shipping"  id="zw_6"></div>
 <div style="position:absolute;left:150px;top:1549px;z-index:3;" class="welcome_shipping"  id="zw_7"></div>
<cfset no_cookie_img_src = 'http://' & session.tld />   <cftry>
            <cflock name="checkMemory" type="exclusive" timeout="1" throwontimeout="yes">
                <cfset runtime = CreateObject("java","java.lang.Runtime").getRuntime()>
                <cfset freeMemory = runtime.freeMemory() / 1024 / 1024>
                <cfif freeMemory lt 100>
                    <cfset objSystem = CreateObject( "java", "java.lang.System" )>
                    <cfset objSystem.gc()>
                            </cfif>
                            
            </cflock>
            <cfcatch type="any">
                failed
            </cfcatch>
        </cftry>
        <cfparam name="quick_add" default="1" />
<div ID="silver_bottomTiles">

<!--- below displaycolumns  should not be changed unless it can also be changed in quick_add.js which computes zoom window
based on assumed size of page --->

      <cfif quick_add>
      <cfset itembottom = '   	</div>' />
      <cfset itemtop  = '<div class="silver_sub1" style="float:left;
font-size:1em;
margin-left:4px;
margin-top:24px;
overflow:hidden;
position:relative;
top:1px;
width:146px;
z-index:1;">
           <div class="silver_sub-content">' />
      <cfelse>
      <!--- removed for making retail gallery look like ws gallery with 5 columns.
	change includes making width 146 instead of 188px. Making displaycolumns (matters for pagination possibly)
	and inclusuion of hub_ws.css for retail as well 
	<cfset itembottom = '          </div>
        <div class="silver_subBottom" style="border-bottom:0px ##DFDFDF solid"><span></span></div>
	</div>' /> --->
	<cfset itembottom ="</div></div>" />
      <cfset itemtop  = '<div class="silver_sub1" style="float:left;
margin-bottom:2px;
margin-left:-4px;
overflow:hidden;
position:relative;
top:-5px;
width:146px;
z-index:1" >
        <div class="silver_subTop"><span></span></div>
           <div class="silver_sub-content">
            	<div CLASS="silver_bottomBarTitle">' />
</cfif>

<CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#evaluate(start+displayrows*displaycolumns-1)#">
    
		<cfset itemCount = itemCount + 1>
	<cfif inventory GT 0 >
    <CFSET invent=inventory >
		<cfelseif orderonrequest >
	<CFSET invent= 10 >
	<cfelse>
	<cfset invent = 0 />
	</cfif>
	
	<!--- CCH
						<td class="rowb" style="border-left:0px solid black;" width="30%" onClick="hideAll(); div#itemCount#.style.display = 'block';">
--->
        <cfif (inventory GT 0) or orderonrequest>
          <cfset status_arra = 1>
	         <cfif  len(session.bulkbuyer.id)>
    	          <cfset l = 'AA2222'>
	              <cfset price_arra = "Wholesale: " &format(wholesaleprice)>
			
            <cfelse>
					<cfif cgi.server_name contains "semiprecious.com">
                    <cfset price_arra = "Our price: "&format(price)>
                    <cfelse>
                    <cfset price_arra = "Our price: "&format(price)>
				</cfif>
            
			<cfif status is 3>
              
                <cfif  len(session.bulkbuyer.id)>
    	          <cfset l = 'AA2222'>
	              <cfset price_arra = "Wholesale: " &format(wholesaleprice)>
	            <cfelse>		
            	<CFIF getList.saleprice is "" or getList.Saleprice eq 0>
            	    <CFSET Variables.Saleprice = 0.80*price>
				<cfelse>
					<CFSET Variables.Saleprice = getlist.saleprice*session.sale_factor />
		       </cfif>
	            </cfif>
               <cfset status_arra = format(Variables.saleprice*session.sale_factor) />
            </cfif>
          </cfif>
          <cfelse>
          <cfset status_arra = 0>
           <cfif  len(session.bulkbuyer.id)>
    	          <cfset l = 'AA2222'>
	              <cfset price_arra = "Wholesale: " &format(wholesaleprice)>
	            <cfelse>
          <cfset price_arra = "Our price: "&format(price) >
          </cfif>
        </cfif>
        <cfset item_arra = '#newitem#_#lcase(cat)#_#lcase(replace(replace(subcat," ","","All"),",","_","All"))#'>
      <cfoutput>
       #itemtop#

<div class="thumbnail_box">
<cfset short_desc = "Design " & newitem & ": " &   getlist.color & " " & #lcase(getlist.subcat)# />
<cfif getlist.grouping neq ""> 
<cfset short_desc = short_desc & " " & #lcase(getlist.grouping)# />
</cfif>
<cfset short_desc = short_desc & " " & #lcase(getlist.cat)# />
<cfif quick_add >
	<cfset onclick='onClick="zoom_window(#newitem#,'&"'"&'#cat#'&"'"&',#getlist.currentrow#,#displayrows*displaycolumns#);"' />
<cfelse>
<cfsavecontent variable="onclick">
	href='/gem_stone_#lcase(cat)#.cfm/#item_arra#<cfif grouping neq "">_#listfirst(grouping)#</cfif>.htm'
</cfsavecontent>
</cfif>
			   	<a name='#newitem#_anchor' 
			   		style="margin-bottom:0;cursor:pointer;" #onclick#	>
			   	  <img style="margin-bottom:0;"   src='#no_cookie_img_src#/images/#getlist.cat#/thumb/#newitem#.jpg' title="#short_desc#" alt="#short_desc#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' />
				 </a>
		<div id="#newitem#_msg_on_thumb" class="msg_on_thumb"  ></div>		 
</div> 
 <div class="text_box" >
           <!---<img src='magnify.gif'  onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')"/>&nbsp;&nbsp; <a href="javascript:showDetails('#itemCount#');">Info</a><br><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Details</a>--->
<a style="text-transform:capitalize;cursor:pointer;"  class="a#newitem#_in_cart1" 
	#onclick# >
                <cfif subcat neq "">
                  <br>
                  #lcase(subcat)#
                </cfif>
                <cfif subcat2 neq "">
                  #lcase(subcat2)#
                </cfif>
                <cfif grouping neq "">
                  #lcase(grouping)#
                </cfif>
                <cfif getlist.cat neq 'healing'>
                  #lcase(left(getlist.cat,len(getlist.cat)-1))#
                  <cfelse>
                  #lcase(category)#
                </cfif>
                </a>
    <br />
 	  	 
     <div style="position:absolute;top:28px;padding:1px;height:12px;right:6px;display:inline;" class="a#newitem#_in_cart" id="#newitem#_cart_qty">
	</div>

</div>
		
<div class="ship_box" align="center">
				 <div style="height:66px;"> <div class="shipping_box" id="add_msg_#newitem#" >
				 <cfif style contains "silv">
Sterling Silver<cfelse><br /><!--- to keep space occupied ---></cfif></div>
		                 <cfif size LT 100>
                            <cfif size LT 0.2 and size neq 0>
							Adjustable
                              <cfelseif size neq 0  >
                              #size#
                            </cfif>
                            <cfif (getlist.cat is "necklaces" or getlist.cat is "bracelets" or getlist.cat is "bags") and size neq "" >
								in
                              <cfelseif (getlist.cat is "pendants" or getlist.cat is "earrings" or getlist.cat is "brooches") and size LT 5 and size neq "">
                              in
							  <cfelseif getlist.cat is "rings" and size GT 0.2 >
							  (US size)
                               <cfelseif size eq 0 and getlist.cat is "rings">
							   Any Size
                               <cfelseif size neq 0 and getlist.cat is "beads">
							  in
							  <cfelseif (getlist.cat is "chains") and size neq "">
                              in
							</cfif>
                            <cfelse>
                            #Round(evaluate(size/25.4))#inches
                          </cfif>
                       <cfif weight neq "0" and weight neq "" >
                          <b> </b>#weight#
                          <cfif category is "gems" >
								Ct.
                            <cfelse>
                            gm
                          </cfif>
                        </cfif>
<div class="retail_price">In Stores: #round_format(8.18*basecost/application.exchangerate)#</div>
	  <cfswitch expression="#status#">
            <cfcase value="1">
	        <span class="reg_price">#price_arra#</span> 
            </cfcase>
            <cfcase value="0">
			<cfif (inventory GT 0) or orderonrequest >
	        <span class="reg_price">#price_arra#</span> 
		<cfelse>
            <span class="sold_out_thumb">Sold Out&nbsp;</span><span class="reg_price">#price_arra#</span> 
    </cfif>   
	     </cfcase>
            <cfdefaultcase>
           <cfif not len(session.bulkbuyer.id)> <span class="sale">
            <span class="reg_price">#format(price)#</span><span class="sale_price">Sale! #format(saleprice*session.sale_factor)#</span>
			
			</span>	 
			<cfelse>
			<span class="reg_price">#price_arra#</span> 
            
			</cfif>
			</cfdefaultcase>
          </cfswitch> 
		  </div>
<cfif invent GT 0>
	 <cfif  quick_add >
		  	 <div style="display:inline;margin-top:0px;padding-top:1px;text-align:center;font-size:1em;">
		            	<form style="float:right;display:inline;" >
			<cfset option_needed = 0 />
			<cfif  cat eq 'bracelets' ><!--- blank div of ht 20px is to cater for options in certain items. this can be replaced by a CSS word --->
			<div style="height:20px;">&nbsp;</div><cfif category is "rings1"><!--- rings1 used to disable this part till we have better idea on how to show options --->
				  US Sizes 6 to 10<br />
				 </cfif>
				      <cfelseif optcount >
			              <cfquery datasource="gemssql" name="opts" >
		                  select description, optionid,	valueadd from options where itemid      = #newitem#  
		                  </cfquery>
		                 <cfif  opts.RecordCount GT 2>
								<cfset option_needed = 0 />
								<cfif not findnocase("may",opts.description[1])> <!--- very bad hack, but only solution for now (2 may 2010) --->
									<cfset option_needed = 1 />
							   </cfif>
								 <div  class="options" align="center" style=";text-align:right;" >
		                    	 <select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"  >
								 	<cfloop query="opts" >
		                                  <cfif valueadd>
		                                      <!--- if there is a change in price because of this option --->
		                                        <cfif session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale" >
													<cfset x = valueadd/2 />
												<cfelse>
													<cfset x = valueadd />
												</cfif>  
												<option value="#opts.optionid#" >#description#&nbsp;&rarr;&nbsp;#format(x)#</option>
		                                      <cfelse>
		                                        <option value="#opts.optionid#" >#description#</option>
		                                    </cfif>
		                                  </cfloop>
				                        </select>
		                              </div>
								<cfelseif    opts.RecordCount GT 1>
								  	<cfset option_needed = 0 />
									  <cfif  findnocase("may",opts.description[1])>
										 	   <!--- very bad hack, but only solution for now (2 may 2010) --->
									    		 <div  class="options" align="center" style="float:right;;horizontal-align:left;" >
													<select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"   >
												 	<cfloop query="opts" >
				                                    	<cfif valueadd>
		                                      <!--- if there is a change in price because of this option --->
			                                         	<cfif len(session.bulkbuyer.id)  >
															<cfset x = valueadd/2 />
												      	<cfelse>
															<cfset x = valueadd />
												 		</cfif>  
														<option value="#opts.optionid#" >#description#&nbsp;&rarr;&nbsp;#format(x)#</option>
		                                       	<cfelse>
		                                        	<option value="#opts.optionid#" >#description#</option>
		                                    	</cfif>
		                                  </cfloop>
				                        </select>
		                              </div>
										  <cfelse>
											 <div  class="options" align="center" style=";text-align:right;" >
							                     <select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"  >
												      <option value="1" >#opts.description[2]#</option> 
												</select>
											</div>
		                               </cfif>
										  
								
										  <cfelse>
									<div style="height:20px;">&nbsp;</div>	<input type="hidden" name="optionid"  id="#newitem#_options" value="0" >
									 	 </cfif>
		                              <cfelse>
		                           <div style="height:20px;">&nbsp;</div> <input type="hidden" name="optionid"  id="#newitem#_options" value="0" >
		                            </cfif>
									<cfif len(session.bulkbuyer.id)>
										<cfset option_needed = 0 />
										</cfif>
									<div style="float:right;">
											<a #onclick# style="float:;margin-left:1px;" class="side_link" href="javascript:">
		                                    <img src="#no_cookie_img_src#/images/magnify.gif" height="16px" style="display:inline;" alt="view detailed photograph" align="absmiddle"  /></a>&nbsp;
				<cfif (inventory LTE 0) and orderonrequest><a href="javascript:info('aod');" >M4M</a>
				<cfelse>&nbsp;&nbsp;<span  onClick="javascript:info('quick_add_help');" > <img src="#no_cookie_img_src#/images/que.gif"  style="display:inline;"  /></span></cfif>
<select id="#newitem#_opt_qty" style="margin:0;margin-bottom:1px;padding:0;" name="irrelevant" onChange="javascript:add_to_cart(#newitem#,#option_needed#);return;">
							<option selected>Add to cart</option>
							<cfif inventory GT  0 >
							<cfset temp_inv = inventory>
							<cfelse>
									<cfset temp_inv = 10 />
								  </cfif>
		<cfloop from="1" to="#temp_inv#" index="j">
		<option value="#j#" >#j#</option>
		</cfloop>
		<option value="0">0</option>
		</select></div>
		 </form>
		</div>
		<cfelse>	   
	  <a href='/gem_stone_#lcase(cat)#.cfm/#item_arra#.htm' class='action_button' >
    <cfif (inventory LTE 0) and orderonrequest>Make4Me<cfelse>Zoom/Buy</cfif>
       </a> 
	<cfif (inventory LTE 0) and orderonrequest><a href="javascript:info('aod');" ><IMG SRC=/images/que.gif></a></cfif>
	<br /> ID: #newitem#

	</cfif>  	
<cfelse>
	<br /> ID: #newitem#

</cfif>
</div>
		            </div>
#itembottom#
	    </cfoutput>

      <cfset numberdisplayed = getlist.currentrow - start+1 />
  </CFLOOP>
 </div>
