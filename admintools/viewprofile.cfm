 <cfoutput> 
<div id="notesform" style="background:white;z-index:4;position:absolute;top:45%;left:20%;width:40%;display:none;border:4px skyblue solid;padding:2px;">
<form method="get" action="switch.cf" >
	<div align="center">
	<input type="hidden" name="unity" value="=1&method=action&cv=addnote&src=vp&email=#recordset.id#" />
	<input type="hidden" name="nextcv" value="vp" />
	<input type="hidden" name="email" value="#recordset.id#" />
	<div class="formheading">Write A Quick DO Note Here And Hit 'Add Note' Button</div>
	<textarea col="80"  name="note"></textarea> 
	<input type="hidden" value="#recordset.id#" name="toid" />
	<cfif isdefined("session.client.id")>
		<input type="hidden" value="#session.client.id#" name="fromid" />
	<cfelse>
		<input type="hidden" value="0" name="fromid" />
	
	</cfif>
<br /><br />
<input value="Add Note" type="submit">
</div>
</form>
<div style="width:100%" align="right"><span id="notesform_close" style="color:red;text-decoration:underline;" onclick="javascript:   $('##notesform').hide('slow');">Close</span></div>
<cfif session.client.type is "applicant">
<div class="formheading">DO Notes For #recordset.full_name#</div>
<cfquery name="notes" datasource="sptm">
select * from faujinotes where toid= #recordset.id#  and typeofnote = 'open' order by dateadded desc
</cfquery>
<div style="border:skyblue 2px solid;margin:2px;">
<cfloop query="notes">
<a href="switch.cfc?method=action&cv=vp&email=#fromid#">FOI ID #fromid#</a> Added: #content#<br />
</cfloop>
</div>
</cfif>
</div>

    <table border="0" style="margin-top:10px;border-bottom:2px dotted blue;">
	<cfsavecontent variable="navigationrow" ><!--- keep it synchronised with the navigator on viewmember.cfm and listing.cfm --->
		<tr>
		  <td colspan="2" class="nav">
	    <cfset session.client.lastviewedprofile = recordset.id /> 
  		<cfif isdefined("currentrow")>
					     <cfif session.viewstate.lastprofilelisted.recordcount GT 1 >
              					<cfset session.listing.showpage = (currentrow\session.listsize) />
            						<cfif currentrow MOD session.listsize neq 0 >
            	    					<cfset session.listing.showpage =  session.listing.showpage + 1 />
              						</cfif>
      						</cfif>
      						
      		 		 <cfif not isdefined("request.ajax")> 
			                <div align="center">        
								<span>   <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=viewprofileprev&amp;currentrow=#evaluate(currentrow-1)#&amp;email=#recordset.id#" class="capit"><img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>&nbsp;Prev&nbsp;Profile<span ><span style=""  >&nbsp;<a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=listing">Back to Profiles List</a></span>&nbsp;</span>&nbsp;Next&nbsp;Profile<a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=viewprofilenext&amp;currentrow=#evaluate(currentrow+1)#&amp;email=#recordset.id#" class="capit"><img src="images/next.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle" />
									</a> 
						</span></div> 
            		    <cfelse> 
                 				 <div align=center>
									  <a href="javascript:http('controlvariable=viewprofileprev&amp;currentrow=#evaluate(currentrow-1)#&amp;email=#recordset.id#&amp;ajaxdest=mainbody')" class="capit">
									  <img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>&nbsp;Prev&nbsp;Profile<span ><span style=""  >&nbsp;<a href="javascript:http('controlvariable=listing&ajaxdest=mainbody')" >Back to Profiles List</a></span>&nbsp;</span>&nbsp;Next&nbsp;Profile <a  href="javascript:http('controlvariable=viewprofilenext&currentrow=#evaluate(currentrow+1)#&amp;email=#recordset.id#&ajaxdest=mainbody')" class="capit"><img src="images/next.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a> </span></div> 
				                </div>
			</cfif> 
	 </td></tr>
	 </cfif>
