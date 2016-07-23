<html>
<head>
<title>Cart Item Update (Copy cart)</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="Layer1" style="position:absolute; left:55px; top:194px; width:652px; height:16px; z-index:1"> 
  <cfform action="savedcart.cfm" method="get">
    Enter the saved cart id :
<cfinput name="cartid" validate="integer" type="text" required="yes" >
    <input type="submit" value="Load Cart">
</cfform></div>
<cfinclude template="header.cfm">
<cfif isdefined("form.cartid")>
<cfquery datasource="semiprecious" name="q">
select itemid, quantity from buyingrecord,cartstatus where buyingrecord.cartid = #form.cartid# and cartstatus.paymode = 'saved'</cfquery>
<CFLOOP query="q"   >
         <CFSET session.cartitem[currentrow][1] =itemid>
        <CFSET session.cartitem[currentrow][2] ="necklaces">
        <CFSET session.cartitem[currentrow][3] =0>
        <CFSET session.cartitem[currentrow][4] =quantity>
	  </cfloop>
	  <cfset application.cartid = application.cartid + 22> <!--- just to keep the  customer believing that there have been 
	  a large number of sales --->
	  <cflocation addtoken="no" url="confirmation.cfm">
	  Now go to the <a href="cart.cfm">cart</a> page. There use the copied cartid's value as coupon code example : 'copy1127'.
  thus cartstatus21 will tell which cart was this copied from.<br>

  Please note that you will get a new cartid  onthe confirmation page and then you can treat the original cart as deleted and work on this 
new cart id. 
Secondly, the cost of this cart will show 0 cost and missing thumbnails. This is becuase this page has not tried to discouver
these for the items in question and they are not required.
You may also want to update the cost of the new cart using update cart value link on admin.cfm page.
<cfelseif isdefined("session.cartid") >
<cfif session.cartid neq 0>
<cfquery datasource="semiprecious">
update cartstatus set paymode = 'saved' where cartid = #session.cartid#
</cfquery>
<hr />
Your cart saved! You can now reload the cart contents and start shopping later.
<cflocation addtoken="no" url="confirmation.cfm?message=cartsaved">
</cfif>
</cfif>
  <cfinclude template="footer.htm">
</body>
</html>
