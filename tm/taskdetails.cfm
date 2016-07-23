<html><!-- InstanceBegin template="/Templates/tm1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" --> 
<title>Task Details</title>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- InstanceBeginEditable name="head" --> 
<cfinclude template="sessioncheck.cfm">
<link href="stylebhai/tmcommon.css" rel="stylesheet" type="text/css">
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
        <cfif isdefined("form.respond")>
          <!--- append response to the taskresponse table --->
          <cfif isdefined("form.response")>
            <cfinvoke component="tm.cfc.task" method="addresponse">
              <cfinvokeargument name="tdtoi" value="#urldecode(url.doi)#">
              <cfinvokeargument name="tby" value="#url.by#">
              <cfinvokeargument name="response" value="#form.response#">
            </cfinvoke>
            </cfif>
            <cfelseif isdefined("form.statusselect")>
            <cfif len(form.statusselect) GT 2>
              <cfinvoke component="tm.cfc.task" method="update">
                <cfinvokeargument name="status" value="#form.statusselect#">
                <cfinvokeargument name="tby" value="#url.by#"/>
                <cfinvokeargument name="tdtoi" value="#urldecode(url.doi)#"/>
              </cfinvoke>
           
          </cfif>
		  <cfelseif isdefined("form.pdc")>
		  <cfinvoke method="alterpdc" component="tm.cfc.task">
		  <cfinvokeargument name="tdtoi" value="#urldecode(url.doi)#">
		  <cfinvokeargument name="_pdc" value="#createdate(form.year,form.month,form.date)#" >
		  </cfinvoke>
        </cfif>
		
        <cfif isdefined("url.by") and isdefined("url.doi")>
          <cfset bc="black">
          <cfinvoke  component="tm.cfc.task" method="getdata" returnvariable="viewdetailsRet">
            <cfinvokeargument name="by" value="#url.by#"/>
            <cfinvokeargument name="doi" value="#url.doi#"/>
          </cfinvoke>
        
		  <cfif viewdetailsRet.status is 'active' or viewdetailsRet.status is "ack">
            <cfset open = 1>
			<cfset by = viewdetailsREt.tby>
            <cfelse>
            <cfset open = 0>
          </cfif>
        
		  <table width="100%" height="48" border="1" cellpadding="1" cellspacing="0">
            <tr> 
              <td height="23" bgcolor="#CCCCCC">DOI</td>
              <td bgcolor="#CCCCCC">SUBJECT</td>
              <td bgcolor="#CCCCCC">ACTION</td>
              <td bgcolor="#CCCCCC"> PDC</td>
              <td bgcolor="#CCCCCC">INFO</td>
              <td bgcolor="#CCCCCC">STATUS</td>
            </tr>
            <cfoutput query="viewdetailsRet"> 
              <tr bordercolor="#bc#"> 
                <td height="23"> 
                  #tdtoi#&nbsp;</td>
                <td>#subject#&nbsp;<cfif isNumeric(trim(viewdetailsRet.subject))>
					<a href="/itemsell.cfm?cartid=#viewdetailsRet.subject#" class="login_link">View Cart</a>
					</cfif></td>
                <td>#Action#&nbsp;</td>
                <td><a href="pdchistory.cfm?by=#url.by#&doi=#urlencodedformat(tdtoi)#">#dateformat(PDC,'dd/mm/yyyy')#</a>&nbsp;</td>
                <td>#info#&nbsp;</td>
                <td>#status#</td>
              </tr>
            </cfoutput> 
          </table>
          <cfinvoke  component="tm.cfc.task" method="getdetails" returnvariable="viewdetailsRet">
            <cfinvokeargument name="by" value="#url.by#"/>
            <cfinvokeargument name="doi" value="#url.doi#"/>
          </cfinvoke>
          <cfoutput> 
            <table >
              <tr> 
                <td class="boldhighlight">Details:</td>
                <td class="bluedetails">#viewdetailsRet.detail#</td>
              </tr>
            </table>
          </cfoutput> 
          <cfinvoke  component="tm.cfc.task" method="getresponses" returnvariable="viewdetailsRet">
            <cfinvokeargument name="by" value="#url.by#"/>
            <cfinvokeargument name="doi" value="#url.doi#"/>
          </cfinvoke>
          <cfif viewdetailsRet.recordcount>
		  <div style="width:90%;height:160px;y-overflow:scroll;" >
            <table width="100%" border="1" cellspacing="1" >
              <tr > 
               <td class="tableheadingsub">Comments Trail</td></tr>
              <cfoutput query="viewdetailsRet"> 
                <tr> 
                <td align="justify">
                  On #added# <span style="color:blue">#addedby#</span> said #detail# </td>
                </tr>
              </cfoutput> 
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table></div>
            <hr>
          </cfif>
          <cfif open >
            <cfoutput> 
              <table width="100%" border="1" cellspacing="0" cellpadding="1">
                <tr> 
                  <td> <form action="taskdetails.cfm?#CGI.QUERY_STRING#" method="post" enctype="multipart/form-data" name="responseform">
                      Add Response: 
                      <textarea name="response" id="response"></textarea>
                      <input name="Respond" type="submit" value="Submit Response">
                    </form>
					
					</td>
                  <td> 
                    <cfif session.apptt is by>
                      <form action="taskdetails.cfm?#CGI.QUERY_STRING#" method="post" enctype="application/x-www-form-urlencoded" name="statusform">
                        Modify Status : 
                        <select name="statusselect">
                          <option value="0" ></option>
						  <option value="ack">Ack</option>
                          <option value="close">close</option>
                          <option value="abort">abort</option>
                        </select>
                        <input name="status" type="submit" value="Modify status">
                      </form>
                      <cfform name="form1" method="post" action="taskdetails.cfm?#Cgi.QUERY_STRING#">
                        <br>
                        Modify EDC: 
                        <cfinput name="date" required="yes" type="text" id="date" size="2" maxlength="2">
                        - 
                        <cfinput required="yes" name="month" type="text" id="date2" size="2" maxlength="2">
                        - 
                        <cfinput name="year" type="text" required="yes" id="date3" size="4" maxlength="4">
                        <input name="PDC" type="submit" id="PDC" value="Modify EDC">
                      </cfform>
                    </cfif>
                  </td>
                </tr>
              </table>
            </cfoutput> 
          </cfif>
        </cfif>
        <a href="javascript:history.go(-1);">Back</a> <cfoutput><a href="opentasks.cfm?#session.tm.task_list_filter#">Back to Tasks/Issues</a></cfoutput>
		
		<!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
