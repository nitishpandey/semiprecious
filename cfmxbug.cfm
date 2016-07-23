<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

The code is<br>

&lt;cfif findnocase(".in",cgi.server_name) &gt;
  found<br />
  &lt;cfelse&gt;<br />
  not found<br />
  &lt;/cfif&gt;<br />
  
  <cfif findnocase(".in",cgi.server_name)>
	  found
  <cfelse>
  	not found
  </cfif>
  &lt;cfset temp = cgi.server_name /&gt;<br />
  <cfset temp = cgi.server_name />
  &lt;cfif findnocase(".in",temp) &gt;<br />
  found<br />
  &lt;cfelse&gt;<br />
  not found<br />
  &lt;/cfif&gt;<br />
  
  <cfif findnocase(".in",temp)>
	  found
  <cfelse>
  	not found
  </cfif>
<cfquery name="d" datasource="gemssql" >
select newitem from items  where  orderonrequest = 1
</cfquery>
<cfoutput>#d.recordcount#</cfoutput>

<cfquery name="d" datasource="gemssql" >
  update items set orderonrequest = 0 where newitem%2 = 1 and orderonrequest = 1
</cfquery>
<cfquery name="d" datasource="gemssql" >
select newitem from items  where  orderonrequest = 1
</cfquery>
<cfoutput>#d.recordcount#</cfoutput>
</body>
</html>
