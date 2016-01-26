
 <cfset session.quick_add = 1 />
<cfparam name="groupname" default=""> <!--- used in folders like shaped, rare-stones --->
<cfparam name="inventory" default="">
<cfparam name="stored" default="">
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="description" default="">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="subcat2" DEFAULT= "">
<cfparam name="metakeywords" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="#style#">
<cfparam name="silverjewelry" default="">
<CFPARAM NAME="displaycolumns" DEFAULT="4">
<CFPARAM NAME="display" DEFAULT="4">
<CFPARAM NAME="numpages" DEFAULT="0">
<CFPARAM NAME="category" DEFAULT="all" >
<CFPARAM NAME="priceless" DEFAULT="">
<CFPARAM NAME="category2" DEFAULT="all" >
<cfparam default="662222" name="l"><cfparam name="invstatus" default=-3	>
<cfparam name="url.start" default="1">
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="url.subcat" DEFAULT=amethyst>
<cfparam name="url.category" default=category />
<CFPARAM NAME="color" DEFAULT= "">
<CFPARAM NAME="Bcolor" DEFAULT= "white">
<CFPARAM NAME="salestatus" DEFAULT="">
<CFPARAM NAME="newcart" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="">
<CFPARAM NAME="pricegreater" DEFAULT="0">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where domain='#cgi.server_name#' and pagename='#replace(Trim(cgi.script_name),"/","")#'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
    <cfelseif cgi.server_name contains "semiprecious.in">
    <cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
    <cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
    <cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
    <cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
    <cfelse>
    <cfset metatitle="#contentbypage.title# in gemstones">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#, gemstone jewelry">
    <cfset pagedescription="#contentbypage.description#">
  </cfif>
</cfif>
<cfset itemidlist  = "" />
<cfif isdefined("url.clusterid")>
  <CFQUERY DATASOURCE="gemssql" NAME="Getitemid">
select itemid , cat from styles where styleid = #url.clusterid# 
</cfquery>
  <cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
  <cfelseif itemid neq 0>
   <cfquery datasource="gemssql" name="whatcat">
       select cat from items where newitem = #url.itemid#
		</cfquery>
  <CFQUERY DATASOURCE="gemssql" NAME="styleids">
select distinct(styleid) as styleidlist , cat from styles where itemid = #itemid# and matchtype = '#type#'
</cfquery>
  <cfif type is 'look'>
    <cfset category = '#lcase(styleids.cat)#'>
  </cfif>
  <cfloop query="styleids" >
    <cfquery datasource="gemssql" name="getitemid">
select itemid , cat from styles where styleid = #styleidlist# 
</cfquery>
    <cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
  </cfloop>
  <cfif styleids.recordcount>
<cfsavecontent variable="ref_des"   >
	<div style="width:100%;position:absolute;top:0;left:0;z-index:2" align="Center">
	<div style="width:930px;position:relative;top:0;left:0;">
<div   id="referencitem" style="position:absolute;;top:10px;left:60px;background-color:white;padding:0px;z-index:2;">
[   <a href="#" onClick="MM_showHideLayers('referenceitem','','show');return false;" class="headerfontsmall"><font size="-2">Show Again</font></a> ]</div>
<div   id="referenceitem" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;">
<table  border="0" cellspacing="0" cellpadding="0" class="component_box green">
        <tr><Td class="form_heading">Design  you were seeing</Td></tr>
		<tr>
          <td align="center" bgcolor="#FFFFFF"> 
     <cfoutput>      <img src="/images/#whatcat.cat#/thumb/#url.itemid#.jpg" vspace="0" hspace="0" border="0" align="absmiddle">
       </cfoutput>   </td>
          
        </tr>
        <tr>
          <td align="right">&nbsp;  <a href="#" onClick="MM_showHideLayers('referenceitem','','hide');return false;" class="headerfontsmall"><font size="-2">Close</font></a> </td>
        </tr>
      </table>
	
