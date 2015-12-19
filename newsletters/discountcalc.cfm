<html>
<head>
<title>WMD Discount Calculator</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<cfinclude template="../headerwithabsoluteurls.cfm" >

<cfif isdefined("form.cost")>
<cfset pp = form.cost>
<cfset disc  =  decimalformat(35 *( pp/350))>
<cfif disc LT 10>
<cfset disc = 10>
<cfelseif disc GT 35 >
<cfset disc = 35>
</cfif>
<cfset discvalue =  (pp*disc)/100>
<br>
<br>
On a purchase of <cfoutput>#dollarformat(pp)# you will get a discount of  #disc#% or #dollarformat(discvalue)#</cfoutput>. <br>
<strong>Please note: In actual purchases the discount 
  will not be applied on items on sale; which already have discount built into them.  </strong> <br>
<cfelse>


</cfif>
<br />
<cfform action="discountcalc.cfm" method="post">
Enter the Purchase value : <cfinput type="text" name="cost" validate="integer" required="yes">
<input type="submit" >
</cfform><hr>

<cfinclude template="../footer.htm">
</body>
</html>
