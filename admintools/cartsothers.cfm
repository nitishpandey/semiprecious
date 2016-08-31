<cfparam name=cartid default="">

<cfif cartid neq "">
<cfset cc = cartid />
<cfinclude template="/admintools/update_india_ship.cfm" />
</cfif>

<cfquery datasource="gemssql" name="s">
Select distinct CartforOthers.*, indate from CartforOthers inner join cartstatus on cartstatus.cartid=cartforothers.cartid where paymode <>'null' and paymode <> 'activated'
 and paymode <> 'emptied' and shipdate is null and ((supplier like '#shipper#%') <CFIF SHIPPER CONTAINS 'ac'> OR supplier in ('harish', 'vijay', 'arpit', 'GR', 'anup', 'kashish', 'royal') </cfif>)  order by indate
</cfquery>


<form action="/admintools/invoiceindiaashtm.cfm" method="post">
Pending carts:<br>
<cfoutput query="s">

<input type="checkbox" name="cartlist" value="#cartid#"> <a href=/itemsell.cfm?cartid=#cartid#>#cartID#</a>;  In date: #indate#, === Outdate: #shipdate#<a href='#THISFILE#?cartid=#cartid#'>Change to Shipped</a><br />
</cfoutput>
<br />
Other Cart Ids: <input type="text" name="cartlist2" title="other cartids. separate using comma" >
<br /><input type="submit" value="Select Carts to Ship and Click Here to Proceed to Refund Process Stage" >
</form>
<cfoutput>#s.columnlist#</cfoutput>
================
<cfquery datasource="gemssql" name="s">
Select distinct CartforOthers.*, indate from CartforOthers inner join cartstatus on cartstatus.cartid=cartforothers.cartid where (supplier like '#shipper#%') and shipdate >
#createodbcdate(dateadd('d',-60,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))# order by shipdate desc
</cfquery>
<p>Shipped Carts:</p>
<cfoutput query="s">
<a href=/itemsell.cfm?cartid=#cartid#>#cartID# </a> In Date: #indate#, Outdate: #shipdate# (((())))) <a href=/admintools/cartissues.cfm?cartid=#cartid#>Add Tracking</a><br>
</cfoutput>