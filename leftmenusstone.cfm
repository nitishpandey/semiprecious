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
	        	
              

		<!-- BEGIN Menu -->

	   
                        <CFINCLUDE TEMPLATE="/subcatverticalstone.cfm" />
                    
    
