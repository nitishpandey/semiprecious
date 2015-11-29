<cfparam name='mobile' default='no'> <script type="text/javascript" src="/js/dmenu.js">   </script> 
<cftry>
	<cfif session.cartitem[1][1]><!--- cart has stuff, make sure it is put in the db with current cart id (could be returning from confirm page and hence got a new cart id ) --->
		<cfif session.cartid is 0 >
        				<cfinvoke component="cartcontrol.cartmonitor" method="new_cartid" />
		</cfif>
    	<cfquery datasource="gemssql" >
	    	update cartstatus set	shippingdetails = '#left(cgi.SCRIPT_NAME  & cgi.QUERY_STRING,20)#' where cartid = #session.cartid#
		</cfquery>
     </cfif>
			<cfcatch type="any">
			<cfmail to="nitish@semiprecious.com" from="cs@semiprecious.com" subject="header.cfm not reverse "  type="html">
  					#cfcatch.detail#, #cfcatch.message# #cgi.script_name#
  				</cfmail>
		</cfcatch> 
</cftry>
 
<script language="JavaScript" type="text/javascript">
	 
	
<!-- //Copyright 2003, Sandeep Gangadharan 

function flipDisplay_(pId)
{
    vDiv = document.getElementById(pId);
	if (vDiv.style.display == "none" || vDiv.style.display == "" )
	    {  vDiv.style.display = "inline";  }
	else
		{  vDiv.style.display = "none";  }
}


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
<!---<h2><font color=red>SITE FEATURE UPGRADE ON, SITE MAY NOT WORK PLEASE COME BACK 10 MIN LATER</font></h2>--->

    <table border="0" cellpadding="5" cellspacing="0" style="display:table" width="928px">
<cfif cgi.server_name contains "wholesale">
<cfinclude template="/wholesale-jewellery/header2.cfm">
  <cfelse>
  <cfif cgi.server_name contains '127'>
    <cfinclude template="/semiprecious/header2.cfm">
  <cfelse>
  <!--- header.cfm has been made in line here --->
  	<tr>
    <td  align="center" valign="top" class="header_bg"><!--header starts-->
        <table width="926px" border="0" cellspacing="0"  style="display:table" cellpadding="0" >
          <tr>
            <td width="50px"><cfoutput>
	<a href="http://www.semiprecious.com"><img src="https://#session.tld#/images/logos/logostone.jpg" width=40 height="60" ALT="semiprecious brand logo"></a></td><td align=left>
	<a href="http://www.semiprecious.com"><img src="https://#session.tld#/images/logos/logotext.jpg"  alt="semiprecious gemstone jewelry"></a><br><i>Over 5000 Designs!</i>		</cfoutput>
	<!---
			<div align="left" >&nbsp;<a href="http://www.semiprecious.com" style="text-decoration:none;"><span style="text-transform:capitalize;font-family:tahoma;font-size:2em;Color:purple;"><span style="font-family:Gothic;font:Gothic;font-size:1.9em;">S</span>emi<span style="color:pink">precious</span>.com</span></a>
			</div>
--->		
            	<!--- <img src="/images/semiprecious_logo.jpg" width="231" height="93" border="0" />--->
				</td>
<!--- 	        <td align="center" valign=center cellpadding=1>
<a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>
</td>--->
	   <cfoutput>



<td align="center" width="200px"><b>Worldwide from USA</b><br>
<cfoutput><a href=/contactus.cfm><img src=/images/contactus.jpg></a><br>#application.tollfree#</cfoutput>
</td>
<td valign=bottom>
<!---  <a href='https://verify.authorize.net/anetseal/?pid=ef41378d-bba2-4e5a-8e8f-3a413a95f192&amp;rurl=http%3A//www.semiprecious.com/cart.cfm'>
    <img src="https://www.semiprecious.com/images/authsecure90x72.gif" height=52 width=64 border=0 /></a>
		--->
		<!---#session.tld#--->
<!-- Place this tag where you want the +1 button to render -->

<!---
<a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
    <img src="https://www.semiprecious.com/images/verification_seal.gif" border="0" height=50 width=50 alt="Official PayPal Seal, Click to Verify" />
</A>---></td>
<!-- End Official PayPal Seal -->
     <td align="right" cellpadding=10 valign="middle">
<!--- <a href=/thanksgivingsale.cfm><img src=/images/thanksgivingsale.jpg width=400></a>--->
</cfoutput>


<!---

<td align="center" width="1px">
	<!-- <div style="display:inline;margin-top:20px;">
	<font class="newuser_link" size=-2 >
		<br />
</font>
</div> --
---<a href=/thanksgivingsale.cfm><img src=/images/cybermondaysale.jpg width=600 height=92 border=0></a>---
</td>
--->		

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="https://www.mcafeesecure.com/RatingVerify?ref=www.semiprecious.com"><img width="94" height="54" border="0" src="//images.scanalert.com/meter/www.semiprecious.com/23.gif" alt="McAfee SECURE sites help keep you safe from identity theft, credit card fraud, spyware, spam, viruses and online scams" /></a>
<!-- END SCANALERT CODE -->
</td>
		<td>
		    <a href='http://www.bbb.org/central-texas/business-reviews/jewelry-designers/semipreciouscom-in-austin-tx-90026075'>
<img src='https://www.semiprecious.com/images/bblogo.gif' border="0" height="60" /></a>
<!---<a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
    <img src="https://www.semiprecious.com/images/verification_seal.gif" border="0" height=50 width=50 alt="Official PayPal Seal, Click to Verify" />
