<CFPARAM name=cartid default="">
<CFPARAM name=categ default="">
<CFPARAM name=updateinventory default="no">
<cfif isdefined("url.cartid")>
<cfset cartid = url.cartid>
</cfif>
<cfif cartid neq "">
<CFQUERY DATASOURCE="semiprecious" NAME="solditems">
SELECT  top 100 email, itemid, CAT, quantity, status, basecost, saleprice, datebought, affiliateID, description
FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 and quantity>0 <CFIF cartid is not "-"> and  cartid=#cartid#</CFIF>  order by cat
</cfquery>
<cfquery datasource="semiprecious" name="q_status">
select status,paymode from cartstatus where cartid = #cartid#
</cfquery>
</cfif>


<CFQUERY DATASOURCE="semiprecious" NAME="purchaser">
Select firstname, address1,city,state,country from purchase where email='#cartid#'
</cfquery>


<head>
<title>Items Ordered: Semiprecious.com</title>
</head>
<body bgcolor='white'>
<cfinclude template="header.cfm">
<cfif cartid neq "">
<!--- <Table cellpadding='0' cellspacing='0' bgcolor='white' width='750' align=left border=0><tr><td align='left' bgcolor='white'><img src='images/semiprecious.gif' height=68 width=450></td><td align='right'></td><td><img src='images/logo.jpg'></td></tr></Table> ---><br>

<left>

<p>&nbsp;</p>

<p><b>Demand Slip</b></p>
<!-- Date and Time Purchased:#solditems.datebought#, not showing this because a smart user can use this page to discover other carts and then discover the low traffic! --> <cfoutput><font color=red>#solditems.affiliateID#</font></cfoutput>
<table width=600 border="1" bordercolor="#000099"><tr bgcolor="#CCCCCC">
<td><b>ID</b></td><td><b>Picture</b></td><td>Qty</td><td>Price</td><td><b>Description</b></td><td>Remarks</td></tr>


<cfoutput QUERY="solditems">
<tr><td><a href='detail.cfm?itemnumber=#itemid#'>#itemid#</a><cfif cartid eq "-">#email#</cfif></td>
	<td>
 <CFSET categ = cat>
<img src=images/#categ#/thumb/#itemid#.jpg height=50>
	</td><td> <font <cfif quantity gt 1> color=red</cfif>>#quantity#</font></td><td>Rs #basecost#</td>
<td>#description#
</td><td width="60">&nbsp;</td></tr>
</cfoutput>
</table>
<hr /> <b> 
Approx. Total amount (not including shipping):</b>Rs 
<cfif cartid neq "-">
<cfset totalamount=0>
<cfoutput query="solditems">

<cfset totalamount=basecost*quantity+ totalamount>

</cfoutput>
<cfoutput>#totalamount#</cfoutput>
</cfif>
  <p> <b><b>ABOVE PRICES AND TOTAL BELOW MAY BE DIFFERENT FROM TIME YOU BOUGHT 
    THESE.<br>
    THE REVISED PRICES WILL NOT EFFECT THE PAYMENT MADE BY YOU OR DELIVERY OF 
    YOUR ORDER.</b><br>
    </b>  Status: <cfoutput>#q_status.paymode#/#q_status.status#</cfoutput><br>

	Details:<br>

  <cfif q_status.status is 'new'>
<cfif q_status.paymode is 'auth.net'>
Payment Recieved from authorize.net. Will be shipped within 24 to 48 hours.<br>
<cfelseif q_status.paymode is 'pp'>
Payment Recieved from Paypal. Will be shipped within 24 to 48 hours.<br>
<cfelseif find('2co',q_status.paymode)>
Payment recieved from 2Checkout.com payment gateway. Order will be shipped withing 24 to 48 hours.<br>
<cfelse>
Status (<cfoutput>#q_status.status#</cfoutput>): Cart Exists.<br>
Payment status not known.<br>
Possibly paid for but not updated because the payment gateway did not invoke/return to semiprecious.com from reciept page of the payment gateway.
</cfif>
<cfelseif find('done',q_status.status)><br>
Status: <cfoutput>#q_status.paymode#/#q_status.status#</cfoutput>
Items shipped. In case of any query please contact us on phone or email.<br>
 Thank you. </cfif>

<cfelse>
<form action='cartview.cfm'>
Please enter cart id dear customer: <input type="text" value="" name="cartid">
<input type='submit' value='see cart'>
</form>
</cfif>
<cfinclude template="footer.htm">
</body>
</html>