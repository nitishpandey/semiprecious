<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=semiprecious.txt">


<cfquery datasource="gemssql" name="s">
Select * from qryFroogleJewelry
</cfquery>
<cfoutput>link~Title~description~price~image_link~ID~Brand~payment_accepted~payment_notes~product_Type~quantity~condition~color~Weight~Year~currency
</cfoutput>
<cfloop query="s"><cfoutput>#link#~#Title#-#description#~#price#~#image_link#~#ID#~#Brand#~#payment_accepted#~#payment_notes#~#product_Type#~#quantity#~#condition#~#color#~#Weight#~#Year#~#currency#
</cfoutput>
</cfloop>