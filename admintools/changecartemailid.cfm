<html>
<head>
</head>
<body><cftry>
<cfinvoke component="invitationandcredit"  method="buyer_type" returnvariable="flag" >
	<cfinvokeargument  name="buyer_email" value="scorpionitish@yahoo.com" />
</cfinvoke>
<cfoutput>#flag#</cfoutput>
<cfcatch  type="any">
<cfdump var="#cfcatch.TagContext#" />
<cfdump var="#cfcatch#" />

	</cfcatch>
	</cftry>

<cfset categories = Application.cat_list />
<cfquery datasource="gemssql" name="d" maxrows="12">
update cartstatus set inrcost = 675.12  where cartid = 85738 
</cfquery>
<cfif isdefined("form.email") and isdefined("form.cartid")>
<cftransaction action="begin" >
	
<cfquery datasource="gemssql" >
    update cartstatus set buyer = '#form.email#' where cartid = #form.cartid#
	 </cfquery>
	
<cfquery datasource="gemssql" >
    update purchase set email = '#form.cartid#/#form.email#' where cartid = #form.cartid#
	 </cfquery>
	 
<cfquery datasource="gemssql" >
    update buyingrecord set email = '#form.email#' where cartid = #form.cartid#
	 </cfquery>
	 
</cftransaction>
</cfif>
Update Email id for a cart in cartstatus, buyingrecord and purchase table. <br />
<strong>Does not add to totpurchase or invoke invitation credit, credit points etc.
</strong><cfform action="" method="post">
Email :<cfinput required="true" type="text" name="email" />
Cartid : <cfinput required="true" type="text"  name="cartid">
<input type="submit">
</cfform>

</body>
</html>