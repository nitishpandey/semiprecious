
<!--- 

error history 
set debug = 0 when out of debug and then set newsletter to on.
--->
<cfset debug = 1>
<cftry>
  <cfset html = 1>
<!--- 

this part is to be commented out on operationalisation 
<cfquery name="" datasource="semiprecious">
update memberinfo set nlstatus = 0
</cfquery>

--->
<cfif debug >
<cfset mailto = "nitish@semiprecious.com, nitishpandey@rediffmail.com,anup@semiprecious.com">
</cfif>
<cfif  isdefined("mailto")>
     <cfquery datasource="semiprecious" name="q">
    select firstname , email, nlstatus from memberinfo where email = '#mailto#' 
    </cfquery>
    <cfelse>
   <cfquery datasource="semiprecious" name="q">
    select firstname , email, nlstatus from memberinfo order by nlstatus, email
    </cfquery>
 <cfset mailto = "#q.email#">
  </cfif>
  <cfif debug>
  <cfset test = 1>
  <cfelse>
  <cfset test = q.nlstatus>
  </cfif>
  <cfif test > <!--- is newsletter on  ? even in debug mode it must be on and not off---->
  	<cfif html>
      <cfset extn = "htm">
      <cfelse>
      <cfset extn = "txt">
    </cfif>
  	<cfif debug>
	<cfset nltosend = 3>
	<cfoutput>In debug mode sending mail to nitishrediff for #nltosend#.#extn#
	</cfoutput>
	<cfelse>
	  <cfset nltosend = q.nlstatus + 1>
</cfif>

	<cfset urlprefix = "http://localhost:8500/semiprecious/www/">
 	<cfset urlprefix = "http://www.semiprecious.com/"> <!--- just reverse the sequence of cfsets here to test on server --->
 	<cfset nlurl = "#urlprefix#newsletters/nl#nltosend#.#extn#">
	  <cfhttp url="#nlurl#"  >
    </cfhttp>
    <cfif cfhttp.statuscode contains "200">
      <cfset mailcontent = cfhttp.FileContent> 
      <cfhttp url="#urlprefix#newsletters/nlheader.#extn#">
      </cfhttp>

      <cfset mailcontent = "This is automatic sent mail from crystal scheduler #cfhttp.FileContent#  Hello #q.firstname#, " & mailcontent>
	 
      <cfhttp url="#urlprefix#newsletters/nlfooter.#extn#">
      </cfhttp>
	  
      <cfset mailcontent = mailcontent & cfhttp.FileContent>
	  
      <!--- send mail 
<cfoutput>#mailcontent#</cfoutput>--->
      <cfhttp url="#urlprefix#newsletters/subject.htm">
      </cfhttp>
      <cfset subject = cfhttp.FileContent>
	  <cfset mailerror = 1>
	 
  	<cfmodule template="../customtags/mailsemipreciouscom.cfm" mailto="#mailto#" debug="#debug#" ccto=""  mailcontent="#mailcontent#" subject="#subject#"  />
</cfif>
<cfif mailerror >
   <cfif debug>
		 Error caught !
   </cfif>
		 
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
	  <Cfset end=start+12 + len(from)> <!---- here we are assuming a session id of length 10 plus the tilde symbol --->
    
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

  </cfif>
 
</cfif>

<cfcatch type="any"><br>
Exception Caught in newslettersnew.cfm<cfoutput><br>

      <span class="error1">#cfcatch.Detail# | #cfcatch.Message# | #cfcatch.Type# | </span></cfoutput> 

</cfcatch>
</cftry>