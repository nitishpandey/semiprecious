<html>
<head>
<title>Expire Carts Old</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

Default value of the expiry is 32 days. That will be in effect if this page is called from the browser address bar.
To vary this value use the form in the admin page.
<cfinvoke component="cartcontrol.cartmonitor" method="expire" >
<CFIF ISDEFINED("URL.AGE")>
<CFSET FORM.AGE = URL.AGE>
<CFINVOKEARGUMENT name="COMMIT" value="1">
<CFINVOKEARGUMENT name="AGE" value="#FORM.AGE#">
<CFELSEif ISDEFINED("FORM.AGE")>
<CFINVOKEARGUMENT name="AGE" value="#FORM.AGE#">
</CFIF>
<!--- default without any age => 32 days ---->
 </cfinvoke><br>


<a href="http://www.semiprecious.com/admin.cfm?passcode=shaurya">Back to admin page</a>


</body>
</html>
