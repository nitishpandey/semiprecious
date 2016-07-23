<cfparam name="categories" default="rings,bracelets,necklaces,pendants,healing,earrings,beads,all">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
Should run this once a month to include new files in case new stones have been added to a category.

<cfloop list="#categories#" index="cat">
<cfset c = cat>
<!--- <cfdirectory action="create" newdirectory="" 
directory structure can be taken up but that has issues since we are going to include ../list.cfm and
then list.cfm will have dependencies , as to how it has referenced images and other templates and hrefs 
thus for now i am just making categorystone
--->
<cfloop list="#evaluate('application.' & c & 'tones')#" index="s">
<cfoutput>#s#</cfoutput>
<cfif c is 'all'><cfset c='jewelry'></cfif>
<cfset v = "<cfset category = '" & c & "' > <cfset subcat ='" & trim(s) & "' >">

<cfset v = v & " <cfset reversefilename = 1> <cfinclude ">
<cfset v = v & " template='gemstone_jewelry_gallery.cfm' > " >
<cfset v2 = replace(v,'<cfset reversefilename = 1>',' ') />
<cfset s1 = replace(s,"_","")>
<cfset s1 = replace(trim(s1)," ","")>
<cfset c2 = replace(c,'s','') />
<!---<cftry>
<cffile action="delete" destination="D:\inetpub\semiprecious" file="D:\inetpub\semiprecious\#c##s#.cfm">
<cfcatch><cfoutput>#c##s1#.cfm, </cfoutput></cfcatch>
</cftry>--->
<cffile action="write" output="#v#" nameconflict="overwrite" destination="D:\inetpub\semiprecious" file="D:\inetpub\semiprecious\#s1#_#c#.cfm" >
<!---<cffile action="write" output="#v#" nameconflict="overwrite" destination="D:\inetpub\semiprecious" file="D:\inetpub\semiprecious\#c#_#s1#.cfm" >
<cffile action="write" output="#v2#" nameconflict="overwrite" destination="D:\inetpub\semiprecious" file="D:\inetpub\semiprecious\#c2#_#s1#.cfm" >
--->
</cfloop>
</cfloop>
</body>
</html>
