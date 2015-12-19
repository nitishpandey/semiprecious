<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="dcterms.created" content="Tue, 06 Oct 2015 04:44:24 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title></title>
    
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>

  <cfquery name="mmacategory" datasource="semi_mysql"> 
  select distinct `primary category` as pc from mma_import
  </cfquery>
  
  <cfoutput query="mmacategory">
  #pc#<br>
  </cfoutput>
  </body>
</html>