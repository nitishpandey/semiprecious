<cfquery datasource="gemssql" name="s">
  select distinct c.cartid, indate from cartstatus c inner join buyingrecord b on b.cartid=c.cartid inner join items i on i.newitem= b.itemid   where paymode is not null and storage ='pippin' and indate > #createodbcdate(dateadd('d',-30,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  and paymode in ('2co','auth.net','pp','chck','goog' ) order by 
c.cartid desc
</cfquery>

Pending carts:<br>
<cfoutput query="s">
<a href=http://www.semiprecious.com/itemsell.cfm?cartid=#cartid#>#cartID#</a>;  In date: #indate#<br>
</cfoutput>

================
<cfquery datasource="gemssql" name="s">
  select distinct c.cartid, indate from cartstatus c inner join buyingrecord b on b.cartid=c.cartid inner join items i on i.newitem= b.itemid   where paymode is not null and storage ='pippin' and indate > #createodbcdate(dateadd('d',-60,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  and paymode in ('wellscc','paypal','check','google' ) and c.status ='done' order by 
c.cartid desc
</cfquery>
<p>Shipped Carts:</p>
<cfoutput query="s">
<a href=http://www.semiprecious.com/itemsell.cfm?cartid=#cartid#>#cartID# </a> In Date: #indate#<br>
</cfoutput>