<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<cfparam name="inheader" default="" />

<cfparam name="title" default="Buy semiprecious stones, beads, jewelry" />
<cfoutput>

#inheader#<title>
#title#
</title>
</cfoutput>
<meta http-equiv="Content-Type" content="text/html; utf-8">


    <script src="https://www.google.com/jsapi"></script><script>google.load("mootools", "1.2.1");</script>



<!--[if gte IE 6]>
            	<link href="/css/dcverticalmegamenu - ie.css" rel="stylesheet" media="screen" charset="utf-8"/>
            <![endif]-->
<![if !IE]>



<link href="/css/dcverticalmegamenu.css" rel="stylesheet"
	type="text/css" />
<![endif]>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type='text/javascript' src='/js/jquery.hoverIntent.minified.js'></script>
<script type='text/javascript'
	src='/js/jquery.dcverticalmegamenu.1.3.js'></script>
<script type="text/javascript">
	$(document).ready(function($) {

		$('#mega-3').dcVerticalMegaMenu({
			rowItems : '4',
			speed : 'fast',
			effect : 'show',
			direction : 'right'
		});

	});
</script>

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
<style type="text/css">
<!--
.copyright {
	font: 9px "Times New Roman", Times, serif;
	color: #CCCCCC;
}
-->
</style>

<link rel="stylesheet" type="text/css" href="/style.css" />
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/imageswap.js"></script>
<script type="text/javascript" src="/js/dmenu.js">
</script>
<script src="/js/html5.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/js/jcarouselLite.js"></script>

<script>
jQuery.noConflict()
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
	});
});



</script>

<!--- <script type="text/javascript" src="/js/mootools.js"></script>
<script type="text/javascript" src="/js/elSelect.js"></script> --->
<!---
<link rel="STYLESHEET" type="text/css" href="/theme/style.css">--->


<script language="JavaScript" type="text/javascript">


<!--

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
function fnSelCountry(country){
	if(country.value=='India'){
		document.frmHeaderCountries.action = '/setcountryasindia.cfm';
	}
	else{
		document.frmHeaderCountries.action = '/setcountryasnotindia.cfm';
	}
	//document.frmHeaderCountries.hdnHeaderCountry.value = country.value;
	document.frmHeaderCountries.submit();
}
// -->
</script>



</head>
<body style="margin-top:0;"  >
<div align=center>
    <div id="container1"  >
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
			<cfmail to="stacyaup@gmail.com" from="cs@semiprecious.com" subject="header.cfm not reverse "  type="html">
  					#cfcatch.detail#, #cfcatch.message# #cgi.script_name#
  				</cfmail>
		</cfcatch>
</cftry>

<!---  <cfif CGI.SERVER_NAME contains "wholesale.com">

<cfheader statuscode='301' statustext='Moved permanently'>
<cfheader name='Location' value=''>

  <cfabort />

 </cfif>
--->
<cfparam name="category" default="all">
<cfparam name='mobile' default='no'>
<cfquery name="getHeaderCountries" datasource="gemssql"  cachedwithin="#createTimespan(2,2,13,0)#">
	SELECT 	DISTINCT country
    FROM	ltbshipping
</cfquery>

<cfif cgi.server_name contains "wholesale">
	<cfinclude template="/wholesale-jewellery/header2.cfm">
<cfelse>
  	<cfif cgi.server_name contains '127'>
    	<cfinclude template="/semiprecious/header2.cfm">
  	<cfelse>
		<cfoutput>
            <article class="wrapper">
                <header class="header">
                   <h1 class="logo"><a href="/">SemiPrecious</a>
                  <!---   <h4>Shipped Worldwide<br>Free US Shipping Over $50</h4>--->
				</h1><h1><span style="position:absolute;top:0;left:40%;float:left;"><a href="/jewelry-sale.cfm"><img src="/holidays/blackfridayjewelrysale.jpg" height="70px" border="0"></a></span>
</h1>

                    <!---<cfif Not IsDefined('session.country') OR (IsDefined('session.country') AND session.country neq 'India')>
                        <div class="countryDropDown">
                            <form method="post" name="frmHeaderCountries">
																<!--<input type="hidden" name="hdnHeaderCountry" value="">---
                                <select name="selHeaderCountries" onchange="fnSelCountry(this)">
                                    <option value="-1">Choose Country</option>

                                    <cfloop query="getHeaderCountries">
                                        <option value="#country#">#country#</option>
                                    </cfloop>
                                </select>
                            </form>
                        </div>
                    <cfelse>--->
		<!--- TODO:Nitish:shutting this till a search system is put in place
                    	<h5>Search or ItemID </h5>
                    <!---</cfif>--->
                    <div class="searchBox">
                        <form method="post" action="/silver_jewelry_gallery.cfm">
                            <div>
                                <input type="text" value="" class="search-input" name="search_criteria"/>
                                <input type="submit" value="&nbsp;" class="search-btn" name="submit" />
                            </div>
                        </form>
                    </div><!--Search Box Ends-->
									---->

                    <nav class="topNav">
                        <ul>
                            <!---<li><a href="http://www.semipreciouswholesale.com">Wholesale</a></li>--->
                            <li><a href="/crm/trackorder.cfm" id="ordertrack">Order Tracker</a></li>
                            <cfif len(session.mail)>
                                <li><a href="/login.cfm">My Account</a></li>
                                <li><a href="/logout.cfm">Logout</a></li>
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
                                #session.name#
                            </p>
                        </div>
                    </cfif>
                    <cfif not cgi.script_path contains "cart.cfm">
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
                                <p><a title="Check cart and start checkout"  href="/#session.cart#?country=#ucase(session.address.country_code)#&amp;php=top_righ&amp;cartid=#session.cartid#" style="text-decoration:none;color:black;">Cart (#vQty#)</a></p>

                            </div>
                            <!--Jewel Box Ends-->
                        </cfoutput>
                    </cfif>
										<div class="topMenu" align = "left">
                <cfif reFindNoCase("android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0>
                    <cfset mobile="yes">
                <cfelse>
                    <cfif len(session.bulkbuyer.id)>

                     <div style="z-index:12">  <cfinclude template ='/wholesale-jewellery/wholesalemenu.html'></div>

                    <cfelse>
										<!---<cfcache timespan="1">--->
                        <cfinclude template ='/topmenu.cfm'>
												<!---</cfcache>--->
												</cfif>
                </cfif>
                </div><p>&nbsp;<p>



                </article>
        	</cfoutput>
        </cfif>
    </cfif>



