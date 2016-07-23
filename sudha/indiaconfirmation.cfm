<CFPARAM NAME="j" DEFAULT="">
<CFPARAM NAME="qty" DEFAULT="0">
<CFPARAM NAME="total" DEFAULT="0">
<CFPARAM NAME="inrcost" DEFAULT="0">
<cfset handlingcharges = 5>
<cfset shipping_charges = 125 />
<cfparam default="0" name="checkoutprice" type="numeric" />
<!--- for tracking the cost in indian rupees, stored in cartstatus table --->
<CFINCLUDE TEMPLATE="setup.cfm">
<CFPARAM NAME="discount" DEFAULT="0" />
<CFPARAM NAME="rcredit" DEFAULT="0" />
<cfparam name="noofsalesitem" default="0" />
<CFPARAM NAME="itemlist" DEFAULT="">
<CFPARAM NAME="newearned" DEFAULT="0" />
<CFPARAM NAME="tcredit1" DEFAULT="0" />
<cfparam name="session.filter" default="salestatus=3" />
<CFPARAM NAME="tcredit" DEFAULT="0">
<CFPARAM NAME="creditleft" DEFAULT="0">
<CFPARAM NAME= "SpecialHandling" DEFAULT="0">
<CFPARAM NAME= "GiftWrap" DEFAULT="0">
<CFPARAM NAME= "couponcode" DEFAULT="">
<CFPARAM NAME= "couponflag" DEFAULT="0">
<CFPARAM NAME= "nonUS" DEFAULT="0">
<cfparam name="url.filter" default=""> <cfset modtps = 'n'>
<!---  <CFIF couponcode is "">
<CFSET couponcode = "afid">
<cfelse>
<cfset afid = couponcode>	
</cfif> --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Checkout from Semiprecious.com</TITLE>
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY BGCOLOR="white" topmargin='0'>
<div align="center"><CFINCLUDE template="/india/header.cfm">

<cfset timestamp = Now() >
<cfset couponcode = trim(couponcode)>
   <cfif not session.cartid>
      <!--- to come to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of this page or
return to this page from a paypal's first page will not cause cartid to be incremented --->
      <cflock name="setcartid" type="exclusive" timeout="10">
        <cfset application.cartid = application.cartid + 1>
        <cfset session.cartid = application.cartid >
      </cflock>
      <cfelse>
      <cfquery  datasource="gemssql" name="qpm">
      select paymode from cartstatus where cartid = #session.cartid# 
      </cfquery>
      
  <cfif qpm.paymode neq 'null'>
    
    
        <cflock name="setcartid" type="exclusive" timeout="10">
          <cfset application.cartid = application.cartid + 1>
          <cfset session.cartid = application.cartid >
        </cflock>
      </cfif>
    </cfif>  
	<!--- session cartid  calculated --->
	<cfquery datasource="gemssql" name="deletedata">
    Delete  from buyingrecord where cartid= #session.cartid#
    </cfquery>
	<!--- now ascertain discount details --->
  <cfif couponcode neq "">
<cfquery datasource="sptm" username="nitish" password="rangeela" name="ws">
select discount ,id from bulkbuyercoupons where code = '#couponcode#'
</cfquery>
<cfif ws.recordcount><!--- is it tps --->
<cfquery datasource="sptm" username="nitish" password="rangeela" name="wsdetails">
select membershipdate,status from bulkbuyers where id = '#ws.id#'
</cfquery>
    <cfif wsdetails.status and wsdetails.membershipdate GT Now()>
      
      
<cfset tpsale = 1>
<cfset tpdiscount = ws.discount/100>
<cfset bbid = ws.id>
</cfif>
	</cfif><!--- is it tps/ not --->
	</cfif><!--- is there a coupon code --->

