
<table class="horizmenu"  style="margin-top:5px;border:0px solid blue;padding:2px;" border="0" >
<tr>
<Td>
<div style="text-align:Center; display:block; text-transform:capitalize; color:black; left: 430px; top: 130px; height: 26px;background-image:url('images/thoughtcurtains.jpg');"><cfoutput>
  <div align="left" style="padding:2px;border:black 0px solid;background-color:##ff8040;color:white;">
	<span class=""> &nbsp;<b>Email:</b> <span style="text-transform:lowercase">#session.client.email#</span></span>&nbsp;| <b>Phone:</b> <cfset args.id = #session.client.id# /><cfinvoke component="admin" method="getemployerdetails" returnvariable="empq" argumentcollection="#args#"  /> <cfif empq.recordcount GT 0 >#empq.phone# | <b>Company:</b> 	#empq.company#</cfif> |        <b>Resume Download Activated:</b> <cfif session.client.paid> <span class="alert">Yes</a> <cfelse><span class="red" style="background:white;padding:1px;">No</span> </cfif> 
	</div> 
</cfoutput></div>
  <div style="background-image:url('images/thoughtcurtains.jpg');text-align:Center; display:block; text-transform:capitalize; color:blue; left: 350px; top: 130px; height: 26px;">
  <div align="left" style="padding:2px;border:black 0px solid;background-color:#FFFFFF">
	 <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=brochure">Batch Brochures</a> |  <cfif isdefined("session.client.lastviewedprofile")>
    <a href='http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=viewprofile&email=<cfoutput>#session.client.lastviewedprofile#</cfoutput>'>Previous
     Viewed Profile</a> |
   </cfif>
   <a href="retired_defence_resumes.cfm?controlvariable=signout" class="red"></a><a href='http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=newopening'>Add a Job
  Opening</a>&nbsp;|&nbsp;<a href='javascript:http("ajaxdest=mainbody&controlvariable=listmyopenings")'>List
   Open Jobs</a>&nbsp;|&nbsp;<a href='javascript:http("ajaxdest=mainbody&controlvariable=listmyclosedopenings")'>List
   Closed Jobs</a>&nbsp;<!-- |&nbsp;<a href='http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=listapplicants'>List Applicants</a>-->&nbsp; | 
 <a href="http://www.forcesofindia.com/headhunting/feed/rss_updated_defence_members.xml"><img src="images/rss.gif" style="background-color:orange;margin-bottom:2px;" width="16px" border=0 align="absmiddle" /> RSS (Latest Member Updates)</a>  
|   <a href="retired_defence_resumes.cfm?controlvariable=signout" class="red"><img src="images/strike.png" alt="map your home on Google Maps" vspace=0 border="0" align="absmiddle" width="16" /></a></div></div>
	 </td>

</tr>
<tr><td ><div style="text-align:Center; display:block; background-image:url('images/thoughtcurtains.jpg');text-transform:capitalize; color:blue; left: 350px; top: 130px; height: 26px;">
  <div align="left" style="padding:2px;border:black 0px solid;background-color:#008000">
	<span > <img src="images/searchglass.gif" alt="search" vspace=0 border="0" align="absmiddle" width="12" />  &nbsp;
<!---	<form style="display:inline" action="http://www.forcesofindia.com/headhunting/sa.cfm?cv=veritysearch" id="cse-search-box">
<input type="hidden" name="cx" value="partner-pub-1173216686849683:brbmp7-az4s" />
    <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="ISO-8859-1" />
<!--- use q instead of criteria if you want to use Google Search
    <input type="text" name="q" size="30" /> --->
	<input type="text" name="criteria" size="30" />
	
    <input type="submit" name="sa" value="Search" />
    
  <input type="hidden" name="controlvariable"  value="Search" />

</form> --->
<cfinclude template="minisearchform.htm" />
	  <cfif isdefined("session.idlist")>  &nbsp; &nbsp;    <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=listing"><span style="color:white;text-decoration:none;">Last List</span></a>&nbsp;
<cfelse>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.forcesofindia.com/headhunting/defence_jobs.cfm?cv=searchnow&insti=all" style="color:white;text-decoration:none;">Active Members' List</a>
   </cfif>
 </div></div>
	</span></td></tr>
</table> 