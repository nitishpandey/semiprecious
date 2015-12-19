

 
<cfparam default="0" name="Attributes.debug" type="numeric">
<cfparam name="Attributes.mailto" default="nitish@rediffmail.com" type="string">
<cfparam name="Attributes.ccto" default="anup@semiprecious.com" type="string">
<cfparam default="TEST CONTENT" name="Attributes.mailcontent" type="string">
<cfparam default="subject goes here" name="Attributes.subject" type="string">

<cfparam default="1" name="mailerror" type="numeric">
<link href="../styles/npstyles1.css" rel="stylesheet" type="text/css">

<cftry>
<cflock timeout="8" name="mailer" type="exclusive" >
<cfif thisTag.ExecutionMode is "End">
<!--- as is done manually , open the login page first and from it get the value for VIEWSTATE ---->
<cfhttp url="http://mail.semiprecious.com/Login.aspx" redirect="yes">
</cfhttp>
<!--- <cfoutput>]#cfhttp.FileContent#,#cfhttp.header#,#cfhttp.statuscode#[</cfoutput> --->

<cfset viewstatevala = find('__VIEWSTATE',cfhttp.FileContent)>
<cfset viewstatevala = find('="',cfhttp.FileContent,viewstatevala)>
<cfset viewstatevalb = find('"',cfhttp.FileContent,viewstatevala +3)>
<cfset viewstatevala = mid(cfhttp.FileContent,viewstatevala +2,viewstatevalb - viewstatevala - 2)>

<cfset vala = find('ASP.NET_SessionId',cfhttp.header)>
<cfset vala = find('=',cfhttp.header,vala)>
<cfset valb = find(';',cfhttp.header,vala)>
<cfset valb = mid(cfhttp.header,vala + 1,valb - vala -1)>

<!--- use the asp.sessnion and valuestate to login --->
<cfhttp method="post"  url="http://mail.semiprecious.com/Login.aspx" resolveurl="yes"  redirect="yes"  >
<cfhttpparam name="txtPassword" value="shauda" type="formfield">
<cfhttpparam name="txtUserName" value="nitish@semiprecious.com" type="formfield">
<cfhttpparam type="formfield" name="LanguageList" value="">
 <cfhttpparam name="ASP.NET_SessionId" value="#valb#" type="cookie">
 <cfhttpparam name="settings" value="empty" type="cookie">
<cfhttpparam type="formfield" name="__EVENTTARGET" value="LoginImageButton">
<cfhttpparam type="formfield" name="__EVENTARGUMENT" value="">
<cfhttpparam type="formfield" name="__VIEWSTATE"  value="#viewstatevala#">
</cfhttp>
<cfif Attributes.debug>
<cfoutput>:#viewstatevala#:</cfoutput>
<cfoutput>5#valb#5</cfoutput>

<cfoutput>[#cfhttp.FileContent#,#cfhttp.header#,#cfhttp.statuscode# ]</cfoutput>
</cfif>
<!--- <cfset vala = find('ASP.NET_SessionId',cfhttp.header)>
<cfset vala = find('=',cfhttp.header,vala)>
<cfset valb = find(';',cfhttp.header,vala)>
<cfset valb = mid(cfhttp.header,vala + 1,valb - vala -1)>
<cfoutput>5#valb#5</cfoutput> --->
<!---- now open the message composing page . We have used only the settings cookie and the asp session id , note VIEWSTATE was not 
required --->
<cfhttp method="post"  url="http://mail.semiprecious.com/Main/frmComposeInner.aspx" resolveurl="yes" useragent="MICROSOFT" redirect="yes" >
<cfhttpparam name="ASP.NET_SessionId" value="#valb#" type="cookie">
<cfhttpparam name="settings" value="empty" type="cookie">
</cfhttp>
<cfif Attributes.debug>
<cfoutput>{#cfhttp.FileContent#,#cfhttp.header#,#cfhttp.statuscode#}</cfoutput>
</cfif>
<cfset viewstatevala = find('__VIEWSTATE',cfhttp.FileContent)>
<cfset viewstatevala = find('="',cfhttp.FileContent,viewstatevala)>
<cfset viewstatevalb = find('"',cfhttp.FileContent,viewstatevala + 2)>
<cfset viewstatevala = mid(cfhttp.FileContent,viewstatevala +2,viewstatevalb - viewstatevala - 2)>
<!--- <cfset vala = find('ASP.NET_SessionId',cfhttp.header)>
<cfset vala = find('=',cfhttp.header,vala)>
<cfset valb = find(';',cfhttp.header,vala)>
<cfset valb = mid(cfhttp.header,vala + 1,valb - vala -1)>
 --->
 <!--- pull out the VIEWSTATE value and then along with it pass the content, EVENTTARGET etct to the composer (sender) page --->
<cfhttp url="http://mail.semiprecious.com/Main/frmComposeInner.aspx" redirect="yes" resolveurl="yes" >
<cfhttpparam type="formfield" name="__EVENTTARGET" value="SendImagebutton">
<cfhttpparam type="formfield" name="__EVENTARGUMENT" value="">
<cfhttpparam type="formfield" name="__VIEWSTATE" value="#viewstatevala#">
<cfhttpparam name="ASP.NET_SessionId" value="#valb#" type="cookie">
<cfhttpparam name="settings" value="empty" type="cookie">
<cfhttpparam name="SelectedLanguage" type="cookie" value="">
<cfhttpparam name="sbsearchfolder232" value="" type="formfield">
<cfhttpparam name="sbSearchfield232" value="0"  type="formfield">
<cfhttpparam name="sbSearchtext232" value="" type="formfield">
<cfhttpparam name="txtTo" value="#Attributes.mailto#" type="formfield">

<cfhttpparam name="txtCC" value="#Attributes.ccto#" type="formfield">
<cfhttpparam name="txtBcc" value="" type="formfield">
<cfhttpparam name="txtSubject" value="#Attributes.subject#" type="formfield">
<cfhttpparam name="PlainTextBox1" value="#Attributes.mailcontent#" type="formfield">
</cfhttp>
<cfif Attributes.debug>
<cfoutput>#cfhttp.FileContent#</cfoutput>
</cfif>
<!--- finally log out using the asp session id --->
<cfhttp url="http://mail.semiprecious.com/Logout.aspx" redirect="yes" resolveurl="yes">
<cfhttpparam name="ASP.NET_SessionId" value="#valb#" type="cookie">
<cfhttpparam name="settings" value="empty" type="cookie">
</cfhttp>
<cfif Attributes.debug>
<cfoutput>#cfhttp.FileContent#</cfoutput>
</cfif>
</cfif>

</cflock>
<cfcatch type="any">
<cfset Caller.mailerror = 1>
<cfoutput><br>

      <span class="error1">#cfcatch.Detail# | #cfcatch.Message# | #cfcatch.Type# | </span></cfoutput> 
  </cfcatch>
 </cftry>
 <cfset Caller.mailerror = 0>