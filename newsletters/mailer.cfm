 <!--- error history --->
<!---- the page had stopped working and that tooo silently because no known exception was happening.  The error was because
the opening page of the indiatimes on login had got its format changed. Thus extraction of the session id from this opeing page was
giving one extra character, actually the newline character. The previous search was based on pattern search for '"' and now i hav hard
coded the length of the session id to a length of 10 .. ---->

To use this mailer just set mailto and mailcontent variables to the destination emailid and the message respectively in the 
including template. To debug Define a url variable named 'debug'.
To hide this message include the template with in cfsilent tags.
Note : cfparam redefines a variable in an included template even if the encolsing page has the variable.
<cfparam name="mailto" default="anup@semiprecious.com" type="string">
<cfparam name="ccto" default="" type="string">
<cfparam name="mailcontent" default="empty content" type="string">
<cfparam default="1" name="sendsave" type="numeric">
<cfparam  default="Semiprecious.com" name="Subject" type="string">
<cftry>
  
  <!--- this part is to be commented out on operationalisation 
<cfquery name="" datasource="semiprecious">
update memberinfo set nlstatus = 0
</cfquery>--->
  <!--- this is the code on operationalisation--->
  <!--- <cfset mailto = "anup.pandey@corporate.ge.com"> and not this --->
  <cfset from = "semiprecious">
  <!--- <cfoutput query="q">
#email#,#firstname#,#nlstatus#;</cfoutput> --->
  <cfif 1>
    <cfif isdefined("debug")>
            "sending in debug mode " <br>
    </cfif>
    <!-- need to loop over these 3-4 lines to ensure all new
newsletters are sent as one email--->
 
      <cfset extn = "htm">
   
    <cfhttp url="http://email.indiatimes.com/cgi-bin/login" method="post" resolveurl="no">
      <cfhttpparam type="formfield" name="login" value="#from#">
      <cfhttpparam type="formfield" name="passwd" value="terracotta_">
    </cfhttp>
    <!---   <cfoutput>I : #cfhttp.FileContent#,statnside </cfoutput>  --->
    <cfset string = cfhttp.FileContent>
    <cfset start = Find("/cgi-bin/demail.cgi?login=#from#",string)>
    <cfif start>
      <cfset start = Find("=",string,start)>
         <Cfset end=start+12 + len(from)>
      <!---- here we are assuming a session id of length 10 plus the tilde symbol --->
      <cfset mod_login = mid(string,start+1,end -start -1)>
      <cfif isdefined("mod_login") and len(mod_login)>
        <Cfif isdefined("debug")>
          <cfoutput>After Logging In but Before Sending Mail :#start#,#end#,#cfhttp.FileContent# ,LogUid= ^#mod_login#^</cfoutput>
        </Cfif>
        <cfhttp method="post" url="http://email.indiatimes.com/cgi-bin/demail.cgi"  useragent="MSIE5.5" >
          <cfhttpparam type="formfield" name="MESSAGE1" value="">
          <cfhttpparam type="formfield" NAME="login" VALUE="#mod_login#">
          <cfhttpparam type="formfield" NAME="command" VALUE="send">
          <cfhttpparam name="MAXFILE" type="formfield" value="2" >
          <cfhttpparam type="formfield" name="ln" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT1" value="" >
          <cfhttpparam type="formfield" name="contype1" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT2" value="" >
          <cfhttpparam type="formfield" name="contype2" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT3" value="" >
          <cfhttpparam type="formfield" name="contype3" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT4" value="" >
          <cfhttpparam type="formfield" name="contype4" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT5" value="" >
          <cfhttpparam type="formfield" name="contype5" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT6" value="" >
          <cfhttpparam type="formfield" name="contype6" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT7" value="" >
          <cfhttpparam type="formfield" name="contype7" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT8" value="" >
          <cfhttpparam type="formfield" name="contype8" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT9" value="" >
          <cfhttpparam type="formfield" name="contype9" value="" >
          <cfhttpparam type="formfield" name="ATTACHMENT10" value="" >
          <cfhttpparam type="formfield" name="contype10" value="" >
          <cfhttpparam type="formfield" name="TO"  VALUE="#mailto#" >
          <cfhttpparam type="formfield" name="a"  VALUE="English" >
          <cfhttpparam type="formfield" name="SUBJECT" value="#subject#" >
          <cfhttpparam type="formfield" name="CC" VALUE="#ccto#"   >
          <cfhttpparam type="formfield" name="BCC" VALUE="" >
          <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
          <cfhttpparam type="formfield" name="ATTACHMEDIT" value="Attach Files" >
		  <cfif sendsave>
          <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
		  </cfif>
          <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
          <cfhttpparam  type="formfield" name="command" value="send">
          <cfhttpparam value="#mailcontent#" name="MESSAGE"  type="formfield">
        </cfhttp>
        <cfif find('Mail Sent',cfhttp.FileContent )>
          <cfset mailcontent = 1>
          <cfelse>
          <cfset mailcontent = 0>
          <!--- error flag --->
          <cfif isdefined("debug")>
            Status not updated. Error Thrown ! 
			 <cfthrow detail="error sending Mail (3)"  message="same" type="custom">
          </cfif>
        </cfif>
        <cfif isdefined("debug")>
          The response is <cfoutput>#cfhttp.FileContent#,status is #cfhttp.statuscode#, #cfhttp.MIMEType#,^#mod_login#^</cfoutput>. 
        </cfif>
        <cfelse>
        <cfthrow detail="error logging in (2)"  message="same" type="custom">
      </cfif>
      <cfelse>
      <cfthrow detail="error logging in (1)" message="same" type="custom">
    </cfif>
    <cfelse>
    <cfthrow detail="Error getting newsletter" message="same" type="custom">
  </cfif>
  <cfcatch type="any">
    <cfif isdefined("debug")>
      Error caught !
    </cfif>
    <!--- <cfoutput>Inside mailer : #order#</cfoutput> --->
    <cfif 1>
      <cfhttp url="http://email.indiatimes.com/cgi-bin/login" method="post" resolveurl="no">
        <cfhttpparam type="formfield" name="login" value="cheap-jewelry">
        <cfhttpparam type="formfield" name="passwd" value="rangeela">
      </cfhttp>
      <cfset string = cfhttp.FileContent>
      <cfset start = Find("/cgi-bin/demail.cgi?login=cheap-jewelry",string)>
      <cfif start>
        <cfset start = Find("=",string,start)>
        <!---   <cfset end  = Find('"',string,start)> --->
        <cfset mod_login = mid(string,start+1,end -start -1)>
        <Cfset end=start+12 + len(from)>
        <!---- here we are assuming a session id of length 10 plus the tilde symbol --->
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
            <cfhttpparam type="formfield" name="SUBJECT" value="ERROR IN MAILER" >
            <cfhttpparam type="formfield" name="CC" VALUE="nitishpandey@rediffmail.com"   >
            <cfhttpparam type="formfield" name="BCC" VALUE="" >
            <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
            <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
            <cfhttpparam  type="formfield" name="command" value="send">
            <cfhttpparam value="#cfcatch.detail#( u may choose to <a href='http://www.semiprecious.com/newsletters/startstop.cfm'>stop</a> the service) This message will be sent to you a maximum of 5 times even though the error may persist." name="MESSAGE"  type="formfield">
          </cfhttp>
          <!--- ERROR  --->
        </cfif>
      </cfif>
    </cfif>
  </cfcatch>
</cftry>
