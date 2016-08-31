<cfif Isdefined('form.txtuser')>
	<CFQUERY DATASOURCE="gemssql" NAME="qryGetAccess">
        Select	limitedAccess 
        from 	users 
        where 	apptt = '#form.txtUser#'
        And	  	usertype = 'superadmin'
    </CFQUERY>
    <cfif qryGetAccess.recordcount neq 0>
        <CFQUERY DATASOURCE="gemssql" NAME="qryUpdAccess">
            UPDATE	users 
            SET		limitedaccess = '1' 
            where 	apptt = '#form.txtUser#'
            And	  	usertype = 'superadmin'
        </CFQUERY>
        <cfset msg = 'User #form.txtUser# has been updated successfully!'>
    <cfelse>
        <cfset msg = 'Either user #form.txtUser# does not exist or user is not super admin. No record is updated'>
    </cfif>
</cfif>
<cfif isdefined('msg')>
	<cfoutput>#msg#</cfoutput>
    <cfset msg = ''>
</cfif>
<form action="limitaccess.cfm" name="frmLimitAccess" method="post">
<table border="1" style="border-collapse:collapse">
	<tr>
    	<td>
        	User Name
        </td>
        <td>
        	<input type="text" name="txtUser">
        </td>
    </tr>
    <tr>
    	<td colspan="2">
        	<input type="submit" name="btnSave" value="Save">
        </td>
    </tr>
</table>
</form>
