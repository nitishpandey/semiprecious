

    <table border="0" cellpadding="0" cellspacing="0" width="930px">
  <!--- header.cfm has been made in line here --->
  	<tr>
    <td  align="left" valign="top" class="header_bg"><!--header starts-->
        <table width="928px" border="0" cellspacing="2" cellpadding="0" >
          <tr>
            <td width="200px">
	<a href=http://www.semiprecious.com><img src=/images/semipreciouslogo.jpg width=200></a>		<!---
			<div align="left" >&nbsp;<a href="http://www.semiprecious.com" style="text-decoration:none;"><span style="text-transform:capitalize;font-family:tahoma;font-size:2em;Color:purple;"><span style="font-family:Gothic;font:Gothic;font-size:1.9em;">S</span>emi<span style="color:pink">precious</span>.com</span></a>
			</div>
--->		
            	<!--- <img src="/images/semiprecious_logo.jpg" width="231" height="93" border="0" />--->
				</td>
<!--- 	        <td align="center" valign=center cellpadding=1>
<a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>
</td>--->

<td valign=bottom>
 <a href='http://verify.authorize.net/anetseal/?pid=ef41378d-bba2-4e5a-8e8f-3a413a95f192&amp;rurl=http%3A//www.semiprecious.com/cart.cfm'>
    <img src="/images/authsecure90x72.gif" height=52 width=64 border=0 />
</a>
</td>
<td valign=bottom>
<a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
    <img src="/images/verification_seal.gif" border="0" height=50 width=50 alt="Official PayPal Seal, Click to Verify" />
</A>
<!-- End Official PayPal Seal -->
     <td align="center" valign=center cellpadding=1>
<!--- <a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>--->
       <a href='http://www.bbb.org/central-texas/business-reviews/jewelry-designers/semipreciouscom-in-austin-tx-90026075'><img src='/images/bblogo.gif' border="0" height="60" />
</a>
</td>
<td align=center width=200>We Ship Worldwide<br>US/UK/AUSTRALIA/GERMANY and more<br>
</td>
<!---
--->
<td align="center" width="10px">
	<!-- <div style="display:inline;margin-top:20px;">
	<font class="newuser_link" size=-2 >
		<br /><cfoutput>#application.tollfree#</cfoutput><br>
		9AM - 5PM CST Mon-Fri
</font>
</div> -->
<!---<a href=/thanksgivingsale.cfm><img src=/images/cybermondaysale.jpg width=600 height=92 border=0></a>--->
</td><td align="right" width="560px">
                
              <cfoutput>  <div align="right" style="margin-top:8px;padding-right:2px;color:##89F">#session.mail#</cfoutput> 
			<cfif not cgi.PATH_INFO contains "cart.cfm"><img src="/images/dots1.gif" style="display:inline;" /> 
			  <cfoutput><a title="Check Cart and start checkout"  href="/#session.cart#?country=#ucase(session.address.country_code)#&amp;php=1.2210&amp;cartid=#session.cartid#" style="text-decoration:none;color:black;"></cfoutput><img src="/images/add_to_cart_icon.jpg" border=0 align="absmiddle" width="20px" height="20px" alt="start checkout" />&nbsp;
			  <span align="right" id="headerqty">
                  <cfset vQty = 0>
				  <cftry>
                  <cfif session.cartitem[1][1]>
                  <cfloop index="vCount" from="1" to="#ArrayLen(session.cartitem)#">
                     <cfset vQty = vQty + session.cartitem[vCount][4] >
                   </cfloop>
				   </cfif>
				   <cfcatch type="any">
				   </cfcatch>
				   </cftry>
                 Cart&rarr;<cfoutput>Qty:<span style="font-weight:bold;color:red;">
				<span id="qty_in_cart">#vQty#</span></span>&nbsp;Amount:<span style="font-weight:bold;color:red;"><span id="cart_value">#format(decimalformat(session.grandtotal))#</span></span></cfoutput>
             </span></a>
				
                </cfif>
</div>
				<div align="right" style="margin-top:7px;">
				            
							   <cfif len(session.mail)>	
								   <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track</a> | 
									
										<a href=/wish.cfm class="login_link">Wish List</a> | <a href="/login.cfm" class="login_link">My Account</a> |  <a href="/logout.cfm" class="login_link">Logout</a> |<cfelse>
										<a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Your Order</a> |	<a href="/simpleloginform.cfm" class="login_link">Login</a> |  
							  <a href="/apply.cfm" class="login_link" > 
							  Signup</a> <img src="/images/que.gif" onClick='javascript:var d = document.getElementById("sink").innerHTML; document.getElementById("auth").innerHTML = d;'  /> | </cfif> <!---a href="wholesale_login.cfm" class="login_link">WholeSale</a>--->
				<a href="/contactus.cfm" class="login_link">Contact us</a>
				</div>
</td>
          </tr>
        </table>
      <!--header ends--></td>
  </tr> 
   
<cfif cgi.https is "on" and cgi.path_info does not contain "cart" and cgi.path_info does not contain "confirmation.cfm" >
  <cflocation
url="http://#cgi.server_name##cgi.script_name#?#QUERY_STRING#" addtoken=yes>
</cfif>
 <!---<tr border=1 bordercolordark="#006633" >
    <td width=309><a href=http://www.semiprecious.com><img src="http://www.semiprecious.com/images/header.gif" alt="Gemstone Banner" name="newheadercfm_r1_c1" width="309" height="57" border="0" /></a></td>
	<td align=center bgcolor="white">Regular mail (flat rate $3.99): Order today and receive between <font color=green><cfoutput>#dateformat(dateadd('d',4,now()),"dddd")# and #dateformat(dateadd('d',7,now()),"dddd")#</cfoutput></font> <br>Shipping world wide -
Australia, U.K., Ireland and more!</td><td>
</td>

  </tr>  ---> 
  <tr> 
    <td  align="left" valign="top"><a name="jewelry_to"></a>
	<div style="height:21px"> <!--- this is required because the topmenu is
	a computed stuff and has it's display none on construction. This confuses Mozilla to ignore it's existcence --->
</div>
</td> 

  </tr>
 
</table>

<cfdump var="#session#" />