<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tell A Friend about Cool Stuff</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfparam name="friendsemail" default="">
<cfparam name="item" default="">
<cfparam name="page" default="">

<body>
<cfif friendsemail is "">
<form action="tellafriend.cfm" method="post">
<input type="text" name="page" value="<cfoutput>#cgi.server_name#/<cfif cgi.server_name contains 'handmadelaptop'>laptopbags/laptopcase.cfm<cfelse>detail.cfm</cfif>?newitem=#item#</cfoutput>">
Friends Email:<input type="text" name="friendsemail" size=20 value="email here"><br>
Your Email:<input type="text" name="senderemail" size=20 value="your email">
Your name:<input type="text" name="sendername" size=10 value="your name">
<input type="hidden" name="item" value="<cfoutput>#item#</cfoutput>">
<input type="submit" value="Send2Friend and back to Item">
</form>
<cfelse>
<cfmail to="#friendsemail#"  bcc="cs@semiprecious.com" server="mail23.webcontrolcenter.com" subject="Cool Item Refered by #sendername#" from="service@semiprecious.com"
 type="html" >
Hey,<p>

I found this cool product online, click this link to check it out:<br>
#page#
 
 <p>
 #sendername#
 
</cfmail>
		 <cfif cgi.server_name contains 'handmadelaptop'>
            <cflocation addtoken="no" url="http://#cgi.server_name#/laptopbags/laptop-case.cfm?newitem=#item#">
            <cfelse>
            <cflocation addtoken="no" url="http://#cgi.server_name#/detail.cfm?newitem=#item#">
	</cfif>
</cfif>

</body>
</html>
