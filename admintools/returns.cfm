<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Refunds</title>
<cfparam name="itemid" default="" />
<cfparam name="item" default="" />
<cfparam name="amount" default="" />
<cfparam name="cartid" default="" />
<cfparam name="quantity" default="" />
<cfparam name="restock" default="" />
<cfparam name="refunded" default="no" />
<cfparam name="notshipped" default="" />
<cfparam name="unrefund" default="no" />
<cfparam name="optionid" default="0" type="numeric"  />

<!--- shipped and not coming back --->

<!--- if not restock, not notshipped (shipped that is), then cost remains same and no restock queue, no inventory update --->
<!--- action --->

	<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
</head>
<body>
<cfif restock is "shipping">
 <cfquery datasource="gemssql" name="notpaidcart">
               SELECT shippingdetails FROM cartstatus WHERE cartid = #cartid# 
           </cfquery>
						<cfset itemid = -1 />
		   <cfset rate = listfirst(notpaidcart.shippingdetails,'|')/>
		   <cfif isnumeric(rate)>
							   
					
						<cfset shipped = 0 />
						<cfset restock = 0 />
					   	<cfset qty = 1 />
						
					   <cfset reason = "shipping:#reason#" />
					   <cfelse>
	                <cfset restock = "" />				   
      		   </cfif>
 <!--- representative of shipping.hopefully no item id with this value --->
<cfelse>
		<cfif restock is "loss">
			 <cfset shipped = 1 /><!--- shipped but not ---> 
			 <cfset restock=0 />  <!--- returned --->
		   <!--- only case to  not reduce basecost of cart. --->
		<cfelseif restock is "notfound"><!--- make inventory 0/reduce base cost --->
			<cfset restock = 0 />
		    <cfset shipped = 0 /> 
		<cfelseif restock is "returnedinbox">
		    <cfset shipped = 1 /> <!--- it was shipped ---->
			<cfset restock = 1 /> <!--- but then came back to be restocked --->
		<cfelseif restock is "notshipped">
			<cfset restock=1 />
		    <cfset shipped = 0 />
	   <cfelseif itemid is 0>
				<cfset restock = 0 />
				<!--- reduce basecost of cart. --->
		</cfif>	
</cfif>
<cfif itemid neq "" and refunded is "no" and unrefund is "no" and restock eq "" >
		<span style="border:red 2px solid;color:red;font-size:2em;font-weight:bold;">
		<cfif itemid is -1>
This cart has no shipping charges.
<cfelse>
Select one of the options - shipped or not shipped from below
		
		<cfset item = itemid />
		<cfset quantity = qty />
		<cfset amount = rate * qty />
</cfif></span>
</cfif>


<table style="margin-top:20px">
<tr>
   <td style="border:1px black dashed">
      <div style="background:skyblue;margin-left:30px;width:200px;margin-top:-10px;background-color:white;border:1px solid gray;-mozilla-border-radius:6;">Return Processing</div>
	<cfif (not isuserinrole("admin")) and (not isuserinrole("superadmin"))>
			Not enough privileges. Please log in again
		<cfabort />
	<cfelse>
		<cfif itemid neq "" and refunded is "no" and unrefund is "no" and restock neq "" >
	        <cfquery datasource="gemssql" name="notpaidcart">
               SELECT cartid FROM cartstatus WHERE cartid = '#cartid#' AND paymode='null' 
           </cfquery>
   		<cfif notpaidcart.recordcount ><span style="border:red 2px solid;color:red;font-size:1.5em;font-weight:bold;">
		
			<cfoutput>
			<img src='/images/error_16X16.png' />	The cart #cartid# is not paid for. Please check the cartid you have provided. If you <br />
			need to refund for this cart then please first			update the cart with mode of payment and then attempt this process .
			</cfoutput>
		</span>
		<cfelse>
		<!---
		<cfquery name="adRefund" datasource="gemssql">
			delete from returns where cartid = #cartid# and itemID = #itemid# and optionid = #optionid# 
		</cfquery> --->
			<cftry>
				
		<cfquery name="addRefund" datasource="gemssql">
			insert into returns (cartid, itemID, qty, amount, dateReturn, reason, restock,optionid) Select #cartid#, #itemID#, #qty#, #qty*Rate#, #now()#, '#session.apptt#/#reason#', '#restock#',#optionid#
		</cfquery>
