<cfif thistag.executionmode is "start">
<cfset ke  = -1*randrange(4,30)>
<cfquery datasource="gemssql" name="random"  >
select  distinct top 30 wish.subcat, wish.newitem,wish.dateadded from wish inner join items on wish.newitem=items.newitem where storage <> 'pippin' and dateadded < #Createodbcdate(dateadd('d',ke,Now()))# order by dateadded desc
</cfquery>
<cfoutput>
<cfloop from="1" to="#Attributes.rows#" index="i">
<cfset r = (i-1)*Attributes.cols>
<tr>
<cfloop from="1" to="#Attributes.cols#" index="j">
<cfset rc = r + j >
<td colspan="#Attributes.colspan#" align="center" valign="middle"  class="#Attributes.boxclass#"><a href="jewelry_item.cfm?newitem=#random['newitem'][rc]#"><img src="/images/#random['subcat'][rc]#/thumb/#random['newitem'][rc]#.jpg" vspace="0" hspace="0" border="0" width=100></a></td>
</cfloop>
</tr>
</cfloop>
</cfoutput>
</cfif>