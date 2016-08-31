<cftry>
<html>
<head>
<title>File Generator</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
This page creates hubs.cfm as core for category
and gallery page for given stone name that shows all category for the stone.
and a gallery page for the stone for each of the category in which it is available (or the category that is provided in the form).

<cfif  isdefined("form.category")>
<cfif form.category is 'all'>
<cfset categories = Application.category_list />
<cfelse>
<cfset categories = form.category />
</cfif>
<cfloop list="#categories#" index="cat">
<cfset c = cat>
<cfset v1 = "<cfset category = '" & c & "' >   <cfinclude ">
<cfset v1 = v1 & " template='list.cfm' > " >
<!--- <cfdirectory action="create" newdirectory="" 
directory structure can be taken up but that has issues since we are going to include ../list.cfm and
then list.cfm will have dependencies , as to how it has referenced images and other templates and hrefs 
thus for now i am just making categorystone
--->
<cfif isdefined("form.newstone")>
	<cfset stonelist = "#form.newstone#" />
<cfelse>
<cfset stonelist = evaluate('application.' & c & 'tones') />
</cfif>
<cfloop list="#stonelist#" index="s">
<cfoutput>#s#</cfoutput>
<cfset hub = "<cfset category = '#c#' />   <cfinclude  template='hubs.cfm' />" /> 
<cfset gal = "<cfset category = '#c#' />   <cfinclude  template='list.cfm' />" /> 

<cfset v = "<cfset category = '" & c & "' > <cfset subcat ='" & trim(s) & "' >
 <cfset reversefilename = 1> <cfinclude ">
<cfset v = v & " template='list.cfm' > " >

<cfset v2 = "<cfset category = '" & c & "' > <cfset subcat ='" & trim(s) & "' >  <cfinclude ">
<cfset v2 = v2 & " template='list.cfm' > " >
<cfset v3 ="<cfset subcat ='" & trim(s) & "' >  <cfinclude ">
<cfset v3 = v3 & " template='list.cfm' > " >

<cfset s1 = replace(s,"_","")>
<cfset s1 = replace(trim(s1)," ","")>
<cfswitch expression="#c#">
<Cfcase value="necklaces">
<cfset b = "necklace">
</Cfcase>
<Cfcase value="bracelets">
<cfset b = "bracelet">
</Cfcase>

<Cfcase value="earrings">
<cfset b = "earring">
</Cfcase>
<Cfcase value="rings">
<cfset b = "ring">
</Cfcase>

<Cfcase value="pendants">
<cfset b = "pendant">
</Cfcase>
<cfdefaultcase>
<cfset b = c />
</cfdefaultcase>
</cfswitch>
<cffile action="write" output="#v#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#b#_#s1#.cfm" >
<cffile action="write" output="#v2#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#s1#_#b#.cfm" >
<cffile action="write" output="#v#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#c#_#s1#.cfm" >
<cffile action="write" output="#v2#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#s1#_#c#.cfm" >
    <cfif not isdefined("stone_has_hub")>
	<cffile action="write" output="#v3#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#s1#_jewelry.cfm" >
   </cfif>
</cfloop>
<cfif isdefined("make_cat_hub")>
<cffile action="write" output="#hub#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#c#.cfm" >
<cfelse>
<cffile action="write" output="#gal#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#c#.cfm" >
</cfif>
<cffile action="write" output="#v1#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#b#.cfm" >
<cffile action="write" output="#v1#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\gem-stone-#c#.cfm" >

</cfloop>
</cfif>
Create Files for :
<form action="" method="post">
New Category : <input type="text" name="category" > [all to create pages for all cateogries else name a specific category lik pendants]
all, necklaces,brooches,bracelets,earrings,pendants,rings,cufflinks,healing\<br /> 
Category page a hub (not a gallery) <input type="checkbox" name="make_cat_hub" />
<br />
Stone Name: <input type="text" name="newstone" > [Leave blank to process for all stones]
<br /> Stone page a hub (not a gallery) <input type="checkbox" name="stone_has_hub" />
<input type="submit" /></form>
</body>
</html>
<cfcatch type="any">
<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>
