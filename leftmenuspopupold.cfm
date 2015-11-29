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

<CFINCLUDE TEMPLATE="subcatvertical.cfm">  