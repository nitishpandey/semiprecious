<cfparam name=wholesalejewelry default="/stock/sterling-silver-rings.html">
<cfparam name="multiplier" default="3.0">
<cfparam name="page1" default="">
<cfparam name="page2" default="">
<cfparam name="page3" default="">
<cfset page1=replace(replace(replace(getfilefrompath(wholesalejewelry), '-1.','.'),'-2.','.'),'-3.','.')>
<cfset newpage1="http://" & cgi.server_name & "/essentials/byphone.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page1#">
<cfset page2=replace(page1, '.html','-2.html')>
<cfset newpage2="http://www.semiprecious.com/essentials/byphone.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page2#">
<cfset page3=replace(page1, '.html','-3.html')>
<cfset newpage3="http://www.semiprecious.com/essentials/byphone.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page3#">
<cfset page4=replace(page1, '.html','-4.html')>
<cfset newpage4="http://www.semiprecious.com/essentials/byphone.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page4#">

<html>

<head>
 <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<link href="stylesheet.css" rel="stylesheet" type="text/css">
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
.style20 {color: #000000;
	font-weight: bold;
	font-size: 14px;
}
.style22 {color: #000000;
	font-weight: bold;
	font-size: 18px;
}
-->
</style>

</head><body>
<cfhttp url="http://www.essentialsjewelry.com/#wholesalejewelry#">
<cfset newcontent=cfhttp.filecontent>
<!--- price increase --->
<cfset PriceLocation=find('Price : :',newcontent)>
<cfif PriceLocation GT 0>
<cfloop condition="PriceLocation GREATER THAN 0">
<cfset oldprice=Trim(Mid(newcontent,PriceLocation+43,6))>
<cfif isnumeric(oldprice)>
<cfset newprice=decimalformat(oldprice*multiplier)>
<cfset newcontent=replace(newcontent,oldprice,newprice& '<br>Call 512 666 GEMS')>
</cfif>
<cfset PriceLocation=find('Price : :',newcontent,PriceLocation+15)>
</cfloop> 
</cfif>
<!--- price increase end--->
<cfset newcontent =RereplaceNocase(newcontent, '../images', 'http://www.essentialsjewelry.com/images','all')>
<cfset newcontant =RereplaceNocase(newcontent, '<img src="http://www.essentialsjewelry.com/images/NEW2.gif" width="35" height="15" />', 'Rare!','all')>
<cfset newcontent =RereplaceNocase(newcontent, '<a href="http://www.essentialsjewelry.com/', '<a href="http://www.semiprecious.com/essentials/','all')>
<cfset newcontent=replacenocase(newcontent, 'exporter','importer')>
<cfset newcontent=replacenocase(newcontent, 'india','Austin')>
<Cfset newcontent=right(newcontent, Len(newcontent)-Find('<body>',newcontent)-5)>
<cfset newcontent =REreplace(newcontent, 'www.semiprecious.com/essentials/', 'www.semiprecious.com/essentials/byphone.cfm?wholesalejewelry=',"all")>
<cfset newcontent =RereplaceNocase(newcontent, 'http://www.essentialsjewelry.com/images/title.gif', 'http://www.semiprecious.com/essentials/images/title.gif','all')>
<cfset newcontent=rereplace(newcontent, '../../http://','http://',"all")>
<cfset newcontent=rereplace(newcontent, '../http://','http://',"all")>

<cfset newcontent=rereplacenocase(newcontent, 'essentialls ','semipreciouswholesale.com ',"all")>
<cfset newcontent=rereplacenocase(newcontent, 'essentials ','semipreciouswholesale.com ',"all")>
<cfset newcontent=replace(newcontent,page2,newpage2)>
<cfset newcontent=replace(newcontent,page3,newpage3)>
<cfset newcontent=replace(newcontent,page4,newpage4)>
<cfset page1='"#page1#"'>
<cfset newcontent=replace(newcontent,page1,newpage1)>
<cfset newcontent=replace(newcontent,'925 silver','925 genuine silver')>
<cfset newcontent=replace(newcontent,' Essential ',' Semiprecious.com ')> 
<cfset newcontent=replace(newcontent,'925','92.5')>
<cfset newcontent=replacenocase(newcontent,'wholesale','wholesale Semiprecious')>
<cfset newcontent=replacenocase(newcontent,'jewelry','jewellery')>
<cfset newcontent=replacenocase(newcontent,'%','percent')>
<cfset newcontent=rereplace(newcontent, 'Stock','','all')>
<cfset newcontent=replacenocase(newcontent, '<div id="top">
    <div id="leftside">','<div id="top">
    <div id="leftside" style="position:relative;left:100;"')>
<cfset newcontent=replacenocase(newcontent, 'id="base"','id="base" style="visibility: hidden"')>
<cfset newcontent=replacenocase(newcontent,'Gemstone','Semiprecious Stone')>
<cfset newcontent=replace(newcontent, '<span class="imprtant">Silver Going Down </span> <img src="http://www.essentialsjewelry.com/images/15.gif" width="161" height="56" />','<b><br>All 92.5% Sterling Silver</b>. <font size=+1 color=red><b>ORDER BY PHONE ONLY SECTION:<br> 1-512-589-9009</font> (9 AM to 5 PM CST  or leave message, we call you back)</b>')>
<cfset newcontent=replace(newcontent, '<div id="space"></div>', '<p><b>All 92.5% Sterling Silver</b> <font color=red><b>YOUR ARE IN ORDER BY PHONE ONLY SECTION: 1-512-589-9009</font> (10 AM to 5 PM CST or leave message, we call you back)</b>')>
<cfset newcontent=replace(newcontent, '<div id="basenav">', '<p><b>All 92.5% Sterling Silver</b> <font color=red><b>YOUR ARE IN ORDER BY PHONE ONLY SECTION: 1-512-589-9009</font> (10 AM to 5 PM CST  or leave message, we call you back)</b><div id="basenav"> ')>

<center><div style="position:relative;top:-230px;z-index:3;">
<cfoutput>
  #newcontent#
</cfoutput>
</div>
</center>
<div style="position:absolute;z-index:10;text-align:center;background-color:white;top:0;left:200;"><center><table align=center bgcolor="white"><tr><td> <cfinclude template="/header.cfm"></td></tr></table></center></div>
<div style="position:relative;z-index:2;text-align:center;background-color:white;left:30;top:-200"><cfinclude template="/mainfooter.cfm"></div>

