<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif>
<cfparam name=supplierprefix default="mma">
<cfparam name=ordered default="no">
<cfparam name=cartid default="0">
<cfparam name=itemid default="0">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfif ordered is 'yes' and cartid neq '0'>
<cfquery name="updatethirdparty" datasource="gemssql">
update buyingrecord set makeondemand=1 where cartid=#cartid# and itemid=#itemid#</cfquery>
</cfif>

<cfquery name="supplieritems" datasource="gemssql">
Select distinct cartstatus.cartid, newitem, storage, indate, outdate,quantity,makeondemand from cartstatus, items,  buyingrecord where buyingrecord.itemid=items.newitem and cartstatus.cartid=buyingrecord.cartid and cartstatus.paymode<>'null'
and items.supplier like '#supplierprefix#%' and (DATEDIFF(m,[outdate],GETDATE())< 1 or outdate is null) order by outdate
</cfquery>
<html>
<head>
<title>MMA Items</title>
</head>
<body>
<h2><cfoutput>#supplierprefix#</cfoutput> orders</h2>
<table>
<tr bgcolor=gray><td>Cartid</td><td>itemid</td><td>storage</td><td>Order Date</td><td>Outdate</td><td>Quantity</td></tr>
<cfoutput query="supplieritems">
<tr><td><a href="/itemsell.cfm?cartid=#Cartid#">#cartid#</a></td><td>#newitem#</td><td>#storage#</td><td>#dateformat(inDate)#</td><td>#dateformat(Outdate)#</td><td>#Quantity# <cfif quantity is '0'><font color=red>Refunded</font></cfif></td><td> <cfif makeondemand is '0'><a href='thirdpartysales.cfm?supplierprefix=#supplierprefix#&ordered=yes&cartid=#cartid#&itemid=#newitem#'>Ordered?</a><cfelse>Ordered</cfif></td></tr></cfoutput>
</table>

</body>
</html>
