<html>
<head>
<title>Property Initiator</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfform action="propertyinitiator.cfm" method="get">Property name:<cfinput name="pname" type="text" maxlength="12" required="yes"><br>
Starting Property Value :<cfinput name="pvalue" type="text" maxlength="12"  required="yes">
<input type="submit">
</cfform>
<cfif isdefined("form.pname")>
<cfquery name="d" datasource="gemssql">
select * from  properties where pname  = '#form.pname#'
</cfquery>
<cfif d.recordcount>
	<cfoutput>#d.pname# was #d.pvalue#</cfoutput><br />
<cfquery name="d" datasource="gemssql">
	
delete from  properties where pname  = '#form.pname#'
</cfquery>
	
	</cfif>
<cfquery datasource="gemssql">
insert into properties (pname,pvalue) values ( '#form.pname#','#form.pvalue#')
</cfquery>
Added (<cfoutput>insert into properties (pname,pvalue) values ( '#form.pname#','#form.pvalue#')
)</cfoutput>
</cfif>
<a href="admin.cfm">Back</a>
</body>
</html>
