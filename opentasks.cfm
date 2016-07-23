<cfparam default="" name="url.type" />
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
<link href="stylebhai/tm.css" rel="stylesheet" type="text/css">
</head>
<cfset session.tm.task_list_filter = CGI.QUERY_STRING />
<body class="tmbody">
<cfinclude template="tmheader.cfm">
<div align="center"><table class="table1" width="800"><tr>
      <td height="400" class="table1"> <!-- InstanceBeginEditable name="EditRegionbody" -->
        <!--- get the query representing open tasks and then display formatted output ---->
     <table width="100%" border="1" cellspacing="0" cellpadding="1">
         <cfoutput>
         	   <tr> 
	              
	            <td ><a href=http://www.semiprecious.com/tm-tm/opentasks.cfm?type=#url.type#&amp;&amp;order=0&amp;orderby=tdtoi>Initiated On</a></td>        
				<td bgcolor="##CCDCCC"><a href=http://www.semiprecious.com/tm-tm/opentasks.cfm?type=#url.type#&amp;order=0&amp;orderby=tdtoi>Initiated By</a></td>
	              <td ><a href=http://www.semiprecious.com/tm-tm/opentasks.cfm?type=#url.type#&amp;order=0&amp;orderby=subject>SUBJECT/Cartid</a></td>
	              <td bgcolor="##CCDCCC"><a href=http://www.semiprecious.com/tm-tm/opentasks.cfm?type=#url.type#&amp;order=0&amp;orderby=action>ACTION</a></td>
	              <td > EDC</td>
	              <td bgcolor="##CCDCCC">INFO</td>
	              
	            <td  ><a href=http://www.semiprecious.com/tm-tm/opentasks.cfm?type=#url.type#&amp;order=0&amp;orderby=Status>Status</a></td>
	            </tr>
         </cfoutput>
	<cfif not isdefined("form.list")>
	    <cfinvoke  component="tm.cfc.task" method="globalview" returnvariable="globalviewRet">
          <cfif url.order>
            <cfinvokeargument name="orderedby" value="status">
		  <cfelseif isdefined("url.orderby")>
			  <cfinvokeargument name="orderedby" value="#url.orderby#">
           </cfif>   
          <cfif isdefined("url.actionby")>
		 		 <cfinvokeargument name="action" value="#url.actionby#">
           </cfif>     
		              <cfif len("url.type")>
					  
				  <cfinvokeargument name="type" value="#url.type#">
           </cfif>    
		    <cfinvokeargument name="status" value="active">
          </cfinvoke>   
            <cfoutput query="globalviewRet"> 
              <cfif pdc LT Now()>
                <cfset bc = 'red'>
                <cfelse>
                <cfset bc = 'blue'>
              </cfif>
              <tr class="#status#" > 
                <td> #dateformat(tdtoi,'mmm-dd-yy')# #timeformat(tdtoi,'HH:mm')#&nbsp;</td><td>#tby#</td>
                <td><a href="taskdetails.cfm?by=#tby#&doi=#urlencodedformat(tdtoi)#">#subject#</a><br />[#left(detail,60)#]...&nbsp;</td>
                <td>#Action#&nbsp;</td>
                <td ><a href="pdchistory.cfm?by=#tby#&doi=#urlencodedformat(tdtoi)#"><font color="#bc#">#dateformat(PDC,'dd/mm/yyyy')#</font></a>&nbsp;</td>
                <td>#info#&nbsp;</td>
                <td>#status#</td>
              </tr>
            </cfoutput>
		<cfelseif isdefined("form.list")>
		 <cfset pdcstart = createodbcdate(createdate(form.pdcsyear, form.pdcsmonth, form.pdcsdate))>
            <cfset pdcend = createodbcdate(createdate(form.pdceyear, form.pdcemonth, form.pdcedate))>
            <cfset istart = createodbcdate(createdate(form.isyear, form.ismonth, form.isdate))>
            <cfset iend = createodbcdate(createdate(form.ieyear, form.iemonth, form.iedate))>
           <cfif not isdefined("form.action")>
		   <cfset form.action = 0>
		   </cfif> 
		    
		  <cfloop list="#form.action#" index="idx">
          <cfinvoke  component="tm.cfc.task" method="globalview" returnvariable="globalviewRet">
            <cfif isdefined("form.status")>
              <cfif len(form.status) GT 2>
                <cfinvokeargument name="status" value="#form.status#">
              </cfif>
            </cfif>
            <cfinvokeargument name="action"  value="#idx#" />
            <cfinvokeargument name="startdate" value="#pdcstart#">
            <cfinvokeargument name="enddate" value="#pdcend#">
            <cfinvokeargument name="doistartdate" value="#istart#">
            <cfinvokeargument name="doienddate" value="#iend#">
			</cfinvoke>   
            <cfoutput query="globalviewRet"> 
              <cfif pdc LT Now()>
                <cfset bc = 'red'>
                <cfelse>
                <cfset bc = 'blue'>
              </cfif>
              <tr class="#status#" > 
                <td> #dateformat(tdtoi,'dd/mmm/yyyy')#&nbsp;</td>
				<td>#tby#</td>
                <td>#subject#<a href="taskdetails.cfm?by=#tby#&doi=#urlencodedformat(tdtoi)#">View Details</a><cfif issue_type is "cart_issue"><a href="itemsell.cfm?cartid=#subject#">View Cart</a></cfif>&nbsp;</td>
                <td>#Action#&nbsp;</td>
                <td><a href="pdchistory.cfm?by=#tby#&doi=#urlencodedformat(tdtoi)#"><font color="#bc#">#dateformat(PDC,'dd/mm/yyyy')#</font></a>&nbsp;</td>
                <td>#info#&nbsp;</td>
                <td>#status#</td>
              </tr>
            </cfoutput>
			</cfloop>
		
               <cfelse>
		Nothing To Do.
		</cfif>
        
        
            <tr bgcolor="#CCDCCC"> 
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>    <td>&nbsp;</td>
            </tr>
          </table>
          <p>&nbsp;</p>
          <p>Note:Click on PDC To View PDC Modification History, Click on Subject 
            to View Details/Respond/Update status.</p>
          <cfif listfindnocase("anup,ravi,nitish",session.apptt)>  
        &nbsp;<a href="pasttasks.cfm">Click Here to View Other Tasks</a>
		</cfif><!-- InstanceEndEditable --> 
      </td>
    </tr></table></div>
<p class="tmbody">&nbsp;</p>
<cfinclude template="tmfooter.cfm">
</body>
<!-- InstanceEnd --></html>
