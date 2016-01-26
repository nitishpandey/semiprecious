

<cfif #cgi.server_name# contains "forcesofindia">
    <cfif cgi.query_string neq "">
            <cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
    <cfelse>
            <cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
    </cfif>
    <cfheader statuscode="301" statustext="Moved permanently">
    <cfheader name="Location" value="#newurl#"> 
    </cfif>
<cfif #cgi.server_name# contains "semiprecious.in">
<cfif cgi.query_string neq "">
<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
<cfelse>
<cfset newurl= "http://www.semiprecious.com#CGI.SCRIPT_NAME#">
</cfif>
<cfheader statuscode="301" statustext="Moved permanently">
<cfheader name="Location" value="#newurl#"> 
</cfif>
<cfparam name="inventory" default="">
<cfparam name="metatitle" default="">
<cfparam name="groupname" default="">
<cfparam name="metadescription" default="">
<cfparam name="description" default="">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="subcat2" DEFAULT= "">
<cfparam name="metakeywords" default="">
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
<cfparam default="662222" name="l">
<cfparam name="invstatus" default=-3	>
<cfparam name="url.start" default="1">
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="url.subcat" DEFAULT=amethyst>
<cfparam name="url.category" default=category />
<CFPARAM NAME="color" DEFAULT= "">
<CFPARAM NAME="salestatus" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="">
<CFPARAM NAME="pricegreater" DEFAULT="0">
<cfset itemidlist  = "" />




<cftry>
<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
select disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest, 
inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
   buylink from items with (nolock) where (status=0 or status=3)
	 </cfquery>
	
	 <cfcatch type="any">
	 Error in itemsinmemory</cfcatch>
	 </cftry>
<cfif isdefined("url.clusterid")>
<cftry>
  <CFQUERY DATASOURCE="gemssql" NAME="Getitemid">
            select itemid , cat from styles where styleid = #url.clusterid# 
</cfquery>
<cfcatch type="any">
Error in gemstone.cfm
</cfcatch>
</cftry>
  <cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
  <cfelseif itemid neq 0>
	<cftry>
   <cfquery datasource="gemssql" name="whatcat">
       select cat from items where newitem = #url.itemid#
		</cfquery>
		<cfcatch type="any">
		Error in line 46 gemstone.cfm
		</cfcatch>
		</cftry>
		<cftry>
  <CFQUERY DATASOURCE="gemssql" NAME="styleids">
select distinct(styleid) as styleidlist , cat from styles where itemid = #itemid# and matchtype = '#type#'
</cfquery>
<cfcatch type="any">
Error in link 53 gemstone.cfm
</cfcatch>
</cftry>



  <cfif type is 'look'>
    <cfset category = '#lcase(styleids.cat)#'>
  </cfif>
  <cfloop query="styleids" >
	<cftry>
    <cfquery datasource="gemssql" name="getitemid">
select itemid , cat from styles where styleid = #styleidlist# 
</cfquery>
<cfcatch type="any">
Error in line 65 in gemstone.cfm
</cfcatch>
</cftry>
    <cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
  </cfloop>
  <cfif styleids.recordcount>
<cfsavecontent variable="ref_des"   >
	<div style="width:100%;position:absolute;top:0;left:0;z-index:1002" align="Center">
	<div style="width:930px;position:relative;top:0;left:0;">
<div   id="referencitem" style="position:absolute;;top:20px;left:70px;background-color:white;padding:0px;z-index:1002;">
[   <a href="#" onClick="MM_showHideLayers('referenceitem','','show');return false;" class="headerfontsmall"><font size="-2">Show Again</font></a> ]</div>
<div   id="referenceitem" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:1002;">
<table  border="0" cellspacing="0" cellpadding="0" class="component_box green">
        <tr><Td class="lookinline">Design  To Match</Td></tr>
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
<cftry>
  <cfquery datasource="gemssql" name="notpaidcart">
       select clustercount from items where newitem = #url.itemid#
		</cfquery>
		<cfcatch type="any">
		Error in line 102 in gemstone.cfm
		</cfcatch></cftry>

	<cfif notpaidcart.clustercount is 1 or notpaidcart.clustercount is 2 ><!--- we must have come here then only for look or style --->
	<cfset cluster_derived = 0 />
	<cfelse>
	<cfif type is 'look'><!--- so we failed on look hence both has to be reduced only to set positive --->
		<cfset cluster_derived = 2 />
		<cfelse>
			<cfset cluster_derived = 1 />
	</cfif>
	</cfif>	
	<cftry>
  <cfquery datasource="gemssql" name="notpaidcart">
        update items set clustercount = #cluster_derived# where newitem = #url.itemid#
		</cfquery>
		<cfcatch type="any">
		Error in line 119 in gemstone.cfm
		</cfcatch></cftry>

