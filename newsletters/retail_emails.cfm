<cfif session.mail is "nitishpandey@indiatimes.com">
<html xml:lang="en" dir="ltr">
<head>
<title>Keep out</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


</head>
<body>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="bbs">
select email from bulkbuyers </cfquery>

<CFQUERY DATASOURCE="semiprecious" NAME="login">
SELECT lastname, nlstatus, firstname, email, address1, address2, city, state, zip, country, phonenumber, earned
FROM memberinfo
</CFQUERY>
<cfoutput>#bbs.recorcount#</cfoutput>

<cfquery dbtype="query" name="retailEmails"> 
Select email from login where email not in (select email from bulkbuyers)
</cfquery>

<cfoutput>#retailemails.recorcount#</cfoutput>


</body>
</html>
</cfif>