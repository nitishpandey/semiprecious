<html>
<head>
<title>Your Custom Jewelry Request</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body topmargin="1">
<cfinclude template="../headerforlist.cfm">
<p>&nbsp;</p>
<p>Your request has been submitted succesfully. </p>
<cfparam name="form.email" default="NA" type="string"><cfparam name="form.phone" default="na" type="string"><cfparam name="form.fax" default="na" type="string">
<cfparam name="form.country" default="na" type="string">
<cfparam name="form.description" default="na" type="string">
<cftry>
<cfquery datasource="sptm"  >
insert into customrequest (reqid,name,email,phone,fax,description,country) values ('#session.customrequestid#',
'#form.name#',
'#form.email#',
'#form.phone#',
'#form.fax#',
'#form.description#',
'#form.country#'
)

</cfquery>
<cfset j = session.customrequestid>
<cfset session.customrequestid = 0><br>
<br>
<br>
<cfif form.email neq "na">
<cfmail server="mail23.webcontrolcenter.com" subject="customrequest #j#"  to="#form.email#" from="stacy@semiprecious.com" type="html" >
We have recieved your request for custom jewelry. We will get in touch with you shortly. Please keep note of your request id.
Thankyou.
<br>
-Stacy<br>

Semiprecious.com
</cfmail>
</cfif>
<cfmail server="mail23.webcontrolcenter.com" subject="customrequest #j#" cc="nitish@semiprecious.com" to="anup@semiprecious.com" from="website" type="html" >
custom request no. <a href="http://www.semiprecious.com/customrequest/viewcustomrequest.cfm?reqid=#j#">http://www.semiprecious.com/customrequest/viewcustomrequest.cfm?reqid=#j#</a>. Use viewcustomrequest link on admin page.
</cfmail>
Your request id is <cfoutput>#j#.</cfoutput> <!-- You can use the link <a href="#">edit </a>request and this id to update your description. -->
<Cfcatch type="any"><cfoutput>#Cfcatch.Message#</cfoutput> 
Error while recording your request. You may try again. If the error persists pse inform us of the error and you can contact us via email or phone. 
We are extremely sorry for the inconvenience and assure you that we will rectify this error at the earliest.
</Cfcatch></cftry>
Thankyou for the request, we will shortly get in touch with you. 
<div align="center">
<cfinclude template="../adminfooter.cfm">
	</div>
<cfinclude template="../footer.htm">
</body>
</html>
