<cfif session.mail is 'nitishpandey@indiatimes.com' >
  <link href="styles/npstyles11.css" rel="stylesheet" type="text/css" />
  <cfelse>
  <link href="styles/npstyles1.css" rel="stylesheet" type="text/css" />
</cfif>
<script language="JavaScript" src="/js/macromediafuncs.js" >
</script>
<cfinclude template="udfinclude.cfm" >
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<table border="0" cellpadding="0" cellspacing="0" width="1000">
  <!-- fwtable fwsrc="newheader.png" fwbase="newheader.cfm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
  <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
    <tr align=center>
      <td><table>
          <tr>
            <td><img src=/images/wholesale/wholesale-jewelry.jpg border=0 width="432" height="144"></td>
            <td><img src=/images/wholesale/wholesale-sterling-jewelry.jpg border=0 width="432" height="144"></td>
          </tr>
        </table>
        <br>
        <br>
        for Semiprecious.com</td>
    </tr>
    <cfelseif  cgi.server_name is "63.135.126.234">
    <tr>
      <td align=center><img src='http://www.aiyanainc.com/includes/templates/aiycust/images/aiyana.png'> </td>
      <td></td>
    </tr>
    <cfelse>
    <tr>
      <td height="103" align="left" valign="top" class="header_bg"><!--header starts-->
        <table width="100%" border="0" cellspacing="3" cellpadding="0" background='/images/header_bg.jpg'>
          <tr>
            <td width="231" valign="top"><a href="http://www.semiprecious.com"><img src="http://www.semiprecious.com/images/semiprecious_logo.jpg" width="231" height="93" border="0" /></a></td>
            <td align="center" cellpadding=3><font class="newuser_link" size=-1 > Gemstone jewelry, beads  and Gems from $5 to $200.  We ship world wide from Austin, TX. In business since 1996.</font></td>
            <td align=center><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_s-xclick">
                <input type="hidden" name="hosted_button_id" value="1488934">
                <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_giftCC_LG_global.gif" border="0" name="submit" alt="">
                <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
              </form></td>
            <td width="200" align="left" valign="bottom"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="bottom">
                  <td align="right"><a href=/cart.cfm><img src="http://www.semiprecious.com/images/add_to_cart_icon.jpg" border=0 align="absmiddle" width="26" height="25" /></a>Shopping Cart</td>
                </tr>
                <cfif not cgi.PATH_INFO contains "cart.cfm">
                  <tr>
                    <td align="right" id="headerqty"><cfset vQty = 0>
                      <cfloop index="vCount" from="1" to="#ArrayLen(session.cartitem)#">
                        <cfif session.cartitem[vCount][4] gt 0>
                          <cfset vQty = vQty + 1 >
                        </cfif>
                      </cfloop>
                      <cfoutput>There
                        <cfif vQty neq 1>
                          are
                          <cfelse>
                          is
                        </cfif>
                        #vQty# item
                        <cfif vQty neq 1>
                          s
                        </cfif>
                        in your cart.</cfoutput> </td>
                  </tr>
                </cfif>
                <tr valign="bottom">
                  <td align="right"><a href="/contactus.cfm" class="login_link">Contact us</a> |<a href="/simpleloginform.cfm" class="login_link">Login</a> | <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Order</a> <br>
                    <span class="newuser_link"><strong><a href=/apply.cfm> New User Signup (optional)</a></strong></span><strong></strong>
                    <!---a href="wholesale_login.cfm" class="login_link">WholeSale</a>---></td>
                </tr>
                <tr>
                  <td align="right">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>
        <!--header ends--></td>
    </tr>
  </cfif>
  <tr>
    <td colspan="4" align="center" valign="top" background="/images/bg2.gif"><a href="/" class="headerfont" id="gemstone-jewelry">Home</a> <span class="biggreen">|</span> <a href="/gem-stone-jewelry.cfm" class="headerfont" id="gemstone-jewelry">Jewelry</a> <span class="biggreen">|</span> <a href="/gem-stone-necklaces.cfm" class="headerfont" id="necklaces">Necklaces</a> <span class="biggreen">|</span> <a href="/gem-stone-earrings.cfm" class="headerfont" id="earrings">Earrings</a> <span class="biggreen">|</span> <a href="/gem-stone-pendants.cfm" class="headerfont" id="pendants">Pendants</a> <span class="biggreen">|</span> <a href="/gem-stone-bracelets.cfm" class="headerfont" id='bracelets'>Bracelets</a> <span class="biggreen">|</span> <a href="/gem-stone-rings.cfm"  class="headerfont" id='rings'>Rings</a> <span class="biggreen">|</span> <span class="biggreen">|</span> <a href="/brooches.cfm" class="headerfont" id="brouches">Brooches</a> <span class="biggreen">|</span> <a href="/designer_jewelry_angela.cfm" class="headerfont" id="designer">Designer</a> <span class="biggreen"> | <a href="/healing.cfm" class="headerfont" id="healing" title="healing and decorative items">Crystal Healing</a> |</span> <span class="biggreen"> <a href="/gem-stone-beads.cfm" class="headerfont" id="beads">Beads</a> | <a href="/gems.cfm" class="headerfont" id="brouches">Gems</a></span> <span class="biggreen">|</span> <a href="http://www.handmadelaptopcase.com" class="headerfont" id="laptop bags">Bags</a><span class="biggreen">|</span>
      <cfif cgi.server_name neq "63.135.126.234">
        <a href="/pettags.cfm" class="headerfont" id="4 Pets" title="Jewelry for Pets">Pets</a> <span class="biggreen">|</span>
      </cfif>
      <cfif cgi.server_name neq "63.135.126.234">
        <cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
          <span class="biggreen">|</span> <a href="http://www.semiprecious.com" class="headerfont" id="retail">Retail</a>
          <cfelse>
          <span class="biggreen">|</span> <a href="http://www.wholesale-gemstone-jewelry.com/wholesale_login.cfm" class="headerfont" id="wholesale">Wholesale</a>
        </cfif>
        <span class="biggreen">|</span> <a href="/simpleloginform.cfm" class="headerfont"  id="login">login</a> <span class="biggreen">|</span> </span> <span class="biggreen">|</span> <a href="/cart.cfm" class="headerfont"  id="CART"><b>CART</b></a> <span class="biggreen">|</span> </span>
      </cfif>
      <p> </td>
    <td>&nbsp;</td>
  </tr>
</table>
