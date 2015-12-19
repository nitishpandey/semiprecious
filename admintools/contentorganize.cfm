<cfparam name=page default="">
<cfparam name=folder default="">
<a href=contenteditsubject.cfm>GO TO CONTENT ADMIN</a>
<p>

<h2>Organize your articles under as many subjects as you want:</h2>
<cfif page neq "">

<font color=red><cfoutput>#page# assigned to #subject#</cfoutput></font>

    <cfquery datasource="gemssql" name="subjectlist">
    insert into contentpagebysubject (subject, pagename, domain) select   '#subject#', '#page#', '#cgi.server_name#'
    </cfquery>
</cfif>

<cfquery datasource="gemssql" name="subjectlist">
Select   subject from contenttopics order by subject
</cfquery>



<cfquery datasource="gemssql" name="pagelist">
Select pagename from contentbypage   where domain='#cgi.server_name#' and pagename like '%#folder#%'
</cfquery>

<form name=organize action=contentorganize.cfm method=post>
<cfif folder is "">
 <cfdirectory directory="c:/inetpub/wwwroot/semiprecious/knowledge" name="dirQuery" action="LIST">
Select Folder:<select name="folder">
	   		 <option value="" "selected">Select Folder</option>
			 <cfloop query="dirquery">
			 		 <cfif dirQuery.type IS "dir"><cfoutput><option value="#dirquery.name#">
					 #dirquery.name#</option></cfoutput></cfif>
				</cfloop>
				</select>
			 
			 
			
<cfelse>
<font size=+1 color=darkgreen>You are now organizing files in: folder <cfoutput><b>#folder#</b></cfoutput></font><br>
<table><tr><td valign=top>
Assign Article: <select name="page">
	   		 <option value="" selected>Select Page</option>
			 <cfoutput query=pagelist><option value="#pagename#">#pagename#</option></cfoutput>
			 </select>
</td><td align=right valign=top>
&nbsp;&nbsp;&nbsp;&nbsp;<b>To</b>: <select name="subject">
	   		 <option value="" selected>Select Subject</option>
			 <cfoutput query=subjectlist><option value="#subject#">#subject#</option></cfoutput>
			 </select><br>
			 <a href=contentmakesubject.cfm>Add Subject</a>	 </td></tr>
		</table>
</cfif>
<input type='submit' name=submit>
</form>