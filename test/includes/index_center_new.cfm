<cfset cats = application.cat_list /> 
<cfloop list="#cats#" index="cat" delimiters=", "  >
<cfset ran =  randRange(0,19) />
<CFQUERY DATASOURCE="gemssql" NAME="good_snaps_#cat#" CachedWithin="#CreateTimeSpan(0,0,5,0)#">
Select top 1 newitem,datetaken,lastbought, restockdate, saleprice,status, grouping, style,subcat, color, basecost, 
<cfif len(session.bulkbuyer.id)>wholesaleprice <cfelse>price</cfif> as wprice, cat, clustercount , description as seq from items where cat = '#cat#' and cat <> 'anklets' and g2i = 1 and inventory > 1 	and price>10 and (status=0 or status=3 ) order by 							
 
<cfif ran LT 3>
datetaken desc
<cfelseif ran LT 6>
lastbought desc
<cfelseif ran LT 9>
 restockdate desc
<cfelseif ran LT 12>
newitem desc
<cfelseif ran LT 15>
price desc
<cfelse>
restockdate
</cfif>

</CFQUERY>
<!---
<cfdump var="#(evaluate('good_snaps_'&cat))#" /> --->
</cfloop>


 <cfquery  datasource="gemssql" name="accouncementhome" cachedwithin="#createtimespan(0,0,1,0)#">
  select description, linkto from contenthome where domain like '#left(cgi.server_name,5)#%' and category='announcement' and seq is null
  </cfquery>
  <cfset testimoney ="Hello!!<br />
I received the beautiful necklaces yesterday. Thank you so much, I love
them!! Do you have matching earrings and bracelets for them? Please let me
know, I would be very interested in them. I will be buying more from your
website and am going to tell all my friends about you. Thank you so very
much, I am more than pleased with my necklaces!!<br />

-SMcC " />
<cfinclude template="/includes/get_testimony.cfm" />

<cfif cgi.SERVER_NAME does not contain "wholesale">
<cfif cgi.SERVER_NAME contains ".com">

<cfscript>

 welcome_bottom = "We are one of the earliest online handcrafted sterling silver gemstone jewelry stores and have been in business since 1996. We bring you the latest collections of gemstone beads jewelry and handmade 925 silver jewellery in a huge variety of necklaces, earrings, pendants, rings, bracelets, brooches and more. We are proud of our variety, authenticity and above all a great affordable collection of silver gemstone and pearl jewelry for all age groups. You will find here natural fashionable gemstone jewelry suitable for teenager and adult girls, women and men. Also check out our vast collection of natural stone jewelry beads and healing stones in all shapes and sizes. We also supply jewelry and stone beads to resellers and retail stores at very attractive wholesale prices. Please register as a wholesale buyer or contact us for special wholesale prices." ;
 txt_your_price = "Our Price";
txt_In_Store_Price = "In Stores";
</cfscript>
<Cfelse>
<cfscript>
 welcome_bottom = "We are one of the oldest online silver gemstone jewellery stores based in Austin and New Delhi. Here, we bring our vast variety of gemstone necklaces, earrings, pendants, rings, bracelet, brooches and many more styles at special Indian rupee prices for our Indian visitors. We sell only authentic sterling silver natural gemstone jewellery. We use the most secured payment gateways and offer a very flexible return and refund policy if you are not satisfied with our quality and workmanship. Now, you can buy silver and gemstone jewellery with confidence at most affordable prices." ;
 txt_your_price = "Aapkey Liye" ;
txt_In_Store_Price = "In Malls";
</cfscript>

<!---<cfset welcome_bottom = "आपका स्वागत है हमरी वेबसाइट! यह 14 साल से भी  " />--->
</cfif>
<cfinclude template="/includes/homeslideshow.cfm" />

