<cfparam name="category" default="pendants">
<cfparam name="item1" default="0">
<cfparam name="item2" default="0">
<cfparam name="item3" default="0">

<cfquery name="getwholesale" datasource="gemssql">
  Select top 100 newitem, cat, subcat as stone, subcat2 as stone2, style, supplier, color, size, weight, left(items.description,75) as description, items.inventory, price, saleprice,
    wholesaleprice,
  status, dimensions, material, imagelink from items where  cat='#category#' and
 style='silver setting' and items.inventory>0 and storage <>'prashantRR'   and storage not like 'OC-%' order by datetaken desc, price
</cfquery>

<cfset counter=0>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<cfoutput>
<title>Wholesale Jewelry 92.5% Sterling Silver manufacturer. Semiprecious Gemstone Wholesale</title>
<META NAME="Description" CONTENT="Manufacturer of #getwholesale.stone# #getwholesale.cat#, 92.5% Sterling Silver. Our items are mostly handmade.">
<META NAME="Keywords" CONTENT="Manufacturer of #getwholesale.stone# #getwholesale.cat# in Sterling Silver, handmade jewelry">
</cfoutput>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="http://www.essentialsjewelry.com/css/stylesheet.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style14 {font-size: 14px}
.style15 {
	color: #000000;
	font-size: 18px;
}
.style17 {
	color: #000000;
	font-weight: bold;
}
.style19 {color: #000000}
-->
</style>
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf(</d);
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
</head>
<body><style type="text/css">
@font-face {
    font-family: 'OswaldBold';
    src: url('http://semipreciouswholesale.com/fonts/Oswald-Bold.ttf') format('truetype');
}
@font-face {
    font-family: 'OswaldLight';
    src: url('http://semipreciouswholesale.com/fonts/Oswald-Light.ttf') format('truetype');
}
@font-face {
    font-family: 'OswaldRegular';
    src: url('http://semipreciouswholesale.com/fonts/Oswald-Regular.ttf') format('truetype');
}
@font-face {
    font-family: 'PTSansWebBold';
    src: url('http://semipreciouswholesale.com/fonts/PT_Sans-Web-Bold.ttf') format('truetype');
}
@font-face {
    font-family: 'PTSansWebBoldItalic';
    src: url('http://semipreciouswholesale.com/fonts/PT_Sans-Web-BoldItalic.ttf') format('truetype');
}
@font-face {
    font-family: 'PTSansWebItalic';
    src: url('http://semipreciouswholesale.com/fonts/PT_Sans-Web-Italic.ttf') format('truetype');
}
@font-face {
    font-family: 'PTSansWebRegular';
    src: url('http://semipreciouswholesale.com/fonts/PT_Sans-Web-Regular.ttf') format('truetype');
}
body, html
{
	margin:0;
	padding:0;
}
#header_top
{
	width:100%;
	background:#111111;
	color:#fff;
	min-height:30px;
	 
}
p
{
	margin:0;
	padding:0;
}
#header_top #first_note
{
	float:left;
	font-family:Arial, Helvetica, sans-serif;
	width:33.33%;
	font-size:12px;
margin-top:5px;
	
	
}
#header_top #second_note
{
	float:left;
	 font-family: 'PTSansWebBold';
	 
	 font-size:14px;
	 width:33.33%;
	 margin-top:5px;
}
#header_top #third_note
{
	float:right;
	font-family:Arial, Helvetica, sans-serif;
	
	font-size:12px;
margin-top:5px;
	width:33.33%;
	text-align:right;
}
#header_top #first_note p
{
	margin-left:30px;
}
#header_top #third_note p
{
	margin-right:30px;
}
#navigation
{
	clear:both;
	background:#f5f7fa;
	height:60px;
	width:100%;
	border-bottom:1px solid #e6e9ed;
}
#logo
{
	width:200px;
	float:left;
	margin-left:20px;
	margin-top:12px;
}
#menu
{
	float:left;
	margin-top:20px;
}
#menu a
{
	color:#111111;
	font-family: 'PTSansWebBold';
	text-decoration:none;
	margin-right:30px;
	
}
#navigation_right
{
	float:right;
	font-family: 'PTSansWebBold';
}
#callus
{
	margin-top:17px;
	float:left;
	margin-right:30px;
}
#cart_icon
{
	float:left;

	margin-top:15px;
	margin-right:20px;
}
#banner
{
	clear:both;
	background:url(images/banner.jpg) no-repeat;
	background-size:cover;
	height:443px;
	width:100%;
}
#banner_text
{
	font-family: 'PTSansWebRegular';
	margin-top:150px;
	margin-left:10%;
	float:left;
}
#banner_top
{
font-size:25px;	
}
#banner_line
{
	border-bottom:1px solid #111;
}
#banner_bottom
{
	text-align:center;
}
#slogan
{
	background:#ecf9f8;
	width:100%;
	margin:10px 0 10px 0;
	min-height:150px;
}
#slogan p
{
font-family: 'PTSansWebRegular';	
color:#979090;
text-transform:uppercase;
font-size:17px;
margin:0px auto;
padding:30px 0 30px 0;
width:50%;
text-align:center;

}
#rings_column
{
	width:55%;
	height:350px;
	background:#e5f2fa url(images/rings_bg.png) no-repeat;
	background-position:bottom;
	float:left;
}
#rings_text
{
	 font-family: 'OswaldLight';
	 width:100%;
	 text-align:center;
	 	background:url(images/underline_bg.png) no-repeat;
	background-position:center;
	 margin-top:30px;
	 float:left;
}
#rings_text a
{
	color:#111;
	text-decoration:none;
	font-size:25px;


}

#pendants_column
{
	width:44%;
	height:350px;
	background:#edecf1 url(images/pendants_bg.png) no-repeat;
	background-position:top;
	float:left;
	margin-left:1%;
}
#pendants_text
{
	 font-family: 'OswaldLight';
	 width:100%;
	 text-align:center;
	 	background:url(images/underline_bg.png) no-repeat;
	background-position:center;
	 margin-top:210px;
	 float:left;
}
#pendants_text a
{
	color:#111;
	text-decoration:none;
	font-size:25px;
}
#clear
{
	clear:both;
	width:100%;
	height:10px;
}

#earrings_column
{
	width:59%;
	height:350px;
	background:#f8f8f8 url(images/earrings_bg.png) no-repeat;
	background-position:top;
	float:left;
	margin-right:1%;
}
#earrings_text
{
	 font-family: 'OswaldLight';
	 width:100%;
	 text-align:center;
	 	background:url(images/underline_bg.png) no-repeat;
	background-position:center;
	 margin-top:220px;
	 float:left;
}
#earrings_text a
{
	color:#111;
	text-decoration:none;
	font-size:25px;


}


#bracelets_column
{
	width:40%;
	height:350px;
	background:#e5f2fa url(images/bracelets_bg.png) no-repeat;
	background-position:bottom;
	float:left;
	
}
#bracelets_text
{
	 font-family: 'OswaldLight';
	 width:100%;
	 text-align:center;
	 	background:url(images/underline_bg.png) no-repeat;
	background-position:center;
	 margin-top:30px;
	 float:left;
}
#bracelets_text a
{
	color:#111;
	text-decoration:none;
	font-size:25px;
}
#footerline
{
	border-bottom:5px solid #111;
	clear:both;
	width:100%;
	height:20px;
}
#footer
{
	width:100%;
	clear:both;
	min-height:170px;
	background:#fff;
	padding-bottom:20px;
}
#footer_in
{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
	padding-top:20px;
	
}
#footer_col
{
	width:160px;
	height:130px;
	float:left;
	color:#111;
	font-family: 'PTSansWebRegular';
	font-size:13px;
	padding-left:20px;
	padding-right:19px;
}
#footer_col h5
{
	font-family: 'PTSansWebBold';
	margin:0;
	padding:0;
	font-size:13px;
}
#footer_col a
{
	color:#111;
	text-decoration:none;
}










#innercontent
  {
	  width:990px;
	  margin-right:auto;
	  margin-left:auto;
  }
  .excu
  {
	  color:#0080C0;
	  text-decoration:none;
	  opacity:1;
	  font-size:14px;
  }
  .excu:hover
  {
	  color:#333;
	  transition:all 0.3s ease;
	  font-size:14px;
  }
  #leftside a
  {
	  font-size:14px;
	 
  }
  #leftside a:hover
  {
	  font-size:14px;
	  
  }
  .enlarge
  {
	  color:#0080C0;
	  text-decoration:none;
	  opacity:1;
	  font-size:14px;
  }
  .enlarge:hover
  {
	  color:#333;
	  transition:all 0.3s ease;
  }
  #innercontent a img
  {
	  border:none;
	  border:1px solid:#CCC;
  }
  .stock_name
  {
	  clear:both;
  }
  .asterisk
  {
	  font-size:15px;
  }
  input[type=submit]
  {
	  background:#09C;
	  color:#fff;
	  border:none;
	  padding:5px 10px;
	  border-radius:5px;
  }
  #topline
  {
	  width:100%;
	  margin:0;
	  padding:0;
  }
  #toptag, #toptagh
  {
	  width:100%;
	  padding:0;
	  margin:0;
	  text-align:center;
  }
  #toptagh h1
  {
	  width:100%;
	  padding:0;
	  margin:0;
	  text-align:center;
  }
  #topline
  {
	  display:none;
  }
  .cart_block
  {
	  border-radius:5px;
	  text-align:center;
	  color:black; 
	  font-size: 1.2em; 
	  border:3px solid red;
	   width: 240px; 
	   padding: 10px;
	   font-family: 'Roboto', sans-serif;

  }
  .cart_block a
  {
	  color:#0080C0;
	  text-decoration:none;
  }
  .cart_block a:hover
  {
	  color:#333;
	  transition:all 0.3s ease;
  }
  .headings
  {
	text-align:center;  
  }
  .headings a
  {
	  color:#39C;
	 
	  font-size:16px;
  }
  #toptagh
  {
	  background:#fff;
  }










/* Smartphones (portrait and landscape) ----------- */
@media only screen 
and (min-device-width : 320px) 
and (max-device-width : 480px) {
body
{
	width:1024px;
}
}
/* Smartphones (landscape) ----------- */
@media only screen 
and (min-width : 321px) {
body
{
	width:1024px;
}
}

/* Smartphones (portrait) ----------- */
@media only screen 
and (max-width : 320px) {
body
{
	width:1024px;
}
}

/* iPads (portrait and landscape) ----------- */
@media only screen 
and (min-device-width : 768px) 
and (max-device-width : 1024px) {
body
{
	width:1024px;
}
}
@media only screen 
and (min-device-width : 1024px) {
body
{
	width:100%;
}
}
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

<cfloop query="getwholesale">

<cfset counter=counter+1>
<cfif item1 is 0><cfset item1="#newitem#"><cfset item1price=#decimalformat(wholesaleprice)#><cfset description1=#stone#&' '& #category#& '<br>' & #description#><cfset item1size=#size#> <cfif imagelink is not ""><cfset image1='#imagelink#'><cfelse><cfset image1='none'></cfif>
<cfelseif item2 is 0>
<cfset item2="#newitem#"><cfset item2price=#decimalformat(wholesaleprice)#><cfset description2=#stone#&' '& #category#& '<br>' & #description#><cfset item2size=#size#> <cfif imagelink is not ""><cfset image2='#imagelink#'><cfelse><cfset image2='none'></cfif>
<cfelseif item3 is 0><cfset item3="#newitem#"><cfset item3price=#decimalformat(wholesaleprice)#><cfset description3=#stone#&' '& #category#& '<br>' & #description#><cfset item3size=#size#><cfif imagelink is not ""><cfset image3='#imagelink#'><cfelse><cfset image3='none'></cfif>
</cfif>


	  <cfif counter is 3> 
      <tr>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
      </tr>
	  	   <tr>
	  	    <cfoutput>
			<td align="center"><cfif image1 eq 'none'>
			<img src="http://www.semiprecious.com/images/#cat#/thumb/#item1#.jpg"   border="0" />
			<cfelse>
			<img src="#image1#"   border="0" />
<br><b><font color=red>IGNORE SOLD SIGN, NOT SOLD!</font></b>
			</cfif>
			</td>
	  	     <td align="center"><cfif image2 eq 'none'>
			<img src="http://www.semiprecious.com/images/#cat#/thumb/#item2#.jpg"   border="0" />
			<cfelse>
			<img src="#image2#"   border="0" /><br><b><font color=red>IGNORE SOLD SIGN, NOT SOLD!</font></b>
			</cfif>
			</td>
	  	     <td align="center"><cfif image3 eq 'none'>
			<img src="http://www.semiprecious.com/images/#cat#/thumb/#item3#.jpg"   border="0" />
			<cfelse>
			<img src="#image3#"   border="0" /><br><b><font color=red>IGNORE SOLD SIGN, NOT SOLD!</font></b>
			</cfif>
			</td>
	  	   </cfoutput>
		   </tr>
    <tr >
        <td align="center" class="stone-main" style="position:relative;left:150px;border:1"><span class="stock_name">Code : :</span> <span class="prod-title"><cfoutput>#item1#</cfoutput></span><br />
            <span class="stock_name">Price : :</span> <span class="prod-title">$ <cfoutput>#item1price#</cfoutput> </span><span class="prod-title"></span><br />
            <span class="stock_name">Details : :</span><span class="prod-title"> <cfoutput>#description1# <cfif item1size neq ''><br>Size: #item1size#</cfif></cfoutput> &quot;</span>
			<div id="addtocart">
			<cfoutput>
			<cfif category is 'rings'>
			<a href='gemstone_wholesale_jewelry.cfm?sku=#item1#'><img src="http://www.semipreciouswholesale.com/images/zoom.jpg"></a>
			<cfelse>
			<a href='gemstone_wholesale_jewelry.cfm?sku=#item1#'><img src="http://www.semipreciouswholesale.com/images/zoom.jpg"></a> |
			<form name="addtocart" action="add_to_cart.cfm" method="post">
			<Input type="hidden" name="sku" value="#item1#">
			<Input type="hidden" name="itemprice" value="#item1price#"> 
	<input type="image" src="http://www.semipreciouswholesale.com/images/addtocart.jpg">
	</form>

			</cfif>
			</cfoutput>
			</div>
			
			</td>
        <td align="center" class="stone-main" style="position:relative;left:150px;border:1"><span class="stock_name">Code : :</span> <span class="prod-title"><cfoutput>#item2#</cfoutput></span><br />
            <span class="stock_name">Price : :</span> <span class="prod-title">$ <cfoutput>#item2price#</cfoutput> </span> <br />
            <span class="stock_name">Details : :</span><span class="prod-title"> <cfoutput>#description2#<cfif item1size neq ''><br>Size: #item1size#</cfif></cfoutput></span>
			<div id="addtocart">
			<cfoutput>
			<cfif category is 'rings'>
			<a href='gemstone_wholesale_jewelry.cfm?sku=#item2#'><img src="http://www.semipreciouswholesale.com/images/zoom.jpg"></a>
			<cfelse>
			<a href='gemstone_wholesale_jewelry.cfm?sku=#item2#'><img src="http://www.semipreciouswholesale.com/images/zoom.jpg"></a> |
			 <a href='add_to_cart.cfm?sku=#item3#&itemprice=#item2price#'><img src="http://www.semipreciouswholesale.com/images/addtocart.jpg"></a>
			</cfif>
			</cfoutput>
			</div></td>
        <td align="center" class="stone-main" style="position:relative;left:150px;border:1"><span class="stock_name">Code : :</span> <span class="prod-title"><cfoutput>#item3#</cfoutput> &quot;</span><br />
            <span class="stock_name">Price : :</span> <span class="prod-title">$ <cfoutput>#item3price#</cfoutput></span> <br />
            <span class="stock_name">Details : :</span><span class="prod-title"> <cfoutput>#description3# <cfif item1size neq ''><br>Size: #item1size#</cfif></cfoutput> &quot;</span>
			<div id="addtocart">
			<cfoutput>
			<cfif category is 'rings'>
			<a href='gemstone_wholesale_jewelry.cfm?sku=#item3#'><img src="http://www.semipreciouswholesale.com/images/zoom.jpg"></a>
			<cfelse>
			<a href='gemstone_wholesale_jewelry.cfm?sku=#item3#'><img src="http://www.semipreciouswholesale.com/images/zoom.jpg"></a> | <a href='add_to_cart.cfm?sku=#item3#&itemprice=#item3price#'><img src="http://www.semipreciouswholesale.com/images/addtocart.jpg"></a>
			</cfif>
			</cfoutput>
			</div>
			</td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
      </tr>
	  </cfif>
	  <cfif counter is 3>
	  <cfset counter=0>
	  <cfset item1="0">
	  <cfset item2="0">
	  <cfset item3="0">
	  </cfif>

</cfloop>
	  </table>