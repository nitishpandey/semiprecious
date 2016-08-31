<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimiter, Excel will open CSV files --->

<cfcontent type="application/msexcel">
<cfheader name="Content-Disposition" value="filename=semiprecious.txt">


<cfquery datasource="gemssql" name="s">
Select f.title as name, f.ID as SKU,f.description,items.cat as category1, items.subcat as category2,items.grouping as category3,
replace(image_link,'/thumb','') as imageURL,items.weight*0.002204 as weight, f.price,inventory as quantity from nitish.qryfrooglejewelry f, items where items.newitem=f.id
</cfquery>
<cfoutput>NAME;SKU;description;CATEGORY 1;CATEGORY 2;Image URL;Weight;Price;Quantity
</cfoutput>
<cfloop query="s"><cfoutput>#titlecase(name)#;#SKU#;#description#;#category1#;#category2#;#imageURL#;#weight#;#price#;#quantity##chr(13)#
</cfoutput>
</cfloop>