</cfsavecontent>
#navigationrow# <!--- because this is used twice. once on top  and then on the bottom --->

	    	  <cfinvoke  component="employee" method="getrank" returnvariable="rank" >
				 <cfinvokeargument name="id" value="#recordset.id#" />
			 </cfinvoke>
		     <cfinvoke  component="employee" method="getcontact" returnvariable="contact" >
				 <cfinvokeargument name="id" value="#recordset.id#" />
			 </cfinvoke>
			 
		     <cfinvoke  component="employee" method="getservice" returnvariable="service" >
				 <cfinvokeargument name="id" value="#recordset.id#" />
			 </cfinvoke>


  <tr>  
  <Td style="padding-top:2px" valign="top"> 
<h1><cfif not rank is "NA">#rank#</cfif> #recordset.full_name#</h1>
  <table width="570"  bgcolor="#Application.lightbrown#"  style="margin-top:2px;"  cellpadding="0" cellspacing="0" height="1"> 
  <!-- fwtable fwsrc="loginform.png" fwbase="loginform.cfm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" --> 
  <tr> 
     <td  colspan="3" align="left" class="formheading" ><h2 >#Ucase(left(recordset.resume_heading,80))#</h2></td> 
   </tr> 

  <tr > 
     <td class="tableheading" align="left" colspan="3" nowrap><strong>Personal
         Details</strong></td> 
   </tr> 
	 <tr> 
	     <td align="left" valign="top" nowrap class="columnname"><div >In Short</div></td> 
     <td align="justify" valign="top" colspan="2" >
		<div align="justify"  ><font color="##000000"><i> #recordset.aboutyou#</i> </font></div></td> 

   </tr>
  <tr> 
     <td  align="left" nowrap colspan="3" class="columnname">Served in #service#	&nbsp;&nbsp;&nbsp;&nbsp;<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.forcesofindia.com%2Fheadhunting%2Fviewprofile.cfm%3Femail%3D#recordset.id#%26sd%3D#urlencodedformat(left(recordset.resume_summary,100))#&amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=20" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:350px; height:20px;" allowTransparency="true"></iframe>
   </td> 
     
   </tr> 
<tr> 
     <td align="left" nowrap class="columnname">Gender</td> 
     <td align="left" ><font color="##000000"> #recordset.gender# </font></td> <td rowspan="5" align="center" style="padding-top:2px" >

   <cfif directoryexists("#Application.root#images/#recordset.id#_photograph") >  
		<cfdirectory action="list" directory="#Application.root#images/#recordset.id#_photograph" name="photo" filter="*.jpg"  />
		<img src="images/#recordset.id#_photograph/#photo.name#" width="120"   vspace="0" border="0" align="absmiddle" /> 

 
         <cfelse> 
         <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=photo" >
		 <img src="photos/head_blue50.jpg" width="60"   vspace="0" border="0" align="absmiddle" /> </a> 
       </cfif> 
	   </td> 

   </tr> 
  <tr> 
     <td align="left" nowrap class="columnname">Marital Status </td> 
     <td align="left" ><font color="##000000"> 
       <cfswitch expression="#recordset.marital_status#"> 
        <cfcase value="M">
          Married 
         </cfcase> 
        <cfdefaultcase>
          Single 
         </cfdefaultcase> 
      </cfswitch> 
       </font></td> 
   </tr> 

  <tr> 
     <td align="left" nowrap class="columnname">Date of Birth</td> 
     <td align="left"><font color="##000000"> #dateformat(recordset.date_of_birth,'dd-mmm-yy')# </font>&nbsp; 
	
	</td> 
   </tr> 
  <tr> 
     <td align="left" nowrap class="columnname">Phone</td> 
     <td align="left"><cfif isdefined("session.client.type") >
		  <cfif session.client.type  is 'employer' > 
         <cfif session.client.paid > 
            <font color="##000000"> #contact# </font> 
          <cfelse> 
            <i>Your Registration Confirmation is Pending</i> 
         </cfif> 
       <cfelseif session.client.type is "applicant"  > 
         <font color="##000000"> #contact# &nbsp;&nbsp;<cfif session.client.id eq recordset.id><a href="http://www.forcesofindia.com/headhunting/sa.cfm?cv=edrc">edit contact & rank</a></cfif></font> 
			 <cfelse>
				  <i><a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=search"> View Details</a></i>
       </cfif>
			 <cfelse>Please log in to reveal</cfif> </td> 
   </tr> 
	 <cfif session.client.type neq "applicant">
  <tr> 
     <td align="left" nowrap  class="columnname">Email</td> 
     <td align="left"colspan="1" > 
		
		   <cfif session.client.type  is 'employer' > 
         <cfif session.client.paid > 
          <cfquery datasource="#Application.foidsn#" username="nitish" password="rangeela" name="temp" >
            select email from applicants where id = #recordset.id# 
           </cfquery> 
             <font color="##000000">#temp.email# </font> 
          <cfelse> 
           <i>Available to Registered Users</i> 
          </cfif> 
         <cfelseif session.client.id is recordset.id> 
         #session.client.email# 
       </cfif> 
			 </td> 
   </tr> </cfif>
	
  <tr align="center"> 
     <td colspan="3" bordercolor="##000000" style="padding-top:6px;padding-bottom:6px;" > 
		 		       
