<html>
<head>
<title>Style Deleter</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfquery datasource="gemssql" name="q">
select * from matches where matchid = #url.matchid#
</cfquery>
<cfquery datasource="gemssql" >
delete from matches where matchid = #url.matchid#
</cfquery>
<cfloop query="q">
<cfquery datasource="gemssql">
update items set style = style -1 where newitem = #newitem#
</cfquery>
</cfloop>
<cfoutput>Deleted style #url.matchid# (#q.recordcount# items inhabited this style). </cfoutput> Click <a href="matchviewer.cfm?Startrow=#form.startrow#&maxrow=#form.maxrow#" target="_self">here 
</a>to go back to matching selection. 
</body>
</html>
