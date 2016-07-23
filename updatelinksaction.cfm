<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<cfquery name="set_mode" datasource="semiprecious">
Update acceptance set acceptance_reqd = #form.radio1#
</cfquery>
<cfif IsDefined("form.checkbox4") >
<cfquery name="delete" datasource="semiprecious">
Update othersites set accepted = -1 where othersites.url in ('#form.checkbox4#')
</cfquery>
</cfif>
<cfif IsDefined("form.checkbox2")>
<cfquery name="accept" datasource="semiprecious" >
Update othersites set accepted = 1 where othersites.url in ('#form.checkbox2#')
</cfquery>
</cfif>
<cfif IsDefined("form.checkbox1")>
<cfquery name="unaccept" datasource="semiprecious">
Update othersites set accepted = 0 where othersites.url in ('#form.checkbox1#')
</cfquery>
</cfif>
</body>
</html>
