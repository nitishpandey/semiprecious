<!--- nitish. 28 Jun 2010. Added optionid to query so that distinct does not collapse rings with same ID but with different options into one entery. --->
<!--- nitish. 29 Jun 2010. While the query pulls out items that are in India, it also pulls out items that are in US as well. During output of query (to keep burden on DB limited) Added not like 'US' in storage to not to include items that are in US --->
<!--- nitish. 24 Jun 2010. Added break up of silver and beads weight to be able to do fresh computation of each quickly on removing a few rows in output --->
<!--- nitish. 28 Jun 2010. checking in notes prescense of IN- to make sure these are only india items --->

<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->


<cfset Variables.stone_weight = 0 />
		<cfset Variables.silver_weight = 0 />
<cfset Variables.cart_total = 0 />	
<cfset Variables.invoice_total = 0 />

<cfquery datasource="gemssql" name="s">
	Select  distinct  CartforOthers.cartid as cc,  buyingrecord.optionid as optionid, itemid,note, quantity, cat, price, buyingrecord.rate as cr, basecost, subcat, subcat2, weight from cartstatus, items, buyingrecord ,  CartforOthers where  buyingrecord.itemid=items.newitem and buyingrecord.cartid=cartstatus.cartid and cartstatus.cartid=CartforOthers.cartid  and shipdate is null  and (items.storage like 'IN%'  )  and cartstatus.cartid>(select max(cartid)-2000 from cartstatus) order by    CartforOthers.cartid, cat
</cfquery>
<html>
<body>
<head>
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
 <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<style lang="text/css" type="text/css"  >
	<![[CDATA
#summary_box {
position:absolute;
top:10px;
left:0;
border:1px black solid;
}
#exporter {
float:left;
width:50%;
height:40px;

}
#consignee {
float:left;
width:50%;
height:40px;

}
	]]>
</style>
</head>
<body>
<div id="summary_box">
<div id="exporter">
ACEMatrix  Industries Ltd
B 16, 1st floor, ARD Complex
SEc 13
R K Puram
New Delhi 110066</div>
<div id="consignee">
Semiprecious.com
Anup Pandey
1512 Anise Drive,
Austin, TX 78741
USA
Cell No.: +151258990009
</div>
<div id="pre_carriage">&nbsp;</div>
<div id="receipt_place">&nbsp;</div>
<div id="shipment_by">AIR</div>
<div id="loading_port">New Delhi</div>
<div id="port">USA</div>
<div id="final_destination">USA</div>
<div id="invoice_no">a/ads a0120/asdf </div>
<div id="exporters_ref">&nbsp;</div>
<div id="buyer_order_no"></div>
<div id="other_buyer"></div>
<div id="country_of_origin">India</div>
<div id="country_destination">USA</div>
<div id="terms">Sale Basis</div>
</div>
<form action='invoiceindiaashtm.cfm' method="post" > 
<table><tbody><thead>
<th>Invoice</th><th>itemID</th><th>Category</th><th>Description</th><th>Qty</th><th>Customer(USD)</th><th>Cost(Rs)</th><th>Sellprice(USD)</th>
<th>weight</th><th>Beads</th><th>Silver
</th><th>Returns</th>
<th>Pack?</th></thead>
	<cfoutput  query="s" group="cc"  >
	<cfset adf = 0 />
	<cfoutput>
	<cfset show = 0 />
		<cfif isdefined("form.items")>
			<cfif listfind(form.items,"#cc#_#itemid#_#optionid#")>
				<cfset show = 1 />
			</cfif>		
			<cfelseif note contains 'IN-'>
				<cfset show = 1 />
			</cfif>
		<cfif show>
	<cfquery datasource="gemssql" name="r">
	select returns.cartid as rc, returns.itemid as ri, returns.optionid as ro, returns.qty as rq from returns where returns.cartid = #cc# and returns.itemid = #itemid# and returns.optionid = #optionid#
	</cfquery>
	<cfif r.recordcount><cfset qr = r.rq><cfelse><cfset qr =  0 /> &nbsp;</cfif><cfset adf = adf + quantity - qr>
	<tr class="row#currentrow mod 2#"><td>#cc#</td><td>#itemID#</td>
	<td>#cat#</td><td> #subcat# #subcat2# #lcase(left(cat, len(cat)-1))#</td><td>#quantity-qr#</td><td>#decimalformat(cr)#</td><td> #decimalformat(basecost)#</td><td> #decimalformat(basecost*1.1/application.exchangerate)#</td>
	<td><cfif weight neq ""> <cfset wt = decimalformat(weight*(quantity - qr))><cfelse><cfset wt = 0 ></cfif>#wt#</td><td> <cfif listfind("beads,necklaces,healing",cat)>#wt#<cfset Variables.stone_weight = Variables.stone_weight + wt /></td><td>0<cfelse><cfset Variables.stone_weight = Variables.stone_weight + 0.6*wt />#0.6*wt#</td><td>#0.4*wt#<cfset Variables.silver_weight = Variables.silver_weight + 0.4*wt /></cfif>
	</td>
	<td><a href="http://www.semiprecious.com/admintools/returns.cfm?cartid=#cc#&item=#itemid#&amount=#cr*quantity#&quantity=#quantity#&optionid=#optionid#">Refund</a>
	<cfif wt neq "">wt: #decimalformat(wt*0.035274)# oz</cfif>
</td><td><input type="checkbox" name="items" value="#cc#_#itemid#_#optionid#"></td>
</tr>
	<cfset Variables.invoice_total = Variables.invoice_total + basecost*1.1/application.exchangerate /> 
</cfif>
</cfoutput>
	<tr><td class="grayplacard" colspan="13">#adf#</td></tr>
</cfoutput>
</tbody>
</table>
		<cfif not isdefined("form.items")>
<input type="submit" value="Show Selected Only" />
</cfif>
</form>
<cfoutput>
	,Silver Wt and Value:, ,,,, , #variables.silver_weight#, #0.58*variables.silver_weight#
	,Beads Weight:, ,,,, , #variables.stone_weight#
	,Invoice total,,, #Variables.invoice_total#
	Labour Value = #0.15*Variables.invoice_total#
	
</cfoutput>
</body>
</html>