<cfparam default="#session.mail#" name="session.name" />
<cfif not (CGI.HTTP_REFERER contains 'indiacart.cfm')>
<cflocation url="https://#cgi.SERVER_NAME#/indiacart.cfm" />
</cfif>
<cfparam name="new_shipping" DEFAULT="0">
<CFPARAM NAME="j" DEFAULT="">
<CFPARAM NAME="qty" DEFAULT="0">
<CFPARAM NAME="total" DEFAULT="0">
<CFPARAM NAME="inrcost" DEFAULT="0">
<cfset handlingcharges = 5>
<cfset saletotal = 0 />	
<cfset shipping_charges = 150 + new_shipping />
<cfparam default="0" name="checkoutprice" type="numeric" />
<!--- for tracking the cost in indian rupees, stored in cartstatus table --->
<CFINCLUDE TEMPLATE="setup.cfm">
<cfparam name="tpdiscount"  default="0" />
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
<CFPARAM NAME= "form.GiftWrap" DEFAULT="0">

<CFPARAM NAME= "GiftWrap" DEFAULT="#form.giftwrap#">
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
<script type="text/javascript" src="/js/mm_menu.js"></script>
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY style=margin-top:0">
<div align="center">
<div id="container1" >


<CFINCLUDE template="/headerindia.cfm">
<div id="container2">
  <div style="width:930px">
<cfset timestamp = Now() >
<cfset couponcode = trim(couponcode)>
   <cfif session.cartid is 0>
      <cfif isdefined("session.confirmed_cartid")>
	     <cfset session.cartid = session.confirmed_cartid />
         <cfset k = structdelete(session,'confirmed_cartid') />
	   <cfelse>
   			<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />
    </cfif>
</cfif>  
	<!--- session cartid  calculated --->
	<cfquery datasource="gemssql" name="deletedata">
    Delete  from buyingrecord where cartid= #session.cartid#
    </cfquery>
	<!--- now ascertain discount details --->
  <cfif couponcode neq "">
<cfquery datasource="sptm" username="nitish" password="rangeela" name="ws">
select email, discount ,code, coupon_type from bulkbuyercoupons where code = '#couponcode#'
</cfquery>
<cfif ws.recordcount><!--- is it tps --->
	<cfquery datasource="sptm" username="nitish" password="rangeela" name="wsdetails">
		select membershipdate,status from bulkbuyers where id = '#ws.email#'
	</cfquery>
  <cfif wsdetails.recordcount >
    <cfif wsdetails.status and wsdetails.membershipdate GT Now()>
  	<cfset tpsale = 1>
		<cfset tpdiscount = ws.discount/100>
		<cfset bbid = ws.code>
  </cfif>
   <cfelseif ws.coupon_type is 'referral_35'> <!--- is it a referral coupon? --->
       <cfset tpsale = 1 />
       <cfset couponflag = 1 />
   		<cfset tpdiscount = ws.discount/100>
		<cfset bbid = ws.code>
</cfif>

	</cfif><!--- is it tps/ not --->
	</cfif><!--- is there a coupon code --->
<cftry >
  <cfif session.cartitem[1][1]>
  
