<cfparam name="shipper" default="AC">
<cfset shipper = "AC">
 <a href="../admin.cfm">Admin Page</a>&nbsp;<a href="../tm-tm/mainmenu.cfm">Admin</a>
<CFSET THISFILE =GetFileFromPath(getcurrenttemplatepath())>
<a href=/admintools/invoiceindiaashtm.cfm>See in Browser </a>

<a href=/admintools/invoiceindia.cfm>SAVE in Spreadsheet</a><p> 
<cfinclude template="/admintools/cartsothers.cfm" />

