
<!--- error history --->
<!---- the page had stopped working and that tooo silently because no known exception was happening.  The error was because
the opening page of the indiatimes on login had got its format changed. Thus extraction of the session id from this opeing page was
giving one extra character, actually the newline character. The previous search was based on pattern search for '"' and now i hav hard
coded the length of the session id to a length of 10 .. ---->
<cftry>
  <cfset html = 1>
  <!--- this part is to be commented out on operationalisation 
<cfquery name="" datasource="semiprecious">
update memberinfo set nlstatus = 0
</cfquery>--->
  <cfif  isdefined("mailto")>
     <cfquery datasource="semiprecious" name="q">
    select firstname , email, nlstatus from memberinfo where email = '#mailto#' 
    </cfquery>
    <cfelse>
   <cfquery datasource="semiprecious" name="q">
    select firstname , email, nlstatus from memberinfo order by nlstatus , email
    </cfquery>
    <cfset mailto = "#q.email#">
  </cfif>
  <!--- this is the code on operationalisation--->
  <!--- <cfset mailto = "anup.pandey@corporate.ge.com"> and not this --->
  <cfset from = "semiprecious">
  <!--- <cfoutput query="q">
#email#,#firstname#,#nlstatus#;</cfoutput> --->

  <cfset mailcontent = "">
  <cfif q.nlstatus>
    <cfset nltosend = q.nlstatus + 1>
	<cfif isdefined("debug")>
	<cfset nltosend = 3>
	"sending nl3.htm in debug mode " <br>

	</cfif>

    <!-- need to loop over these 3-4 lines to ensure all new
newsletters are sent as one email--->
    <cfif html>
      <cfset extn = "htm">
      <cfelse>
      <cfset extn = "txt">
    </cfif>
    <cfset nlurl = "http://www.semiprecious.com/newsletters/nl#nltosend#.#extn#">
    <cfhttp url="#nlurl#" >
    </cfhttp>
    <cfif cfhttp.statuscode contains "200">
      <cfset mailcontent = cfhttp.FileContent>
      <cfhttp url="http://www.semiprecious.com/newsletters/nlheader.#extn#">
      </cfhttp>
      <cfset mailcontent = "#cfhttp.FileContent# <br /> Hello #q.firstname#, <br />" & mailcontent>
      <cfhttp url="http://www.semiprecious.com/newsletters/nlfooter.#extn#">
      </cfhttp>
      <cfset mailcontent = mailcontent & cfhttp.FileContent>
      <!--- send mail 
<cfoutput>#mailcontent#</cfoutput>--->
      <cfhttp url="http://www.semiprecious.com/newsletters/subject.htm">
      </cfhttp>
      <cfset subjecttitle = cfhttp.FileContent>
      <cfparam name="order" default="#mailcontent#">
      <cfhttp url="http://email.indiatimes.com/cgi-bin/login" method="post" resolveurl="no">
        <cfhttpparam type="formfield" name="login" value="#from#">
        <cfhttpparam type="formfield" name="passwd" value="terracotta_">
      </cfhttp>
    <!---   <cfoutput>I : #cfhttp.FileContent#,statnside </cfoutput>  --->
      <cfset string = cfhttp.FileContent>
      <cfset start = Find("/cgi-bin/demail.cgi?login=#from#",string)>
      <cfif start>
        <cfset start = Find("=",string,start)>
        <cfset end  = Find('"',string,start)>
		<Cfset end=start+12 + len(from)> <!---- here we are assuming a session id of length 10 plus the tilde symbol --->
        <cfset mod_login = mid(string,start+1,end -start -1)>
        <cfif isdefined("mod_login") and len(mod_login)>
      <Cfif isdefined("debug")> <cfoutput>#start#,#end#,#cfhttp.FileContent# ,LogUid= ^#mod_login#^</cfoutput></Cfif>
	  
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
            <cfhttpparam type="formfield" name="SUBJECT" value="#subjecttitle#" >
            <cfhttpparam type="formfield" name="CC" VALUE=""   >
            <cfhttpparam type="formfield" name="BCC" VALUE="" >
            <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
			 <cfhttpparam type="formfield" name="ATTACHMEDIT" value="Attach Files" >
            <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
            <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
            <cfhttpparam  type="formfield" name="command" value="send">
            <cfhttpparam value="#order#" name="MESSAGE"  type="formfield">
          </cfhttp>
		  <cfif find('Mail Sent',cfhttp.FileContent )>
		  <cfquery datasource="semiprecious">
          update memberinfo set nlstatus = #nltosend# where email = '#q.email#' 
          </cfquery>
		  <cfif isdefined("debug")>
		  Status updated ! 
		  <cfoutput> update memberinfo set nlstatus = #nltosend# where email = '#q.email#' </cfoutput>
		  </cfif>
		  <cfelse>
		  <cfthrow message="Error on Sending, After Login"  type="custom" detail="Possibly the session id is not being retrieved correctly">
			  <cfif isdefined("debug")>
		  Status not updated. Error Thrown !</cfif>
		  </cfif>
     
		<cfif isdefined("debug")>

		  The response is <cfoutput>#cfhttp.FileContent#,status is #cfhttp.statuscode#, #cfhttp.MIMEType#,^#mod_login#^</cfoutput>.
        </cfif>   <cfelse>
          <cfthrow detail="error loging in (2)"  message="same" type="custom">
        </cfif>
        <cfelse>
        <cfthrow detail="error loging in (1)" message="same" type="custom">
      </cfif>
      <cfelse>
      <cfthrow detail="error getting newsletter" message="same" type="custom">
    </cfif>
  </cfif>
  <cfcatch type="any">
   <cfif isdefined("debug")>
		 Error caught !</cfif>
  <cfif Application.nlerrorcount >
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
      <cfset mod_login = mid(string,start+1,end -start -1)>	<Cfset end=start+12 + len(from)> <!---- here we are assuming a session id of length 10 plus the tilde symbol --->
    
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
          <cfhttpparam type="formfield" name="SUBJECT" value="ERROR IN NEWSLETTER" >
          <cfhttpparam type="formfield" name="CC" VALUE="nitishpandey@rediffmail.com"   >
          <cfhttpparam type="formfield" name="BCC" VALUE="" >
          <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
          <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
          <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
          <cfhttpparam  type="formfield" name="command" value="send">
          <cfhttpparam value="#cfcatch.detail#( u may choose to <a href='http://www.semiprecious.com/newsletters/startstop.cfm'>stop</a> the service) This message will be sent to you a maximum of 5 times even though the error may persist." name="MESSAGE"  type="formfield">
        </cfhttp>
        <!--- ERROR  --->
      </cfif>
    </cfif>
	<cfset Application.nlerrorcount = Application.nlerrorcount - 1>
	</cfif>
  </cfcatch>
</cftry>
