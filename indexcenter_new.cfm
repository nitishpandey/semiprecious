

<cfset cats = application.cat_list /> 
<cfloop list="#cats#" index="cat" delimiters=", "  >
<cfset ran =  randRange(0,19) />
<CFQUERY DATASOURCE="gemssql" NAME="good_snaps_#cat#" CachedWithin="#CreateTimeSpan(0,0,0,1)#">
Select top 1 newitem,datetaken,  saleprice,status, grouping, style,subcat, color, basecost, 
<cfif len(session.bulkbuyer.id)>wholesaleprice <cfelse>price</cfif> as wprice, cat, clustercount , description as seq from items where cat = '#cat#' and g2i = 1 and inventory > 1 	order by 							
 
<cfif ran LT 3>
datetaken desc
<cfelseif ran LT 6>
seq asc
<cfelseif ran LT 9>
seq desc
<cfelseif ran LT 12>
newitem desc
<cfelseif ran LT 15>
price desc
<cfelse>
grouping
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
 txt_your_price = "Your Price";
txt_In_Store_Price = "In Store Price";
</cfscript>
<Cfelse>
<cfscript>
 welcome_bottom = "We are one of the oldest online silver gemstone jewellery stores based in Austin and New Delhi. Here, we bring our vast variety of gemstone necklaces, earrings, pendants, rings, bracelet, brooches and many more styles at special Indian rupee prices for our Indian visitors. We sell only authentic sterling silver natural gemstone jewellery. We use the most secured payment gateways and offer a very flexible return and refund policy if you are not satisfied with our quality and workmanship. Now, you can buy silver and gemstone jewellery with confidence at most affordable prices." ;
 txt_your_price = "Aapkey Liye" ;
txt_In_Store_Price = "In Malls";
</cfscript>

<!---<cfset welcome_bottom = "आपका स्वागत है हमरी वेबसाइट! यह 14 साल से भी  " />--->
</cfif>
  <cfparam default="centerpage" name="url.flavour" type="string" />
  <cfset selection =  url.flavour />

<cfdirectory action="list" directory="#application.rootfolder#/images/#selection#/" filter="*.jpg" name="pics" type="file"  />
<cfset k = arraynew(1) />
 <cfquery datasource="sptm" name="coll">
	select   * from collection_id_map where status = 'active' and start_date >= #now()# and end_date >=#now()#
</cfquery>
<cfif coll.recordcount>
<cfquery datasource="sptm" name="pics">
	select   * from centerpics where collection_id = coll.collection_id and status = 'active'
	</cfquery>
	<cfelse>
<cfset coll.link_to_page = "" />
<cfquery datasource="sptm" name="pics">
	select   * from centerpics where  status = 'active'
	</cfquery>
</cfif>
<!--- <cfdump var="#pics#" /> --->
<cfoutput>
<script language=JavaScript1.2 type=text/javascript >
<!--
<cfset i_count = 0 />
var i_count = #i_count#;

var pics_array = [
<cfloop query="pics">
'#LOCATion#/#pics.name#',
<cfset i_count = i_count + 1 />
</cfloop>
'/images/centerpage/silver_jewelryview.jpg'];
var text_array = [
<cfloop query="pics">
'<cfif len(text)><cfif len(link_to_page)><a style="color:inherit" href="#link_to_page#"><cfelseif len(coll.link_to_page)><a style="color:inherit" href="#coll.link_to_page#"></cfif>#text#<cfif len(link_to_page) or len(coll.link_to_page) ></a></cfif></cfif>',
<cfset i_count = i_count + 1 />
</cfloop>
'silver Jewelry.jpg'];

