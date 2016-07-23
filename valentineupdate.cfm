<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery  datasource="semiprecious" name="q">
select description , newitem from items  where description like '%tmas%'</cfquery>
<cfloop query="q">
<cfset newdesc = replacenocase(description,'christmas','valentine','All')>
<cfquery datasource="semiprecious">
update items set description = '#newdesc#' where newitem = #newitem#
</cfquery>

</cfloop>

</body>
</html>
