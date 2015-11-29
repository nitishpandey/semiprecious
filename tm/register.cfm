<html><!-- InstanceBegin template="/Templates/tmsessionfree.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

<!-- InstanceBeginEditable name="doctitle" --> 
<title>Register</title>
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
	  <script >
	  function validateForm()
	   {
	   if ( (window.document.forms[0].password1.value != window.document.forms[0].password2.value )|| 
	       window.document.forms[0].password1.value.length < 1 )
		   {
		   alert("Error in your password entry.");
		   return false;
		   }
		   return true;
	   }</script>		<cfif isdefined("form.submit")>
	
			<cfinvoke component="tm.cfc.registrar" method="register" 
			   apptt="#trim(form.apptt)#" password="#form.password1#"    >
				<cfinvokeargument name="password" value="#form.password1#">
				</cfinvoke>
		       <br>
<!---  User <cfoutput>#form.apptt# registered with the password #form.password1#</cfoutput>.
	 --->		  	  <br>
          In case of an error Pse get in touch with the task manager Maintainer. 
          <cfelse>
		   <cfform action="register.cfm" method="post" onSubmit="javascript:return validateForm();" enctype="application/x-www-form-urlencoded" name="registration" target="_parent">
            <table width="550" border="1" cellpadding="2" class="tmbody">
              <tr> 
                <td rowspan="4" bgcolor="#999999" class="boldtext1">Register</td>
                <td height="36">User Name:</td>
                <td colspan="2"><cfinput name="apptt" type="text" id="apptt" required="yes"></td>
              </tr>
              <tr> 
                <td height="26">Password:</td>
                <td colspan="2"><cfinput name="password1" type="password" id="password" required="yes"></td>
              </tr>
			  <tr><td>Email:</td><td colspan="2"><cfinput name="email" type="text" required="yes"  message="Please provide the email id" maxlength="50"  /></td></tr>
              <tr> 
                <td>Confirm password:</td>
                <td colspan="2"><cfinput required="yes" name="password2" type="password" id="password3"></td>
              </tr>
              <tr> 
                <td height="29"> <input name="Reset" type="reset" id="Reset" value="Reset"></td>
                <td align="center"> <input type="submit" name="Submit" value="Register" > 
                </td>
                <td align="center"><a href="login.cfm">Login</a></td>
              </tr>
            </table>
          </cfform></cfif><!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
