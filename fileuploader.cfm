 <cfif isdefined("form.uploadfolder")>


 <cfset root =  getdirectoryfrompath(getCurrentTemplatePath()) />
      <cfset onconflict = 'overwrite'>
 
  <cftry>
    <cffile 
   action = "upload"
   fileField = "myFile"
   destination = "#root##form.uploadfolder#"
   nameConflict = "#onconflict#"

>
    <!---    accept = "text/xhtml,text/xml,text/html,image/gif,image/jpg," --->
    <cfset message.result = 'File Uploaded Sucesfully' />
    <cfset result = true />
    <cfset message.filename = #cffile.Clientfile# />
    <cfset message.destinationfolder= "testupload" />
    <cfcatch type="any">
      <cfset message.error = cfcatch.Message />
      <cfset message.errordetail = cfcatch.Detail />
      <cfset dw_control_var = 'fileuploaded'>
      <cfset result = false />
    </cfcatch>
  </cftry>
</cfif>
   <cfparam default="" name="form.uploadfolder" />
  <form action="file:///C|/CFusionMX/wwwroot/estorm/nu/dynamicweb/fileuploadaction.cfm" method="post">
    file: <input type="file" name="myfile" >
    <br>
    What folder?
    <input  name="uploadfolder" type="text"  value="<cfoutput>#form.uploadfolder#</cfoutput>">
    <br>
    <input type="submit"/>
  </form>

