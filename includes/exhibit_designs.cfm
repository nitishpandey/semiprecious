<cfparam name=sortorder default="totalqtysold">
<cfparam name=url.sortorder default="">
<cfparam name=showSoldOut default="Yes">
<cfif url.sortorder neq "">
<cfset sortorder=url.sortorder>
<cfelse><cfset url.sortorder=sortorder>
</cfif>
<cfset no_cookie_img_src = 'http://' & session.tld />
<cftry>
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
<cfparam name="displayrows" default="1" />
<cfparam name="displaycolumns" default="4" />
<cfparam name="itemslist" default="" />



<cfif not isdefined("start")>
	<cfset start = 1 />
</cfif>
<cfif not isdefined("endrow")>
	<cfset endrow = start+displayrows*displaycolumns -1 />
</cfif>
<cfif isdefined("GetList")>

	<CFLOOP QUERY="Getlist" 	startrow="#start#" endrow="#endrow#">
		<cfset itemslist = ListAppend(itemslist, newitem)>
	</cfloop>
<cfelse>
<cfset temp_list = "" />
	<CFLOOP 	from="#start#" to="#endrow#" index="index">
              <cftry>
					<cfset temp_list = ListAppend(temp_list, listgetat(itemslist,index)) />
            <cfcatch>
            <!--- if we have gone beyond the list length --->
            <cfbreak />
            </cfcatch>
            </cftry>
	</cfloop>
<Cfset itemslist  = temp_list />



</cfif>

<cfparam name="quick_add" default="1" />
<cfif quick_add>
	<cfset itembottom = '	</div></div>   	</div>' />
	<cfset itemtop  = '<div class="silver_sub1" style="float:left;
		font-size:1em;
		margin-left:-2px;
		margin-top:24px;
		overflow:hidden;
		position:relative;
		top:1px;
		width:150px;
		z-index:1;">
		<div class="silver_sub-content">' />
<cfelse>
	<!--- removed FOR making retail gallery look LIKE ws gallery WITH 5 columns.
		change includes making width 146 instead OF 188px. Making displaycolumns (matters FOR pagination possibly)
		and inclusuion OF hub_ws.css FOR retail AS well
		<cfset itembottom = '          </div>
		<div class="silver_subBottom" style="border-bottom:0px ##DFDFDF solid"><span></span></div>
		</div>' /> --->
	<cfset itembottom ="</div></div>	</div></div><!-- NO quick add-->" />
	<cfset itemtop  = '<div class="silver_sub1" style="float:left;
		margin-bottom:2px;
		margin-left:1px;
		overflow:hidden;
		position:relative;
		top:-5px;
		z-index:1" >
		<div class="silver_subTop"><span></span></div>
		<div class="silver_sub-content">
		<div class="silver_bottomBarTitle">' />
</cfif>
<cfif listlen("itemslist")>
	<cfquery name="getgallery" datasource="gemssql">

		    SELECT
		        weight,
		        size,
		        cat,
		        totalqtysold,
		        itemnumber AS optcount,
		        grouping,
		        color,
		        orderonrequest,
		        getdate() AS lastbought,
		        CASE
		            WHEN inventory>0 THEN '0'
		            ELSE '1'
		        END AS instock,
		        newitem,
		        style,
		        subcat,
		        subcat2,
		        datetaken,
		        NameID,
		        price,
		        basecost,
		        saleprice,
		        status,
		        wholesaleprice,
		        Description,
		        inventory,
		        storage,
		        thumblink,
		        imagelink,
		        buylink
		    FROM
		        items
		    WHERE
		      <cfif showSoldOut neq "yes">inventory>0 and </cfif>newitem IN (
		            #itemslist#
		        )
		    ORDER BY
		        instock, #sortorder#
	</cfquery>
	<div ID="silver_bottomTiles">
