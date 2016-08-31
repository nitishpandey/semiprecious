<!--- nitish. 18 Agu 2140. Added file saving to upsinvoices folder when invoice no. is given --->
<!--- nitish. 28 Jun 2140. Added optionid to query so that distinct does not collapse rings with same ID but with different options into one entery. --->
<!--- nitish. 29 Jun 2140. While the query pulls out items that are in India, it also pulls out items that are in US as well. During output of query (to keep burden on DB limited) Added not like 'US' in storage to not to include items that are in US --->
<!--- nitish. 24 Jun 2140. Added break up of silver and beads weight to be able to do fresh computation of each quickly on removing a few rows in output --->
<!--- nitish. 28 Jun 2140. checking in notes prescense of IN- to make sure these are only india items --->
<cfparam name="form.invoice" default=""  />
<cfset delim = 44> <!--- Use a comma for a field delimitter, Excel will open CSV files --->
<cfset Variables.stone_weight = 0 />
		<cfset Variables.silver_weight = 0 />
<cfset Variables.cart_total = 0 />	
<cfset Variables.invoice_total = 0 />
<cftry>
<cfquery datasource="gemssql" name="s">
	Select  distinct  CartforOthers.cartid as cc, buyingrecord.inventoryatsale as ias,  buyingrecord.optionid as optionid, itemid,buyingrecord.note, quantity, cat, price, buyingrecord.rate as cr, basecost, case subcat when 'jade' then 'synthetic jade' when 'ruby' then 'synthetic Ruby (Not from Burma)' when 'amber' then 'synthetic amber' else subcat end "subcat", case subcat2 when 'amber' then 'synthetic amber' when 'jade'then 'synthetic jade' when 'ruby' then 'synthetic ruby' else subcat2 end "subcat2", weight from cartstatus, items, buyingrecord ,  CartforOthers 
	where     buyingrecord.itemid=items.newitem and buyingrecord.cartid=cartstatus.cartid and cartstatus.cartid=CartforOthers.cartid  
	and cartstatus.cartid in (#form.cartlist#)
  and ((items.storage like 'IN%' or (buyingrecord.note  like 'IN-%') ) or (buyingrecord.inventoryatsale < 0)) 
<cfif len(trim(form.cartlist2))> 
union 
	Select  distinct  CartforOthers.cartid as cc, buyingrecord.inventoryatsale as ias,  buyingrecord.optionid as optionid, itemid,buyingrecord.note, quantity, cat, price, buyingrecord.rate as cr, basecost,case subcat when 'jade' then 'synthetic jade' when 'amber' then 'synthetic amber' when 'ruby' then 'synthetic ruby (Not from Burma)'  else subcat end "subcat", case subcat2 when 'amber' then 'synthetic amber' when 'jade'then 'synthetic jade' when 'ruby' then 'synthetic ruby'  else subcat2 end "subcat2",  weight from cartstatus, items, buyingrecord ,  CartforOthers 
	where 
    buyingrecord.itemid=items.newitem and buyingrecord.cartid=cartstatus.cartid and cartstatus.cartid=CartforOthers.cartid  
	 and cartstatus.cartid in (#form.cartlist2#)
  and ((items.storage like 'IN%' or (buyingrecord.note  like 'IN-%') ) or (buyingrecord.inventoryatsale < 0)) </cfif> 
 order by    CartforOthers.cartid, cat
</cfquery>
<cfcatch type="any">
<cfdump var="#cfcatch#">
<cfoutput>#form.cartlist#</cfoutput>
<cfabort></cfcatch>

</cftry>
<!--- 
<cfquery datasource="gemssql" name="s">
	Select  distinct  CartforOthers.cartid as cc, shipdate,  buyingrecord.optionid as optionid, itemid,note, quantity, cat, price, buyingrecord.rate as cr, basecost, subcat, subcat2, weight from cartstatus, items, buyingrecord ,  CartforOthers 
	where cartstatus.cartid <> 0 and
    buyingrecord.itemid=items.newitem and buyingrecord.cartid=cartstatus.cartid and cartstatus.cartid=CartforOthers.cartid  and shipdate is null  and (items.storage like 'IN%'  )  order by    CartforOthers.cartid, cat
</cfquery>
 --->
<cfsavecontent variable="the_content">
<html>
<head>
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
 <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<style LANG="text/css" type="text/css"  >
	<!-- 
	
#summary_box {
position:relative;
top:10px;
left:0;
border:0px black solid;
width:99%
}
#summary_box div {
	text-align:left;
	float:left;
	border:1px solid black;
	padding:2px;
	width:194px
} 
#summary_box div div{
	float:left;
	margin:0;
} 