<cfcatch type="any">
		<cfoutput>		insert into returns (cartid, itemID, qty, amount, dateReturn, reason, restock,optionid) Select #cartid#, #itemID#, #qty#, #rate#, #now()#, '#reason#', '#restock#',#optionid#
		#cfcatch.detail#,#cfcatch.message#. Please remove earlier entry by doing a un-refund before adding a total refund for a non -item based refund for this cart or this item in this cart.
		</cfoutput>
		<cfabort />
</cfcatch>
</cftry>
	
				<cfif restock >
					<!--- not updating inventory. It will be udpated when the item is manually stocked up from returns collection in the USA 					<cfquery datasource="gemssql">
							update items set inventory = inventory + #qty# where newitem = #itemid#
					</cfquery>
					--->
				<cfset restock = true>
			<cfelse>
				<cfset restock = false>
			</cfif>
			<cfif itemid GT 0><!--- itemid is 0 when it is a non-item based refund of amount --->
				<cfif shipped>
				<cfset shipped = true />
				<cfelse>
				<cfset shipped = false />
				</cfif>
				<cfinvoke component="cartcontrol.cartmonitor"  method="refund_item" returnvariable="ret"  >
					  <cfinvokeargument name="cartid" value="#cartid#" />
					  <cfinvokeargument name="itemid" value="#itemid#" />
					  <cfinvokeargument name="restock" value="#restock#" />
					  <cfinvokeargument name="restock" value="#restock#" />
					  <cfinvokeargument name="shipped" value="#shipped#" />
					  <cfinvokeargument name="qty" value="#qty#" />
					  <cfinvokeargument name="rate" value="#rate#" />
				      <cfinvokeargument name="optionid" value="#optionid#" />
				</cfinvoke>
			<cfelse>
					<cfquery datasource="gemssql" name="costinfo" >
					      select cost from cartstatus 	 	where cartid = #cartid# 
					</cfquery>
					<cfset rateratio = (costinfo.cost-rate)/costinfo.cost />
			
					<cfquery datasource="gemssql" >
						       update cartstatus set cost = cost - #rate#	 	where cartid = #cartid# 
					</cfquery>
					<cfquery datasource="gemssql" >
						       update buyingrecord set rate = rate*#rateratio#	 	where cartid = #cartid# 
					</cfquery>
					<cfset ret = true >
			</cfif>
		
			<cfif ret>
					Done!<cflocation url="/itemsell.cfm?cartid=#cartid#" addtoken="no" />
			<cfelse>
					Refund unsuccesful.
			</cfif>

   </cfif>
</cfif>
<br>

<form name="returns" action="returns.cfm" style="display:block;border:2px double #fffEfDf">

CARTID: <input type="text" name="cartid" value="<cfoutput>#cartid#</cfoutput>">&nbsp;&nbsp;&nbsp; 
ITEMID: <input type="text" name="itemid" value="<cfoutput>#item#</cfoutput>">&nbsp;&nbsp;&nbsp;
(Use 0 here if you are doing a refund  not related to a particular item) <cfoutput>
<a href="/itemsell.cfm?cartid=#cartid#" class="action_button">Back to Cart</a></cfoutput>
<br />Qty:
<cfif len(quantity) and quantity GT 0>
<select name="qty">
<cfloop from=1 to=#quantity# index=j >
  <cfif j is quantity>
    <option value="<cfoutput>#j#</cfoutput>" selected="true"><cfoutput>#j#</cfoutput> </option>
  <cfelse>
    <option value="<cfoutput>#j#</cfoutput>"><cfoutput>#j#</cfoutput></option>
  </cfif>
