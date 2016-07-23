<html>
<head>
<title>Your Custom Jewelry Request</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfparam name="form.email" default="NA" type="string"><cfparam name="form.phone" default="na" type="string"><cfparam name="form.fax" default="na" type="string">
<cfparam name="form.country" default="na" type="string">
<cfparam name="form.description" default="na" type="string">
<cfquery datasource="semiprecious" >
insert into customrequest (reqid,name,email,phone,fax,description,country) values ('#session.customrequestid#',
'#form.name#',
'#form.email#',
'#form.phone#',
'#form.description#',
'#form.country#'
)

</cfquery>
<cfset session.customrequestid = 0>
</body>
</html>
