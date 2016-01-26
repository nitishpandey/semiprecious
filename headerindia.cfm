<link rel="stylesheet" type="text/css" href="/style.css" />
<script src="/js/html5.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/js/jcarouselLite.js"></script>

<script>
jQuery(document).ready(function($) {
	$("#mySlideshow2 .SliderImg").jCarouselLite({
		btnPrev: ".prev",
		btnNext: ".next",
		/*this makes it a true carousel rather than a slideshow*/
		circular: true,
		visible: 5,
		scroll: 5
	});
	$("#mySlideshow .SliderImg").jCarouselLite({
		btnPrev: ".prev",
		btnNext: ".next",
		/*this makes it a true carousel rather than a slideshow*/
		circular: true,
		visible: 5,
		scroll: 5
	});
	
	$("#banner .banner").jCarouselLite({
		//btnPrev: ".prev",
		//btnNext: ".next",
		/*this makes it a true carousel rather than a slideshow*/
		circular: true,
		visible: 1
		//auto:true,
		//speed: 3000
	});
});
</script>

<cfswitch expression="#cgi.SERVER_NAME#">
<cfcase value="www.forcesofindia.com">
<div style="border:2px gray solid;background-image:url(/headhunting/images/hash.gif);width:930px;height:120px;"><h1>Welcome To Jewelry From FOI!</h1>
<div> {Display of cart etc. goes here, look controlled by conditionally chosen css} Your Cart <cfoutput>#format(session.grandtotal)#</cfoutput>
</div>
</div></cfcase>

<cfdefaultcase>
	<cfparam name="session.name" default="" type="string" />
    <cfset vQty = 0>
				<cftry>
               <cfif session.cartitem[1][1] >
                <cfloop index="vCount" from="1" to="#ArrayLen(session.cartitem)#">
                    <cfset vQty = vQty + session.cartitem[vCount][4] >
                   
                   </cfloop>
				   </cfif>
				     <cfcatch type="any">
				   <cfset session.grandtotal = 0 />
				   </cfcatch>
				   </cftry>
<cfparam name='mobile' default='no'>				   
<script type="text/javascript" src="/js/dmenu.js"> </script> 
	<!-- 
	 
	<script type="text/javascript" src="/js/mootools.js" >
   </script> 
	<script type="text/javascript" src="/js/menuopacity.js" >
   </script>  -->


<script language="JavaScript" type="text/javascript">
	 
	
<!-- Copyright 2003, Sandeep Gangadharan 

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
<!--<style  type="text/css"   >
.form_heading {
background-color:darkorange;
color:white;
border-bottom:dashed 1px black;
margin:2px;
}
.green_bg {
    background: url("/images/main_bgs.png") repeat-x scroll 0 -459px transparent;
    color: white;
   
}
.green_bg:hover,.side_hd:hover {
    background: url("/images/main_bgs.png") repeat-x scroll 0 -444px transparent;
    color: orange;
}
#banner {
 background: none repeat scroll 0 0 #FFFFE0;
    border: 2px ridge brown;
    color: black;
    font-weight: 700;
    height: 40px;
    margin: 12px;
    padding-left: 25px;
    padding-top: 8px;
    width: 80%;
	}
a.side_link, .reg_price {
    color: #fa6010;
    font-size: 12px;
    font-weight: bold;
    text-decoration: none;
    text-transform: capitalize;
}
.reg_price {
color:green;
}

#uppercontent {
 background: url("/webimages/grayroundedheaderbg.png") no-repeat scroll 0 0 transparent;
    color: #3F4C6B;
    text-align: left;
    width: 947px;
}

#uppercontent td { 	
vertical-align:middle;
text-align:left;
}

body {
/* background: url("/webimages/canvasgrayblack.gif") repeat scroll 0 0 #575757;
*/
    color: #6C3D60;
}
#container2 {
  background: url("/webimages/bg_maincontent.png") repeat-y scroll 0 0 transparent;
  	overflow:hidden;
	width:947px;
	
   }
div#mainfooter {
height:120px;
overflow:hidden;	
 background: transparent;
    padding-left: 11px;
    padding-top: 2px;
	overflow:hidden;
	width:930px;
	padding-right:4px;
	color:orange;
}
#mainfooter div{
 background:transparent;
 width:90%;
}
#mainfooter a {
color:purple;
}

