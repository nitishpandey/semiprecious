<html><!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Task Manager</title>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> 
<cfinclude template="sessioncheck.cfm">
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
	border: thin solid #333366;
	background-color: #FFFFFF;
}
-->
</style>
<link href="../stylebhai/tm.css" rel="stylesheet" type="text/css">
</head>

<body class="tmbody">
<cfinclude template="tmheader.cfm">
<div align="center"><table class="table1" width="800"><tr>
      <td height="400" class="table1"> <!-- InstanceBeginEditable name="EditRegionbody" --> 
        <cfif isdefined("url.by") and isdefined("url.doi")>
          <cfinvoke  component="tm.cfc.pdc"  method="gethistory"
 returnvariable="viewdetailsRet">
            <cfinvokeargument name="tby" value="#url.by#"/>
            <cfinvokeargument name="tdtoi" value="#url.doi#"/>
          </cfinvoke>
          <cfif viewdetailsRet.recordcount>
            History Of PDC Modification.(US Format)
            <table class="tmbody" align="center">
              <tr> 
                <td >PDC</td>
                <td>ON</td>
              </tr>
              <cfoutput query="viewdetailsRet">
                <tr>
                  <Td>#dateformat(PDC,'mm-dd-yy')# </Td>
                  <td>#dateformat(added,'mm-dd-yy')#</td>
                </tr>
              </cfoutput> 
              <tr>
                <td></td>
              </tr>
            </table>
          </cfif>
        </cfif>
        <a href="javascript:history.go(-1)">Back</a> <!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
