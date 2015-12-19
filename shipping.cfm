<html>
<body topmargin="0">
<cfinclude template="header.cfm">
            <cfif not session.totalqty>
              <h4>Sorry, cart is empty....</h4> Use the Product Categories on top banner or 	  <a href="gemstone_jewelry_gallery.cfm?#session.filter#">Click here to shop</a>.<br>  
        		<cfif isdefined("session.cartinfile")>
			<cftry>
		 	  <cffile action="delete"  file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
			  <cfcatch type="any"> 
              </cfcatch>
			  </cftry>
		 <cfcookie 
           name = "cartinfile"
           expires = "now"        >
</cfif>
<hr />     
   <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> <br>
                  Note: In case your browser has been set not to accept cookies,                   email us item numbers you want and we will send you a secure 
                  web link to pay for them OR call us at 1-800 620 9849 with your                   item numbers. Cart does not work without cookies<br>
If you think you have cookies ON and empty cart is incorrect please click <a href="contactus.cfm" target="_self">here</a> and inform us of this error.
</td></tr></table></td></tr></table></td></tr></table>
<cfinclude template="footer.htm">
              <cfabort />
            </cfif>
			<cfset Variables.totalqty = session.totalqty />
                   <cfif totalQty is 1>
                       <cfset shipping = 1.95>
              <cfelseif totalQty is 2>
              <cfset shipping =0.50>
              <cfelseif totalQty gt 2>
              <cfset shipping  = 0.00>
            </cfif>
			<cfif not isdefined("session.cartinfile")>
		     	<cfif isdefined("session.bulkbuyer.id")>
			      <cfset  session.cartinfile = session.bulkbuyer.id />
		         	<cfelseif  len(session.mail)>
		             	<cfset session.cartinfile = session.mail />
               	<cfelse>
		     	<cfset session.cartinfile = datepart('d',now()) & datepart('m',now()) &  timeformat(now(),'HHmm') & randrange(10,50) & '.txt'>
			</cfif>
			</cfif>
<!--- <cfif isdefined("cookie.cart")>
<cfoutput>Set this cookei #cookie.cart#.</cfoutput>
</cfif> --->

  <form action="confirmation1.cfm" method="post" name="wishbuy" >
            <cfset GrandTotal= shipping + #evaluate(url.tg/3)# />
			<cfif isdefined("session.india")>
													<tr bordercolor="#FFFFFF">
    <td colspan="4" bgcolor="#FFFFFF" align="left">If you have more shopping to do: </td><td  align="center"><a href="gemstone_jewelry_gallery.cfm?<cfoutput>#session.filter#</cfoutput>"><img name="continueshopping1" src="images/continueshopping1.gif" width="180" height="25" border="0" alt=""></a></td>
  </tr>
				<tr bordercolor="#FFFFFF">
    <td colspan="4" bgcolor="#FFFFFF" align="left">If you are finished with your shopping : </td><td  align="center"><a href="indiaconfirmation1.cfm"><img src="/images/paymentandshipping1.gif" border="0" width="180" height="25" ></a></td>
  </tr>
					<cfelse>
		<tr  class="inputtext" >
                
    <td colspan="4" height="2"  align="left" > 
        Your confidence is important to us. Any concern?<strong> Call us now:</strong>1-800-620-9849       
       </td>
                <td colspan="3"  align="center" bgcolor="#FFFFFF">
Continue Shopping </td>  </tr></table> 
</td></tr><tr><td align="center">
<table align="center"  border="1"  bordercolor="#999999">
  <tr><td class="cyansilverfilter" colspan="2" align="left">Shipping Instructions (All costs are in US Dollars):</td></tr>  	      <tr> 
       	      <tr> 
            <td  align="right" nowrap> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Basic 
              Shipping:</td>
            <td  align="right" nowrap><cfif totalQty is 2>
                (Buy 1 more items &amp; get <strong>FREE </strong>1st class shipping!) 
                <cfelseif totalQty is 1>
				               (1st class shipping charges: 2 items <strong>$0.5</strong>, 3  or more items <strong>FREE! </strong>) 
              </cfif>
    
	  $ <input type="hidden" size="4" name="shipping"    id="shipping"  value="<cfif  isdefined("session.bulkbuyer.id")>7.50<Cfelse><cfoutput>#shipping#</cfoutput></cfif>"> <cfif  isdefined("session.bulkbuyer.id")>7.50<Cfelse><cfoutput>#shipping#</cfoutput></cfif>
            </td>
          </tr>
