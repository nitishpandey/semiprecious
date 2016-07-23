<html>
<head>
<title>CRM</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/javascript/xmlhttp.js" ></script>
<script language="JavaScript" src="/javascript/crm.js" ></script>
</head>


<body topmargin="o">
<div align="center">
<cfinclude template="headerforgemstone_jewelry_gallery.cfm" />

<cfquery datasource="gemssql" name="n">
select email, customerid,tele from crmkey where newmsg = 1
</cfquery><div align="center" style="width:800px;border:2px #555599 groove;padding:2px;text-align:center;font-weight:bold;font-size:18px;">CRM New Message</div>

<div align="left" style="width:800px;background-color:#DDDDDD;" >List of members with a new message. Click on Email to view the message.
<ol >
<cfoutput query="n">
<li id="#customerid#"><a href="viewmessages.cfm?customerid=#customerid#">#email#</a> Tele: #tele# [<a href="##" onClick="javascript:markRead(#customerid#); return false;">Mark As Read</a>]</li>
</cfoutput>
</ol>
</div>
<a href="crm.cfm">Back To Main Menu</a>       &nbsp; <a href="admin.cfm">Admin Page</a>              &nbsp; <a href="/">Site</a>   &nbsp;   <a href="mail.semiprecious.com">Mail Site</a>
</div>

</body>
</html>
