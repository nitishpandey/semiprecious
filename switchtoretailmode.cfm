<html>
<head>
<title>Switch to Retail Mode</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfset structdelete(session,"bulkbuyer","No")>
<cfset session.quick_add = 0 />
<cfset session.bulkbuyer.id = "" />
Wholesale/Affiliate mode switched off. Now you are in retail mode. To get back to wholesale pricing please login again using
the whole sale login page.
<br>
Thankyou.
<cfset session.salemode = '##DDDDDD'>
<cflocation url="list.cfm">
</body>
</html>
