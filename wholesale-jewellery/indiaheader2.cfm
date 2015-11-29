<table border="0" cellpadding="5" cellspacing="0" style="display:table" width="928px">
<tr> 
    <td height="103" align="left" valign="top" class="header_bg"><!--header starts-->
        <table width="100%" border="0" cellspacing="3" cellpadding="0">
          <tr>
                  <td width="50px"><cfoutput>
	<a href="http://www.semipreciouswholesale.com"><img src="https://www.semipreciouswholesale.com/images/logos/logostone.jpg" width=40 height="60"></a></td><td align=left>
	<br>SEMIPRECIOUS<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WHOLESALE.COM<br>		</cfoutput>
			</td>
            <td align="center" cellpadding=2><span class="side_link" >Ultra Chic Authentic Semiprecious Jewelry First Time in India.   We ship world wide, now shipping within India too. In business since 1996.<br>
            </td>
                      <!--- <td align="center" valign=center cellpadding=1>
<!--- <a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>--->
<a href='http://www.bbb.org/central-texas/business-reviews/jewelry-designers/semipreciouscom-in-austin-tx-90026075'><img src='/images/bblogo.gif' border=0 height=75></a>
</td><td>
</td>

<!---<td><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script></td>--->
<td><font class="newuser_link" size=-1 >
Shipping worldwide since 1998</font><br />
<cfoutput>+1-#application.tollfree#</cfoutput><b>&nbsp; 24/7</b>
</td>
            <td align=center>&nbsp;

</td> --->
			<td width="240px" align="left" valign="bottom"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="bottom"><cfoutput>
                  <td style="width:238px;" align="right" class="#left(session.mail,5)#">#session.mail#<br></td></cfoutput>
				  
                 
                </tr>
                <cfif not cgi.PATH_INFO contains "cart.cfm">
                <tr><td align="right" id="headerqty"><b><font color=purple>SHOPPING CART</font></b> <div align="right" style="padding-right:4px;color:#89F"> 
<span align="right" id="headerqty">
			    <cfset header_cartid_url = "">
			      <cfset vQty = 0>
				  <cftry>
		                  <cfif session.cartitem[1][1] >
						    <cfset header_cartid_url = "cartid=#session.cartid#">
			                  <cfloop index="vCount" from="1" to="#ArrayLen(session.cartitem)#">
		                     <cfset vQty = vQty + session.cartitem[vCount][4] >
		                   </cfloop>
		                   </cfif>
				   <cfcatch type="any">
				   </cfcatch>
				   </cftry>   <cfoutput><a title="Check cart and start checkout" href="/#session.cart#?country=#ucase(session.address.country_code)#&amp;php=4.2210&amp;#header_cartid_url#" style="text-decoration:none;color:black;"></cfoutput>
			   <img src="/images/add_to_cart_icon.jpg" border=0 align="absmiddle" width="30px" />
          
              &rarr;<cfoutput>Items:<span style="font-weight:bold;color:red;"><span id="qty_in_cart">#vQty#</span></span>&nbsp;Amount:<span style="font-weight:bold;color:red;"><span id="cart_value">#format(session.grandtotal)#</span></span></cfoutput>
             </span></a>
				</div></td></tr>
        
		        </cfif>
                <tr valign="bottom">
                  <td align="right"> <a href="/contactus.cfm" class="login_link">Contact us</a> | <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Order</a> <br><span class="newuser_link"><strong>
				  
				  <cfif session.bulkbuyer.id is "" or (session.bulkbuyer.id contains 'guest')>
				  <a href="/whole_login.cfm" class="side_link">Login</a> | <a href=/wholesale_register.cfm?silver_jewelry=avail class=side_link>Register To Login</a></strong></span>
				  <cfelse>
				  <a href="/whole_login.cfm" class="side_link">My Account Page</a> | <a href="/logout.cfm" class="side_link">Log out</a> 
				  </cfif>
				  </td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
        </table>
      <!--header ends--></td>
  </tr>
 </table>   