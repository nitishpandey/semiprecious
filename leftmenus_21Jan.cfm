
<!---- set anyone of them, in container page, to 'block' or "" to make that portion of left menu to come open on page open --->
<cfparam name="leftgemstonedisplay" default="none" />
<cfparam name="leftcolordisplay" default="none" />
<cfparam name="leftpricedisplay" default="open" />
<cfparam name="leftbirthstonedisplay" default="none" />

<cfif isdefined("url.live_support")>
<cfset application.live_support = url.live_support />
</cfif>
<cfparam name="category" default="all">
<cfparam name="categ" default="jewelry">
<cfif category neq "" and category neq "all" and category neq "chains"  >
  <cfset categ = category>
 <cfelse>
  <cfset categ = "jewelry">
</cfif>
<cfif category neq 'cufflinks'>
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
<!--- removed 1--->
<!---<cfif session.tld is "semiprecious.in">--->
<!---<div class="component_box" align="center">
   <cfinclude template="/includes/search.cfm" />	
</div>--->
<div  align="left"  class=""   style="margin-top:10px;padding:0px">
  <a href="/sterling-silver-jewelry.cfm"><b>925 Sterling Silver</b></a><br>
  <a href="/german-silver-jewelry.cfm"><b>German Silver</b></a>
</div>
 
 
<cfif category neq 'gems'>
    <!-- Start Gemstone listing --><br>

  <CFINCLUDE TEMPLATE="/subcatvertical.cfm" />
    <!-- End Gemstone listing -->
<div  align="left"  class=""   style="margin-top:10px;padding:0px">
  <a href="/latest-jewelry.cfm"><b>New Arrivals</b></a>
</div>

</cfif>
 <!---<cfif cgi.server_name does not contain 'semiprecious.in'>--->

<cfif session.country neq 'india'>
	<cfoutput>	
		<div  align="left"  class=""   style="margin-top:10px;padding:0px">
		  Jewelry by <br />price &nbsp;<img src='/images/down.gif'>
		</div>  
		<div id="LeftPriceDisplay"  style="display:#leftpricedisplay#" ><br>
			<cfif len(session.bulkbuyer.id)>
				<a class="side_link"  href="/jewelry-under-$10.cfm?">under #round_format(10)#</a>
				<a class="side_link" href="/jewelry-under-$20.cfm?">#round_format(11)# to #round_format(20)#</a>
				<a class="side_link" href="/gemstone_jewelry_gallery.cfm?priceless=30&pricegreater=20">#round_format(21)# to #round_format(30)#</a>
			</cfif>
			<a class="side_link" href="/jewelry-under-$30.cfm?priceless=30&pricegreater=0">Under #round_format(30)#</a>
			<a class="side_link" href="/jewelry-under-$50.cfm?pricegreater=30&priceless=50">#round_format(30)# to #round_format(50)# </a>
			<a class="side_link" href="/jewelry-under-$100.cfm?pricegreater=50&priceless=100">#round_format(50)# to #round_format(100)#</a>
			<cfif not len(session.bulkbuyer.id)>
				<a class="side_link" href="/jewelry-under-$150.cfm?pricegreater=100&priceless=2000">Over #round_format(100)#</a>
			</cfif>
		</div>
	</cfoutput>
<cfelseif session.country is "india">
	<cfoutput>	
		<div  align="left"  class=""    style="margin-top:10px;padding:0px">
    		#categ# by <br />Price &nbsp;<img src='/images/down.gif'>
 		</div>  
		<div id="LeftPriceDisplay" >
   
			<a class="side_link" href="/gemstone_jewelry_gallery.cfm?pricegreater=#(0/application.exch['india'])#&priceless=#(500/application.exch['india'])#&category=#categ#">Upto Rs 500</a>
			<a class="side_link" href="/gemstone_jewelry_gallery.cfm?pricegreater=#(500/application.exch['india'])#&priceless=#(1250/application.exch['india'])#&category=#categ#">Rs 500 to Rs 1250</a>
			<a class="side_link" href="/gemstone_jewelry_gallery.cfm?pricegreater=#(1000/application.exch['india'])#&priceless=#(2500/application.exch['india'])#&category=#categ#">Rs 1000 to Rs 2500</a>
			<a class="side_link" href="/gemstone_jewelry_gallery.cfm?pricegreater=#(2000/application.exch['india'])#&priceless=#(5000/application.exch['india'])#&category=#categ#">Rs 2000 to Rs 5000</a>
			<a class="side_link" href="/gemstone_jewelry_gallery.cfm?pricegreater=#(5000/application.exch['india'])#&priceless=#(20000/application.exch['india'])#&category=#categ#">Above Rs 5000</a>
		</div>
  	 </cfoutput>
</cfif>


<br>
	<div  align="left"  class=""  style="margin-top:4px;padding:0px">
    <cfoutput>#categ# by <br />color&nbsp;<img src='/images/down.gif'>
 </div>
 <!--- display instead of flipDisplay for shrinking the list --->
    <div id="LeftColorDisplay"  >
        <cfloop index="Color1" list="#application.color_list#">
              <cfif category eq "all" or category eq "" >
              <a href="/#Color1#-gemstone-jewelry.cfm" class="side_link"> #Color1#</a> 
              <cfelse>
               <a href="/color-gem-stone/#Color1#-#categ#.cfm" class="side_link"> #Color1#</a> 
              </cfif> 
	      </cfloop>
      
			</div>
			
    		  </cfoutput>


<cfif  len(session.bulkbuyer.id)>
	<div class="component_box">
	<a href='/bulklots.cfm' class="reg_price">Wholesale Lots</a>
	</div>
</cfif>
<!--- have put this here to create space between search box and below menu. CSS wouldn't help --->

      
  <!--- End color popup button --->
  <!--- Start birthstone popup button --->
	<!--- BIRTHSTONE PAGES NEED FIXING
 <div   align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftBirthstoneDisplay')"  >
    Jewelry by <br />Birthstone&nbsp;<img src='/images/down.gif'>
	</div>
<cfoutput>
    <div id="LeftBirthstoneDisplay" style="flipDisplay:#LeftBirthstoneDisplay#" >
        <cfloop index="Month" list="january,february,march,april,may,june,july,august,september,october,november,december">
             <a href="/#Month#-birthstone.cfm" class="side_link"> #Month# birthstone</a> 
 </cfloop>
</cfoutput> 
	  </div>--->
	
  <!--- End birthstone popup button --->




</div>
</cfif>