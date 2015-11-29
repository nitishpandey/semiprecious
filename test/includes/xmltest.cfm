<cffile action="read" file="#application.rootfolder#includes\yahoo.xml" variable="f" />
<cfset k = xmlparse(trim(f)) />
<cfset xmlexp = 'yahoo:contacts'>
<cfset p = xmlsearch(k,xmlexp) />
<cfoutput>#xmlexp#,</cfoutput>
<cfloop index="j" from=1 to="#arraylen(k.contacts[1].contact)#">
<cfdump var="#k.contacts[1].contact[j].XmlChildren[3].XmlChildren[3].XmlText#">
</cfloop>
<cfdump var="#p#">-<!--- <cfdump var="#k#">
 --->