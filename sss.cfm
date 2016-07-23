<html>
<head>
<title>Change Email Id by Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam default="jadoo" name="form.oldemail"> <!--- there is no such account --->
<cfparam default="j" name="form.newemail">
<cfquery datasource="semiprecious" >
update memberinfo set email = '#form.newemail#' where email='#form.oldemail#'
</cfquery>
<cfform action="sss.cfm" method="post">
  oldemail:
<cfinput name="oldemail" required="yes" type="text">
  new email: 
  <cfinput name="newemail" required="yes" type="text">
<input type="submit">
</cfform>
<a href="showuserdetails.cfm">showuserdetails.cfm</a>
<a href="admin.cfm">Admin Page</a>
<cfinclude template="footer.htm">

</body>
</html>
