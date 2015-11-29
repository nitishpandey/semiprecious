
<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif>
<b> To EDIT A SUBJECT GO HERE;<a href=contenteditsubject.cfm>EDIT</a><b>
<b> To assign any page to subject(s):<a href=contentorganize.cfm>Organize</a><b>
<p>
<cfparam name=subject default="">
<cfparam name=lan default="english">
<cfparam name=domain default="www.semiprecious.com">
<cfset domain=cgi.server_name>


<form name=makesubject action=contentmakesubject.cfm>

Create a Subject: <input type=text name=subject value="" size=30><br>
Language:  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<input type=text name=lan value="English" size=30>


<input type=submit value=Create name=submit>

</form>
Subject will be added to domain: <cfoutput>#cgi.server_name#</cfoutput>
<cfif subject neq "">
<cfquery datasource="gemssql" name="addsubject">
insert into contentTopics (subject, language, domain) select '#subject#' , '#lan#', '#domain#'
</cfquery>
</cfif>