#exporter {
	position:absolute;
	top:-8px;
	left:0;
	width:49%;
	height: 66px;
}
#consignee {
	position:absolute;
	top:62px;
	left:0px;
	width:49%;
	height:90px;
}
#pre_carriage#
{
position:absolute;
top:122px;
left:0;
height:14px;

}
.small_box {
height:20px;
width:25%;
float:left;
}
#shipment_by 
{
position:absolute;
top:134px;
left:0;
}
.label {
font-weight:700;
display:block;
}
//	body {
	background-image: url(%20);
}
#apDiv1 {
	position:absolute;
	left:32px;
	top:349px;
	width:629px;
	height:246px;
	z-index:1;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body style="background:white;margin-top:0;width:900px;">


<p>
<div align="center">
<div id="summary_box">
	<div id="exporter" style="width:379px;" >
	<span class="LABEL" style="display: inline;">Exporter:</span>
	ACEMatrix  Industries Ltd<br />
	B 16, 1st floor, ARD Complex<br />
	SEc 13
	R K Puram<br />
	New Delhi 110066
	</div>
 
<div id="consignee" style="width:379px">
		<span class=""><strong>Consignee:</strong></span>

semiprecious.com<br />
(Anup Pandey)<br />
1512 Anise Dr<br />
Austin, TX 78741<br />USA<br />Phone: 5123867676
			<div style="position: absolute; left: 0pt; top: 94px;" id="pre_carriage"><span class="label">Pre-Carriage By</span></div>
	  <div style="position: absolute; left: 203px; top: 94px;" id="receipt_place"><span class="label">Place of Receipt by Carrier</span></div>
			<div style="position: absolute; left: 0px; top: 117px;" class="small_box" id="shipment_by"><span class=""><strong>Shipment By</strong>: </span>AIR</div>
			<div style="position: absolute; left: 203px; top: 115px;" class="small_box" id="loading_port"><span class=""><strong>Port of Loading</strong>: </span>New Delhi</div>
	  <div id="port" style="position: absolute; left: 0px; top: 139px;"><span class=""><strong>Port of Discharge</strong>: </span>USA</div>
			<div id="final_destination" style="position: absolute; left: 204px; top: 141px;"><span class=""><strong>Final Destination</strong>: </span>USA</div>
</div>
			<div style="width:400px;border: 0px none; height: 250px; position: relative; top: 0pt; left: 50.5%; background-color: #FFFFFF; layer-background-color: #FFFFFF;">
<div class="small_box" id="invoice_no"><cfoutput>#form.invoice#</cfoutput></div>
					<div id="exporters_ref"><span class="label">Exporter's Ref.</span></div>
					<div style="width: 99%; top: 43px; left: 0pt; height: 44px;" id="buyer_order_no"><span class="label">Buyer's Order No. &amp; Date</span></div>
			  <div style="width: 99%; top: 88px; left: 0pt;" id="other_buyer"><span class="label">Buyer (if Other than Consignee)</span></div>
					<div class="small_box" id="country_of_origin" style="height: 40px;"><span class="label">Country of Origin of Goods</span>India</div>
			  <div class="small_box" id="country_destination" style="height: 40px;"><span class="label">Country of final Destination</span>USA</div>
					<div id="terms" style="position: absolute; width: 253px; top: 158px; left: 1.5pt; height: 60px;"><span class="label">Terms of Delivery and Payment</span><br />
					Sale Basis
					</div>
    </div>
  </div>
