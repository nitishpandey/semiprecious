<cftry>
  <cfset html = 1>
  <!--- this part is to be commented out on operationalisation 
<cfquery name="" datasource="semiprecious">
update memberinfo set nlstatus = 0
</cfquery>--->
  <cfif not isdefined("mailto")>
    <cfquery datasource="semiprecious" name="q">
    select firstname , email, nlstatus from memberinfo order by nlstatus , email
    </cfquery>
    <cfset mailto = "#q.email#">
    <cfelse>
    <cfquery datasource="semiprecious" name="q">
    select firstname , email, nlstatus from memberinfo where email = '#mailto#' 
    </cfquery>
  </cfif>
  <!--- this is the code on operationalisation--->
  <!--- <cfset mailto = "anup.pandey@corporate.ge.com"> and not this --->
  <cfset from = "semiprecious">
  <!--- <cfoutput query="q">
#email#,#firstname#,#nlstatus#;</cfoutput> --->
  <cfset mailcontent = "">
  <cfif q.nlstatus>
    <cfset nltosend = q.nlstatus + 1>
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
<!---
          <cfquery datasource="semiprecious">
          update memberinfo set nlstatus = #nltosend# where email = '#q.email#' 
          </cfquery>
--->
Sent mail to #q.email#.
          <cfelse>
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
          <cfhttpparam type="formfield" name="SUBJECT" value="ERROR IN NEWSLETTER" >
          <cfhttpparam type="formfield" name="CC" VALUE="nitishpandey@rediffmail.com"   >
          <cfhttpparam type="formfield" name="BCC" VALUE="" >
          <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
          <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
          <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
          <cfhttpparam  type="formfield" name="command" value="send">
          <cfhttpparam value="#cfcatch.detail#(nl#nltosend#.htm ; u may choose to <a href='http://www.semiprecious.com/newsletters/startstop.cfm'>stop</a> the service) This message will be sent to you a maximum of 5 times even though the error may persist." name="MESSAGE"  type="formfield">
        </cfhttp>
        <!--- ERROR  --->
      </cfif>
    </cfif>
	<cfset Application.nlerrorcount = Application.nlerrorcount - 1>
	</cfif>
  </cfcatch>
</cftry>
