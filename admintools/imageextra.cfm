
<html>

<head> <title>Uploading Jewelry File</title> </head>
<body>
<h2>Uploaded File</h2>

<cfif sequence is 0>
<cffile action="upload"
      destination="#origdestin#"
      nameConflict="overwrite"
      fileField="Form.File2Upload">
			
			<cfimage source="#origdestin#" action="resize" width="30%"
    	height="30%" destination="#thumbdestin#" overwrite="yes">
	 
	  <cfelseif sequence is 100>
	  
	  
<cffile action="upload"
      destination="#thumbdestin#"
      nameConflict="overwrite"
      fileField="Form.File2Upload">
	  
	  <cfelse>

<cffile action="upload"
      destination="#destin#-#sequence#.jpg"
      nameConflict="overwrite"
      fileField="Form.File2Upload">
      </cfif>
	  
	  <cfif #cffile.filesize# GT 70000>
	  <h1>WARNING, FILE <font color="#FF3333">LARGER THAN 70 KB</font>, PLEASE RESIZE AND UPLOAD AGAIN!!!</h1>
	  </cfif>
	  
	  <cfquery datasource="gemssql">update items set morepics=#morepics# from items where newitem = #newitem#</cfquery>

<cfoutput>
You uploaded #cffile.ClientFileName#.#cffile.ClientFileExt#
         successfully to #cffile.ServerDirectory#.
</cfoutput>
<a href=/detail.cfm?newitem=<cfoutput>#newitem#</cfoutput>>CLICK TO SEE ITEM PAGE<a/><br />
<cfoutput><a href=edititem.cfm?newitem=#newitem# >More Edits</a></cfoutput>

</body>
</html>

