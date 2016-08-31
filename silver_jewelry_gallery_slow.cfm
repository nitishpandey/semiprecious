<<<<<<< HEAD
<cftry>
<cfsilent><!--- adding this because jewelry fails in the query --->
	<cfparam name="category" default="all" />
      <cfif category is "Jewelry">
          <cfset category = "All" />
      </cfif>
      		<cfscript>
			 	backing_bean = CreateObject("component","backing_beans.silver_jewelry_gallery_");
			 	structAppend( Variables,backing_bean.cfparam(Variables));
				 itemsinmemory = backing_bean.get_inmemory_resultset();
			    //meta data and scripts that go into the header
			     inheader = backing_bean.set_header_content();
			     // reduce memory footprint, free memory in the backingbean
			     backing_bean.reset_variables();
	     </cfscript>
	<cfif not isdefined("gETLIst.recordcount")>
		<cfset count_of_designs = 0 />
	<cfelse>
			<cfset count_of_designs = gETLIst.recordcount />
	</cfif>
<!--- header may still have computes that will have to be fixed but before fixing them, put the compute engine as and where it is used --->
</cfsilent>
<cfinclude template="/header#session.country#.cfm">
			<div style="width:100%;position:absolute;top:120;left:0;z-index:1003" align="Center">
        			<div style="width:960px;position:relative;top:-10pt;left:0;">
                			<div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;">
                			</div>
        			</div>
			</div>
 	<!--- set up for ajax add to cart --->
		<form><input type="hidden" id="ajax_context" value=gallery></form>
	<!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
			--->
			<CFIF  count_of_designs is 0>
			         <div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:630px;text-align:justify;font-size:12px;color:black;">
                           <cfoutput>
                           Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
                          <cfif salestatus is 3> that are on sale </cfif>

                          <cfif pricegreater GT 0>
                              within price range #format(priceless)# to #format(pricegreater)#
                          </cfif>
                          <!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
        		<cfinclude template="/googleadsforlist.htm">
        		---->
                     </cfoutput>
             <cfset silver = "">
             <cfif isdefined("url.relocated")>
               <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
		OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  ---> <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail>
      <cfelse>
      <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
		--->
            </cfif>
            </div> <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
		#session.mail#,#cgi.QUERY_STRING# .
		</cfmail>
		---> <br />
			 <span class="error">No Designs Found. Please Try Again.</span><br />

			  <cfif subcat is 'amber'>
				  <cfinclude template="pippinindex.htm">
			</cfif>


			<cfelse>

                           <cfset display = displaycolumns*displayrows />
                    		        <CFIF GetList2.cat is not "">
                                        <input type='hidden' name='category' value='#GetList2.cat#' />
                                      <CFELSE>
                                      <input type='hidden' name='category' value='#category#' />
                                </cfif>
					<input type='hidden' name='url.sortorder' value='#url.sortorder#' />
