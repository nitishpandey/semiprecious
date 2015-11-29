<cfif cgi.server_name contains "wholesale" or cgi.path_info contains "wholesale" or session.bulkbuyer.id contains "@">
  <script type="text/javascript" src="wholesalemenu.files/dmenu.js">
   </script>
   <cfif session.bulkbuyer.id does not contain "@">
   	<cfset  session.bulkbuyer.id = "#application.cartid#@templogin.com">
   		 <cfset session.mail = session.bulkbuyer.id>
   </cfif>
 </cfif>
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
<script language="JavaScript" type="text/javascript">
<!-- Copyright 2003, Sandeep Gangadharan -->
<!-- For more free scripts go to http://www.sivamdesign.com/scripts/ -->
<!--
(document.getElementById) ? dom = true : dom = false;

function hideIt() {
  if (dom) {document.getElementById('layer1').style.visibility='hidden';}
  if (document.layers) {document.layers["layer1"].visibility='hide';}
  }

function showIt() {
 if (dom) {
  if (document.getElementById('layer1').style.visibility=='visible') { hideIt(); }
  else {document.getElementById('layer1').style.visibility='visible'} }

 if (document.layers) {
  if (document.layers["layer1"].visibility=='show') { hideIt(); }
  else {document.layers["layer1"].visibility='show'} }

 window.setTimeout("hideIt();", 10000)   // change the # 5000 at the left to change the time it takes for the
                                        // links to close. 5000 means 5 seconds
}
// -->
</script>

<table border="0" cellpadding="0" cellspacing="0" width="906px">
<!-- fwtable fwsrc="newheader.png" fwbase="newheader.cfm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
<cfif cgi.server_name contains "wholesale">
<cfinclude template="/wholesale-jewellery/header2.cfm">
  <cfelse>
  <cfif cgi.server_name contains '127'>
  <cfinclude template="/semiprecious/header2.cfm">
  <cfelse>
    
 
  <!--- header.cfm has been made in line here --->
  	<tr>
    <td  align="left" valign="top" class="header_bg"><!--header starts-->
        <table width="906px" border="0" cellspacing="3" cellpadding="0" background='/images/header_bg.jpg'>
          <tr>
            <td width="280px"><div align="left" >&nbsp;<a href="http://www.semiprecious.com" style="text-decoration:none;"><span style="text-transform:capitalize;font-family:tahoma;font-size:2em;Color:black;"><span style="font-family:Gothic;font:Gothic;font-size:1.9em;">S</span>emi<span style="color:orange">precious</span>.com</span></div>
			<div align="right" style="padding-top:0px;padding-right:40px;font-size:1em;color:#555;" >
			Established 1998
			</div>
            	<!--- <img src="/images/semiprecious_logo.jpg" width="231" height="93" border="0" />--->
				</a></td>
      
<!--- 	        <td align="center" valign=center cellpadding=1>
<a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>
</td>--->

<td valign=bottom><a href='http://verify.authorize.net/anetseal/?pid=ef41378d-bba2-4e5a-8e8f-3a413a95f192&rurl=http%3A//www.semiprecious.com/cart.cfm'>
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
</td>
</td>
<!---
--->
<td align="center" width="120px"><div style="display:inline;margin-top:20px;"><font class="newuser_link" size=-1 ><b>Live Help<br>Phone Orders</b><br /><cfoutput>#application.tollfree#</td><td>nos hablamos espanol!</cfoutput>
</font>
</div><div style="display:inline;" align="center">
<!---<a href=/thanksgivingsale.cfm><img src=/images/cybermondaysale.jpg width=600 height=92 border=0></a>--->
</td><td align="right" width="450px">
<cfoutput><span style="color:##345;margin-right:10px;"><cfif session.bulkbuyer.id contains '@'>Wholesale Mode ON<br></cfif>#session.mail#</span></cfoutput>
                <cfif not cgi.PATH_INFO contains "cart.cfm">
              <div align="right" style="padding-right:30px;color:#89F"> <a href="http://www.semiprecious.com/cart.cfm" style="text-decoration:none;color:black;"><img src="/images/add_to_cart_icon.jpg" border=0 align="absmiddle" width="26" height="25" />&nbsp;

                
<span align="right" id="headerqty">
                  <cfset vQty = 0>
                  <cfloop index="vCount" from="1" to="#ArrayLen(session.cartitem)#">
                  <cfif session.cartitem[vCount][4] gt 0>
                     <cfset vQty = vQty + 1 >
                   </cfif>
                   </cfloop>
                 Items In Your Shopping Cart:&nbsp;<cfoutput><span style="font-weight:bold;color:red;">#vQty#</span></cfoutput>
             </span></a>
				</div>
                </cfif>

</div>
<div align="right" style="margin-top:10px;">
              <a href="/simpleloginform.cfm" class="login_link">Login</a> |  <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Orders</a> | 
			  <span class="newuser_link"><a href=/wish.cfm>Wish List</a> | 
			  <a href="/apply.cfm"   onMouseOver='javascript:var d = document.getElementById("sink").innerHTML; document.getElementById("auth").innerHTML = d;' > 
			  Signup (optional)</a></span> | <!---a href="wholesale_login.cfm" class="login_link">WholeSale</a>--->
<a href="/contactus.cfm" class="login_link">Contact us</a></div></td>
          </tr>
        </table>
      <!--header ends--></td>
  </tr> 
  <div id="auth" style="z-index: 3; position: absolute; left: 200px; top: 100px;background-color:#EEE"></div>
   <span id="sink" style="display:none;">	  <span class='error1'> Signing up gets you the following benefits:</span>                       <ul style='margin-top:2px;padding-top:1px;'>     <li>Get $5 right away in your shopping account for signing  up <span style='background-color: white'>. </span></li> <li> 20% of purchases (beads, designer items not included) as credit for next purchase</li>    <li><strong>Invite  your friends  to get <span style='background-color: white'> additional $10.00 credit </span> 
        </strong> for discount on  your very first purchase</li> 
		  <li>When your  friends shop you  also get <span style='background-color: white'>7.5 % of every purchase</span> made by them as credit</li>                      <li>The monthly email will announce items on <b>sale</b> 
			  
                          and a list of <b>new items</b>.</li>                   <li>We maintain email privacy and do not spam</li> </ul>
						 <span onMouseOver="javascript:document.getElementById('auth').innerHTML = '';" style="display:inline;float:right;color:gray">[X]</span> </span>
						 
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
<!---<td>

</td>--->
  </tr>  ---> 
    </cfif>
  <tr> 
    <td  align="left" valign="top"><a name="jewelry_top"><div style="height:20px"> <!--- this is required because the topmenu is
	a computed stuff and has it's display none on construction. This confuses Mozilla to ignore it's existcence --->
<cfif cgi.server_name contains "wholesale">
<cfinclude template ='/wholesale-jewellery/wholesalemenu.html'>
<cfelse>
<cfinclude template ='topmenu.cfm'>
</cfif>
</div></a>
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