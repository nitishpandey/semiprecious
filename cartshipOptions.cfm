
<table align="center"  border="1"  cellspacing="0" bordercolor="#bbbb99" width="792px" style="border:0px black ridge;">
       	      <tr> 
            <!--   <td align="center"><input name="button" type="button" class="greenbutton" onclick="javascript:goProcess('Click here to Buy More Items')" value="Continue Shopping"> 
              </td> -->
            <td  align="right" nowrap> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Standard Shipping:</td>
            <td  align="right" nowrap>      <input type="hidden" size="4" name="shipping"    id="shipping" onFocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="<cfif  isdefined("session.bulkbuyer.id")><cfoutput>$#handlingcharges#</cfoutput><Cfelse><cfoutput>$#shipping#</cfoutput></cfif>"><cfif  isdefined("session.bulkbuyer.id")><cfoutput>$#handlingcharges#</cfoutput><cfelse>-----------------(free for $70+ order) ---------------------- :<cfoutput>$#shipping#</cfoutput></cfif>
            </td>
          </tr>
         
                <input type="hidden" size='3' name="discount" value="0">

		  <cfset newsubtotal = subtotal /> 
          <cfif isdefined("session.giftid") and session.giftamt GT 0>
            <tr> 
              <td  align="right" valign="middle"  >Gift 
                Amt (#):</td>
              <td align="right" valign="middle"> 
                $<cfoutput>#session.giftamt#</cfoutput>.00 </td>
              <input type="hidden" value="gift" name="couponcode">
            </tr>
            <cfelseif isdefined("session.bulkbuyer.id")>  
					
 	<cfset shipping = handlingcharges /> <tr> 
            <td  align='right'>Shipping Region: </td>
            <td align="right"> 
              <cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
                <option value="0.00" >USA/Greenland: $0.00</option>
                <option value="5.00" >Canada: $5.00</option>
                <option value="7.00" >South America: $7.00</option>
                <option value="8.00" >UK/Europe (5  days): $8.00</option>
                <option value="8.00" >Australia (7  days): $8.00</option>
                <option value="25.00">Asia/Africa (7 to 15 days): $25.00</option>
              </cfselect> </td>
          </tr> 
              <input type="hidden" value="regwsale" name="couponcode">
			<input type="hidden" name="GiftWrap" value="0.00" />
			<input type="hidden" name="giftmsg" value="na" />
		   <cfelse>   
			<cfif isdefined("url.texaserror")><tr class="error" ><cfelse>			<tr></cfif>
              <td align="right">Buying from Texas? (<span class="error">*</span>):</td>
              <td align="right">We will pay Sales Tax on your behalf.
			   <input type="hidden"  name="texas" value="0"  onClick="javascript:texaschecked();"/>
			  
			  </td></tr>
 <tr> 
            <td  align='right'>Specify Shipping Region: </td>
            <td align="right"> 
              <cfselect name="nonUS" onclick="javascript:grandtotal(this.form)" required="yes" message="Please select Shipping to." >
<option value="0.00" >USA/Greenland: Add $0.00</option>
                <option value="1.00" >Canada: Add $1.00</option>
                <option value="2.00" >Europe/Australia (7 to 10 days): Add $2.00</option>
                <option value="10.00">Asia/Africa (7 to 15 days): Add $10.00</option>
              </cfselect> </td>
          </tr>
  		  <tr> 
            <td  align="right"> 
                Shipping Upgrade<b>(Only for USA): </b> 
		</td>
            <td  align="right"> <select name="SpecialHandling" onclick="javascript:grandtotal(this.form)">
                <option value="0.00" selected>USPS with tracking (3 to 6 days) + $0.00</option>
                <option value="3.00" >Priority Mail+delivery confirmation: + $3.00</option>
                <option value="12.00">Express Mail (Overnight/2nd day): + $12.00</option>
                <option value="29.00">Fedex (Overnight Most Places): + $29.00</option>
                <option value="39.00">Fedex (Overnight Remote Places): + $39.00</option>
              </select>
			<cfinclude template=vacation.inc> </td>
          </tr> 
		
		      <tr> 
            <td  align='right' nowrap><img src="/images/gift.gif" align="absmiddle" vspace="0" hspace="0" border="0"   height="22" style="display:inline;" />&nbsp;&nbsp;<font color="#000000">Gift Wrap</font>: 
            </td>
              <td align="right"  >
                 <select name="GiftWrap" onclick="javascript:grandtotal(this.form)">
                  <option value="0.00" selected>No Gift Bag</option>
                  <option value="1.00" >Red Velvet Gift Bag: $1.00</option>
                </select> </td>
          </tr>
		  <tr id="giftmsg">
            <td align="right">
              Message With Gift <span id="j"  style="text-decoration:underline" onClick="MM_showHideLayers('giftmessage','','show')">[?]</span>:</td>
            <td align="right" nowrap >
              <input type="text" name="giftmsg"  onClick="javascript:this.value='';return;"value="" size="50" maxlength="245" />
            </td>
          </tr>
<cfif len(session.mail)>
            <tr> 
              <td align="right"> 
                Purchase Credit <a href="viewinvitecredits.cfm" alt="friends invited for jewelry site">[?]</a></td>
              <td align="right">(You  can use upto 20% of current order value) <font color="#CC0000">
                <cfinvoke component="invitationandcredit" method="usecredit" returnvariable="newsubtotal" >
                  <cfinvokeargument name="amounttopay" value="#subtotal#">
                <cfinvokeargument name="saleitemamount" value="#saletotal#">
                  <cfinvokeargument name="finalize" value="#session.cartid#"> <!--- this is basically always 0 but comes into play in confirmation page --->
                </cfinvoke></font></td>
			</tr>
			<cfelse>
			         <!---   <tr> 
              <td  align="right" valign="middle" nowrap  ><font color="#000000">Affiliate/Discount 
                code</font>:</td>
              <td align="right" valign="middle"> 
                <input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18"> 
              </td>
            </tr>--->
			</cfif>
          </cfif>               <cfoutput>
		   <input type="hidden"  name="loyaltycredit" value="#decimalformat(evaluate(subtotal - newsubtotal))#">
		   	<cfset subtotal = newsubtotal />
            <input type="hidden"  name="subTotal" value="#decimalformat(subTotal)#"></cfoutput>

          <tr>
		   <tr> 
              <td  align="right" valign="middle" nowrap  ><font color="#000000">Affiliate/Discount 
                code</font>:</td>
              <td align="right" valign="middle"> 
                <input name="couponcode" type="text" class="inputtext" value="" size="12" maxlength="18"> 
              </td>
            </tr> 
            <td   align='right' valign="middle"><b><font color="#B00000">Grand 
              Total</font> :</b></td>
            <td align="right" valign="middle"><font size=1>(Including Shipping & Tax)</font> $ 
              <input class="inputtext" name="GrandTotal" type="text"  onFocus="javascript:alert('Sorry, this task is not allowed.');this.blur()" value="<cfoutput>#decimalformat(evaluate(subTotal + shipping))#</cfoutput>" size="6" maxlength="9"> 
			  <cfset session.grandtotal = grandtotal>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td align=right>Note to shippers: (optional)</td><td align='right'>  <input type="text" name="note" size=80 maxlength="245" /></td>
          </tr>
          <input type="hidden" name="j" value="<cfoutput>#evaluate(ArrayLen(session.cartitem) - emptyitems)#</cfoutput>">
          <tr bgcolor="#FFFFFF"> 
            <td  colspan="2" align='center'> 
<input name="button" type="button" size=20 class="greenbutton" onClick="javascript:goProcess('Proceed to Checkout')" value="Finalize/save cart and select secure payment option"> 
</td>
          </tr>
	  <tr><td colspan=2></td></tr>
	  <tr bgcolor="#FFFFFF"> <td colspan="2" align="center">
 <input name="button" type="button" class="greenbutton"  onClick="javascript:goProcess('Save Cart')" value='Save Cart for Later'> 
</td>
          </tr>
        <!--   <tr> 
            <td colspan="2"><ul>
                <li><strong>*</strong>: Discount will be applied when you finalize 
                  your cart at checkout but before payment.</li>
                <li><strong>#</strong>: Gift Certificate Amount and basic shipping 
                  will be reduced from your amount at checkout but before payment.</li>
              </ul></td>
          </tr>
         --></table>