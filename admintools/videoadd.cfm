<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

 <cfif session.mail neq application.admin_email > <!--- admin check--->

not permitted choot!
 <cfabort>
 <cfelse>
 <cfparam name=itemid default="">
  <cfparam name=videocode default="">
<html>
<head>
<meta name="robots" content="noindex, nofollow">
<title>Embed Video</title>
</head>
<body>

<cfif videocode neq "">
<cfquery name="addvideo" datasource="gemssql">
delete from items_video where itemidvideo =#itemid#
insert into items_video (itemidvideo, videocode, hostedby) select #itemid#, '#videocode#', 'youtube'
</cfquery> 
</cfif>
<form action=videoadd.cfm>
ItemID: <input name="itemid" type=text value="<cfoutput>#itemid#</cfoutput>">
videoID: <input name="videocode" type=text value="">
<input type=submit name=submit>
</form>

REVIEW:<p>
<cfif videocode neq "">

<iframe width="350" height="262" src="http://www.youtube.com/embed/<cfoutput>#videocode#</cfoutput>" frameborder="0" allowfullscreen></iframe>
</cfif>
</body>
</html>

</cfif><!--admin check-->