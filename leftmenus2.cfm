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
<cfif category neq "" and category neq "all" and category neq "chains" and category neq 'cufflinks' >
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
<script language="javascript"  >  	
var sec = 30;   // set the seconds
var min = 220;   // set the minutes

function countDown() {
  sec--;
  if (sec == -01) {
    sec = 59;
    min = min - 1;
  } else {
   min = min;
  }
if (sec<=9) { sec = "0" + sec; }
  time = (min<=9 ? "0" + min : min) + " min and " + sec + " sec ";
if (document.getElementById) { theTime.innerHTML = time; }
  SD=window.setTimeout("countDown();", 1000);
if (min == '00' && sec == '00') { sec = "00"; window.clearTimeout(SD); }
}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  countDown();
});
</script>
<div class="component_box" align="center">
<span id="theTime" style="color:red;font-weight:bold;font-family:'comic sans',helvetica;"></span>
</div>
<div class="component_box" align="center">
   <cfinclude template="includes/search.cfm" />	
</div>
<cfif category neq "gems">
    <!-- Start Gemstone listing -->
  <CFINCLUDE TEMPLATE="subcatvertical.cfm" />
    <!-- End Gemstone listing -->
  </cfif>



<cfif  len(session.bulkbuyer.id)>
	<div class="component_box">
	<a href='/bulklots.cfm' class="reg_price">Wholesale Lots</a>
	</div>
</cfif>

<cfoutput>	
	<div  align="center"  class="green_bg side_hd"  onClick="flipDisplay('LeftPriceDisplay')"  style="margin-top:10px;padding:0px">
    #categ# by <br />Price &nbsp;<img src='/images/down.gif'>
 </div>  <div id="LeftPriceDisplay"  style="display:#leftpricedisplay#" >
     
<cfif len(session.bulkbuyer.id)>
<a class="side_link"  href="/jewelry-under-$10.cfm?&category=#categ#">under #round_format(10)#</a>
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
    <cfoutput>#categ# by <br />Color&nbsp;<img src='/images/down.gif'>
 </div>
    <div id="LeftColorDisplay"  style="display:#leftcolordisplay#" >
        <cfloop index="Color1" list="#application.color_list#">
              <cfif category eq "all" or category eq "" or category eq 'cufflinks' >
              <a href="/#Color1#-gemstone-jewelry.cfm?category=#category#" class="side_link"> #Color1#</a> 
              <cfelse>
               <a href="/color-gem-stone/#Color1#-#categ#.cfm" class="side_link"> #Color1#</a> 
              </cfif> 
	      </cfloop>
      </div>
    		  </cfoutput>
      
  <!--- End color popup button --->
  <!--- Start birthstone popup button --->
 <div   align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftBirthstoneDisplay')"  >
    Jewelry by <br />Birthstone&nbsp;<img src='/images/down.gif'>
	</div>
<cfoutput>
    <div id="LeftBirthstoneDisplay" style="display:#LeftBirthstoneDisplay#" >
        <cfloop index="Month" list="january,february,march,april,may,june,july,august,september,october,november,december">
             <a href="/#Month#-birthstone.cfm" class="side_link"> #Month# birthstone</a> 
 </cfloop>
</cfoutput> 
	  </div>
	  <div  align="center"  class="green_bg side_hd"  style="margin-top:4px;padding:0px">

      By Theme&nbsp;<img src='/images/down.gif'>
	</div>
   <div id="LeftThemeDisplay" align=left>
  <a href="/jewelry.cfm" class="side_link">All Jewelry</a>
   <a href="/showsets.cfm" class="side_link">Jewelry with Sets</a>
    <a href="/pendants.cfm" class="side_link">Pendants</a> 
  <a href="/earrings.cfm" class="side_link">Earrings</a>
   <a href="/rings.cfm" class="side_link">Rings</a>
   <a href="/bracelets.cfm" class="side_link">Bracelets</a>
 <a href="/necklaces.cfm" class="side_link">Necklaces</a>
  <a href="/beads.cfm" class="side_link">Beads</a>
 <a href="/healing.cfm" class="side_link">Crystal Healing</a>
<cfif cgi.server_name does not contain 'wholesale'> 
<a href="/jewelry-sale.cfm" class="side_link"><font color=darkred>JEWELRY SALE!</font></a></cfif>

</div>
  <!--- End birthstone popup button --->




</div>
<cfinclude template="/daily_deals/daily_deals_why.cfm" /> 