</cfif>
  <cfelse>
  <cflocation url="gemstone_jewelry_gallery.cfm" />
</cfif>
<cfif len(itemidlist)>
<cftry>
  <cfquery datasource="gemssql" name="getlist" cachedwithin="#createtimespan(2,0,0,0)#">
	select cat,size, weight, orderonrequest, newitem, style, itemnumber as optcount, status, price, wholesaleprice, saleprice, basecost,color, subcat, grouping, description, <cfif session.bulkbuyer.id neq "">wholesaleprice as  price , wholesaleprice as saleprice <cfelse> price ,  saleprice</cfif> , status, inventory from items where  newitem  in   (#itemidlist#) and (status = 3 or status  = 0) order by cat
</cfquery>
<cfcatch type="any">
Error in gemstones.cfm, sorry
</cfcatch>
</cftry>
        <cfelse>
      <cfmail from="service@semiprecious.com" to="nitish@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="CLUSTER VACUUM" type="html" >
 #cgi.QUERY_STRING# .
      </cfmail>
	<cfset getlist.recordcount = 0 />

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
  <cfparam name="displayrows" default="5">
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

  session.gallery = 'gemstone.cfm' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
   display=21;
   displaycolumns = 4;
if ( screensize is "small"){
 displaycolumns = 4;
}
</cfscript>
	
<HTML>
<HEAD>
<meta name="robots" content="noindex,nofollow">
</head>
<body>


<!--- <cfif session.quick_add>
making ajax on this page for all ---><link href="/styles/hub_ws.css" rel="stylesheet" type="text/css" >
<!--- <cfelse>
<link href="/styles/hub.css" rel="stylesheet" type="text/css" >

</cfif>
 --->
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >

	<script type="text/javascript" language="JavaScript" src="/js/global.js?ver=1.2"></script>
<!--- create css for items in cart. no need to do dynamic querying while listing the item --->
<cfoutput>
	<style media="screen"   type="text/css" >
<!--
##ajax_context 
{
	display:none;
}
<cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">	    
      			 <cfif session.cartitem[jc][1] > .a#session.cartitem[jc][1]#_in_cart,</cfif>
		</cfloop>
		.comma_ender
{
background:url("/images/added.png") no-repeat  right center;
height:12px;
width:12px;
}

 <cfloop  index="jc" from="1" to="#ArrayLen(session.cartitem)#">	    
      			 <cfif session.cartitem[jc][1] > .a#session.cartitem[jc][1]#_in_cart1,</cfif>
		</cfloop> .comma_ender1
{
background-color:##DFE;
}
-->
</style>
</cfoutput> 
 
<link rel="shortcut icon" href="/favicon.ico" >

<CFIF GETLIST.RECORDCOUNT>  <TITLE >

  Matching Sets for Semiprecious and Gemstones Jewelry and <cfoutput>#getitemid.cat#</cfoutput></TITLE></CFIF>
	
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
  <div style="width:100%;position:absolute;top:0;left:0;z-index:3" align="Center">
	<div style="width:930px;position:relative;top:0;left:0;">
<div   id="zw_0" style="position:absolute;margin-top:-20px;;top:30px;left:60px;background-color:white;padding:0px;z-index:2;">
</div> 
</div> 
</div><div align="center" id="container">
  <!--- set up for ajax add to cart --->
 <form><input type="hidden" id="ajax_context" value=gallery /></form>
 <!-- <div style="position:absolute;left:120px;top:140px;z-index:3;" id="zw_1"></div>
 <div style="position:absolute;left:130px;top:390px;z-index:3;" id="zw_2"></div>
 <div style="position:absolute;left:140px;top:640px;z-index:3;" id="zw_3"></div>
 <div style="position:absolute;left:150px;top:880px;z-index:3;" id="zw_4"></div>
 <div style="position:absolute;left:150px;top:1020px;z-index:3;" id="zw_5"></div>
 <div style="position:absolute;left:150px;top:1280px;z-index:3;" id="zw_6"></div>
 <div style="position:absolute;left:150px;top:1560px;z-index:3;" id="zw_7"></div>
  -->
 <!--- <div style="position:absolute;right:100px;top:12px;z-index:3;" id="fast_cart"></div>
 ---><meta name="robots" content="noindex,nofollow">


 <cfinclude template="/header#session.country#.cfm">
<div id="container2">
              <div style="width:930px;">
               <CFIF not gETLIst.recordcount>
                 <br />
                    <span class="error">No  item found. PLEASE TRY AGAIN.</span>
                    <cfif subcat is 'amber'>
                      <cfinclude template="pippinindex.htm">
                    </cfif>
            	</div>
	</div>

    <CFSET enddisplay= start + display -1 >        
    </div>

 
<cfelse>
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
    <div align="center" >&nbsp;
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
  
      <Div  class="grayplacard" style="width:920px;">See Variety of Sets & Designs <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /> <a href="showsets.cfm"  id="all_" class="setinline" title="see designs range and sets suggestions in bracelets">&nbsp;Put Together a Set&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showearrings.cfm"  id="earrings_" title="see designs range and sets suggestions in earrings">&nbsp;Earrings&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showpendants.cfm" id="pendants_">&nbsp;Pendants&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="shownecklaces.cfm"   id="necklaces_">&nbsp;Necklaces&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showbracelets.cfm"  id="bracelets_" title="see designs range and sets suggestions in bracelets">&nbsp;Bracelets&nbsp;</a>
   </div>
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
      <cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
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

		<cfset price_color_filter = "" />
		

 <div id="semiprecious_gallery" style="float:right;margin-right:6px;;overflow:visible;position:relative;" >
<div id="lllmmm" style="width:160px;float:left;display:inline;">
� <cfset leftgemstonedisplay="inline" />
				<cfif color neq "" >
� 					<cfset leftcolordisplay="inline" />
					</cfif>
				<!---	<cfif pricegreater neq 0 or priceless neq "">
						<cfset leftpricedisplay = "inline" />
						<span style="font-weight:bold"><cfinclude template="/includes/price_color_filter.cfm" /></span>
					</cfif> removed because now we ave a color bar above gallery--->
			<cfoutput query="styleids" >
This Collection's Id is #styleidlist#
</cfoutput>		
� <CFINCLUDE TEMPLATE="leftmenus.cfm">
� </div>�
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
	<cfset quick_add = 1 />
	<cfinclude template="/includes/gallery_engine.cfm" /><!--- with new floating window we are not using
	the zoom windows within gallery engine. due to a necessary IE hack we have to make a absolute positioned div outside the container of this engine. hence  a zw_0 id window outside is necessary and should not be missed. to use embedded zooms, go to quick_add and remove forced value of zoom window to zw_0 --->
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
	<div align="center" id="cart_summary" style="z-index:6;">
	</div>
						
  <!--- End Matt Bayuk - SGM --->
<!--- 
  <cfinclude  template="statsrecord.cfm">
 --->
</div>

  </td>
  </tr>
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
		<cfset session.gallery='/gemstone.cfm' />

	    <cfset session.filter= #CGI.QUERY_STRING# >

  <cfcatch type="application">
  </cfcatch>
</cftry>
</div>
</cfif>
</div>
</div>
        <cfinclude template="/mainfooter.cfm">

</div>
<cfoutput>#ref_des#</cfoutput>


</BODY>
</HTML>