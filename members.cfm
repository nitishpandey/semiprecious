 <CFPARAM NAME="email" DEFAULT="">
 <CFPARAM NAME="newcredit" DEFAULT= "">

<CFIF #email# is not "">
<CFQUERY DATASOURCE="semiprecious" NAME="credit">
UPDATE memberinfo SET memberinfo.earned = #newcredit#
WHERE ((memberinfo.email)='#email#')
</CFQUERY>
</CFIF>


<CFQUERY DATASOURCE="semiprecious" NAME="members">
SELECT * from memberinfo order by dateupdate desc</CFQUERY>
<html>
<head></head>
<body>
<table>
<cfoutput query="members">

<tr><td>#firstname#, #lastname#</td><td>#email#</td><td>#dateupdate#</td><td>#dollarformat(earned)#</td><td> &nbsp;<form action="members.cfm" method="post">$<INPUT type="text" Name="newcredit" value="#newearned#" >
<input type="hidden" name="email" value="#email#">
<INPUT type="button" value="update" onClick="javascript:submit()"></form></tr>
</cfoutput>


</body>
</html>