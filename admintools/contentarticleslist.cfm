<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>List of Articles</title>
</head>

<body>
<a href=contenteditsubject.cfm>GO TO CONTENT ADMIN</a>
<p>
<cfquery datasource="gemssql" name="pagelist">
Select pagename from contentbypage   where domain='#cgi.server_name#' and pagename like '%article%'
</cfquery>

<form name=organize action=/jewelry-articles/knowledge.cfm method=get>

View All Articles: 

			 <cfoutput query=pagelist><a href=/#pagename#>#pagename#</a><br></cfoutput>
		


</body>
</html>
