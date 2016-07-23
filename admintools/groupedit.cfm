<cfif session.mail neq application.admin_email>Not permitted, ghar ki site samajh rakhhi hai?<cfabort></cfif>
<cfparam name=updategroup default="">
<cfparam name=cat default="">
<cfparam name=grouping default="">
<cfparam name=sequence default="0">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Edit Groups</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfif cgi.server_name contains "semiprecious" or (cgi.server_name contains 'wholsale-' and session.mail is application.admin_email)>
<cfparam name="cat" default="">
<cfparam name="grouping" default="">

<cfif cat eq "" and grouping neq "">
<h2><font color="red">YOU DID NOT SELECT THE CATEGORY! SMOKING WEED??</font></h2></cfif>
<cftry>
<cfquery name=groupnow datasource="gemssql">
select  description, hubsequence from groupings where cat='#cat#' and groupname='#grouping#' and domain='#cgi.server_name#'
</cfquery>
	<cfcatch type="database">
	ooops call us or email us to notify of error
	</cfcatch>
	</cftry>

<cfif updategroup neq "">

<cftry>
<cfquery name=x datasource="gemssql">
update groupings set  description='#description#' , hubsequence=#sequence# where cat='#cat#' and groupname='#grouping#' and domain='#cgi.server_name#'
</cfquery>
	<cfcatch type="database">
	ooops call us or email us to notify of error
	</cfcatch>
	</cftry>
<cftry>
<cfquery name=groupnow datasource="gemssql">
select  description, hubsequence from groupings where cat='#cat#' and groupname='#grouping#' and domain='#cgi.server_name#'
</cfquery>
	<cfcatch type="database">
	ooops call us or email us to notify of error
	</cfcatch>
	</cftry>
</cfif>

<h3><cfoutput>#Cat# - #grouping#</cfoutput> updated!</h3>

<p>
Edit THIS GROUP/THEME
<p>
<form name=grouping action="groupedit.cfm" method="post" onSubmit="return false">
<cfoutput> Category: <input type=text name=cat value=#cat# >
<br>Theme: <input type=text name=grouping value=#grouping#  >
<br>
Sequence: <input type=text name=sequence value=#groupnow.hubsequence#  ><br>
Description:<br>
<textarea name="description" cols="90" rows="8" >#groupnow.description#</textarea><br><br>
<input type="hidden" name="updategroup" value="yes">
<input type="button" value="UPDATE GROUPING" onClick="document.grouping.submit()"><br>
</cfoutput>
</form>
</cfif>
<a href="http://www.semiprecious.com">Return to main page</a>
</body>
</html>
