<cfparam name="wanted" default="1,2,3,4,5,6,7,8,9,10">
<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=pippin.csv">


<cfquery datasource="gemssql" name="s">
Select * from qryFroogleJewelry where ID in (#wanted#)
</cfquery>
<cfoutput>link~Title~description~price~image_link~ID~Brand~payment_accepted~payment_notes~product_Type~quantity~condition~color~Weight~Year~currency
</cfoutput>
<cfloop query="s"><cfoutput>#link#~#Title#~#description#~#price#~#image_link#~#ID#~#Brand#~#payment_accepted#~#payment_notes#~#product_Type#~#quantity#~#condition#~#color#~#Weight#~#Year#~#currency#
</cfoutput>
</cfloop>