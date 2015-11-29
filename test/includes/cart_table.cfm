<!--- called from cart.cfm page. besides creating a tabular output this page also totals up the qty and items value --->
<cfsavecontent variable="session.cart_table">
<div  width="750px" style="width:740px;text-align:center;margin-top:10px;">
<div align="center" style="background:none repeat scroll 0 0 #EFEFEE;
color:#797;width:95%;
font-family:serif;
font-size:1.8em;">
ITEMS REVIEW FOR CART ID: <font color=blue><cfoutput>#session.cartid#</cfoutput></font></div>
</div>
<TABLE bordercolor="#FFF" style="border:1px #fff solid;width:750px;" cellspacing="0" align="center"  >
<tr class="grayplacard" >

  <TH width="34%" colspan=2>Jewelry Items</TH  >

  <TH width="15%">Price</TH>
  <TH width="25%">Quantity</TH>
  <TH width="12%">Amount</TH>
    <TH width="20%" align="center">

   Remove <a href="/cartcontrol/cartmonitor.cfc?method=emptycart" onClick="javascript:return confirm('All items will be removed from the cart!');"><font color="#FF0000">All</font></a></TH>
<TH width="18%" >We Suggest <img src="/images/que.gif" onClick="MM_showHideLayers('look_set_hint','','show')" />  </TH  ></tr>
   <CFLOOP  INDEX="j"  to="1" from="#ArrayLen(session.cartitem)#" step="-1" >
      <cfset valueadd =0>
             <CFQUERY NAME="qprice" DATASOURCE="gemssql">
	            SELECT newitem, cat, storage, subcat+ ' ' + cat as description,clustercount,status,storage,thumblink FROM Items WHERE   newitem = #session.cartitem[j][1]# 
                </CFQUERY>
        <cfif  isdefined("text")>
          <cfset text = text & ','  & session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
          <cfelse>
          <cfset text = session.cartitem[j][1] & ":" & session.cartitem[j][4] & ":" & session.cartitem[j][5]>
        </cfif>
        
         <cfoutput>
		 <tr  >
            <td class=""><img src=images/#qprice.cat#/thumb/#qprice.newitem#.jpg border=0 width=80></td>
			<TD   align='left'  ><span  class="listdescr"><b>Design ID:#session.cartitem[j][1]#</b><br />
              <cfif qprice.storage contains "IN-">
			  	<cfset expedited_possible = 0 />
               <cfelse>
                
                <b><font color=green>Quick Ship Possible</font></b><br />
              </cfif>
           
              #qprice.description#
              <cfif session.cartitem[j][5]>
                <cfquery datasource="gemssql" name="opts">
      		select description,  valueadd from options where itemid = #session.cartitem[j][1]# and optionid = #session.cartitem[j][5]#
				</cfquery>
               <cfif isnumeric(opts.valueadd)>
                   <cfif session.bulkbuyer.id NEQ "">
                    <cfset valueadd = opts.valueadd/2 >
                 
                  <!---- volumediscount is given on 3 or more items. this 2.5 % for wholesale and  5 for others. this is mentioned in the login pages so if you change take note of this --->
                  <cfelse>
                    <cfset valueadd = opts.valueadd>
                  </cfif>
                </cfif>
                <span class="optionsinline">[#opts.description#]</span>
              </cfif>
              </span>
              <input type="hidden" name="itemnumber#j#" value="#session.cartitem[j][1]#">
            </TD>
			
            
	        <input type="hidden" name="category#j#" value="#session.cartitem[j][2]#" />
            <input type="hidden" name="quantity#j#" value="#session.cartitem[j][4]#" />
          	              <td  class="rowb" align="center" >
          	    
                <cfset valuewithoption=session.cartitem[j][3]*1 + valueadd*1 />
              
              <cfset amounts=evaluate(valuewithoption*session.cartitem[j][4]) />
 <cfif qprice.status is 3 >
                <cfset saletotal = saletotal + amounts />
                <span class="saleprice" > #format(valuewithoption)# </span>
                <cfelse>
                <span class="price" >  #format(valuewithoption)# </span>
              </cfif>
             
              <input type="hidden" name="price#j#" Value="#DecimalFormat(valuewithoption)#" />
            </td>
            <td  class="rowb" align="center">  
			<span id="added_#session.cartitem[j][1]#_#session.cartitem[j][5]#">#session.cartitem[j][4]#&nbsp;&nbsp;&nbsp;&nbsp;
			<font size="2">
			<a href='jewelry_item.cfm?itemnumber=#session.cartitem[j][1]#&editcart=#j#&existqty=#session.cartitem[j][4]#&optionid=#session.cartitem[j][5]#'>Edit Qty</a>
			</font>
			</span>
			</td>
            <td  class="rowb">#format(amounts)#
              <input type="hidden" name="amount#j#" Value="#amounts#" />
            </td>
            <td  class="rowb">
            <cfif not isdefined("url.country")>
			
   <a href='cart.cfm?newQty=0&newitem=#j#&optionid=#arraylen(session.cartitem)#' ><font color="##CC0000">Remove</font></a>
   </cfif>
			</td>
			<td  class="rowb" align="center" >
					<cfswitch expression="#qprice.clustercount#">
					<cfcase value="1">
					<span class="lookinline">
					<a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look" >&nbsp;=&nbsp;</a></span>
					</cfcase>
					<cfcase value="2"><span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set">&nbsp;+&nbsp;</a></span></cfcase>
					<cfcase value="3"><span class="lookinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=look">&nbsp;=&nbsp;</a></span><hr />

<span class="setinline"><a href="gemstone.cfm?itemid=#session.cartitem[j][1]#&type=set" >&nbsp;+&nbsp;</a></span>
</cfcase><cfdefaultcase >&nbsp;</cfdefaultcase></cfswitch>
					</td>

			</tr>
          </cfoutput> 
      	      <cfset subTotal= amounts + subTotal>
	   		  <cfset TotalQty=session.cartitem[j][4]+TotalQty>
    
    </CFLOOP>
	<cfset Session.GrandTotal= subTotal>
   <cfset session.totalqty = Variables.totalqty />

</table>
</cfsavecontent>
