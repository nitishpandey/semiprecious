<html>
<head>
<title>IMagery Renaming</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body >
<cfif not isdefined("form.oldsite")>
BULK RENAME IMAGERY FILES 
<cfform action="newsite.cfm" method="post">
Oldsite:<cfinput name="oldsite"  type="text"  required="yes"  maxlength="20" size="12">
Newsite:<cfinput name="newsite"  type="text"  required="yes" maxlength="20"  size="12">
<input type="submit">
</cfform>
<cfelse>
<cfdirectory action="list" directory="d:\inetpub\semiprecious\images\jng" sort="name" name="bigdir"  filter="#form.oldsite#*.*">
<cfif bigdir.recordcount>
Ha ! Found <cfoutput>#bigdir.recordcount# files for #form.oldsite# site.</cfoutput>
<cftry>
<cfloop  query="bigdir" >

<!--- <cffile action="read" file="d:\inetpub\semiprecious\images\#name#" variable="content">
<cfset tmpcontent  = replace(content,'#form.oldsite#Ultd','#form.newsite#','All')><cfset newcontent  = replace(tmpcontent,'#form.oldsite#','#form.newsite#','All')>
 ---><cfset newfname = replace(name,'#form.oldsite#','#form.newsite#','one')>
<cffile action="move"   source="d:\inetpub\semiprecious\images\jng\#name#"  destination="d:\inetpub\semiprecious\images\jng\#newfname#" >

<!--- <cfoutput>renaming  C:\CFusionMX\wwwroot\semiprecious\WWW\#form.oldsite##name# to C:\CFusionMX\wwwroot\semiprecious\WWW\#form.newsite# <br />
</cfoutput> --->

<!----<cffile  action="move" source="C:\CFusionMX\wwwroot\semiprecious\WWW\images\done\#cat#\#fname#" destination="C:\CFusionMX\wwwroot\semiprecious\WWW\images\#form.cat#\#idx#.jpg" >
<cffile  action="move" source="C:\CFusionMX\wwwroot\semiprecious\WWW\images\done\#cat#\thumb\#fname#" destination="C:\CFusionMX\wwwroot\semiprecious\WWW\images\#form.cat#\thumb\#idx#.jpg" >
---->
</cfloop>

<cfcatch type="any"><cfoutput>#cfcatch.Detail# error in cfloop #cfcatch.Message#</cfoutput></cfcatch></cftry>
<cfelse>
<cfoutput>The no. of files for the specified filter are not same in the #form.oldsite# directory. 
In the big dir they are #bigdir.recordcount# and .

</cfoutput>
</cfif>
Done .
</cfif>
</body>
</html>
