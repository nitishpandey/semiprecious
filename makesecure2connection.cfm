<html>
<head>
<title>Secure Connection to 2 CO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="semiprecious" >
update cartstatus set paymode='CO' where cartid = #session.Cartid#
</cfquery>
<cfif isdefined("form.ship_name")>
<cfparam name="form.email" default="na">
<cfparam name="form.state" default="na">
<cfparam name="form.city" default="na">
<CFQUERY DATASOURCE="semiprecious" NAME="addPurchase">
insert into purchase (email, cartid, firstname, address1, city, state, country) values ('#session.cartid#/#email#','#session.cartid#', '#ship_name#','#ship_street_address#', 
'#ship_city#',  '#Ship_state#' & ' ' & '#ship_zip#', '#ship_country#')
</cfquery>
updated
<cflocation addtoken="no" url="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase.2c?ship_name=#ship_name#&cart_order_id=#session.cartid#&c_prod=1&id_type=1&sid=#form.sid#&total=#total#" />
<cfelse>
<cfquery datasource="semiprecious" >
delete from purchase where cartid = '#url.cart_order_id#' 
</cfquery>
<cflocation addtoken="no" url="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase.2c?#CGI.QUERY_STRING#" />

</cfif>

</body>
</html>
