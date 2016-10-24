<!--mainfooter.cfm starts--->
<center>
	<a title="Curated Premium Jewelry in Semiprecious"  href='http://www.elinamira.com'>
		<img style="width:100%;max-width:800px" src='/ads/elinamira_curated_jewelry.jpg' />
	</a>
</center>
<br />
	<cfif session.tld is '.semiprecious.in'>
		~</div>
	</cfif>
<!---
	<cfif session.cartid GT 0>
		<cfif not isdefined("client.cfcartid")>

			<script language="javasrtip1.2">
				try {
					cv = "CFCARTID=" + <cfoutput> #session.cartid# </cfoutput>+"#";
								writeCookie("CFCLIENT_WWWSEMIPRECIOUS",cv,1000);
							}
							catch(e)
							{

							}

			</script>
		</cfif>
	</cfif>
	--->
		<cfset cachedFooter = cacheGet("mainfooter-#cgi.server_name#-#mobile#")>

<!--- If the data is not cached, create it and do a cache put. --->
<cfif isNull(cachedFooter)>
<cfsavecontent variable="mainfooter">

<cfif cgi.server_name contains 'wholesale'>

<div style="clear:both;background-color:transparent" id="mainfooter"  >
		<div style="100%;padding:1px;" >

				<div id="wholesalefooter" style="position:relative;top:140px">
					<a title="Payment Options"  href='/Checks_Discover_Jewelry_Payment.cfm'>
						Payment Options
					</a>
					|
					<a title="Shipping Policy" href='/Jewelry_Free_Shipping.cfm'>
						Shipping/Return Policy
					</a>
					|
					<a title="Wholesale Online Store"  href="http://www.semipreciousWholesale.com">
						SemipreciousWholesale
					</a>
				</div>

			 <!---
				<a href=/jewelry-articles/knowledge.cfm>Knowledge Base</a> |--->
				<a href=/contactus.cfm>Contact Us</a> <a href='/privacy_in.cfm'>Privacy Policy</a> | <a href='/about.cfm'>About us</a> | </div>
		</div>
		<div style="width:100%;margin-top:10px;position:relative;top:140px">
			<table align="center" style="display:table;">
				<tr>
					<td>

						<img alt="semiprecious jewelry fans on facebook" style="display:inline" src=/images/facebook-gemstone.png> </a>
					</td>
						<td>
							<a href="https://www.twitter.com/beads_gems" title="Follow us on Twitter">
								<img style="display:inline" src="/images/twitter.ico" height=40 width=40 alt="Follow Jewelry store on Twitter" border="0" />
							</a>
						</td>
						<td>
							<a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
								<img src="https://www.semiprecious.com/images/verification_seal.gif" border="0" height=40 width=40 alt="Official PayPal Seal, Click to Verify" />
							</a>
						</td>


				</tr>
			</table>
		</div>
	</div>
	<!---<div align="center">
		<cfif CGI.path_info does not contain 'cart' and CGI.path_info does not contain 'confirmation'>
		<cfinclude template="/googleadsforlist.htm">
		</cfif>
		</div>--->



<cfelse><!--- Non wholesale section --->

	<cfif cgi.SCRIPT_NAME does not contain 'wish.cfm'>
		<div class="footerLine" align="center">
		</div>
	</cfif>
	<cfset url.server_name = cgi.SERVER_NAME />


		<!--
		Cached at <cfoutput>#now()#</cfoutput>
		-->
