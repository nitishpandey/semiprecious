<cfif session.country neq 'india'>
<div class="component_box" style="margin-top:10px;" align=center> 
	  
	  <a href="/daily_deals/daily_deals.cfm" on='javascript:var d = document.getElementById("daily_deal").innerHTML; document.getElementById("auth").innerHTML = d;'><img src="/daily_deals/jewelrydeals.gif" height=26 width=120 border=0></a>
<br>	  Rock Bottom Prices
	  <cftry>
	  <cfset x  = listgetat(application.daily_deals.itemlist,randrange(1,application.daily_deals.gallery_size)) />
	  <cfquery datasource="gemssql" name="ddi" cachedwithin="#createtimespan(3,0,0,0)#">
	  select cat from items where newitem = #x#
	  </cfquery>
	
	<cfoutput>
	
    	  <div class="url">
		  <a href="/daily_deals/">	  <img src="/images/#ddi.cat#/thumb/#x#.jpg" /></a>
		  <div style="text-align:center" class="url" >
		  <div class="reg_price">Regular: #format(IIF(len(session.bulkbuyer.id),DE(application.daily_deals[ddi.cat][x]["wdprice"]*application.daily_deals.wholesale_factor),DE(application.daily_deals[ddi.cat][x]["price"])))#</div>
		  
		  <a href="/jewelry_item.cfm?newitem=#x###jewelry_top" class="side_link">Today	 #format(session.sale_factor*application.daily_deals[ddi.cat][x][IIF(len(session.bulkbuyer.id),DE("wdprice"),DE('dprice'))])#!!!</a>&nbsp;
		  </div>
		  </div>
	</cfoutput><cfcatch type="any">
	</cfcatch>
	</cftry>
   		  </div>
</cfif>
<!--- TODO: Reduce clutter on home page and check bounce rate Nitish
	<div class="greena greenb" align="center" style="background-color:white;padding: inherit 6px;"><p class="box_heading">Sign Up for Immediate Discounts</p>
				<ul align="left" style="color:#543;text-align:left;padding-left:2px;margin-left:4px;">
	<a href="/apply.cfm" accesskey="Z"  style="text-decoration:none;  border: 0px solid purple; text-decoration: none;">	
<br />	<span class="single_row">Loyalty Shopping points</span> <br /><span class="single_row">Get <cfoutput>#format(Application.signup_credit)#</cfoutput> Semiprecious.com Cash</span></a><br />
	<!---<span class="single_row">
				<div style="position:relative;background-color:#E70202;border:2px red ridge;padding:1px;color:white;">
						<img src="/images/que.gif" style="display:inline;position:absolute;top:-1px;left:110px;"  onClik="document.getElementById('que_answer').innerHTML='';" onClick="document.getElementById('que_answer').innerHTML=document.getElementById('easy_content1').innerHTML;" />
					 <span id="que_answer" style="position:absolute;z-index:3;top:1px;left:-512px;color:black"></span>
 	 	  <a href="/login.cfm" style="text-decoration:none;cursor:pointer;color:white;">35% Discount!</a>
			</div>
</span><br />--->
	<div id="easy_content1" style="display:none;" >
					 	<div style="background-image:Url('/images/help_resources_tl.gif');width:500px;" >
							<br /><cfinclude template="/includes/crp.cfm" />
		 				</div>
		 		</div>
		 		 <div id="easy_content" style="display:none;">
					 	<div style="background-image:Url('/images/help_resources_tl.gif');width:400px;">
						  <br />The Loyal Shopper's Rewards
						  <div class="detailrow"  align="left"	  style="text-transform:none;background-color:white;border:2px ##E6Cf84 solid;border-top:0px;padding:3px;text-align:justify;">
						  <cfoutput>	You collect discount points for every purchase made on this store by you or your friends. For example, if your purchase is for #format(100)# then you get points worth #format(Application.own_credit)#. <br />
						  For a friend's cart of #format(100)# we add #format(Application.friend_credit)# to your points. <br />These points are used to give you a discount on your future purchases. The discount you get is 20% on all items and 10% on items on sale. You get a total discount limited by the points you have. More the points bigger the discounts. <br />
						  Let's take another example. To use #format(10)# credit points, you can make a purchase #format(50)#  (Because 20% of #format(50)# is #format(10)#. This example assumes you have all items with regular price in your cart. If an item is on sale then the system will calculate discount of 10% on it. The total discount in such manner cannot exceed the credit points you have.</cfoutput> 
							<br />[<span  onClick="document.getElementById('que_answer').innerHTML='';" class="error1" style="cursor:pointer;">Start spreading the word</span>]
				 		</div>
		 			</div>
		 		</div>