<!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
		LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->

                <div id="container2">
                    <h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >&nbsp;

                      <cfoutput>
		    <cfif len(trim(occasionmenu))>
		    	 #occasionmenu#
             <cfelse> <!--- <cfif session.country neq 'india'> --->
                 <cfif color neq "" or subcat neq "">
                      <cfif len(advancedsearch)>
                              <cfelse> <!--- Selection:  --->
                                       		<Cfif isnumeric(priceless)> &nbsp;
	                                            Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" />
												<a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;<br /> </Cfif> <!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or Beaded</cfif></b><br>---> <cfif len(trim(subcat)) > <cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")> <img src="/images/dots1.gif" style="display:inline;" /> <a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">#subcat# home</a>&nbsp;&nbsp;&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> <cfif listfindnocase(Application.cufflinkstones,subcat)> <a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">#subcat# cufflinks</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif>
												<cfif listfindnocase(Application.necklacestones,subcat)> <a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.Braceletstones,subcat)> <a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.ringstones,subcat)> <a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif>
												<cfif listfindnocase(Application.earringstones,subcat)> <a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.pendantstones,subcat)> <a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /> </cfif> <cfif listfindnocase(Application.beadstones,subcat)> <a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">#subcat# beads</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" />
                                             </cfif>
                                             <cfelseif  color neq "">
                                                       <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">#color# Pendants</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">#color# Rings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">#color# Earrings</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">#color# Bracelets</a>&nbsp;<img src="/images/dots1.gif" style="display:inline;" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">#color# Necklaces</a>&nbsp; <cfelseif  salestatus is 3 > <span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp; </cfif> <cfif category EQ "All" > <span style="color:black;background-color:#light#;font-size=12 px;">All Categories</span>&nbsp; </cfif> </cfif> </cfif> &nbsp; <!--- <cfelse> ---> <cfif session.country eq 'India'> <cfif pricegreater neq 0 or priceless neq ""> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> ---> #category# <cfif pricegreater neq 0> From #round_format(pricegreater)# </cfif> <cfif priceless neq ""> Up To #round_format(priceless)# </cfif> <!--- </span> ---> <cfelse> <!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> ---> <!--- <cfset kws = replace(cgi.script_name,".cfm","") /> ---> <cfset kws = #contentbypage.title# /> <cfif IsDefined('nameid') AND nameid neq ''>
														 #nameid#
														 <cfelse> #Kws#
											</cfif> <!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> ---><!--- </cfloop> ---> <!--- </span> --->
														</cfif>
														</cfif> </span>
			</cfif> <!-- #color#, #len(trim(subcat))#-->
	</h1>
	</cfoutput>
													 <CFSET columns=1>
													 <CFSET rows=1>
													 <CFSET enddisplay= start + display-1>
                                          <CFSET currentrow= start>
            <table id="container4"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">

                 <tr>
					<td>
		              <table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
		                 <tr>
		                	 <td valign="top">
				                                <cfif category neq 'gems' and category neq "cufflinks" >
				                                  <div style="float:left;display:inline;width:180px;">
				                                                   <div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
				                                                <CFINCLUDE TEMPLATE="leftmenus.cfm">
				                                        </div>
                                                                    <cfelse>
                                                                    <div style="float:left;display:inline;width:18px;">


				                                </cfif>
				                                <!---
				                                            <p>&nbsp;</p><p>&nbsp;</p>
				                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
				                                            <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
				                        		        <cfif session.country neq 'india'>
				                            		<cfcache action="serverCache" timespan="1">
				                            		    <cfinclude template="/includes/grouplist.cfm">
				                            		</cfcache>
				                                    </cfif>
				                            --->
				                </div>
		               		 </td>
		              	      <td align="center" valign="top">
			              	        <div id="semiprecious_gallery"  >


           <!--- gallery portion starts here --->

                         <cfif (Not len(session.name) or session.mail eq application.admin_email) and start lt 2>
                             <div align="left" style="width:100%; border-collapse:collapse; border:thin;">
                               <cfoutput>
                                   <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span>
                                </cfoutput>
                             </div>
                        </cfif>

         <h1 class="found_header">Showing
				<cfoutput>
						#count_of_designs# #titlecase(color)# #titlecase(subcat)#
					         <cfif groupname neq ""> #titlecase(groupname)#
							</cfif> #titlecase(url.style)#
							 <cfif len(category) GT 3> #titlecase(category)#<cfelse> Items
					         </cfif>
					         <cfif pricegreater neq "0"> Over #format(pricegreater)#</cfif>
					         <cfif priceless neq ""> Under #format(priceless)#</cfif>
					 </cfoutput>Designs
         </h1>&nbsp; &nbsp; &nbsp; &nbsp;
		<cfif ((category neq "jewelry" and category neq "All" and (not findnocase(category,GetFileFromPath(GetBaseTemplatePath())))) or (subcat neq "" and (not findnocase(subcat,GetFileFromPath(GetBaseTemplatePath())))) or (groupname neq "" and (not findnocase(groupname,GetFileFromPath(GetBaseTemplatePath()))))  or pricegreater neq "0" or priceless neq "" or (color neq "" and (not findnocase(color,GetFileFromPath(GetBaseTemplatePath())))))>
         <a class="link" href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath())#</cfoutput> >
             Clear Filters</a>
			</cfif>
      <!---   <div style="background:#EEE;width:100%;padding-left:1px;">
          <cfinclude template="/includes/searchdropdowns.cfm" />
		    </div>--->
             <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>--->
          <cfif start is 1>
		          <cfif session.cartitem[1][1] is 0>
				          <h2 id="infotable"  style="margin-left:20px;"  align="justify" >
				           <cfif subcat is 'pearl'>
				        	   <font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.
				         		</font>
				         </cfif> <!---#pagedescription#
				          <cfif color neq "">
						Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
						</cfif>--->
				        </h2>
		             </cfif>
             </cfif>
             <cfif session.mail eq application.admin_email> <!--- place to put display code --->
					<cfoutput>
						<cfif occasion is 'oos'>
							OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE
						</cfif>
				   </cfoutput>
			</cfif>
			<cfset quick_add = session.quick_add />
		                     	 <div style="margin-top:12px;margin-left:20px;float:left;">
		                  	         <cfinclude template="/includes/gallery_engine.cfm" />
		                        </div>
		                    </td>
		                   </tr>
		                </table><!---- container 3 ends --->
                </td>
                </tr>
                        <tr>
             <td>
                  <div align="center" id="cart_summary" style="z-index:6;">
        	   </div>
			 	<table id="container5"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center">
                           <tr>
							  <td>
								   <div align="center" style="margin-top:30px;">
									   <!--- Paging links --->
									  	 <cfif getgallery.recordcount GT 5>
										     <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">
										     </cfif>
									</div>
								</td>
							</tr>
			   </table> <!--- container 5 ends --->
			    </td>
			</tr>

		<tr><td align=center><br> <cfoutput>
			<cfinclude template="/includes/linkexchangebystone.cfm">
			<cfif subcat neq "">
				<cfinclude template="/marketing/stonelinks.cfm"> </cfif> </cfoutput>
		</td></tr>
	</table><!--- container 3 ends --->
	<!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
		<tr>
		<td>
		<div align="center" style="margin-top:30px;">
		--- Paging links ---
		<br>
		<br><br>
		</div>
		</td>
		</tr>
		</table>
		--->
	<cftry>
		<cfset session.gallery='/gemstone_jewelry_gallery.cfm' />
		<cfset session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#" >
		    <cfcatch type="application">
		        	<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)>
		<CFINCLUDE template="stoneinfo.inc">
	</cfif>

	<!--- Footer --->
	<!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
	</cfif>
