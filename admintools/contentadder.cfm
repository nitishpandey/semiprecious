
<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Content Development</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<h1>Content Development -</h1>
<cfparam name="root" default="d:\inetpub\semiprecious">
<cfparam name="pagename" default="">
<cfparam name="filepathandname" default="">
<cfparam name="newname" default="">
<cfparam name="addnewarticle" default="">
<cfparam name="oldpagename" default="">
<cfparam name="METADESCRIPTION" default="">
<cfparam name="keywords" default="">
<cfparam name="DESCRIPTION" default="">
<cfparam name="title" default="">
<cfparam name="linkto" default="">
<cfparam name="linktodisplay" default="">
<a href="contentadder.cfm?addnewarticle=1">CREATE NEW ARTICLE</a> ||| <a href=contenteditsubject.cfm>GO TO ARTICLE ORGANIZER</a> <p>
<cfif addnewarticle is 1>
<!--- Article page maker---> <table><tr><td bgcolor="#FFFF99">
<form name=createarticle action=contentadder.cfm method=post>
Enter folder\pagename to be created: (folder must exist already)
<input type=text name=filepathandname size=60 value="foldername/pagename.cfm">
<b>example: jewelry-articles/filename.cfm  or shaped/pencil-bracelets.cfm or articles/article1.cfm<p></b>
<input type=submit value=create>

</form>
</td></tr></table>
</cfif>
<cfif filepathandname neq "">

<cffile action = "write" 
   file = "#root#\#filepathandname#"    
   output = "<cfinclude template='/jewelry-articles/articlebase.cfm'>">
   
   file made: 	<cfoutput>semiprecious.com\#filepathandname#</cfoutput> <br>
EDIT BELOW:
<cfset pagename=filepathandname>

</cfif>
<!--- End Article Maker--->
<cfif pagename neq "">
		<cfquery name="content" datasource="gemssql">
		Select pagename from contentbypage where pagename ='#pagename#'  and domain ='#cgi.server_name#'
		</cfquery>
		<cfif content.recordcount is 0>
				
				<cfquery name="content" datasource="gemssql">
							insert into contentBypage (title, pagename, domain, metadescription, description, keywords, linkto, linktodisplay)
						Select '#title#', '#pagename#', '#cgi.server_name#', '#left(metadescription,190)#', '#left(description,5000)#', '#left(keywords,100)#', '#linkto#', '#left(linktodisplay,70)#'
				</cfquery>
			
				
		<cfelseif oldpagename neq "" >
		<cftry>
		
		<cfquery name="content" datasource="gemssql">
		update contentBypage  set title='#title#', pagename='#pagename#', metadescription='#metadescription#', description='#left(description,5000)#', keywords='#keywords#', linkto='#linkto#',  linktodisplay='#linktodisplay#'
		from contentbypage where pagename ='#oldpagename#' and domain='#cgi.server_name#'
		</cfquery>
	
		<cfcatch type="any">
		<cfoutput>#cfcatch.Message#: #cfcatch.Detail#:length of text: #len(description)# characters: You were trying to change #oldpagename# to #pagename#. This already exists. Please use CTRL-C to copy your content from below to a note pad for reuse after correction of page name. Do not press 
		browser back button or this content may be lost to cyber space.</cfoutput>
		<cfdump var="#form#" />
		</cfcatch>
		</cftry>
		
		</cfif>		

</cfif>
<cftry>

<cfif pagename is "">
	<cfquery name="contentbypage" datasource="gemssql">
	Select pagename from contentbypage where domain ='#cgi.server_name#'
	</cfquery>
	<cfelse>	
	
	<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='#pagename#' and domain='#cgi.server_name#'
	</cfquery>

</cfif>
		<cfcatch type=database>
		DB error on content adder
		</cfcatch>
		</cftry>

<cfif pagename neq "" or newname neq "">
<cfform name="contentadd" action="contentAdder.cfm" method="post">
<cfoutput>
Page name (after #cgi.server_name#/): <input type='text' size=60 value="<cfif pagename neq "">#pagename#<cfelse>#newname#</cfif>" name='pagename'>  
<br> ------ <a href=/#pagename#>VIEW PAGE</a> ||| <a href="contentadder.cfm">EDIT EXISTING</a> ||| <a href="contentadder.cfm?addnewarticle=1">CREATE NEW ARTICLE</a><p>
<cfif pagename neq ""> <input type='hidden' value='<cfoutput>#pagename#</cfoutput>' name='oldpagename'></cfif>
<br> Long Description for customers (200 words): <cftextarea richtext="yes"  cols="100" rows="50" name='description'>
<cfif pagename neq "">#contentbypage.description#</cfif>
</cftextarea>

<br>Short Description for Meta Tag: <textarea  cols="100" rows="5"  name='metadescription'><cfif pagename neq "">#contentbypage.metadescription#</cfif></textarea>

<br>Title: <input type='text' size="50" value='<cfif pagename neq "">#contentbypage.title#</cfif>' name="title">

<br>Approx. 10 keywords: <input type='text' size="100" value='<cfif pagename neq "">#contentbypage.keywords#</cfif>' name="keywords">
<br>Link From Page: <input type='text' size="100" value='<cfif pagename neq "">#contentbypage.linkto#</cfif>' name="linkto">  
<br />Link Display Text (70 char): <input type='text' size="70" value='<cfif pagename neq "">#contentbypage.linktodisplay#</cfif>' name="linktodisplay">  
</cfoutput>
<input type='submit' value='Add/Update'>


<input type='hidden' name=linkpro value='yes'>
</cfform>
</cfif>
<cfif pagename eq "" and addnewarticle eq "">
	<cfquery name="contentbypage" datasource="gemssql">
	Select pagename, keywords, len(description) as dcount from contentbypage where domain ='#cgi.server_name#' 
	</cfquery>

<cfoutput query="contentBypage">
<a href=contentadder.cfm?pagename=#pagename#>Edit #pagename#</a> --> keyword count #listlen(keywords)#, descCount:#dcount#<cfif dcount lt 100><font color=red><b>!!!!</b></font></cfif> <a href=http://#cgi.server_name#/#pagename#>See Page</a></a><br>
</cfoutput>
</cfif>
</body>
</html>