<!--- <cfif listfind( "#session.savedprofiles#",recordset.id,"," ) GT 0 >
 <span style="color:green">Selected</span>
 <cfelse>  <a style="text-transform:capitalize" href='http://www.forcesofindia.com/headhunting/defence_jobs.cfm?cv=saveprofile&id=#recordset.id#'  >Select</a>
 </cfif>
--->
<cftry> 
         <cfif session.client.type  is 'employer' > 
           <cfif session.client.paid> 
             <cfif recordset.resume is "Y"> 
		<cfif isdefined("request.ajax") and (request.ajax is true) >
		              <a href="switch.cfc?method=action&amp;id=#recordset.id#&amp;controlvariable=fetchcv&amp;nextcontrol=listing" style="color:maroon;text-weight:bold;">
						<cfelse>
		              <a href="switch.cfc?method=action&amp;id=#recordset.id#&amp;controlvariable=fetchcv&amp;nextcontrol=viewprofile" style="color:maroon;text-weight:bold;">
		</cfif> 
					<span style="background:##FFFFFF;color:blue;font-size:1.2em;font-weight:strong;" >Download Resume of <span class="capit">#recordset.full_name#</span></span></a>
							
              <cfelse> 
              Resume Not Available <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=mailer&amp;id=#recordset.id#">Request For CV</a>
            </cfif> 
             <cfelse> 
             <span class="redattention">Resume Download Not Activated...Your Credential Confirmation awaited</span> 
           </cfif> 
          <cfelseif isdefined("session.client.resume")  and (session.client.id is recordset.id) > 
  					<cfif session.client.resume is  "Y" >
             <a href="http://www.forcesofindia.com/headhunting/resumes/#session.client.id#/#session.client.id#resume.doc" target="resume" style="color:maroon">Download Your Resume</a>
           <cfelse>
              <strong><a href="defence_jobs.cfm?cv=resume"><span class=redattention>Your Resume Upload Pending</span></a></strong>
					</cfif>
 
        </cfif> 
         <cfcatch type="any"> 
&nbsp;Log in to Download Resume 
        </cfcatch> 
       </cftry> </td> 
   </tr>   <tr> 
     <td align="center" colspan="3" id="msgbox#recordset.id#"><div style="margin-top:6px;margin-bottom:6px" ><font color="##000000"> 
		 	<img src='images/message.gif'align="absmiddle" border=0 width="16" height="16">		 <a href="javascript:http('controlvariable=mailer&amp;id=#recordset.id#&&ajaxdest=msgbox#recordset.id#')" colspan="2"  >
