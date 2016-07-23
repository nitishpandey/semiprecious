<cfparam name=valueusd default=0>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Thu, 24 May 2012 18:28:33 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>Coupn Adder</title>
    
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
  
  <cfif valueusd is 0>
<form name="addcoupon" action="addcoupon.cfm">

CouponCode: <input type="text" value="" name="couponcode">
Value (USD): <input type="text" value="" name="valueusd">
Note: <input type="text" size=100 value="" name="remark">

<input type="submit">

</form>

<cfelse>
		<cfquery name="checkcp" datasource="gemssql">
        select couponcode, remark from certificatecode where couponcode='#couponcode#'
		</cfquery>
		
		<cfif checkcp.recordcount gt 0>
		<h2>THIS CODE ALREADY EXISTS! NOTE ON THE EXISTING ONE IS <cfoutput>#checkcp.remark#'</cfoutput>. PLEASE GO BACK AND MAKE A NEW ONE</h2>
		<cfelse>
        <cfquery name="addcp" datasource="gemssql">
        insert into dbo.certificatecode (couponcode, valueusd, remark) select '#couponcode#', '#valueusd#', '#remark#'
        </cfquery>
		<h2>COUPON ADDED!</h2>
		
		</cfif>
		 
		 
</cfif>


  </body>
</html>