</div> 
</div> 
</div> 
</cfsavecontent>
<cfelse>
<cfset top = "" />
   <!--- 2 and 3 => set , 1, 3 indicate style (look) --->
<!--- clustercount not showing correct value --->
  <cfquery datasource="gemssql" name="notpaidcart">
       select clustercount from items where newitem = #url.itemid#
		</cfquery>
	<cfif notpaidcart.clustercount is 1 or notpaidcart.clustercount is 2 ><!--- we must have come here then only for look or style --->
	<cfset cluster_derived = 0 />
	<cfelse>
	<cfif type is 'look'><!--- so we failed on look hence both has to be reduced only to set positive --->
		<cfset cluster_derived = 2 />
		<cfelse>
			<cfset cluster_derived = 1 />
	</cfif>
	</cfif>	
  <cfquery datasource="gemssql" name="notpaidcart">
        update items set clustercount = #cluster_derived# where newitem = #url.itemid#
		</cfquery>
</cfif>
  <cfelse>
  <cflocation url="gemstone_jewelry_gallery.cfm" />
</cfif>
<cfif len(itemidlist)>
  <cfquery datasource="gemssql" name="getlist" cachedwithin="#createtimespan(2,0,0,0)#">
select cat,size, weight, newitem, style, itemnumber as optcount, status, price, saleprice, basecost,color, subcat, grouping, description, <cfif session.bulkbuyer.id neq "">wholesaleprice as  price , wholesaleprice as saleprice <cfelse> price ,  saleprice</cfif> , status, inventory from items where newitem  in   (#itemidlist#) and (status = 3 or status  = 0) order by cat
</cfquery>
        
    </cfif>
 
 
<cfoutput>
	<cfsavecontent variable="saved_title" >
		<cfif metatitle neq "" >
	    #titlecase(metatitle)# 
    <cfelse>
    
	<cfif cgi.server_name contains 'wholesale'>
		Wholesale 
	</cfif>
 Gemstone #titlecase(category)#
  </cfif>
  
	</cfsavecontent>
	
	<cfsavecontent variable="saved_metakeywords">
		<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif>Affordable #color# #subcat#, Gemstone, #category#, Austin
	</cfsavecontent>
<!-- Deluxe Menu -->
    <!-- (c) 2009, by Deluxe-Menu.com -->

<!--- the above code is run every time a gallery page is invoked. A more sensible thing
would be to set the above flag either in login page or cart page where we can detect that 
person is shopping --->	

<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
<!---<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <cfif session.bulkbuyer.id eq "">
    <cflocation url=login.cfm?email=pondyiitd@yahoo.com>
  </cfif>
</cfif>--->



<cfset sj = "">

<cfif session.mail eq application.admin_email>
  <cfset url.edit =  'mamamia'>
  <cfset invstatus= -5>
</cfif>
<cfset  top = 114 />
<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale">
  <cfparam name="displayrows" default="7">
  <cfelse>
  <cfparam name="displayrows" default="4">
</cfif>




<!--- <script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script> --->
<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->


<cfif cgi.server_name contains "wholesale">
  <CFPARAM NAME="url.sortorder" DEFAULT="disporderwhole" >
  <cfelse>
  <cfif dateformat(now(),"dddd") eq "Sunday">
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder">
    <cfelseif dateformat(now(),"dddd") eq "Monday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
    <cfelseif dateformat(now(),"dddd") eq "Tuesday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
    <cfelseif dateformat(now(),"dddd") eq "Wednesday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder">
    <cfelseif dateformat(now(),"dddd") eq "Thursday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
    <cfelseif dateformat(now(),"dddd") eq "Friday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
    <cfelse>
    <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
  </cfif>
</cfif>
<cfparam name="sortorder" default="">
<cfif sortorder neq "">
  <cfset url.sortorder =sortorder>
</cfif>
<!---<cfif category is 'beads'><cfset url.sortorder = 'pricedesc'></cfif>--->
<!--- <CFIF url.sortorder is 'price'>
<CFSET url.sortorder='orderprice'>
 </cfif>
<CFPARAM NAME="PicWidth" DEFAULT= "120"> 
<cfoutput>url.sortorder is #url.sortorder#</cfoutput>
need to figure out from where sort order is coming as datetakendesc --->
<cfif url.sortorder eq 'datetakendesc' or url.sortorder eq 'newitemdesc' or url.sortorder eq 'datetaken'>
  <cfset url.sortorder = 'datetaken desc'>
</cfif>
<cfif url.sortorder is 'pricedesc'>
  <cfset url.sortorder = 'price desc' />
</cfif>
<cfif url.sortorder is 'lastbought'>
  <cfset url.sortorder = 'lastbought desc' />
</cfif>
<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->

<cfinclude template="checkinjection.cfm">
<cfparam name="grouping" default="">
<cfif style is 'silver beaded'>
  <cfset style='Silverbeaded'>
</cfif>
<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring; 
 } 

  session.gallery = 'gemstone_ws.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
   display=21;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
