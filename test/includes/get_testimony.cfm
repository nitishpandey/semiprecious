<cffile action="read" file="#application.rootfolder#includes\testimonies.xml" variable="f" />
<!--- xml indexing uses 1 like coldfusion --->
<cfset Variables.tx = xmlParse(f) />
<cfset ran =  randRange(1,arraylen(tx.testimonies.div)) />
<cfset Variables.testimoney =  tx.testimonies.div[ran].XmlText />


