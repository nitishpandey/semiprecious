<cfcomponent displayname="interfacegenerator" >
    <cffunction access="remote" name="action"   output="true" returntype="any" >
      <cfparam default="" name="arguments.code" type="string" />
	    <cfparam default="" name="session.viewstate.cv" type="string" />
	<cfparam default="" name="keywords" />
	<cfparam  name="title" default="Indian Resumes and defence forces community Network for careers" />
	<cfparam name="description" default="Enabling  armed forces retired officers and PBOR (Sailors, soldiers, airmen) to build a network for professional support. Get employment in the corporate or private companies. (ex-defence officers of india that is army, navy, indian airforce). Consultants and coporates in india and abroad to do head hunting from retired officers of indian airforce, navy or the army. Members have 5 to 30 years of unmatched expeirience in varied professional fields and many have done a MBA like  program from institutes like IIM or MDI etc." />

	 <cfsavecontent variable="mainbody">
     <span id="mainbody">
	     <span id="content" >	
     <cfif isdefined("request.ajax") and (request.ajax is true) >
	 	  <cfif isdefined("request.ajaxnavigate")>
		 	  <cfset nav = "true">
	 	  <cfelse>
		 	  <cfset nav = "false" />
	 	  </cfif>
	      <destination navigate="#nav#">#request.destination#</destination>
    <![CDATA[
	  <cfelse>		 <!--- if it is not a ajax request --->
	  	   <cfset request.destination ="mainbody" />
	  </cfif>

   <cfif request.destination is "mainbody" and isdefined("session.client.type")>
	 <cfif len(session.client.type) GTE 3 >
	    <!--- we need to re-create appropriate menu because the main body carries the applicant and employer menu in addition to the bottom content --->
	    <table width="740px" >
				<tr><Td align="center"  >
				<cftry>
			         <cfinclude template="#session.client.type#menu.cfm" />
             <cfcatch type="any">&nbsp;
<!---        <cfoutput>#cfcatch.message#</cfoutput> --->
				   </cfcatch>
        </cftry> 

</Td></tr>

</table>
</cfif>

</cfif>


 <cfif isdefined("arguments.msg") and len(arguments.msg)>
	<cfparam default="1" type="string" name="arguments.success" />
	<cfif arguments.success >
		<cfset class = 'success' />
	<cfelse>
		<cfset class ='error1' />
	</cfif>
	<div style="margin-top:4px;padding:2px;"><div class="#class#"><div align="center">#arguments.msg#</div></div></div>
 </cfif> 

<cfif isdefined("session.viewstate.cv")>
<cfif isdefined("session.viewstate.descriptiong")>
	<cfoutput><a href="defence_jobs.cfm?cv=#session.viewstate.cv#">#session.viewstate.cv#</a></cfoutput>
</cfif></cfif>
<cfswitch expression="#arguments.code#" >
<cfcase value="mailresumes" >
#arguments.count# resumes mailed 
</cfcase>
<cfcase value="getpassword">
<Cfif arguments.queryresult.recordcount GT 0>
	<cfdump var="#arguments.queryresult#" />
	<cfoutput query="arguments.queryresult">
	#id#, #email#, #password#,#phone# 
	<cfset toencrypt = foiid /> 
	<cfinclude template="siteadmin/encryptfoiid.cfm" />
	<a href="defence_jobs.cfm?cv=signin&email=#email#&encid=#toencrypt#">#id#</a>
<!---
 ---><br />
	</cfoutput>
<cfelse>
	No records to display.
</cfif>
<a href="http://www.forcesofindia.com/headhunting/siteadmin/index.htm">Back to admin</a> 
</cfcase>
   		 		<cfcase value="showDOnotes">
								<cfmodule  template="showdonotes.cfm"  id="#arguments.id#" typeofnote="open" />
			  </cfcase>
<cfcase value="applicantmenu">
<cfset title = "Tools For Indian Defence Personnell For Professional Networking for career and growth" />
<cfset description="Forces of India is the niche networking platform for you to share and reach out to the fraternity for all kinds of social betterment. It could rang from matrimony to job hunt to a booking in a mess in Phatankot.">	
<cfinclude template="applicantmenu.cfm" />
<!--- /#session.viewstate.applicantmenu#.cfm" /> --->
</cfcase>
<cfcase value="6pccandle">
<cfinclude template="6pccandle.cfm" />
</cfcase>
<cfcase value="iimidr2">
<cfinclude template="iimindorelanding.cfm" />
</cfcase>
<cfcase value="mdi7">
<cfinclude template="mdi7brochurepage.htm" />
</cfcase>    

 <cfcase value="listmyopenings,listmyclosedopenings">
<!---
 <cfdump var="#arguments.grid#" />
--->
	 <cfif arguments.grid.recordcount GT 0>
	    <cfset title = "Jobs &amp; Careers for Ex Defence Personnel " />
        <cfset i = 0 />
       <div style="border: 0px 2px ##CCFFFF ridge;margin:2px;" align="center">
	
      <table><tbody><thead class="tableheading"><th>Status</th><th>Date</th><th>Description</th><th>Locations</th><th>Applicants</th></thead>
     <cfoutput query="arguments.grid">
		<cfquery name="mapped" datasource="sptm"  username="nitish" password="rangeela" >
		select * from mapping where tablecolumn = "opening_location" and targetid = #id#
		</cfquery>
		
		<tr  ><td valign="top" >
		<cfif len(closedon)><span class="redattention">Closed</span>
         <cfelse>
	     	<a href="switch.cfc?controlvariable=closeanopening&id=#id#&method=action"   title="Click to close the opening." >Close?</a>
		 </cfif>
		</td>
		<td valign="top"  ><strong style="background-color:yellow"><cfswitch expression="#jobtype#"><cfcase value="PT">Part Time</cfcase>
		<cfdefaultcase>Full Time</cfdefaultcase></cfswitch></strong><br />
		[#shortdescription#]<br />
		&nbsp;<span class="sidebarheader" >#datepart("d",postedon)#/#datepart("m",postedon)#/#datepart("yyyy",postedon)#</span></td><td>#jobdescription#</td><td>#locations#<cfif mapped.recordcount><br />[<a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=gmaplocation&amp;targettype=opening_location&amp;targetid=#id#&amp;backcv=listopenings" class="orangeheading">On Map</a>]</cfif></td><td><cfif applicants><a href="retired_defence_resumes.cfm?controlvariable=showapplicants&od=#id#&sd=#urlencodedformat(shortdescription)#">#applicants#</a><cfelse>Nil</cfif></td></tr>
		</cfoutput>
		</tbody>
		</table>
		</div>
<cfelse>
		<br />	<cfif arguments.code is "listmyopenings">
			
			
				<span class="error1">No job openings posted by you yet -	<a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=newopening">Add one now</a>
				
				</span>
			<cfelse>
				<span class="error1">None Found</span>
			</cfif>	 
</cfif>
<br />
<br />
<cfset session.viewstate.cv = "listmyopenings" />
</cfcase>
<cfcase value="brochurelist">
<cfset title="brochures of General Management Programmes For Defence Officers" />
  <cfinclude template="brochurelist.cfm" />
  <cfset session.viewstate.cv = "brochurelist" />
</cfcase>
<cfcase value="brochurelisting">
<cfset title="brochures of General Management Programmes For Defence Officers" />
  <cfinclude template="brochurelisting.cfm" />
  <cfset session.viewstate.cv = "brochurelisting" />
</cfcase>
<cfcase value="listopenings">

	 <cftry>
	 <cfif not isdefined("arguments.grid")>
	 <cfif isdefined("session.viewstate.grid")>
	 <cfset arguments.grid = session.viewstate.grid />
	 <cfelse>
	 ...
	 <cfreturn />
	 </cfif>
	 </cfif>
	 <cfif arguments.grid.recordcount GT 0>

<cfset title = "Employment Opportunities For The Defence Personnel" />
<cfset i = 0 />
<cfif not isdefined('session.ad')>
	<table cellspacing="0" style="width: 330px;" class="theform"><tbody><tr>     <td class="formheading" colspan="2">Discount  For Members Only </td>
          </tr>
          <tr>
      <td colspan="2" style="color:red;">Great Prices! + 20% Discount</td>
    </tr> <tr>
            <td class="attention">Store:</td>
						
            <td><a href="http://www.semiprecious.in">http://www.semiprecious.in</a>
            </td>
          </tr>
      		  
          <!-- <tr>
            <td>Account:</td>
            <td ><select name="clienttype" id="clienttype"><option value="applicant" selected>Applicant</option><option value="employer">Employer</option></select>&nbsp;            </td>
          </tr> -->    
					<tr>
                <td class="attention">Coupon:</td> 
                <td>
		    						foifauji30
                </td>
             </tr>
          
          <tr>
            <td align="center" colspan="2" style="background-color:black;color:white;">Real Silver, Real Stones
            </td>
          </tr>
					</tbody></table>
<cfset session.ad = 1>
</cfif>
<strong>Note:</strong> Clicking on "Apply" dispatches your resume to the concerned person.

<table style="margin-bottom:30px"><tbody><thead class="tableheading"><th>Description</th><th> Requirements</th> </thead>
<cfoutput query="arguments.grid">
<cfquery name="mapped" datasource="sptm"  username="nitish" password="rangeela" >
select * from mapping where tablecolumn = "opening_location" and targetid = #id#
</cfquery>

<cfset i = i + 1 />
<cfif usertype is 'employer' >
<tr > 
<cfelse>
<tr class="dull">
</cfif>
<td valign="top" >
<strong style="background-color:yellow">
</strong><strong>[</strong><span class="subtitle">#shortdescription#</span><strong>]</strong><cfswitch expression="#jobtype#"><cfcase value="PT">Part Time (Probably good for home makers & grown up children)</cfcase>
<cfdefaultcase>Full Time</cfdefaultcase></cfswitch><br />
&nbsp;&nbsp;&nbsp;#jobdescription# <br />
<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.forcesofindia.com%2Fheadhunting%2Fretired_defence_resumes.cfm%3Fcontrolvariable%3Dapplyforjob%26od%3D#id#%26sd%3D#urlencodedformat(shortdescription)#&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:20px;" allowTransparency="true"></iframe>
<span class="rightsidebar" >Date Posted:#datepart("d",postedon)#/#datepart("m",postedon)#/#datepart("yyyy",postedon)#</span></td>
<td ><u>Location:</u>#locations# <cfif mapped.recordcount><br /><a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=gmaplocation&amp;targettype=opening_location&amp;targetid=#id#&amp;backcv=listopenings" class="orangeheading">On Map</a></cfif><br />
<Div style="text-decoration:underline;display:inline ">Required:</div>#required#<br /><div style="text-decoration:underline;display:inline ">Desired:</div>#desired#
<br /><u>Age:</u> #agebracket#
<br />
<div style="border:1px blue ridge;background-color:##DDD;padding-left:40px;padding-right:2px;">
<cfif isdefined("session.client.resume")>
  <cfif session.client.resume is 'y'>
   <a href="retired_defence_resumes.cfm?controlvariable=applyforjob&od=#id#&sd=#urlencodedformat(shortdescription)#" title="click to apply for the opening" >Apply</a>
   <br />
   <cfif hasdescdoc is "Y">
   <a href="http://www.forcesofindia.com/headhunting/resources/openings/#id#/#id#.doc"><img src="images/paperclip.gif" alt="Download job description" border="0" />Details</a>
   </cfif>
<cfelse>
  <cfif session.client.profile is "N">
  <a href="defence_jobs.cfm?cv=vp"onClick="javascript:alert('Please create your profile first...');return true;"><span style="redattention">Apply</span></a>
	<cfelse>
  <a href="defence_jobs.cfm?cv=resume" onClick="javascript:alert('Need to upload CV first...');return true;"><span style="redattention">Apply</span></a>
	</cfif>
</cfif>
<cfelse>
  <a href="defence_jobs.cfm?cv=loginform";" onClick="alert('Please Log in');return true;"><span style="redattention">Apply</span></a>
</cfif>
</div>
</td></tr>
</cfoutput>
</tbody>
</table>
<div style="display:inline;margin-left:10px;margin-right:10px;margin-top:30px;" class="dull"><strong>Jobs with this color background indicate that they have been posted by a FOI member</strong></div>.
<cfif session.client.type is "applicant">
<div align=center class=success style=margin:20px; >
You too can <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?controlvariable=newopening">add a job opening</a> and support the network!   
</div>
</cfif>
<cfset session.viewstate.cv = "listopenings" />
<cfset session.viewstate.grid = arguments.grid />
<cfset session.viewstate.description="Back to Job Listing" />
<cfelse>
...
</cfif>
<cfcatch type="any">
<cfthrow />
</cfcatch>
</cftry>
</cfcase>
<cfcase value="appliedlisting">
<cfset title = "Your Applied Jobs History" />
<cfset i = 0 />
<div>
<cfif arguments.grid.recordcount GT 0>
<table style="margin:20 2;border:1px black ridge">
<tbody><thead class="tableheading"><th>Type:Date<br />Description</th><th>Location(s)</th><th>Skill Set</th><th>Age Bracket</th><th>Status</th></thead>
<cfoutput query="arguments.grid">
<cftry>
<cfset i = i + 1 />
<tr><td valign="top"  >
<strong style="background-color:yellow"><cfswitch expression="#jobtype#"><cfcase value="PT">Part Time</cfcase>
<cfdefaultcase>Full Time</cfdefaultcase></cfswitch></strong><br />
[#shortdescription#]<br />
&nbsp;<span class="sidebarheader">#datepart("d",postedon)#/#datepart("m",postedon)#/#datepart("yyyy",postedon)#</span><br />#jobdescription#</td>
<td>#locations#</td>
<td><span style="text-decoration:underline ">Required</span>:#required#<br /><span style="text-decoration:underline ">Desired</span>: #desired#</td>

<td>#agebracket#</td><td valign="top"><cfif len(closedon)>Closed<cfelse>Open</cfif></td>
</tr>
<cfcatch type="expression"><cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput></cfcatch></cftry>
</cfoutput>
</tbody>
</table>
<cfelse>
You have not applied for any opening so far.
</cfif>
</div>

</cfcase>
<cfcase value="newopening">
<cfif isdefined("session.client.email")>
<cfif len(session.client.email) GT 8>
<cfset session.viewstate.Cv = "newopening" />
<!--- do some logic with prevview --->

<cfset title = "Add a New Job Opening" />
<div>

<cfinclude template="postopening.cfm" />
</div>
<cfelse>
<div class="error"> Please log in again </div>
<cfinclude template="welcome.cfm" />

</cfif>

<cfelse>
<div class="error"> Please log in again </div>
<cfinclude template="welcome.cfm" />

</cfif>
</cfcase>
<cfcase value="edrc">
<div style=margin:20px;>
<cfinclude template="rankandcontact.cfm" />
</div>
</cfcase>
<cfcase value="iimi">
<cfset title = "IIM(Indore)" />
<cfinclude template="iimi.cfm" />
</cfcase>
<cfcase value="mdi20071st">
<cfset title = "MDI (Gurgaon)" />
<cfinclude template="mdi20071st.cfm" />
</cfcase>
<cfcase value="veritysearch">
<cfset title ="Search Database - Using Verity!" />
<cfinclude template="verityresults.cfm" />
</cfcase>
<cfcase value="dgrforms">
<!--- since this is a simple, small & static content we will keep it inline --->
<div STYLE="MARGIN-TOP:20PX;maRGIN-bottom:40px">
<h3>DGR Registration & Security Service Agency Empanelment</h3>
<span text-align:"left"><div align="justify">
On retirement officers & PBORs are advised to register with the DGR. A large number of employer and consultants do approach DGR for this registration database to pick out potential employees and partners. Also we have the concept of empanelment in the security service agencies. Go ahead and download the forms attached below and complete the formalities. Please note that the forms are very simple and may require some to be on stamp papers.
</div></span>
<ul><Li>
<cfif session.client.type is "applicant">
Click here to download <a href="http://wwww.forcesofindia.com/headhunting/dgr_forms_registration_officers.zip">DGR Registration Forms</a>
<cfelse>
Click here to download <a href="##" onClick="javascript:alert('Only available to Fauji Members');">DGR Registration Forms</a>

</cfif>
</li></ul>
</div>
</cfcase>
<cfcase value="companies">
<br />
<cfset title ="- Indian Companies  -" />
<div style="border: 0px 2px ##CCFFFF ridge;margin-left:8px;margin-top:10px;padding:10px;">
<cfinclude template="companies.cfm" />
</div>

</cfcase>
<cfcase value="resumemailform">

<cfinclude template="mailresumeform.cfm" />
</cfcase>
<cfcase value="payment">
<cfset amount = arguments.amount />
<cfset item  = arguments.item />
<cfinclude template="paymentform.cfm" />
</cfcase>
<cfcase value="brochures">
<br />
<cfset title ="- Directory of Defence Management Program Batches'  -" />
<cfinclude template="brochures.cfm" />
</cfcase>
<cfcase value="qualifications">
	<cfset category = arguments.category /> 
		<cfset title = "Share Your Qualifications and Organisations you have been to" />
		 <cfinclude template="qualificationsform.cfm" />
	 <div align="center">
		 <cfset targetid = session.client.id />
		 <cfinclude template="formatqualifications.cfm" />
	</div>
	<cfset session.viewstate.cv = "qualifications" />
</cfcase>

<cfcase value="createprofileform" >
<cfif session.client.type is 'applicant' >
<cfinclude template="profilecreationform.cfm" />
<cfelse>
Not an applicant
</cfif>
</cfcase>
 <cfcase value="inviteform" >
    <cfset title = "Invite A Colleague From  The Indian Armed Forces" />
    <cfif session.client.type is 'applicant' >
       <cfset variables.invitedbyemail = session.client.email />
       <cfset variables.invitedbyid = session.client.id />
     <cfelse>
        <cfset variables.invitedbyid = 0 />
     </cfif>
     <cfinclude template="inviteform.cfm" />


  </cfcase>
  <cfcase value="invitemail">
    <cfset title = "Network with Indian Defence Personnels " />
    <cfinclude template="invitemail.cfm" />
  </cfcase>
  <cfcase value="reviseprofile,editprofile" >
     <cfset title ="Update Your Work Experience in Defence and Corporate " />
     <cfif session.client.type is 'applicant' >
		 <cftry>
       <cfinclude template="editprofileform.cfm" />
			 <cfcatch type="any">
		   <cftry>
			 <cfoutput>#cfcatch.message#</cfoutput>
			      <cfinclude template="profilecreationform.cfm" />
			 <cfcatch type="any">
         <cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
      </cfcatch>
      </cftry>

  </cfcatch>
</cftry>
     </cfif>
<!--- <Cfdump var="#arguments#" /> --->
</cfcase>
<cfcase value="resume">
<cfset title = "Employment Resume Upload" />
<cfinclude template="resume.cfm" />

</cfcase>
<cfcase value="photo">
<cfset title ="- Photograph -" />

<cfinclude template="photoform.cfm" />

</cfcase>
<cfcase value="editpassword">
<cfinclude template="editpasswordform.cfm" />
</cfcase>
<cfcase value="editemail">
<cfinclude template="editemailform.cfm" />
</cfcase>

<cfcase value="signout">
...
<!--- <a href="http://www.semiprecious.com/india/" title="shop for colourful page 3 jewellry"><img src="images/spad.gif" alt="" /></a> --->
<h2>We welcome suggestions to improve the FOI portal. Please feel free to write in to us.</h2><br />
<br />
<br />
<cfinclude template="googleads.htm" />
</cfcase>
<cfcase  value="error">
Displaying error message
and message.go back control var 
</cfcase>
<cfcase value="success" >
<cfset title ="- Contact The Defence Resource Center-" />
	</cfcase>
	<cfcase value="contactus" >
<cfset title ="- Contact Forces of India -" />


    <p style="margin: 4 4; "><div>
<cfinclude template="contactus.cfm" />
</div></p>
	</cfcase>
	<cfcase value="inviteinstructions">
	<cfinclude template="inviteinstructions.cfm" />
	</cfcase>
	<cfcase value="employerinstructions">
	<cfinclude template="employerinstructions.cfm" />
	</cfcase>

	<cfcase value="smscv">
	<cfset session.viewstate.cv = "smscv" />
	<cfinclude template="smscvinstructions.cfm" />
		</cfcase>
	<cfcase value="signupform">

<cfset title ="-  employment, auctions, education, courier, transportation services for the defence personnel" />
<div style="margin-top:4px">
<table width="770" border="0">
  <tr>
    <td valign="top" align="center">
		<cfinclude template="signupform.cfm" />
</td>
  </tr>
</table>

<cfif isdefined("arguments.employer")>
  <cfelse>
	         <div class="menuhead" align=left>&nbsp;Be a part of this  Army, Navy & Air Force online Community&nbsp;</div>
					 <div align=left> 
					       <ul style="margin-top:4px;align:left;">
				          <li> Defence Personnel  can <strong>sign-up for free</strong> and create
				            their professional signature page profile. </li><li>
										Professional profile includes space to upload one CV or resume. Once uploaded you can <b>email your resume</b> to potential employer using the internet from anywhere.</li>
							<li>FOI has a unique interface with Zoho (<a href="http://www.zoho.com">www.zoho.com</a> ) that allows you to <b>edit your resume without MS Word</b> from any where. If you are on the internet without downloading it! So you don't have to worry about your <b>office firewalls spying</b> on your resume.</li><li>Personal profile of course is for <b>social networking</b>, something that is the fabric of Indian forces culture. You can think of stuff like seeking guidance on jobs, help when planning your vacation, childrens' education, benefits, assistance for relocation etc. etc. The fauji map can be downloaded so that you can share it and see it on the free Google Earth without logging in. </li>
					
							<li><strong>Dedicated Section</strong> for armed forces management batches. More services can be offered to a complete course. Like a landing page extolling the  USP of that course. The online brochure can be made searchable and results of search limited to that particular brochure only. All this for a very small fee.</li>
					
							<li><strong>Advertising!</strong> Online advertising needs a professional focussed attention. The number one important P is "promotion" in the marketing mix. If you are part of a batch or course then you can advertise your course for a very modest amount using the Google Adwords campaign. The advertising strategy (content, budget, intensity,) can be decided by you and we will handle SEO, CPC, CPM, creation of sitemap.xml etc. Effective advertising requires professional attention.
							</li>
							<li>
								<table style="border:1px solid ##aa0033; font-size:small" align=center><tr><td>
							<strong>Networking</strong> of course! Today success hinges on a succesful network. Haven't you heard about orkut & linkedin. Orkut is a fun place and LinkedIn for professional leveraging ...
     

        <form action="http://groups.google.com/group/forcesofindia/boxsubscribe" target="resume" >
            <td align="center">
				<cfif isdefined("session.client.type")>
						<cfif session.client.type is "applicant">
			                <input type="hidden" name="email" value="<cfoutput>#session.client.email#</cfoutput>" />
								<table >
            					    <tr>
				                  <td>
                				    <input type="submit" name="sub" value="Network!" />
				                  </td>
                				</tr>
					            </table>
							<cfelse>
								<table >
					                <tr>
					                  <td>
	                				 <input type="button" onClick='javascript:alert("Please Signin First")'; name="sub" value="Network!" />
				                  </td>
                				</tr>
					            </table>
							</cfif>
					<cfelse>
						<table >
			                <tr>
            			      <td>
			                    <input type="button" onClick='javascript:alert("Please Signin First. It''s Free.")'; name="sub" value="Network!" />
            			      </td>
			                </tr>
            			</table>
					</cfif>
						<img src="http://groups.google.com/groups/img/groups_medium.gif" height=58 width=150 alt="Google Groups">
					</td>
        			</tr>
				      </table>
					</li>
				</ul>
			</div>
</cfif>
<br />
<br />

</cfcase>
<cfcase value="searchstart">	
	 
<cfset title = "Log in to Search proffessionals from Indian Armed forces " />
    <p style="margin: 4 4; ">
<div>
<table width="770" border="0">
<!--- <tr>
<td class="blue_link"><a href="http://www.forcesofindia.com/">Search Without Your Email Id</a> (You cannot see email id or download CVs)</td></tr> --->
<tr><td > <span style="background:red;color:white;">From the defence? <span style="background:white"><a href="http://www.forcesofindia.com/headhunting/defence_jobs.cfm?controlvariable=loginform">Click Here</a></span></span> </td></tr>
    <td valign="top" align="center">
		<cfinclude template="employerloginform.cfm" />
</td>
  </tr>
	
</table>
 </div>
 </p>
<cfset session.viewstate.cv = "searchstart" />

</cfcase>
<cfcase value="searchforms">

<cfset title="CVs, Resumes &amp; Profiles Using Lucene Search Engine" />
<div>

<cfinclude template="veritysearchform.cfm" />

<!---
<cfinclude template="listall.cfm"><hr />
<cfinclude template="searchinstitute.cfm" />

<hr />
<cfinclude template="viewprofileform.cfm" />
--->
 </div>
<!--- Form Not Yet Implemented!
<cfinclude template="searchform.cfm" /> --->

</cfcase>
<cfcase value="loginform,login">	 
<cfset title = "Corporate Jobs &amp; Defence Networking - Secure Log in" />
   
<p style="margin: 10 10; ">
<cfif  not len(session.client.email)>
<div align="center" style="width:650px">
<cfinclude template="candidateloginform.cfm" />
 </div> 
<Cfelse>
<span class="error">You are already logged in.</span>
</cfif>
 </p>

</cfcase>
<cfcase value="employerhome">
<cfset session.viewstate.cv = "employerhome" />
<cfset title ="Job Consultants Tools Focused on Indian Armed Forces Retired Profiles" />
<div align="center" style="margin-top:6px;padding:2px;border:0px maroon ridge;width:560px;">
<div align="left">
Please note that if your credentials as an employer have been verified you will be able to access full contact details and resumes of candidates. <br />
Credential verification also entitles you to access the paid service of brochure (student management batch directory) download. <br />
If you have any query please feel write to <span class="email">smriti@forcesofindia.com</span>.<br /></div>
</div><div align="center">
<!--- now the search form has been included as part of the employer menu <cfinclude template="veritysearchform.cfm" /> --->
</div><br />
<br />

</cfcase>
<cfcase value="applicanthome">

	<script type="text/javascript">
	<!--
	    function  _CF_checkCFForm_1(_CF_this)
	    {
	        //reset on submit
	        _CF_error_exists = false;
	        _CF_error_messages = new Array();
	        _CF_error_fields = new Object();
	        _CF_FirstErrorField = null;
	
	
	        //display error messages and return success
	        if( _CF_error_exists )
	        {
	            if( _CF_error_messages.length > 0 )
	            {
	                // show alert() message
	                _CF_onErrorAlert(_CF_error_messages);
	                // set focus to first form error, if the field supports js focus().
	                if( _CF_this[_CF_FirstErrorField].type == "text" )
	                { _CF_this[_CF_FirstErrorField].focus(); }
	
	            }
	            return false;
	        }else {
	            return true;
	        }
	    }
	//-->
	</script>

<cfif len(session.client.email) GTE 4 >
  <cfinclude template="applicanthome.cfm" />
<cfelse>
		 <div alig=center style="margin:40px">
	 		<cfinclude template="candidateloginform.cfm" />
		</div>
	 </cfif>
</cfcase>
<cfcase  value="index,home">
<cfset title ="Job Hunting and Resumes Finding Focussed on  The Community of Indian Defence Personnels" />
<cfset description="At forcesofindia.com we help converge the job consultants (including HR department) with the armed forces community who may have retired or on the verge of moving on to the corporate ladder. This avenue also helps defence personnell support each other in career advancement and job matching" />
<cfset session.viewstate.cv  = "index" />
  <cfinclude template="welcome.cfm" />
</cfcase>
<cfcase value="mailer">

<cfinclude template="mailform.cfm" />
</cfcase>

<Cfcase value="help">
<cfinclude template="help.htm" />
</Cfcase>
<cfcase value="aboutus">
<cfset title="About Forces Of India Initiative - the niche networking site" />
<cfset description="At forcesofindia.com we help converge the job consultants (including HR department) with the armed forces community who may have retired or on the verge of moving on to the corporate ladder. This avenue also helps defence personnell support each other in career advancement and job matching" />

<cfinclude template="aboutus.htm" />

</cfcase>

<cfcase value="verityresults">

<cfset title ="Search Resume Database Officers & Soldiers- Using Verity!" />

<cfinclude template="verityresults.cfm" />
<cfset titlev="Verity Search Resumes of Ex-defence Personnels " />
<cfif len(session.client.email)>
<span class="error"> Access email ids, telephone numbers & detailed resumes of veterans (served earlier in the armed forces personnel) </span><br />
Sign up for free <a href="headhunting/retired_defence_resumes.cfm?controlvariable=signin">here</a> to access them.</cfif>
<!--- Form Not Yet Implemented!
<cfinclude template="searchform.cfm" /> --->
</cfcase>
<cfcase value="search">
<cfset title="Search Resume Repository Using Verity Search Engine" />
<cfset description="In addition to your online search we also offer service to pick connect you up with the matching officers or soldiers. At forcesofindia.com job consultants and companies' can find resumes of retired  armed forces community who may have retired or on the verge of moving on to the corporate ladder. This avenue also helps defence personnell support each other in career advancement and job matching" />

<div align="left" style="margin-top:12px;">
<div class="formheading" style="width:580px;">You can search profiles by institute, domain and email id:</div>
<cfinclude template="listall.cfm">
<hr />
<cfinclude template="searchinstitute.cfm" />
<hr /><cfinclude template="veritysearchform.cfm" />
<hr /><cfinclude template="viewprofileform.cfm" />


<cfif len(session.client.email)>
Email ids and resumes of FOI members are available...<br />
<a href="headhunting/retired_defence_resumes.cfm?controlvariable=signin">Fill up this  form to start fishing ...</a></cfif>
</div>
<!--- Form Not Yet Implemented!
<cfinclude template="searchform.cfm" /> --->
</cfcase>
<cfcase value="listing,listingnextpage,listingfirstpage,listinglastpage,listingpreviouspage">
  <cfset title ="Hire and network with members from Army, Navy and Air Force (Indian Defence Forces) -" />

<cfif isdefined("arguments.query")>
<p style="margin: 2 2; ">
<Cfset querytoshow = arguments.query />
<cfswitch expression="#arguments.code#">
<cfcase value="listing">
<cfif not isdefined('session.listing.showpage')>
<cfset session.listing.showpage = 1 />
</cfif>
</cfcase>

<cfcase value="listingnextpage">
   <cfset session.listing.showpage =  session.listing.showpage + 1 />
</cfcase>
<cfcase value="listingfirstpage">
   <cfset session.listing.showpage = 1 />
</cfcase>
<cfcase value="listingpreviouspage">
 <cfset session.listing.showpage =  session.listing.showpage - 1 />
</cfcase>

<cfcase value="listinglastpage">
  <cfif (arguments.query.recordcount mod #session.listsize#) eq 0>
  <cfset session.listing.showpage = arguments.query.recordcount \ #session.listsize# >
  <cfelse>
 <cfset session.listing.showpage = (arguments.query.recordcount \ #session.listsize#) + 1 /> 
 </cfif>
</cfcase>

</cfswitch>

<div style="margin-top:10px">
<cfinclude template="defence_member_listing.cfm" />
</div>
</p>
</cfif>

</cfcase>

<cfcase value="viewprofile">
 <p style="margin: 2 2; ">
   <cfset recordset  = arguments.recordset />
      <cfif isdefined("arguments.currentrow")>
     <cfset currentrow = arguments.currentrow />
</cfif>
<!---   <cftry>
 
	<cfcatch type=any>
	   <cfif isdefined("session.viewstate.cv")>
		   <cfif session.viewstate.cv is "viewprofile" >
		       <cfquery datasource="#Application.foidsn#" username="nitish" password="rangeela" name=recordset >
		         select profile.*, applicants.mypage from applicants, profile where profile.id = #session.viewstate.id# and profile.id = applicants.id  
			   </cfquery>
			<cfelse>
		        <cfthrow detail="Not Enough Parameters to Show Profile" errorcode="2" message="Please Try Again." type="exception" />
		 	</cfif>
		<cfelse>
	        <cfthrow detail="Not Enough Parameters to Show Profile" errorcode="2" message="Please Try Again." type="exception" />
		</cfif>
	</cfcatch>
 </cftry>
 --->
   <cfinclude template="viewprofile.cfm" />
 		

</p>
   <cfset session.viewstate.cv = "viewprofile" />
   <cfset session.viewstate.description = "Back to Profile" />
   <cfset session.viewstate.recordset = recordset />
	 <cfset session.viewstate.id = recordset.id />
</cfcase>

<cfcase value="password">

<cfif not len(session.client.email)>
	<p style="margin:  2; ">
	<div>
	<table width="770" border="0">
	  <tr>
	    <td valign="top" align="center">
		    <cfinclude template="passwordform.cfm" />
		</td>
	  </tr>
	</table>
	 </div> 
 </p>
 <cfelse>
 <cfset arguments.code = "home" />
 <cfinvoke argumentcollection="#arguments#" component="interfacegenerator" method="action" />
</cfif>
</cfcase>
<cfcase value="polls">
<cfinclude template="polls.cfm" />
</cfcase>

<cfcase value="khazaanaa">
<cfinclude template="khazaanaa.cfm" />
</cfcase>
<cfcase value="viewkhazaanaa">
<cfinclude template="khazaanaalisting.cfm" />
</cfcase>
<cfcase value="viewprofileform">
<cfinclude template="viewprofileform.cfm" />
</cfcase>
<cfcase value="gmpdetails">
<div style="margin:20px 0px">
<cfinclude template="gmp.htm" />
</div>
</cfcase>
<cfcase value="map">
<cfinclude template="addviewlocation.cfm">
</cfcase>

<cfcase value="indian_defence_forces_map">
<!--- should be always called with a query in the arguments --->
<script language="JavaScript" type="text/javascript">
<!-- 
	var communityarray = new Array(
<cfloop query="arguments.icondata"  >
<!--- below is a very file I/O intensive logic. We can replace it by a process to log a flag on the table when the photo is uploaded
but is that a flexible design? Or should this logic depute a scheduler to check once in a while and then update the info in one of it's own column ? --->
<cfif directoryexists("#Application.root#images/#targetid#_photograph")> 
		<cfdirectory action="list" directory="#Application.root#images/#targetid#_photograph" name="photo" filter="*.jpg"  />
 <!--- this has to be sped up by database entry + name has to come into tiny desc including some desc from user--->
[#lat#,#lng#,#targetid#,"#tinydesc#","http://www.forcesofindia.com/headhunting/images/#targetid#_photograph/#photo.name#"],
<cfelse>
[#lat#,#lng#,#targetid#,"#tinydesc#","http://www.forcesofindia.com/headhunting/images/photo.png"],
</cfif> 
	</cfloop>
[0,0,0,0]	)
;
<cfif isdefined("arguments.icondata.zoom")>
var z= #arguments.icondata.zoom#;
var a = #arguments.icondata.lat#;
var b = #arguments.icondata.lng#;
<cfelse>
var z = 5;
var a= 26.574874047447;
var		b = 77.8711;
</cfif> 
//-->
</script>
<cfif isdefined("arguments.back.cv")>
	<cfif arguments.back.cv is "vp">
		<a href="switch.cfc?method=action&cv=vp&email=#arguments.back.email#">#arguments.back.description#</a>
	</cfif>
</cfif>
<cfinclude template="communitymap.cfm" />

</cfcase>


<cfcase value="gmaplocation">
<cfparam name="arguments.tinydesc" default="" />
<cfset variables.tinydesc = arguments.tinydesc />
<!--- need to make this part of the code more decoupled and applicable to 
a broader scope. One idea that needs to be put down is that not always is a back 
link required. Hence the link clicked on the source page (to which we need to perphaps
go back) then the link should have a toggle switch stating that it would prefer to have a 
back link shown to the user. Depending on code maturity this preferance may or may not be 
carried out at the destination page --->
<cfoutput>

<cfif isdefined("arguments.backcv") >
<div align="center"><strong><a href="http://www.forcesofindia.com/headhunting/defence_jobs.cfm?cv=#arguments.backcv#">Go Back</a></strong></div>
</cfif>

</cfoutput>

<cfinclude template="gmaplocation.cfm" />
</cfcase>

<cfcase value="googleads">
<div align="center"><cfoutput>#arguments.adsdescription#</cfoutput></div>

<cfinclude template="googleads.htm" />
<cfinclude template="backlink.cfm" />
</cfcase>
<cfcase value="mapping" >

<cfif arguments.success neq 0>
  <span class="error">Position Recorded!</span>
<Cfelse>
  <span class="error1">Position Not Recorded!</span>

</cfif> 

</cfcase>
<cfcase value="showme">
<cfset title ="Yahoo Maps: " />
<script language="JavaScript">
<!---

function SymError()
{
  return true;
}

window.onerror = SymError;

//--->
</script>

<script type="text/javascript" src="http://api.maps.yahoo.com/ajaxymap?v=3.0&appid=ibz.w8DIkY1e30_wj2XeCUU4YIBYL8RXbC_eqBY-"></script>
<style type="text/css">
##mapContainer { 
height: 500px; 
width: 100%; 
} 
</style> 
</head>
<body>
<div id="mapContainer"></div>

<script type="text/javascript">
// Create a lat/lon object

var myPoint = new YGeoPoint(#session.lat#,#session.lng#);
// Create a map object 
var map = new YMap(document.getElementById('mapContainer'));
// Display the map centered on a latitude and longitude 
map.drawZoomAndCenter(myPoint, 10);
// Add map type control
	map.addTypeControl();
// set type to HYB
	map.setMapType(YAHOO_MAP_HYB);

</script> 

</cfcase>
<cfcase value="rollofhonour">

<div align=center>
<span style=width:590px >

<h3>This feature is under construction.</h3>
<div align="justify">
Not all members are equal. Some members have shown interest in helping others in getting a job or even helping others find out about FOI. By having a roll of honour we are recognizing and appreciating the efforts put in by such members. 
<br /><strong>Metrics for the honour</strong><ul><li>This page will be reporting the statistics on the number of job postings posted by a particular member on FOI portal. Of course there will be points for number of members who applied for the job.</li>
<li>If you got a job opportunity  by offline efforts of another member can always write in expressing their appreciation & gratitude. We will publish & acknowledge it</li>
</ul></div>
<span class=flag>Watch this space!</span>

</span></div>
<cfset session.viewstate.cv = "rollofhonour">
 
</cfcase>
<cfcase value="goback">
<cfif isdefined("session.viewstate.cv")>
<cfswitch expression="#session.viewstate.cv#">
<cfcase value="searchstart">
<cfset title = "Community of Indian Armed Forces - Secure Log in" />
    <p style="margin: 4 4; "><cfinclude template="employerloginform.cfm" />
 </p>
<cfset session.viewstate.cv = "searchstart" />
</cfcase>
</cfswitch>

<cfelse>

<cfinclude template="welcome.cfm">

</cfif>
</cfcase>
<cfcase value="blank">
</cfcase>
<cfcase value="careers">
<cfinclude template="careers.cfm">
</cfcase>
<cfdefaultcase >
<cftry>
<cfinclude template="#arguments.code#.cfm" />
<cfcatch type=any>
<cftry>
<cfinclude template="#arguments.code#.htm" />
<cfcatch type=any>
------------------<br />
<br />
<span class="error1">Requested Feature Yet to Be Implemented. </span>
<br />
Information for the Developers:<br />
<cfoutput>#cfcatch.detail#</cfoutput>
<cfdump  var="#arguments#" /> 

<br /><br />
</cfcatch>
</cftry>

</cfcatch>
</cftry>
</cfdefaultcase>
</cfswitch>
 <cfif isdefined("request.ajax") and (request.ajax is true) >

]]> 
</cfif>
</span>

</span>
</cfsavecontent>	   
<cfsavecontent variable="sidemenu">
	<cfinclude template="sidemenu.cfm" />	
</cfsavecontent>
<cfset bottomcontent="None for now"/>
<cfsavecontent variable="bottomcontent">
<table ><tr><td>
	<a href="http://www.forcesofindia.com/headhunting/defence_jobs.cfm?controlvariable=defence_repository">Professional cum Defence Information Repository</a>
	&nbsp;<a href="http://www.domaining.in/">Free Directory - domaining.in</a>&nbsp;
	<a href="http://www.forcesofindia.com/headhunting/defence_jobs.cfm?cV=get_community_map&src=gb">Faujis on Map</a>
	</td>
</tr><tr><td >
<script type="text/javascript"><!--
google_ad_client = "pub-1173216686849683";
/* 728x15, created 5/23/08 */
google_ad_slot = "2010821453";
google_ad_width = 728;
google_ad_height = 15;
//-->
</script>
<!---
<script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_pas_abgn";
google_ad_type = "text_image";
google_ad_channel ="4294934420";
google_color_border = "667788";
google_color_bg = "FFFFFF";
google_color_link = "6F3C1B";
google_color_url = "E1771E";
google_color_text = "000000";
//--></script> --->
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script><td>
	</tr></table>
<!--- <cfinclude template="bottomcontent.htm" > --->
</cfsavecontent>
 <cfif isdefined("request.ajax") and (request.ajax is true) >

	<cfoutput>#mainbody#</cfoutput>
	</html>
	<!--- currently sending only main body. In case the outer elements need to be changed because of session time out or some similar reason then
	we need a further response code in addition to the main body --->
	<cfreturn />
<cfelse>
<cfif isdefined("session.template")>
	<cfinclude  template="#session.template#.cfm" />
 
	<cfelse>

<cfmodule metatagcontent="#description#" keywords="#keywords#" bottomcontent="#bottomcontent#" title="#title#" mainbody="#mainbody#"  template="browsertemplate.cfm" />

</cfif>

</cfif>
<cfabort /> <!--- put here because we know that this has to be the end of any processing by design. By aborting as well we avoid interface calling againe by accident on return from here. --->
</cffunction>
</cfcomponent>