<div style="margin-top:30px">&nbsp;</div>
<h3>Your finalized cart</h3>
&nbsp;[Please note cart id at the bottom of the table] 
<table border="0" cellpadding="2" width="860px" align='center'>
  <tr align="center" class="grayplacard"> 
    <td widt="20%">Item Number</td>
    <td>Picture</td>
    <td>Price</td>
    <td>Quantity</td>
    <td>Amount</td>
  </tr>
  <cftry >
  <cfloop index="k" from="1" to="#ArrayLen(session.cartitem)#">
  
    <cfif session.cartitem[k][1] neq 0 and session.cartitem[k][4] neq 0>
      <tr> 
        <td align='center'><cfoutput>#session.cartitem[k][4]#</cfoutput></td>
<!---       <cfif k Is 1 and session.cartitem[1][4] neq 0>
          <cfset itemlist=session.cartitem[1][1] &"("& session.cartitem[1][4] &")">
          <cfelse>
          <cfif session.cartitem[k][4] neq 0>
            <cfset itemlist=#session.cartitem[k][1]# &"("& session.cartitem[k][4] &")" & "." & #itemlist#>
          </cfif> 
        </cfif>--->
        <cfquery name="qprice" datasource="gemssql">
        SELECT basecost,price, saleprice, nameid, status, wholesaleprice, newitem 
        as newimage, cat FROM Items WHERE newitem=#session.cartitem[k][1]# 
        </cfquery>
        <td align='center'> 
		<cfoutput query="qprice"> 
            
              <cfset Variables.basecost = value_convert(price) />
            <cfset folder = cat>

            <img src="images/#folder#/thumb/#newimage#.jpg" height="40"> 
          </cfoutput>
		  </td>
        <td align='center'> 
	<cfoutput query="qprice">
            <cfif isdefined("tpsale") >
              <cfif status is 3 >
			  			<cfset noofsalesitem = noofsalesitem + session.cartitem[k][4] >
                       <cfset checkoutPrice=qprice.saleprice >
                		<cfif qprice.saleprice is "" or qprice.saleprice eq 0.00 >
                        	 <cfset checkoutprice=0.80*qprice.price >
            	    	</cfif>
                		<font color="red"> ON SALE!</font> 
                <cfelse>
          	      	<cfset checkoutprice = tpdiscount*qprice.price>
              </cfif>
             <cfelseif len(session.bulkbuyer.id)>
			 	 <cfset session.mail = session.bulkbuyer.id>
              	<cfif qprice.wholesaleprice eq  0 or qprice.wholesaleprice eq  "">
                    <cfset checkoutprice=qprice.price*0.50>
                <cfelse>
                	<cfset checkoutPrice=qprice.wholesaleprice >
              	</cfif>
              <Cfelse>
              	<cfif newimage eq 414 and couponcode eq "70OFF">
			  		<cfset couponflag = 1>
                	<cfset checkoutprice=qprice.price*0.30>
                <cfelseif couponcode eq "friend" or couponcode eq "AID" or couponcode eq "Direct">
					 <cfset couponflag = 1>
                	<cfset checkoutprice=qprice.price*0.70>
                <cfelseif couponcode eq "whole">		  
				<cfset couponflag = 1>
                <s>#format(qprice.price)#</s> 
                <cfset checkoutprice=qprice.price*0.50>
                         <cfelse>
                <cfset checkoutprice=qprice.price>
              </cfif>
              <cfif status is 3 and couponcode neq "whole">
                	<cfset noofsalesitem = noofsalesitem + session.cartitem[k][4] >
                	<cfset checkoutPrice=qprice.saleprice >
                <cfif qprice.saleprice is "" or qprice.saleprice eq 0.00 >
                           <cfset checkoutprice=0.80*qprice.price >
                </cfif>
                <font color="red"> 
                <cfif couponcode eq  '7q382y39p4' >		  
					<cfset couponflag = 1>
                  	<cfset checkoutprice = 0.95*checkoutprice >
                 	 Special 
                 <cfelseif couponcode eq 'mother'  >		  <cfset couponflag = 1>
                  	<cfset checkoutprice =  0.890*checkoutprice >
                  	Special 
                  <cfelseif couponcode eq 'azure'  >		  <cfset couponflag = 1>
                  	<cfset checkoutprice =  0.95*checkoutprice >
                  	Special 
                 </cfif>
                Sale Price</font> 
                <cfelseif couponcode eq '7q382y39p4' >		
				  <cfset couponflag = 1>
                 <cfset checkoutprice =  0.85*qprice.price >
                <s>#format(qprice.price)#</s> 
                <cfelseif findnocase('moth',couponcode)  >		  <cfset couponflag = 1>
                <cfset checkoutprice =  0.890*qprice.price >
                <s>#format(qprice.price)#</s>        </cfif>
            </cfif>
			<cftry>
			<cfif session.cartitem[k][5]>
							   <cfquery datasource="sptm" username="nitish" password="rangeela" name="opts">
      		select   valueadd from options where itemid = #session.cartitem[k][1]# and optionid = #session.cartitem[k][5]#
				</cfquery>
				<cfset checkoutprice = checkoutprice + opts.valueadd>
				(with option)<br>

				</cfif>
				<cfcatch type="expression">
				<cfset session.cartitem[k][5] = 0>
				</cfcatch>
				</cftry>
				<cfset valueadd = 0>
