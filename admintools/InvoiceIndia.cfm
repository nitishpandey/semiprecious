<!--- nitish. 28 Jun 2010. Added optionid to query so that distinct does not collapse rings with same ID but with different options into one entery. --->
<!--- nitish. 29 Jun 2010. While the query pulls out items that are in India, it also pulls out items that are in US as well. During output of query (to keep burden on DB limited) Added not like 'US' in storage to not to include items that are in US --->
<!--- nitish. 24 Jun 2010. Added break up of silver and beads weight to be able to do fresh computation of each quickly on removing a few rows in output --->
<!--- nitish. 28 Jun 2010. checking in notes prescense of IN- to make sure these are only india items --->

<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->

<cfheader name="Content-Disposition" value="filename=indiainvoice.csv">
<cfcontent type="application/text charset=UTF-8">

<cfset Variables.stone_weight = 0 />
		<cfset Variables.silver_weight = 0 />
<cfset Variables.cart_total = 0 />	
<cfset Variables.invoice_total = 0 />

<cfquery datasource="gemssql" name="s">
	Select  distinct  CartforOthers.cartid, optionid, itemid,note, quantity, cat, price, buyingrecord.rate, basecost, subcat, subcat2, weight from items, buyingrecord , cartstatus,  CartforOthers where buyingrecord.itemid=items.newitem and buyingrecord.cartid=cartstatus.cartid and cartstatus.cartid=cartforothers.cartid and shipdate is null  and (items.storage like 'IN%'  )  and cartstatus.cartid>(select max(cartid)-2000 from cartstatus) order by    CartforOthers.cartid, cat
</cfquery>
<cfoutput>,Invoice,itemID,Category,Description,Cost(Rs),Sellprice(USD),quantity,weight,Beads,Silver
</cfoutput>
	<cfoutput  query="s"><cfif note contains 'IN-'>,#cartid#,#itemID#, #left(cat,len(cat)-1)#, #subcat# #subcat2# #lcase(left(cat, len(cat)-1))#, #basecost#, #basecost*1.1/application.exchangerate#, #quantity#, #decimalformat(weight)#,<cfif listfind("beads,necklaces,healing",cat)>#weight#<cfset Variables.stone_weight = Variables.stone_weight + weight />,<cfelse><cfset Variables.stone_weight = Variables.stone_weight + 0.6*weight />#evaluate(0.6*weight)#,#evaluate(0.4*weight)#<cfset Variables.silver_weight = Variables.silver_weight + 0.4*weight /></cfif>#wrap("1", 1)#
	<cfset Variables.invoice_total = Variables.invoice_total + basecost*1.1/application.exchangerate /> 
</cfif></cfoutput>
<cfoutput>
	,Silver Weight:, ,,,, , #variables.silver_weight#
	,Beads Weight:, ,,,, , #variables.stone_weight#
	,Invoice total,,, #Variables.invoice_total#
	
</cfoutput>