<br />
<div style="position:absolute;left:4px;top:283px;text-align:left;border-bottom:1px gray dotted">
						<cfif isdefined("form.Tracking1")>
							<cfoutput>#form.tracking1# #form.shippedby#</cfoutput></cfif><br />

            <strong>&nbsp; &nbsp; &nbsp; &nbsp; box containing         92.5 SILVER & BEADED JEWELLERY SET WITH SEMIPRECIOUS STONES</strong>
</div>
<form action='invoiceindiaashtm.cfm' method="post" > 
	<cfoutput><input type="hidden" name="cartlist" value="#form.cartlist#" /></cfoutput>
	<cfoutput><input type="hidden" name="cartlist2" value="#form.cartlist2#" /></cfoutput>


<table style="margin-top: 280px; width: 890px; border: 0px solid gray;">	
	
	<thead style="border:1px gray solid;border-top:4px solid black;">
<th width="15%">BoxNo./Cartid</th><th width="15%">itemID</th><th width="32%">Description</th><th>Qty</th>
<cfif isdefined("form.accounts")><th>Cost(Rs)</th>
		<th>Customer(USD)</th>
		<cfelse><th>Sellprice(USD)</th><th width="22%">Amount</th>
<th width="32%">weight (gm)</th></cfif>
<!-- <th>Beads</th><th>Silver
</th> --><cfif not isdefined("form.items")>
	<th>Returns</th>
<th>Pack?</th>
</cfif></thead>
	<cfset counter2= 0 />
	
	<cfset counter1= 0 />
	<cfoutput group="cc" query="s">
	
	<cfset counter= 0 />
		<cfif isdefined("form.items") or 1>
	<cfset count = 0 />
					
	<cfoutput  >
		<cfset dd = s.cc />
				<cfset show = 0 />

		<cfif isdefined("form.items")>
			<cfif listfind(form.items,"#cc#_#itemid#_#optionid#")>
					<cfset show = 1 />
					<cfif count is 0 >
						<cfset counter2 = counter2 +1 >
						<cfset count = 1 />
					</cfif>
			</cfif>		
			<cfelseif note contains 'IN-'>
				<cfset show = 1 />
			</cfif>
		<cfif show>
		<cfset show = 0 />
		
		<cfquery datasource="gemssql" timeout="10"  name="r">
			select returns.cartid as rc, returns.itemid as ri, returns.optionid as ro, returns.qty as rq from returns where returns.cartid = #cc# and returns.itemid = #itemid# and returns.optionid = #optionid#
		</cfquery>
	
	
	<cfif r.recordcount>
		<cfset qr = r.rq>
	<cfelse>
		<cfset qr =  0 /> &nbsp;
	</cfif>
