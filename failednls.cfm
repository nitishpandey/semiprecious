<html>
<head>
<title>Process Failed Newsletters</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
</script>
</head>
<script language="JavaScript">
function confirmdelete(a)
{
var j = 'Are you sure you want to detail wish list etc. for ' +  a;
//confirm(j);
var k = 'downgradenlstatus.cfm?email=' + a ;
window.document.location = k ;
return ;
}
</script>
<body>
<cfif isdefined("form.callon")>
<cfquery datasource="semiprecious">
update failednls set callupon = '#form.callon#' where email = '#form.email#'
</cfquery>
</cfif>
<cfif isdefined("form.postcardon")>
<cfquery datasource="semiprecious">
update failednls set postcardsenton = '#form.pastcardon#' where email = '#form.email#'
</cfquery>

</cfif>
<cfquery datasource="semiprecious" name="jack">
select email from failednls  order by postcardsenton desc, callupon asc
</cfquery>

<cfoutput>#jack.recordcount#.</cfoutput><br>

<table ><tr><td><cfloop query="jack">
<cfquery datasource="semiprecious" name="jack2">
select * from  memberinfo where  memberinfo.email = '#email#' 
</cfquery>
<cfoutput query="jack2">
        <table width="661" height="91">
          <tr align="center" bgcolor="##CCCCCC"> 
            <td width="61">#email#</td>
            <td width="282">#firstname#</td>
              <td width="203">/#address1# &nbsp;#address2#/#city#</td>
          </tr>
          <tr bgcolor="##CC9966"> 
              <td><a href="changeemailid.cfm?email=#email#&password=#lastname#">Edit 
                Email</a> <br>
                Phone:#phonenumber# (#dateupdate#)</td>
            <td ><a href="##"  onClick="javascript:confirmdelete('#email#'); return false;">Delete</a>&nbsp;USE ACCESS DATE FORMAT<br>
<form action="failednls.cfm" method="post">Posted Letter on :<input type="text" name="postcardon" value=""><input type="hidden" name="email" value="#email#"><input type="submit" value="U/D"></form>
<form action="failednls.cfm" method="post">Call later on :<input type="text" name="callon" value=""><input type="hidden" name="email" value="#email#"><input type="submit" value="U/D"></form> </td>
            <td>State:#state#.Zip:#zip#, Country:#country#</td>
          </tr>
</table>
</cfoutput>
</cfloop>
</td></tr></table>

</body>
</html>