</cfloop>
</select>
<span style="color:red"> Enter Price per piece here </span>(not total Amount):
<input type="text" name="rate" value="<cfoutput>#amount/quantity#</cfoutput>">,
 
 <cfoutput>[Rate = #amount/quantity#]</cfoutput>
Option ID:<input type="hidden" name="optionid" value="<cfoutput>#optionid#</cfoutput>"><cfoutput>#optionid#</cfoutput>

<cfelse>
	<input type="text" name="qty" title="Enter qty being refunded"> Option ID:
	<input type="text" name="optionid" value="<cfoutput>#optionid#</cfoutput>" title="Enter optionid">
</cfif>
<br />

<span style="color:maroon">Refund Shipping Amt<input type="radio"  name="restock" value="shipping" ><br>
</span>
<span style="color:green">Not Shipped <input type="radio"  name="restock" value="notshipped" >[Item not being shipped, (cancellation). Inventory will be updated]<br>
</span><span style="color:blue">Not returned <input type="radio"  name="restock" value="loss" selected >[Item will remain with the customer. Inventory will not be updated]<br>

</span><span style="color:red">Not in stock <input type="radio"  name="restock" value="notfound" selected >[Inventory will be made 0]<br>

</span><span style="color:purple">Returned By Customer <input type="radio"  name="restock" value="returnedinbox" selected >[Inventory not updated. Item is placed in returns box for batch restocking/inventory update later]
</span>
<br />
Reason:<input type="text" size=80 name="reason" value="" />

<input type="submit" name="Submit">  <a href="/cartstatus21.cfm" class="action_button">Back to Carts</a>
</form>

</td></tr></table>
<cfif refunded is "yes">
		<cfif itemid neq "" >
			<cfquery name="addRefund" datasource="gemssql">
				update returns set refunded=1 where cartid =#cartid# and itemID=#itemID#
			</cfquery>
		<cfelse>
			<cfquery name="addRefund" datasource="gemssql">
			update returns set refunded=1 where cartid =#cartid#
			</cfquery>
			<span class="error1"><cfoutput>#cartid# #refundedamt#</cfoutput> refund marked "done". </span>
		</cfif>
</cfif>

<cfif itemid neq "" and cartid neq "" and unrefund is "yes">
	<cfquery name="remRefund" datasource="gemssql">
		select itemiD from returns where refunded=0 and cartid =#cartid# and itemID=#itemID# and optionid=#optionid#
	</cfquery>
	<cfif remRefund.recordcount>
			<cftry>
				<cfquery name="wasrestock" datasource="gemssql">
	    	          select restock from returns 	where refunded=0 and cartid =#cartid# and itemID=#itemID# and optionid=#optionid#
				  </cfquery>
	
				<cfquery name="addRefund" datasource="gemssql">
					delete from returns where refunded=0 and cartid =#cartid# and itemID=#itemID# and optionid=#optionid#
				</cfquery>
				<!---	
				<cfset a.newitem = url.itemid  />
				<cfset a.quantity = url.qty />
				<cfset a.cartid = url.cartid />
				<cfset a.price = amount/qty />
				<cfset a.mail = "" /> <!--- ideally we should pick up the buyer email id from buying or cartstatus table --->
				<cfset a.add_to_db = 1 />
				<cfset a.optionid = url.optionid />
				<cfset a.check_inv = 0 />
					<cfinvoke method="additem" attributecollection="#a#" component="cartcontrol.cartmonitor" returnvariable="added"  />
					--->
					
				<cfif remRefund.itemid neq 0>
					<cfquery datasource="gemssql" name="br">
			 			select basecost from items  where  newitem = #url.itemid#
					</cfquery>
						<!---
			<cfquery name="pm" datasource="gemssql" > 
				select paymode from cartstatus where cartid = #url.cartid#
			</cfquery>
			<cfquery  datasource="gemssql" ><!--- some trigger does not allow qty to change for a paid cart --->
				update cartstatus set paymode = 'null'  where cartid = #url.cartid#
			</cfquery> --->
				 <cfquery datasource="gemssql" >
				        UPDATE buyingrecord      SET quantity = quantity+ #url.qty#  
					                WHERE cartid=#url.cartid# AND itemid = #url.itemid# AND optionid= #url.optionid#
	            </cfquery>
						
					<cfif wasrestock.restock is 1><!--- that means during refund process cost and inrcost (cost of purchase by us) was reduced --->
						<cfquery datasource="gemssql" >
					    	   update cartstatus set cost = cost + #trim(url.amount)#,  inrcost = inrcost + #(br.basecost*url.qty/application.exchangerate)# 		 	where cartid = #url.cartid# 
						</cfquery>
						<Div style="border:1px solid blue;color:red">
						<cfoutput>
						Please <a href="/admintools/edititem.cfm?newitem=#url.itemid#">update inventory (need to + #url.qty#)</a> manually. Because unrefund process does not know whether inventory was reduced
						
						during refund.</cfoutput> </div>
						
					<cfelse><!--- not to be restocked during refund process can only be when item was shipped. so in unrefund we reduce inventory again --->
						<cfquery datasource="gemssql" >
					    	   update items set inventory = inventory - #url.qty# where newitem  = #url.itemid#
						</cfquery>
					</cfif>	
           <cfelse>
				   <!--- upgrade cost (amt paid by customer) of all items --->
					<cfquery datasource="gemssql" name="brinfor">
				    	   select cost from cartstatus  where cartid = #url.cartid# 
					</cfquery>
				
					<cfset rateup = (brinfor.cost+url.amount)/brinfor.cost />
					 <cfquery datasource="gemssql" name="updatecart">
					        UPDATE buyingrecord      SET rate = rate*#rateup#
						                WHERE cartid=#url.cartid# 
		            </cfquery>

		   </cfif>
	
			
		<cfcatch type="any">
			<cfoutput>#cfcatch.message#...cfc</cfoutput>
		</cfcatch>
		</cftry>
	<cfelse>
	<span class="error1">	No such refund entry exists to undo. Please confirm that you have not already un-refunded this item.</span>
	</cfif>
</cfif>


<table><tr><td style="background-color:#800080;color:white">RETURNS AWAITING REFUNDING</td></tr>
<tr><td>
<cfquery name="toRefund" datasource="gemssql">
Select  returns.* , cartstatus.paymode from returns, cartstatus where cartstatus.cartid=returns.cartid and refunded =0 order by returns.cartid asc
</cfquery>


<table><tr><td>CartID</td><td>ItemID</td><td>Qty</td><td>Amount</td><td>Paid By</td><td>Reason</td><td>Refund</td><td>UN-REFUND</td></tr>
<cfset totalrefund = 0>
<cfset prevcart = 0>
<cfoutput query="toRefund" group="cartid">
<cfset totalrefund = 0 /><cfset prevcart = cartid>
<cfoutput >

<cfset totalrefund=amount + totalrefund>
<tr><td><a href=/itemsell.cfm?cartid=#CartID#>#cartid#</a></td><td>#ItemID#(#optionid#)</td><td>#Qty#</td><td>$#Amount#</td><td><cfif paymode is 'auth.net' or paymode is 'wellscc'><a href=https://account.authorize.net><cfelseif paymode is 'pp' or paymode is 'paypal'><a href=http://www.paypal.com><cfelseif paymode contains 'goog'><a href=http://checkout.google.com></cfif>#paymode#</a></td>
<td>#reason#</td>
<td><form name="refund" action="returns.cfm"><input type="hidden" name="cartid" value="#cartid#">
<input type="hidden" name="itemid" value="#itemiD#"><input type="hidden" name="refunded" value="yes"><input type="submit" value="Refunded"></form>
</td><td>**<a href=returns.cfm?unrefund=yes&Qty=#qty#&cartid=#cartid#&itemid=#itemid#&optionid=#optionid#&amount=#amount#>UN-REFUND</a>**</td></tr>




</cfoutput><tr><td colspan=4>
<cfif totalrefund gt 0><form ><input type="hidden" value="#prevcart#" name="cartid" />
<input type="hidden" name="refundedamt" value="#totalrefund#" /><input type="hidden" name="refunded" value="yes" /><input style="greenbutton" type="submit" value="Refunded Total #totalrefund#" /></form></cfif></td></tr>
</cfoutput>
</table></td></tr></table>
<p><p>
<table bgcolor=yellow><tr><td>LAST 40 RETURNS REFUNDED</td></tr></table>

<cfquery name="Refund" datasource="gemssql">
Select top 60 cartid, itemid, qty from returns where refunded =1 order by cartid desc</cfquery>

<table><tr><td>CartID</td><td>ItemID</td><td>Qty</td></tr>
<cfoutput query="Refund"><tr><td>#CartID#</td><td><a href=/detail.cfm?newitem=#ItemID#>#itemID#</a></td><td>#Qty#</td></tr></cfoutput>
</table>

</cfif>
</body>
</html>
