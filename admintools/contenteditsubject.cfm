
<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif>

<cfparam name=subjectedit default="">
<cfparam name=lan default="english">
<cfparam name=submitted default="no">
<cfparam name=smalldescription default="">
<cfparam name=description default="">
<cfparam name=keywords default="">

<b>1. CREATE A SUBJECT - <a href=contentmakesubject.cfm>MAKE SUBJECT</a><b> || <a href=contentadder.cfm>Article Maker</a><p>



<p><b>2. EXISTING SUBJECT LIST, CLICK TO EDIT</b><p>
<cftry>
	  <cfquery datasource="gemssql" name="subjectlist">
	  Select  subject from contenttopics where language='English' order by subject
	  </cfquery>
	  
	  <cfoutput query="subjectlist"><a href='contenteditsubject.cfm?subjectedit=#subject#'>#subject#</a> || </cfoutput>


<cfif subjectedit neq ""> <!--- edit--->

<cfquery datasource="gemssql" name="subjectlist">
	  Select  subject from contenttopics where subject <>'#subjectedit#' and language='English' order by subject
	  </cfquery>
	  
     <cfif submitted is "yes"> <!--- if form submitted with edits --->
	 
        <cfquery datasource="gemssql" name="addsubject">
        update contentTopics set keywords='#keywords#', smalldescription= '#smalldescription#', description
        ='#description#' where subject='#subjectedit#' 	
        </cfquery>

	
		<cfif subjectparent neq "">
			  	<cfquery datasource="gemssql" name="addsubject">
        		insert into contenttree (subject, subjectparent) select '#subject#', '#subjectparent#' </cfquery>
		
		</cfif>
		

     </cfif>
<!---	 edits then displays below--->
<cfquery datasource="gemssql" name="addsubject">
Select  keywords, smalldescription, description  from contentTopics 
where subject ='#subjectedit#' 
</cfquery>

<cfquery datasource="gemssql" name="subjectparents">
Select  subjectparent from contenttree where subject='#subjectedit#'   order by subjectparent
</cfquery>

   <cfquery datasource="gemssql" name="viewsubject">
        select  * from dbo.contenttopics where subject='#subjectedit#' 
        </cfquery>


<p><b>Editing <cfoutput>#subjectedit#</cfoutput></b><br>
<form name=editsubject action=contenteditsubject.cfm method=post>
<input type=hidden name=subject value="<cfoutput>#subjectedit#</cfoutput>">
<input type=hidden name=subjectedit value="<cfoutput>#subjectedit#</cfoutput>">
<input type=hidden name=domain value="<cfoutput>#cgi.server_name#</cfoutput>">

Keywords: (10 keywords) <input type=text name=keywords value="<cfoutput>#viewsubject.keywords#</cfoutput>" size=100><br>
Summary (also for meta tag): <br><textarea rows=3 cols=30 name=smalldescription><cfoutput>#viewsubject.smalldescription#</cfoutput></textarea><br>
Description (can be short or none, articles will list under the subject)<br>
<textarea rows=10 cols=100 name=description ><cfoutput>#viewsubject.description#</cfoutput></textarea><p>
Subject is also shown under following subjects:<font color=blue><cfoutput query=subjectparents>#subjectparent#,</cfoutput></font><p>
<p>
Also Show this Under:

<select name=subjectparent>
<option selected value=></option>
<cfoutput query="subjectlist">
<option value=#subject#>#subject#</option>
</cfoutput>
</select>

<input type=submit value=UPDATE name=submit>
<input type=hidden name=submitted value="yes">


</form>
</cfif> <!--- edit --->

<p><b>3. <a href=contentorganize.cfm>ORGANIZE ARTICLES UNDER SUBJECTS</a><b

<cfcatch type="any">
Sorry error
</cfcatch>
</cftry>