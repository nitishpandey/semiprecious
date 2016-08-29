<html><!-- InstanceBegin template="file:///C|/My Documents/cobwebs/bocsapp/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>


<cfif not isuserloggedin()>
<cflocation url="login.cfm" />
</cfif>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Admin Panel</title>
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
<cfcookie domain=".semiprecious.com" name="country"  value="" expires="30" />


<body class="tmbody">
<cfinclude template="tmheader.cfm">
<div align="center"><table class="table1" width="100%"><tr>
      <td height="397" align="center" nowrap> <!-- InstanceBeginEditable name="EditRegionbody" -->
	  <cflocation url="login.cfm">
	  EdasditRegionbody<!-- InstanceEndEditable -->
      </td>
    </tr></table></div>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>