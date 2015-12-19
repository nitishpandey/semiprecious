<!---<CFCACHE TIMEOUT="#DateAdd("D", "-20", Now())#">
--->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD>
<title>Jewelry listing of all inventory in stock for instant shipping</title>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META content="MSHTML 6.00.2726.2500" name=GENERATOR>
<meta name='description' content="List of stone jewelry for retailers, wholesale buyers and individual buyers. Wholesale semiprecious stone jewelry list">
<meta name='kewords' content="Bulk listing, bulk prices, bulk jewelry, bulk rates, gem stone prices, healing crystal rates, healing necklaces, healing jewelry">
</HEAD>
<body>
 <CFPARAM NAME="sortorder" DEFAULT="">
 <CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "FEE6CD">
  <CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
 <CFPARAM NAME="invent" DEFAULT="">
 <CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="priceless" DEFAULT="">

<CFINCLUDE TEMPLATE="setup.cfm">



<h3>Quick Raw List of our INSTOCK Items</h3>


	<CFQUERY DATASOURCE="semiprecious" NAME="RawList">
	SELECT newitem, cat, subcat, price from items where inventory>3 order by cat, subcat, price</CFQUERY>

<cfoutput query="RawList">
Item:<b>#newitem#</b> <a href=detail.cfm?itemnumber=#newitem#>#subcat# #cat#</a> #dollarformat(price)#<br></cfoutput>
<p>

Catalog pages:<a href='list.cfm'>1</a>&nbsp;&nbsp;<a href='list.cfm?start=13'>2</a>&nbsp;&nbsp;<a href='list.cfm?start=25'>3</a>&nbsp;&nbsp;<a href='list.cfm?start=37'>4</a>&nbsp;&nbsp;<a href='list.cfm?start=49'>5</a>&nbsp;&nbsp;<a href='list.cfm?start=61'>6</a>&nbsp;&nbsp;<a href='list.cfm?start=73'>7</a>&nbsp;&nbsp;<a href='list.cfm?start=85'>8</a>&nbsp;&nbsp;<a href='list.cfm?start=97'>9</a>&nbsp;&nbsp;<a href='list.cfm?start=109'>10</a>&nbsp;&nbsp;<a href='list.cfm?start=121'>11</a>&nbsp;&nbsp;<a href='list.cfm?start=133'>12</a>&nbsp;&nbsp;<a href='list.cfm?start=145'>13</a>&nbsp;&nbsp;<a href='list.cfm?start=157'>14</a>&nbsp;&nbsp;<a href='list.cfm?start=169'>15</a>&nbsp;&nbsp;<a href='list.cfm?start=181'>16</a>&nbsp;&nbsp;<a href='list.cfm?start=193'>17</a>&nbsp;&nbsp;<a href='list.cfm?start=205'>18</a>&nbsp;&nbsp;<a href='list.cfm?start=217'>19</a>&nbsp;&nbsp;<a href='list.cfm?start=229'>20</a>&nbsp;&nbsp;<a href='list.cfm?start=241'>21</a>&nbsp;&nbsp;<a href='list.cfm?start=253'>22</a>&nbsp;&nbsp;
<a href='list.cfm?start=265'>23</a>&nbsp;&nbsp;<a href='list.cfm?start=277'>24</a>&nbsp;&nbsp;<a href='list.cfm?start=289'>25</a>&nbsp;&nbsp;<a href='list.cfm?start=301'>26</a>&nbsp;&nbsp;<br>

</BODY>
</HTML>