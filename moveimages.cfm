

<cfset TheTimeDate=Now()>
<!--
	Convert the current time to the Greenwhich Mean Time
	(which is the required time that the Authorize.Net
	transaction server uses to verify xp_fingerprint)
-->
	<cfset UCT=DateConvert('local2UTC', TheTimeDate)>
	<cfoutput>#UCT#.....#theTimeDate#</cfoutput>

<cfset itemlist = "15389,15387, 15382,15378, 15377, 15374, 15373,15372, 15371, 15362,15361, 15360,15359, 15348,15344,15346,15397,15380,15379" />
<cfquery datasource="gemssql" name="k" >
<!---select cat as category ,newitem as itemid from items where newitem in (#itemlist#) order by newitem
--->
select cat, newitem as itemid from items where items.cat = 'gems'
</cfquery> 
<cfset counter = 0 />
<cfftp  secure="false" action="open" server="216.119.75.107" connection="pp" username="semiprecious" password="keya@keya1"  />
<cfif cfftp.succeeded>
<cfloop query="k" >
<cfftp action="changedir" connection="pp" directory="/" >
<cftry>
	<cfset counter = counter + 1 /> 
<cfftp action="changedir" connection="pp" directory="images\#cat#" >
<cfftp action="getFile" connection="pp" remoteFile="#itemid#.jpg" localfile="#application.rootfolder#images\#cat#\#Itemid#.jpg" failifexists="no"  >
<cfif cfftp.succeeded>
	#itemid#  
	<cfelse>
	<cfoutput>#itemid#</cfoutput>
	</cfif>
	<br />
<cfftp action="changedir" connection="pp" directory="/" >

<cfftp action="changedir" connection="pp" directory="\images\#cat#\thumb" >
<cfftp action="getFile" connection="pp" remoteFile="#itemid#.jpg" localfile="#application.rootfolder#images\#cat#\thumb\#Itemid#.jpg" failifexists="no"  >
<cfif cfftp.succeeded>
	#itemid#  
	<cfelse>
	<cfoutput>#itemid#</cfoutput>
	</cfif>
	<br />
<cfcatch type="any">
<cfoutput>#cfcatch.message# ===>#itemid#</cfoutput>
</cfcatch>
</cftry>
</cfloop>

</cfif>