<cfset qr = 0 /> <!--- we have now started reducing refund items directly in the buying record hence no need to minus it here --->
	<cfset counter = counter +  quantity - qr />
				<cfset counter1= counter1 +  quantity - qr />
	<cfif evaluate(quantity-qr) >
	<tr class="row#currentrow mod 2#"><td>#cc#</td><td>#itemID#</td>
	<td align="left"> 
		#subcat# #subcat2# #lcase(left(cat, len(cat)-1))#</td>
	<td>#quantity-qr#
    </td>
		<cfif isdefined("form.accounts")>
			<td> #decimalformat(basecost)#</td>
			<td>#decimalformat(cr)#</td>
		<cfelse>
			<td> #decimalformat(basecost*1.25/application.exchangerate)#</td>
			<td>#decimalformat(basecost*1.25/application.exchangerate)*(quantity-qr)#</td>
		</cfif>
		<cfif weight neq ""> 
			<cfset wt = (weight*(quantity - qr))>
		<cfelse>
			<cfset wt = 0 >
	</cfif>
	<cfif not isdefined("form.accounts")>
	<td>#decimalformat(wt)#</td></cfif>
	<!-- <td> 
		<cftry>
		<cfif listfind("beads,necklaces,healing",cat)>#decimalformat(wt)#<cfset Variables.stone_weight = Variables.stone_weight + wt /></td>
		<td>0<cfelse>
		
		<cfset Variables.stone_weight = Variables.stone_weight + 0.6*wt />#decimalformat(0.6*wt)#</td>
		<td>#decimalformat(0.4*wt)#<cfset Variables.silver_weight = Variables.silver_weight + 0.4*wt />
		</cfif>
		<cfcatch type="any">
		<cfoutput>#wt#,#cfcatch.detail#, </cfoutput>
		</cfcatch>
		</cftry>
	</td>
	 -->
	 <cfif not isdefined("form.items")>
	 	<td>
		 <a href="http://www.semiprecious.com/admintools/returns.cfm?cartid=#cc#&item=#itemid#&amount=#cr*quantity#&quantity=#quantity#&optionid=#optionid#">Refund</a>
		<cfif wt neq "">wt: #decimalformat(wt*0.035274)# oz</cfif>
		</td>
		<cfif ias LT 0 and Len(ias) >
			<td style="background-color:red;">#ias#

			<input type="checkbox" name="items" value="#cc#_#itemid#_#optionid#">
				<cfelse>
				<td>##
			<input type="checkbox" name="items" checked value="#cc#_#itemid#_#optionid#">
			</cfif>
			
		</td>
			
	</cfif>
</tr>
	<cfset Variables.invoice_total = Variables.invoice_total + (quantity-qr)*basecost*1.25/application.exchangerate /> 
	 </cfif>
	 	</cfif>
</cfoutput>
	
		<cfif counter and not isdefined("form.accounts")>	
		<tr><td>1</td>
			<td colspan="11" style="border-bottom:1px	groove black;"><strong>Packet Serial No. #counter2#</strong> Summary: Packet Id #dd#, Pieces: #counter# 
						<cfif isdefined("form.Tracking1") and isdefined("form.shippedby")>
							<cfif len(form.Tracking1)>
								<cfif isdefined("shippingdirect")>
										<cfset switchpaymode = 'switch'>
									<cfelse>
										<cfset switchpaymode = 'noswitch'>
							  	</cfif>
                                  <cfinvoke component="cartcontrol.cartmonitor" method="updatecart" >
                                        <cfinvokeargument name="cartid" value="#dd#" />
                                        <cfinvokeargument name="mode" value="#switchpaymode#" />
                                        <cfinvokeargument name="shippedby" value="#form.shippedby#" /> 					
										<cfinvokeargument name="tracking1" value="#form.tracking1#" />
                                	</cfinvoke>
                       				</cfif>
                        </cfif>
			</td></tr>
				</cfif>
	<cfelse>
		<cfif isdefined("form.items")>
			<cfif listfind(form.items,"#cc#_#itemid#_#optionid#")>
				<cfset show = 1 />
			</cfif>		
			<cfelseif note contains 'IN'>
				<cfset show = 1 />
			</cfif>
		<cfif show>
		<cfset show = 0 />
	<cfquery datasource="gemssql" timeout="10"  name="r">
		select returns.cartid as rc, returns.itemid as ri, returns.optionid as ro, returns.qty as rq from returns where returns.cartid = #cc# and returns.itemid = #itemid# and returns.optionid = #optionid#
	</cfquery>
	
	<cfif r.recordcount>
		<cfset qr = r.rq><cfelse><cfset qr =  0 /> &nbsp;</cfif>
		<cfset qr = 0 /> <!--- we have now started reducing refund items directly in the buying record hence no need to minus it here --->

	<cfset counter = counter +  quantity - qr />
	<tr class="row#currentrow mod 2#"><td>&nbsp;</td><td>#itemID#</td>
	<td> #subcat# #subcat2# #lcase(left(cat, len(cat)-1))#</td>
	<cfif isdefined("form.accounts")>
		<td>#decimalformat(cr)#</td>
		<td> #decimalformat(basecost)#</td>
	</cfif>
	
	<td> #decimalformat(basecost*1.25/application.exchangerate)#</td>
	<td>#quantity-qr#</td>
	<td>#decimalformat(basecost*1.25/application.exchangerate)*(quantity-qr)#</td>
	
		<cfif weight neq ""> 
			<cfset wt = (weight*(quantity - qr))>
		<cfelse>
			<cfset wt = 0 >
	</cfif>
	<cfif not isdefined("form.accounts")>
	<td>#decimalformat(wt)#</td></cfif>
	<!-- <td> 
		<cftry>
		<cfif listfind("beads,necklaces,healing",cat)>#decimalformat(wt)#<cfset Variables.stone_weight = Variables.stone_weight + wt /></td>
		<td>0<cfelse>
		
		<cfset Variables.stone_weight = Variables.stone_weight + 0.6*wt />#decimalformat(0.6*wt)#</td>
		<td>#decimalformat(0.4*wt)#<cfset Variables.silver_weight = Variables.silver_weight + 0.4*wt />
		</cfif>
		<cfcatch type="any">
		<cfoutput>#wt#,#cfcatch.detail#, </cfoutput>
		</cfcatch>
		</cftry>
	</td>
	 --><cfif not isdefined("form.items")>
	 <td>
		 <a href="http://www.semiprecious.com/admintools/returns.cfm?cartid=#cc#&item=#itemid#&amount=#cr*quantity#&quantity=#quantity#&optionid=#optionid#">Refund</a>
	<cfif wt neq "">wt: #decimalformat(wt*0.035274)# oz</cfif>