<span class="contact" >Click Here to Write A Mail  <cfif not rank is "NA">#rank#</cfif> #recordset.full_name# </span></a></font>
&nbsp;&nbsp; 
 Or <span style="text-decoration:underline;cursor:pointer;" onclick="javascript:   $('##notesform').show('slow');">Write A DO <img id="notes" width="30px" src="images/notes.gif" /></span>
</div></td> 
   </tr> 

  <tr> 
     <td class="tableheading" align="left" colspan="3" nowrap><strong>Professional
         Details</strong></td>
         <!---
         <td class="tableheading"><div style="display:inline" id="resumemsg">
   <a      href="javascript:http('controlvariable=getresume&id=#recordset.id#&amp;ajaxdest=resumemsg')">Get Resume</a></div></td> 
   --->
   </tr> 

<tr><td colspan=1 class=columnname style="background-image:url(images/hash.gif);">Business Card URL</td><td colspan=2 style="background-image:url(images/hash.gif);">


     	 <cfif len(recordset.mypage) GT 1 >
 	        <a target="_blank" href="http://forcesofindia.com/profiles/#recordset.mypage#">http://forcesofindia.com/profiles/#recordset.mypage#</a>
		 <cfelse>
		 	Not Available
		 </cfif>
				 </td></tr>


<tr> 
     <td align="left" valign="top" nowrap class="columnname"><div >Career Summary</div></td> 
     <td align="justify" valign="top" colspan="2" ><div align="justify" colspan="2" ><font color="##000000"> #left(recordset.resume_summary,500)# ...</font></div></td> 
   </tr>  
<cfset description="#rank# #recordset.full_name# #left(recordset.resume_summary,200)#">
 <tr> 
     <td align="left" nowrap  class="columnname">WorkEx</td> 
     <td align="left"colspan="2" ><font color="##000000"> #datediff('m',recordset.jobstart,now())\12# Yrs #datediff('m',recordset.jobstart,now()) MOD 12# Mths</font></td> 
   </tr>

<!---<cfinclude template=temp.cm />---> 

<cfquery datasource=#Application.foidsn# name=myspecs username=nitish password=rangeela>
select specid from profilespecialisation where profileid = #recordset.id#
</cfquery>
<Cfif myspecs.recordcount GTE 1 >	  
<tr><td class=columnname><strong>Areas of Interest</strong></td><td colspan=2>
<cfset l = application.speclookup.recordcount />
<cfset keywords = ""/>
<cfloop query=myspecs>
<cfset qs = specid />

<cfloop from=1 to="#l#" index=j >
<cfif Application.speclookup['id'][j] is qs>
&nbsp;#trim(Application.speclookup['description'][j])#
<cfset keywords = #Application.speclookup['description'][j]# & ", " & Keywords/>
</cfif>
</cfloop>,
</cfloop></td></tr>
	 </cfif> 
	 <cfif isdefined("session.client.type")>
	 <cfif session.client.type is "employer" or session.client.id eq recordset.id >
	 <tr>  <td align="left" nowrap  class="columnname">CTC Expected</td> 
     <td align="left"colspan="2" >
		  
			<cfif session.client.type  is 'employer' > 
         <cfif session.client.paid > 
      		 <cfif len(recordset.ctc_expected)>
          INR #recordset.ctc_expected# lacs p.a 
          <cfelse>
					Not Specified
					</cfif> 
          <cfelse> 
          <i>Your registration is pending confirmation</i> 
        </cfif> 
         <cfelse> 
          <cfif len(recordset.ctc_expected)>
          INR #recordset.ctc_expected# lacs p.a 
            <cfelse>
			    Not Specified (Need to edit your profile?)
			    </cfif> </cfif>
       
