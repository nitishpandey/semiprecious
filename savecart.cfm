<CFPARAM NAME="j" DEFAULT="">
<CFPARAM NAME="qty" DEFAULT="0">
<CFPARAM NAME="total" DEFAULT="0">
<CFPARAM NAME="inrcost" DEFAULT="0"> <!--- for tracking the cost in indian rupees, stored in cartstatus table --->
<CFINCLUDE TEMPLATE="setup.cfm">
<CFPARAM NAME="discount" DEFAULT="0">
<CFPARAM NAME="rcredit" DEFAULT="0">
<cfparam name="noofsalesitem" default="0">
<CFPARAM NAME="itemlist" DEFAULT="">
<CFPARAM NAME="newearned" DEFAULT="0">
<CFPARAM NAME="tcredit1" DEFAULT="0">
<cfparam name="session.filter" default="salestatus=3">
<CFPARAM NAME="tcredit" DEFAULT="0">
<CFPARAM NAME="creditleft" DEFAULT="0">
<CFPARAM NAME= "SpecialHandling" DEFAULT="0">
<CFPARAM NAME= "GiftWrap" DEFAULT="0">
<CFPARAM NAME= "couponcode" DEFAULT="">
<CFPARAM NAME= "afid" DEFAULT="">
<CFPARAM NAME= "nonUS" DEFAULT="0">
 <cfparam name="url.filter" default="">
<!---  <CFIF couponcode is "">
<CFSET couponcode = "afid">
<cfelse>
<cfset afid = couponcode>	
</cfif> --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>


	<TITLE> Semiprecious.com</TITLE>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<link href="styles/rows.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY BGCOLOR="white" topmargin='0'>
<CFINCLUDE template="header.cfm"><br />
<cftry >
  <cfset timestamp = Now() >
 
  <table border="1" cellpadding="2" width="700" align='center'>
    <tr> 
    <tr align="center" class="row2"> 
      <td>Item Number</td>
      <td>Picture</td>
      <td>Price</td>
      <td>Quantity</td>
      <td>Amount</td>
    </tr>
    <cfif not session.cartid>
      <!--- to come to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of this page or