</td>
<td>##<input type="checkbox" name="items" value="#cc#_#itemid#_#optionid#"></td>
</cfif>
 </tr>
	<cfset Variables.invoice_total = Variables.invoice_total + (quantity-qr)*basecost*1.25/application.exchangerate /> 
</cfif>
</cfif>
	</cfoutput> 
	<cfif isdefined("form.qtys")>
		<cfloop from="1" to="#listlen(form.itemids)#" index="ii">
<cfoutput>			<tr><td> </td><td><cfif listgetat(form.itemids,ii)>#listgetat(form.itemids,ii)#<cfelse>New Item</cfif></td><td>
#listgetat(form.cats,ii,",")#</td>
				<td>#listgetat(form.Qtys,ii,",")#</td>
				<cfif isdefined("form.accounts")>
		<td>#decimalformat(trim(listgetat(form.client,ii,",")))#</td>
		<td> #decimalformat(trim(listgetat(form.basecost,ii,",")))#</td>
<Cfelse>
<td align="center"> #decimalformat(trim(listgetat(form.basecost,ii))*1.25/application.exchangerate)#</td>
	</cfif>
			

	<cfif not isdefined("form.accounts")>
			<td align="center">#decimalformat(trim(listgetat(form.basecost,ii,","))*1.25/application.exchangerate)*listgetat(form.Qtys,ii)#</td>
				<td align="center">#decimalformat(trim(listgetat(form.wts,ii))*listgetat(form.Qtys,ii))#</td>
			</cfif>
		
</cfoutput>	
		<cftry> 
<cfif listfind("beads,necklaces,healing",trim(listgetat(form.cats,ii)))>
				<cfset Variables.stone_weight = Variables.stone_weight + trim(listgetat(form.wts,ii)) />
			<cfelse>
				<cfset Variables.stone_weight = Variables.stone_weight + 0.6*trim(listgetat(form.wts,ii))*trim(listgetat(form.qtys,ii)) />
				<cfset Variables.silver_weight = Variables.silver_weight + 0.4*trim(listgetat(form.wts,ii))*trim(listgetat(form.qtys,ii)) />
			</cfif>
		<cfcatch type="any">
		<cfoutput>#wt#,#cfcatch.detail#, </cfoutput>
		</cfcatch>
		</cftry>
			<cfif not isdefined("form.items")>
				 <td>
			  </td>
							<td> </td>
		  </cfif>
	<cfset Variables.invoice_total = Variables.invoice_total + trim(listgetat(form.basecost,ii))*1.25*trim(listgetat(form.qtys,ii))/application.exchangerate />