<div style="margin-top:10px">&nbsp;</div>
<h3 style="padding:1px;background:white;">Your Finalized Shopping Cart</h3>
&nbsp;
<table border="0" cellpadding="2" style="display:table;border:1px gray solid;background:white;width:680px;text-align:left;" align='center'>
  <tr align="center" class="grayplacard"> 
    <td width="15%">Item Id</td>
    <td>Picture</td>
    <td>Price</td>
    <td>Quantity</td>
    <td>Amount</td>
  </tr>
  <cfloop index="k" to="1" from="#ArrayLen(session.cartitem)#"  step="-1">
  
      <tr> 
        <td align='center'><cfoutput>#session.cartitem[k][1]#</cfoutput></td>
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
            
              <cfset Variables.basecost = basecost />
            <cfset folder = cat>

            <img src="images/#folder#/thumb/#newimage#.jpg" height="40"> 
          </cfoutput>
		  </td>
        <td align='center'> 
	<cfoutput query="qprice">
            <cfif isdefined("tpsale") >
	              <cfif status is 3 >
				  			<cfset noofsalesitem = noofsalesitem + session.cartitem[k][4] >
	                       	<cfset checkoutPrice=(1- tpdiscount/2)*qprice.saleprice >
	                		<cfif qprice.saleprice is "" or qprice.saleprice eq 0.00 >
	                        	 <cfset checkoutprice=session.sale_factor*0.80*qprice.price >
	            	    	</cfif>
	                        <cfset saletotal = saletotal + checkoutprice >																																															
	                		<font color="red"> ON SALE!</font> 
	                <cfelse>
	          	      	<cfset checkoutprice = (1-tpdiscount)*qprice.price>
			      </cfif>
             <cfelseif len(session.bulkbuyer.id)>
			 	 <cfset session.mail = session.bulkbuyer.id>
              	<cfif qprice.wholesaleprice eq  0 or qprice.wholesaleprice eq  "">
                    <cfset checkoutprice=qprice.price*0.50>
                <cfelse>
                	<cfset checkoutPrice=qprice.wholesaleprice >
              	</cfif>
		      <Cfelse>
	              <cfif status is 3 and couponcode neq "whole">
                	<cfset noofsalesitem = noofsalesitem + session.cartitem[k][4] >
							<cfif qprice.saleprice is "" or qprice.saleprice eq 0.00 >
			                           <cfset checkoutprice=0.80*qprice.price >
			                    <cfelse>
			        			        <cfset checkoutPrice=session.sale_factor*qprice.saleprice >
							</cfif>
						<font color="red"> 
				             Sale Price
						</font>
					<cfset saletotal = saletotal + checkoutprice > 
               <cfelseif couponcode eq '7q382y39p4' >		
				  <cfset couponflag = 1>
                 <cfset checkoutprice =  0.80*qprice.price >
                <s>#format(qprice.price)#</s> 
                <cfelseif findnocase('moth',couponcode) or  couponcode is 'foifauji30'  >		  
				<cfset couponflag = 1>
                <cfset checkoutprice =  0.80*qprice.price >
                <s>#format(qprice.price)#</s>    
				<cfelse>
				<cfset checkoutprice =  qprice.price >

				    </cfif>
            </cfif>
			<cftry>
			<cfif session.cartitem[k][5]>
							   <cfquery datasource="gemssql" name="opts">
                	
      		select   valueadd,description from options where itemid = #session.cartitem[k][1]# and optionid = #session.cartitem[k][5]#
				</cfquery>
				<cfset checkoutprice = checkoutprice + opts.valueadd>
				(#opts.description#)<br>

				</cfif>
				<cfcatch type="expression">
					<cfdump var="#opts#">
				<cfoutput>#cfcatch.message#</cfoutput>
				<cfset session.cartitem[k][5] = 0>
				</cfcatch>
				</cftry>
				<cfset valueadd = 0>
#format(checkoutprice)# </cfoutput> </td>
        <td align='center'><cfoutput>#session.cartitem[k][4]#</cfoutput></td>
        <cfset qty= session.cartitem[k][4]+ qty>
        <td align='center'> 
		<cfset itemprice=checkoutprice>
       <cfset inrcost =  basecost*session.cartitem[k][4] + inrcost>

       <cfset total=itemprice*session.cartitem[k][4] + total>
	        <cfset amount = total />
        
<cfoutput>#format(evaluate(checkoutprice*session.cartitem[k][4]))#</cfoutput> </td>
      </tr>
   
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
	<cfif isdefined("form.contact")>
	<cfset emailtemp = form.contact />
	<cfelse>
     <cfset emailtemp = 'na'>
	<!--- till date of record where we had ina as email last, the rate was the dollar value a US buyer would ahve paid on .com. not the value that we billed --->
	</cfif>
	</cfif>
    <cfquery datasource="gemssql" name="insertdata">
    INSERT INTO buyingrecord(cartid,rate,email, itemid, quantity, affiliateID,datebought,optionid) 
    VALUES(#session.cartid#,#evaluate(checkoutprice*application.exch[session.country]/application.exchangerate)#,'#emailtemp#',#session.cartitem[k][1]#, #session.cartitem[k][4]#,'#couponcode#',#timestamp#,#session.cartitem[k][5]#) 
    </cfquery>
  </cfloop>
  </cfif>
    <cfif qty is 1>
    	<cfset shipping = 1.95>
    <cfelseif qty eq 2>
	    <cfset shipping  = 0.50>
    <cfelseif qty GT 2>
    	<cfset shipping = 0.00>
	<cfelseif  qty eq 0>
	</cfif>
  <cfoutput> 
   <tr align="center" >
        <cfif len(session.mail) and not isdefined("url.save")>
          
          <cfif couponflag>
            <td colspan=5 align=Center>Discount Coupon Used.   </td>
            <cfelse>
           <td  align="right" colspan=4  ><font color="##CC3300">Loyalty Discount:</font></td>
            <td align="center">
	<cftry>
   	<cfinvoke component="invitationandcredit" method="reversecredit"  returnvariable="q">
	   <cfinvokeargument name="mail" value="#session.mail#" />
   </cfinvoke>
	<cfcatch type="any">
         <cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="Could not reverse "  type="html">
			  #cfcatch.detail#, #cfcatch.message# for #session.mail#
		  </cfmail>
		<cfoutput>#cfcatch.detail#, #cfcatch.message# for #session.mail#
		</cfoutput> 
	</cfcatch>
	</cftry>
	
	<cfinvoke component="invitationandcredit" method="usecredit" returnvariable="reducedtotal" >
              <cfinvokeargument name="amounttopay" value="#total#"><!--- total is still in what an american would see --->
              <cfinvokeargument name="saleitemamount" value="#saletotal#">
              <cfinvokeargument name="finalize" value="#session.cartid#">
              <!--- a non zero value will finalize but if it is an existing cartid it will only show credit used for that cartid , that not just compute but reduced from total credit available .  Plus using cartid helps us see if the cart is new or old , if old then what credit was used , that is then used again with out reducing from total --->
              </cfinvoke>
              </font>
			  <cfset loyalty_discount = total - reducedtotal />
			  <cfset coupon_saving = loyalty_discount />
             <cfset amount = reducedtotal />
              <!--- out here now reduce the rate entered for each item in the database --->
            </td>
          </cfif>
      
        </cfif>
        </tr>
        
    <cfif total>
      <cfset shipping=shipping + SpecialHandling +  nonUS + GiftWrap>
      <tr>
        <td  colspan="5" align="right"><font color="##000000">Items 
          Total</font>:#format(amount)#</td>
      </tr>
	  <tr><td colspan="5" align="right"> (Add VAT @ 1% )<cfset total = 1.01*(amount+form.giftwrap) /> Amount including tax #format(total)#</td></tr>
    </cfif>
   <tr> 
        <td align="center" colspan="2" >
		<a href='gemstone_jewelry_gallery.cfm?#session.filter#' class="side_link"><b><i>Do more Shopping?</i></b></a></td>
        <td colspan="3" align="right">&nbsp; 
Shipping Charges : &nbsp;&nbsp; Rs #shipping_charges# <cfif form.giftwrap> + Gift Bag: #format(1)# </cfif>
          <!--- <cfif couponcode eq "">
	Whole Sale & Bulk Buyers click <a href="http://www.semiprecious.com/contactus.cfm?newitem=999">here</a>.  
</cfif> --->
        </td>
		</tr> <!---  <tr>
        <td  colspan="5" align='right'> <cfif GiftWrap GT 0>
            Shipping & Gift Wrap: 
            <cfelse>
            Shipping : 
          </cfif>
          &nbsp;&nbsp;#format(shipping)#</td>
      </tr>
   
<CFIF evaluate((amount*discount/100) + 3.95-shipping) GT 0><tr><td  colspan="6" align='right'><font color='red'>Savings From Discount:&nbsp;&nbsp;<cfoutput>#format(evaluate(total*discount/100) + 3.95-shipping)#</cfoutput></font></td></tr></CFIF>

<tr><td  colspan="5" align='right'><font color='red'><cfif session.mail IS NOT "">Points Acquired (useable only towards future purchases):&nbsp;&nbsp;<cfoutput>#format(evaluate(total*(1-discount/100))*0.10)#</cfoutput></font></cfif></td></tr>
<tr><td  colspan="5" align='right'><font color='red'><cfif rcredit IS NOT "0">Points Used: &nbsp;&nbsp;<cfoutput>#format(rcredit)#</cfoutput></font></cfif></td></tr>
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
  <cfset amount = amount + shipping>
  <cfif isdefined("session.giftid")>
    <cfif session.giftamt GT 0>
      <cfset amount = amount - session.giftamt>
      <cfif qty EQ 2>
        
        <cfset amount = amount - 0.5>
        <cfelseif qty eq 1>
        <cfset amount = amount - 1.95>
				<cfelseif  qty eq 0>
		
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
  <tr > 
    <td colspan="2" align="center"  ><font color="##C0C0C0"  face="Arial, Helvetica, sans-serif"> 
      <span class=""><strong><font color="##000040">Your cart id  :</font></strong></span><strong> <font color="##800000"> 
      <!--- <cfset redundantid = randrange(10,99)> #redundantid# --->
      <span class="">#session.cartid#</span></font></strong></font> </td>
    <td  colspan="3" class="" align='right'  > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> 
      Grand Total  :&nbsp;&nbsp;#format(evaluate(total + shipping_charges/value_convert(1)))#</b>
<cfset grandinRs = (round(100*(value_convert(evaluate(total + shipping_charges/value_convert(1))))))/100 />
	  <cfset grandtotal = evaluate(total + shipping_charges/value_convert(1))>
	  
	  </td>

  </tr>
  
</table></cfoutput>
<cfif isdefined("url.save")>
<h3>Your Cart Contents have been Saved  <cfif len(session.mail) or isdefined("session.bulkbuyer.id")>
    
<cfset mailto = session.mail>
<cfmail bcc="nitish@semiprecious.com" to="#mailto#" failto="nitish@semiprecious.com" from="service@semiprecious.com" subject="Shop later at semiprecious.com" 
 type="html">
Dear customer,<br>
 Your cart contents have been saved with the cartid #session.cartid#. You can use the <a href="http://www.semiprecious.com/fillcart.cfm">activate cart</a> link given on the home page (Right side in Utilities Column) to continue this shopping from any computer or place.
 [Link is http://www.semiprecious.com/fillcart.cfm]<br>	Note: Saving of content does not imply protection against price revisions and stock non - availability on your return.

Semiprecious.com assures you of excellent quality, price and service.
<br>
 Thankyou.<br>
 - Customer Relations Department</cfmail> and mailed to you for easy recall
<cfelse>but the details could not be mailed to you.   This reminder mail  facility can be availed  if  you are registered and logged in.</cfif>.</h3><br><br>

<div class="detailpricerow"> You can use the <a href="http://www.semiprecious.com/fillcart.cfm?cartid=#session.cartid#">activate cart</a> link given on the home page (Right side in Utilities Column) to continue this shopping from any computer or place.<br>
In the activate cart page you need to provide this cartid to fill the cart in one step!
<br>
    <span class="details">If you wish to continue with this shopping  right now click <a href="#session.cart#">here</a> </span><br>

	Note: Saving of content does not imply protection against price revisions and stock non-availability at a later date.</div>
<cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
      <cfinvokeargument name="cartid" value="#session.cartid#">
      <cfinvokeargument name="costprice" value="#evaluate(inrcost/application.exchangerate)#">
      <cfinvokeargument name="cost" value="#evaluate(value_convert(total+shipping_charges/value_convert(1))/application.exchangerate)#">
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
    <cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
      <cfinvokeargument name="cartid" value="#session.cartid#">
      <cfinvokeargument name="costprice" value="#evaluate(inrcost/application.exchangerate)#">
      <cfinvokeargument name="cost" value="#evaluate(value_convert(total+shipping_charges/value_convert(1))/application.exchangerate)#">
	  <cfinvokeargument name="tps" value="#modtps#">
      <cfinvokeargument name="timestamp" value="#timestamp#">
      <cfinvokeargument name="couponcode" value="india">
      <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
      <cfinvokeargument name="tqty" value="#qty#">
      <cfinvokeargument name="shipping" value="#decimalformat(evaluate(value_convert(shipping_charges/value_convert(1))/application.exchangerate))#:#nonUS#:#sh#:#GW#">
    </cfinvoke>
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

		<cfif listfind("rakhi,aksviz" ,form.indianfranchisee) >
<br>
		Franchisee Discount Code Used 

		<cfset total = 0.92*total + 4>
		</cfif>

		<cfelse>
		<cfset total = total + 4>

		</cfif>

  <cfoutput>

  <table width="700px" style="background:white;margin-top:20px" align="center" border="1" cellspacing="0" cellpadding="0">
	<!--- <Tr><td colspan="2" >Amount to pay after discount: <span class="biggreen">#format(total)#</span></td></Tr>
   <tr bgcolor="##DADA99"> 
      <td align="left" bgcolor="##FFFFFF" colspan="2" ><font color="##888888">Your
        confidence comes first, any concern call us now on +919968074073</font></td>
    </tr> --->
    <tr > 
      <Td align="left" colspan="2" class="form_heading" >Select a Convenient Payment  Option: </Td>
    </tr><!-- 
<tr>
<td colspan=1 align=left>
You have 3 Options:<br />
<span style="margin-left:4px;">
* Pay Using Your Internet Enabled Bank Account <br>
* Pay by PayMate(Mobile payment)<br>
* Pay by ITZ Cash Cards </span>
</td><td align=center valign=top> <form action="https://secure.ebs.in/pg/ma/sale/pay/" method="post" >
	<cfloop collection="#form#" item="key">
		  <input type="hidden" name="#lcase(key)#" value="#form[key]#"> 
    </cfloop>
        		  		
		    <input type="image" src="/images/ebs_button.jpg" width="80px;">
			<br />(Secure Indian Payment Gateway: <strong>EBS</strong>)
            </form>

</td>
 </tr>-->
<!---
<tr>
<td colspan=1 align=left>
You have 2 options with <strong>CCAvenue</strong>:<br />
<span style="margin-left:4px;">*Internet Enabled Bank Account <br />
&nbsp;*Credit Card
</span>

</td><td align=center valign=top> 
	<cftry>
	<form action="https://www.ccavenue.com/shopzone/cc_details.jsp" method="post" >
            <input type="hidden" name="Order_Id" value="#session.cartid#">
            <input type="hidden" name="Amount" value="#grandinrs#">
            <input type="hidden" name="Merchant_Id" value="M_acemat_9705">
            <input type="hidden" name="billing_cust_name" value="#session.name#"> 
            <input type="hidden" name="billing_cust_address" value="#session.address.address1#"> 
            <input type="hidden" name="billing_cust_country" value="india"> 
            <input type="hidden" name="billing_cust_tel" value="#session.address.phone#"> 
            <input type="hidden" name="billing_cust_email" value="#session.mail#"> 
            <input type="hidden" name="billing_zip_code" value="#session.address.zip#"> 
            <input type="hidden" name="billing_cust_state" value="#session.address.state#"> 
            <input type="hidden" name="billing_cust_city" value="#session.address.city#"> 
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
	<cfcatch type="any"><cfoutput>#cfcatch.detail#</cfoutput>
	<cfabort />
	</cfcatch>
</cftry>	

</td>
</tr>--->
    <tr > 
      <td align="left"  bgcolor="##FDFDFD"  colspan="2" >&nbsp;</td>
    </tr>
    <tr > 
      <td align="left" bgcolor=""  style="font-size:1.1em;" ><strong>Check/Demand Draft</strong> Shipping is done after realisation 
        of check. Outstation Checks are accepted.</td>
		
      <td align="center" bgcolor=""  style="font-size:1.2em;" ><a href="paybycheck.cfm?amt=#grandtotal#&cartid=#session.cartid#" class="side_link">Click to Pay by Check/Demand Draft</a></cfoutput></td>
    </tr>
    <tr bgcolor="white"> 
      <td align="left" bgcolor="#FDFDFD" colspan="2" >&nbsp;</td>
    </tr>
  <!---  <tr bgcolor="#DADA99"> 
      <td align="left"  colspan="2" ><a href="cod.cfm">Click here         if you wish to use Cash On Delivery</a>: COD currently available 
        in Bangalore, Mumbai, Jaipur, NCR and Lucknow. </td>
    </tr>--->
  
		     <tr > 
            <td colspan="1" valign="middle" ><span class="rowb"> Online bank transfer can be done by Cicking on the right<p> </td>
            <td valign=middle align="center" > <a href="/paybyonlinetransfer.cfm?amt=<cfoutput>#grandtotal#&cartid=#session.cartid#</cfoutput>">CLICK FOR BANK TRANSFER INFORMATION</a>
        </td>
          </tr>
        
   <!---  <tr> 
	<form method="post" action="">
      <Td align="center">Franchisee Code: 
        <input type="text" name="indianfranchisee" size="6"  maxlength="12"></Td>
      <Td align="right"><input name="button" type="submit" class="inputtext" value="FRANCHISEE" ></Td>
    </tr></form> --->  </table><table style="color:black;margin-bottom:20px;">  <tr > 
      <Td colspan="2"  align="left"> <strong>Customer Friendly Return policy:</strong><br /> Items may be returned 
	
        for <strong>full refund</strong> less shipping and handling charges within 15 days of reciept. The items must not be damaged or worn out in any         manner. </Td>
    </tr>
  </table>
  

<!---    <CFSET #newearned# = #evaluate(total*(1-discount/100)*0.10)# + #creditleft#>
      <CFIF #session.mail# is not "">
        <CFQUERY DATASOURCE="semiprecious" NAME="credit">
        UPDATE memberinfo SET memberinfo.newearned = #newearned#, memberinfo.earned=#evaluate(tcredit1-rcredit)# 
        WHERE ((memberinfo.email)='#session.mail#') 
        </CFQUERY>
      </CFIF>
        </td>
      </tr> ---></cfif>

 
<cfif isdefined("form.suggestion") and (len(form.suggestion) GT 2)>
    <cfset buyer = 'buyer'>
	  <cfif len(session.mail) GT 1>
    <cfset buyer = session.mail>
    </cfif>
    <cfmail from="#buyer#" to="anup@semiprecious.com" cc="smriti@semiprecious.com"  subject="suggestion">
      (cart :#session.cartid#) #form.suggestion# 
    </cfmail>
  </cfif>
  
      <cfcatch type="any">
 <cfoutput>     #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message# 
	  <cfif isdefined("cfcatch.sql")>
	  #cfcatch.sql#,
	  </cfif>
	<cfif isdefined("form")>
	<cfdump var="#form#" />
	</cfif></cfoutput>
	<hr />
    An Error Occured while processing your request.     This message comes up in most cases because the session was  timed out for security reasons.
	Session also expires because   of  server restarts.     Whatever be the reason, we are sorry for the inconvenience caused.
	If the error has happened due to You may try again <cfoutput>#cfcatch.detail#, #cfcatch.message#</cfoutput>
<cfif isdefined("cookie.cartid")>
<cfoutput>    <strong> But we can recover your cart in one step</strong>! Just Click <a href="fillcart.cfm">Here</a>. </cfoutput>
  </cfif>
<hr />
If the error persists please call +919910815132 now or email  nitish@semiprecious.com. We will take order over the phone and also use a 'secure 
    payment' gateway. <br />


    <hr />
  </cfcatch>
</cftry>
</div>
</div>
<cfinclude template="mainfooter.cfm">
<cfset session.confirmed_cartid = session.cartid /><!--- only to avoid cartid changing on refresh. hence confirmed_cartid is to be used only on this page and no whereelse--->
<cfset session.cartid = 0 /><!--- this ensures that if you go back to site and go to cart you will be issued a new cartid and you cannot delete any item of this cart from db now --->

</div>
</body>
</html>
