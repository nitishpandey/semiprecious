<html><!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Commandant's Task Managert</title>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> 
<cfinclude template="sessioncheck.cfm">
<link href="tm.css" rel="stylesheet" type="text/css">
<!-- InstanceEndEditable --> 
<style type="text/css">
<!--
.tmbody {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-color: #Dddddd;
	border: medium solid #000066;
}
-->
</style>
<style type="text/css">
<!--
.table1 {
	font-family: "Times New Roman", Times, serif;
	border: thin solid #0000CC;
	background-color: #FFFFFF;
}
-->
</style>
<link href="stylebhai/tm.css" rel="stylesheet" type="text/css">
</head>

<body class="tmbody">
<cfinclude template="tmheader.cfm">
<div align="center"><table class="table1" width="100%"><tr>
      <td height="397" class="table1"> <!-- InstanceBeginEditable name="EditRegionbody" -->
        <div align="center">
          <table width="77%" border="1" align="center" cellpadding="2">
            <tr align="left" bgcolor="#CCCCCC"> 
              <td colspan="2" class="boldtext1">Main Menu</td>
          </tr>
      <cfif  session.apptt is 'comdt'>
	      <tr> 
                <td width="4%">&nbsp;</td>
            <td width="96%"><a href="newtask.cfm">Initiate new Task</a></td>
          </tr>
          <tr> 
                <td >&nbsp;</td>
            <td><a href="opentasks.cfm?order=0">View Open Tasks (ordered by Appt)</a></td>
          </tr> </cfif>
          <tr>
              <td >&nbsp;</td>
            <td><a href="opentasks.cfm?order=1">View Open Tasks (ordered by PDC)</a></td>
          </tr>
          <tr> 
              <td >&nbsp;</td>
            <td><a href="pasttasks.cfm">View Past Tasks</a></td>
          </tr>
          <tr> 
              <td >&nbsp;</td>
            <td><a href="changepassword.cfm">Change Password for <cfoutput>#session.apptt#</cfoutput></a></td>
          </tr>
          <tr> 
              <td >&nbsp;</td>
            <td><a href="login.cfm">Logout</a></td>
          </tr>

          <tr> 
              <td >&nbsp;</td>
            <td><a href="javascript:window.close();">Close Browser and Exit (Logout)</a></td>
          </tr>
            <tr bgcolor="#CCCCCC" > 
              <td colspan="2">&nbsp;</td>
          </tr>
        </table></div>
        <!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