<cfset counter1 = counter1 + trim(listgetat(form.qtys,ii)) />	
		</cfloop>
</cfif>

</tbody>
</table>
<cfoutput><table >
<tr><td align="center" width="100%">Total no. of items  #counter1#. Total Value: #decimalformat(invoice_total)#.   </td><td>
</table></cfoutput>		
		<cfif not isdefined("form.items")>
			UPS Tracking no. <input type="text" name="Tracking1" />....
			Shipped By: <input type="text" value="UPS-india" name="Shippedby">
             Shipping Direct? <input type="checkbox" name="shippingdirect" /> 			
			UPS Invoice no. <input type="text" name="invoice" />
			Format for accounts?:  <input type="checkbox" name="accounts" />
			<br /><br />No. of Non-cart Items to add: 
			<input type="text" name="new_Qty" title="enter number of additional items" /> 
			Provide ID For each type of Item:<input type="text" name="itemids" title="enter itemids, 0 for new" /> (use 0 if no ID but input exact number of entries)<br />
			Qty for Each Item Type:<input type="text" name="qtys" title="enter itemids, 0 for new" /><br />
			Categories for each item:<input type="text" name="cats" title="enter itemids, 0 for new" /><br />
			Weights in GM for one item for each design:<input type="text" name="wts" title="enter itemids, 0 for new" />
			<br />
			Client Paid (USD):<input type="text" name="client" title="enter basecost" />,
			Base Cost (INR):<input type="text" name="basecost" title="enter basecost" />
			<input type="submit" value="Add Non-Cart Items and Remove Refunded Items" />
		</cfif>

</form>

<cfoutput>
	<hr style="border:1px gray dotted;">
	<div style="display:block;height:30px;">
		<div style="float:left;width:100px;font-weight:bold;">Net Wt.</div>
		<div style="float:left;width:60px;">#Decimalformat(variables.silver_weight+ variables.stone_weight)#</div>
	</div>
	<hr style="border:1px gray dotted;">
	<div style="display:block;height:30px;">
		<div style="float:left; width:100px;">Silver Wt</div>
    <div style="float:left;width:100px;font-weight:bold;">#Decimalformat(variables.silver_weight)#</div>
		<div style="float:left;width:100px;font-weight:bold;">Value:</div>
		<div style="float:left;width:100px;font-weight:bold;">#Decimalformat(0.975*variables.silver_weight)#</div>
	</div>
	<hr style="border:1px gray dotted;">
	<div  style="display:block;height:30px;">
		<div class="box_heading" style="float:left; width:100px;">Stone Weight:</div><div style="float:left;width:100px;font-weight:bold;">#Decimalformat(variables.stone_weight)#</div><div style="float:left;width:100px;font-weight:bold;">Value:</div><div style="float:left;width:100px;font-weight:bold;">#Decimalformat(Variables.invoice_total- 0.15*Variables.invoice_total- 0.975*variables.silver_weight)#</div>
	</div>      
	<hr style="border:1px gray dotted;">
	<div  style="display:block;height:30px;">
		<div class="box_heading" style="float:left;width:140px;">Labour Charges<span class="add_top_hr"></span></div><div style="float:left;width:100px;font-weight:bold;"> </div><div style="float:left;width:100px;font-weight:bold;">Value: </div><div style="float:left;width:90px;">#Decimalformat(0.15*Variables.invoice_total)#</div>
	</div>
	<hr style="border:1px gray dotted;">
	
</cfoutput>
</div>
</body>
</html>
</cfsavecontent>
<cfif len(form.invoice)>
<cffile action="write" file="#application.rootfolder#upsinvoices\#form.invoice#.htm" output="#the_content#" />
</cfif>
<cfoutput>#the_content#</cfoutput>