
<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif>
<cfparam name="root" default="d:\inetpub\semiprecious">
<cfparam name="createfile" default="">


<form name=filemaker action=makemissingfile.cfm>

Write path and name of file to make:<br>
<input type="text" size=100 name="filepathandname" value=""><br>
<b>example: foldername\filename.cfm  or shaped\pencil-bracelets.cfm or articles\article1.htm<p></b>

Enter code or content: (change default text/removel ines that do not apply) <textarea name="filecontent" cols=90 rows=6>
cfset category='CAT'>
cfset subcat='STONE'>
cfset groupname='THEME'>
cfinclude template='/gemstone_jewelry_gallery.cfm'></textarea>
<input type=submit name=createfile value=createfile>

</form>

<cfif createfile is "createfile">
<cffile action = "write" 
   file = "#root#\#filepathandname#"    
   output = "#filecontent#">
   
   file made: 	<cfoutput>semiprecious.com\#filepathandname#</cfoutput> <br>

</cfif>