<span class="single_row">Discount Coupons</span><br />
<!-- <br /><span class="single_row">Monthly Mailers</span>		
 -->	</ul>
<a href="/apply.cfm" accesskey="Z" class="greenbutton" style="color:black;display: block; 
	margin-top: 7px;margin-left:20px;padding:2px; width: 100px; height: 20px; border: 2px outset gray; text-decoration: none;">Sign Up Now</a><br />
</div>
<div class="magentaa magentab" style="margin-top:-10px;">
<p class="box_heading">Why Semiprecious?</p>
<ul align="left" style="padding-left:2px;margin-left:2px;text-align:left;">
<span class="single_row"><cfoutput>#Application.variety_count#</cfoutput> Designs</span>
<span class="single_row">Authentic Gemstone
</span><span class="single_row">&amp; Sterling Silver</span>
<span class="single_row">Affordable</span>
<span class="single_row">Great Customer Service</span>
<span class="single_row">Easy returns</span>
<span class="single_row"><a href="#safety">Secure Payments</a></span>
</ul>
</div>
		
<!-- 
<div align="center" class="bluea blueb"> <p class="box_heading">Connect with Semiprecious.com</p>

		<a href="http://www.twitter.com/beads_gems" title="Follow us on Twitter"><img width="140px" src="/images/follow_twitter_button_c.png" alt="Follow us on Twitter" border="0" /></a>
<br />           <br />
<span style="width:150px;cursor:pointer;">
            Facebook Badge START <a href="http://www.facebook.com/pages/Austin/semipreciouscom/106278399134" title="semiprecious.com" target="_TOP" style="font-family: &quot;lucida grande&quot;,tahoma,verdana,arial,sans-serif; font-size: 11px; font-variant: normal; font-style: normal; font-weight: normal; color: white; text-decoration: none;">Semiprecious.com on</a><br /> <a href="http://www.facebook.com/pages/semipreciouscom/138698878564" title="semiprecious.com" target="_TOP"><img src="/images/facebook.png" width="120" height="28" style="border: 0px;" /></a>
		   </span>
<br />        <br />  
<a href="/marketing/feedback.cfm" >Or Write in to us</a></span><br /><br />
		</div>		
 -->
			 
<div align="center" class="" style="margin-bottom:20px;width:154px;border:0px gray solid;padding:auto 6px;"> <p class="box_heading">Click On Icons to Verify Site Security</p>

		<br /><a name="safety" href='http://www.bbb.org/central-texas/business-reviews/jewelry-designers/semipreciouscom-in-austin-tx-90026075'><img src='/images/bblogo.gif' border=0 height=60>
</a><br /><a href="https://www.paypal.com/us/verified/pal=cs%40semiprecious%2ecom" target="_blank">
    <img src="/images/verification_seal.gif" border="0" height=50 width=50 alt="Official PayPal Seal, Click to Verify">
</A><br />
 <a href='http://verify.authorize.net/anetseal/?pid=ef41378d-bba2-4e5a-8e8f-3a413a95f192&amp;rurl=http%3A//www.semiprecious.com/cart.cfm'>
    <img src="/images/authsecure90x72.gif" height=52 width=64 border=0 />
</a>

		</div>
<--->