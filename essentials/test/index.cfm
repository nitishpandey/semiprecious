<cfparam name=wholesalejewelry default="/stock/sterling-silver-rings.html">
<cfparam name="page1" default="">
<cfparam name="page2" default="">
<cfparam name="page3" default="">
<cfset page1=replace(replace(replace(getfilefrompath(wholesalejewelry), '-1.','.'),'-2.','.'),'-3.','.')>
<cfset newpage1="http://www.semipreciouswholesale.com/essentials/index.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page1#">
<cfset page2=replace(page1, '.html','-2.html')>
<cfset newpage2="http://www.semipreciouswholesale.com/essentials/index.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page2#">
<cfset page3=replace(page1, '.html','-3.html')>
<cfset newpage3="http://www.semipreciouswholesale.com/essentials/index.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page3#">
<cfset page4=replace(page1, '.html','-4.html')>
<cfset newpage4="http://www.semipreciouswholesale.com/essentials/index.cfm?wholesalejewelry=#getdirectoryfrompath(wholesalejewelry)##page4#">

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
<cfset newcontent =RereplaceNocase(newcontent, '../images', 'http://www.essentialsjewelry.com/images','all')>
<cfset newcontent =RereplaceNocase(newcontent, '<a href="http://www.essentialsjewelry.com/', '<a href="http://www.semipreciouswholesale.com/essentials/','all')>
<cfset newcontent=replacenocase(newcontent, 'exporter','importer')>
<cfset newcontent=replacenocase(newcontent, 'india','Austin')>
<Cfset newcontent=right(newcontent, Len(newcontent)-Find('<body>',newcontent)-5)>

<cfset newcontent =REreplace(newcontent, 'www.semipreciouswholesale.com/essentials/', 'www.semipreciouswholesale.com/essentials/index.cfm?wholesalejewelry=',"all")>
<cfset newcontent =RereplaceNocase(newcontent, 'http://www.essentialsjewelry.com/images/title.gif', 'http://www.semipreciouswholesale.com/essentials/images/title.gif','all')>
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
<cfset newcontent=replace(newcontent,'Essential Jewlery','Semiprecious.com')> 
<cfset newcontent=replace(newcontent,'925','92.5')>
<cfset newcontent=replacenocase(newcontent,'wholesale','wholesale Semiprecious')>
<cfset newcontent=replacenocase(newcontent,'jewelry','jewellery')>
<cfset newcontent=replacenocase(newcontent,'%','percent')>
<cfset newcontent=replacenocase(newcontent,'Gemstone','Semiprecious Stone')>
<cfset newcontent=replace(newcontent, '<span class="imprtant">Silver Going Down </span> <img src="http://www.essentialsjewelry.com/images/15.gif" width="161" height="56" />','<font color=red><b>PHONE ORDER ONLY: 1-512-666-GEMS</font> (9 AM to 5 PM CST)</b>')>
<cfset newcontent=replace(newcontent, '<div id="space"></div>', '<p><font color=red><b>PHONE ORDER ONLY: 1-512-666-GEMS</font> (9 AM to 5 PM CST)</b>')>
<cfset newcontent=replace(newcontent, '<div id="basenav">', '<p><font color=red><b>PHONE ORDER ONLY: 1-512-666-GEMS</font> (9 AM to 5 PM CST)</b> <p><cfinclude template="/mainfooter.cfm"> <div id="basenav"> ')>
<div style="position:relative;top:-170px;z-index:3;">
<cfoutput>
  #newcontent#
</cfoutput>
</div>
<div style="position:absolute;z-index:10;text-align:center;background-color:white;top:0;left:200;"><center><table align=center bgcolor="white"><tr><td> <cfinclude template="/header.cfm"></td></tr></table></center></div>