</cfscript>
	
<HTML>
<HEAD>
	<script type="text/javascript" language="JavaScript" src="/js/global.js"></script>
<script language="JavaScript" TYPE="TEXT/javascript" src="/javascript/quick_add_.js"></script>
<script language="JavaScript" TYPE="TEXT/javascript" src="/js/macromediafuncs.js"></script>
<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
<cfoutput>
	<style media="screen"   type="text/css" >
<!--
##ajax_context 
{
	display:none;
}
<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">	    
      			 <cfif session.cartitem[jc][4] gt 0 > .a#session.cartitem[jc][1]#_in_cart,</cfif>
		</cfloop>
		.comma_ender
{
background:url("/images/added.png") no-repeat  right center;
height:12px;
width:12px;
}

 <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">	    
      			 <cfif session.cartitem[jc][4] gt 0 > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
		</cfloop> .comma_ender1
{
background-color:##DFE;
}
-->
</style>
</cfoutput> 

<cfif session.quick_add>
<link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
<cfelse>
<link href="/styles/hub.css" rel="stylesheet" type="text/css" >

</cfif>

<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
 
<link rel="shortcut icon" href="/favicon.ico" >

  <TITLE >
  #saved_title#</TITLE>
  <meta name="keywords" content="#saved_metakeywords#" >
  <meta name="author" content="Anup Pandey" >
<cfif cgi.server_name contains "semiprecious.in">
<meta name=ICBM content="28.5573901, 77.1571443" />
<meta name="geo.position" content="28.5573901;77.1571443" />
<meta name="geo.placename" content="Vasant Vihar, New Delhi, India" />
</cfif>

</cfoutput>
<META content="20 days" name=revisit-after >

<!--- meta tags addition for groups--->

<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(cgi.script_name)#'>
<!--- speed up things  --->

<cfoutput>
	  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale'> Wholesale</cfif>#subcat# #style# #category# gem stone jewelry, retail and wholesale. 
  <cfif getlist.recordcount GT 0>
  <CFLOOP QUERY="Getlist" startrow="#start#" endrow="#evaluate(start+5)#">#getlist.description#. 
  Shipped from Austin, TX. </cfloop></cfif>'</cfif>>
</cfoutput>
       <style media="all" type="text/css">
	   html, body {
         height: 100%; overflow: hidden;
      }
      #container {
         height: 100%; overflow: auto; position: relative; z-index: 2;
      }</style>

  </HEAD>
  <body style="margin-top:0" lang="en-US">
  <div align="center" id="container">
  <!--- set up for ajax add to cart --->
 <form><input type="hidden" id="ajax_context" value=gallery /></form>
 <div style="position:absolute;left:120px;top:140px;z-index:3;" id="zw_1"></div>
 <div style="position:absolute;left:130px;top:390px;z-index:3;" id="zw_2"></div>
 <div style="position:absolute;left:140px;top:640px;z-index:3;" id="zw_3"></div>
 <div style="position:absolute;left:150px;top:880px;z-index:3;" id="zw_4"></div>
 <div style="position:absolute;left:150px;top:1020px;z-index:3;" id="zw_5"></div>
 
 <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
 --->

 <cfinclude template="#session.country#/header.cfm">
   <CFIF not gETLIst.recordcount>
     <br>
    <span class="error">No  item found. PLEASE TRY AGAIN.</span>
    <cfif subcat is 'amber'>
      <cfinclude template="pippinindex.htm">
    </cfif>
    <cfinclude template="footer.htm">
    <CFSET enddisplay= start + display -1 >
	</div>
  </body>
