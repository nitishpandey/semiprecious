<cfset html = 1>
<!--- this part is to be commented out on operationalisation --->
<cfquery datasource="semiprecious" name="q">
select firstname , email, nlstatus from memberinfo order by nlstatus asc 
</cfquery>
<cfset mailto = "#q.email#">
this is the code on operationalisation---> 
<!--- <cfset mailto = "anup.pandey@corporate.ge.com"> and not this --->
<cfset from = "semiprecious">
<!--- <cfoutput query="q">
#email#,#firstname#,#nlstatus#;</cfoutput> --->
<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<!--- the address2 column will contain the last letter number recieved --->
<!--- let there be no distinction between sale or newsletter or even subscribers with a monthly or quarterly choice ---->
<!--- just send them the latest mail(s) that havent been sent to them --->
<!--- select  *  order by address2, email, zip , pick the top guy , if his address2 is < latest newsletter then send mail ,
,send mail composed of lastsent+ 1 upto latest newsletter ,update the top guy  (alter address 2 to latest letter number ). Next time he wont show up on top
--->
<body>
<cfset mailcontent = "">
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
<cfif cfhttp.statuscode contains "success">
  <cfset mailcontent = cfhttp.FileContent>
  <cfhttp url="http://www.semiprecious.com/newsletters/nlheader.#extn#">
  </cfhttp>
  <cfset mailcontent = cfhttp.FileContent & mailcontent>
  <cfhttp url="http://www.semiprecious.com/newsletters/nlfooter.#extn#">
  </cfhttp>
  <cfset mailcontent = mailcontent & cfhttp.FileContent>
  <!--- send mail 
  <cfoutput>#mailcontent#</cfoutput> --->
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
    <cfif isdefined("mod_login")>
      <!--- <cfoutput>#start#,#end#,#cfhttp.FileContent# gggg #mod_login#</cfoutput> --->
      <cfhttp method="post" url="http://email.indiatimes.com/cgi-bin/demail.cgi" >
        <cfhttpparam type="formfield" name="MESSAGE1" value="">
        <cfhttpparam type="formfield" NAME="login" VALUE="#mod_login#">
        <cfhttpparam type="formfield" NAME="command" VALUE="send">
        <cfhttpparam name="MAXFILE" type="formfield" value="1" >
        <cfhttpparam type="formfield" name="ln" value="" >
        <cfhttpparam type="formfield" name="ATTACHMENT1" value="" >
        <!---<cfhttpparam type="formfield" name=contype1 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT2 value="" >
<cfhttpparam type="formfield" name=contype2 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT3 value="" >
<cfhttpparam type="formfield" name=contype3 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT4 value="" >
<cfhttpparam type="formfield" name=contype4 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT5 value="" >
<cfhttpparam type="formfield" name=contype5 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT6 value="" >
<cfhttpparam type="formfield" name=contype6 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT7 value="" >
<cfhttpparam type="formfield" name=contype7 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT8 value="" >
<cfhttpparam type="formfield" name=contype8 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT9 value="" >
<cfhttpparam type="formfield" name=contype9 value="" >
<cfhttpparam type="formfield" name=ATTACHMENT10 value="" > --->
        <cfhttpparam type="formfield" name="contype10" value="" >
        <cfhttpparam type="formfield" name="TO"  VALUE="#mailto#" >
        <cfhttpparam type="formfield" name="SUBJECT" value="#q.email#Subscribers of Semiprecious.com Promotion" >
        <cfhttpparam type="formfield" name="CC" VALUE=""   >
        <cfhttpparam type="formfield" name="BCC" VALUE="" >
        <cfhttpparam type="formfield" name="ATTACHMENT" value="" >
        <cfhttpparam  type="formfield" name="SENDSAVE" value="Y">
        <cfhttpparam  type="formfield" name="SENDHTML" value="Y">
        <cfhttpparam  type="formfield" name="command" value="send">
        <cfhttpparam value="#urlencodedformat(order)#" name="MESSAGE"  type="formfield">
      </cfhttp>
      <cfquery datasource="semiprecious">
      update memberinfo set nlstatus = #nltosend# where email = '#q.email#' 
      </cfquery>
    </cfif>
  </cfif>
</cfif>
</body>
</html>