</div> <!--- container 2 ends --->
</div><!--- top level container ends --->
	<footer>
	<script type="text/javascript">
		<!--
              document.getElementById("filter_summary").display = "block";
			//-->
          </script>
		</footer>
<cfinclude template="/mainfooter.cfm">

	<!--- End footer --->
	<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
		<div>
			<cftry>
			<cfoutput>
					<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
					Contend Edit
				</a>
			</cfoutput>
			<cfcatch>currentfile is of zero lenght. Fix at bottom of gallery page</cfcatch></cftry>
			</div>

</cfif>

	<!---
		<cfinclude template="/googleadsforlist.htm">--->



	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<!---
	<CFSET _end=GetTickCount()>
	<CFSET executiontime=_end-_start>
	<cfoutput>blah:#executiontime#</cfoutput>
	--->
=======
<cfif isdefined("Url.debug") >
	<CFSET _start = GetTickCount() />
</cfif>
<cftry>
	<cfsilent>
		<!--- adding this because jewelry fails in the query --->
		<cfparam name="category" default="all" />
		<cfif category is "Jewelry">
			<cfset category = "All" />
		</cfif>
		<cfscript>
			//create a bean or component to hold all data that is needed by the cfm view
			backing_bean = CreateObject("component", "backing_beans.silver_jewelry_gallery_");
			// move the variables scope (global) data to the backing bean Variables scope; lot of variables are being created before this template is invoked.
			structAppend(Variables, backing_bean.cfparam(Variables, replace(Trim(cgi.script_name), "/", "")));
			//As per legacy code there is an itemsinmemory query that is to be created. Create it
			itemsinmemory = backing_bean.get_inmemory_resultset();
			//meta data, css and java scripts that go into the header
			inheader = backing_bean.set_header_content();
			// reduce memory footprint, free memory in the backingbean
			backing_bean.reset_variables();
		</cfscript>
		<cfif not isdefined("getlist.recordcount")>
			<cfset count_of_designs = 0 />
		<cfelse>
			<cfset count_of_designs = getlist.recordcount />
		</cfif>
		<!--- header may still have computes that will have to be fixed but before fixing them, put the compute engine as and where it is used --->
	</cfsilent>
	<cfinclude template="/header#session.country#.cfm" />
	<cfcatch type="any">
		<cfdump var="#cfcatch#" />
		<cfabort />
	</cfcatch>
