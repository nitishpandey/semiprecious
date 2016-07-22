<cfquery name="in" datasource="gemssql">
select cartstatus.cartid,tracking,paymode from cartstatus,cartissues where cartstatus.cartid = cartissues.cartid and  indate < #createodbcdate(dateadd('d',-6,now()))# and tracking is null and paymode <> 'null' and paymode <> 'emptied' and paymode <> 'activated' and tracking1 is null
</cfquery>

<cfdump var="#in#">
<cfquery name="us" datasource="gemssql">
select cartstatus.cartid,tracking,paymode from cartstatus,cartissues where cartstatus.cartid = cartissues.cartid and  indate < #createodbcdate(dateadd('d',-10,now()))# and (tracking is null or tracking = 'UPS-india') and paymode <> 'null' and paymode <> 'emptied' and paymode <> 'activated' and tracking2 is null 
</cfquery>
<cfdump var="#us#">
