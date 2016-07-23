<!DOCTYPE html>
	<cfparam name="category" default="">
<cfparam name="item1" default="0">
<cfparam name="item2" default="0">
<cfparam name="item3" default="0">

<cfquery name="getitem" datasource="gemssql">
  Select * from items where newitem='#sku#'
</cfquery>

<cfquery name="getoptions" datasource="gemssql">
  Select * from options where itemid='#sku#' AND INVENTORY>0 and optionid<>0
</cfquery>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Wed, 07 Jan 20   15 21:24:40 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">


    <title></title>
    

	
  </head>
  <body>

    <div id=details align=center>
	<cfoutput>
	<h2>SKU/Item ID: #getitem.newitem#</h2>
	<cfif getitem.imagelink eq ""><img src=http://www.semiprecious.com/images/#getitem.cat#/#sku#.jpg>
<cfelse>
	<img src="#getitem.imagelink#">
</cfif>
	<form name="addtocart" action="add_to_cart.cfm" method="post">
	
	<input type="hidden" name="sku" value="#sku#">
	<input type="hidden" name="itemprice" value="#getitem.wholesaleprice#">
	
	</cfoutput>
	<cfif getoptions.recordcount gt 0>
		<select name="option">
		<option value="0" selected>Any Size</option>
		<cfoutput query="getoptions">
		
		<option value="#description#">#description#</option>
		</cfoutput>
		</select>
	</cfif>
		
	
	<input type="image" src="http://www.semipreciouswholesale.com/images/addtocart.jpg">
	</form>
	
	</div>


  </body>
</html>