</html>
  <cfabort />
</cfif>

<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>
<cfif start gt getlist.recordcount>
  <cfset start = getlist.recordcount>
</cfif>
<cfif start lt 1>
  <cfset start = 1>
</cfif>


<!---<cfinclude template="includes/themes.cfm">--->
 
    

<cfoutput>
  <cfif getlist.recordcount LT 13>
    <cfset displayrows = 6 />
    <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures --->
  </cfif>

  <cfset display = displaycolumns*displayrows>

  <cfset tw =  606>
    <div align="center" style="width:930px;margin-top:4px;" nowrap >&nbsp;
</cfoutput>
<CFSET columns=1>
<CFSET rows=1>
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>
<table id="container1" width="930px" cellspacing="0" cellpadding="0" border="0"  style="padding:0 2px 0 2px">
  <tr >
  
  <!---<cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">--->
  <td valign="top"  align="left" width="930px;" ><!--- BEGIN LEFT SIDE STUFF --->
   <!--- END LEFT SIDE STUFF --->
  
    
    <cfif subcat neq "bulk lots" and (cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "")>
  <div align="center" style="padding-left:60px;;width:760px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  >

	   <font color=red><b>FOR BULK LOTS CLICK</b></font> <a href=/bulklots.cfm>HERE</a>
      </div>
    </cfif>
<!---	<cfif cgi.server_name does not contain 'wholesale'>
<center>  <h2>MEMORIAL DAY 50% OFF SALE ON NOW ON MOST ITEMS</h2></center>
</cfif>--->
  <!--- not working. takes you to the ring hub thats all. Date 29 Mar 2010. Nitish
		<cfif category eq "rings">
			
           					<div style="padding:2px;background-color:#EEE"><strong>RINGS BY SIZE:</strong> <a href="/rings.cfm?ringsize=4">Size 4</a> | <a href="/rings.cfm?ringsize=5">Size 5</a> | <a href="/rings.cfm?ringsize=6">Size 6</a> | <a href="/rings.cfm?ringsize=7">Size 7</a> | <a href="/rings.cfm?ringsize=8">Size 8</a> |  <a href="/rings.cfm?ringsize=9">Size 9</a> | <a href="/rings.cfm?ringsize=10">Size 10</a></div>

                    		</cfif>
							
							--->
<!---<cfif salestatus is 3>
<p>
<h2>SORRY THE BLACK FRIDAY SALE AT COST HAS ENDED. HOWEVER, COME BACK FOR CYBER MONDAY WHEN 2500 DESIGNS WILL BE AT 35% OFF SALE. 35% off our real regular prices. We do not show a false price and then show 35% off.<br> TO BE REMINDED BY EMAIL, <a href=/apply.cfm>SIGN UP</a></h2>
<CFABORT>
</cfif>---> 
  <!--- Paging links --->
