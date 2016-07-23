<!--- <cfquery datasource="semiprecious">
Update memberinfo set nlstatus = 2 where email = 'semiprecious@indiatimes.com'
</cfquery> --->semiprecious@indiatimes.com<a href="#bottom">Bottom</a> &nbsp;<a href="cartstatus21.cfm">Carts</a>
<cfquery datasource="semiprecious" name="q">
select max(nlstatus) as nl from memberinfo where nlstatus < 99
</cfquery>
<cfset application.nlerrorcount = 5 >
<cfquery name="r" datasource="semiprecious">
select count(nlstatus) as cnt, nlstatus  from memberinfo group by nlstatus
</cfquery>
<cfquery name ="r2" datasource="semiprecious">
select top 800  firstname, nlstatus,email,dateupdate,lastvisit,noofvisits,totpurchase from memberinfo order by nlstatus asc,lastvisit desc 
</cfquery>
<html>
<head>
<title>Member NewsLetter Status</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<a href="admin.cfm">Admin</a>&nbsp;<a href="cart.cfm">Cart</a>
<cfoutput query="r">
<cfif nlstatus>
The no of errors sent is 5 - #Application.nlerrorcount#.
The nl mailer is currently ON.
<cfelse>
The nl mailer is currently stopped
</cfif>
#nlstatus# for #cnt# subscribers <br />#now()#,  <a href="wholesale_list.cfm">Retail</a>
</cfoutput>
nlstatus is the newsletter number already sent.

<table border="1">
  <tr> 
    <td>update</td>
    <td>nl
    <td>name (details)</td>
    <td>email (delete?)</td>
    <td>Visits</td>
    <td>Buy</td>
    <td>Last Visit</td>
  </tr>
  <cfoutput >Total of #r2.recordcount# subscribers. (#q.nl#)</cfoutput> <cfoutput query="r2"> 
    <tr> 
      <td>#dateupdate#</td>
      <td>#nlstatus#</td>
      <td><a href="showuserdetails.cfm?email=#email#"  >#firstname#</a> </td>
      <td><a href="downgradenlstatus.cfm?email=#email#">#email#</a></td>
      <td>#noofvisits#&nbsp;</td>
      <td>#totpurchase#&nbsp;</td>
      <td>&nbsp;#lastvisit#</td>
    </tr>
  </cfoutput> 
</table>
<a name="bottom">/</a>
</body>
</html>
