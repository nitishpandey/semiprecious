  <cfset html = 1 ><cftry>
 <!--- <cfset debug = 1>  remove this setting on opertationalisation --->
<cfquery datasource="semiprecious"  name="n" >
select pvalue as nltosend from properties where pname = 'nltosend'
</cfquery>
<!--- <cfset bccto = ""> --->
  <cfset mailcount = 30 >
  <cfif  isdefined("url.mailto") >
    <cfquery datasource="semiprecious" name="q" >
    select firstname , email, nlstatus from memberinfo where email = '#url.mailto#' 
    </cfquery>
	<cfelse>
    <cfquery datasource="semiprecious" name="q" >
    select firstname , email, nlstatus from memberinfo where nlstatus <  #n.nltosend# order by nlstatus asc, email 
    </cfquery>
  </cfif>
 <cfset mailcontent = "" >
  <cfif len(q.nlstatus)>
  <cfset tmpstatus = q.nlstatus>
  <cfelse>
  <cfset tmpstatus = n.nltosend>

  </cfif>
  <cfif  tmpstatus >
    <cfset nltosend = n.nltosend >
	 <cfif isdefined("debug") >
	      <cfset mailto = "anup@semiprecious.com" >
		  <cfset bccto = "nitishpandey@indiatimes.com" >
    </cfif>

    <cfset nlurl = "http://www.semiprecious.com/newsletters/nl#nltosend#.htm" >
    <cfhttp url="#nlurl#" >
    </cfhttp>
    <cfif cfhttp.statuscode contains "200" >
      <cfset mailcontent = cfhttp.FileContent >
      <cfhttp url="http://www.semiprecious.com/newsletters/nlheader.htm" >
      </cfhttp>
      <cfset header = cfhttp.FileContent >
      <cfhttp url="http://www.semiprecious.com/newsletters/nlfooter.htm" >
      </cfhttp>
      <cfset footer  = cfhttp.FileContent >
       <cfhttp url="http://www.semiprecious.com/newsletters/subject.htm">
      </cfhttp>
      <cfset subjecttitle = "semiprecious & silver jewelry store once a month email" >
	
	  <cfloop query="q">
	   <cfif mailcount >
	        <cfset thismail = "<br />Hi " & firstname & ", <br />" &header &  mailcontent &" <br />" & footer>
     <cftry>
	  <cfmail type="html"    to="#q.email#"  subject="#subjecttitle#"	  server="mail23.webcontrolcenter.com" from="cs@semiprecious.com" failto="anup@semiprecious.com"  >
	<img src="http://www.semiprecious.com/images/logobw.jpg"><hr />  If your  mail does not support html mail, visit this url to <a href="http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=#nltosend#&customer=">read the latest newsletter</a>(http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=#nltosend#&customer=#urlencodedformat(firstname)#)
        #Variables.thismail# 
		<span style="background-color:yellow;"><a href="http://www.semiprecious.com/login.cfm?email=#q.email#">ONE CLICK TO LOGIN AND SHOP NOW!</a></span>
      </cfmail>
	  <cfcatch type="any">
<cfmail server="mail23.webcontrolcenter.com"  from="cs@semiprecious.com"  to="nitish@semiprecious.com" subject="Latest error from  mailer" type="html"  >
#cfcatch.Detail#, #cfcatch.Message# for #q.email#
</cfmail>
</cfcatch>
</cftry>

 <cfquery datasource="semiprecious" >
      update memberinfo set nlstatus = #nltosend# where email = '#q.email#' 
      </cfquery> 
	  <cfset mailcount = mailcount - 1 >
	 <cfelse>
	  <cfbreak />
	  </cfif>
	  </cfloop>

      <cfif isdefined("debug")>
        Status updated ! <cfoutput> update memberinfo set nlstatus = #nltosend# where email = '#q.email#' </cfoutput> 
      </cfif>
      <cfif isdefined("debug")>
        The response is <cfoutput>#cfhttp.FileContent#,status is #cfhttp.statuscode#, #cfhttp.MIMEType#,^#mod_login#^</cfoutput>. 
      </cfif>
    </cfif>
  </cfif>
  <cfcatch type="any">
    <cfif isdefined("debug")>
      Error caught !
    </cfif>
	<cfoutput>#cfcatch.Detail#, #cfcatch.Message#</cfoutput>
    <cfif Application.nlerrorcount GT 0 >
      <cfhttp url="http://email.indiatimes.com/cgi-bin/login" method="post" resolveurl="no" >
        <cfhttpparam type="formfield" name="login" value="cheap-jewelry" >
        <cfhttpparam type="formfield" name="passwd" value="rangeela" >
      </cfhttp>
      <!--- <cfoutput>Inside mailer : #order#</cfoutput> --->
      <cfset string = cfhttp.FileContent>
      <cfset start = Find("/cgi-bin/demail.cgi?login=cheap-jewelry",string)>
      <cfif start>
        <cfset start = Find("=",string,start)>
        <cfset end  = Find('"',string,start)>
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
            <cfhttpparam type="formfield" name="SUBJECT" value="ERROR IN NEWSLETTER" >
            <cfhttpparam type="formfield" name="CC" VALUE="nitishpandey@rediffmail.com"   >
            <cfhttpparam type="formfield" name="BCC" VALUE="" >
            <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
            <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
            <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
            <cfhttpparam  type="formfield" name="command" value="send">
            <cfhttpparam value="#cfcatch.detail#, #Cfcatch.Message#( u may choose to <a href='http://www.semiprecious.com/newsletters/startstop.cfm'>stop</a> the service) This message will be sent to you a maximum of 5 times even though the error may persist." name="MESSAGE"  type="formfield">
          </cfhttp>
          <!--- ERROR  --->
        </cfif>
      </cfif>
      <cfset Application.nlerrorcount = Application.nlerrorcount - 1>
    </cfif>
  </cfcatch>
</cftry>
