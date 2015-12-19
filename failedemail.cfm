<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<form action="failedemails.cfm" method="post">

<table ><tr style="border-bottom:thing ridge brown;"><td>Email</td><td><input type="text" name="email"></td></tr>
<tr style="border-bottom:thing ridge brown;"><td>Show Details:</td><td><input type="checkbox" name="showdetails"></td></tr>

<tr><Td  colspan="2"><Input type="submit"></Td></tr>
</table>
</form>
<cfif isdefined("form.candidate")>
<cfquery datasource="semiprecious" name="v">
select * from failedns where email = '#form.candidate#'
</cfquery>
<cfoutput query="v">
Details: #email#, #zip#, #city#, #address#, #country#,#phone#, #dateregistered#, #lastlogin#
</cfoutput>
<form method="post" action="failedemails.cfm">
Update to :<select name="status"><option class=""</select></form>
</cfif>
<cfif isdefined("form.showdetails")>

<cfquery datasource="semiprecious" name="details">
select * from failednls</cfquery>
<form method="post" action="failedemails.cfm">
<input type="hidden" value="tobesetbyjavascript" name="candidate">
<Table>
<cfoutput query="details"><tr><td>#email#</td><td>#address#</td><td>#phone#</td><td>#firstname#</td><td>#country#</td><td>#zip#</td><td><input type="radio" name="candidate" value="candidate#email#"></td></tr></cfoutput></Table>
<input type="hidden" name="showdetails" value="1">
</form>
</cfif>
<cfif isdefined("form.email")>
<cfquery datasource="semiprecious"  name="q">
select lastlogin from memberinfor where email = '#form.email#'
</cfquery>
<cfif q.recordcount>
<cfquery datasource="semiprecious"  name="q">
insert into failednls values ('#form.email#',0)
</cfquery>
<!--- need to create a table failednls, then a page that looks up the emails from this table and then shows their
addresses and phone no., actually use the one that does it for one email --->
<cfelse>
NO SUCH EMAIL FOUND.
</cfif>
</cfif>
</body>
</html>
