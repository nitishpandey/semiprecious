<!---- set anyone of them, in container page, to 'block' or "" to make that portion of left menu to come open on page open --->
<cfparam name="leftgemstonedisplay" default="none" />
<cfparam name="leftcolordisplay" default="none" />
<cfparam name="leftpricedisplay" default="none" />
<cfparam name="leftbirthstonedisplay" default="none" />

<cfif isdefined("url.live_support")>
<cfset application.live_support = url.live_support />
</cfif>
<cfparam name="category" default="all">
<cfparam name="categ" default="jewelry">
<cfif category neq "" and category neq "all" and category neq "chains">
  <cfset categ = category>
  <cfelse>
  <cfset categ = "jewelry">
</cfif>
<!---  <table><cfinclude template="includes/search.cfm"></table> 
<cfinclude template="/wholesale-jewellery/wholesaleleftmenu.cfm">--->


<!---<cfquery name=groupnow datasource="gemssql">
select top 4  groupname from groupings where <cfif category neq "all" and category neq "">cat='#category#' and</cfif> domain='#cgi.server_name#' order by hubsequence
</cfquery>
--->
<div  id="leftmenus">
<!---  <tr>
    <td colspan="3">

	<table cellpadding="0" cellspacing="0">
	<tr><td>By Theme:<br>
	<cfoutput query=groupnow>
<a href=/shaped/#lcase(groupname)#-gemstones-<cfif categ is 'jewelry'>jewellery<cfelse>#categ#</cfif>.cfm class="side_link">#lcase(groupname)#</a><br>
</cfoutput><br>
<cfoutput><a href=/#categ#.cfm >More By Theme</a></cfoutput>
</td></tr>
</table>			
	</td>

  </tr>--->

  
  <!--- Start color popup button --->
    		<cfif application.live_support > 
			 <div class="component_box" align=center> 
			 <!--- the mouseover below requires that the span with the name daily_deal id --->
			    <a class="login_link" onclick="open_live_support();" 
  href="javascript://"><img style="text-decoration:none;" src="/images/callus.png" height="25px" valign="middle" border=0 />&nbsp;
				<span style="position:relative;bottom:4px;font-size:14px;">Online Help</span></a>     
				</div>
	
 </cfif>  	
<div class="component_box" align="center">
   <cfinclude template="includes/search.cfm" />	
</div>
			 <div class="component_box" align=center> 
	  
	  <a href="/daily_deals/daily_deals.cfm" on='javascript:var d = document.getElementById("daily_deal").innerHTML; document.getElementById("auth").innerHTML = d;'><img src="/daily_deals/jewelrydeals.gif" height=26 width=120 border=0></a>
	  <cftry>
	  <cfset x  = listgetat(application.daily_deals.itemlist,randrange(1,application.daily_deals.gallery_size)) />
	  <cfquery datasource="gemssql" name="ddi">
	  select cat from items where newitem = #x#
	  </cfquery>
	
	<cfoutput>
	
    	  <div class="url">
		  <a href="/daily_deals/">	  <img src="/images/#ddi.cat#/thumb/#x#.jpg" /></a>
		  <div style="text-align:center" class="url" >
		  <div class="reg_price">Regular: #format(IIF(len(session.bulkbuyer.id),DE(application.daily_deals[ddi.cat][x]["wdprice"]*application.daily_deals.wholesale_factor),DE(application.daily_deals[ddi.cat][x]["price"])))#</div>
		  
		  <a href="/jewelry_item.cfm?newitem=#x###jewelry_top" class="side_link">Today	 #format(application.daily_deals[ddi.cat][x][IIF(len(session.bulkbuyer.id),DE("wdprice"),DE('dprice'))])#!!!</a>&nbsp;
		  </div>
		  </div>
	</cfoutput><cfcatch type="any">
	</cfcatch>
	</cftry>
   		  </div>
      

<cfoutput>	
	<div  align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftPriceDisplay')"  style="margin-top:4px;padding:0px">
    #categ# by <br />Price
 </div>  <div id="LeftPriceDisplay"  style="display:#leftpricedisplay#" >
     
<cfif len(session.bulkbuyer.id)>
<a class="side_link" href="/jewelry-under-$10.cfm?&category=#categ#">under #round_format(10)#</a>
<a class="side_link" href="/jewelry-under-$20.cfm?&category=#categ#">#round_format(11)# to #round_format(20)#</a>
<a class="side_link" href="/gemstone_jewelry_gallery.cfm?priceless=30&pricegreater=20&category=#categ#">#round_format(21)# to #round_format(30)#</a>
</cfif>
<a class="side_link" href="/jewelry-under-$30.cfm?priceless=30&pricegreater=0&category=#categ#">Under #round_format(30)#</a>
<a class="side_link" href="/jewelry-under-$50.cfm?pricegreater=30&priceless=50&category=#categ#">#round_format(30)# to #round_format(50)# </a>
  <a class="side_link" href="/jewelry-under-$100.cfm?pricegreater=50&priceless=100&category=#categ#">#round_format(50)# to #round_format(100)#</a>
 <cfif not len(session.bulkbuyer.id)>
 <a class="side_link" href="/jewelry-under-$150.cfm?pricegreater=100&priceless=150&category=#categ#">#round_format(100)# to #round_format(150)#</a>
  <cfif category neq 'rings'> 
   <a class="side_link" href="/jewelry-under-$200.cfm?pricegreater=150&priceless=200&category=#categ#">#round_format(150)# to #round_format(200)#</a>
   <a class="side_link" href="/jewelry-under-$300.cfm?pricegreater=200&priceless=2000&category=#categ#">Over #round_format(200)#</a>
   </cfif>
</cfif>
</div>
 
  	  </cfoutput>
<!--- have put this here to create space between search box and below menu. CSS wouldn't help --->

	<div  align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftColorDisplay')"  style="margin-top:4px;padding:0px">
    <cfoutput>#categ# by <br />Color
 </div>
    <div id="LeftColorDisplay"  style="display:#leftcolordisplay#" >
        <cfloop index="Color1" list="#application.color_list#">
   
              <cfif category eq "all" or category eq "">
              <a href="/#Color1#-gemstone-jewelry.cfm" class="side_link"> #Color1#</a> 
              <cfelse>
               <a href="/color-gem-stone/#Color1#-#categ#.cfm" class="side_link"> #Color1#</a> 
             
			  </cfif> 
	      </cfloop>
      </div>
    		  </cfoutput>
      
  <!--- End color popup button --->
  <!--- Start birthstone popup button --->
 <div   align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftBirthstoneDisplay')"  >
    Jewelry by <br />Birthstone
	</div>
<cfoutput>
    <div id="LeftBirthstoneDisplay" style="display:#LeftBirthstoneDisplay#" >
        <cfloop index="Month" list="january,february,march,april,may,june,july,august,september,october,november,december">
             <a href="/#Month#-birthstone.cfm" class="side_link"> #Month# birthstone</a> 
 </cfloop></cfoutput> 
	  </div>
  <!--- End birthstone popup button --->

<cfif category neq "gems">
    <!-- Start Gemstone listing -->
  <CFINCLUDE TEMPLATE="subcatvertical.cfm" />
    <!-- End Gemstone listing -->
  </cfif>


</div>
<cfinclude template="/daily_deals/daily_deals_why.cfm" /> 