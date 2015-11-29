<cfparam name="url.cartid" default="" type="string"  />
<cfquery name="users" datasource="sptm" username="nitish" password="rangeela">
SELECT users.Apptt FROM users 
</cfquery>
<html><!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Task Manager</title>
<cfinclude  template="sessioncheck.cfm">
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable --> 
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
	  <cfif  isdefined("form.action")>
	      <cfif isdefined("form.info")>
            <cfset infos = listtoarray(form.info)>
		<cfelse>
		<cfset infos =listtoarray("")>
		</cfif>
		<cfif len(trim(form.cart_issue_flag)) ><!--- on server side on submission, can use cart_issue_flag also --->
		<cfset task_type= "cart_issue" />
		<cfelse>
<cfset task_type= "" />		
		</cfif>
		<cfinvoke component="tm.cfc.task" method="add" returnvariable="check">
			<cfinvokeargument name="by"  value="#session.apptt#">
			<cfinvokeargument name="action" value="#form.action#" >
			<cfinvokeargument name="task_type" value="#task_type#" >
			<cfinvokeargument name="info"  value="#infos#">
			<cfinvokeargument name="subject" value="#form.subject#">
			<cfinvokeargument name="apdc"  value="#createodbcdate(createdate(form.pdcyear,form.pdcmonth,form.pdcdate))#">
			<cfinvokeargument name="details"  value="#form.details#">
		</cfinvoke>
	<cfif check >
	Task Successfully initiated. <br />
	<cfif len(form.cart_issue_flag)>
	        <cflocation addtoken="true" url="/itemsell.cfm?cartid=#trim(form.subject)#&paymode=null" />
	
	</cfif>

	<cfelse><br>
            Problem in adding task. Pse inform TM maintainer (Nitish) <br>

</cfif>
          <a href="mainmenu.cfm">Return to Main Menu</a>&nbsp;&nbsp;or <a href="newtask.cfm">Initiate 
          Another Task</a> 
          <cfelse>
		<cfform name="form1" method="post" action="newtask.cfm" enctype="multipart/form-data">
            <table width="100%" border="1" cellpadding="2">
              <tr> 
                <td colspan="4" bgcolor="#CCCCCC" class="boldtext1">New Task/Cart Issue</td>
            </tr>
            <tr> 
                <td width="8%">Subject</td>
              <td width="55%"> 
			  <cfoutput>
          <input type="hidden" value="#url.cartid#" name="cart_issue_flag" />
        </cfoutput>
              <cfif len(url.cartid)>
			   <cfoutput> #url.cartid# Issue<a href="/itemsell.cfm?cartid=#trim(url.cartid)#&paymode=null">View Cart</a></cfoutput>
			  <cfinput type="hidden" value="#url.cartid#" name="subject" />
              <cfelse>
			    <cfinput type="text" name="subject" value="#url.cartid#" required="yes">(Use cartid if cart issue)
				</cfif></td>
                <td width="11%">EDC</td><cfset newdate = dateAdd("d",5,now()) />
              <td width="26%"><cfinput name="pdcdate" type="text" size="2" required="yes" value="#datepart('d',newdate)#">
                  -
                  <cfinput name="pdcmonth" type="text" size="2" required="yes" value="#datepart('m',newdate)#">
                  -
                  <cfinput name="pdcyear" type="text" size="4" required="yes" value="#datepart('yyyy',newdate)#">
                  <br>
                  (format:22-9-1935)</td>
            </tr>
            <tr> 
                <td rowspan="2">Task Details</td>
              <td rowspan="2"> 
                <textarea name="details" cols="60" rows="4"></textarea></td>
                <td>Action </td>
              <td> <select name="action">
                    <cfoutput query="users"> 
                      <option value="#users.Apptt#">#users.Apptt#</option>
                    </cfoutput> </select></td>
            </tr>
            <tr> 
                <td>Info(Use 'ctrl' key to select multiple) </td>
              <td> 
                  <select name="info" multiple style="height:100px;" >
                    <cfoutput query="users"> 
                      <option value="#users.Apptt#">#users.Apptt#</option>
                    </cfoutput> </select>
                  <br>
                  </td>
            </tr>
              <tr class="tmbody"> 
                <td height="49">&nbsp; </td>
                <td align="center" valign="middle"><!---<input type="reset" name="Submit2" value="Reset"> --->
                </td>
                <td>&nbsp;</td>
                <td align="center"><input type="submit" name="Submit" value="Initiate"></td>
            </tr>
          </table>
        </cfform></cfif><!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
