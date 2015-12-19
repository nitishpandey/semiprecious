<cfparam name="count" default="1" type="numeric">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<cfparam default="1" name="url.matchid" type="numeric">
<cfquery datasource="gemssql" name="styles">
select distinct(matchid) as id from matches
</cfquery>
<body>
<cfoutput>Now showing #url.matchid#.</cfoutput>
<form action="matchviewer.cfm" method="get" target="_self">
  Show Match no.: 
  <input type="text" name="matchid"><input type="submit"></form>

<cfquery datasource="gemssql" name="items">

select newitem , cat from matches where matchid = #url.matchid#

</cfquery>
<cfoutput>
  <p><a href="matchdeletor.cfm?matchid=#url.matchid#" target="_self">Delete</a> 
    this Style Completely. <a href="matchviewer.cfm?matchid=#url.matchid#">Refresh</a>
    <cfset url.matchid = url.matchid + 1>
    Show <a href="matchviewer.cfm?matchid=#url.matchid#" target="_self">next</a> 
    style. or 
    <cfset url.matchid = url.matchid - 2>
    <a href="matchviewer.cfm?matchid=#url.matchid#">Prev</a> Other styels are 
	<cfloop query="styles">,<a href="matchviewer.cfm?matchid=#id#" target="_self">#id#</a></cfloop>
</cfoutput> 
<form action="matchdeletor.cfm" target="_self" method="post">
<Table align="center" border="1">
<cfoutput>
<Cfloop  query="items" >
<cfif count eq 1><tr></cfif>
<td>(#newitem#)<img width="60" src="/images/<cfif cat eq "sets">Necklaces<cfelse>#cat#</cfif>/thumb/#newitem#.jpg" hspace="0" vspace="0" border="0">
<!--- <input type="checkbox" name="itemlist" value="#newitem#,#cat#">
 --->
</td>
<cfset count = count + 1>
<cfif count eq 3>
<cfset count = 1>
</tr>
</cfif>
</Cfloop></cfoutput>
<cfif count neq 1>
<cfloop from="#count#" to="2" index="idx">
<td>&nbsp;</td>
</cfloop>
</tr>
</cfif>
</Table>
</form>
</html>
