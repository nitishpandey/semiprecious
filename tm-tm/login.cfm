<cfparam name=session.apptt default="">
<cfif isuserloggedin()>
<!--- <cfdump var="#cflogin#"> --->
	<cfset session.apptt = getAuthUser() />
	<cfset session.mail = application.admin_email />
<cfloginuser
    name = "#getAuthUser()#"
    password = "password"
    roles = "admin" />

	<cflocation   url = "http://www.semiprecious.com/tm-tm/mainmenu.cfm?wada"   addToken = "no" />
<cfelse>
	<cflogout />
</cfif>
<html><!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Task Manager</title>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> 

<!-- InstanceEndEditable --> 
<style type="text/css">
<!--
.tmbody {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-color: #Dddddd;
	border: medium solid #000066;
}

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
<!--  --> 
       <form action="mainmenu.cfm"  method="post">
	      <table width="55%" border="1" align="center" cellpadding="2" class="tmbody">
            <tr> 
              <td rowspan="4" bgcolor="#CCCCCC" class="boldtext1">Welcome
                <hr>
                <br>
                <br>
                <a href="../teaching/">Contact Manager</a></td>
              <td>Id:</td>
            <td><input name="j_username" type="text" id="appt" size="20" maxlength="14"></td>
          </tr>
          <tr> 
            <td>Password:</td>
            <td><input name="j_password" type="password" id="password" size="20" maxlength="14"></td>
          </tr>
          <tr> 
              <td colspan="2">Forgotten Password ? contact Nitish. </td>
          </tr>
          <tr> 
            <td><input name="Reset" type="reset" id="Reset" value="Reset"></td>
            <td align="center">
<input type="submit" name="Submit2" value="Login">
            </td>
          </tr>
        </table></form>
		<cflogout />
        <!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>