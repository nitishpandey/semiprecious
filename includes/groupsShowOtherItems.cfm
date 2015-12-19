<cfparam name=category default="jewelry">
<cfparam name=numbershow default=4>
<cfif category is "pendants" or category is "necklaces"><cfset numbershow=3></cfif>
<cfquery name="findGroup" datasource="gemssql">Select top 1 groupname from itemsbyGroup where itemid=#itemnumber#</cfquery>

<cfquery name="groupitems" datasource="gemssql">
Select top #numbershow# itemID from itemsBygroup, items where itemsbygroup.itemid = newitem and GroupName='#findGroup.groupname#' <cfif category neq "All">and category = '#category#'</cfif> and itemid <> #itemnumber# and (inventory>0 or orderonrequest=1) order by disporder
</cfquery>
<cfif groupitems.recordcount GT 0>
<cfoutput>#findGroup.groupname# Items</cfoutput>

<cfoutput query="groupitems">
<a href=detail.cfm?newitem=#itemid#><img src=http://www.semiprecious.com/images/#category#/thumb/#itemID#.jpg border=0 width=75></a><br>
</cfoutput>
<cfoutput>
<a href=http://www.semiprecious.com/shaped/#findGroup.groupname#-gemstone-#category#.cfm>More #findGroup.groupname# #category#</a></cfoutput>
</cfif>