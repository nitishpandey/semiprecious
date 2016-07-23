<!--- Latest in stock/added from category --->
<cfparam name="category" default="rings">

<cfquery name="latestHome" datasource="gemssql">
Select top 5 newitem, price, cat from items where cat ='#category#' and inventory>0 and status=0 order by disporder
</cfquery>

<table><tr><td><cfoutput><b><i>#Ucase(category)#</i></b></cfoutput></td></tr><tr>
<cfoutput query="latesthome">
<td align="middle" valign=top width=100>
<a href=/jewelry_item.cfm?newitem=#newitem#><img src=/images/#category#/thumb/#newitem#.jpg border=0 <cfif category is 'beads'>width=100<cfelse>height=100</cfif>></a><br>
</td><td width=20>&nbsp;</td>
</cfoutput>
<cfoutput><td colspan=2 valign=bottom><br><a href=/latest-#category#.cfm>more..</a></td></tr></cfoutput>
</table><br>



