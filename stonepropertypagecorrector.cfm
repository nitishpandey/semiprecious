<html>
<head>
<title>property file corrector</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>


<cfset rootpath = getdirectoryfrompath(gettemplatepath())>
<cffile  action="read" file="#rootpath#texttoadd.htm" variable="toadd">
<cffile  action="read" file="#rootpath#listofstones.txt" variable="stoneslist">
<cfloop list="#stoneslist#" index="j">
<cftry>
<cffile action="read" file="#rootpath#\#j#.htm" variable="p"  >
<cfset k = replace(p,'<a href="http://www.semiprecious.com">
<img border="0" src="images/semiprecious.gif" align="left" width="450" height="68"></a>',"#toadd#","One") >  
				<cffile action="write" file="#rootpath#\#j#.htm" output="#k#" ><cfcatch type="any"><cfoutput>#cfcatch.Message#</cfoutput></cfcatch></cftry>
</cfloop>

</body>
</html>
