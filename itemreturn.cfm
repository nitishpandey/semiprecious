<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Jewelry Item Return Help</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<cfset lastdate = createodbcdate(dateadd('d',-60,now()))>
<cfinclude template="headerforlist.cfm">
<cfif len(session.mail)>
<cfquery datasource="semiprecious" name="carts">
select cartid from cartstatus where buyer = '#session.mail#' and datebought > #lastdate# 
</cfquery>
<div  align="center" >
<span style="background-color:#DADA99;">Please Select Cartid</span>
<cfif carts.recordcount>
<cfoutput query="carts">
<a href="itemreturnpage2.cfm" style="display:block;border-bottom:gray 1px ridge;text-decoration:none;">#cartid#</a></cfoutput></cfif>
</div>
<cfelse>
To return an item it is important that you specify the item number. We can help you find the item number by showing you the items purchased by
you in the last 60 days.  Please <a href="simpleloginform.cfm">login</a> using your email (used for signing up or while making payment). We will use the email to locate your carts.<br />
In case you are not sure of the email used during payment or you did not provide an email address while payment but remember the cart id then click <a href="itemreturncartid.cfm">here</a>.
</cfif>

<cfinclude template="adminfooter.htm">

<body>
</body>
</html>
