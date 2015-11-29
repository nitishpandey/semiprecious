<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<CFSET session.cartitem=ArrayNew(2)  />
<Cfset session.cartitem[1][1] = 0  />
<Cfset session.cartitem[1][4] = 0  />
<cfset session.totalqty = 0>
<cfset session.grandtotal = 0>
<cflocation addtoken="no" url="cart.cfm"  />

</body>
</html>