<cfset itemcount =  0 />
	<cfloop query="getgallery">
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
		<cfif (inventory GT 0) OR orderonrequest>
			<cfset status_arra = 1>
			<cfif  len(session.bulkbuyer.id)>
				<cfset l = 'AA2222'>
				<cfset price_arra = "Wholesale: " &format(wholesaleprice)>
			<cfelse>
				<cfif cgi.server_name contains "semiprecious.com">
					<cfset price_arra = "Our price "&format(price)>
				<cfelse>
					<cfset price_arra = "Our price "&format(price)>
				</cfif>
				<cfif status IS 3>
					<cfif  len(session.bulkbuyer.id)>
						<cfset l = 'AA2222'>
						<cfset price_arra = "Wholesale: " &format(wholesaleprice)>
					<cfelse>
						<CFIF getgallery.saleprice IS "" OR getgallery.Saleprice eq 0>
							<CFSET Variables.Saleprice = 0.80*price>
						<cfelse>
							<CFSET Variables.Saleprice = getgallery.saleprice*session.sale_factor />
							<!--- sale_factor SET IN session_startup.cfm used here, zoom, additem IN cfc, gemstone.cfm AND daily deals gallery AND daily deal banner --->
						</cfif>
					</cfif>
					<cfset status_arra = format(Variables.saleprice*session.sale_factor) />
				</cfif>
			</cfif>
		<cfelse>
			<cfset status_arra = 0>
			<cfif  len(session.bulkbuyer.id)>
				<cfset l = 'AA2222'>
				<cfset price_arra = "Wholesale " &format(wholesaleprice)>
			<cfelse>
				<cfset price_arra = "Our price "&format(price) />
			</cfif>
		</cfif>
		<cfset item_arra = '#newitem#_#lcase(getgallery.cat)#_#lcase(replace(replace(subcat," ","","All"),",","_","All"))#' />
		<cfoutput>
			#itemtop#
			<cfset short_desc = "Design " & newitem & ": " &   getgallery.color & " " & #lcase(getgallery.subcat)# />
			<cfif getgallery.grouping neq "">
				<cfset short_desc = short_desc & " " & #lcase(getgallery.grouping)# />
			</cfif>
			<cfset short_desc = short_desc & " " & #lcase(getgallery.cat)# />
			<cfif quick_add >
				<cfset onclick='onClick="zoom_window(#newitem#,'&"'"&'#getgallery.cat#'&"'"&',#getgallery.currentrow#,#displayrows*displaycolumns#);"' />
			<cfelse>
				<cfsavecontent variable="onclick">
		href='/gem_stone_#lcase(getgallery.cat)#.cfm/#item_arra#<cfif GROUPING neq "">_#listfirst(grouping)#</cfif>.htm'
				</cfsavecontent>
			</cfif> 
			<cfif not FileExists( "D:\home\semiprecious.com\wwwroot\images\#getgallery.cat#\thumb\#newitem#.jpg" )>
				 	   
      			<cfimage source="D:\home\semiprecious.com\wwwroot\images\#getgallery.cat#\#newitem#.jpg" action="resize" width="30%"
          	height="30%" destination="D:\home\semiprecious.com\wwwroot\images\#getgallery.cat#\thumb\#newitem#.jpg" overwrite="yes">
      		
			</cfif>
			<a name='#newitem#_anchor'
				style="margin-bottom:0;cursor:pointer;display:block;height:123px;overflow:hidden;overflow:x:hidden;" #onclick#	>
				<img style="margin-bottom:0;"
				<cfif getgallery.cat eq 'pendants' OR getgallery.cat eq 'earrings'>
					height=120
				<cfelse>
					width=120
				</cfif>
	   src='/images/#getgallery.cat#/thumb/#newitem#.jpg' title="#short_desc#" alt="#short_desc#"
				longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' />
			</a>

			<div id="#newitem#_msg_on_thumb" class="msg_on_thumb"  >
			</div>
			<div class="text_box" >
				<!---<img src='magnify.gif'  onClick="javascript:zoomImage('/images/#getgallery.cat#/#newitem#.jpg')"/>&nbsp;&nbsp; <a
				href="javascript:showDetails('#itemCount#');">Info</a><br><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Details</a>--->
				<a style="text-transform:capitalize;cursor:pointer;"  class="a#newitem#_in_cart1"
					#onclick# >
					<cfif subcat neq "">
						<br>
						#lcase(subcat)#
					</cfif>
					<cfif subcat2 neq "">
						#lcase(subcat2)#
					</cfif>
					<cfif GROUPING neq "">
						#lcase(grouping)#
					</cfif>
					<cfif getgallery.cat neq 'healing'>
						#lcase(left(getgallery.cat,len(getgallery.cat)-1))#
					<cfelse>
						#lcase(category)#
					</cfif>
				</a>
				<br />
				<div style="position:absolute;top:28px;padding:1px;height:12px;right:6px;display:inline;" class="a#newitem#_in_cart" id="#newitem#_cart_qty">
				</div>
			</div>
			<div class="ship_box" align="center">
				<div style="height:66px;">
					<div class="shipping_box" id="add_msg_#newitem#" >
						<cfif style contains "silv">
							Sterling Silver
						<cfelse>
							<br />
							<!--- TO keep SPACE occupied --->
						</cfif>
					</div>
					<cfif SIZE LT 100>
						<cfif SIZE LT 0.2 AND SIZE neq 0>
							Adjustable
						<cfelseif SIZE neq 0  >
							#size#
						</cfif>
							<cfif getgallery.cat IS "rings">
										<cfif  SIZE GT 0.2 >
											(US size)
										<cfelseif SIZE eq 0>
											Any SIZE
										</cfif>
							<cfelseif ((getgallery.cat IS "necklaces" OR getgallery.cat IS "bracelets" OR getgallery.cat IS "bags") AND SIZE neq "") or  (
							 (getgallery.cat IS "pendants" OR getgallery.cat IS "earrings" OR getgallery.cat IS "brooches") AND SIZE LT 5 AND SIZE neq "") or
							 ((getgallery.cat IS "chains") AND SIZE neq "") or (SIZE neq 0 AND getgallery.cat IS "beads")>
								in

							</cfif>
					<cfelse>
						#Round(evaluate(size/25.4))#inches
					</cfif>
					<cfif weight neq "0" AND weight neq "" >
						<b>
							#weight#
							<cfif category IS "gems" >
								Ct.
							<cfelse>
								gm
							</cfif>
						</b>
					</cfif>
					<!--- SOME items giving reverse equation
						<div class="retail_price">In stores: #round_format(8.18*basecost/application.exchangerate)#</div> --->
					<cfswitch expression="#status#">
						<cfcase value="1">
							<div class="reg_price">
								#price_arra#
							</div>
						</cfcase>
						<cfcase value="0">
							<cfif (inventory GT 0) OR orderonrequest >
								<div class="reg_price">
									#price_arra#
								</div>
							<cfelse>
								<span class="sold_out_thumb">
									Sold Out&nbsp;
								</span>
								<div class="reg_price">
									#price_arra#
								</div>
							</cfif>
						</cfcase>
						<cfdefaultcase>
							<cfif NOT len(session.bulkbuyer.id)>
								<div class="sale">
									<span class="sale_price">
										<span  title="Xmas sale" style="color:white;background:red">
											<font size=-1>Xmas Sale</font>
										</span>
										<span class="reg_price">
											#format(price)#
										</span>
										#format(saleprice*session.sale_factor)#
									</span>
								</div>
							<cfelse>
								<div class="reg_price">
									#price_arra#
								</div>
							</cfif>
						</cfdefaultcase>
					</cfswitch>
				</div>
				<cfif invent GT 0>
					<cfif  quick_add >
						<div style="display:inline;margin-top:0px;padding-top:1px;text-align:center;font-size:1em;">
							<form style="float:right;display:inline;" >
								<cfset option_needed = 0 />
								<cfif  getgallery.cat eq 'bracelets' >
									<!--- blank div OF ht 20px IS TO cater FOR options IN certain items. this can be replaced BY a CSS word --->
									<div style="height:20px;">
										&nbsp;
									</div>
									<cfif category IS "rings1">
										<!--- rings1 used TO disable this PART till we have better idea ON how TO show options --->
										US Sizes 6 to 10
										<br />
									</cfif>
								<cfelseif optcount >
									<cfquery datasource="gemssql" name="opts" cachedwithin="#createtimespan(0,1,0,0)#" >
										    SELECT
										        description,
										        optionid,
										        valueadd
										    FROM
										        options
										    WHERE
										        itemid      = #newitem#
									</cfquery>
									<cfif  opts.RecordCount GT 2>
										<cfset option_needed = 0 />
										<cfif NOT findnocase("may",opts.description[1])>
											<!--- very bad hack, but ONLY solution FOR now (2 may 2010) --->
											<cfset option_needed = 1 />
										</cfif>
										<div  class="options" align="center" style=";text-align:right;" >
											<select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"  >
												<cfloop query="opts" >
													<cfif valueadd>
														<!--- if there IS a change IN price because OF this OPTION --->
														<cfif session.bulkbuyer.id neq "" OR cgi.server_name contains "wholesale" >
															<cfset x = valueadd/2 />
														<cfelse>
															<cfset x = valueadd />
														</cfif>
														<option value="#opts.optionid#" >
															#description#&nbsp;&rarr;&nbsp;#format(x)#
														</option>
													<cfelse>
														<option value="#opts.optionid#" >
															#description#
														</option>
													</cfif>
												</cfloop>
											</select>
										</div>
									<cfelseif    opts.RecordCount GT 1>
										<cfset option_needed = 0 />
										<cfif  findnocase("may",opts.description[1])>
											<!--- very bad hack, but ONLY solution FOR now (2 may 2010) --->
											<div  class="options" align="center" style="float:right;;horizontal-align:left;" >
												<select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"   >
													<cfloop query="opts" >
														<cfif valueadd>
															<!--- if there IS a change IN price because OF this OPTION --->
															<cfif len(session.bulkbuyer.id)  >
																<cfset x = valueadd/2 />
															<cfelse>
																<cfset x = valueadd />
															</cfif>
															<option value="#opts.optionid#" >
																#description#&nbsp;&rarr;&nbsp;#format(x)#
															</option>
														<cfelse>
															<option value="#opts.optionid#" >
																#description#
															</option>
														</cfif>
													</cfloop>
												</select>
											</div>
										<cfelse>
											<div  class="options" align="center" style=";text-align:right;" >
												<select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"  >
													<option value="1" >
														#opts.description[2]#
													</option>
												</select>
											</div>
										</cfif>
									<cfelse>
										<div style="height:20px;">
											&nbsp;
										</div>
										<input type="hidden" name="optionid"  id="#newitem#_options" value="0" >
									</cfif>
								<cfelse>
									<div style="height:20px;">
										&nbsp;
									</div>
									<input type="hidden" name="optionid"  id="#newitem#_options" value="0" >
								</cfif>
								<cfif len(session.bulkbuyer.id)>
									<cfset option_needed = 0 />
								</cfif>
								<div style="float:right;">
									<a #onclick# style="float:;margin-left:1px;" class="side_link" href="javascript:">
										<img src="#no_cookie_img_src#/images/magnify.gif" height="16px" style="display:inline;" alt="view detailed photograph" align="absmiddle"  />
									</a>
									&nbsp;
									<cfif (inventory LTE 0) AND orderonrequest>
										<a href="javascript:info('aod');" style="color:red;border:1px red dotted;" >
											Make4U
										</a>
									<cfelse>
										&nbsp;&nbsp;
										<!--- quite unnecessary <span  onClick="javascript:info('quick_add_help');" >
											<img src="#no_cookie_img_src#/images/que.gif"  style="display:inline;"  />
											</span>--->
									</cfif>
									<select id="#newitem#_opt_qty" style="margin:0;margin-bottom:1px;padding:0;" name="irrelevant" onChange="javascript:add_to_cart(#newitem#,#option_needed#);return;">
										<option selected>
											Add To Cart
										</option>
										<cfif inventory GT  0 >
											<cfset temp_inv = inventory>
										<cfelse>
											<cfset temp_inv = 10 />
										</cfif>
										<cfloop from="1" to="#temp_inv#" index="j">
											<option value="#j#" >
												#j#
											</option>
										</cfloop>
										<option value="0">
											0
										</option>
									</select>
								</div>
							</form>
						</div>
					<cfelse>
						<a href='/gem_stone_#lcase(getgallery.cat)#.cfm/#item_arra#.htm' class='action_button' >
							<cfif (inventory LTE 0) AND orderonrequest>
								Make4U
							<cfelse>
								Zoom
							</cfif>
						</a>
						<cfif (inventory LTE 0) AND orderonrequest>
							<a href="javascript:info('aod');" >
								<IMG SRC="/images/que.gif" />
							</a>
						</cfif>
						<cfif getgallery.storage contains 'IN-'>
							<div style="margin-top:5px;color:red;font-weight:bold;font-family:roman">
								4 Week Delivery
							</div>
							<div style="margin-top:-3px;font-family:roman">
							<cfelse>
								<div style="margin-top:5px;font-family:roman">
						</cfif>
						<!--- Design #newitem# ---> </div>
					</cfif>
				<cfelse>
				<div style="margin-top:25px;font-family:roman"> <!--- Design #newitem# ---> </div>
				</cfif>

			#itembottom#
		</cfoutput>
		<cfset numberdisplayed = getgallery.currentrow />
		
	    </CFLOOP>
	</div>
</cfif>
