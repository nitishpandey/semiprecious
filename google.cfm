<html>
		<head>
		<meta name="robots" content="noindex,nofollow">
		</head>
		<body>
		</BODY>
		</html>
		<cfabort>
		<html>
<head><title>Search Semiprecious.com Using Google!</title></head>
<body topmargin="0" >
<div align="center">
<cfinclude template="header.cfm">

	<cfparam default="real coral silver turquoise"  name="url.q" type="string" />
  
<cfscript>
arg_coll = structNew();
arg_coll.key = 'wiDtSPRQFHLDgvPOBpBRtkEg8tTeQL8';
arg_coll.q = '#urldecode(url.q)# ';
arg_coll.start = 1;
arg_coll.lr = '';
arg_coll.ie = 'UTF-8';
arg_coll.oe = 'UTF-8';
arg_coll.maxResults = 10;
arg_coll.filter = True;	 				 
arg_coll.restrict = '';
arg_coll.safeSearch = False;
 siteslisting = '' ;
</cfscript>
<!---
<cfset myobj = createobject("/googleapi/GoogleSearch.wsdl") />
<cfdump var="#myobj#" />
<cfabort /> --->
<cfinvoke webservice="gs"
 method="doGoogleSearch"
  argumentcollection="#arg_coll#"
  returnVariable="siteslisting" />

  <cfdump var="#siteslisting#" label="Jano" />  
	<cfabort />
<cfscript>
 g = siteslisting.estimatedTotalResultsCount ;
stime = siteslisting.searchTime;
 sitearray = siteslisting.resultElements ;

 </cfscript>
 <cfoutput>Searched:<strong>#url.q#</strong>, Found: <strong>#g#</strong>, searchtime = #stime# Sec. <img src="images/photo.cms.gif" border="0" vspace="0" hspace="0" width="117" height="21"> 
    <div style="padding:3px;border:##DADA99 0px ridge;margin:2px;width:580px;background-color:##DADA99;font-style:bold;font-weight:bold;">Search 
      again: 
      <form style="display:inline" method="get" action="google.cfm"><input type="text" name="q" size="30"><input type="submit"  value="Search Using Google"><input type="hidden" name="ie" value="utf-8" ></form></div>
  <cfif g >

<div  style="width:700px;top:0px;display:inline;" align="left">
<cfloop from="1" to="#arraylen(sitearray)#" index="idx">
<div >#idx#.<a href='#sitearray[idx]["URL"]#'> #sitearray[idx]["snippet"]#</a><a href='#sitearray[idx]["URL"]#' target="nw"><img style="display:inline;bottom=-5px;" src="images/nw2.gif" border="0" vspace="0" hspace="0" width="11" height="11" ></a>
<hr /></div>
</cfloop>
</div>
<div style="position:absolute;left:600px;top:125px;display:inline;z-index:2">
<cfinclude template="googleadsvertical.cfm">
</div>
<cfelse>#siteslisting.searchTips#<br><cfscript>
arg_coll = "";
arg_coll = structNew();
arg_coll.key = 'wiDtSPRQFHLDgvPOBpBRtkEg8tTeQL8m';
arg_coll.phrase = '#url.q#';
</cfscript>
Nothing matching your query words found. Please make sure you have not spelt a word incorrectly.
<cftry><cfinvoke webservice="http://www.semiprecious.com/googleapi/GoogleSearch.wsdl"
 method="doSpellingSuggestion"
  argumentcollection="#arg_coll#"
  returnVariable="s" />
  <cfif isdefined("s")>
<span style="padding:3px;background-color:yellow;display:block;"><a href="google.cfm?q=#urlencodedformat(s)#">Did you want to search for : #s# ? </a></span></cfif>
<cfcatch type="any">
</cfcatch></cftry>
</cfif>

</cfoutput>
 <cfinclude template="footer.htm" >
</div>
</body>
</html>