<article class="wrapper">
		<section class="footage">
			<div class="footageBox" align="left">
				<h2>
					Monthly Newsletter
				</h2>
				<p>
					For latest products and information
				</p>
				<div class="newsletter">
					<form action="http://sub.ezinedirector.net/index.cfm" autocomplete="on" method="post">
						<input name="fa" type="hidden" value="s" />
						<input name="EzineID" type="hidden" value="964702580" />
						<br />
						<input maxlength="255" length=30 name="email" placeholder="your email" required="" style="width: 10em;" type="email" />
						<br />
						<br>
						<input type="submit" value="Send" value="  subscribe  "  class="sendBtn" name="submit"/>
						<span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 0.8em;">
							Email List Management
							<br>
							by
							<a href="https://www.ezinedirector.com">
								Ezine Director
							</a>
						</span>
					</form>
				</div>
				<!--Newsletter Ends-->
			</div>
			<!--Footage Box Ends-->
			<div class="footageBox" align="left">
				<h2>
					Categories
				</h2>
				<div class="categories">
					<ul>
						<li>
							<a href="/gems.cfm">
								Gems
							</a>
						</li>
						<li>
							<a href="/rare-stones/rare-gems-pendants.cfm">
								Pendants
							</a>
						</li>
						<li>
							<a href="/rare-stones/rare-gems-rings.cfm">
								Rings
							</a>
						</li>
						<li>
							<a href="/rare-stones/rare-gems-earrings.cfm">
								Earrings
							</a>
						</li>
						<li>
							<a href="/rare-stones/rare-gems-necklaces.cfm">
								Necklaces
							</a>
						</li>
					</ul>
					<ul>
						<li>
							<a href="/rare-stones/rare-gems-bracelets.cfm">
								Bracelets
							</a>
						</li>
						<li>
							<a href="/gem-stone-cufflinks.cfm">
								Cufflinks
							</a>
						</li>
						<li>
							<a href="/gem-stone-brooches.cfm">
								Brooches
							</a>
						</li>
						<li>
							<a href="/rare-stones/rare-gems-healing.cfm">
								Healing
							</a>
						</li>
						<li>
							<a href="/rare-stones/rare-gems-beads.cfm">
								Beads
							</a>
						</li>
					</ul>
					<div class="clr">
					</div>
				</div>
				<!--Categories Ends-->
			</div>
			<!--Footage Box Ends-->
			<div class="footageBox" align="left">
				<h2>
					Browse New Jewelry
				</h2>
				<div class="new-jew">
					<cfinclude template="/advsearch.cfm">
				</div>
				<!--New Jewelry Ends-->
			</div>
			<!--Footage Box Ends-->
			<div class="footageBox" align="left">
				<h2>
					Social Networks
				</h2>
				<div class="social">
					<ul>
						<!--- <li><a href="http://www.Semiprecious.com/rss" class="rss">Semiprecious.com/rss</a></li> --->
						<cfif session.country is 'india'>
							<li>
								<a href="https://www.facebook.com/semiprecious.in" target="_TOP" class="fb" rel="nofollow">
									Facebook/semiprecious
								</a>
							</li>
						<cfelse>
							<li>
								<a href="https://www.facebook.com/austinGems" target="_TOP" class="fb" rel="nofollow">
									Facebook/austinGems
								</a>
							</li>
						</cfif>
						<li>
							<a href="https://www.twitter.com/beads_gems" title="Follow us on Twitter" class="twit" rel="nofollow">
								Twitter/beads_gems
							</a>
						</li>
						<div id="yelp-biz-badge-plain-aZr4LjOAUxrMgNSkeDU8eA">
							<li>
								<a href="http://www.yelp.com/biz/semiprecious-com-austin-2">
									Check out semiprecious.com on Yelp
								</a>
							</li>
						</div>

						<script type="text/javascript">
							(function(d, t) {
								var g = d.createElement(t);
								var s = d.getElementsByTagName(t)[0];
								g.id = "yelp-biz-badge-script-plain-aZr4LjOAUxrMgNSkeDU8eA";
								g.src = "https://dyn.yelpcdn.com/biz_badge_js/en_US/plain/aZr4LjOAUxrMgNSkeDU8eA.js";
								s.parentNode.insertBefore(g, s);
							}(document, 'script'));
						</script>
						<br>
					</ul>
					<a href="https://www.manta.com/c/mx7jzx5/semiprecious-com-inc">
						<img src="https://www.semiprecious.com/images/mantaBadge_md.png" height="32" width="80" border="0" />
					</a>
					<div class="clr">
					</div>
				</div>
				<!--Social Networks Ends-->
			</div>
			<!--Footage Box Ends-->
			<div class="clr">
			</div>
		</section>
		<!--Footage Ends-->
		<section class="whySemi">
			<div class="paypal" align="left" style="cursor:default">
				<!--- <img src="/images/auth.jpg"> --->
				<a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
					<img src="/images/paypal1.jpg" alt="Official PayPal Seal, Click to Verify">
				</a>
				<a target="_blank" href="https://www.mcafeesecure.com/RatingVerify?ref=www.semiprecious.com" rel="nofollow">
					<img width="94" height="54" border="0" src="//images.scanalert.com/meter/www.semiprecious.com/23.gif"
						alt="McAfee SECURE sites help keep you safe from identity theft, credit card fraud, spyware, spam, viruses and online scams" />
				</a>
			</div>
			<!--Paypal Ends-->
			<div class="semiprecious">
				<h2>
					Why Semiprecious?
				</h2>
				<p>
					This is why 30,000 customers prefer Semiprecious:
				</p>
				<ul>
					<li>
						18,000 Designs
					</li>
					<li>
						Authentic Gemstone &amp; Sterling Silver
					</li>
				<cfif !mobile></ul>
				<ul></cfif>
					<li>
						Affordable
					</li>
					<li>
						Great Customer Service
					</li>
				<cfif !mobile></ul>
				<ul></cfif>
					<li>
						Easy returns
					</li>
					<li>
						Secure Payments
					</li>
				</ul>
				<div class="clr">
				</div>
			</div>
			<!--Semi Ends-->
			<div class="clr">
			</div>
		</section>
		<!--Why Semi Precious Ends-->
		<footer class="footer">
			<h3>
				Copyright 2016 Semiprecious. All rights reserved.
			</h3>
			<ul>
				<li>
					<a title="The traditionally and astrologically recommended semiprecious stones benefits for health" href="/healing_properties.htm">
						Healing Properties
					</a>
				</li>
				<li>
					<a href="/physical_chemical_properties.htm">
						Physical & Chemical Properties
					</a>
				</li>
				<li>
					<a href="/Geographical_deposits.htm">
						Geographical Locations
					</a>
				</li>
				<li>
					<a href="/origin_history.htm">
						History & Origin
					</a>
				</li>
				<li>
					<a href='/privacy_in.cfm'>
						Privacy Policy
					</a>
				</li>

					<li>
						<a href='/Checks_Discover_Jewelry_Payment.cfm'>
							Payment Options
						</a>
					</li>
					<li>
						<a href='/Jewelry_Free_Shipping.cfm'>
							Shipping/Return Policy
						</a>
					</li>
					<li>
						<a href="http://www.semipreciousWholesale.com">
							Wholesale
						</a>
					</li>

				<li>
					<a href='/about.cfm'>
						About Us
					</a>
				</li>
				<li>
					<a href='/contactus.cfm'>
						Contact Us
					</a>
				</li>
				<!---
					<li><a href=/jewelry-articles/knowledge.cfm>Knowledge Base</a> </li>--->
			</ul>
			<div class="clr">
			</div>
		</footer>
		<!--Footer Ends-->
	</article>

