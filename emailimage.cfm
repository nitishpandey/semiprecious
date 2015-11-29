<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif isdefined("form.emailid")>
<!--- create message and send using semiprecious@indiatimes.com --->
<!--- the message will have an embedded html img tag or a url in text to be pasted on address bar --->
<cftry>
  <cfset html = 1>
  <!--- this part is to be commented out on operationalisation 
<cfquery name="" datasource="semiprecious">
update memberinfo set nlstatus = 0
</cfquery>--->
  <cfset mailto = form.emailid>
  <!--- this is the code on operationalisation--->
  <!--- <cfset mailto = "anup.pandey@corporate.ge.com"> and not this --->
  <cfset from = "semiprecious">
  <!--- <cfoutput query="q">
#email#,#firstname#,#nlstatus#;</cfoutput> --->
  <cfset mailcontent = "">

 
    <!-- need to loop over these 3-4 lines to ensure all new
newsletters are sent as one email--->

      <cfset extn = "htm">
    
   
      <cfset mailcontent = "Some interesting jewelry from semiprecious.com. <br />You can paste this url <b>http://www.semiprecious.com/detail.cfm/#form.newitem#.htm </b>in your
	  browser's address bar if you are not seeing the picture below <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'><img src='http://www.semiprecious.com/images/#form.cat#/thumb/#form.newitem#.jpg' alt='Click to Zoom'></a><br /></a><b> or</b> <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'>click here</a> .">
      <!--- send mail 
<cfoutput>#mailcontent#</cfoutput>--->
  
      <cfset subjecttitle = form.name >
      <cfparam name="order" default="#mailcontent#">
      <cfhttp url="http://email.indiatimes.com/cgi-bin/login" method="post" resolveurl="no">
        <cfhttpparam type="formfield" name="login" value="#from#">
        <cfhttpparam type="formfield" name="passwd" value="terracotta_">
      </cfhttp>
      <!--- <cfoutput>Inside mailer : #order#</cfoutput> --->
      <cfset string = cfhttp.FileContent>
      <cfset start = Find("/cgi-bin/demail.cgi?login=#from#",string)>
      <cfif start>
        <cfset start = Find("=",string,start)>
        <cfset end  = Find('"',string,start)>
        <cfset mod_login = mid(string,start+1,end -start -1)>
        <cfif isdefined("mod_login") and len(mod_login)>
          <!--- <cfoutput>#start#,#end#,#cfhttp.FileContent# gggg #mod_login#</cfoutput>  --->
          <cfhttp method="post" url="http://email.indiatimes.com/cgi-bin/demail.cgi" >
            <cfhttpparam type="formfield" name="MESSAGE1" value="">
            <cfhttpparam type="formfield" NAME="login" VALUE="#mod_login#">
            <cfhttpparam type="formfield" NAME="command" VALUE="send">
            <cfhttpparam name="MAXFILE" type="formfield" value="1" >
            <cfhttpparam type="formfield" name="ln" value="" >
            <cfhttpparam type="formfield" name="ATTACHMENT1" value="" >
            <cfhttpparam type="formfield" name="contype1" value="" >
            <cfhttpparam type="formfield" name="TO"  VALUE="#mailto#" >
            <cfhttpparam type="formfield" name="SUBJECT" value="#subjecttitle#" >
            <cfhttpparam type="formfield" name="CC" VALUE=""   >
            <cfhttpparam type="formfield" name="BCC" VALUE="" >
            <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
            <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
            <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
            <cfhttpparam  type="formfield" name="command" value="send">
            <cfhttpparam value="#order#" name="MESSAGE"  type="formfield">
          </cfhttp>
      
          <cfelse>
          <cfthrow detail="error loging in (2)"  message="same" type="custom">
        </cfif>
        <cfelse>
        <cfthrow detail="error loging in (1)" message="same" type="custom">
      </cfif>



  <cfcatch type="any">
    <cfhttp url="http://email.indiatimes.com/cgi-bin/login" method="post" resolveurl="no">
      <cfhttpparam type="formfield" name="login" value="cheap-jewelry">
      <cfhttpparam type="formfield" name="passwd" value="rangeela">
    </cfhttp>
    <!--- <cfoutput>Inside mailer : #order#</cfoutput> --->
    <cfset string = cfhttp.FileContent>
    <cfset start = Find("/cgi-bin/demail.cgi?login=cheap-jewelry",string)>
    <cfif start>
      <cfset start = Find("=",string,start)>
      <cfset end  = Find('"',string,start)>
      <cfset mod_login = mid(string,start+1,end -start -1)>
      <cfif isdefined("mod_login") and len(mod_login)>
        <!--- <cfoutput>#start#,#end#,#cfhttp.FileContent# gggg #mod_login#</cfoutput> --->
        <cfhttp method="post" url="http://email.indiatimes.com/cgi-bin/demail.cgi" >
          <cfhttpparam type="formfield" name="MESSAGE1" value="">
          <cfhttpparam type="formfield" NAME="login" VALUE="#mod_login#">
          <cfhttpparam type="formfield" NAME="command" VALUE="send">
          <cfhttpparam name="MAXFILE" type="formfield" value="1" >
          <cfhttpparam type="formfield" name="ln" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT1" value="" >
          <cfhttpparam type="formfield" name="contype1" value="" >
          <cfhttpparam type="formfield" name="TO"  VALUE="anup.pandey@corporate.ge.com" >
          <cfhttpparam type="formfield" name="SUBJECT" value="ERROR IN IMAGE MAILER" >
          <cfhttpparam type="formfield" name="CC" VALUE="nitishpandey@rediffmail.com"   >
          <cfhttpparam type="formfield" name="BCC" VALUE="" >
          <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
          <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
          <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
          <cfhttpparam  type="formfield" name="command" value="send">
          <cfhttpparam value="#cfcatch.detail#(; u may choose to stop the service)" name="MESSAGE"  type="formfield">
        </cfhttp>
        <!--- ERROR  --->
      </cfif>
    </cfif>
  </cfcatch>
</cftry>
<cfoutput>The image has been mailed to #form.emailid#.</cfoutput>
<cfelse>
<div align="center">
<form method="post" action="">
<cfoutput>
<table width="428" border="1" cellspacing="2" cellpadding="2">
  <tr>
    <td width="183">The Jewelry:</td>
    <td width="225"><img align="middle" src="images/#url.cat#/thumb/#url.newitem#.jpg">&nbsp;</td>
  </tr>
  <tr><input type="hidden" name="newitem" value="#url.newitem#">
  <input type="hidden" name="cat" value="#url.cat#">
      <td>Send to Email:</td>
    <td>&nbsp;<input type="text" name="emailid" value=""></td>
  </tr>
  <tr>
    <td>Your Name:</td>
    <td>&nbsp;<input type="text" name="name" value=""></td>
  </tr>
  <tr>
    <td>Message:</td>
    <td>&nbsp;<input type="text" name="message" value="Interesting jewelry"></td>
  </tr>
  <tr>
    <td><input type="button" name="Button" value="Cancel" onClick="javascript:document.window.close();"></td>
    <td><input type="submit" name="Submit2" value="Send"></td>
  </tr>
</table></cfoutput>
</form>
</div>
</cfif>
</body>
</html>