&nbsp;</td> 
   </tr> 
	 </cfif> 
	 </cfif>
	 <tr> 
     <td align="left" nowrap  class="columnname">Current Location</td> 
     <td align="left" colspan="2">&nbsp;<font color="##000000"> 
			<cfquery datasource="#Application.foidsn#"   name="mapped" >
				select foiid from mapping where targetid = #recordset.id# and tablecolumn="profile_location"
			</cfquery>
			<cfif mapped.recordcount GT 0>
			      <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=getcommunitymap&amp;id=#recordset.id#&amp;targetid=#recordset.id#&targettype=profile_location" style="border:1px gray solid;" class="orangeheading">See On Map</a>
			</cfif>
			<cfif session.client.id eq recordset.id >
			&nbsp;      <a href="http://www.forcesofindia.com/headhunting/retired_defence_resumes.cfm?cv=gmaplocation" style="border:1px gray solid;" class="orangeheading"> Update on Map </a>
			</cfif>&nbsp;
		       <cftry> 
			        <cfquery datasource="#Application.foidsn#"   name="places">
				          select description from places where places.id = #recordset.current_location# 
			         </cfquery> 
					<cfcatch type="any">
						            Not Available 
							<cfquery datasource="#Application.foidsn#"   name="places">
						          select description from places where places.id = #listgetat(recordset.current_location,1,",'")# 
					         </cfquery> 
				     </cfcatch> 
			      </cftry> 
       
		
				<cftooltip hidedelay="2000" preventoverlap="false"  
						sourcefortooltip="get_friends.cfm?place_id=#recordset.current_location#&place=#urlencodedformat(places.description)#" >
						<span style="color:green;text-decoration:underline;;border-top:1px solid orange;margin-top:-6px;margin-right:30px;">
					        #places.description# 				
		              </span>
					</cftooltip> 
  <cfset title = '#rank# #recordset.full_name#, #places.description# (#left(recordset.resume_heading,40)#) '>

        </font>&nbsp;



</td> 
   </tr> 
  <tr> 
     <td align="left" valign="top" nowrap  class="columnname">Preferred Location(s)</td> 
     <td align="left" colspan="2" ><font color="##000000"> 
     
       <cfloop list="#recordset.preffered_location#"  delimiters=","index="pl"> 
         <cfset errora = 0 /> 
			         <cfset found = 1 />	 
							  <cftry> 
  				 <cfset l = application.places.recordcount />
          <cfloop from=1 to="#l#" index=j >
           <cfif Application.places['id'][j] is pl>
           &nbsp;#Application.places['description'][j]#,
         <cfset found = 0 />
				   </cfif>
         </cfloop>


				 <!--- 
				  <cfquery datasource="#Application.foidsn#"  username="nitish"  password="rangeela" name="places">
           select description from places where id = #pl# 
          </cfquery> 
           #places.description# 
					 ---> 
        
				   <cfcatch type="any"> 
            <cfset errora = 1 /> 
           </cfcatch> 
         </cftry> 
      </cfloop> 
        </font>&nbsp;</td> 
   </tr> 
  
  <tr> 
     <td align="left" nowrap class="columnname">Current Employer</td> 
     <td align="left" colspan="2" >
		
		<cfif len(trim(recordset.current_employer))>
					<font color="##000000"> 
					
							<cftooltip  preventoverlap="false" hidedelay="2000" sourcefortooltip="get_friends.cfm?establishment=#urlencodedformat(recordset.current_employer)#&id=#recordset.id#">
							<div style="display:inline-block;color:green;text-decoration:underline;;border-top:1px solid orange;margin-right:10px;">
								#recordset.current_employer#
							</div>
						</cftooltip>
				</font>
	</cfif>&nbsp;</td> 
   </tr> 
  <tr> 
     <td align="left" nowrap class="columnname">Designation</td> 
     <td align="left" colspan="2" ><font color="##000000"> #recordset.functional_title#</font>&nbsp;</td> 
   </tr> 
	 <!----
<cfif isdefined("session.client.type")>
<cfif session.client.type is "employer" or session.client.id is recordset.id >
    <tr>  
      <td align="left" nowrap class="columnname">Expected CTC</td>
      <td align="left"colspan="2" ><font color="##000000"> <cfif isnumeric(recordset.ctc_expected) >Rs #recordset.ctc_expected# Lacs p.a <cfelse>Not Specified</cfif></font>
			<cfif #recordset.negotiable#>(Negotiable)</cfif></td>
    </tr></cfif></cfif>
