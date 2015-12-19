<cfparam name="itemslist" default="0">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<!--- <cfset catarray = listtoarray(#form.catlist#)>
 ---><cfset n = 1>
<cfloop list="#form.itemslist#" index="idx" >
<cfif n>
<cfset i = idx>
<cfset n = 0>
<cfelse>
<cftry>
<cfset n = 1>

<cfquery datasource="gemssql">
insert into matches (newitem,matchid,cat) values (#i#,#form.matchid#,'#idx#')
</cfquery>
<cfquery datasource="gemssql" >
update items set style = style + 1 where newitem = #i#
</cfquery>
<cfcatch type="database">
<!--- do nothing --->

</cfcatch></cftry></cfif>
</cfloop>
<cfoutput>Added. Click <a href="matcheditor.cfm?Startrow=#form.startrow#&maxrow=#form.maxrow#" target="_self">here</a> to go back to match adder.
Even better click <a href="javascript:location.history.go(-1);">here</a>. </cfoutput>
</body>
</html>