function change_image()
{
	document.getElementById("changing_image_img").src = pics_array[i_count];
	i_count++;
    if (i_count > #i_count#)
	i_count = 0 ;
	return;
}
/* slideshow working hence not starting change_image function 
 * 
 setInterval(change_image,3000);
*/
// (C) 2000 www.CodeLifter.com
// http://www.codelifter.com
// Free for all users, but leave in this  header
// NS4-6,IE4-6
// Fade effect only in IE; degrades gracefully

// =======================================
// set the following variables
// =======================================

// Set slideShowSpeed (milliseconds)
var slideShowSpeed = 5000

// Duration of crossfade (seconds)
var crossFadeDuration = 3
</cfoutput>
// Specify the image files
var Pic = new Array(); // don't touch this
// to add more images, just continue
// the pattern, adding to the array below
var Pic_text = new Array();
<cfset i_count = 0 />
<cfoutput query="pics" startrow="1" maxrows="12">
Pic[#i_count#] = '#replace(location,"\","/","All")#/#pics.name#';
<cfset i_count = i_count + 1 />
</cfoutput>
<cfset i_count = 0 />
<cfoutput query="pics" startrow="1" maxrows="12">
Pic_text[#i_count#] = '<div style="text-decoration:#pics.text_decoration#;text-align:center;border:#pics.border#;color:###pics.font_color#;background-color:###pics.bgcolor#;-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=#pics.opacity#);filter: alpha(opacity=#pics.opacity#);position:relative;opacity:#pics.opacity#"><cfif len(link_to_page)><a href="#link_to_page#"><cfelseif len(coll.link_to_page)><a href="#coll.link_to_page#"></cfif>#text#<cfif len(link_to_page) or len(coll.link_to_page) ></a></cfif></div>';
<cfset i_count = i_count + 1 />
</cfoutput>

// =======================================
// do not edit anything below this line
// =======================================

var t
var j = 0
var p = Pic.length

var preLoad = new Array()
for (i = 0; i < p; i++){
   preLoad[i] = new Image()
   preLoad[i].src = Pic[i]
//alert(Pic[i]);
}

function runSlideShow(){
   if (document.all){
   	  document.getElementById('SlideShow').style.filter="blendTrans(duration=2)"
      document.getElementById('SlideShow').style.filter="blendTrans(duration=crossFadeDuration)"
      document.getElementById('SlideShow').filters.blendTrans.Apply()      
   }
   document.getElementById('SlideShow').src =  preLoad[j].src
   document.getElementById('center_pic_text').innerHTML =  Pic_text[j];
//alert(document.getElementById('center_pic_text').innerHTML);   
   if (document.all){
      document.getElementById('SlideShow').filters.blendTrans.Play()
   }
   j = j + 1
   if (j > (p-1)) j=0
   t = setTimeout('runSlideShow()', slideShowSpeed)
}
-->
</script>

<!----display starts ---->
<cfif session.mail is application.admin_email>
	<a href="admintools/centerpics.cfm">Edit</a>
	</cfif>
	<a href='/jewelry-sale.cfm>LABOR DAY SALE</a>
<div id="changing_image" style="position:relative;">
 <a href=gem-stone-jewelry.cfm>
 <img ide="changing_image_img" id="SlideShow" src="http://www.semiprecious.com/images/centerpage/silver_jewelryview.jpg" style="relative;z-index:0;display:inline;"   width="625px;"  border=0 alt='gemstone sterling silver jewelry'></a>
<div style="font-weight:1600;font-size:3.6em;left:10px;position:absolute;;top:0px;text-align:center;width:100%;z-index:3;" id="center_pic_text"></div>
 </div>
<cfelse>
<script language=JavaScript1.2 >
<!--
function runSlideShow(){
	return;
} 
-->
</script>
<cfscript>
 welcome_bottom = "We have been supplying authentic gemstone sterling silver jewelry, beads and healing crystals at wholesale prices to small and medium retail stores and resellers since 1996. We source our gemstones and beads from highly reputed manufacturers and suppliers and all our jewellery is handcrafted by skilled artisans in India. India has a long and respected tradition of manufacturing silver and gold gemstone jewelry. We have a huge collection of silver gemstone necklaces, pendants, rings, earrings, bracelets, brooches, cuff links both for women and men at very competitive wholesale prices. We also manufacture silver jewelry on special customized orders." ;
 txt_your_price = "Wholesale" ;
txt_In_Store_Price = "In Stores:";
</cfscript>

 </cfif>
<div class="justified_text" id="announcement">
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
</div>
<div align="right" class="form_heading"><span style="margin-left:2"><a accesskey="F" class="login_link" href="/marketing/testimonies.cfm">See More Testimonials ...</a></span>
<a accesskey="F" class="login_link" href="marketing/feedback.cfm">and share your experience too</a>&nbsp; 
</div>
 <cfif accouncementhome.recordcount gt 0> ...
	<br /> <font color=brown><b><cfoutput>#accouncementhome.description#. Click <a href=#accouncementhome.linkto#>here</a>.</cfoutput></b></font>
  
	 </cfif>
	 </div>
  <div id="best_sellers">
<div class="jewelry_hub_home" style="background-image:url('/headhunting/images/hash.gif');" >
<div align="center" style="background:none repeat scroll 0 0 #CF8FCE;
color:white;width:95%;
font-family:serif;
font-size:1.8em;">
Our Best Sellers
</div>	
<cfloop list="#cats#" index="cat_i" >
<cftry>
<cfoutput query="good_snaps_#cat_i#" maxrows="1">
	<div class=jewelry_box_home >
    
	    	<div class=heading> 
		    	<div class=URL> 
				<a href="/gemstone_jewelry_gallery.cfm?category=#cat_i#" class="side_link" >#cat_i#</a>
							<cfset img = "http://www.semiprecious.com/images/#cat_i#/thumb/#newitem#.jpg" />
			
			</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content" >
			<div class="big_image" style="display:block;text-align:center;margin-left:30px;border-left:1px ##DDD dotted;">
			     	
				<a href="/detail.cfm?newitem=#newitem#" >
								 <img src="#img#" alt="gemstone in silver" /></a>
						</div>
				</div>			  
				
			<div class="category_description" style="height:50px;margin-bottom:1px;display:block;width:170px; white-space:pre-line;" >
				#subcat# #cat_i# in #color#&nbsp;<br />#grouping# #style#</div>
<div class="	retail_price">
				#txt_In_Store_Price#:&nbsp;#format(value_convert(1)*7.12*basecost/(value_convert(application.exchangerate)))#
			   <!---[<a href="/gemstone_jewelry_gallery.cfm?category=#cat_list#" >More #cat_i#</a>]--->
 
		    	
		</div>
				<div class="reg_price" style="margin-bottom:4px;">
				<a href="/detail.cfm?newitem=#newitem#" class="side_link" >#txt_your_price#:&nbsp;#format(wprice)#</a>
			   <!---[<a href="/gemstone_jewelry_gallery.cfm?category=#cat_list#" >More #cat_list#</a>]--->
 
		</div>
</div>
	</cfoutput>	
	<cfcatch type="any">
	</cfcatch>
	</cftry>
	</cfloop>
	</div><!--- best pics --->
	
	</div>
	<cfoutput>
	
<div id="customer_info">
 <div class="welcome_shipping" >
#WELCOME_BOTTOM#
<br />
	<span class="single_row rowb">		 We ship FPO, APO, internationally and accept no-questions asked returns up to 30 days!</span> 
</div><div  class="birthstone" style="clear:left;margin:20px 2px;;text-align:justify;" >
    <a href=#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))# Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
 Also, next months - <a href='#lcase(monthasstring(dateformat(dateadd("M",1,now()),"m")))#-birthstone.cfm'>#monthasstring(dateformat(dateadd("M",1,now()),"m"))# Birthstone Jewelry</a>
  
 </div>
</cfoutput>
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
          </tr>
        </table>
         </div>
		 <div id="content_">
 <span class="details">Stone Facts:</span> <a href="/healing_properties.cfm" class="headeranchor">Healing</a> 
        | <a href="/physical_chemical_properties.cfm" class="headeranchor">Physical 
        Chemical</a> <span > | </span> <a href="/origin_history.cfm" class="headeranchor">History</a><span > 
        | </span><a href="/geographical_deposits.cfm" class="headeranchor">Geology</a><span > 
        | </span><a href='/agate.htm' class="headeranchor"> All By Stone</a>
		</div>
		  --->
    <div id="paymodes"><strong>Payment 
        Modes: PayPal, Credit cards, Money Order, Check, Cash on Delivery (COD)</strong>
    </div>
      <div class="row2" style="text-align:center;"   >You can also order by phone<strong><cfoutput>#Application.tollfree#</cfoutput></strong> (USA)
	  </div>
</div>