#container1{
background:transparent;
}
#itemdetails {
width:766px;
float:left;
margin-left:11px;
background:white;
}
#lllmmm , #leftmenus, #semiprecious_gallery{
background:#EEEEEE;
margin-bottom:4px;
margin-top:1px;
margin-left:4px;
}
#LeftColorDisplay {
background:white;
}
#semiprecious_gallery{
background:white;
margin-left:10px;
}
#lllmmm {
margin-left:11px;
}
</style>-->
<div id="uppercontent">
<!---<table border="0" cellpadding="0" cellspacing="0" style="margin-left:9px;" >--->
<!--- <table border="0" cellpadding="5" cellspacing="0" style="display:table" width="928px"> --->
	<cfif cgi.server_name contains "wholesale">
        <cfinclude template="/wholesale-jewellery/indiaheader2.cfm">
    <cfelse>
    	<cfoutput>
        
                <article class="wrapper">
                        <header class="header">
                            <h1 class="logo"><a href="http://www.semiprecious.com">Semi Precious</a></h1>
													<h5>Search / Item ID </h5>
													  <div class="searchBox">
                                <form method="post" action="/silver_jewelry_gallery.cfm">
                          
                           <div>
                                        <input type="text" value="" class="search-input" name="search_criteria"/>
                                        <input type="submit" value="&nbsp;" class="search-btn" name="submit" />
                                   </div>
                                </form>
                            </div><!--Search Box Ends-->
                            <div class="indiaFlag">
                                <img src="/INDIA//images/flag.jpg"><br>Semiprecious.com NOW IN INDIA!
                            </div>
                            <nav class="topNav">
                                <ul>
                                    <!---<li><a href="http://www.semipreciouswholesale.com">Wholesale</a></li>--->
                                    <li><a href="/crm/trackorder.cfm" id="ordertrack">Order Tracker</a></li>
                                    <cfif len(session.mail)>
                                        <li><a href="/login.cfm">My Account</a></li>
                                        <li class="sign"><a href="/logout.cfm">Logout</a></li>
                                    <cfelse>
                                        <li><a href="/simpleloginform.cfm">Login</a></li>
                                        <li><a href="/apply.cfm">Signup</a></li>
                                    </cfif>
																		<li><a href="/contactus.cfm">Contact Us</a></li>
                                </ul>
                                
                            </nav><!--Top Navigation Ends-->
                            <div class="clr"></div>
                            <cfif IsDefined('session.name') AND len(session.name)>
                                <div class="welcome">
                                    <p>
                                        Hi ! #session.name#
                                    </p>
                                </div>
                            </cfif>
                            <cfif not cgi.script_name contains "cart.cfm">
                                <cfoutput>
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
                                    <div class="jewelBox">
                            						 <a title="Check cart and start checkout"  href="/#session.cart#?country=#ucase(session.address.country_code)#&amp;php=1.2210&amp;cartid=#session.cartid#" style="text-decoration:none;color:black;"><span class="box"></span></a>	
                                				 <p><a title="Check cart and start checkout"  href="/#session.cart#?country=#ucase(session.address.country_code)#&amp;php=1.2210&amp;cartid=#session.cartid#" style="text-decoration:none;color:black;">Cart (#vQty#)</a></p>
                                
                            				</div><!--Jewel Box Ends-->
                                </cfoutput>
                            </cfif>
                            <div class="topMenu" align="left" style="top:39px">
                        <cfif reFindNoCase("android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0>
                            <cfset mobile="yes">
                        <cfelse>
                            <cfif len(session.bulkbuyer.id)>
                                 <cfinclude template ='/wholesale-jewellery/wholesalemenu.html'>
                            <cfelse>
                                <cfinclude template ='/topmenu.cfm'>
                            </cfif>
                        </cfif>
                        </div>
                        </header>
                    </article>
        
            <!--- <tr>
				<td align="center" valign="top" class="header_bg"><!--header starts-->
                    <table width="926px" border="0" cellspacing="0"  style="display:table" cellpadding="0" >
                        <tr>
                            <td align="center" cellpadding=2>
                                <span class="side_link" >
                                    Ultra Chic Authentic Semiprecious Jewelry First Time in India. We ship world wide, now shipping within India too. In business since 1996.<br>
                                </span>
                            </td>
                                    </tr> 
                                </table>
                       	 	</td>
                    	</tr>
                	</table>
            	</td>
        	</tr> --->
		</cfoutput>
	</cfif> 
</div>


</cfdefaultcase>
</cfswitch>
