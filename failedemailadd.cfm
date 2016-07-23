<html>
<head>
<title>Follow Up Subscribers</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body onLoad="javascript:window.document.forms['s'].email.focus();">
<cfinclude template="headerforlist.cfm"><br>

<div align="center">
<cfform action="failedemailadd.cfm" method="post" name="s">
Email : <cfinput name="email" required="yes" type="text" size="35">
<input type="reset"> &nbsp;&nbsp;
<input type="submit">
</cfform>
<cfif isdefined("form.email")>
<cfquery datasource="semiprecious" name="valid">
select * from memberinfo where email = '#form.email#'
</cfquery>
<a href="failednls.cfm">List failed emails</a>
<cfif valid.recordcount >

<cfquery datasource="semiprecious" >
insert into failednls (email) values ('#trim(form.email)#')
</cfquery>
<cfoutput>#form.email# added.</cfoutput>

<cfelse>
<script language="JavaScript">
alert("no such member. check the email entered");
</script>
</cfif>
</cfif></div>
<!--- 
failednls table will have values email,call up on and postcard posted 
if nothing happens just delete it. so no other status is to be 
callup later? 
--->
<cfinclude template="footer.htm">
</body>
</html>