<div id="changing_image" style="position:relative;margin-top:4px;"> 
<a href=gem-stone-jewelry.cfm> <img ide="changing_image_img" id="SlideShow" src="/images/cp/cp-1.jpg" style="relative;z-index:0;display:inline;" height="250px"   width="535px;"  border=0 alt='gemstone sterling silver jewelry'></a>
  <div style="font-weight:1600;font-size:3.6em;left:10px;position:absolute;;top:0px;text-align:center;width:100%;z-index:3;" id="center_pic_text"></div>
</div>

<cfscript>
 welcome_bottom = "We have been supplying authentic gemstone sterling silver jewelry, beads and healing crystals at wholesale prices to small and medium retail stores and resellers since 1996. We source our gemstones and beads from highly reputed manufacturers and suppliers and all our jewellery is handcrafted by skilled artisans in India. India has a long and respected tradition of manufacturing silver and gold gemstone jewelry. We have a huge collection of silver gemstone necklaces, pendants, rings, earrings, bracelets, brooches, cuff links both for women and men at very competitive wholesale prices. We also manufacture silver jewelry on special customized orders." ;
 txt_your_price = "Wholesale" ;
txt_In_Store_Price = "In Stores:";
</cfscript>

 </cfif>

   <cfif accouncementhome.recordcount gt 0> ...
<div class="justified_text" id="announcement">
	<br /> <font color=brown><b><cfoutput>#accouncementhome.description#. Click <a href=#accouncementhome.linkto#>here</a>.</cfoutput></b></font>
	 </div>
  
	 </cfif>
  <div id="best_sellers" style="margin-left:8px;margin-top:8px;">
	<div class="jewelry_hub_home" style="border-left:1px #CEcEcE ridge;border-right:1px #CECECE ridge;background-image:url('/headhunting/images/hash.gif');" >
		<div align="center" style="border:2px black solid;
			color:black;width:99%;
			font-family:'Times New Roman',Times,serif;
			font-size:1.8em;color:white;" class="grayplacard">
		OVER 8000 SEMIPRECIOUS JEWELRY DESIGNS
</div>	
<cfloop list="#cats#" index="cat_i" >
<cftry>
<cfoutput query="good_snaps_#cat_i#" maxrows="1">
	<div class="jewelry_box_home" >
       	<div class=heading> 
		    	<div class=URL> 
				<a href="/gem-stone-#cat_i#.cfm?category=silver" class="side_link" >#cat_i#</a>
							<cfset img = "http://www.semiprecious.com/images/#cat_i#/thumb/#newitem#.jpg" />
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content" >
						<div class="big_image" >
			     			<a href="/detail.cfm?newitem=#newitem#" >
								 <img src="#img#" alt="gemstone in silver" /></a>
						</div>
				</div>			  
				
			<div class="category_description"  >
			 #style# #listgetat(color,1)#  #cat_i# in  #subcat# #grouping#</div>
