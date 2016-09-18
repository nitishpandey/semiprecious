<!-- jewelry_Item.cfm starts -->
<cftry>
	<cfsilent>
		<CFPARAM NAME="wd.height" DEFAULT= "350" />
		<CFPARAM NAME="testing" DEFAULT= "no" />
		<cfparam name="cfselect_required" default="true">
		<cfset summary = " " />
		<CFPARAM NAME="orderonrequest" DEFAULT= "1" />
		<CFPARAM NAME="country" DEFAULT= "" />
		<CFPARAM NAME="designer" DEFAULT= "" />
		<cfparam name="session.address.country_code" default="" />
		<CFPARAM NAME="session.gallery" DEFAULT= "gemstone_jewelry_gallery.cfm" />
		<CFPARAM NAME="session.filter" DEFAULT= "sortorder=datetaken" />
		<cfparam name="style_for_added" default="" />
		<CFPARAM NAME="description" DEFAULT="" />
		<CFPARAM NAME="Price" DEFAULT= "1000" >
		<CFPARAM NAME="width" DEFAULT= "" >
		<cfparam name="pimg" default="" >
		<cfparam default="0" name="valueadd" >
		<cfparam name="status" default="0" >
		<cfparam name="url.optionid" default="0" >
		<cfparam name="url.quantity" default="1" type="numeric" >
		<cfparam name="url.existqty" default="0" >
		<CFPARAM NAME="SalePrice" DEFAULT= "" >
		<CFPARAM NAME="category" DEFAULT= "" >
		<CFPARAM NAME="subcategory" DEFAULT= "" >
		<CFPARAM NAME="stonename" DEFAULT= "" >
		<cfparam name="metatitle" default="">
		<cfparam name="session.screenwidth" default="833" type="numeric" />
		<CFPARAM NAME="cart" DEFAULT="" />
		<CFPARAM NAME="invent" DEFAULT="" />
		<cfparam name="title" default="Semiprecious Silver Jewelry - peridot, amethyst necklaces, bracelets, pendants" />
		<CFPARAM NAME="editcart" DEFAULT="" />
		<CFPARAM NAME="url.filter" DEFAULT="" />
		<cfparam name="numbershow" default=6>
		<CFPARAM Name="DSNNAME" default="semiprecious" >
		<CFPARAM name="imageloc" default="web" >
		<CFPARAM name="Currencyexchange" default="1" >
		<CFPARAM name= "PicWidth" default= "120" >
		<!---<cfif newitem NEQ "" >  <Cfset itemnumber = newitem>  </cfif>end --->
		<!--- the original before adding quertystring to the url <CFIF (category is "") And (itemnumber is  not "")>--->
		<!--- <CFQUERY DATASOURCE="gemssql" NAME="stats" >
			update itemstats set zoom=zoom+1 where itemid =#itemnumber#
			update items set disporder=disporder-0.1*disporder where newitem=#itemnumber#
			</cfquery>--->
		<cfscript>
		    try {
			backing_bean = createObject("component", "backing_beans.bb_jewelry_item").init(Variables);
			newitem = backing_bean.getItemId(cgi.PATH_INFO);
			itemnumber = newitem;
			}
			catch(Any e){
			newitem = "";

			}
		</cfscript>

		<cfif not isnumeric(newitem)>

			<cfinclude  template="header.cfm" />
			<cfoutput>
			The id	#newitem# is not correct.
			</cfoutput>

			<cfinclude template="mainfooter.cfm" />
			<cfabort />
		</cfif>
		<cfscript>
			video = backing_bean.getVideo();
			details = backing_bean.getDetails();
		</cfscript>
		<cfif details.recordcount is 0 or details.cat is "">
			<cfinclude template="/header.cfm" >
			<h3>
				Sorry, nothing found, that was the last record for the selection Please go back.
			</h3>
			</div> </div>
			<div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px" >
				<span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;" >
					<strong>
						Designs
					</strong>
					<br />
				</span>
				<a href="/showearrings.cfm" >
					earrings
				</a>
				<br />
				<a href="/shownecklaces.cfm" >
					necklaces
				</a>
				<br />
				<a href="/showbracelets.cfm" >
					bracelets
				</a>
				<br />
				<a href="/showpendants.cfm" >
					pendants
				</a>
				</p>
			</div>
			</div>
		</div>
			<cfif cgi.server_name does not contain 'wholesale'>
				<cfinclude template="/mainfooter.cfm" >
			</cfif>
			<cfabort />
		</cfif>
		<CFSET status = details.status>
		<cfif cgi.server_name contains 'wholesale'  >
			<cfif isnumeric(details.wholesaleprice)>
				<CFSET price=details.wholesaleprice>
			<cfelse>
				<cfset price = details.price/2 />
			</cfif>
			<cfset recoprice = details.price />
		<cfelse>
			<CFSET price=details.price>
			<cfif details.status eq 3>
				<cfif details.saleprice GT	0>
					<CFSET SalePrice = session.sale_factor*details.saleprice>
				<cfelse>
					<CFSET SalePrice = session.sale_factor*0.8*details.price>
				</cfif>
			</cfif>
		</cfif>
		<CFSET description=details.description>
		<CFSET NameId=details.NameID>
		<cfset optcount = details.optcount>
		<CFSET newitem = details.newitem>
		<CFSET category = details.cat>
		<CFSET subcategory = details.subcat>
		<CFSET invent = details.inventory>
		<cfset description = description & '<p><b>Type: </b>'  & details.style & '<p><b>Material: </b>'  & details.material>
		<CFSET folder = LCASE(category) />
		<cfset prevpos = newitem - 1 />
		<cfset nextpos = newitem + 1 />
		<cfif datediff("h",details.restockdate, now()) LT 12>
			<cfset imagename= newitem & ".JPG" >
		<cfelse>
			<cfset imagename= newitem & ".jpg" >
		</cfif>
		<cfscript>
			stone2 = backing_bean.getStonesListWithProperty();
		</cfscript>
		<cfif category is "pendants" or category is "necklaces" >
			<cfset numbershow=4>
		</cfif>
		<cfscript>
			findGroup = backing_bean.getGroup();
		</cfscript>
		<cfif findgroup.recordcount gt 0>
			<cfscript>
				groupItems = backing_bean.getGroupItems(numbershow, findGroup.groupName, category);
			</cfscript>
			<cfif groupitems.recordcount GT 0 and  len(findGroup.groupname)>
				<cfelse>
				<cfscript>
					othercatbestsellers = backing_bean.getothercatbestsellers(subcategory, category);
				</cfscript>
			</cfif>
		</cfif>
		<cfscript>
			getGroups = backing_bean.getGroups();
			getCluster = backing_bean.getCluster(details.inventory);
			subcatcatcount = backing_bean.getsubcatcatcount(subcategory, category);
			title = backing_bean.getTitle(details,getgroups,category,subcategory,itemnumber);
			canonical = backing_bean.getCanonical(details);
		</cfscript>

		 <cfif optcount and not (url.optionid)>
			 	<cfset opts = backing_bean.getOptions() />
			<cfelseif optcount and url.optionid>
				<cfset opts = backing_bean.getOptions(url.optionid) />
		  </cfif>

		<cfset frameHeight = ''>
		<cftry>
			<cfimage source="#application.rootfolder#\images\#folder#\#imagename#" action="info" structname="wd" />
			<cfcatch type="any">
				<cflocation url="/OnNoImage.cfm?line=1&amp;newitem=#newitem#" statuscode="302" />
			</cfcatch>
		</cftry>
		<cfif wd.height GT 350 >
			<cfset frameHeight = 350>
		<cfelse>
			<cfset frameHeight = #wd.height#>
		</cfif>
		<!--- include file to display clustered items, and other category items by Anup--->
	</cfsilent>
	<cfsavecontent variable="inheader">

 <cfif len(canonical)>
     <cfoutput>
		 <link rel="canonical" href="#canonical#" />
		</cfoutput>
	</cfif>

    <!---



    <script language="JavaScript" src="/js/mag.js"></script>--->

 <style type="text/css">
    <!--
    <cfif isdefined("form.bought")>
    .#form.newitem#_#form.optionid# {
        background-color:##FDFDFD;
    }
    </cfif>
    .place_holder #style_for_added# {
    padding-left:18px;font-weight:700;height:16px;background:url('/images/added.png') no-repeat scroll 0px 0px ##E6F8DD;padding-top:1px;
    }

    div.mojomagnify_zoom {
        position : absolute;
        width : 150px;
        height : 150px;
        overflow : hidden;
        cursor : crosshair;
    }

    div.mojomagnify_border {
        position : absolute;
        border : 1px solid ##EFDDEC;
        width:150px;
        height:150px;

    }
    img.mojomagnify_img {
        padding : 0px;
        border : 0px;
    }
    div.mojomagnify_zoom a {
        cursor : crosshair;
    }
        -->
	</style>

    <!---
         <cfif len(session.bulkbuyer.id) >




          <script type="text/javascript" src="/wholesalemenu.files/dmenu.js">
       </script>
       <cfelse>



      <script type="text/javascript" src="/newtopmenu.files/dmenu.js"></script>
       </cfif>
      --->



      <script language="JavaScript" >
      	<!--
      	vCurrentInventory = <cfoutput> #invent# </cfoutput>;

      	      	      	                      function swapMainImage(pImage)
      	      	      	                            {
      	      	      	                                document.getElementById('mainimage').src = pImage;
      	      	      	                                var newImg = new Image();
      	      	      	                                newImg.src = pImage;
      	      	      	                                var height = newImg.height;
      	      	      	                                var width = newImg.width;

      	      	      	                                if(height>450){
      	      	      	                                    document.getElementById('mainimage').height = '450';
      	      	      	                                }
      	      	      	                                else{
      	      	      	                                    document.getElementById('mainimage').height = height;
      	      	      	                                }
      	      	      	                                if(width>450){
      	      	      	                                    document.getElementById('mainimage').width = '450';
      	      	      	                                }
      	      	      	                                else{
      	      	      	                                    document.getElementById('mainimage').width = width;
      	      	      	                                }
      	      	      	                            }

      	      	      	  function showvideo()
      	      	      		{
      	      	      		 document.getElementById('videofram').style.display='inline';
      	      	      		  document.getElementById('videodiv').style.display='inline';
      	      	      		 }
      	      	      		   function hidevideo()
      	      	      		{
      	      	      		 document.getElementById('videodiv').style.display='none';
      	      	      		 }
      	      			// -->
      </script>
    <!---



    <script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
     --->
     <cfif cgi.server_name contains "wholesale">



    <script language=JAVASCRIPT src="/javascript/wholesalezoom.js" type="text/javascript" >
    </script>
    <cfelse>



    <script language=JAVASCRIPT src="/javascript/zoom.js" type="text/javascript" >
    </script>
    </cfif>





      <SCRIPT LANGUAGE="JavaScript1.1" >
      	<!--Original: Martin Webb(martin@irt.org) -->
      	<!--This script and many more are available free online at -->
      	<!--The JavaScript Source !! http: //javascript.internet.com -->
      	<!--Begin
      	if (document.layers) window.captureEvents(Event.MOUSEDOWN);
      	if (document.layers) window.captureEvents(Event.MOUSEUP);
      	//  End -->
      </script>



      <SCRIPT LANGUAGE="JavaScript1.1" >
      	<!--Original: Martin Webb(martin@irt.org) -->
      	<!--This script and many more are available free online at -->
      	<!--The JavaScript Source !! http: //javascript.internet.com -->
      	<!-- Begin

      	function right(e) {
      		if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2)) return false;
      		else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) {
      			alert("I'm sorry, The Right click option on your mouse has been disabled for the download window pages.");
      			return false;
      		}
      		return true;
      	}
      	document.onmousedown = right;
      	document.onmouseup = right;
      	if (document.layers) window.captureEvents(Event.MOUSEDOWN);
      	if (document.layers) window.captureEvents(Event.MOUSEUP);window.onmousedown = right;window.onmouseup = right;
      	//  End -->
      </script>



 </cfsavecontent>
	<CFIF (category neq "")>
		<cfsavecontent variable="metadescription">

	<cfif cgi.server_name contains 'wholesale'>
		Wholesale
	</cfif>
		<cfoutput>#subcategory#</cfoutput>
	<cfloop query="getgroups" >
    <cfoutput> #groupname# </cfoutput>
	</cfloop>
	<cfoutput>#category#: #details.description#</cfoutput>. We are in Austin, Texas, USA
		</cfsavecontent>
		<cfset pre_inheader = inheader />
		<cfsavecontent variable="inheader">
	<cfoutput>#pre_inheader#</cfoutput>

    <meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory# #category#,</cfoutput><cfloop query="getgroups" ><cfoutput> #groupname# #subcategory#  #category#,</cfoutput></cfloop><cfoutput> <cfif details.color contains "," >multicolor<cfelse>#details.color#</cfif> stone #category#</cfoutput>" >
    <!---



    <script language="JavaScript" src="/js/imageswap.js" ></script>
     --->



    <script type="text/javascript" src="//assets.pinterest.com/js/pinit.js">
    </script>



