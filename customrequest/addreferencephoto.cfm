<html>
<head>
<title>URL ADDED</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfif form.type eq 'sp'>
<cfquery datasource="semiprecious" name="t" >
select cat from items where newitem = #form.id#
</cfquery>
<cfset form.url = 'http://www.semiprecious.com/images/#t.cat#/thumb/#form.id#.jpg'>
</cfif>
<cfquery datasource="sptm" name="nitish" password="rangeela">
insert into customrequestimages (reqid,type,url) values ('#session.customrequestid#','#form.type#','#form.url#')
</cfquery>
URL/Id added succesfully.
<br>
If you want to add more images :<a href="customrequestimageadderform.cfm">Back To Image Adding Form</a><br>
If not then close this window and refresh(reload) the main page.

</body>
</html>
