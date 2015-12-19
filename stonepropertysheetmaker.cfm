<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfdirectory directory="C:\CFusionMX\wwwroot\semiprecious\WWW\np\stones\" action="list" name="fileslist">
<!-- Begin Web-Stat code -->
<cfloop query="fileslist" >
<cfoutput>#name#</cfoutput>

<cffile action="read"  file="C:\CFusionMX\wwwroot\semiprecious\WWW\np\stones\#name#" variable="content">
<!--- <cfset posofbottomimage = findnocase("B041",content,findnocase("B041",content,10) +10)> --->
<cfset content = replacenocase(content,"B041.jpg","PPP","All")>
<cfset content = replace(content,"PPP","B041.jpg","one")>
<cfset content = replace(content,"PPP","lg.bmp","one")>
<cffile action="write" charset="Latin1"    file="C:\CFusionMX\wwwroot\semiprecious\WWW\#lcase(name)#" output="#content#" addnewline="yes" >

<cffile action="append" charset="Latin1" file="C:\CFusionMX\wwwroot\semiprecious\WWW\#lcase(name)#" output="#a##b##c##d##e##f##g##h##i##j##k##l##m#" addnewline="yes">
</cfloop>
</body>
</html>