<div class="retail_price">
				#txt_In_Store_Price#:&nbsp;#format(value_convert(1)*7.12*basecost/(value_convert(application.exchangerate)))#
			   <!---[<a href="/gemstone_jewelry_gallery.cfm?category=#cat_list#" >More #cat_i#</a>]--->
 		</div>
				<div class="reg_price" style="margin-bottom:4px;">
				<a href="/detail.cfm?newitem=#newitem#" class="side_link" >#txt_your_price#:&nbsp;#format(wprice)#</a>
			   <!---[<a href="/gemstone_jewelry_gallery.cfm?category=#cat_list#" >More #cat_list#</a>]--->
 
		</div>


</div>	</cfoutput>	
	<cfcatch type="any">
	</cfcatch>
	</cftry>
	</cfloop>
	</div><!--- best pics --->
	
	</div>

	<cfoutput>
	
<div id="customer_info">
<div align="left" class="form_heading"><span style="margin-left:2">Customers' Feedback&nbsp;</span> 
</div>
<!---
<div id="dvtestrimonial">
                <iframe scrolling="no" height="22px" frameborder="0" width="570px" src="/includes/testimonials.cfm">
   </iframe>
    </div>
	--->		
			<div class="cyansilver">
<marquee  truespeed="" style="height:60px;font-size:1em;" scrollamount="2" scrolldelay="92" behavior="scroll" direction="up" onmouseover="this.scrollAmount=0;" onmouseout="this.scrollAmount=1;" class="testimonial-marq">					
<cfinclude template="/includes/testimonies.xml" />

</marquee>

<!--- 
<cfoutput>#testimoney#</cfoutput>
 --->

<div align="right" class="form_headin"><span style="margin-left:2"><a accesskey="F" class="login_link" style="text-decoration:underline;" href="/marketing/testimonies.cfm">See More Testimonials ...</a></span>
<a accesskey="F" class="login_link" href="marketing/feedback.cfm">and share your feedback too</a>&nbsp; 
</div>
</div>
 <div class="welcome_shipping" >
#WELCOME_BOTTOM#
<br />
	<span class="single_row rowb">		 We ship FPO, APO, internationally and accept no-questions asked returns up to 30 days!</span> 
</div><div  class="birthstone" style="clear:left;margin:20px 2px;;text-align:justify;" >
    <a href=#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))# Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
 Also, next months - <a href='#lcase(monthasstring(dateformat(dateadd("M",1,now()),"m")))#-birthstone.cfm'>#monthasstring(dateformat(dateadd("M",1,now()),"m"))# Birthstone Jewelry</a>
  
 </div>
</cfoutput>
<br>Remember to come to our thanksgiving sale page on <a href=thanksgiving.cfm>Black Friday</a>
  <!---  <div id="various"> <table  border=0 align="center" >
          <tr class="customrequest"> 
            <td align="center" class="darkbox"><font color="#FFFFFF">JEWELRY 
              GIFTS</font></td>
            <td align="center" class="darkbox"><font color="#FFFFFF">PROMOTION</font></td>
            <td align="center" class="darkbox"><font color="#FFFFFF">Jewelry Newsletters</font></td>
          </tr>
          <tr class="customrequest"> 
            <td align="center" valign="top" > 
			<div align="justify" style="border-right:thin ridge black;padding-right:4px;padding-top:6px;"><font color="#400000">Don't 
                just adorn yourself; buy &amp; email <strong>Value plus</strong> 
                Jewelry <a href="/gift_certificatenew.cfm">gift certificates</a> 
                to your friends.</font>
				</div></td>
            <td align="center" valign="top" > <div align="justify" style="border-right:thin ridge black;padding-left:4px;padding-right:4px;padding-top:6px;"><font color="#000000"><a href="apply.cfm">Sign-up 
                </a> to get purchase credit, discounts &amp; new item alerts via 
                email, email enabled saving of cart, wish list etc. It takes a 
                minute...</font></div></td>
            <td align="center" valign="top" width=200 ><font color="#000040"> 
                <a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=9>Friends Referal Credit</a><br>
                <a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=14>Tiny discount lots 4 U</a><br>
               <a href=http://www.semiprecious.com/Mysticquartz.cfm>Mystic Quartz</a><br>
                <a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=14>Jewelry on Sale</a>
                
</font></td>
          </tr>--->
        </table>
         </div>
		 <div id="content_">
 <span class="details">Stone Facts:</span> <a href="/healing_properties.cfm" class="headeranchor">Healing</a> 
        | <a href="/physical_chemical_properties.cfm" class="headeranchor">Physical 
        Chemical</a> <span > | </span> <a href="/origin_history.cfm" class="headeranchor">History</a><span > 
        | </span><a href="/geographical_deposits.cfm" class="headeranchor">Geology</a><span > 
        | </span><a href='/agate.htm' class="headeranchor"> All By Stone</a>
		</div>
		  
    <div id="paymodes"><strong>Payment 
        Modes: PayPal, Credit cards, Money Order, Check, Cash on Delivery (COD)</strong>
    </div>
      <div class="row2" style="text-align:center;"   >You can also order by phone<strong><cfoutput>#Application.tollfree#</cfoutput></strong> (USA)
	  </div>
</div>


