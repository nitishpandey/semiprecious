<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cftry>
<cfpop action="getall"    port="110" server="mail.semiprecious.com" username="nitish@semiprecious.com" password="shauda" maxrows="15" name="mails" />
<cfdump var="#mails#" /><cfcatch type="any"><cfoutput>#cfcatch.Detail#,nitish, shaurya,mail.se...</cfoutput></cfcatch></cftry>
<!--- <cfloop query="mails">
<cfif  find('semiprecious.com',subject)>
<cfif find('@',from)>
</cfif>
</cfif>
</cfloop>
 --->

</body>
</html>
