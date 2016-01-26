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
<table border="0" cellpadding="5" cellspacing="0" style="display:table" width="928px">
	<cfif cgi.server_name contains "wholesale">
        <cfinclude template="/wholesale-jewellery/indiaheader2.cfm">
    <cfelse>
    	<cfoutput>
            <tr>
				<td align="center" valign="top" class="header_bg"><!--header starts-->
                    <table width="926px" border="0" cellspacing="0"  style="display:table" cellpadding="0" >
                        <tr>
                            <td width="50px">
                                <a href="http://www.semiprecious.com">
                                    <img src="https://#session.tld#/images/logos/logostone.jpg" width=40 height="60" ALT="semiprecious brand logo">
                                </a>
                            </td>
                            <td align=left>
                                <a href="http://www.semiprecious.com">
                                    <img src="https://#session.tld#/images/logos/logotext.jpg"  alt="semiprecious gemstone jewelry">
                                </a>
                                <div>
                                <i>Everything Semiprecious</i>
                                </div>		
                            </td>
                            <td align="center" cellpadding=2>
                                <span class="side_link" >
                                    Ultra Chic Authentic Semiprecious Jewelry First Time in India. We ship world wide, now shipping within India too. In business since 1996.<br>
                                </span>
                            </td>
                            <td width="220" align="left" valign="bottom">
                                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                                    <tr valign="bottom">
                                        <td align="right">
                                            <cfif not cgi.script_name contains "cart.cfm">
                                            	<img src="https://#session.tld#/images/dots1.gif" style="display:inline;" />
                                                <a href="https://#cgi.SERVER_NAME#/#session.cart#">
                                                    <img src="https://#session.tld#/images/add_to_cart_icon.jpg" border=0 
                                                    align="absmiddle" width="20px" height="20px" alt="start checkout" />
                                                </a>
                                                Cart &rarr; Qty:
                                                <span id="qty_in_cart">
                                                    #vQty#
                                                </span>
                                                &nbsp;Amt:
                                                <span id="cart_value">
                                                    #format(session.grandtotal)#
                                                </span>
                                            <cfelse>
                                                <span class="reg_price">
                                                    Cart Review
                                                </span>
                                            </cfif>
                                        </td>
                                    </tr> 
                                    <tr valign="bottom">
                                        <td align="right">
                                            <cfif len(session.name)>
                                            	<a href="/login.cfm" class="login_link">
                                                    My Account
                                                </a> 
                                                (#session.name#)<br>
                                            	<a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">
                                                	TRACK ORDER
                                                </a>| 
                                                  
                                                <a href="/logout.cfm" class="login_link">
                                                	Logout
                                                </a>
                                            <cfelse>
                                            	<a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">
                                                	Track Order
                                                </a>| 
                                                <a href="/simpleloginform.cfm" class="login_link">
                                                    Login
                                                </a>|&nbsp;
                                                <a href="/apply.cfm" class="login_link">
                                                    Sign up
                                                </a>
                                            </cfif> 
                                            <!--|  <a href="/crm/trackorder.cfm" id="ordertrack" class="login_link">Track Order</a>
                          --> 
                          <!--- hiding this till applying and member pages are ready for india centric display
                          <br><span class="newuser_link"><strong><a href=/apply.cfm> New User Signup (optional)</a></strong></span>---><!---a href="wholesale_login.cfm" class="login_link">WholeSale</a>--->
                                        </td>
                                    </tr>
                                </table>
                       	 	</td>
                    	</tr>
                	</table>
            	</td>
        	</tr>
		</cfoutput>
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
    	<td  align="left" valign="top"><a name="jewelry_to"></a>
			<div style="height:24px;width:930px;padding-left:4px;">  <!--- this is required because the topmenu is
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
            </cfif>
		</div>
	</td> 
	</tr>
</table>
</div>


</cfdefaultcase>
</cfswitch>