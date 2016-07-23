<cfparam name="email" default="">
<cfparam name="cartid" default="">

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Thu, 11 Sep 2014 17:36:23 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title></title>
    
   
  </head>
  <body>

  <cfif email neq "" or cartid neq ""> 
  <cfset prevcart=0>  
<cfquery name="getitems" datasource="semiweb">  
  SELECT sku, email, price, sc.cartid FROM `customers` c, shopping_cart sc, shopping_cart_items i WHERE c.customerid=sc.customerid and sc.cartid=i.cartid and <cfif email neq "">email='#email#'</cfif> <cfif cartid neq "">sc.cartid  = #cartid#</cfif> order by cartid desc
</cfquery>  
<p><b>If you were refunded due to a high volume purchase then that is not reduced here</b><p>
 <table><tr bgcolor="lightblue"><td>Cart ID</td><td>SKU</td><td>Price</td></tr>

  <cfoutput query="getitems">

  <cfif cartid neq prevcart>  
  <tr bgcolor=black><td>&nbsp;</td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td></tr></cfif>
  <tr><td>#cartid#</td><td>#sku#</td><td>#price#</td></tr>
  <cfset prevcart=cartid>

  </cfoutput>

  </table>
 <cfelse>
No order found under this email, please check spelling/spaces:<b><cfoutput>#email#</cfoutput></b>
</cfif>
  </body>
</html>