return to this page from a paypal's first page will not cause cartid to be incremented --->
      <cflock name="setcartid" type="exclusive" timeout="10">
        <cfset application.cartid = application.cartid + 1>
        <cfset session.cartid = application.cartid >
      </cflock>
    </cfif>
    <cfquery datasource="semiprecious" name="deletedata">
    Delete * from buyingrecord where email= '#session.cartid#' 
    </cfquery>
    <cfloop index="k" from="1" to="#ArrayLen(session.cartitem)#">
      <cfif session.cartitem[k][1] neq 0 and session.cartitem[k][4] neq 0>
        <tr>
          <td align='center'><cfoutput>#session.cartitem[k][1]#</cfoutput></td>
          <cfif k Is 1 and session.cartitem[1][4] neq 0>
            <cfset itemlist=session.cartitem[1][1] &"("& session.cartitem[1][4] &")">
            <cfelse>
            <cfif session.cartitem[k][4] neq 0>
              <cfset itemlist=#session.cartitem[k][1]# &"("& session.cartitem[k][4] &")" & "." & #itemlist#>
            </cfif>
          </cfif>
          <cfquery name="qprice" datasource="semiprecious">
          SELECT basecost,price, saleprice, nameid, status, newitem as newimage, 
          cat FROM Items WHERE newitem=#session.cartitem[k][1]# 
          </cfquery>
          <td align='center'> <cfoutput query="qprice"> 
              <cfif isdefined("qprice.basecost") and qprice.basecost neq "">
                <cfif qprice.basecost>
                  <cfset Variables.basecost = (Round((qprice.basecost*10)/45))/10>
                  <!--- exch rate is Rs 45 to a $ --->
                  <cfelse>
                  <cfset Variables.basecost = (round(3.5*price))/10>
                </cfif>
                <cfelse>
                <cfset Variables.basecost = (round(3.5*price))/10>
              </cfif>
              <cfset folder = cat>
              <cfif cat eq "Sets">
                <cfset folder = "necklaces">
              </cfif>
              <img src="images/#folder#/thumb/#newimage#.jpg" height="40"> </cfoutput></td>
          <td align='center'> <cfoutput query="qprice"> 
              <cfif newimage eq 414 and couponcode eq "70OFF">
                <cfset checkoutprice=#qprice.price#*0.30>
                <cfelseif couponcode eq "friend" or couponcode eq "AID">
                <cfset checkoutprice=qprice.price*0.70>
                <cfelseif couponcode eq "whole">
                <s>#Dollarformat(qprice.price)#</s> 
                <cfset checkoutprice=qprice.price*0.50>
                <cfif status is 3>
                  <cfset noofsalesitem = noofsalesitem + session.cartitem[k][4]>
                </cfif>
                <!--- #qprice.price# * 0.50 = #checkoutprice#
 --->
                <cfelse>
                <cfset checkoutprice=qprice.price>
              </cfif>
             
              #DollarFormat(price)#</cfoutput> </td>
          <td align='center'><cfoutput>#session.cartitem[k][4]#</cfoutput></td>
          <cfset qty= session.cartitem[k][4]+ qty>
          <td align='center'><cfoutput>#DollarFormat(checkoutprice*session.cartitem[k][4])#</cfoutput></td>
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
      <cfquery datasource="semiprecious" name="insertdata">
      INSERT INTO buyingrecord(cartid,email, itemid, quantity, affiliateID,datebought) 
      VALUES(#session.cartid#,'#session.cartid#',#session.cartitem[k][1]#, #session.cartitem[k][4]#,'SAVED',#timestamp#) 
      </cfquery>
    </cfloop>

	  <cfoutput>
          <div align="center"> 
            <table width="620" border="1" cellpadding="0" >
           
              <tr align="center" bgcolor="##000033"> 
                <td colspan="3"><font color="##FFFFFF">100 % Satisfaction Guaranteed</font></td>
              </tr>
            </table>Your cart saved. Your cart id is <cfoutput>#session.cartid#</cfoutput>. Please note down this cartid. It can be used within next 36 hours jump start your
shopping with the above items. <br>



      <cfinvoke component="cartcontrol.cartmonitor" method="newcart" >
        <cfinvokeargument name="cartid" value="#session.cartid#">
        <cfinvokeargument name="costprice" value="#inrcost#">
        <cfinvokeargument name="cost" value="0">
        <cfinvokeargument name="timestamp" value="#timestamp#">
        <cfinvokeargument name="couponcode" value="saved">
        <cfinvokeargument name="saleitemsno" value="#noofsalesitem#">
        <cfinvokeargument name="tqty" value="#qty#">
        <cfinvokeargument name="shipping" value="#shipping#:#nonUS#:#sh#:#GW#">
      </cfinvoke>
            <p><span class="category">Note</span><span class="headerfont">:If 
              you encounter any problem while making payment or have any doubt 
              please mail us with the cart id and details of problem faced to 
              stacy@semiprecious.com or click <a href="contactus.cfm?newitem=cart#session.cartid#">here</a> 
              to contact us. </span></p></cfoutput>
            </div>
          <!-- <input type=button class="greenbutton" onClick="goToURL()" value="Secure 2Checkout Payment"> -->
          <!---
<table><tr><td>
<p align="center"><font face="Verdana" size="2">I also accept US & International bidders & payment with a <br>
 major credit card via <strong><a href="http://www.bidpay.com" style="text-decoration: none;" target="_blan>
k"><font size="3" face="Times New Roman"><font color="#004080">B<sup><u>id</u></sup></font><font color="#ff0000" size="4">P</font><sup><u><font color="#ff0000">ay</font></u></sup></font></a></strong>. Fast, easy & secure.</font>
<BR><BR<a href="http://www.bidpay.com/" target="_blank">
<img border="0" src="http://www.bidpay.com/Banners/BidPayBanner3.gif" alt="On-line Money Orders. Buy your money orders here and close the deal now. BidPay."></a><BR><font face="Verdana" size="1">www.BidPay.com</font>
</td></tr></table>
--->
          <!---    <CFSET #newearned# = #evaluate(total*(1-discount/100)*0.10)# + #creditleft#>
      <CFIF #session.mail# is not "">
        <CFQUERY DATASOURCE="semiprecious" NAME="credit">
        UPDATE memberinfo SET memberinfo.newearned = #newearned#, memberinfo.earned=#evaluate(tcredit1-rcredit)# 
        WHERE ((memberinfo.email)='#session.mail#') 
        </CFQUERY>
      </CFIF> --->
        </td>
      </tr>
    
    <!---
<!-- Begin ExitExchange Code -->
<script src="http://count.exitexchange.com/js/1197715" language="JavaScript1.1" type="text/javascript"></script>
<!-- End ExitExchange Code -->
--->
  </table>
  <cfif isdefined("session.comingfrom")>
    <cfquery datasource="semiprecious" >
    insert into visitrecord (cameon,comingfrom, firstpage,cartid) values ( #session.start#,'#session.comingfrom#','#session.thispage#',#session.cartid#) 
    </cfquery>
  </cfif>
<cfif isdefined("form.suggestion") and (len(form.suggestion) GT 2)>
<cfset buyer = 'buyer'>
<cfif len(session.mail) GT 1>
<cfset buyer = session.mail>
</cfif>
<cfmail from="#buyer#" to="anup@semiprecious.com" cc="stacy@semiprecious.com,nitish@semiprecious.com" server="mail23.webcontrolcenter.com" subject="suggestion">
(cart ##:#session.cartid#) #form.suggestion#
</cfmail>
</cfif>
  <cfcatch type="any">
<!---     <cfmail cc="nitish@semiprecious.com" to="anup@semiprecious.com" server="mail23" subject="error at confirmation" from="service@semiprecious.com"
> --->
     <cfoutput> #cfcatch.Detail#, #cfcatch.Type#,,#cfcatch.Message#</cfoutput>
    <!--- </cfmail> --->
	<hr />
    An Error Occured while processing your request. You may try refreshing this 
    page again. If the error persists to order please call 512 589 9009 or email 
    stacy@semiprecious.com. We will take order over the phone and also use a 'secure 
    payment' gateway. You will need the cart items  which may be still available on <a href="http://www.semiprecious.com/cart.cfm">this 
    page</a>. <br>
	This message comes up in most cases because the session has timed out due to no activity for long time.
	Very rarely the session also expires because of server restarts. <br>
    What ever be the reason, we are sorry for the inconvenience caused. We will waive any shipping charges 
    for this order. 
	<hr />
  </cfcatch>
</cftry>
	<cfinclude template="footer.htm">
</body>
</html>

