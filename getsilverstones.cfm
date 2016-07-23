<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfquery datasource="semiprecious" name="silverstone">
select distinct(subcat)  as sc from items where subcat like '%silver%'
</cfquery>
<cfset silverstones = "">
<cfloop query="silverstone">
<cfloop list="#sc#" index="j">
<cfif not findnocase(trim(j),silverstones)>
<cfset silverstones =  silverstones & "," & trim(lcase(j))>
</cfif>
</cfloop>
</cfloop>
<cfset silverstones = replacenocase(silverstones,"silver","","All")>
<cfset application.silverstones  = silverstones>
<cfoutput>#application.silverstones#</cfoutput>
</body>
</html>