</a>---></td>
<td align="right" >
                
              <cfoutput>  <div align="right" style="margin-top:8px;padding-right:2px;color:##89F">#session.mail#</cfoutput> 
			<cfif not cgi.PATH_INFO contains "cart.cfm">			  <cfoutput>
			<img src="https://#session.tld#/images/dots1.gif" style="display:inline;" /> 
				<a title="Check cart and start checkout"  href="/#session.cart#?country=#ucase(session.address.country_code)#&amp;php=1.2210&amp;cartid=#session.cartid#" style="text-decoration:none;color:black;"><img src="https://#session.tld#/images/add_to_cart_icon.jpg" border=0 align="absmiddle" width="20px" height="20px" alt="start checkout" /></cfoutput>&nbsp;
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
				<span id="qty_in_cart">#vQty#</span></span>&nbsp;Amt:<span style="font-weight:bold;color:red;"><span id="cart_value">#format(decimalformat(session.grandtotal))#</span></span></cfoutput>
             </span></a>
				
                </cfif>
</div>
				<div align="right" style="margin-top:7px;">
				            
					   <cfif len(session.mail)>	
										   <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">TRACK ORDER</a> 
											| <a href="/login.cfm" class="login_link">My Account</a> |  <a href="/logout.cfm" class="login_link">Logout</a><cfelse>
		                                        												<a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Order</a> |	<a href="/simpleloginform.cfm" class="login_link">Login</a> |  
									  <a href="/apply.cfm" class="login_link" > 
									  Signup</a>
									  <!---
									  <img src="/images/que.gif" onClick='javascript:var d = document.getElementById("sink").innerHTML; document.getElementById("auth").innerHTML = d;'  /> --->| 
							 </cfif> <!---a href="wholesale_login.cfm" class="login_link">WholeSale</a>--->
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
   </cfif>
 <!---<tr border=1 bordercolordark="#006633" >
    <td width=309><a href=http://www.semiprecious.com><img src="http://www.semiprecious.com/images/header.gif" alt="Gemstone Banner" name="newheadercfm_r1_c1" width="309" height="57" border="0" /></a></td>
	<td align=center bgcolor="white">Regular mail (flat rate $3.99): Order today and receive between <font color=green><cfoutput>#dateformat(dateadd('d',4,now()),"dddd")# and #dateformat(dateadd('d',7,now()),"dddd")#</cfoutput></font> <br>Shipping world wide -
Australia, U.K., Ireland and more!</td><td>
</td>

  </tr>  ---> 
    </cfif>
  <tr> 
    <td  align="left" valign="top"><a name="jewelry_to"></a>
		<cfif cgi.server_name does not contain "wholesale">
	<div style="align:right;height:45px;width:930px;padding-left:4px;">
<!---		<div style="align:center">
<a href="jewelry-sale.cfm"><img src="https://www.semiprecious.com/images/center_page/cyberweekendtop.jpg" width="493" height="50" align="middle" style="padding-left:3px"/></a>
    </div>--->
		<cfelse>
					<div style="height:44px;width:930px;padding-left:4px;">	
		
		</cfif>
	<!---<img src="http://www.semiprecious.com/images/SemiPreciousHolidayBanner.jpg" width="968px" align="middle" style="padding-left:4px"/>--->
	  <!--- this is required because the topmenu is
	a computed stuff and has it's display none on construction. This confuses Mozilla to ignore it's existcence --->
	
	<cfif reFindNoCase("android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0>
	<cfset mobile="yes">
	<cfelse>
	 <cfif len(session.bulkbuyer.id)>
			 <cfinclude template ='/wholesale-jewellery/wholesalemenu.html'>
<!---<cfinclude template ='/includes/newtopmenu.cfm'> --->
		<cfelse>
		
			<cfinclude template ='/topmenu.cfm'>

 		</cfif>
</cfif></div>
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
                    with subject 'unsubscribe' or visit <a href="/unsubscribe.cfm">unsubscribe page</a></p></td>
              </tr>
            </tbody></table> --->
			<div id="auth" style="z-index: 3; position: absolute; left: 280px; top: 150px;padding:0px;background-color:#FFF"></div>

									   <span id="sink" style="display:none;">	
										  <div style="padding:4px;border:ridge 2px #456;width:420px;" width="400px" align="left">&nbsp; &nbsp;&nbsp;
											<span class='error1'> Sign up and get the following benefits:</span> <span onClick="javascript:document.getElementById('auth').innerHTML = '';" style="display:inline;float:right;color:maroon"><a href=''>[X]</a></span>	                       <ul style='margin-top:2px;padding-top:1px;'>     <li>Get $5 right away in your discount account. </li> <li> 20% of purchase value (beads, designer items not included) as credit for next purchase</li>    <li><strong>Invite  your friends  to get <span style='background-color: white'> additional $10.00 credit </span> 
					        </strong> for discount on  your very first purchase</li> 
							  <li>When your  friends shop you  also get <span style='background-color: white'>7.5 % of every purchase</span> made by them as credit</li>                      <li>The monthly email will announce items on <b>sale</b> 
								  
					                          and a list of <b>new items</b>.</li>   
											  <li>Get a wish list feature to track items that you liked but were not available or wanted to purchase later</li> </ul>
											                  We maintain strict email privacy and do not spam<br />
					
					<a href="/apply.cfm" class="login_link" style="color:red;">Click Here To Sign up</a>&nbsp; <span onMouseOver="javascript:document.getElementById('auth').innerHTML = '';" style="display:inline;float:right;background-color:white;color:red;"><a href='javascript:'>[X]</a></span>	
											</div>				 

</span>
