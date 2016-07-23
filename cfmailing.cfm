<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfparam  default="necklaces" name="url.cat">
<cfparam  default="0" name="url.newitem">
<cfparam default="Good Description" name="url.description">
<cfif isdefined("form.emailid")>
<cfif isdefined("session.mail")>
<Cfset sender = session.mail>
<cfelse><br>
<cfset sender = form.name>
</cfif>
<CFMAIL TO="#form.emailid#"
FROM="anup@semiprecious.com"
CC="nitishpandey@rediffmail.com"
SUBJECT="#form.name#"
Type="html"

port="25"
SERVER="mail23.webcontrolcenter.com"
TIMEOUT="20">
#sender# found the this jewelry very nice. It is #urldecode(form.description)#. 
 <br />You can paste this text 'http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' in your
	  browser's address bar if you are not seeing the picture below <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'><img src='http://www.semiprecious.com/images/#form.cat#/thumb/#form.newitem#.jpg' alt='Click to Zoom'></a><br /></a><b> or</b> <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'>click here</a> .">
</CFMAIL>
<CFMAIL TO="#form.emailid#"
FROM="anup@semiprecious.com"
CC="nitishpandey@rediffmail.com"
SUBJECT="#form.name#"
Type="html"

port="25"
SERVER="mail23.webcontrolcenter.com"
TIMEOUT="20">
#sender# found the this jewelry very nice. It is #urldecode(form.description)#. 
 <br />You can paste this text 'http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' in your
	  browser's address bar if you are not seeing the picture below <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'><img src='http://www.semiprecious.com/images/#form.cat#/thumb/#form.newitem#.jpg' alt='Click to Zoom'></a><br /></a><b> or</b> <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'>click here</a> .">
</CFMAIL>
<!--- 
<cflocation addtoken="yes" url="detail.cfm/#form.newitem#.htm">

 --->
 <CFMAIL TO="#form.emailid#"
FROM="anup@semiprecious.com"
CC="nitishpandey@rediffmail.com"
SUBJECT="#form.name#"
Type="html"

port="25"
SERVER="mail23.webcontrolcenter.com"
TIMEOUT="20">
#sender# found the this jewelry very nice. It is #urldecode(form.description)#. 
 <br />You can paste this text 'http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' in your
	  browser's address bar if you are not seeing the picture below <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'><img src='http://www.semiprecious.com/images/#form.cat#/thumb/#form.newitem#.jpg' alt='Click to Zoom'></a><br /></a><b> or</b> <a href='http://www.semiprecious.com/detail.cfm/#form.newitem#.htm' target='_sp'>click here</a> .">
</CFMAIL>

 <cfelse>
<cfoutput>
<form action="" method="post">
Name :<input name="name" value="">
Emailid :<input name="emailid" value="">
<input type="hidden" value="#urlencodedformat(url.description)#" name="description">
<input type="hidden" value="#url.newitem#" name="newitem">
<input type="hidden" value="#url.cat#" name="cat">

<input type="submit">
</form>
</cfoutput>
</cfif>
</body>
</html>
