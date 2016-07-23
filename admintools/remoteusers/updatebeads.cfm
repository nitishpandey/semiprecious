<cfparam name=inventory default="">

<h3>update beads inventory</h3>
<form name=updatebeads action=updatebeads.cfm method=post>
Item number: <input type name="itemid" value="">
New Inventory:<input type name="inventory" value="">
<input type=submit>
</form>

<cfif inventory neq "">

<cfquery name="updatebeads" datasource="gemssql">
update items set inventory=#inventory# where newitem=#itemid# and cat='beads'</cfquery>

<p>INVENTORY UPDATED! Thank you
</cfif>


