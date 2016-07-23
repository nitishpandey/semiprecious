<html>
<head>
<title>Add a Reference Design Photo/Image</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfset formflag = 0>
<cfset absolutepath = getdirectoryfrompath(gettemplatepath())>

<cfif isdefined("form.imagery")>
 <cfset d =#absolutepath# & #session.customrequestid#>
<!---<cfoutput>#d#</cfoutput> --->
<cfif not directoryexists(d)>
<cfdirectory directory="#absolutepath##session.customrequestid#" action="create" >
</cfif>

 <cffile   destination="#absolutepath##session.customrequestid#/"   action="upload"
			filefield="form.imagery" mode="755" nameconflict="overwrite" accept="image/gif,image/jpg,image/jpeg,image/tiff">
	<cfif cffile.filewassaved><Cfset formflag = 1>
			<!--- <cfoutput>#cffile.filesize#</cfoutput> --->
			</cfif>
			</cfif>
		
<cfif formflag eq 0>
<form method="post" action="uploadreferencephoto.cfm" enctype="multipart/form-data">
  Click on Browse to select the imagery/photo/scanned image on your PC.<br>
 After 
  selection click on 'Add':<br>
  <input type="file" name="imagery">
  <input type="submit" value="Add" ></form>
  <cfelse>
  File Saved Succesfully.
</cfif>
<br>
If you want to add more images :<a href="customrequestimageadderform.cfm">Back To Image Adding Form</a><br>

Else close this window and reload or refresh the main page to see this image.


</body>
</html>