<!---  <CFINCLUDE TEMPLATE="gallerypaging.cfm">--->
  <!--- End Paging links --->
  
  <!--- No items found --->
  <CFIF getList.recordcount is 0>
    <cfoutput>
      <div style="margin-top:10px;margin-left:150px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;">
      
      Sorry no matches found for your criteria &rarr;#category# #subcat# #advancedsearch# #color# #priceless#.  Please try with some other selectors given in left panel and top panel. 
    </cfoutput>
    <cfset silver = "">
    <cfif isdefined("url.relocated")>
      <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE 
							      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
      <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
        for #session.mail#. #cgi.QUERY_STRING# .
      </cfmail>
      <cfelse>
      <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
								--->
    </cfif>
    Often designs and range is discontinued due to  declining     interest.
    <form action="gemstone_jewelry_gallery.cfm" method="post"  style="display:inline;" >
      <br>
      Search:
      <input type='text' maxlength="24" size="12" value="" name='advancedsearch'>
      <input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
    </FORM>
    </div>
    
    <!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
						#session.mail#,#cgi.QUERY_STRING# .
						</cfmail>
						--->
 </cfif> <!--- End no items found --->
  <!--- Start Matt Bayuk - SGM --->
  <cfset itemCount = 0>
  <cfset itemlist = 0>


<div style="float:left;display:inline;">
  <cfset leftgemstonedisplay="inline" />
				<cfif color neq "" >
  					<cfset leftcolordisplay="inline" />
					</cfif>
				<cfset price_color_filter = "" />
				<!---	<cfif pricegreater neq 0 or priceless neq "">
						<cfset leftpricedisplay = "inline" />
						<span style="font-weight:bold"><cfinclude template="/includes/price_color_filter.cfm" /></span>
					</cfif> removed because now we ave a color bar above gallery--->
					
  <CFINCLUDE TEMPLATE="leftmenus.cfm">
  </div> 
 <div id="semiprecious_gallery" >

  <cfif start is 1>
      <cfif session.desc_flag or 1>
  <div id="infotable"   align="justify" > 
      <cfif category is 'ornaments'>
    	<b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b> 
        <cfelseif subcat is 'pearl'>
<b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
      </cfif>
      <cfoutput>             	#pagedescription# <cfif color neq "">
  Showing #category# with #color# color. <CFINCLUDE TEMPLATE="colorinfo.inc">
</cfif>
#price_color_filter#
		    <cfif session.mail is application.admin_email>
			#session.mail#
              <a href="http://#cgi.server_name#/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
            </cfif>
			</cfoutput>
				
        </Div>   </cfif>
      </cfif>
<div ID="silver_bottomTiles">

<!--- below displaycolumns  should not be changed unless it can also be changed in quick_add.js which computes zoom window
based on assumed size of page --->
<cfif len(session.bulkbuyer.id)>
<cfset displaycolumns = 5 /><!--- only for wholesale --->
<cfelse>
<cfset displaycolumns = 4 /><!--- only for wholesale --->

</cfif>
<CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#evaluate(start+4*displaycolumns-1)#">
    <cfif inventory GT 0>
      <cfset itemlist=listAppend(itemlist, newitem)>
    </cfif>
    
	<cfset itemCount = itemCount + 1>
	
    <CFSET invent=inventory>
    <!--- CCH
						<td class="rowb" style="border-left:0px solid black;" width="30%" onClick="hideAll(); div#itemCount#.style.display = 'block';">
--->
        <cfif inventory GT 0>
          <cfset status_arra = 1>
          <cfif  cgi.server_name contains "wholesale" or session.bulkbuyer.id neq "">
            <cfset l = 'AA2222'>
            <cfset price_arra = "Wholesale: " &format(wholesaleprice)>
			
            <cfelse>
			<cfif cgi.server_name contains "semiprecious.com">
			<cfset price_arra = "Your price: "&format(price)>
			<cfelse>
			<cfset price_arra = "Your price: "&format(price)>
			</cfif>
            <cfif status is 3>
              <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                <CFSET Variables.Saleprice = 0.80*price>
				<cfelse>
				<CFSET Variables.Saleprice = getlist.saleprice>
				       </cfif>
			
              <cfset status_arra = format(Variables.saleprice)>
            </cfif>
          </cfif>
          <cfelse>
          <cfset status_arra = 0>
          <cfset price_arra = "Your price: "&format(price) >
        </cfif>
        <cfset item_arra = '#newitem#_#lcase(cat)#_#lcase(replace(replace(subcat," ","","All"),",","_","All"))#'>


     <!--- <cfoutput> 
	  <cfif getlist.storage EQ 'Pippin'>
          <a href="gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm##jewelry_top"> 
          	<img src ="#thumblink#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #cat#" <cfif category is 'bracelets'>width="100"</cfif>> </a>
          <CFELSE>
                 <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">	
       				  <cfif getlist.storage contains 'IN-'>
                         8-10 day delivery<br>
                         3-8 day delivery
                       </cfif>
				</cfif>
                </a> </div>
        </CFIF> 
		</cfoutput> --->
        <!---		<img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black' onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')">		--->
          <cfoutput>
	<div class="silver_sub1">
        <div class="silver_subTop"><span></span></div>
           <div class="silver_sub-content">
            	<div CLASS="silver_bottomBarTitle">