<!--           <tr> 
            <td align="center" valign="middle" bgcolor="#CCCC99"><font face=arial narror size=2> 
              <script src="http://js.squaretrade.com/REL026/026269634.js"></script>
              </font></td> 
            <td colspan="2" align="left" bgcolor="#CCCC99" style="padding-bottom:2px;"> <ul>
                <li> Finished with shopping? Make your shipping choices if any 
                  in the form below.</li>
                <li>Then click on '<strong>Start Check Out</strong>' button to 
                  '<strong>finalize' </strong>your cart. </li>
                <li>With the 'finalized cart' you will see exact total and <strong>'secure' 
                  payment choices.</strong> </li>
              </ul></td>
          </tr>-->
         
                <input type="hidden" size='3' name="discount" value="0">
  <!---  <input type="hidden" name="specialhandling" value="0.00">  
  when removing delayed shipping above hidden variable is to be shown and toggle in other situation----> 
          <cfif isdefined("session.giftid") and session.giftamt GT 0>
            <tr> 
              <td  align="right" valign="middle"  >Gift 
                Amt (#):</td>
              <td align="right" valign="middle"> 
                $ <cfoutput>#session.giftamt#</cfoutput>.00 </td>
              <input type="hidden" value="gift" name="couponcode">
            </tr>
            <cfelseif isdefined("session.bulkbuyer.id")>  
							<cfset shipping = handlingcharges /> <tr> 
            <td  align='right'>Ship To: </td>
            <td align="right"> 
              <cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
                <option value="0.00" >USA/Greenland: $0.00</option>
                <option value="5.00" >Canada: $5.00</option>
                <option value="8.00" >Europe/Australia (7 to 10 days): $8.00</option>
                <option value="25.00">Asia/Africa (7 to 15 days): $25.00</option>
              </cfselect> </td>
          </tr> 
              <input type="hidden" value="regwsale" name="couponcode">
			<input type="hidden" name="GiftWrap" value="0.00" />
			<input type="hidden" name="giftmsg" value="na" />
			<input type="hidden" name="SpecialHandling" value="0.00" />
            <cfelse>   
			<cfif isdefined("url.texaserror")><tr class="error" ><cfelse>			<tr></cfif>
              <td align="right">Buying from Texas? (<span class="error">*</span>):</td>
              <td align="right">No <input type="radio" name="texas" value="0" />&nbsp;&nbsp;Yes<input type="radio" name="texas" value="1" /> [Add Sales Tax 8.25%]</td></tr>
 <tr> 
            <td  align='right'>Specify Shipping Region: </td>
            <td align="right"> 
              <select name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
<option value="0.00" >USA/Greenland: Add $0.00</option>
                <option value="1.00" >Canada: Add $1.00</option>
                <option value="2.00" >Europe/Australia (7 to 10 days): Add $2.00</option>
                <option value="10.00">Asia/Africa (7 to 15 days): Add $10.00</option>
              </select> </td>
          </tr>
		   	 	  <tr> 
            <td  align="right"> 
                Shipping Upgrade<b>(Only USA): </b></td>
            <td  align="right"> <select name="SpecialHandling" onclick="javascript:grandtotal(this.form)">
                <option value="0.00" selected>Regular Mail (4 to 7 days from today): 
                $0.00</option>
                <option value="2.65" >Priority Mail with free tracking (2-3 days, 
                not guaranteed): $2.65</option>
                <option value="12.00">Federal Express 2 day (guaranteed): $12.00</option>
              </select> </td>
          </tr>     <tr> 
            <td  align='right' nowrap><font color="#000000">Gift Wrap</font>: 
            </td>
            <td align="right"  > <select name="GiftWrap" onclick="javascript:grandtotal(this.form)">
                <option value="0.00" selected>No Gift Wrap</option>
                <option value="1.50" >Gift Wrap: $1.50</option>
              </select> </td>
          </tr>
		  <tr id="giftmsg">
            <td align="right"><span id="j"  style="text-decoration:underline" onClick="MM_showHideLayers('giftmessage','','show')">Your 
              Message  (If Gift Wrap)</span>:</td>
            <td align="right" nowrap >
              <input type="text" name="giftmsg" size="50" maxlength="245" />
            </td>
          </tr>
     
            <tr> 
              <td  align="right" valign="middle" nowrap  ><font color="#000000">Affiliate/Discount 
                code</font>:</td>
              <td align="right" valign="middle"> 
                <input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18"> 
              </td>
            </tr>
          </cfif>  
          <tr bgcolor="#FFFFFF"> 
            <td  colspan="2" align='center'> 
<input type="submit" value="Final Total & Select Secure Payment Method" />
</td>
          </tr>
</table>
      
 
</td>
      </tr></cfif>
    </TABLE></td></tr>
      <cfoutput> 
        <cfif not totalqty>
		<tr><td colspan="6" class="details">
          No Item Bought. Click <a href="index.cfm" class="unnamed1" alt="start jewelry shopping">Here</a> 
          to Start Shopping. 
          <hr> <cfif isdefined("session.cartinfile")>
			<cftry>
			<cfcookie 
           name = "cartinfile"
           expires = "now"        >
			  <cffile action="delete"  file="d:\inetpub\semiprecious\carts\#session.cartinfile#"  />
			  <cfcatch type="any"> You can use the product categories on top navigator to make a specific choice.<br>
</cfcatch></cftry>
						  <cfcookie 
   name = "cartinfile"
   expires = "now"
>
</cfif>
          <br>
          In case your browser has been set not to accept cookies, to order without           cookies, email us item numbers you want and <br>
        we will send you a secure web link to pay for them OR call us at 1-800-908-4064         with your item numbers. Cart does not work without cookies<br>
          If you think you have cookies ON and empty cart is incorrect please           click <a href="contactus.cfm" target="_self">here</a> and inform us 
          of this error.<br>
          <br>
          <span class="row2">If you are returning with a cartid , click <a href="fillcart.cfm"><strong>here</strong></a></span> 
          . </td></tr>
        </cfif>
<!---         <input type="hidden" name="tcredit1" value="#getcredit1.earned#">
        <input type="hidden" name="newearned" value="#getcredit1.newearned#"> --->
      </cfoutput> </form> </td>
  </Tr></table> 
    <CFINCLUDE TEMPLATE="footer.htm"> 

<cfoutput><script language="JavaScript1.1">
document.getElementById("cart").style.color = "maroon";
		
  document.getElementById("cart").style.textDecoration = "none" ;
  
<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>
	
</script>

</cfoutput>
</div></body></html>
