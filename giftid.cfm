<cfinclude template="header.cfm">]

<cfparam name="form.giftid" default="all"> 
<cfparam name="form.action" default="view">
<html>
<head>
<title>gift id</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body><a href="admin.cfm">admin</a>
<hr>
Write 'all' to view all
<form action="giftid.cfm" method="post">
giftid : <input type="text" name="giftid" >
Action : activate <input type="radio" name="action"  value="activate"><br>

delete<input type="radio" name="action" value="delete"><br>

view<input type="radio"  name="action" value="view">
<input type="submit">
</form>
<br>
<cfoutput>#form.action#</cfoutput>
<cfif isdefined("form.action")>

<cfswitch expression="#form.action#">
<cfcase value="view">
<cfquery datasource="semiprecious" name="q">
select * from gifts where id = '#form.giftid#'
</cfquery>
<cfif form.giftid eq 'all'>
<cfquery datasource="semiprecious" name="q">
select * from gifts 
</cfquery>
</cfif>

<cfoutput query="q">#q.id#, #q.status#, #q.by#, #q.validity#, #q.amt#<br>
</cfoutput>

</cfcase>
<cfcase value="activate"><cfquery datasource="semiprecious" name="q">
update gifts set status = 'ACT' where id = '#form.giftid#'
</cfquery>
updated
</cfcase>
<cfcase value="delete">
<cfquery datasource="semiprecious" name="q">
delete from gifts where id = '#form.giftid#'
</cfquery>
deleted
</cfcase></cfswitch>

</cfif>
</body>
</html>
