<html>
<head>
<title>Your Business : Is it Growing ?</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/rowsblue.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
.noline {
	font: 14px Arial, Helvetica, sans-serif;
	color: #000000;
	text-decoration: none;
}
-->
</style>
</head>

<body  style="font:12px arial blue;" >
<cfset dsn = 'semiprecious'>
<CFIF isdefined("session.passcode") and session.passcode eq 'shaurya'>
  <Cfoutput> 
    <!--- Practically Unique cartid = #session.cartid2#, --->
    Time :[ #now()#]</Cfoutput>
<cfquery datasource="#dsn#" name="s">
select * from cartstatus where indate > #createodbcdate(dateadd('d',-22,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  or paymode in ('2co','auth.net','pp','chck') order by 
<cfif isdefined("url.orderby")>
#url.orderby# desc,
</cfif> cartid desc
</cfquery>
  <strong>All costs are in USD.</strong> CLick on cartid to process the cart., click on cost to delete,<a href="/" >Site</a>
  click on any heading to sort on that field. <a href="Admin.cfm">admin page</a> 
  <table width="90%"  border="1" cellspacing="1" ><tr class="row1" bgcolor="#CCCC99"><td>CartId</td><td>Value<br>
View</td><td width="5%" style="font-size:11;">Bas:NonUS:Sp:GW</td><td>Cost/<br>
Delete?</td><td>Qty(Total<br>
&nbsp;&nbsp;/sale)</td><td><a href="cartstatus21.cfm" class="noline">In Time</a></td><td>Out</td><td>Coupon</td><td><a href="cartstatus21.cfm?orderby=paymode" >Mode</a><br />Confirm</td><td width="4%"><a href="cartstatus21.cfm?orderby=status" >Status</a></td></tr>
<cfoutput query="s">
<tr>
        <td>#cartid#</td> <td><a href="itemsell.cfm?cartid=#cartid#&paymode=" alt="see list" class="noline" >#cost#</a></td><td>#shippingdetails#</td>
        <td><a href="cartdelete.cfm?cid=#cartid#&&paymode=#paymode#&couponcode=#couponcode#">#inrcost#</a></td>
        <td>#totalqty#/#noofsaleitems# </td><td style="font-size:10;">#indate#</td><td style="font-size:10;">#outdate#&nbsp;</td>
		<cfif tps eq 'y'>
		<td background="images/bottom_bg.gif"><a href="creditcalculator.cfm?cartid=#cartid#">@</a>
		<cfelse>
		<td>
		</cfif>
		 #couponcode#&nbsp;</td>
        
		
		<cfswitch expression="#paymode#">
		
<cfcase value="pp,auth.net,2co,chck" delimiters=",">
<td bgcolor="##FF6622">
		</cfcase>
		<cfdefaultcase>
		<td>
		</cfdefaultcase>
		</cfswitch>
		
		<a href="itemsell.cfm?cartid=#cartid#&paymode=#paymode#&couponcode=#couponcode#" >#paymode#</a>&nbsp;</td><td   width="4%"	 style="font-size:10;">
			<cfif status is 'done'>
		<a href="showorigin.cfm?cartid=#cartid#">done</a>
		<!--- on being 'done' itemsell.cfm makes the cartid negative
		in the visitrecord table . just a trick to save on a column,
		since as it is we plan to keep only succesful visits in 
		visitrecord table --->
		<cfquery datasource="semiprecious" name="s">
select * from visitrecord where cartid = -1*#cartid#
</cfquery><br>
( #s.comingfrom#)
<cfelse>
#status#
		</cfif>&nbsp;<a href="showuserdetails.cfm?email=#buyer#"  >#buyer#</a>
	</td></tr>

</cfoutput>
</table>

</cfif>
<a href="admin.cfm">Detergent ?</a>
</body>
</html>
