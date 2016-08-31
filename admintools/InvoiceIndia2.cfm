	<cfsetting enablecfoutputonly="yes"> <!--- Required for CSV export to function properly --->
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfheader name="Content-Disposition" value="filename=indiainvoice.csv">
<cfcontent type="application/text charset=UTF-8">

<cfset Variables.stone_weight = 0 />
		<cfset Variables.silver_weight = 0 />
<cfset Variables.cart_total = 0 />	
<cfset Variables.invoice_total = 0 />

<cfquery datasource="gemssql" name="s">
Select  distinct  CartforOthers.cartid,  itemid, quantity, cat, price, buyingrecord.rate, basecost, subcat, subcat2, weight from items, buyingrecord , cartstatus,  CartforOthers where buyingrecord.itemid=items.newitem and buyingrecord.cartid=cartstatus.cartid and cartstatus.cartid=cartforothers.cartid and shipdate is null  and (items.storage like 'IN%'  ) and cartstatus.cartid>(select max(cartid)-2000 from cartstatus) order by    CartforOthers.cartid, cat
</cfquery>
<cfoutput>Invoice,itemID,Category,Description,Cost(Rs),Sellprice(USD),quantity,weight, Silver, Beads
</cfoutput>
	<cfoutput group="cartid" query="s">
	#cartid#,,
	<cfoutput>
	 ,#itemID#, #left(cat,len(cat)-1)#, #subcat# #subcat2# #lcase(left(cat, len(cat)-1))#, #basecost#, #basecost*1.1/application.exchangerate#, #quantity#, #decimalformat(weight)##wrap("1", 1)#, ,
	<cfif listfind("beads,necklaces,healing",cat)>
		<cfset Variables.stone_weight = Variables.stone_weight + weight /><cfelse>
		<cfset Variables.stone_weight = Variables.stone_weight + 0.6*weight /><cfset Variables.silver_weight = Variables.silver_weight + 0.4*weight />
		</cfif> <cfset Variables.cart_total = Variables.cart_total + basecost*1.1/application.exchangerate /> 
</cfoutput>
 ,,,cart value:,,#cart_total#,,
<cfset Variables.invoice_total = Variables.invoice_total + Variables.cart_total />
<cfset Variables.cart_total = 0 />
</cfoutput>
<cfoutput>
	Invoice total (Rs):, ,,#Variables.invoice_total#,
	Silver:,,#Variables.silver_weight#  gm
	Beads:, , #Variables.stone_weight# gm
	Total:, ,
</cfoutput>