<!--- 		<script async=true type="text/javascript">
			adroll_adv_id = "PLQPBJSLJ5ABTBDLMFMW6F";
			adroll_pix_id = "CHWO6SS4CJGCBIUQ2EUVWX";
			(function() {
				var oldonload = window.onload;
				window.onload = function() {
					__adroll_loaded = true;
					var scr = document.createElement("script");
					var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
					scr.setAttribute('async', 'true');
					scr.type = "text/javascript";
					scr.src = host + "/j/roundtrip.js";
					((document.getElementsByTagName('head') || [null])[0] || document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
					if (oldonload) {
						oldonload()
					}
				};
			}());
		</script> --->
</cfif>
<script type="text/javascript">
		try {
			var _gaq = _gaq || []; <cfif cgi.server_name contains "wholesale" > _gaq.push(['_setAccount', 'UA-12470915-1']); <cfelseif cgi.server_name contains "semiprecious.in" > _gaq.push(['_setAccount', 'UA-18020608-1']); <cfelse > _gaq.push(['_setAccount', 'UA-294143-2']); </cfif>

			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0];s.parentNode.insertBefore(ga, s);
		})();
		}
		catch (e) {}
	</script>

<!-- Start Alexa Certify Javascript -->

<script type="text/javascript" src="https://d31qbv1cthcecs.cloudfront.net/atrk.js">
</script>

<script type="text/javascript">
	_atrk_opts = {
		atrk_acct: "mdXrf1aUOO00qh",
		domain: "semiprecious.com"
	};
	atrk();
</script>
<noscript>
	<img src="https://d5nxst8fruw4z.cloudfront.net/atrk.gif?account=mdXrf1aUOO00qh" style="display:none" height="1" width="1" alt="" />
</noscript>
<!-- End Alexa Certify Javascript -->
</cfsavecontent>

    <cfset cachePut("mainfooter-#cgi.server_name#-#mobile#", mainfooter, CreateTimeSpan(0,0,10,10))>
</cfif>
<cfoutput>#cachedFooter#</cfoutput>

</body>
</html>
<!--mainfooter.cfm ends--->