<div class="thumbnail_box">
<cfset short_desc = "Design " & newitem & ": " &   getlist.color & " " & #lcase(getlist.subcat)# />
<cfif getlist.grouping neq ""> 
<cfset short_desc = short_desc & " " & #lcase(getlist.grouping)# />
</cfif>
<cfset short_desc = short_desc & " " & #lcase(getlist.cat)# />

			   	<a name='#newitem#_anchor' style="margin-bottom:0" href='/gem_stone_#lcase(cat)#.cfm/#item_arra#<cfif grouping neq "">_#grouping#</cfif>.htm?silver=##jewelry_top'>
			   	  <img style="margin-bottom:0;"   src ='/images/#getlist.cat#/thumb/#newitem#.jpg' title="#short_desc#" alt="#short_desc#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' />
				 </a>
		<div id="#newitem#_msg_on_thumb" class="yui3-toggle yui3-bd msg_on_thumb"  ></div>		 
</div> 
 <div class="text_box" >
           <!---<img src='magnify.gif'  onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')"/>&nbsp;&nbsp; <a href="javascript:showDetails('#itemCount#');">Info</a><br><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Details</a>--->
<a style="text-transform:capitalize;"  class="a#newitem#_in_cart1" href='/gem_stone_#lcase(cat)#.cfm/#item_arra#<cfif grouping neq "">_#grouping#</cfif>.htm?silver=##jewelry_top'>
                <cfif subcat neq "">
                  <br>
                  #lcase(subcat)#
                </cfif>
                <cfif subcat2 neq "">
                  #lcase(subcat2)#
                </cfif>
                <cfif grouping neq "">
                  #lcase(grouping)#
                </cfif>
                <cfif getlist.cat neq 'healing'>
                  #lcase(left(getlist.cat,len(getlist.cat)-1))#
                  <cfelse>
                  #lcase(categ)#
                </cfif>
                </a>
    <br />
 	  	 
     <div style="position:absolute;top:28px;padding:1px;height:12px;right:6px;display:inline;" class="a#newitem#_in_cart" id="#newitem#_cart_qty"></div>

</div>
		
<div class="ship_box" align="center">
				 <div style="height:66px;"> <div class="shipping_box" id="add_msg_#newitem#" >
				 <cfif #style# contains "silv">
Sterling Silver<cfelse><br /><!--- to keep space occupied ---></cfif></div>
		                 <cfif size LT 100>
                            <cfif size LT 0.2 and size neq 0>
							Adjustable
                              <cfelseif size neq 0  >
                              #size#
                            </cfif>
                            <cfif (getlist.cat is "necklaces" or getlist.cat is "bracelets" or getlist.cat is "bags") and size neq "" >
								inches
                              <cfelseif (getlist.cat is "pendants" or getlist.cat is "earrings" or getlist.cat is "brooches") and size LT 5 and size neq "">
                              inches
							  <cfelseif getlist.cat is "rings" and size GT 0.2 >
							  (US size)
                               <cfelseif size eq 0 and getlist.cat is "rings">
							   Any Size
                               <cfelseif size neq 0 and getlist.cat is "beads">
							   mm
							  <cfelseif (getlist.cat is "chains") and size neq "">
                              inches
							</cfif>
                            <cfelse>
                            #Round(evaluate(size/25.4))#inches
                          </cfif>
                       <cfif weight neq "0" and weight neq "" >
                          <b> </b>#weight#
                          <cfif category is "gems" >
								Ct.
                            <cfelse>
                            gm
                          </cfif>
                        </cfif>
