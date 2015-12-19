<html>
<head>
<title>Cart Item Update (Fill Up Cart)</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body>
<cfinclude template="header.cfm">
<cfif isdefined("url.cartid")><!--- 
<cfquery datasource="gemssql" name="q">
select itemid, quantity from buyingrecord where cartid = #form.cartid# </cfquery> --->

<cfset currentrow =arraylen(session.cartitem)>
<cfif session.cartitem[1][1] eq 0><cfset currentrow = 0>
</cfif>
<cfif not isdefined("form.addtocart")><cfset currentrow = 0>
</cfif>
<CFLOOP  list="#urldecode(url.cartid)#" index="itemid"   >
<cfquery datasource="gemssql" name="q2">
select cat, price, saleprice, inventory,status from items where newitem = #itemid#
</cfquery>
<cfif q2.recordcount>
<cfset currentrow = currentrow + 1>
         <CFSET session.cartitem[currentrow][1] =itemid>
        <CFSET session.cartitem[currentrow][2] ="#q2.cat#">
        <CFSET session.cartitem[currentrow][3] =q2.price>
		<cfif q2.status eq 3>
        <CFSET session.cartitem[currentrow][3] =q2.saleprice>
		</cfif>
      <cfif q2.inventory>
        <CFSET session.cartitem[currentrow][4] =1>
	<cfelse>
                <CFSET session.cartitem[currentrow][4] =4>
	   </cfif> 
		   <CFSET session.cartitem[currentrow][5] =0>
	   	</cfif>
	  </cfloop>
	  <cfif currentrow>
	  <cfdump expand="yes" var="#session.cartitem#" />
	  <cfoutput>#currentrow#</cfoutput>
	  <cflocation addtoken="no" url="cart.cfm">
  </cfif>
<!-- 	  Now go to the <a href="cart.cfm">cart</a> page. There use the copied cartid's value as coupon code example : 'copy1127'.
  thus cartstatus21 will tell which cart was this copied from.<br>
  Please note that you will get a new cartid  onthe confirmation page and then you can treat the original cart as deleted and work on this 
new cart id. 
Secondly, the cost of this cart will show 0 cost and missing thumbnails. This is becuase this page has not tried to discouver
these for the items in question and they are not required.
You may also want to update the cost of the new cart using update cart value link on admin.cfm page.
 -->
No Such Cartid found! Please Try again.<br>

</cfif>
Shop using a list of items:<br>
<br>
<div align="center">
  <table width="591" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="22"><img src="../images/Untitled-1.gif" width="22" height="22" align="absmiddle"></td>
      <td width="531" bgcolor="#CCCC99">Type in your list using commas. Example 
        : 202,882,1020,12 . Then click on 'Fill Cart'</td>
      <td width="22"><img src="../images/Untitled-3.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center" bgcolor="#FFFFFF">
	   <cfform action="fillcartfromlist.cfm" method="get">
          Enter ids : 
          <cfinput name="cartid" type="text" required="yes"  >
          <input name="submit" type="submit" value="Fill Cart">
		  Add To Existing Items in Cart : <input type="checkbox" name="addtocart"  checked>
        </cfform>
      </td>
      <td bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td><img src="../images/Untitled-4.gif" width="22" height="22" align="absmiddle"></td>
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td><img src="../images/Untitled-2.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
  </table>
</div>
<br>
<br>

<cfinclude template="adminfooter.cfm">
</body>
</html>
