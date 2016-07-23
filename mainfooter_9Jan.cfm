<cfif session.tld is '.semiprecious.in'>
~</div>
</cfif>
<cfif (session.cartid)>
<cfif not isdefined("client.cfcartid")>
<script language="javasrtip1.2">
try{
cv = "CFCARTID="+<cfoutput>#session.cartid#</cfoutput>+"#";
	writeCookie("CFCLIENT_WWWSEMIPRECIOUS",cv,1000);
} catch(e)
{
}
						</script>
                        </cfif>
						</cfif>
					
					     <div style="clear:both" id="mainfooter"  >
			 <div style="width:96%;padding:1px;" > 
     <cfif cgi.server_name contains 
		 'semiprecious.in' or cgi.server_name contains 'semiprecious.com'>
		 

<a href="/healing_properties.htm">Healing Properties</a> |
<a href="/physical_chemical_properties.htm">Physical & Chemical Properties</a>	|
<a href="/Geographical_deposits.htm">Geographical Locations</a> |
<a href="/origin_history.htm">History & Origin</a> <br><BR></cfif><a href='/privacy_in.cfm'>Privacy Policy</a> | <a href='/about.cfm'>About 
              us</a> | 
			<cfif session.country is "india">
			<a href='/tandc_in.cfm'>Terms &amp; Conditions</a> | <a href="/disclaimer_in.cfm">Disclaimer</a>
				<cfelse>
			<a href='/Checks_Discover_Jewelry_Payment.cfm'>Payment 
              Options</a> | 
			<a href='/Jewelry_Free_Shipping.cfm'>Shipping/Return 
              Policy</a> | <a href=https://www.shareasale.com/shareasale.cfm?merchantID=24548>Affiliate Program</a>
		| <a href="/wholesale_register.cfm">Wholesale</a>	</cfif> |
		
<!---
			 <a href=/jewelry-articles/knowledge.cfm>Knowledge Base</a> |
--->
			<a href=/contactus.cfm>Contact Us</a>
			</div>
<div style="width:90%;margin-top:10px;">
<table align="center" style="display:table;">
<tr><td>

					<!---<cfif session.tld is 'semiprecious.in'>--->
					<cfif session.country is 'india'>
					
				          <a href="https://www.facebook.com/semiprecious.in" target="_TOP">
					          <cfelse>
				          <a href="https://www.facebook.com/austinGems" target="_TOP">
					 </cfif>
					  <img alt="semiprecious jewelry fans on facebook" style="display:inline" src=/images/facebook-gemstone.png>
				</a>
</td>
			<cfif session.country neq 'india'>

	<td>
    		<a href="https://www.twitter.com/beads_gems" title="Follow us on Twitter"><img style="display:inline" src="/images/twitter.ico" height=40 width=40 alt="Follow Jewelry store on Twitter" border="0" /></a>
				</td>
		<td><a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
    <img src="https://www.semiprecious.com/images/verification_seal.gif" border="0" height=50 width=50 alt="Official PayPal Seal, Click to Verify" />
</a></td>

				<cfif cgi.server_name contains "semiprecious.com">
				<td>


  
 <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="P9SW8ZFSY8NBC">
<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_giftCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="paypal gifts" style="display:inline" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form></td><td><form action='https://madmimi.com/signups/subscribe/35940' method='post'>
<div><label for='signup_email'>Email:</label><input id='signup_email' size=25 name='signup[email]' type='text' /><br /><input name='commit'  type='submit' value='Sign Up For Deals/News' /></div>
</form>
</td></cfif></cfif>
</tr>

</table>
	</div>	

  </div>

<!---<div align="center">		
											<cfif cgi.script_name does not contain 'cart' and cgi.script_name does not contain 'confirmation'>
							      <cfinclude template="/googleadsforlist.htm">
										</cfif>
</div>--->


	              <script type="text/javascript">
              try{
                var _gaq = _gaq || [];
              <cfif cgi.server_name contains "wholesale">
                _gaq.push(['_setAccount', 'UA-12470915-1']);
				<cfelseif cgi.server_name contains "semiprecious.in">
                _gaq.push(['_setAccount', 'UA-18020608-1']);
              <cfelse>
                _gaq.push(['_setAccount', 'UA-294143-2']);
			  </cfif>
 
                _gaq.push(['_trackPageview']);
              
                (function() {
                  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                })();
              }
			  catch(e)
			  {
			  }
              </script>

<cfif cgi.server_name contains "semiprecious.com">
<script type="text/javascript">
adroll_adv_id = "PLQPBJSLJ5ABTBDLMFMW6F";
adroll_pix_id = "CHWO6SS4CJGCBIUQ2EUVWX";
(function () {
var oldonload = window.onload;
window.onload = function(){
   __adroll_loaded=true;
   var scr = document.createElement("script");
   var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
   scr.setAttribute('async', 'true');
   scr.type = "text/javascript";
   scr.src = host + "/j/roundtrip.js";
   ((document.getElementsByTagName('head') || [null])[0] ||
    document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
   if(oldonload){oldonload()}};
}());
</script>
</cfif>
