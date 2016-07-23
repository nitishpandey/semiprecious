<cfparam default="" name="session.client.email" />
<cfparam default="Naukri For Faujis" name="title" />
<cfparam default="" name="keywords" />
<cfparam name="metatagcontent" default="Enabling  armed forces retired officers and PBOR (Sailors, soldiers, airmen) to build a network for professional support. Get employment in the corporate or private companies. (ex-defence officers of india that is army, navy, indian airforce). Consultants and coporates in india and abroad to do head hunting from retired officers of indian airforce, navy or the army. Members have 5 to 30 years of unmatched expeirience in varied professional fields and many have done a MBA like  program from institutes like IIM or MDI etc." />
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
 
<html>
<head>
	<cfoutput>
<title>#title# -  Resumes+ Network = Jobs, Business  </title>

<meta http-equiv="Content-Type" content="text/html;">

<meta name="description" content="#metatagcontent#" />
<meta name="keywords" content="#keywords# job openings, top management, MBA, armed forces, india, employment, navy, management, defence officers,ex-defence, opportunity,india, placement, jobs, security, HR, head hunting, defence forceS,  IT, human resource, immigration, industry, qualified, qualification, armed forces"  />
</cfoutput>
<meta name="verify-v1" content="mcZVAK5z+CvQsBKZtNyIvuZkEsBCIvD+I7z0kdEgYy8=" />
<link rel="shortcut icon" href="favicon.ico" >
  <link href="/headhunting/styles/styles.css" rel="stylesheet" type="text/css" />
  <link rel="alternate" type="application/rss+xml" title="ROR" href="ror.xml" />
   <link rel="alternate" type="application/rss+xml" title="Latest defence members of the portal" href="rss.xml" />
   <script language="JavaScript" src="ajax.js" ></script>

<script type="text/javascript"  language="javascript">
function amendtitle(towhat) {
document.title = towhat ; 
return true;
}
</script> 
</head>
<body  style="background-color:white;float:middle;margin-top:0px;margin-right:0px;width=800px"    >
<div  id="loadind"><img src="images/loadingindicator.gif" border=0 align="bottom"     vspace="0"  style="margin:0px"  alt="" width="34" height="18" />&nbsp;&nbsp;&nbsp;Loading...</div>
<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="800">
    <!-- fwtable fwsrc="foiheaderbanner.png" fwbase="foiheaderwithhtml.cfm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
 
    <tr> 
      <td  align="left" style="background-color:white">
			<a href="http://www.forcesofindia.com" style="text-decoration:none;"><img  alt="professional resumes of defence forces personnel &amp; jobs for the indian defence forces"  align="absbottom" name="foiheaderwithhtmlcfm_r1_c1" src="images/bluebanner.jpg"   border="0"  style="display:inline;width:800px;border:0px;" hspace="0" vspace="0" /></a>
</td>

    </tr>
    <tr> 
      <td  bgcolor="#ffffff"  id="sectionLinks"  style="background-image:URL('http://www.semiprecious.com/images/bg2.gif');color:black;text-align:center;font-size:14px;;border:0px solid gray;border-bottom:1px groove blue				 ;font-weight:bold;;" border=0 ><img src="images/spacer.gif"  height="5" border="0" /> <strong> <a href="defence_jobs.cfm?cv=index" title="jobs, resumes, networking for defence officers">Home</a>  

            <cfif not len(session.client.email)> <a href="defence_jobs.cfm?cv=search" title="Search CVs &amp; Add Job Openings, Hire, Network  &amp;  Advertise Special Discounts" >Post Jobs <span class="redattention">(Free!)</span></a>   <a href="defence_jobs.cfm?cv=loginform" title="network with defence colleagues Find Jobs, Support &amp; Colleagues">Defence Personnel Sign In</a> <a href="defence_jobs.cfm?cv=search" title="Search CVs &amp; of candidates with verified background and leadership quality" >Search Resumes</a>           
              <cfelse> <a href="javascript:http('cv=signout&ajaxdest=mainbody')" class="redattention">Sign Out</a> </cfif> </strong> <cfif application.support is 1 > <a href="defence_jobs.cfm?cv=livesupport">Live Support</a></cfif> </td>
    </tr>
<!--      <tr style="border-right:0px skyblue solid;border-left:0px skyblue solid;margin-bottom:4px;margin-left:4px;margin-right:4px;margin-top:0px;"> -->
<tr>
      <td valign="top"  bgcolor="white"  align="center"  style="border-right:0px skyblue solid;border-left:0px skyblue solid;margin-bottom:2px">
<cfoutput>#trim(mainbody)#</cfoutput></td>
 </tr>
    <tr> 
      <td  bgcolor="#ffffff" id="sectionLinks2"  style="background:URL('http://www.semiprecious.com/images/bg2.gif');color:brown;text-align:center;font-size:12px;;border:2px solid skyblue;border-bottom:0px ;"><img src="images/spacer.gif"  height="5" border="0" />       <strong> <a href="defence_jobs.cfm?cv=dgrforms">Register With DGR</a> | <a href="javascript:http('cv=entrepreneur&ajaxdest=mainbody')">Entrepreneurs from the Forces</a> | <a href="defence_jobs.cfm?cv=contactus">Contact Us</a> | <a href="defence_jobs.cfm?cv=aboutus">About Us</a> |   <a href="javascript:http('cv=careers&ajaxdest=mainbody')" >Careers at FOI</a>
</strong></td>
    </tr>
	  <tr style="margin-top:20px"> 
       <td  valign="middle" align="center" bgcolor="white"  ><p><cfoutput>#bottomcontent#</cfoutput></p></td>
    </tr> 
     <tr><td  bgcolor="#446677" style="color:white">The design and content of the site are property of www.forcesofindia.com. The site has been
        built  and maintained by <a href="http://WWW.forcesofindia.com/profiles/np" target="resume"><font color="#FFCC33">Nitish Pandey</font></a></td>
       </tr>
  </table>
</div>
<!--- <script language="javascript" >
<cfoutput>amendtitle( ' #title# ' + document.title );
</cfoutput>
</script>--->
 <script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-4317311-3");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>