</cfsavecontent>
	</CFIF>
	<!--setup complete --->
	<cfinclude template="/header.cfm" >
	<!-- No category -->
	<!--- End no category --->
	<div align="center"
	<cfif not mobile>
		style="position:relative;width:930px"
	</cfif>
	id="container2" > <table border="0" cellspacing="0" bgcolor=white
	<cfif not mobile>
		width="99%"
	</cfif>
	cellpadding="0" align="left">
	<tr  valign="top" >
		<td   valign="top" align="Center" >
			<table   bgcolr="#ff7777" cellspacing="0" cellpadding="0" border="0"  align="center"  >
				<!--DWLayoutTable-->
				<tr valign="top" >
					<!--- Main image --->
					<td
					<cfif not mobile>
						width="560px"
					</cfif>
					height=450px align="center" style="border:0px;#CFFCCF solid;padding-top:2px;" >
					<table border="0" cellpadding="0" cellspacing="0" style="padding:1px" >
						<tr valign="middle" >
							<td valign="middle" align="center">
								<div style="display:block;border: 0px #EDD solid;;position:relative;z-index:1;" id="zoomarea"   align="center" >
									<cfoutput>
										<h1 class="form_heading" style="color:black; text-align:left">
											<cfif cgi.server_name contains 'wholesale'>
												Wholesale
											</cfif>
											<cfif details.subcat neq 'wood'>
												#ucase(subcategory)# #ucase(details.subcat2)#
												<cfloop query="getgroups" >
													#Ucase(groupname)#
												</cfloop>
												<cfif category neq 'healing'>
													#ucase(left(category,len(category)-1))#
												<cfelse>
													#ucase(category)#
												</cfif>
											</cfif>
											<br />
											<!-- [SKU ID #titlecase(nameid)#] -->
											#titlecase(details.subcat)# #titlecase(details.grouping)#
											<cfif details.style is 'silver setting'>
												in 92.5 Sterling Silver
											<cfelse>
												#titlecase(details.style)# Style
											</cfif>
										</h1>
										<table style="margin-top:1px;width:100%" cellpadding="1px;">
											<tr>
												<td valign="top" align="center">
													<table border="0">
														<tr>
															<cfif video.recordcount is 1>
																<td>
																	<div id="showvideobutton" onclick="showvideo()">
																		<img alt="Video link for #newitem# jewelry design" title="Video link for #newitem# jewelry design" src ='/images/#folder#/#newitem#.jpg'  height="70px" border="1" />
																	</div>
																	<div id="playbutton" style="position:relative;top:-20px;left:20px;height:10px;" onclick="showvideo()">
																		<img alt="Click to Play video" title="Click to Play Video" src="/images/playvideo.gif" height=20px  alt="play video" />
																		<br />
																		play video
																	</div>
																</td>
															</cfif>
															<td valign="top">
																<cfif details.morepics GT 0 >
																	<div  align="left" >
																		<img src ='/images/#folder#/#imagename#'	alt="unique #subcategory# #category# Jewelry for design #imagename#" title="Another pic for #imagename# in #subcategory# #category# Jewelry"    border="1" style="height:70px;cursor:pointer"		onMouseOver="swapMainImage('/images/#folder#/#imagename#');"  alt='unique #subcategory# #category# Jewelry' >
																		<cfloop index="picCount" from="1" to=#details.morepics#>
																			<cfset imagename2= newitem & "-" & picCount & ".jpg" />
																			<cfif fileexists('#application.rootfolder#/images/jewelry/#category#/#imagename2#')>
																				<cfimage source="#application.rootfolder#/images/jewelry/#category#/#imagename2#" action="info" structname="dg" />
																				<img title="Zoom to see this SKU #newitem# second pic" src ="/images/jewelry/#category#/#imagename2#" alt="SKU #newitem# unique #subcategory# #category# Jewelry"		border="1"  style="height:70px;cursor:pointer"
																					onMouseOver="swapMainImage('/images/jewelry/#category#/#imagename2#');" >
																				<cfif wd.height gt dg.height>
																					<cfset frameHeight = wd.height>
																				<cfelse>
																					<cfset frameHeight = dg.height>
																				</cfif>
																			<cfelse>
																				<CFQUERY datasource="gemssql" >
											                                          update items set morepics = morepics - 1 where newitem = #newitem#
											                               </cfquery>
																			</cfif>
																		</cfloop>
																	</div>
																</cfif>
															</td>
															<td valign="top" style="padding-left:5px" align = "left">
																<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.semiprecious.com/jewelry_item.cfm?newitem=#newitem#&amp;layout=standard&amp;show_faces=false&amp;width=250&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:240px; height:35px;" allowTransparency="true">
																</iframe>
																<a href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Fwww.semiprecious.com%2Fjewelry_item.cfm%3Fnewitem%3D=#newitem#&media=http%3A%2F%2Fwww.semiprecious.com%2Fimages%2F#category#%2F#newitem#.jpg&description=#subcategory#%20#category#" class="pin-it-button" count-layout="horizontal">
																	<img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" />
																</a>
																<br>
																<font size=-1>
																	Enlarge:
																</font>
																<a href="/images/pictureonly.cfm?category=#category#&itemid=#newitem#" alt="#ucase(subcategory)# #ucase(details.subcat2)#" >
																	<img alt="Click to See only the picture" src="/images/magglass.jpg" title="Click to See only the picture" src="/images/magglass.jpg" border="0" width="25" height="24">
																</a>
															</td>
														</tr>
													</table>
													<cfif frameHeight gt 350>
														<cfset frameHeight = 350>
													</cfif>
													<cfset frameHeight = #frameHeight# + 10>
													<table style=" <cfif not mobile>width:460px;</cfif> height:#frameHeight#px; margin-top:1%" cellpadding="1px" style="table-layout:fixed">
														<tr>
															<td  align="center">
																<div>
																	<!--- <img  src="/images/spacer_.gif" height="240px;" style="float:left;height:200px;width:1px;display:inline;" /> --->
																	<!--- <cfimage source="#application.rootfolder#\images\#folder#\#width#\#imagename#" action="info" structname="wd" /> --->
																	<a href="/images/pictureonly.cfm?category=#category#&itemid=#newitem#" alt="SKU #newitem# in #ucase(subcategory)# and #ucase(details.subcat2)#" >
																		<img
																		<cfif wd.height GTE wd.width and wd.height GT 450>
																			height="450px"
																		<cfelseif wd.width GTE wd.height and wd.width GT 450>
																			width="450px"
																		</cfif>
																		id="mainimage" style="display:inline;vertical-align:top" src ='/images/#folder#/#width#/#imagename#' alt="SKU #newitem# - a #subcategory# #category# Jewelry Design image" title="SKU #newitem# main image from #subcategory# #category# Collection" border="0" />
																	</a>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</cfoutput>
								</div>
								<!---
									<cfif isdefined("url.rating") or session.mail is application.admin_email >
									<table  width="200px" cellspacing="0" style="position:absolute;top:2px;z-index:2;right:3px;background-color:white;" cellpadding="1" border="0" align="right">
									<tbody><tr> TD align="left" width=8>&nbsp;</TD
									<td width="" align="left" style="padding-top: 3px; padding-bottom: 3px;background-color:white;background-color:transparent" class="side_link" id="poll_items">Rate It &rarr;</td>
									<td nowrap="" width="" valign="top" align="right" style="background-color:transparen;">
									<cfoutput>
									<img onclick="rate_item( 1,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_1" title="Extremely Poor" />
									<img onclick="rate_item( 2,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_2" title="Poor" />
									<img onclick="rate_item( 3,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_3" title="OK" />
									<img onclick="rate_item( 4,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_4" title="Good" />
									<img onclick="rate_item( 5,#newitem#)" onmouseover="this.style.cursor='pointer'" src="/images/star_off.gif" id="star_5" title="Excellent" />
									</cfoutput>
									</td></tr></table>
									</cfif>--->
								<!---  <br style="clear:both" >--->
								<!--- Display thumbnails if we have more than one image --->
								<!--- <cfif details.morepics GT 0 and (not len(width))>
									<div style="border: 0px gray ridge;padding-top:4px;background-color:white" align="left" >
									<cfoutput> <img src ='/images/#folder#/<CFIF #NameID# is "" >#newitem#.jpg<CFELSE>#NameID#.jpg</CFIF>'  alt="unique #subcategory# #category# Jewelry"   height="70px" border="1" style="cursor:pointer" onMouseOver="swapMainImage('/images/#folder#/#imagename#');"  alt='unique #subcategory# #category# Jewelry' >
									<cfloop index="picCount" from="1" to=#details.morepics#>
									<CFIF #NameID# is "" >
									<cfset imagename= newitem & "-" & picCount & ".jpg" />
									</CFIF>
									<cfif fileexists('#application.rootfolder#/images/jewelry/#category#/#imagename#')>
									<img src ="/images/jewelry/#category#/#imagename#" alt="unique #subcategory# #category# Jewelry"  border="1" height="70px" style="cursor:pointer" onMouseOver="swapMainImage('/images/jewelry/#category#/#imagename#');" >
								<cfelse>
									<CFQUERY datasource="gemssql" >
									update items set morepics = morepics - 1 where newitem = #newitem#
									</cfquery>
									</cfif>
									</cfloop>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</cfoutput>
									</div>  </cfif> --->
							</td>
						</tr>
						<!--- End thumbnail display Tata AIG reference 7524089--->
						<!--- Item Description --->
						<tr>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td valign="top">
								<cfoutput>
									<!---   show thumb removed   <cfif details.morepics eq 0 or details.morepics eq "" >
										<img style="float:left;margin-left:4px;margin-right:10px" src="/images/#category#/thumb/#newitem#.jpg" />
										</cfif> --->
									<div align="left" style="padding-left:2px"  >
										<font color="black" face="Verdana, Arial, Helvetica, sans-serif" >
											<h3>
												#description#
											</h3>
											&nbsp;
											<br/>
											<cfif details.size neq "" >
												<b>
													Size:
												</b>
												<cfif details.size GT 0 and details.size lt 1 and category is 'rings' and details.storage neq 'Angela' and cgi.server_name does not contain 'wholesale'>
													Size will be between 6 to 9 US adjutable
												<cfelseif details.size is 0 and category is 'rings'>
													Pick size from drop down if shown
												<cfelse>
													#details.size#
												</cfif>
												<cfif details.size LT 100>
													<cfif details.size LT 1 and details.size neq 0 and category is 'rings'>
														Adjustable
													<cfelseif details.size GT 1 and category is 'rings'>
														#details.size#
													</cfif>
													<cfif category is "necklaces" or category is "bracelets" or category is "bags" or category is 'healing' or category is 'chains'>
														inches
													<cfelseif (category is "pendants"or category is "earrings" or category is "brouches") and details.size LT 5>
														inches
													<cfelseif details.size GT 0.1 and category neq 'rings'>
														mm
													<cfelse>
													</cfif>
												<cfelse>
													#Round(evaluate(details.size/25.4))#inches
												</cfif>
											</cfif>
											<br>
											<b>
												Shipping:
											</b>
											<cfif (details.inventory GT 0) or details.orderonrequest>
												<cfif session.country is "india" >
													<cfif details.storageindia is 'prashant'>
														This item only: 10-14 Days Delivery as it is handmade, stone setting and final finishing is done once we receive the order
													<cfelse>
														Ships in 1-2 Business Days
													</cfif>
												<cfelse>
													<cfif details.inventory GT 0 >
														<cfif details.storage contains 'IN-'>
															<!--- switched off ship options using oClick instead of onClick --->
															<cfif category is "beads">
																<b>
																	<font color=red>
																		Gems Ship in 15 Days
																	</font>
																</b>
																<br>
																<font color=gray size=-1>
																	(Our US stocked items ship in 24 hrs)
																</font>
															<Cfelse>
																All Designs are in stock and ship in 48 Hours unless specified.
															</cfif>
														<cfelseif details.storage contains 'inpr'>
															Arrives in 30 Days
														<cfelseif  details.storage contains 'mma'>
															Ships in 2-3 business days
														<cfelseif  details.cat eq 'rings'>
															Ships in 2-5 business days (if you have selected a custom size or other customization please allow additional 2-3 days)
														<cfelse>
															Ships Today or 24 hrs
															<!---
																<span style="color:green;;text-decoration:underline;cursor:pointer;" onClick="document.getElementById('delivery').innerHTML=document.getElementById('del').innerHTML;" >Delivery?</span>
																<br />
																<div id="delivery"><span id="del" style="display:none;">Regular: <cfoutput>#dateformat(dateadd('d',8,now()),"d-mmm")#<br />
																Priority: #dateformat(dateadd('d',7,now()),"d-mmm")#<br />
																Express: #dateformat(dateadd('d',5,now()),"d-mmm")#<br /></cfoutput>
																</span>
																</div>		     --->
														</cfif>
													<cfelseif details.orderonrequest>
														<cfif details.inventory LTE 0 and details.orderonrequest>
															<a href="javascript:alert('This design is made on demand. This request will take 3 to 5
																to reach you')" class="error1">
																<b>
																	<cfif cgi.server_name contains 'wholesale' and details.weight LT 75>
																		Min. 3
																	</cfif>
																	Made on Order
																	<br>
																	3-5 week delivery
																</b>
															</a>
														</cfif>
													</cfif>
												</cfif>
											</cfif>
											<cfif details.weight neq "0" and details.weight neq "" >
												<br />
												<b>
													Weight:
												</b>
												#decimalformat(details.weight)#
												<cfif category is "gems" >
													Ct.
												<cfelse>
													gm
												</cfif>
											</cfif>
											<!---   		<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.semiprecious.com%2Fjewelry_item.cfm%3Fnewitem%3D#NEWitem#&amp;layout=standard&amp;show_faces=true&amp;width=250&amp;action=like&amp;colorscheme=light&amp;height=40" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:250px; height:40px;" allowTransparency="true"></iframe>
												--->
											<cfif category is 'beads'>
												** Unless specified differently, all strands are 16 inches.
												<br />
											</cfif>
											<br />
										</font>
										<font color=red>
											**
										</font>
										Size and color of natural stones may vary slightly
									</div>
									<cfif category eq "rings" >
										<!---        <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a>--->
									<cfelseif category is 'pendants'>
										<p>
											&nbsp;
											<a href='/chains.cfm'>
												Buy chains for your pendants
											</a>
										<cfelseif category eq "necklaces" >
											<a href='http://www.semiprecious.com/jewelry_education/necklace_sizing.htm' class="highlightred" >
												Necklace Size Guide
											</a>
											<br />
									</cfif>
									<br />
							</td>
						</tr>
					</table>

					<!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:" ><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;" >Customize/Modify</span></a>--->
					<!---
						<cfquery datasource="gemssql" name="checkcluster">
						select  itemid from styles,items where  styles.itemid=items.newitem and itemid = #itemnumber#
						</cfquery>--->
					&nbsp;
					<!---<cfif getcluster.recordcount gt 0 >
						<div style="position:relative;">
						<div id="zoom_like_these" style="position:absolute;top:0px;left:363px;width:250px;text-align:center;padding:2px;"></div>
						<div id="easy_string" style="display:none;">
						<div style="width:inherit;text-align:center;cursor:pointer" class="grayplacard" onClick="document.getElementById('zoom_like_these').innerHTML='';">Close Zoom Window</div>
						<div style="width:inherit;text-align:center;" class="component_box"><strong>To Buy Click on Thumb Nail or Picture Below</strong></div>
						</div>
						<div style="position:relative;border:1px gray solid;padding:0;margin:0;border-top:2px black solid;" >
						<span style="position:absolute;top:-10px;left:30px;background-color:black;border:1px gray solid;border-left:2px black solid;border-right:2px black solid;">&nbsp;<font color="white" >YOU MAY ALSO LIKE THESE &dArr;&nbsp;</font></b></span>
						<table border=0 cellpadding=4>
						<cfset coll=0>
						<tr>
						<cfoutput query="getcluster">
						<cfset coll=coll+1 />
						<td align="center">
						<a title="click to buy this design" href="/jewelry_item.cfm?newitem=#itemid#" >
						<img title="click to buy this design" alt="click here to buy this design" src="/images/#cat#/thumb/#itemid#.jpg" border=0>
						<cfif not getcluster.inventory and not getcluster.orderonrequest ><br /><i>sold out</i></cfif></td><cfif coll is 5></tr><tr><cfset coll=0></cfif>
						</cfoutput>
						<cfset missingTDs=#evaluate(5-coll)#>
						<cfloop from="1" to="#missingtds#" index=k><td></td></cfloop></tr>
						</table></div>
						</cfif>--->
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
				</tr>
			</table>
			<!--- End Item Description --->
			<!--- End main image --->
			<!--- MOBILE --->
			<cfif not mobile>
				</td>
				<!--- Right side start --->
				<!--- MOBILE --->
				<td valign="top" align="center" >
				</cfif>
			<CFFORM ACTION="/#session.cart#?country=#session.address.country_code#&amp;secure=true&cartid=#session.cartid#" METHOD="POST" NAME="wishbuy"  style="display:inline;" > <cfif session.mail is application.admin_email> <cfif category is 'bags'> <a href="/editbags.cfm?newitem=#newitem#"  />EDIT Details</a><br /> <cfelse> <a href="/admintools/edititem.cfm?newitem=#newitem#"  />EDIT Details</a><br /> <a href="/admintools/images/makezoom.cfm?newitem=#newitem#&cat=#category#">Edit Zoom</a><br /> <cfif  isuserinrole("superadmin")><a href=/admintools/makeinactive.cfm?inactiveid=#newitem#>deactivate</a></cfif> </cfif> <!---   <cfquery datasource="sptm" name="custom_state">
					select status, mask from custom_items where imageid = #newitem#
					</cfquery>
					<br />
					Current Custom State(Status + Pause):
					<span id="custom_state">
					<cfif custom_state.recordcount>
					<cfoutput>#custom_state.status# , #custom_state.mask#</cfoutput>
				<cfelse>
					Not Initiated
					</cfif>
					</span>
					<br />
					Color:<input type="radio" name="move_state" value="initiated" onClick="javascript:custom_select(#newitem#,'initiated');" />
					<br />
					Build Layers:<input type="radio" name="move_state" value="colored" onClick="javascript:custom_select(#newitem#,'colored');" />
					<br />
					Add Metadata: <input type="radio" name="move_state" value="layered" onClick="javascript:custom_select(#newitem#,'layered');" />
					<br />
					Completed: <input type="radio" name="move_state" value="metadata" onClick="javascript:custom_select(#newitem#,'metadata');" />
					<br />
					<cfif IsUserInRole("superadmin")>
					Pause- Yes: <input type="RADIO" name="mask" value="Y" onClick="javascript:custom_select(#newitem#,'mask');" > <br />
					No:                    <input type="RADIO" name="mask" value="N" onClick="javascript:custom_select(#newitem#,'unmask');" >
					</cfif>
					--->
			</cfif> <!--- End next/edit button --->
			<div align="center" style="padding-top:8<cfif not mobile>0</cfif>px"> Design Id #newitem#<br /> <CFIF price eq 0 and cgi.server_name does not contain 'wholesale'> Not for retail sale <CFELSEif cgi.server_name contains 'wholesale' and price eq 0> Not for wholesale <cfelse> <cfif status eq 0 or status eq 3 > <font color="black" > <!--- at times giving reverse equation
					<cfif details.basecost >
					<span style="color:gray;">Store Price
					#round_format(8.18*details.basecost/application.exchangerate)# </span>
					</cfif>
					---> <cfif cgi.server_name contains 'wholesale'> <br />Wholesale <cfelse> <br />Price </cfif> <CFIF  status eq 3 and cgi.server_name does not contain 'wholesale'><b> <strike>#format(price)#</strike></b> <cfelse> <b>#format(price)#</b> </cfif> </FONT> </div> <cfif cgi.server_name neq "63.135.126.234" > <div align="center" style="margin:4 0;"> <cfif cgi.server_name does not contain 'wholesale'> <CFIF  status eq 3> <b> <font color="red"> <cfif details.wholesaleprice eq details.saleprice> Sale! <cfelse> Deal!! </cfif> </font> #format(saleprice)# </b> <br /> <cfelse> <br /> </CFIF> </cfif> </div> <div class="details" align="center" > <div id="ajaxoutput" align="center" > <span id="erroraddingitem"  class="hidden" >Select Failed!</span> <INPUT TYPE="hidden" NAME="bought" VALUE="buy" > <!---       <CFIF invent LT 1 and details.storage does not contain 'CM'><font color="##FF9966" >4 week delivery</font><cfelse>---> <!---</cfif>---> <br /> <cfif details.inventory LTE 0 and details.orderonrequest><a href="javascript:alert('This design is made on demand. This request will take 4 to 6
					to reach you')" class="error1"><b><cfif cgi.server_name contains 'wholesale' and details.weight LT 75>Min. 3</cfif> Made on Order<br> 3-5 week delivery</b></a> </cfif> <CFIF (invent LTE 0) and not details.orderonrequest > Sold Out <br><a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >Back Order</a> <cfelse> <cfif invent LT 4> <cfif  invent LTE 0 > <cfset invent = 10 /> <cfelse> Only #invent# in stock <br /> </cfif> </cfif> <cfif cgi.server_name contains 'wholesale' and details.inventory LTE 0 and details.orderonrequest and details.weight LT 75><cfset minqty=3><cfelse><cfset minqty=1></cfif> <select id="quantity" name="quantity" > <cfloop from="#minqty#" to="#invent#" index="j"> <cfif url.existqty eq j> <option value="#j#" selected >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#j# in Cart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option> <cfelse> <option value="#j#" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif details.inventory LTE 0>Make<cfelse>Buy</cfif> #j#&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;</option> </cfif> </cfloop> </select> <!--- <CFINPUT  type="text" SIZE="1"  id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" onclick="this.focus();" > ---> <br /> <!--- Display item options ---> <!--- 	<cfif  len(session.bulkbuyer.id) and optcount><!---- this section disabled for now. when options would be modified use it ---> <cfswitch expression="#category#"> <cfcase value="rings"> Below Size 10 Add #format(0.5)# Above Size 10 Add #format(1.5)# </cfcase> </cfswitch> <!-- 	<input type="hidden" name="optionid" value="0" />
					--> </cfif> ---> <!---<cfif cgi.server_name does not contain 'wholesale'>--->
					 <cfif optcount and not (url.optionid)>

					 <cfif opts.recordcount >
					 	<div align="center" style="padding-top:4px;float:right;width:100%;horizontal-align:right" >
					 	<cfset cfselect_required = "false">
					 	<cfset only_option = "false">
					 	<cfset start_row = 1>
					 	<cfif category is 'rings' and cgi.server_name does not contain 'wholesale'>
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
					 </cfif>
					 <cfif opts.recordcount GT 1 >
					 	<cfselect id="optionidpulldown" name="optionid" required="#cfselect_required#"   >
					 		<cfif opts.recordcount GT 2 >
					 			<cfloop query="opts" startrow="#start_row#" >
					 				<cfif valueadd>
					 					<cfif cgi.server_name contains 'wholesale' >
					 						<!--- do not do this math in SQL as it rounds of to an integer --->
					 						<cfset _valueadd = valueadd/2 />
					 					<cfelse>
					 						<cfset _valueadd = valueadd />
					 					</cfif>
					 					<!--- if there is a change in price because of this option --->
					 					<cfif url.optionid eq opts.optionid>
					 						<option value="#opts.optionid#" selected>
					 							#listgetat(description,1)#(+$#_valueadd#)
					 						</option>
					 					<cfelse>
					 						<option value="#opts.optionid#" >
					 							#listgetat(description,1)#(+$#_valueadd#)
					 						</option>
					 					</cfif>
					 				<cfelse>
					 					<cfif url.optionid eq opts.optionid>
					 						<option value="#opts.optionid#" selected>
					 							#listgetat(description,1)#
					 						</option>
					 					<cfelse>
					 						<option value="#opts.optionid#" >
					 							#listgetat(description,1)#
					 						</option>
					 					</cfif>
					 				</cfif>
					 			</cfloop>
					 		<cfelse>
					 			<!---  <option value="#opts.optionid[1]#" >#opts.description[1]#</option>
					 				--->
					 			<cfif opts.valueadd[2] neq 0>
					 				<cfif len(session.bulkbuyer.id) >
					 					<!--- do not do this math in SQL as it rounds of to an integer --->
					 					<cfset _valueadd = opts.valueadd[2]/2 />
					 				<cfelse>
					 					<cfset _valueadd = opts.valueadd[2] />
					 				</cfif>
					 				<!--- if there is a change in price because of this option --->
					 				<option value="#opts.optionid[2]#" #only_option#>
					 					#opts.description[2]# Adds: $#_valueadd#
					 				</option>
					 			<cfelse>
					 				<option value="#opts.optionid[2]#" #only_option#>
					 					#opts.description[2]#
					 				</option>
					 			</cfif>
					 		</cfif>
					 	</cfselect>
					 </cfif>

					</div>
					<cfelseif optcount and url.optionid>

					Editing Qty For<br /> <div  class="optionsinline"> #opts.description# </div>
					<br />[<a href="jewelry_item.cfm?itemnumber=#newitem#">See Other Options</a>]

					<input type="hidden" name="optionid"  id="optionid" value="#url.optionid#" >
					<cfelse> <input type="hidden" name="optionid"  id="optionid" value="0" >
					 <!--- End item options displays --->
					</cfif>
					</div>
						<cfif  category is 'rings' and cgi.server_name does not contain 'wholesale'>
							<br />
							<a title="Read more about ring sizing" href="http://en.wikipedia.org/wiki/Ring_size">
								Sizing Guide <br />
							</a>
						</cfif>
						<input style=" <cfif not mobile>width:101px;</cfif>margin-top:6px;" class="action_button" type=submit value="Add To Cart" name="Add To Cart">
						<!---                        <img src=/images/addtocart.gif d="a2cb"  onClick="javascript:goProcess('add')" >   --->
						<input type="button" class="hidden" id="a2cw" value="Wait..." >
						<font color=gray>
							<br />
							<br />
							Need more than available?
							<br />
							Call or Email us
						</font>
						</cfif>
						<!--- Angela --->

						<br />	<INPUT TYPE="button" id="a2w1" style="color:black; <cfif not mobile>width:100px;</cfif>margin-top:12px;border:1px gray solid;"  onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wishlist" >
							<!--  <a style="display:block;margin-top:14px;width:100px;height:20px;border:1px purple solid ;text-decoration:none;" class="greenbutton" accesskey="Z" href="/wish.cfm"  >See Wishlist</a>
								-->

						<!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#>Tell a Friend</a>--->
						<INPUT TYPE="hidden" NAME="cart" VALUE="#session.cart#" >
						<input type="hidden" name="invent" value="#invent#" >
						<INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#" >
						<INPUT TYPE="hidden" NAME="price"  id="price" VALUE="
						<cfif  cgi.server_name contains 'wholesale'>
							#decimalformat(details.wholesaleprice)#
						<cfelse>
							<CFIF status is 3>
								#decimalformat(saleprice*session.sale_factor)#
							<cfelse>
								#decimalformat(details.price)#
							</cfif>
						</cfif>
						" >
						<INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#" >
						<!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
						<cfelse>
								<cfif cgi.server_name neq "63.135.126.234" >
									Item Not Available. Need it? Email us.
								</cfif>
						</cfif>
						</CFIF>
						 </cfif>
			</CFFORM
> <!--- cgi---> <!---                Shop By<br />
			Item No.:
			<br />
			<input type="text" name="nextitem" value="" size="4" maxlength="4" >
			<INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show" >
			--->
			<br />
			<!--- unclutter the zoom page --->
			<cfif category is  "beads" and cgi.server_name contains 'wholesale'>
				<a href="/beads.cfm?subcat=#subcategory#" >
					#subcatcatcount.sccount# more #subcategory# #category#
				</a>
			<cfelseif category is 'gems'>
				<a href="/gems.cfm?category=#category#&subcat=#subcategory#" >
					more #lcase(subcategory)#
					<br>
					#lcase(category)#
				</a>
			<cfelse>
				<a href="/#lcase(replace(trim(details.subcat)," ",""))#_#lcase(category)#.cfm" >#subcatcatcount.sccount# more #lcase(subcategory)#
				<br>
				#lcase(category)#</a>
			</cfif>
			<br />
			<br />
			<a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >
				Ask Us
			</a>
			<br />
			<!--- Help button ---
				<a onClick="MM_showHideLayers('howto','','show');" style="color:maroon;margin-bottom:2px;" > --->
			<a href="/contactus.cfm?newitem=#newitem#&folder=#folder#" >
				<img src="/images/help.gif" border="0" vspace="0" hspace="0" align="absmiddle" width="43" height="30" >
			</a>
			<!--- End help button --->
			</cfoutput>
			<br />
			</div> </div>
			<!-- change this to darkgreen when putting image back -->
			<!--- End wholesalers next image --->
			<!--- MOBILE --->
			<cfif not mobile>
				</td>
			<!--- if width variable set by cfinvoke add is set to thumb then next column --->
			<!--- End right side? --->
			<!--- 4th column --->
			<!--- MOBILE --->
			<td align="center" >
		</cfif>
		<div class="form_heading">
			Matching Designs &amp; Accessories
		</div>
		<div id="video" style="border-top:1px solid #799ea3;padding-top:10px;padding-left:2px">
			<div style="<cfif not mobile>width:90px;</cfif>display:inline;float:left">
				<cfif video.recordcount is 1>
					<div id="videodiv" style="position:absolute;top:200px;left:330px;z-index:2;display:none;">
						<iframe id="videofram"
						<cfif not mobile>
							width="480px"
						</cfif>
						height="360px" style="display:none" src="http://www.youtube.com/embed/
						<cfoutput query=video>
							#videocode#
						</cfoutput>
						?rel=0" frameborder="2" allowfullscreen></iframe>
						<div  style="background-color:black;font-color:red;font-weight:bold;font-face:arial;size:14;"  onclick="hidevideo()">
							<div style="color:red;">
								CLICK TO CLOSE VIDEO SCREEN
							</div>
						</div>
					</div>
				</cfif>
				<!--- &nbsp;&nbsp;&nbsp;&nbsp;
					<cfoutput><a title="Check Cart and start checkout" href="/#session.cart#?country=#urlencodedformat(session.address.country_code)#&amp;pehp=3e.2210&amp;cartid=#session.cartid#" ></cfoutput><img alt="shopping cart and start checkout" src=/images/add_to_cart_icon.jpg></a><br />&nbsp;&nbsp;&nbsp;&nbsp;<b>CART</b><br><br>
					--->
			 <cfif findgroup.recordcount gt 0>
					<cfif groupitems.recordcount GT 0 and  len(findGroup.groupname)>
						<cfoutput query="groupitems" >
							<div style="margin-top:4px;">
								<a href=/jewelry_item.cfm?newitem=#itemid#>
									<img alt="similar item #itemID# thumbnail" title="Click to see details of SKU #itemID# from #category#" src=/images/#category#/thumb/#itemID#.jpg border=0 width=70 height=70 />
								</a>
							</div>
						</cfoutput>
						<cfoutput>
							<a href="/shaped/#lcase(findGroup.groupname)#-gemstone-#lcase(category)#.cfm">
								More #lcase(findGroup.groupname)# #lcase(category)#
							</a>
						</cfoutput>
					<cfelse>
						<!--- not in any theme, show same stone items in different categories--->
						<cfoutput>
							More...
							<br />
						</cfoutput>
						<cfoutput query="othercatbestsellers" >
							<div style="margin-top:4px;">
								<a title="See details for SKU ID #newitem#"  href="jewelry_item.cfm?newitem=#newitem#">
									<img src="/images/#othercatbestsellers.cat#/thumb/#newitem#.jpg" border="0" width="75" />
								</a>
							</div>
						</cfoutput>
						<cfset subcat3 = replace(trim(subcategory)," ","")>
						<cfoutput>
							<a title="See collection in #subcat3# jewelry" href="/#lcase(subcat3)#_jewelry.cfm">
								 #titlecase(subcategory)# Jewelry
							</a>
						</cfoutput>
					</cfif>
				<cfelse>
					&nbsp;
				</cfif>
			</div>
			<div style="display:inline;float:right">
				<cfif getcluster.recordcount gt 0 >
					<div>
						<div id="zoom_like_these" style="position:absolute;top:0px;<cfif not mobile>left:363px;width:250px;</cfif>text-align:center;padding:2px;">
						</div>
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
							<div style="padding:2px;border-collapse:collapse;width:90px;align:right">
								<cfoutput query="getcluster">
									<div>
										<a title="#lcase(subcat)# #lcase(cat)# for #itemid#" href="/jewelry_item.cfm?newitem=#itemid#" >
											<img border=10 bordercolor=white  title="#lcase(subcat)# #lcase(cat)#" alt="#lcase(subcat)# #lcase(cat)#" src="/images/#cat#/thumb/#itemid#.jpg" border=0 height=80 width="80" />
										</a>
										<cfif not getcluster.inventory and not getcluster.orderonrequest >
											<br />
											<i>
												Sold Out
											</i>
										</cfif>
									</div>
								</cfoutput>
							</div>

					</div>
				</cfif>
			</div>
		</div>
	</div>
		<!--- End 4th column 1:52 PM--->
		</td>
</tr>
	</table>
	<!--- <cfoutput>

		<script language="javascript" >
			/*
			 on 15 Mar 2010 Nitish: Did not find use of the id of any element
			 being named by the use of variable 'folder'. so removed the code
			 document.getElementById("#lcase(folder)#").style.color = "maroon";
			 document.getElementById("#lcase(folder)#").style.textDecoration = "none" ;
			 window.focus();
			 document.getElementById("wholesale").style.color = "maroon";
			 document.getElementById("wholesale").style.textDecoration = "none" ;
			 */
			if (document.getElementById('quantity') != null) {
				document.getElementById('quantity').focus();
			}
		</script>
	</cfoutput> --->
	<div  id="howto" style="padding:2px;border:4px gray solid;visibility:hidden;position:absolute;top:130px;left:220px;color:#666600;background-color:white;z-index:2; <cfif not mobile>width:300px;</cfif>" >
		<div class="noticebox" >
			This page helps you to add an item to your cart. Select the number of pieces (1 or more) you wish to buy from the drop down box above the 'Add to Cart' button and click on the 'Add to Cart' button. Your cart will be filled by the selected number of this design. It does not matter if the item is already there in your cart. The quantity in cart will be the number you select now.
			<br />
			Clicking 'Add To Cart' will take you to the cart summary page.
			<span class="error1">
				At times if a lesser quantity is available in inventory then the lesser quantity is added
			</span>
			.
			<ul style="margin-left:10px;text-align:left;">
				<li>
					<strong>
						Options:
					</strong>
					Before adding/changing the quantity please see if any options/modification are available for the design. Options are shown at the bottom of the quantity selector and are
					<span class="optionsinline" >
						highlighted in this color
					</span>
					. If options are available you may select an option. Options are not always compulsory.
				</li>
				<li>
					<strong>
						To remove
					</strong>
					an item from your cart select Remove and click on 'Add to Cart' button.
				</li>
			</ul>
		</div>
		[
		<a onClick="MM_showHideLayers('howto','','hide');" style="color:red;" >
			Close Help
		</a>
		]
	</div>
	</div>

	<script type="text/javascript">
		<!--
		var merchant_id = "3724";
		//-->
	</script>

	<script src="http://reporting.singlefeed.com/z/track.js?v=1.1" type="text/javascript">
	</script>
	<footer>

		<script type="text/javascript">
			<!--- <cfoutput > MojoMagnify.makeMagnifiable(document.getElementById("mainimage"), "http://www.semiprecious.com/images/#folder#/#newitem#.jpg"); </cfoutput>--->

                </script>
	</footer>
	<!--- Footer --->
	<cfif cgi.server_name does not contain 'wholesale'>
		<cfinclude template="/mainfooter.cfm" >
	</cfif>
	<!--- End footer --->
	<!-- cgi -->
	<!---   <cfcatch type="any">
		<cfoutput>#cfcatch.message# #cfcatch.detail#</cfoutput>
		</cfcatch>
		</cftry>
		--->
	<cfcatch type="any" >
		<cfdump var="#cfcatch#" />

	</cfcatch>
</cftry>
<!-- jewelry_Item.cfm ends -->
