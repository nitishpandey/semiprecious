<cflocation url = "/itemsell.cfm?cartid=#cartid#" addtoken="no" />

<CFPARAM name=cartid default="">
<CFPARAM name=categ default="">
<CFPARAM name=updateinventory default="no">
<cfif isdefined("url.cartid")>
<cfset cartid = url.cartid>
</cfif>
<cfif cartid neq "">
<CFQUERY DATASOURCE="gemssql" NAME="solditems">
SELECT  top 100 email, itemid, CAT, quantity, status,buyingrecord.rate,price, saleprice, datebought, affiliateID, description
FROM buyingrecord, items where items.newitem=buyingrecord.itemid*1 and quantity>0 <CFIF cartid is not "-"> and  cartid=#cartid#</CFIF>  order by datebought desc
</cfquery>
<cfquery datasource="gemssql" name="q_status">
select status,paymode,outdate as outtime from cartstatus where cartid = #cartid#
</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="purchaser">
Select firstname, address1,city,state,Zip, country from purchase where cartid='#cartid#'
</cfquery>
</cfif>
<head>
<title>Cart Details: Semiprecious.com</title>
</head>
<body bgcolor='white' topmargin="0"  style="horizontal-align:center;text-align:center;background-image:url('/images/hazy.gif');">
<div align="center" style="width:800px;background-color:white;">
<cfif cartid neq "">
	<cfquery name="track"  datasource="gemssql">
Select * from cartissues where cartid = #cartid# 
</cfquery>

   <Table cellpadding='0' cellspacing='0' bgcolor='white' width=80%  border=0>
  <tr> 
    <td align='left' bgcolor='white' colspan=3><a href=index.cfm><img src='images/header.gif' width="309" height="57"></a></td>
	<cfif track.recordcount gt 0>
	<td>
	<B>TRACKING NUMBER - :</B> <cfoutput>#track.tracking2#</cfoutput> by USPS, check <a href=http://trkcnfrm1.smi.usps.com/PTSInternetWeb/index.jsp>USPS.com tracking page</a> with this tracking number.
	</td>
	</cfif>

  </tr>
</Table>
</cfif>

<cfif cartid neq "">
  <!--- <Table cellpadding='0' cellspacing='0' bgcolor='white' width='750' align=left border=0><tr><td align='left' bgcolor='white'><img src='images/semiprecious.gif' height=68 width=450></td><td align='right'></td><td><img src='images/logo.jpg'></td></tr></Table> --->
  <br>
<b>Cart Details:<br>
    </b>  <p  class="topnavigator"><left> Order no. (cartid):<cfoutput><a href=itemsell.cfm?cartid=#cartid#>#cartid#</a> of #solditems.datebought#</cfoutput> 
    <!-- Date and Time Purchased:#solditems.datebought#, not showing this because a smart user can use this page to discover other carts and then discover the low traffic! -->
    <cfoutput><font color=red>#solditems.affiliateID#</font></cfoutput></p>
	  <table width=600>
    <tr class="greenbutton" > 
      <td><b>ID</b></td>
      <td><b>Picture</b></td>
      <td><b>Qty</td><td>  Price</td> <td>  Description</b></td>

    </tr>
    <cfoutput QUERY="solditems"> 
      <tr> 
        <td><a href='jewelry_item.cfm?itemnumber=#itemid#'>#itemid#</a> <cfif cartid eq "-">
            #email#</cfif></td>
        <td> <CFSET categ = cat> <img src=images/#categ#/thumb/#itemid#.jpg height=50 /> 
        </td>
        <td><font <cfif quantity gt 1> color=red</cfif>>#quantity#</font> </td><td>
<!--- we are now using rate from buyingrecord table 		<cfif status EQ 3>
            Sale:#format(saleprice)# 
            <cfelse>
            #format(price)# 
          </cfif>---->
		  		<cfif status EQ 3>
            Sale:#dollarformat(rate)# 
            <cfelse>
            #dollarformat(rate)# 
          </cfif> 
</td><td> #description# </td>

      </tr>
    </cfoutput> 
  </table>
  <hr />
  Total amount (not including shipping):</b>  
    <cfset totalamount=0>
    <cfoutput query="solditems"> 
	        <cfset totalamount=rate*quantity + totalamount>

    <!---   <cfif status is 3>
        <cfset totalamount=saleprice*quantity + totalamount>
        <cfelse>
        <cfset totalamount=price*quantity+ totalamount>
      </cfif> --->
    </cfoutput>
 <cfoutput>#dollarformat(totalamount)#</cfoutput> 
<p class="noticebox"><!--- <b><b>ABOVE PRICES AND TOTAL BELOW MAY BE DIFFERENT FROM TIME YOU BOUGHT 
    THESE.<br>
    THE REVISED PRICES WILL NOT EFFECT THE PAYMENT MADE BY YOU OR DELIVERY OF 
    YOUR ORDER.</b><br>   --->
    </b> Status: <cfoutput>#q_status.paymode#/#q_status.status#</cfoutput><br>
    Shipping Address : <cfdump var="#purchaser#" expand="yes" />
	Details:<br />
    <cfif q_status.status is 'new'>
      <cfif q_status.paymode is 'auth.net'>
        Payment Recieved from authorize.net. Will be shipped within 24 to 48 hours.<br>
        <cfelseif q_status.paymode is 'pp'>
        Payment Recieved from Paypal. Will be shipped within 24 to 48 hours.<br>
        <cfelseif find('2co',q_status.paymode)>
        Payment recieved from 2Checkout.com payment gateway. Order will be shipped 
        withing 24 to 48 hours.<br>
        <cfelseif find('chck',q_status.paymode)>
Payment to be made by US paper check or International Money order. Order will be shipped 
        withing 24 to 48 hours of reciept of instrument.<br>
        <cfelse>
         (<cfoutput>#q_status.status#</cfoutput>): <br>
        Payment status not known.<br>
        Possibly paid for but not updated because the payment gateway did not 
        invoke/return to semiprecious.com from reciept page of the payment gateway. 
      </cfif>
      <cfelseif find('done',q_status.status)>
      <br />
     <cfoutput>#q_status.status#. Items shipped. Date : #q_status.outtime#.</cfoutput>
	    In case of any query please contact       us on phone or email.<br>
    </cfif></p>
    <cfelse>
  <form action='cartview.cfm'>
    Please enter cart id: 
    <input type="text" value="" name="cartid">
    <input type='submit' value='see cart'>
  </form>
</cfif>
<cfinclude template="footer.htm">
</div>
</body>
</html>