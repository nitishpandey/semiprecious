<html><!-- InstanceBegin template="file:///C|/My Documents/cobwebs/bocsapp/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<cfinclude template="sessioncheck.cfm">
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Change Password</title>
<script language="JavaScript1.1">
function validateForm()
 {
 if ((document.forms[0].password1.value.length < 6) || ( document.forms[0].password1.value != document.forms[0].password2.value))
 
 {
 alert("Your New Password are not proper!");
 return false;
 }
 return true;
 }</script>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable --> 
<style type="text/css">
<!--
.tmbody {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-color: #DEDEDE;
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
<style type="text/css">
<!--
.boldtext1 {
	font-family: "Courier New", Courier, mono;
	color: #000000;
	font-weight: bold;
	text-transform: capitalize;
}
a {
	color: #000066;
}
-->
</style>
</head>

<body class="tmbody">
<cfinclude template="tmheader.cfm">
<div align="center"><table class="table1" width="100%"><tr>
      <td height="397" align="center" nowrap> <!-- InstanceBeginEditable name="EditRegionbody" -->
	  <cfif isdefined("form.password")>
	  <cfinvoke component="cfc.registrar" method="changepassword" returnvariable="answer">
	  <cfinvokeargument name="oldpassword" value="#form.password#">
	  <cfinvokeargument name="newpassword" value="#form.password1#">
	  <cfinvokeargument name="apptt" value="#session.apptt#">
	   </cfinvoke>
	   <cfif answer>
	   Your password has been changed successfully.
	   <cfelse><br>
Change not succeeded. Check that your old password is correctly entered.
	   </cfif>
	  </cfif>
	  <cfform action="changepassword.cfm" method="post" onSubmit="javascript:return validateForm();">
        <table width="51%" border="1" cellpadding="2">
          <tr class="tmbody"> 
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td rowspan="3" class="boldtext1">&nbsp;</td>
            <td>Old Password</td>
            <td>:
              <cfinput required="yes"  type="password" name="password"></td>
            <td><input type="reset" name="Submit2" value="Reset"></td>
          </tr>
          <tr> 
            <td>New Password</td>
            <td>:
              <cfinput required="yes"  type="password" name="password1"></td>
            <td><a href="mainmenu.cfm">Main Menu</a></td>
          </tr>
          <tr> 
            <td>Confirm</td>
            <td>:
              <cfinput required="yes"  type="password" name="password2"></td>
            <td><input type="submit" name="Submit" value="Submit"></td>
          </tr>
            <tr > 
              <td colspan="4" class="tmbody">&nbsp;</td>
          </tr>
        </table></cfform>
        <!-- InstanceEndEditable --> </td>
    </tr></table></div>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
