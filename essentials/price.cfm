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
<cfset PriceLocation=find('Price : :',newcontent)>
<cfoutput>
Location:  #PriceLocation#<br>
</cfoutput>
<cfloop condition="PriceLocation GREATER THAN 0">
<cfset oldprice=Trim(Mid(newcontent,PriceLocation+43,5))>
<cfset newprice=oldprice*1.3>
<cfset newcontent=replace(newcontent,oldprice,newprice)>
<cfset PriceLocation=find('Price : :',newcontent,PriceLocation+15)>
</cfloop> 
<center>
<cfoutput>
#newcontent#</cfoutput>

</center>
</body>
<!---<div style="position:absolute;z-index:10;text-align:center;background-color:white;top:0;left:200;"><center><table align=center bgcolor="white"><tr><td> <cfinclude template="/header.cfm"></td></tr></table></center></div>
<div style="position:relative;z-index:2;text-align:center;background-color:white;left:30;top:-200"><cfinclude template="/mainfooter.cfm"></div>
--->
