<html><!-- in use in confirmation page/cart page -->
<head>
<title>Cart Item Update (Fill Up Cart)</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="/styles/npstyles1.css"  rel="stylesheet" />
</head>

<body topmargin="0">
<div align="center">
<!--- called from application.cfm, cart.cfm or confirmation.cfm on session restart etc. ---->
<cfinclude template="headerforlist.cfm">
<cfparam default="" name="form.cartid" >
<cfif isdefined("cookie.cartinfile")> 
<cftry>
<cffile action="read" file="d:\inetpub\semiprecious\carts\#cookie.cartinfile#"  variable="temp" />
<cfcatch type="any">
<cfcookie expires="now" name="cartinfile" secure="no">
<cfset temp = "">

</cfcatch>
</cftry>
<cfset form.cartid = temp>
<!--- <cfoutput>#cookie.cart#</cfoutput> --->

<cfif  listlen(temp,',')>a<!--- 
<cfquery datasource="semiprecious" name="q">
select itemid, quantity from buyingrecord where cartid = #form.cartid# </cfquery> --->
<cfset q  = querynew('i')>
<cfset  queryaddrow(q,listlen(temp,','))>
<cfset idarray = arraynew(1)>
<cfset unit = arraynew(1)>
<cfset options = arraynew(1)>
<cfloop  list="#temp#" index="j" >
<cfset arrayappend(idarray,listgetat(j,1,":"))>
<cfset arrayappend(unit,listgetat(j,2,":"))>
<cfset arrayappend(options,listgetat(j,3,":"))>
</cfloop>
<cfset queryaddcolumn(q,'itemid',idarray)>
<cfset queryaddcolumn(q,'quantity', unit)>
<cfset queryaddcolumn(q,'option', options)>
<cfif q.recordcount>
<cfset session.cartitem = arraynew(2)>
<CFLOOP query="q"   >
<cfquery datasource="gemssql" name="q2">
select cat, price, wholesaleprice,saleprice, status,inventory from items where newitem = #itemid#
</cfquery>
<cfif q2.recordcount>1
         <CFSET session.cartitem[currentrow][1] =itemid>
        <CFSET session.cartitem[currentrow][2] ="#q2.cat#">
        <CFSET session.cartitem[currentrow][3] =q2.price>
		<cfif q2.status eq 3>
        <CFSET session.cartitem[currentrow][3] =q2.saleprice>
		</cfif>
		<cfif isdefined("session.bulkbuyer.id")>
		  <CFSET session.cartitem[currentrow][3] =  q2.wholesaleprice>
		  </cfif>
		  <cfif q2.inventory>
        <CFSET session.cartitem[currentrow][4] =quantity>
		<cfelse>
		        <CFSET session.cartitem[currentrow][4] =0>
		</cfif>
        <CFSET session.cartitem[currentrow][5] =option > 
		</cfif>
	  </cfloop>
<!--- 	 <cffile action="delete" file="d:\inetpub\semiprecious\carts\#cookie.cartinfile#"  /> --->
  <cflocation addtoken="no" url="/cart.cfm">	<!-- 
	  Now go to the <a href="cart.cfm">cart</a> page. There use the copied cartid's value as coupon code example : 'copy1127'.
  thus cartstatus21 will tell which cart was this copied from.<br>
  Please note that you will get a new cartid  onthe confirmation page and then you can treat the original cart as deleted and work on this 
new cart id. 
Secondly, the cost of this cart will show 0 cost and missing thumbnails. This is becuase this page has not tried to discouver
these for the items in question and they are not required.
You may also want to update the cost of the new cart using update cart value link on admin.cfm page.
 --></cfif>
</cfif>

No Such Cart found! Please Try again.<br>

</cfif>
  <h3>Shop using a list of items:</h3>
  <div align="center">
<table width="673" border="0" cellspacing="0" cellpadding="0">
      <tr> 
      <td width="22"><img src="../images/jewelry_box_1.gif" width="22" height="22" align="absmiddle"></td>
      <td width="629" bgcolor="#CCCC99">Type in your list using commas. Example 
        : 202,882,1020,12 . Then click on 'Fill Cart'</td>
      <td width="22"><img src="../images/jewelry_box_3.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center"  valign="middle" bgcolor="#FFFFFF"> <cfform action="fillcart2.cfm" method="get">
          Enter ids : 
          <cfinput name="cartid" type="text" required="yes"  >
          <input name="submit" type="submit" value="Fill Cart">
        </cfform>
      </td>
      <td bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td><img src="../images/jewelry_box_4.gif" width="22" height="22" align="absmiddle"></td>
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td><img src="../images/jewelry_box_2.gif" width="22" height="22" align="absmiddle"></td>
    </tr>
  </table>
</div>
<br>

<cfinclude template="adminfooter.cfm">
</div>
</body>
</html>
