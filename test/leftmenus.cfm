<!---- set anyone of them, in container page, to 'block' or "" to make that portion of left menu to come open on page open --->
<cfparam name="leftgemstonedisplay" default="none" />
<cfparam name="leftcolordisplay" default="none" />
<cfparam name="leftpricedisplay" default="open" />
<cfparam name="leftbirthstonedisplay" default="none" />
<cfparam name="category" default="all">
<cfparam name="categ" default="jewelry">

<cfif isdefined("url.live_support")>
	<cfset application.live_support = url.live_support />
</cfif>

<cfif category neq "" and category neq "all" and category neq "chains"  >
  <cfset categ = category>
<cfelse>
  <cfset categ = "jewelry">
</cfif>
<cfif category neq 'cufflinks'>


  <!--- Start color popup button --->
	<cfif application.live_support >
		<div class="component_box" align=center>
		<!--- the mouseover below requires that the span with the name daily_deal id --->
			<a class="login_link" onClick="open_live_support();" href="javascript://">
  				<img style="text-decoration:none;" src="/images/callus.png" height="25px" valign="middle" border=0 />&nbsp;
				<span style="position:relative;bottom:4px;font-size:14px;">Online Help</span>
            </a>
		</div>
 	</cfif>

		<div id="containerMenu" <cfif cgi.SERVER_NAME contains 'wholesale'>style="margin-top:50px;left:-20px;"</cfif>>
		<!-- BEGIN Menu -->

	    <ul id="mega-3" class="mega-menu">

		<cfif cgi.server_name  does not contain 'wholesale'>

			<li  style="background-color:#000"><a href="/jewelry-gemstone-clearance.cfm" ><b>Black Friday</b></a></li>

	</cfif>
			 <li><a href="/latest-<cfoutput>#titlecase(categ)#</cfoutput>.cfm" ><b>New <cfoutput>#titlecase(categ)#</cfoutput></b></a></li>
			  <li><a href="/backinstock.cfm" ><b>Back In Stock</b></a></li>
					  <li><a href="/sterling-silver-jewelry.cfm" ><b>Sterling Silver Jewelry</b></a></li>
            <cfif category neq 'gems'>
						<cfif session.country is 'india'>
							<li><a href="/india/gemstones-jewellery.cfm" ><b><cfoutput>#titlecase(categ)#</cfoutput> by Stones</b></a>
							<cfelse>
            	                                        <li><a href="/rare-stones/rare-gems-jewelry.cfm" ><b><cfoutput>#titlecase(categ)#</cfoutput> by Stones</b></a>
                              </cfif>
                                    <CFINCLUDE TEMPLATE="/subcatvertical.cfm" />

                            </li>

                        <li><a href="##"><b><cfoutput>#titlecase(categ)#</cfoutput> by Theme</b></a>
                        <cfinclude template="/includes/grouplist.cfm">
                	</li>

            </cfif>

             <cfif session.country neq 'india'>
            	<li><a href="#" ><b><cfoutput>#titlecase(categ)#</cfoutput> by Price</b></a>
                	<ul><li><a href="#">Price</a>
                             <ul>
                    	    <cfoutput>

                                <li><a href="/Jewelry-under-$10.cfm<cfif categ neq 'jewelry'>?category=#categ#</cfif>">under #round_format(10)#</a></li>
                                <li><a href="/jewelry-under-$20.cfm<cfif categ neq 'jewelry'>?category=#categ#</cfif>">#round_format(11)# to #round_format(20)#</a></li>
                             <li><a href="/jewelry-under-$30.cfm<cfif categ neq 'jewelry'>?category=#categ#</cfif>">Under #round_format(30)#</a></li>
                            <li><a href="/jewelry-under-$50.cfm<cfif categ neq 'jewelry'>?category=#categ#</cfif>">#round_format(30)# to #round_format(50)# </a></li>
                            <li><a href="/jewelry-under-$100.cfm<cfif categ neq 'jewelry'>?category=#categ#</cfif>">#round_format(50)# to #round_format(100)#</a></li>
                            <cfif not len(session.bulkbuyer.id)>
                                <li><a href="/jewelry-under-$150.cfm?">Over #round_format(100)#</a></li>
                            </cfif>
                        </cfoutput>
                        </ul>
                    </li>
                   </ul>
                </li>
             <cfelseif session.country is "india">
            	<cfoutput>
            		<li><a href="##" ><b>#categ# by Price</b></a>
                        	<ul><li><a href="##">Price</a>
                                                <ul>
                                                    <li><a href="/gemstone_jewelry_gallery.cfm?pricegreater=#(0/application.exch['india'])#&priceless=#(500/application.exch['india'])#&category=#categ#">
                                                    Upto Rs 500
                                                </a></li>
                                    <li><a href="/gemstone_jewelry_gallery.cfm?pricegreater=#(500/application.exch['india'])#&priceless=#(1250/application.exch['india'])#&category=#categ#">Rs 500 to Rs 1250</a></li>
                                    <li><a href="/gemstone_jewelry_gallery.cfm?pricegreater=#(1000/application.exch['india'])#&priceless=#(2500/application.exch['india'])#&category=#categ#">Rs 1000 to Rs 2500</a></li>
                                    <li><a href="/gemstone_jewelry_gallery.cfm?pricegreater=#(2000/application.exch['india'])#&priceless=#(5000/application.exch['india'])#&category=#categ#">Rs 2000 to Rs 5000</a></li>
                                    <li><a href="/gemstone_jewelry_gallery.cfm?pricegreater=#(5000/application.exch['india'])#&priceless=#(20000/application.exch['india'])#&category=#categ#">Above Rs 5000</a></li>
                                            </ul>
                                </li>
                    </ul>
                    </li>
                </cfoutput>
            </cfif>
            <cfoutput>

                <li><a href="##" ><b><cfoutput>#titlecase(categ)#</cfoutput> by Color</b></a>

                    	<ul><li><a href="##">Color</a>
                            	<ul>
                                    <cfloop index="Color1" list="#application.color_list#">
                                      <cfif category eq "all" or category eq "" >
                                        <li><a href="/#Color1#-gemstone-jewelry.cfm" class="side_link"> #Color1#</a> </li>
                                      <cfelse>
                                        <li><a href="/color-gem-stone/#Color1#-#categ#.cfm" class="side_link"> #Color1#</a> </li>
                                      </cfif>
                                  </cfloop>
                               	</ul>
                            </li>
                    </ul>
                </li>

            </cfoutput>

       <!---     <cfif  len(session.bulkbuyer.id)>
               	<li><a href='/bulklots.cfm' style="background-color:#799ea3;text-align:right;color:#ffffff"><b>Wholesale Lots</b></a></li>
            </cfif>--->
			<li><a href="/gold-gemstone-jewelry.cfm" ><b>Gold Jewelry</b></a></li>
			            <cfif session.country neq "india">
<li><a href="/german-silver-jewelry.cfm" ><b>German Silver</b></a></li>
<cfelse>
<li><a href="/india_jewellery_online.cfm?style=beaded" ><b>Beaded Jewelry</b></a></li>
</cfif>

			</ul>


		<!-- END Menu -->

				</div>



</cfif>