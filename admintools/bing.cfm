<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=semiprecious.txt">


<cfquery datasource="gemssql" name="s">
Select * from qryFroogleJewelry
</cfquery>
<cfoutput>MPID								 ImageURL																 Title ProductURL		 Price	Description
</cfoutput>
<cfloop query="s"><cfoutput>#ID#											 #image_link#						 #titlecase(Title)#	 #link#						 #price#	#description#	 						 												 
</cfoutput>
</cfloop>