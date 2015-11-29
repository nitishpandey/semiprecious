<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Thu, 27 Nov 2014 03:49:19 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title></title>
    
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>

  <cfquery name="currentinventory" datasource="semi_mysql">
  
  		   SELECT sku_orig, product_sku, `current stock level` as inv FROM `bigc` inner join locations on product_sku=sku where sku_orig <>''
  </cfquery>
  
  <CFLOOP QUERY="CURRENTINVENTORY">
  
  		  <CFQUERY NAME="UPDATESTOCK" DATASOURCE="GEMSSQL">
		  
		  update items set inventory=#inv# from items where newitem=#sku_orig#
		  </CFQUERY>
  udpated <cfoutput>#sku_orig# to #inv#</cfoutput><br>
  </CFLOOP>
  
  
  
  </body>
</html>