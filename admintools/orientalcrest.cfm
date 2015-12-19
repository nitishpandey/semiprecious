<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=orientalsemiprecious.csv">


<cfquery datasource="gemssql" name="s">
Select newitem, storage, supplier,price, description, size, inventory from items where supplier like 'OC%'
</cfquery>
<cfoutput>ItemID~Storage~price~description~size~inventory<br>
</cfoutput>
<cfloop query="s"><cfoutput>#newitem#~#Storage#~#price#~#description#~#size#~#inventory#<br>
</cfoutput>
</cfloop>