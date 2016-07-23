<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam default="" name="form.email">

<form action="" method="post" >
<input type="text" name="email" >
<input type="submit" value="Delete Bulk Buyer"></form>
<cfquery datasource="sptm" password="rangeela" username="nitish">
delete from bulkbuyers where email = '#trim(form.email)#'
</cfquery>
			<cfquery datasource="sptm" password="rangeela" username="nitish">
delete from bulkbuyercoupons where id ='#form.email#'
</cfquery>
</body>
</html>
