<cfif cgi.script_name does not contain "itemsell.cfm" and cgi.script_name does not contain "cart.cfm" and cgi.script_name does not contain "admin.cfm">
<cfheader statuscode='301' statustext='Moved permanently'>
<cfheader name='Location' value="http://www.semiprecious.com/wholesale/">
<cfabort>
</cfif>
<style type="text/css">
	.searchBoxWholesale {position:absolute; top:35px; left:570px;width:200px}
	.searchW-input {background:url(images/search-input.png) no-repeat; width:114px; height:33px; border:none; font-size:11px;padding:8px 10px;}
	.searchW-btn {background:url(images/search-btn.png) no-repeat; width:27px; height:27px; border:none; cursor:pointer;}
</style>
<table border="0" cellpadding="5" cellspacing="0" style="display:table" width="928px">
<tr> 
    <td height="103" align="left" valign="top" class="header_bg"><!--header starts-->
        <table width="100%" border="0" cellspacing="3" cellpadding="0">
          <tr>
                  <td width="50px"><cfoutput>
	<a href="http://www.semipreciouswholesale.com"><img src="https://www.semipreciouswholesale.com/images/logos/logostone.jpg" width=40 height="60"></a></td><td align=left>
	<br>SEMIPRECIOUS<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WHOLESALE.COM<br>		</td></cfoutput>
			
                      <td align="right" valign=center cellpadding=1 width="180px">
<!--- <a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>--->
<a href='http://www.bbb.org/central-texas/business-reviews/jewelry-designers/semipreciouscom-in-austin-tx-90026075'><img src='/images/bblogo.gif' border=0 height=75></a>
</td><td>
</td>

<!---<td><span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=hF33DTtyM65nCwzDN0SwqGGgTQPxn3o4Ym0uzkuDY7OQkc0HNahexOlJ"></script></td>--->
<td width="300px" align="right"><font class="newuser_link" size=-1 >

Shipping worldwide since 1998</font><br />
<cfoutput>+1-#application.tollfree#</cfoutput><b>&nbsp; 24/7</b>

</td>
            <td align="right" width="300px">
                <div style="margin-right:45px">
                Search/Item ID<br>
                </div>
                <form method="post" action="/silver_jewelry_gallery.cfm">
                        <input type="text" value="" class="searchW-input" name="search_criteria"/>
                        <input type="submit" value="&nbsp;" class="searchW-btn" name="submit" />
                </form>
			</td>
			<td width="300px" align="right" valign="bottom"><table width="99%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="bottom"><cfoutput>
                  <td style="width:390px;" align="right" class="#left(session.mail,5)#">#session.mail#<br></td></cfoutput>
				  
                 
                </tr>
                <cfif not cgi.script_name contains "cart.cfm">
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
				  <a href="/whole_login.cfm" >My Account Page</a> | <a href="/logout.cfm" >Log out</a> 
				  </cfif>
				  </td>
                </tr>
                
            </table></td>
          </tr>
          
        </table>
      <!--header ends--></td>
  </tr>
  <tr >
            <td>
    			<cfinclude template ='/wholesale-jewellery/wholesalemenu.html'>
            </td>
        </tr>
  
    </table>