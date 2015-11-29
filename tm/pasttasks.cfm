<cfquery name="users" datasource="sptm" username="nitish" password="rangeela" >
SELECT users.Apptt FROM users 
</cfquery>
<html><!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Task Manager</title>
<cfinclude  template="sessioncheck.cfm"> 
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
        <cfform action="opentasks.cfm" method="post" enctype="application/x-www-form-urlencoded" name="form1">
          <table width="82%" border="1" align="center" cellpadding="1" cellspacing="0" class="tmbody">
            <tr bgcolor="#CCCCCC" > 
              <td width="34%" class="boldhighlight">Fill in the Criterion:</td>
              <td width="31%">&nbsp;</td>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr> 
              <td>Action/Info :</td>
              <td><select name="action" size="3" multiple id="action" >
                  <cfoutput query="users"> 
                    <option value="#users.Apptt#">#users.Apptt#</option>
                  </cfoutput> </select></td>
              <td width="9%">Status</td>
              <td width="26%"><select name="status" size="2" id="status">
                  <option value="active">active</option>
                  <option value="close">close</option>
                  <option value="abort">abort</option>
                  <option value="1">All</option>
                </select></td>
            </tr>
            <tr> 
              <td>PDC START</td>
              <td><cfinput name="pdcsdate" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="pdcsmonth" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="pdcsyear" type="text" value="2001" size="4" maxlength="4" required="yes"> 
              </td>
              <td>PDC END</td>
              <td><cfinput name="pdcedate" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="pdcemonth" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="pdceyear" type="text" value="2020" size="4" required="yes"> 
              </td>
            </tr>
            <tr> 
              <td>Initiate Start</td>
              <td><cfinput name="isdate" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="ismonth" type="text"value="12" size="4" required="yes">
                - 
                <cfinput name="isyear" type="text" value="2001"  size="4" required="yes"> 
              </td>
              <td>Initiate End:</td>
              <td><cfinput name="iedate" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="iemonth" type="text" value="12" size="4" required="yes">
                - 
                <cfinput name="ieyear" type="text" value="2022" size="4" required="yes"> 
              </td>
            </tr>
            <tr  class="tmbody"> 
              <td>&nbsp;</td>
              <td> 
                <input type="reset" name="Reset" value="Reset"></td>
              <td>&nbsp;</td>
              <td> 
                <input name="LIst" type="submit" id="LIst" value="List"></td>
            </tr>
          </table>
      
        </cfform>
        <!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
