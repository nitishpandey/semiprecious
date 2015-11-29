<cfif (session.cartid)>
<cfif not isdefined("client.cfcartid")>
<script language="javasrtip1.2">
try{
cv = "CFCARTID="+<cfoutput>#session.cartid#</cfoutput>+"#";
	writeCookie("CFCLIENT_SEMIPRECIOUS",cv,1000);
} catch(e)
{
}
						</script>
                        </cfif>
						</cfif>
					
					     <div id="mainfooter"  >
			 <div style="width:98%;padding:1px;" > 
     
	  <a href='/privacy_in.cfm'>Privacy Policy</a> | <a href='/about.cfm'>About 
              us</a> | 
			<cfif session.country is "india">
			<a href='/tandc_in.cfm'>Terms &amp; Conditions</a> | <a href="disclaimer_in.cfm">Disclaimer</a>
			<cfelse>
			<a href='/Checks_Discover_Jewelry_Payment.cfm'>Payment 
              Options</a> | 
			<a href='/Jewelry_Free_Shipping.cfm'>Shipping/Return 
              Policy</a> | <a href=http://www.shareasale.com/shareasale.cfm?merchantID=24548>Affiliate Program</a>
		| <a href="/wholesale_register.cfm">Wholesale</a>	</cfif> |
			<cfif session.mail is application.admin_email or 1>  <a href=/jewelry-articles/knowledge.cfm>Knowledge Base</a> |</cfif>

			<a href=/contactus.cfm>Contact Us</a>
			</div>
<div style="width:100%;margin-top:10px;background-color:white;">
    		<a href="http://www.twitter.com/beads_gems" title="Follow us on Twitter"><img style="display:inline" src="/images/follow_twitter_button_c.png" alt="Follow us on Twitter" border="0" /></a>
			          <a href="http://www.facebook.com/pages/semipreciouscom/105646982816244" target="_TOP"><img src=/images/fb.gif></a>

		 
           
</div>
</div>
<cfif cgi.server_name contains "semiprecious.in">
		
              <script type="text/javascript">
              
                var _gaq = _gaq || [];
                _gaq.push(['_setAccount', 'UA-18020608-1']);
                _gaq.push(['_trackPageview']);
              
                (function() {
                  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                })();
              
              </script>
              <cfelse>
              		 
              <script type="text/javascript">
              var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
              document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
              </script>
              
              <script type="text/javascript">
              try {
              var pageTracker = _gat._getTracker(
              <cfif cgi.server_name contains "wholesale">"UA-12470915-1"<cfelse>
              "UA-294143-2"</cfif>);
              pageTracker._trackPageview();
              } catch(err) {}
              </script>

</cfif>