<html>
<head>
<title>Update Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfform action="cartstatuscorrect.cfm" method="post">
Email: <input type="text" name="email" ><br>

Cartid *: <cfinput type="text" name="cartid" required="yes"  validate="integer" ><br>

Paymode : <input type="text" name="paymode" value="" ><br>

Value : <input  type="text" name="value" ><br>

<input type="submit" value="Update Cart">
</cfform><a href="/" >Site</a>
  click on any heading to sort on that field. <a href="Admin.cfm">admin page</a> 
<cfif isdefined("form.cartid")>
<cfif isdefined("form.paymode")>
<cfquery datasource="gemssql" >
update cartstatus set paymode = '#form.paymode#' where cartid =#form.cartid#
</cfquery> 
</cfif>
<cfif isdefined("form.email")>
<cfquery datasource="gemssql" >
update cartstatus set buyer = '#form.email#' where cartid = #form.cartid#
</cfquery>
 <cfquery datasource="gemssql" >
update buyingrecord set email = '#form.email#' where cartid = #form.cartid#
</cfquery> 
</cfif>
<cfif isdefined("form.value") and form.value neq "">
<cfquery datasource="gemssql">
update cartstatus set cost = #form.value# where cartid = #form.cartid#
</cfquery>
</cfif>
</cfif>
<cfif isdefined("cartid")>
<cfinvoke component="inventory" method="updatepercart" returnvariable="flag" >
<cfinvokeargument name="cartid" value="#form.cartid#">
</cfinvoke> 
Updated inventory and date last sold with <cfoutput>#cartid#</cfoutput>
</cfif>
</body>
</html>