<div class=retail_price>In Stores: #format(8.18*basecost/application.exchangerate)#</div>
	  <cfswitch expression="#status#">
            <cfcase value="1">
	        <span class="reg_price">#format(price)#</span> 
            </cfcase>
            <cfcase value="0">
            <span class="sold_out_thumb">Sold Out&nbsp;</span><span class="reg_price">#format(price)#</span> 
            </cfcase>
            <cfdefaultcase>
            <span class="sale">
            <span class="reg_price">#format(price)#</span>		<br /><span class="sale_price"> Sale! #format(saleprice)#</span></span>	 
			</cfdefaultcase>
          </cfswitch> 
		  </div>
 <cfif  session.quick_add>
  	 <div style="display:inline;margin-top:0px;padding-top:1px;text-align:center;font-size:1em;">
            	<form style="float:right;display:inline;" >
	<cfset option_needed = 0 />
	<cfif  cat eq 'bracelets' ><!--- blank div of ht 20px is to cater for options in certain items. this can be replaced by a CSS word --->
	<div style="height:20px;">&nbsp;</div><cfif category is "rings1"><!--- rings1 used to disable this part till we have better idea on how to show options --->
		  US Sizes 6 to 10<br />
		 </cfif>
		      <cfelseif optcount >
	              <cfquery datasource="gemssql" name="opts" >
                  select description, optionid,	valueadd from options where itemid               = #newitem#  
                  </cfquery>
                 <cfif  opts.RecordCount GT 2>
						<cfset option_needed = 0 />
						<cfif not findnocase("may",opts.description[1])> <!--- very bad hack, but only solution for now (2 may 2010) --->
						<cfset option_needed = 1 />
					   </cfif>
					
		    		 <div  class="options" align="center" style=";text-align:right;" >
                     <select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"  >
					 <cfloop query="opts" >
                                    <cfif valueadd>
                                      <!--- if there is a change in price because of this option --->
                                         <cfif session.bulkbuyer.id neq "" or cgi.server_name contains "wholesale" >
											<cfset x = valueadd/2 />
										<cfelse>
											<cfset x = valueadd />
										</cfif>  <option value="#opts.optionid#" >#description#&nbsp;&rarr;&nbsp;#format(x)#</option>
                                      <cfelse>
                                        <option value="#opts.optionid#" >#description#</option>
                                    </cfif>
                                  </cfloop>
		                        </select>
                              </div>
								  <cfelseif    opts.RecordCount GT 1>
								  	<cfset option_needed = 0 />
								  <cfif  findnocase("may",opts.description[1])>
								 	   <!--- very bad hack, but only solution for now (2 may 2010) --->
							    		 <div  class="options" align="center" style="float:right;;horizontal-align:left;" >
				<select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"   >
										 <cfloop query="opts" >
		                                    <cfif valueadd>
                                      <!--- if there is a change in price because of this option --->
                                         <cfif len(session.bulkbuyer.id)  >
											<cfset x = valueadd/2 />
									      <cfelse>
											<cfset x = valueadd />
									 	</cfif>  
										<option value="#opts.optionid#" >#description#&nbsp;&rarr;&nbsp;#format(x)#</option>
                                       <cfelse>
                                        <option value="#opts.optionid#" >#description#</option>
                                    </cfif>
                                  </cfloop>
		                        </select>
                              </div>
								  <cfelse>
									 <div  class="options" align="center" style=";text-align:right;" >
					                     <select id="#newitem#_options" name="optionid" style="margin:0;margin-bottom:1px;padding:0;"  >
										      <option value="2" >#opts.description[2]#</option> </select></div>
                               </cfif>
								  
						
								  <cfelse>
							<div style="height:20px;">&nbsp;</div>	<input type="hidden" name="optionid"  id="#newitem#_options" value="0" >
							   
							 	 </cfif>
                              <cfelse>
                           <div style="height:20px;">&nbsp;</div> <input type="hidden" name="optionid"  id="#newitem#_options" value="0" >
                            </cfif><div style="float:right;">