#format(checkoutprice)#</cfoutput> </td>
        <td align='center'><cfoutput>#session.cartitem[k][4]#</cfoutput></td>
        <cfset qty= session.cartitem[k][4]+ qty>
        <td align='center'> 
		<cfset itemprice=#checkoutprice#>
       <cfset inrcost =  Variables.basecost*session.cartitem[k][4] + inrcost>
       <cfset total=itemprice*session.cartitem[k][4] + total>
<cfoutput>#format(evaluate(checkoutprice*session.cartitem[k][4]))#</cfoutput> </td>
      </tr>
   
    </cfif>
    <cfif session.mail IS NOT "">
      
      
      <!---<CFSET newcredit=#evaluate(total*(1-discount/100)*0.10)#>
<CFSET #creditleft#=#tcredit1# - #rcredit#>
 from 15th sep the email field can be used for email actually , it was being used for cartid so far
will have to check the sideeffects. One is in itemsell.cfm which picks out cartid from emailid field --->
      <!--- increment session.cartid here --->
      <cfset subscriber = "member">
      <cfelse>
      <cfset subscriber = "non-member">
    </cfif>
	<cfset emailtemp   = session.mail>
	<cfif session.mail eq "">
      
	<cfset emailtemp = 'na'>
	</cfif>
    <cfquery datasource="gemssql" name="insertdata">
    INSERT INTO buyingrecord(cartid,rate,email, itemid, quantity, affiliateID,datebought,optionid) 
    VALUES(#session.cartid#,#checkoutprice#,'#emailtemp#',#session.cartitem[k][1]#, #session.cartitem[k][4]#,'#couponcode#',#timestamp#,#session.cartitem[k][5]#) 
    </cfquery>
  </cfloop>
  <cfif qty is 1>
    
    
    <cfset shipping = 1.95>
    <!---
<cfelseif qty is 2>
<cfset shipping =2.95>--->
    <cfelseif qty eq 2>
    <cfset shipping  = 0.50>
    <!---
<cfelseif qty is 4>
<cfset shipping  = 2.00>
<cfelseif qty is 5>
<cfset shipping  = 1.00>
<cfelseif qty gt 5>
<cfset shipping  = 0.00>
--->
    <cfelseif qty GT 2>
    <cfset shipping = 0.00>
			<cfelseif  qty eq 0>
		
    <cfif isdefined("cookie.cartinfile")>
      
      
	       <cflocation addtoken="no" url="fillcart2.cfm">		
	<cfelse>
	      <cflocation addtoken="no" url="emptycart.cfm">
		</cfif>
  </cfif>
  <cfoutput> 
    <cfif total>
      <cfset shipping=shipping + SpecialHandling +  nonUS + GiftWrap>
      <tr> 
        <td align="center" >
		<a href='list.cfm?#session.filter#' class="details"><b><i>Back 
          to the store</i></b></a></td>
        <td colspan="2" align="center">&nbsp; 
Shipping Charges : &nbsp;&nbsp; Rs #shipping_charges#
          <!--- <cfif couponcode eq "">
	Whole Sale & Bulk Buyers click <a href="http://www.semiprecious.com/contactus.cfm?newitem=999">here</a>.  
</cfif> --->
        </td>
        <td  colspan="2" align="right"><font color="##000000">Items 
          Total</font>:#format(total)#</td>
      </tr>
	  <tr><td colspan="5" align="right"> (Add VAT @ 1% )<cfset total = 1.01*total /> Amount including tax #format(total)#</td></tr>
    </cfif>
    <!---  <tr>
        <td  colspan="5" align='right'> <cfif GiftWrap GT 0>
            Shipping & Gift Wrap: 
            <cfelse>
            Shipping : 
          </cfif>
          &nbsp;&nbsp;#format(shipping)#</td>
      </tr>
   
<CFIF evaluate((total*discount/100) + 3.95-shipping) GT 0><tr><td  colspan="6" align='right'><font color='red'>Savings From Discount:&nbsp;&nbsp;<cfoutput>#format(evaluate(total*discount/100) + 3.95-shipping)#</cfoutput></font></td></tr></CFIF>

<tr><td  colspan="6" align='right'><font color='red'><cfif session.mail IS NOT "">Credit Acquired (useable only towards future purchases):&nbsp;&nbsp;<cfoutput>#format(evaluate(total*(1-discount/100))*0.10)#</cfoutput></font></cfif></td></tr>
<tr><td  colspan="6" align='right'><font color='red'><cfif rcredit IS NOT "0">Credit Used: &nbsp;&nbsp;<cfoutput>#format(rcredit)#</cfoutput></font></cfif></td></tr>
--->
    <cfset discountvalue = 0>

  </cfoutput> 
  <cfif Specialhandling eq "2.65">
    
    
    <cfset sh = "P">
    <cfelseif Specialhandling is "12.00">
    <cfset sh = "O">
    <cfelse>
    <cfset sh = "">
  </cfif>
  <cfif Giftwrap neq "0">
    
    
    <cfset gw = "G">
    <cfelse>
    <cfset gw = "">
  </cfif>
  <cfset amount =total + shipping>
  <cfif isdefined("session.giftid")>
    <cfif session.giftamt GT 0>
      <cfset amount = amount - session.giftamt>
      <cfif qty EQ 2>
        
        
        <cfset amount = amount - 0.5>
        <cfelseif qty eq 1>
        <cfset amount = amount - 1.95>
				<cfelseif  qty eq 0>
		<cfif isdefined("cookie.cartinfile")>
          
          
	       <cflocation addtoken="no" url="fillcart2.cfm">		
	<cfelse>
	      <cflocation addtoken="no" url="emptycart.cfm">
		</cfif>
      </cfif>
      <cfset session.giftamt = 0>
      <cfif amount LTE 0>
        
        
        <cfset amount = 0>
      </cfif>
      <cfset shipping = 'gift'>
      <cfset couponcode = session.giftid>
      <tr> 
        <td colspan="5" align="center" class="headerfontsmall">GIFT AMOUNT REDUCED 
          FROM TOTAL. GIFTID IS NOT VALID IN FUTURE.<br>
          If you wish to shop more using the same giftid you must <a href="havegiftcoupon.cfm">re-validate</a> 
          the certificate.<br>
          If not then please make balance payment <strong>if any</strong> and 
          mail us the giftid and this cartid.</td>
      </tr>
    </cfif>
  </cfif>
  <cfset minimum = 50000>
  <cfif len(session.bulkbuyer.id)>
    
    
    <!--- was set at bulkbuyerlogin.cfm --->
    <cfif   amount Lt session.bulkbuyer.minamt>
      
      
      <!--- <script language="JavaScript">
alert("For whole sale purchase pse make purchases of atleast $200 (after discount) before you can check out.");
</script> --->
      <cfset wholefault =1 >
	  <cfelse>
	  <cfset amount = amount + handlingcharges> 
	     </cfif>
    <cfelseif couponcode is 'whole' and amount LTE minimum>
    <!--- <script language="JavaScript">
alert("For whole sale purchase pse make purchases of atleast $200 (after discount) before you can check out.");
</script> --->
    <cfset wholefault =1 >	  
	<cfelseif couponcode is 'whole'>
	<cfset amount = amount + handlingcharges>
   </cfif>
   <cfset amountpayable = amount>
  <cfif isdefined("wholefault")>
  <tr> 
    <td colspan="5" align="center" valign="middle" > 
      <!--- <font color="#A50A25">WholeSale Requires mininmum order of Rs <cfoutput>#minimum# </cfoutput> (After Discount)</font>.&nbsp; Call us for wholesale ordering - 919810334191 
        <cfelse>
            <font color="red"> DISCOUNT APPLIED TO NON-SALE 
            <cfif couponcode eq "whole">
              PRICES 
              <cfelse>
              ITEMS 
            </cfif>
            </font> --->
      &nbsp;</td>
  </tr>
  <cfelse>
  <cfif isdefined("tpsale")>
    <cfquery datasource="sptm" username="nitish" password="rangeela" >
    delete from thirdpartysales where id = '#bbid#' and cartid ='#session.cartid#' 
    </cfquery>
    <cfset modtps = 'y'>
    <!--- used for putting y/n into cartstatus table --->
    <cfquery datasource="sptm" username="nitish" password="rangeela" >
    insert into thirdpartysales (id,cartid,amtrcvd,discount,coupon,shipping) values 
    ('#bbid#','#session.cartid#',#amount#, #evaluate("100*tpdiscount")#,'#couponcode#',#shipping# 
    ) 
    </cfquery>
    <cfelse>
    <cfset modtps = 'n'>
  </cfif>
  </cfif>
  <cfoutput>
  <tr bgcolor="##dada99"> 
    <td colspan="3" align="center" bgcolor="##CCCC99" class="row2" ><font color="##C0C0C0"  face="Arial, Helvetica, sans-serif"> 
      <span class="biggreen"><strong><font color="##000040">Your cart id  :</font></strong></span><strong> <font color="##800000"> 
      <!--- <cfset redundantid = randrange(10,99)> #redundantid# --->
      <span class="biggreen">#session.cartid#</span></font></strong></font> </td>
    <td  colspan="2" class="row_" align='right'  > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> 
      Grand Total :&nbsp;&nbsp;#format(evaluate(total + shipping_charges/value_convert(1)))#</b>
	  <cfset grandinRs = value_convert(evaluate(total + shipping_charges/value_convert(1)))>
	  </td>

  </tr>
  
</table></cfoutput>
<cfif isdefined("url.save")>
<h3>Your Cart Contents have been Saved  <cfif len(session.mail) or isdefined("session.bulkbuyer.id")>
      <cfif isdefined("session.bulkbuyer.id")>
        
<cfset mailto = session.bulkbuyer.id>
<cfelse>
<cfset mailto = session.mail>
</cfif>
<cfmail bcc="nitish@semiprecious.com" to="#mailto#" failto="nitish@semiprecious.com" from="service@semiprecious.com" subject="Shop later at semiprecious.com" server="mail23.webcontrolcenter.com" type="html">
Dear customer,<br>
 Your cart contents have been saved with the cartid #session.cartid#. You can use the <a href="http://www.semiprecious.com/fillcart.cfm">activate cart</a> link given on the home page (Right side in Utilities Column) to continue this shopping from any computer or place.
 [Link is http://www.semiprecious.com/fillcart.cfm]<br>	Note: Saving of content does not imply protection against price revisions and stock non - availability on your return.

Semiprecious.com assures you of excellent quality, price and service.
<br>
 Thankyou.<br>
 - Customer Relations Department</cfmail> and mailed to you for easy recall
<cfelse>but the details could not be mailed to you.   This reminder mail  facility can be availed  if  you are registered and logged in.</cfif>.</h3><br><br>

<div class="detailpricerow"> You can use the <a href="http://www.semiprecious.com/fillcart.cfm">activate cart</a> link given on the home page (Right side in Utilities Column) to continue this shopping from any computer or place.<br>
In the activate cart page you need to provide this cartid to fill the cart in one step!
<br>
    <span class="details">If you wish to continue with this shopping  right now click <a href="cart.cfm">here</a>  and 
    to make payment now click <a href="confirmation.cfm">here</a></span><br>

	Note: Saving of content does not imply protection against price revisions and stock non - availability on your return.</div>
<cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
      <cfinvokeargument name="cartid" value="#session.cartid#">
      <cfinvokeargument name="costprice" value="#inrcost#">
      <cfinvokeargument name="cost" value="#amount#">
	  <cfinvokeargument name="tps" value="#modtps#">
      <cfinvokeargument name="timestamp" value="#timestamp#">
      <cfinvokeargument name="couponcode" value="saved">
      <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
      <cfinvokeargument name="tqty" value="#qty#">
      <cfinvokeargument name="shipping" value="#shipping#:#nonUS#:#sh#:#GW#">
    </cfinvoke>
<cfelse>
  <script language="JavaScript">
<!-- Original:  Sven David Hildebrandt (shildebr@online.no) -->
<!-- Web Site:  http://home.hia.no/~sdhild99 -->
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->

<!-- Begin
<cfoutput>function goToURL() { window.location = "http://www.semiprecious.com/makesecure2connection.cfm?sid=12845&cart_order_id=#session.cartid#<cfif Specialhandling eq "2.50">P<cfelseif specialhandling is "12.00">O</cfif><cfif Giftwrap neq "0">G</cfif>&total=#decimalformat(amount)#&c_prod=1&id_type=1"; }
</cfoutput>//  End -->

</script>
    <cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
      <cfinvokeargument name="cartid" value="#session.cartid#">
      <cfinvokeargument name="costprice" value="#inrcost#">
      <cfinvokeargument name="cost" value="#amount#">
	  <cfinvokeargument name="tps" value="#modtps#">
      <cfinvokeargument name="timestamp" value="#timestamp#">
      <cfinvokeargument name="couponcode" value="india">
      <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
      <cfinvokeargument name="tqty" value="#qty#">
      <cfinvokeargument name="shipping" value="#shipping#:#nonUS#:#sh#:#GW#">
    </cfinvoke>
  <!---
<a href="https://www.2checkout.com/cgi-bin/sbuyers/cartpurchase.2c?sid=12845&cart_order_id=#session.cartid##couponcode#<cfif Specialhandling=2.5>P</cfelseifsepcialhandling=12.0>O</cfif>&total=#decimalformat(evaluate(total*(1-discount/100)-rcredit+shipping))#"><b><font color=green>Click to Secure Checkout</font></b></a>
--->
      
          <cfif Specialhandling eq "2.65">
            
          
          <cfset sh = "P">
          <cfelseif Specialhandling is "12.00">
          <cfset sh = "O">
          <cfelse>
          <cfset sh = "">
        </cfif>
          <cfif Giftwrap neq "0">
            
          
          <cfset gw = "G">
          <cfelse>
          <cfset gw = "">
        </cfif>
		<cfif isdefined("form.indianfranchisee")>
		<cfif form.indianfranchisee eq 'dipac'>
<br>
		Discount Code Used  [Prices are open to Last Minute Revision]

		<cfset total = 0.75*total + 4>
		</cfif>
		<cfif form.indianfranchisee eq 'avdude'>
<br>
		Discount Code Used  (VAT Reduced Discount)

		<cfset total = 0.75*total + 4>
		</cfif>
		<cfif listfind("mamee,schlum,airtel" ,form.indianfranchisee) >
<br>
		Discount Code Used 

		<cfset total = 0.85*total + 4>
		</cfif>
		<cfif listfind("rakhi,aksviz" ,form.indianfranchisee) >
<br>
		Franchisee Discount Code Used 

		<cfset total = 0.92*total + 4>
		</cfif>

		<cfelse>
		<cfset total = total + 4>

		</cfif>

  <cfoutput>

  <table width="700px" style="margin-top:20px" align="center" border="1" cellspacing="0" cellpadding="0">
	<!--- <Tr><td colspan="2" >Amount to pay after discount: <span class="biggreen">#format(total)#</span></td></Tr>
   <tr bgcolor="##DADA99"> 
      <td align="left" bgcolor="##FFFFFF" colspan="2" ><font color="##888888">Your
        confidence comes first, any concern call us now on +919968074073</font></td>
    </tr> --->
    <tr > 
      <Td align="left" colspan="2" class="form_heading" >Select a convenient Payment  Option: </Td>
    </tr>
<tr>
<td colspan=1 align=left>
* Pay Using Your Internet Enabled Bank Account <br>
* Pay by PayMate(Mobile payment)<br>
* Pay by ITZ Cash Cards 
</td><td align=center valign=top> <form action="https://www.ccavenue.com/shopzone/cc_details.jsp" method="post" >
            <input type="hidden" name="Order_Id" value="#cartid#">
            <input type="hidden" name="Amount" value="#grandinrs#">
            <input type="hidden" name="Merchant_Id" value="M_acemat_9705">
            <input type="hidden" name="billing_cust_name" value=""> 
            <input type="hidden" name="billing_cust_address" value=""> 
            <input type="hidden" name="billing_cust_country" value=""> 
            <input type="hidden" name="billing_cust_tel" value=""> 
            <input type="hidden" name="billing_cust_email" value=""> 
            <input type="hidden" name="billing_zip_code" value=""> 
            <input type="hidden" name="billing_cust_state" value=""> 
            <input type="hidden" name="billing_cust_city" value=""> 
            <input type="hidden" name="billing_cust_notes" value=""> 
            <input type="hidden" name="delivery_cust_name" value=""> 
            <input type="hidden" name="delivery_cust_address" value=""> 
            <input type="hidden" name="delivery_cust_tel" value=""> 
            <input type="hidden" name="delivery_zip_code" value=""> 
            <input type="hidden" name="delivery_cust_state" value=""> 
            <input type="hidden" name="delivery_cust_city" value=""> 
            <input type="image" src="/images/authnet.gif">
			<br />(Secure Indian Payment Gateway: <strong>ccavenue</strong>)
            </form>

</td>
</tr>
    <tr bgcolor="##DADA99"> 
      <td align="left" bgcolor="##DADA99" colspan="2" ><a href="paybycheck.cfm?amt=#total#&cartid=#session.cartid#">Click 
          here if you wish to  pay by Check/Money Order/Demand Draft/Pay          order</a></cfoutput>. Shipping is done after realisation 
        of check. Outstation Checks are accepted</td>
    </tr>
    <tr bgcolor="#DADA99"> 
      <td align="left" bgcolor="#FFFFFF" colspan="2" >&nbsp;</td>
    </tr>
  <!---  <tr bgcolor="#DADA99"> 
      <td align="left"  colspan="2" ><a href="cod.cfm">Click here         if you wish to use Cash On Delivery</a>: COD currently available 
        in Bangalore, Mumbai, Jaipur, NCR and Lucknow. </td>
    </tr>--->
  
    <tr bgcolor="#DADAAA"> 
      <td colspan="2" align="left" bgcolor="#FFFFFF">&nbsp;</td>
    </tr><tr > 
            <td colspan="1" valign="middle" bgcolor="#DADA99"><span class="headerfont">International Credit 
                Card or eChecks</span> through Paypal.<span class="whiteonred"> 
                </span> <font color="#000000"><div class="whiteonred">Attn: </div> Payment will be  accepted by our channel partners  'Dynamic 
                Web'. </font> </td>
            <td valign=middle align="center" > 
              <!--- #amount# + #description#  o/p for debugging--->
              <cfoutput> 
                <form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post"  style="display:inline;">
                  <input type="hidden" name="cmd" value="_xclick">
                  <input type="hidden" name="business" value="anup@semiprecious.com">
                  <input type="hidden" name="currency_code" value="USD">
                  <input type="hidden" name="item_name" value='#session.cartid#<cfif Specialhandling eq "2.50">P<cfelseif specialhandling is "12.00">O</cfif><cfif Giftwrap neq "0">G</cfif>'>
                  <input type="hidden" name="amount" value='#decimalformat((25*total)/44.35)#'>
                  <input type="image" src="http://www.semiprecious.com/images/paypal_logo.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                </form></cfoutput>
        </td>
          </tr>
        
   <!---  <tr> 
	<form method="post" action="">
      <Td align="center">Franchisee Code: 
        <input type="text" name="indianfranchisee" size="6"  maxlength="12"></Td>
      <Td align="right"><input name="button" type="submit" class="inputtext" value="FRANCHISEE" ></Td>
    </tr></form> --->    <tr bgcolor="#DADA99"> 
      <Td colspan="2"  align="center"> <strong>Customer Friendly Return policy:</strong> Items may be returned 
        for <strong>full refund</strong> less shipping and handling charges within 15 days of reciept. The items must not be damaged or worn out in any         manner. </Td>
    </tr>
  </table>

    <cftry >
  <cfcookie expires="now" name="cartinfile" secure="no">
  <cffile action="delete" file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
  <cfcatch type="any"></cfcatch></cftry>

<!---    <CFSET #newearned# = #evaluate(total*(1-discount/100)*0.10)# + #creditleft#>
      <CFIF #session.mail# is not "">
        <CFQUERY DATASOURCE="semiprecious" NAME="credit">
        UPDATE memberinfo SET memberinfo.newearned = #newearned#, memberinfo.earned=#evaluate(tcredit1-rcredit)# 
        WHERE ((memberinfo.email)='#session.mail#') 
        </CFQUERY>
      </CFIF>
        </td>
      </tr> ---></cfif>

  <cfif isdefined("session.comingfrom")>
    <cfquery datasource="gemssql" >
    insert into visitrecord (comingfrom, firstpage,cartid) values ( '#session.comingfrom#','#session.thispage#',#session.cartid#) 
  
	</cfquery>
  </cfif>
  <cfif isdefined("form.suggestion") and (len(form.suggestion) GT 2)>
    <cfset buyer = 'buyer'>
      
  <cfif len(session.mail) GT 1>
    <cfset buyer = session.mail>
    </cfif>
    <cfmail from="#buyer#" to="anup@semiprecious.com" cc="stacy@semiprecious.com,nitish@semiprecious.com" server="mail23.webcontrolcenter.com" subject="suggestion">
      (cart :#session.cartid#) #form.suggestion# 
    </cfmail>
  </cfif>
  
      <cfcatch type="any">
    <cfmail cc="nitish@semiprecious.com" to="anup@semiprecious.com" server="mail23.webcontrolcenter.com" subject="error at india" from="service@semiprecious.com">
      #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message# 
    </cfmail> 
    <cfoutput>
    	  #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message# 
	    
    </cfoutput>
	<hr />
    An Error Occured while processing your request.     This message comes up in most cases because the session was  timed out for security reasons. This happens when the 
site sees no activity from your side for a long time. Very rarely the session also expires because   of  server restarts.     Whatever be the reason, we are sorry for the inconvenience caused. 
<cfif isdefined("cookie.cartinfile")>
    <strong> But we can recover your cart in one step</strong>! Just Click <a href="fillcart2.cfm">Here</a>. 
  </cfif>
<hr />
If the error persists please call +919968074073 now or email  nitish@semiprecious.com. We will take order over the phone and also use a 'secure 
    payment' gateway. <br />


    <hr />
  </cfcatch>
</cftry>
<cfinclude template="footer.htm">
</div>
</body>
</html>
