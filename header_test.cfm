



    <table border="0" cellpadding="0" cellspacing="0" width="906px">
<!-- fwtable fwsrc="newheader.png" fwbase="newheader.cfm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
<cfif cgi.server_name contains "wholesale">
  <cfelse>
  <cfif cgi.server_name contains '127'>
  <cfelse>
    
 
  <!--- header.cfm has been made in line here --->
  	<tr>
    <td  align="left" valign="top" class="header_bg"><!--header starts-->
        <table width="906px" border="0" cellspacing="2" cellpadding="0" >
          <tr>
            <td width="280px">
	<a href=http://www.semiprecious.com><img src=/images/semipreciouslogo.jpg></a>		<!---
			<div align="left" >&nbsp;<a href="http://www.semiprecious.com" style="text-decoration:none;"><span style="text-transform:capitalize;font-family:tahoma;font-size:2em;Color:purple;"><span style="font-family:Gothic;font:Gothic;font-size:1.9em;">S</span>emi<span style="color:pink">precious</span>.com</span></a></div>
--->			<div align="right" style="padding-top:0px;padding-right:20px;font-size:1em;color:#555;" >
			Shipping Worldwide - Since 1997
			</div>
            	<!--- <img src="/images/semiprecious_logo.jpg" width="231" height="93" border="0" />--->
				</td>
      
<!--- 	        <td align="center" valign=center cellpadding=1>
<a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>
</td>--->

<td valign=bottom><a href='http://verify.authorize.net/anetseal/?pid=ef41378d-bba2-4e5a-8e8f-3a413a95f192&amp;rurl=http%3A//www.semiprecious.com/cart.cfm'>
<img src="/images/authsecure90x72.gif" height=52 width=64 border=0></a>
</td>
<td valign=bottom>
<a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
<img src="/images/verification_seal.gif" border="0" height=50 width=50 alt="Official PayPal Seal, Click to Verify">
</A>
<!-- End Official PayPal Seal -->
            <td align="center" valign=center cellpadding=1>
<!--- <a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>--->
<a href='http://www.bbb.org/central-texas/business-reviews/jewelry-designers/semipreciouscom-in-austin-tx-90026075'><img src='/images/bblogo.gif' border=0 height=75>
</a>
</td>
<!---
--->
<td align="center" width="120px"><div style="display:inline;margin-top:20px;"><font class="newuser_link" size=-1 >
				  <a href="#" class="login_link"   onouseOver='javascript:var d = document.getElementById("link").innerHTML; document.getElementById("chat").innerHTML = d;' >Live Help</a><br />Phone Orders<br /><cfoutput>#application.tollfree#<br />nos hablamos espanol!</cfoutput>
</font>
</div>
<!---<a href=/thanksgivingsale.cfm><img src=/images/cybermondaysale.jpg width=600 height=92 border=0></a>--->
</td><td align="right" width="450px">
<cfoutput><span style="margin-right:10px;">
<span class="side_link" style="margin-top:1px">#session.mail#</span>
</span></cfoutput>
               <div align="right" style="padding-right:30px;color:#89F"> 
			  <cfoutput> <a href="/#session.cart#?cartid=#session.cartid#" style="text-decoration:none;color:black;"></cfoutput><img src="/images/add_to_cart_icon.jpg" border=0 align="absmiddle" width="20px" height="20px" />&nbsp;
           
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
                 Cart&rarr;<cfoutput>Qty:<span style="font-weight:bold;color:red;"><span id="qty_in_cart">#vQty#</span></span>&nbsp;Value:<span style="font-weight:bold;color:red;"><span id="cart_value">#format(decimalformat(session.grandtotal))#</span></span></cfoutput>
             </span></a>
				</div>

<div align="right" style="margin-top:10px;">
               
			   <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Orders</a> | 
<cfif len(session.mail)>	<a href=/wish.cfm class="login_link">Wish List</a> | <a href="/login.cfm" class="login_link">My Account</a> |	<cfelse>	  <a href="/simpleloginform.cfm" class="login_link">Login</a> |  
			  <a href="/apply.cfm" class="login_link"   onMouseOver='javascript:var d = document.getElementById("sink").innerHTML; document.getElementById("auth").innerHTML = d;' > 
			  Signup</a> (optional) | </cfif> <!---a href="wholesale_login.cfm" class="login_link">WholeSale</a>--->
<a href="/contactus.cfm" class="login_link">Contact us</a></div></td>
          </tr>
        </table>
      <!--header ends--></td>
  </tr> 
   
<cfif cgi.https is "on" and cgi.path_info does not contain "cart" and cgi.path_info does not contain "confirmation.cfm" >
  <cflocation