<a onClick="zoom_window(#newitem#,'#cat#',#getlist.currentrow#);" style="float:;margin-left:1px;" class="side_link" href="javascript:"><img src="/images/magnify.gif" height="16px" alt="view detailed photograph" align="absmiddle"  /></a>&nbsp;
	&nbsp;&nbsp;<b>Buy:</b>&nbsp;<select id="#newitem#_opt_qty" style="margin:0;margin-bottom:1px;padding:0;" name="irrelevant" onChange="javascript:add_to_cart(#newitem#,#option_needed#);return;">
<option selected>Qty</option>
<cfloop from="1" to="#inventory#" index="j">
<option value="#j#" >#j#</option>
</cfloop>
<option value="0">0</option>
</select></div>
 </form>
</div>
<cfelse>	   
  <a href='/gem_stone_#lcase(cat)#.cfm/#item_arra#.htm?silver=##jewelry_top' class='side_link'>Zoom/Buy</a>
</cfif>  	
</div>
	    </cfoutput>
		            </div>
          </div>
        <div class="silver_subBottom" style="border-bottom:0px #DFDFDF solid"><span></span></div>
	</div>

      <cfset numberdisplayed = getlist.currentrow - start+1 />
  </CFLOOP>
 </div>
  <div align="center" style="margin-top:30px;">
  <!--- Paging links --->
<!--- 
    <CFINCLUDE TEMPLATE="/includes/gallerypaging.cfm">
 --->
	<!---  <div style="text-align:center;margin-bottom:2px;">
	  <cfoutput>
	  <span class="green_bg" style="color:black;height:16px;padding:2px;"><a href="/#session.cart#"   oClick="goProcess('cart summary');return;">&rarr;View Your Cart Here&larr;</a>&nbsp;</span>
	 </cfoutput>
    </div>
	 End Paging links --->
	
</div>
<div align="center" id="cart_summary" style="z-index:6;"></div>
						
  <!--- End Matt Bayuk - SGM --->
<!--- 
  <cfinclude  template="statsrecord.cfm">
 --->
  </td></tr>
  <!--- <tr> <td>
    
   <a href="/topselling.cfm" >Best Selling!</a> <a href="/howtonavigate.cfm" >How to Find?</a>
  </td>
  
  </tr>--->
  
    <tr>
      <td align="center"><!--- Footer --->
  <cfoutput>
    <cfinclude template="includes/linkexchangebystone.cfm">
    <cfif subcat neq "">
      <cfinclude template="/marketing/stonelinks.cfm">
    </cfif>
        <cfinclude template="/mainfooter.cfm">
        <!--- End footer --->
      </td>
    </tr>
    <tr>
      <td id="wholesale"  align=middle>
      <a href="http://www.handmadelaptopcase.com"><img alt="stylish bags for netbooks and laptops" src="http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg" ></a>
	   </td>
    </tr>

    </table >
    
     </cfoutput>

<cftry>
		<cfset session.gallery='/gemstone_ws.cfm' />

	    <cfset session.filter="&start=#start#&pricegreater=#pricegreater#&priceless=#priceless#&color=#urlencodedformat(color)#&sortorder=#urlencodedformat(sortorder)#&style=#urlencodedformat(url.style)#&subcat=#subcat#&category=#category#&" >

  <cfcatch type="application">
  </cfcatch>
</cftry>
</div>
</div><cfoutput>#ref_des#</cfoutput>
 <cfset session.quick_add = 0 />

</BODY>
</HTML>
