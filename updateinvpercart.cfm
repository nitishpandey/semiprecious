<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<body>
<cfif isdefined("url.cartid")>
<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#cartid#">
</cfinvoke> Updated inventory and date last sold with <cfoutput>#cartid#</cfoutput>!
</cfif>
<form method="get" action="updateinvpercart.cfm" ><input type="text" name="cartid" /> is the Cartid <input type="submit" value="Update Items" /></form>

</body>
</html>