</cftry>
<cfcache  action="cache" timespan="#createtimespan(0,12,0,0)#" useQueryString="true">
	<cftry>
		<div style="width:100%;position:absolute;top:120;left:0;z-index:1003" align="Center">
			<div style="width:960px;position:relative;top:-10pt;left:0;">
				<div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;">
				</div>
			</div>
		</div>
		<!--- set up for ajax add to cart --->
		<form>
			<input type="hidden" id="ajax_context" value=gallery />
		</form>
		<!--- <div style="position:absolute;right:100px;top:6px;z-index:3;" id="fast_cart"></div>
			--->
		<CFIF  count_of_designs is 0>
			<div  style="margin-top:10px;margin-left:50px;padding:20px;border : 1px solid #ECCCC;	width:630px;text-align:justify;font-size:12px;color:black;">
				<cfoutput>
					Sorry, we are out of designs you searched in #subcat# #category# #advancedsearch# #color#
					<cfif salestatus is 3>
						that are on sale
					</cfif>
					<cfif pricegreater GT 0>
						within price range #format(priceless)# to #format(pricegreater)#
					</cfif>
					<!---		 BELOW ARE SOME ADVERTISERS WITH ITEMS WE ARE LACKING TODAY:<P>
						<cfinclude template="/googleadsforlist.htm">
						---->
				</cfoutput>
				<cfset silver = "" />
				<cfif isdefined("url.relocated")>
					<!--- To see and order any out of stock items please click here
						<a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE
						OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
					<cfmail from="service@semiprecious.com" to="anup@semiprecious.com"    server="mailA40" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
    			    for #session.mail#. #cgi.QUERY_STRING# .
   				   </cfmail>
				<cfelse>
					<!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
						--->
				</cfif>
			</div>
			<!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
				#session.mail#,#cgi.QUERY_STRING# .
				</cfmail>
				--->
			<br />
			<span class="error">
				No Designs Found. Please Try Again.
			</span>
			<br />
			<cfif subcat is 'amber'>
				<cfinclude template="pippinindex.htm" />
			</cfif>
		<cfelse>
			<cfset display = displaycolumns*displayrows />
			<CFIF GetList2.cat is not "">
				<input type='hidden' name='category' value='#GetList2.cat#' />
			<CFELSE>
				<input type='hidden' name='category' value='#category#' />
			</cfif>
			<input type='hidden' name='url.sortorder' value='#url.sortorder#' />
			<!---<div style="color:white;background:##666666;font-size:16; VERDANA,arial;line-height:2;width:350;text-align:center;font-weight:bold">
				LABOR DAY SALE <span style="padding:10;background:black">30% off all items!</span></div>--->
			<div id="container2">
				<h1 id="filter_summary" align="center" style="text-transform:capitalize;display:none;font-size:12;font-color:gray;width:90%;margin-top:4px;height:22px;" nowrap >
					&nbsp;
					<cfoutput>
						<cfif len(trim(occasionmenu))>
							#occasionmenu#
						<cfelse>
							<!--- <cfif session.country neq 'india'> --->
							<cfif color neq "" or subcat neq "">
								<cfif len(advancedsearch)>
								<cfelse>
									<!--- Selection:  --->
									<Cfif isnumeric(priceless)>
										&nbsp; Around #format(priceless)#
										<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15"
											height="15" />
										<a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&pricegreater=#pricegreater#&color=#color#&category=pendants" id="pendants_horiz">
											Pendants
										</a>
										&nbsp;
										<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=rings"
											id="rings_horiz">
											Rings
										</a>
										&nbsp;
										<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Earrings"
											id="earrings_horiz">
											Earrings
										</a>
										&nbsp;
										<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">
											Bracelets
										</a>
										&nbsp;
										<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&pricegreater=#pricegreater#&priceless=#priceless#&color=#color#&category=Necklaces"
											id="necklaces_horiz">
											Necklaces
										</a>
										&nbsp;
										<br />
									</Cfif>
									<!---<b>#titlecase(style)# #titlecase(subcat)##titlecase(color)# Gemstone #titlecase(groupname)# #titlecase(categ)# <cfif style is ""> in Sterling Silver or
										Beaded</cfif></b><br />--->
									<cfif len(trim(subcat)) >
										<cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
										<img src="/images/dots1.gif" style="display:inline;" />
										<a href="/#subcat3#.cfm" id="jewelry" title="jewelry from this stone">
											#subcat# home
										</a>
										&nbsp;&nbsp;&nbsp;
										<img src="/images/dots1.gif" style="display:inline;" />
										<cfif listfindnocase(Application.cufflinkstones,subcat)>
											<a href="/#subcat3#_cufflinks.cfm" id="cufflinks_horiz" title="cufflinks of this stone">
												#subcat# cufflinks
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
										<cfif listfindnocase(Application.necklacestones,subcat)>
											<a href="/#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">
												#subcat# necklaces
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
										<cfif listfindnocase(Application.Braceletstones,subcat)>
											<a href="/#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">
												#subcat# bracelets
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
										<cfif listfindnocase(Application.ringstones,subcat)>
											<a href="/#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">
												#subcat# rings
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
										<cfif listfindnocase(Application.earringstones,subcat)>
											<a href="/#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">
												#subcat# earrings
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
										<cfif listfindnocase(Application.pendantstones,subcat)>
											<a href="/#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">
												#subcat# pendants
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
										<cfif listfindnocase(Application.beadstones,subcat)>
											<a href="/#subcat3#_beads.cfm" id="beads_horiz" title="beads of this stone">
												#subcat# beads
											</a>
											&nbsp;
											<img src="/images/dots1.gif" style="display:inline;" />
										</cfif>
									<cfelseif  color neq "">
										<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" />
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">
											#color# Pendants
										</a>
										&nbsp;
										<img src="/images/dots1.gif" style="display:inline;" />
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=rings" id="rings_horiz">
											#color# Rings
										</a>
										&nbsp;
										<img src="/images/dots1.gif" style="display:inline;" />
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">
											#color# Earrings
										</a>
										&nbsp;
										<img src="/images/dots1.gif" style="display:inline;" />
										<a href="/gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">
											#color# Bracelets
										</a>
										&nbsp;
										<img src="/images/dots1.gif" style="display:inline;" />
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">
											#color# Necklaces
										</a>
										&nbsp;
									<cfelseif  salestatus is 3 >
										<span style="color:red ;font-size:12px;font-family: Arial;">
											On Sale
										</span>
										<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" />
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">
											Pendants
										</a>
										&nbsp;
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">
											rings
										</a>
										&nbsp;
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">
											Earrings
										</a>
										&nbsp;
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">
											Bracelets
										</a>
										&nbsp;
										<a href="/gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">
											Necklaces
										</a>
										&nbsp;
									</cfif>
									<cfif category EQ "All" >
										<span style="color:black;background-color:#light#;font-size=12 px;">
											All Categories
										</span>
										&nbsp;
									</cfif>
								</cfif>
							</cfif>
							&nbsp;
							<!--- <cfelse> --->
							<cfif session.country eq 'India'>
								<cfif pricegreater neq 0 or priceless neq "">
									<!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:large;"> --->
									#category#
									<cfif pricegreater neq 0>
										From #round_format(pricegreater)#
									</cfif>
									<cfif priceless neq "">
										Up To #round_format(priceless)#
									</cfif>
									<!--- </span> --->
								<cfelse>
									<!--- <span style="font-weight:bold;font-family:verdana san serif,color:purple;font-size:16px;"> --->
									<!--- <cfset kws = replace(cgi.script_name,".cfm","") /> --->
									<cfset kws = #contentbypage.title# />
									<cfif IsDefined('nameid') AND nameid neq ''>
										#nameid#
									<cfelse>
										#Kws#
									</cfif>
									<!--- <cfloop list="#kws#" delimiters="_-/" index="kw"> --->
									<!--- </cfloop> --->
									<!--- </span> --->
								</cfif>
							</cfif>
							</span>
						</cfif>
						<!-- #color#, #len(trim(subcat))#-->
				</h1>
				</cfoutput>
				<CFSET columns=1 />
				<CFSET rows=1 />
				<CFSET enddisplay= start + display-1 />
				<CFSET currentrow= start />
				<table id="container4"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
					<tr>
						<td>
							<table id="container3" width="100%" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px" align="center">
								<tr>
									<td valign="top">
										<cfif category neq 'gems' and category neq "cufflinks" >
											<div style="float:left;display:inline;width:180px;">
												<div style="z-index:2;<cfif cgi.server_name contains 'wholesale'>left:20px;top:-200px;</cfif>">
													<CFINCLUDE TEMPLATE="leftmenus.cfm" />
												</div>
											<cfelse>
												<div style="float:left;display:inline;width:18px;">
										</cfif>
										<!---
											<p>&nbsp;</p><p>&nbsp;</p>
											<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
											<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
											<cfif session.country neq 'india'>
											<cfcache action="serverCache" timespan="1">
											<cfinclude template="/includes/grouplist.cfm">
											</cfcache>
											</cfif>
											---> </div>
									</td>
									<td align="center" valign="top"> <div id="semiprecious_gallery"  > <!--- gallery portion starts here --->
									<cfif ((Not len(session.name)) or (session.mail eq application.admin_email)) and start lt 2>
										 <div align="left" style="width:100%; border-collapse:collapse; border:thin;"> <cfoutput> <span style="font-family:arial san serif,color:purple;font-size:12px;"> #contentbypage.description# </span> </cfoutput> </div> </cfif> <h1 class="found_header"> <cfoutput> #count_of_designs# #titlecase(color)# #titlecase(subcat)# <cfif groupname neq ""> #titlecase(groupname)# </cfif> #titlecase(url.style)# <cfif len(category) GT 3> #titlecase(category)# <cfelse> Items </cfif> <cfif pricegreater neq "0"> Over #format(pricegreater)# </cfif> <cfif priceless neq ""> Under #format(priceless)# </cfif> </cfoutput>Designs </h1> &nbsp; &nbsp; &nbsp; &nbsp; <cfif		((category neq "jewelry" and category neq "All" and (not findnocase(category,GetFileFromPath(GetBaseTemplatePath())))) or (subcat neq "" and (not
										findnocase(subcat,GetFileFromPath(GetBaseTemplatePath())))) or (groupname neq "" and (not findnocase(groupname,GetFileFromPath(GetBaseTemplatePath()))))  or pricegreater
										neq "0" or
										(priceless neq ""  and (not findnocase("under",GetFileFromPath(GetBaseTemplatePath()))))or (color neq "" and (not
										findnocase(color,GetFileFromPath(GetBaseTemplatePath())))))> <a class="link reg_price" href= <cfoutput>#GetFileFromPath(GetBaseTemplatePath())# </cfoutput> > Clear Filters </a> </cfif> <!---
										<div style="background:#EEE;width:100%;padding-left:1px;">
										<cfinclude template="/includes/searchdropdowns.cfm" />
										</div>---> <!---<cfif category is 'rings'><cfinclude template='/includes/ringsbysize.cfm'></cfif>---> <cfif start is 1> <cfif session.cartitem[1][1] is 0> <div style="position:absolute;left:20px;top:4px;z-index:1003;" class="welcome_shipping"  id="zw_1"> </div> <h2 id="infotable"  style="margin-left:20px;"  align="justify" > <cfif subcat is 'pearl'> <font color=gray size="-1"> Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee. </font> <cfelse> #pagedescription# </cfif> <!---
										<cfif color neq "">
										Showing #category# with #color# color. --- <CFINCLUDE TEMPLATE="colorinfo.inc">
										</cfif>---> </h2>
										</cfif>
									</cfif>
									<cfif session.mail eq application.admin_email> <!--- place to put display code --->
									 <cfoutput>
										 <cfif occasion is 'oos'> OUT OF STOCK ITEMS, REQUEST REMAKING FROM ZOOM PAGE
										</cfif>
									 </cfoutput>
									 </cfif>
									<cfset quick_add = session.quick_add /> <!--- The gallery engine takes the data and lays out the main gallery area ---> <div style="margin-top:14px;margin-left:20px;float:left;"> <cfcache action="servercache" usequerystring="true"    > <cfinclude template="/includes/exhibit_designs.cfm" /> </cfcache> </div> </div> </td>
								</tr>
							</table>
							<!---- container 3 ends --->
						</td>
					</tr>
					<tr> <td> <div align="center" id="cart_summary" style="z-index:6;"> </div> <table id="container5"  cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 147px" align="center"> <tr> <td> <div align="center" style="margin-top:30px;"> <!--- Paging links ---> <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm" /> </div> </td> </tr> </table> <!--- container 5 ends ---> </td> </tr> <tr> <td align=center> <br /> <cfoutput> <cfinclude template="/includes/linkexchangebystone.cfm" /> <cfif subcat neq ""> <cfinclude template="/marketing/stonelinks.cfm" /> </cfif> </cfoutput> </td> </tr>
				</table>
				<!--- container 3 ends ---> <!---<table id="container1" width="900px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 154px" align="center">
					<tr>
					<td>
					<div align="center" style="margin-top:30px;">
					--- Paging links ---
					<br />
					<br /><br />
					</div>
					</td>
					</tr>
					</table>
					---> <cftry> <cfset session.gallery='/gemstone_jewelry_gallery.cfm' /> <cfset
					session.filter="occasion=#occasion#&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#&salestatus=#salestatus#&groupname=#groupname#&stored=#stored#"
					> <cfcatch type="application"> <cfdump var="#cfcatch#" /> <cfabort /> </cfcatch> </cftry> <cfif start LT 12 and (subcat is not "" or color is not "") and not len(session.mail)> <CFINCLUDE template="stoneinfo.inc" /> </cfif> <!--- Footer ---> <!--- 		<cfinclude template="/affiliate/includes/googleaffil.cfm">--->
		</cfif>
		</div> <!--- container 2 ends ---> </div>
		<!--- top level container ends --->
		<footer>

			<script type="text/javascript">
				<!--
				document.getElementById("filter_summary").display = "block";
				//-->
			</script>
		</footer>
		<cfinclude template="/mainfooter.cfm" />
		<!--- End footer --->
		<cfif IsUserInRole("admin") or IsUserInRole("superadmin")>
			<div>
				<cftry>
					<cfoutput>
						<a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">
							Contend Edit
						</a>
					</cfoutput>
					<cfcatch>
						currentfile is of zero lenght. Fix at bottom of gallery page
					</cfcatch>
				</cftry>
			</div>
		</cfif>
		<!---
			<cfinclude template="/googleadsforlist.htm">--->
		<cfcatch type="any">
			<cfdump var="#cfcatch#" />
			<cfabort />
		</cfcatch>
	</cftry>
	<cfif isdefined("Url.debug")>
		<CFSET _end=GetTickCount()>
		<CFSET executiontime=_end-_start>
		<cfoutput>
			execution time:#executiontime#
		</cfoutput>
	</cfif>
</cfcache>
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
