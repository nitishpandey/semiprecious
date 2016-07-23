<cfparam name=newitem default="">
<meta name="robots" content="noindex">
<div align="center">
<cfif session.country eq "India">
	<cfinclude template="headerindia.cfm">
<cfelse>
	<cfinclude template="header.cfm">
</cfif>
<br>


<cfmail server="maila40" to="semiprecioushelp@gmail.com" cc="anup@semiprecious.com"  subject="no image for an item" from="service@semiprecious.com"
 type="html" >
A customer or search engine crawler came to item ID <cfoutput>#newitem#</cfoutput> but got an error due to its missing image (possibly), it was automatically made inactive most certainly to avoid future errors. Please verify/fix.
If you are logged in, you can access the edit page by clicking (single click) <a href='http://www.semiprecious.com/admintools/edititem.cfm?newitem=<cfoutput>#newitem#</cfoutput>'>here</a>
</cfmail>
	 <cfif newitem neq "">
        <cfquery name="qryMakeItemInActive" datasource="gemssql">
            UPDATE	items
            SET 	status = 1
            WHERE	newitem = #newitem#
            AND		status <> 1
        </cfquery>
    </cfif> 
	<font style="font-family:Verdana, Arial, Helvetica, sans-serif;color:##333333">This item is not active at this time. Please click on Back button below to go back.<br><br>
    <input type="button" name="btnBack" value="Back" onClick="JavaScript:history.go(-1)">

</div>
