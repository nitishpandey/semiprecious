<cfif isdefined("form.dg")>
<cfloop list="#form.us#" index="em">
<cfquery name="q1" datasource="semiprecious">
select max(nlstatus) as nlmax from memberinfo where nlstatus < 99
</cfquery>

<cfquery name="q2" datasource="semiprecious">
select nlstatus from memberinfo where email = '#em#'
</cfquery><cfif q1.nlmax eq q2.nlstatus>
<cfquery datasource="semiprecious" >
update memberinfo set nlstatus  = nlstatus -1 where email = '#em#'
</cfquery>
</cfif>
</cfloop>
</cfif>

<cfif isdefined("form.us")>
<cfloop list="#form.us#" index="em">
<cfquery datasource="semiprecious" >
delete from memberinfo where email = '#em#'
</cfquery>
<cfquery datasource="semiprecious" >
delete from wish where email = '#em#'
</cfquery>

</cfloop>
</cfif>
<cfquery datasource="semiprecious" name="q">
select max(nlstatus) as nl from memberinfo where nlstatus < 99
</cfquery>

<cfquery name="r" datasource="semiprecious">
select * from memberinfo 
</cfquery>
<cfquery name ="r2" datasource="semiprecious">
select firstname, nlstatus,email from memberinfo order by  email
</cfquery>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
Remember: the first letter was nl2.htm and the next has to be nl3.htm
<form method="post"><table border="1">
 <input type="submit"> <tr> 
    <td>nlstatus</td><td>Unsubscribe ?</td><td>Downgrade ? </td>
  </tr><cfoutput >#r2.recordcount#</cfoutput>
  <cfoutput query="r2"> 
    <tr> 
      <td>#r2.nlstatus# ,#firstname# and #email#</td><td><input type="checkbox" name="us" value="#email#"></td><td> <input type="checkbox" name="dg" value="#email#"></td>
    </tr>
  </cfoutput> 

</table>
<input type="submit">
</form>

</body>
</html>
