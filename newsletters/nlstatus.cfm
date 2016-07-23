<html>
<head>
<title>NLSTATUS OPERATION</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif isdefined("url.action")>
<cfswitch expression="#url.action#">
<cfcase value="incr">
<cfset oper = '+'>
<cfquery datasource="semiprecious" name="q">
update properties set pvalue = pvalue + 1 where pname = 'nltosend' 
</cfquery>
</cfcase>
<cfcase value="decr">
<cfset oper = '-'><cfquery datasource="semiprecious" name="q">
update properties set pvalue = pvalue - 1 where pname = 'nltosend' 
</cfquery>

</cfcase>
</cfswitch>


</cfif>
<cfquery datasource="semiprecious" name="r">
select pvalue  as nltosend from properties where pname = 'nltosend'
</cfquery>
The current newsletter  that is being sent is : 
<cfoutput>#r.nltosend# 
</cfoutput>
</body>
</html>