url="http://#cgi.server_name##cgi.script_name#?#QUERY_STRING#" addtoken=yes>
</cfif>
   </cfif>
 <!---<tr border=1 bordercolordark="#006633" >
    <td width=309><a href=http://www.semiprecious.com><img src="http://www.semiprecious.com/images/header.gif" alt="Gemstone Banner" name="newheadercfm_r1_c1" width="309" height="57" border="0" /></a></td>
	<td align=center bgcolor="white">Regular mail (flat rate $3.99): Order today and receive between <font color=green><cfoutput>#dateformat(dateadd('d',4,now()),"dddd")# and #dateformat(dateadd('d',7,now()),"dddd")#</cfoutput></font> <br>Shipping world wide -
Australia, U.K., Ireland and more!</td><td>
</td>

  </tr>  ---> 
    </cfif>
  <tr> 
    <td  align="left" valign="top"><a name="jewelry_top"></a><div style="height:21px"> <!--- this is required because the topmenu is
	a computed stuff and has it's display none on construction. This confuses Mozilla to ignore it's existcence --->
<cfif cgi.server_name contains "wholesale">
<cfinclude template ='/wholesale-jewellery/wholesalemenu.html'>
<cfelse>
<cfinclude template ='/topmenu.cfm'>
</cfif>
</div>
</td> 

  </tr>
 
</table>

<!---
// Build panel1 based on markup
YAHOO.example.container.floatingsignup = new YAHOO.widget.Panel("floatingsignup", { xy:[150,100], 
																	visible:false, 
																	width:"300px"
																  } );
YAHOO.example.container.floatingsignup.render();
YAHOO.example.container.manager = new YAHOO.widget.OverlayManager();
YAHOO.example.container.manager.register([YAHOO.example.container.floatingsignup]);


<div id="floatingsignup" style="visibility:hidden">
	

<table bordercolor="#663300" border="2" bgcolor="#ffffff">
              <tbody><tr> 
                    <td width="392"> <span class="error1"> Subscribers get the following</span> 
                      <ul>
                        <li>You Get $5 in<span class="greenbutton"> 
                           your shopping account <em>for signing 
                          up to recieve our monthly emails</em></span><em></em><span style="background-color: white;">. 
                          </span></li>
                        <li> 20% of purchases (beads, designer items not included)
                          as credit for next purchase</li>
                        <li><strong>Invit<span style="background-color: white;">e 
                          your friends to </span> get additional $10.00 credit 
                          </strong> and use it to get discount for the very first 
                          purchase</li>
                        <li>From Invited friends <span style="background-color: white;">you 
                          also </span>get 7.5 % of every purchase made by your 
                          friend as credit to you</li>
                        <li>The monthly email will announce items on <b>sale</b> 
                          and a list of <b>new items</b>.</li>
                        <li>And other privileges including personalised attention 
                          via mail, phone, wish list, etc.</li>
                      </ul>
                  <p><strong>Privacy Statement:</strong><span class="title"> Your 
                    email address will not be sold or given to anyone.  It will only 
                    to be used to record your credits and purchases for internal 
                    use. Your phone number will only be used if your email fails 
                    since you may have changed your email address.</span></p>
                  <p>To unsubscribe you can send an email to anup@semiprecious.com 
                    with subject 'unsubscribe' or visit <a href="http://www.semiprecious.com/unsubscribe.cfm">http://www.semiprecious.com/unsubscribe.cfm</a></p></td>
              </tr>
            </tbody></table> --->
			<div id="auth" style="z-index: 3; position: absolute; left: 280px; top: 150px;padding:0px;background-color:#FFF"></div>

									   <span id="sink" style="display:none;">	 <div style="padding:4px;border:ridge 2px #456;width:420px;" width="400px" align="left"><span onMouseOver="javascript:document.getElementById('auth').innerHTML = '';" style="display:inline;float:left;color:maroon"><a href=''>[X]</a></span>&nbsp; &nbsp;&nbsp;<span class='error1'> Sign up and get the following benefits:</span> <span onClick="javascript:document.getElementById('auth').innerHTML = '';" style="display:inline;float:right;color:maroon"><a href=''>[X]</a></span>	                       <ul style='margin-top:2px;padding-top:1px;'>     <li>Get $5 right away in your discount account. </li> <li> 20% of purchase value (beads, designer items not included) as credit for next purchase</li>    <li><strong>Invite  your friends  to get <span style='background-color: white'> additional $10.00 credit </span> 
					        </strong> for discount on  your very first purchase</li> 
							  <li>When your  friends shop you  also get <span style='background-color: white'>7.5 % of every purchase</span> made by them as credit</li>                      <li>The monthly email will announce items on <b>sale</b> 
								  
					                          and a list of <b>new items</b>.</li>   
											  <li>Get a wish list feature to track items that you liked but were not available or wanted to purchase later</li>
											                  <li>We maintain strict email privacy and do not spam</li> </ul>
					
					<a href="/apply.cfm" class="login_link">Sign up</a>&nbsp; <span onMouseOver="javascript:document.getElementById('auth').innerHTML = '';" style="display:inline;float:right;color:maroon"><a href=''>[X]</a></span>	</div>				 

</span>
