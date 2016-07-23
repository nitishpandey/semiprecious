<cfparam default="obsidian bracelet" name="url.criteria">
<cfset criteria = lcase(replacenocase(url.criteria,'+',' OR ',"All"))>
<cfset criteria = lcase(replacenocase(url.criteria,' ',',',"All"))>
<cfset criteria = lcase(replacenocase(url.criteria,' ,OR','OR',"All"))>
<cfset criteria = lcase(replacenocase(url.criteria,' OR,','OR',"All"))>

<cfoutput>Searching for #criteria#.</cfoutput>
<cfsearch 
 collection="jewelrydescription"
 type="simple"
 criteria="#criteria#"
startrow=1 name="veritylist"
 language="english"
  >
<cfoutput>#veritylist.recordcount#</cfoutput>
<cfdump var="#veritylist#" expand="yes">
