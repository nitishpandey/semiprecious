<cfsavecontent variable="inheader">
<cfset title="Gemstone &amp; silver  - designs at the healing and jewelry web store" />

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta description="real high discount deals for in silver and in semiprecious stones jewelry like moonstone, rose quartz and more being sold at cost price" />
<link href="/styles/hub.css" rel="stylesheet" type="text/css" />
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/imageswap.js"></script>
</cfsavecontent>
<cfset leftcolordisplay="inline" />
	<!----
<cfinclude template="daily_deals_banner.cfm" /> --->
<cfset head = "" />

		<cfloop list="#cat_list#" index="cat">
			<cfif LISTlen(application.daily_deals[cat].list)>
				<cfif application.daily_deals[cat].toshowcount>
					<cfset head = head & '<a href="##' & cat & '" >' & Cat & '</a>&nbsp;' />  
				</cfif>
			</cfif>
			</cfloop>

      <cfinclude template="/header#session.country#.cfm">
      
   
  <table cellpadding="0" cellspacing="1"  id="container2" style="padding:1px;">
  <tr>
  <!--- make left menus width around 18% if you are putting any content in it --->
  <td valign="top" style="width:150px"  ><!--- BEGIN LEFT SIDE STUFF---> 

    <CFINCLUDE TEMPLATE="/leftmenus.cfm" />
   <!--- END LEFT SIDE STUFF ---> 
  </td>
  <!--- end<span  style="height:12px;text-decoration:none;position:relative;left:-5;font-size:12px;" >
		<cfimport   prefix="rootincludes" taglib="/" />
			 <rootincludes:steps step="1" /> 						
	</span> --->
  <td style="margin-top:1px;width:100%;text-align:center;">


<cfoutput>
	

	  <div  style="font-weight:bold;font-size:12px;margin-top:10px;margin-bottom:10px;width:30%"  >
	  <strong>Great designs at great discounts <cfif session.bulkbuyer.id neq ""> For Resellers &amp; Wholesale Buyers</cfif></strong>
	  <!--- <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0"   title="jewelry gemstone selection" width="15" height="15" /> 
	  <a href="###cat#"  id="#cat#_day_deals" title="s suggestions in bracelets">
      	&nbsp;#cat#&nbsp;</a>&nbsp;&nbsp;&nbsp; --->
        </div>	
            <div  style="width:100%;background-color:white;margin:5px;">
		<cfloop list="#cat_list#" index="cat">
                    <cfset toshowcount = application.daily_deals[cat].toshowcount >
        	    <cfif toshowcount >
        		<cfset listlength = listlen(application.daily_deals[cat].list) />
		        <cfset stepsize = round(listlength/toshowcount)  />
        		<cfif stepsize is 0 >
        			<cfset stepsize = 1 >
        		</cfif>
	  <!---<div width="100%" style="clear:both;margin-top:6px;" class="grayplacard">
			<a name="#cat#" class="side_link" style="text-decoration:none;text-transform:capitalize;">#CAT# </a><span style="margin-right:10px"> &nbsp;&nbsp;<span style="color:##364;">[</span>#head#<span style="color:##364;">]</span></span>
		  </div>

	--->
	<cfset itemsdone = 0 />
	<cfloop list="#application.daily_deals[cat].list#"  index="itemid"  >
	 <cfif not (itemsdone mod stepsize ) > 
			 <cfset flag = 0>
			   <!--- <Div align="center" valign="bottom" style=""  class="jewelry_on_sale">
		    	      <div style="float:left;position:relative;left:0px;top:0px">
					<img style="display:inline" src="/borders/left_top.png" />
                                </div>	
    		    		<div style="display:inline;float:right;position:relative;margin:0px;border:0px;right:0px;top:0px">
	    		    	    <img style="display:inline" src="/borders/right_top.png" />
                                </div>	
			    	 --->   	 
				<div class="silver_sub1"style="position:relative;">
        		        	        <div class="silver_subTop"><span><a name="#itemid#_anchor"></a></span></div>
           				<div class="silver_sub-content" >
                                   	<div CLASS="silver_bottomBarTitle">

                                    <div class="thumbnail_box">
                                        <a href="/jewelry_item.cfm?newitem=#itemid#&amp;day_deal=1" >
							 <img src="/images/#cat#/thumb/#itemid#.jpg"  border="0" style="margin:2px 0px;text-decoration:none;display:inline;"  alt="Daily Deal Gemstone Jewelry"/>
                                        </a>
									    
                                </div>
										<cfif session.bulkbuyer.id neq "">
												  <cfset dp = session.sale_factor*application.daily_deals[cat][itemid].wdprice  />
											  	  <cfset p = 		 1.1*dp  />
											  <cfelse>
											  		<cfset dp = 		 session.sale_factor*application.daily_deals[cat][itemid].dprice  />
													<cfset p = 		 application.daily_deals[cat][itemid].price  />
										</cfif>
                                        <div class="dd_text_box" style="margin-bottom:1px;">
        					<div class="lower_banner" style="height:18px;z-index:4;">
                                                        <a  href="/jewelry_item.cfm?newitem=#itemid#&amp;day_deal=1" >
                                                        <div class="lookinline">&nbsp;Save #round(evaluate((variables.p-variables.dp)*100/variables.p))#%</div>
                                                        </a>
        			            
        				            </div><span style="margin-bottom:0px"><div class="regular_price" style="width:148px;height:35px">Regular: <strong>#format(variables.p)#</strong><br /> Today:<span style="font-weight:bold;color:maroon;">#format(variables.dp)#</span>  </div>
	                                		</span>
					</div>  
							
				 </div>
          </div>
        <div class="silver_subBottom" ><span></span></div>
	</div>
					</cfif>
					    <cfset itemsdone = itemsdone + 1 />
		  				  <cfif itemsdone GTE listlength >
	            	          		  	<cfbreak />
		        			</cfif>
				</cfloop>
		</cfif>
		
        </cfloop>
        </div>
<!-- #cat# end -->

</cfoutput>
</td>
</tr>
<tr>
  <td  align="center" colspan=2>
  <!--- create some room for left menu height--->
  <br />
    <br />  <br />  <br />
  <p>&nbsp;</p>
  <br />
  
  <!--- Footer --->
    <cfinclude template="/mainfooter.cfm">
    <!--- End footer --->
  </td>
</tr>

</table>
</div>
</div>
</div>
</body>
</html>
