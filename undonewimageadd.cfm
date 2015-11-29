<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body><cfparam name="root" default="d:\inetpub\semiprecious">

<cfset filename ="#root#\images\#url.category#\#url.itemid#.jpg" >
  <cffile action="move" nameconflict="overwrite" source="#filename#" file="#url.itemid#.jpg" destination="#root#/#url.folder#/#url.itemid#.jpg" >
 
<cfquery datasource="semiprecious">
delete from items where newitem = #url.itemid# and cat = '#url.category#'
</cfquery>


<cfquery datasource="semiprecious">
delete from styles where itemid = #url.itemid#
</cfquery>
<a href="admin.cfm">Admin</a>, <a href="np/match/matchmaker.cfm">Create Cluster</a>, <a href="/">Site Home page</a>
,<a href="addnewimage.cfm?folder=<cfoutput>#url.folder#</cfoutput>">Add New Image</a>
</body>
</html>
