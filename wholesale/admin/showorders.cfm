<!DOCTYPE html>
<cfparam name="startcartid" default="100">
<cfparam name="showringsizing" default="">
<cfparam name="cart_id" default="0">
<cfparam name="shippedcart" default="">
<cfparam name="ordered" default="">
<cfparam name="showemails" default="">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Tue, 30 Sep 2014 04:53:41 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title></title>
    
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>


<cfif shippedcart neq "">

    <cfquery datasource="semiweb" name="markshipped">
      UPDATE shopping_cart SET shippedtocustomer=#shippedcart# where cartid=#cart_id#
     </cfquery>

</cfif>

<cfif ordered neq "">

    <cfquery datasource="semiweb" name="markshipped">
      UPDATE shopping_cart SET orderedfromsupplier='#ordered#' where cartid=#cart_id#
     </cfquery>

</cfif>

  <body>

  
 <a href=showorders.cfm>HOME</a><p>
<cfif cart_id eq "0">
<cfquery datasource="semiweb" name="getOrders">
SELECT couponcode, datecreated, shippedtocustomer, i.cartid, sku, size, size_changed, email, price, orderedfromsupplier FROM customers c, shopping_cart sc, shopping_cart_items i 
WHERE <cfif showringsizing is 'yes'> size_changed=1 and </cfif>c.customerid=sc.customerid and sc.cartid=i.cartid and i.cartid>=#startcartid# and shippedtocustomer=0 order by i.cartid desc 

</cfquery>


<table border=1><tr bgcolor='yellow'><cfif showemails neq ""><td>Datecreated</td></cfif><td>Cart ID</td><td>SKU</td><td>Size</td><td>size changed</td><cfif showemails neq ""><td>email</td></cfif><td>Price</td><td>Ordered from Rahul?</td><td>Shipped To Customer?</td><td>Coupon Code</td></tr>
<cfoutput query="getorders">
<tr><cfif showemails neq ""><td>#Datecreated#</td></cfif><td><cfif showemails neq ""><a href=showorders.cfm?cart_id=#cartid#>#CartID#</a><cfelse>#cartid#</cfif></td><td>#SKU#</td><td>#Size#</td><td>#size_changed#</td><cfif showemails neq ""><td>#email#</td></cfif><td>#Price#</td><td>#orderedfromsupplier# ||<a href=showorders.cfm?ordered=yes&cart_id=#cartid#>Change to YES</a></td><td>#shippedtocustomer# || <a href=showorders.cfm?shippedcart=1&cart_id=#cartid#>Change to YES</a></td><td>#couponcode#</td></tr>


</cfoutput>
</table>

<cfelse>

<cfquery datasource="semiweb" name="getcart">
select email, t.* from shopping_cart t, customers c where c.customerid=t.customerid and cartid =#cart_id#
</cfquery>

<table border=1><tr><td>Name</td><td>Street</td><td>City</td><td>State</td><td>Country</td><td>Total</td><td>Discounted Total</td></tr>
<cfoutput query="getcart">
<tr><td>#first_name# #last_name#</td><td>#street_address#<br>#street_address2#</td><td>#city#</td><td>#state#</td><td>#zip#</td><td>#country#</td><td>#total#</td><td>#discounted_total#</td><td>#Orderedfromsupplier#</td><td>#Shippedtocustomer#</td><td>#email#</td></tr>


</cfoutput>
</table>

</cfif>


  </body>
</html>