--->
  <!--  creating width problem . the commma list disallows wrapping!   <tr> 
            
      <td align="left" nowrap>Preferred Location</td>
            <td align="left">: #recordset.preffered_location#</td>
          </tr> --> 
<cfset metatagcontent =  recordset.resume_heading   />	
  <tr> 
     <td colspan="3" align="center"> 
<cfset targetid = recordset.id />
<cfset category = "appointment">
<cfinclude template="formatqualifications.cfm" />
<cfset category = "">
<cfinclude template="formatqualifications.cfm" />

			 </td>  
   </tr>
  <cf_qualifications email="#session.client.email#" returnvar='result' /> 
  <!--- still separating presentation from logic 
 
    <cfif session.client.type is 'applicant' >
      <tr align="right"> 
        <td  align="right" valign="bottom" nowrap><a href="retired_defence_resumes.cfm?cv=createprofileform" target="revise">Revise 
          Your Profile</a> &nbsp;</td>
        <td   valign="bottom"align="center"colspan="2" ><font color="##000000">&nbsp;&nbsp;<a href="retired_defence_resumes.cfm?cv=qualifications">Add 
          Skills/Awards/Qualifications</a></font></td>
      </tr>
    </cfif>---> 


</table> 
</Td> 
<td valign="top" align="center">
<cfif isdefined("request.ajax")>
<script type="text/javascript"><!--
google_ad_client = "pub-1173216686849683";
/* 120x600, created 5/23/08 */
google_ad_slot = "0734225336";
google_ad_width = 120;
google_ad_height = 600;
google_ad_format = "120x600_as";
//-->
</script>

<iframe src="googlevertad.htm"  width="140" height="650" scrollbar="no" ></iframe>
<!--- semiprecious ads <iframe src="http://pagead2.googlesyndication.com/pagead/ads?client=ca-pub-2709788135063072&dt=1204962673156&lmt=1204962673&format=120x600_as&output=html&correlator=1204962673156&channel=4294934420&url=http%3A%2F%2Fwww.forcesofindia.com%2Fheadhunting%2Fswitch.cfc%3Fmethod%3Daction%26controlvariable%3Dviewprofile%26email%3D<cfoutput>#recordset.id#</cfoutput>%26ajaxdest%3Dm&color_bg=FFFFFF&color_text=341473&color_link=B47B10&color_url=C3D9FF&color_border=99C9FF&ad_type=text_image&ref=http%3A%2F%2Fwww.forcesofindia.com%2Fheadhunting%2Fretired_defence_resumes.cfm%3Fcontrolvariable%3Dlisting&frm=0&cc=99&ga_vid=1545061840.1202220940&ga_sid=1204956581&ga_hid=573958779&ga_fc=true&flash=9.0.115.0&u_h=1050&u_w=1400&u_ah=1020&u_aw=1400&u_cd=32&u_tz=330&u_java=true" width="140" height="650" scrollbar="no" ></iframe> --->
<cfelse>
<!--- semiprecious ads
<script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 120;
google_ad_height = 600;
google_ad_format = "120x600_as";
google_ad_type = "text_image";
google_ad_channel ="4294934420";
google_color_border = "99C9FF";
google_color_link = "B47B10";
google_color_bg = "FFFFFF";
google_color_text = "341473";
google_color_url = "C3D9FF";
//--></script> 
  <script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script> --->
<script type="text/javascript"><!--
google_ad_client = "pub-1173216686849683";
/* 120x600, created 5/23/08 */
google_ad_slot = "0734225336";
google_ad_width = 120;
google_ad_height = 600; 
google_ad_format = "120x600_as";
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></cfif>
</td> 

</tr> 
#navigationrow#
</cfoutput> 
</table> 

