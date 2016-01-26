 
 
  <cfparam name="metatitle" default="">
<cfparam name="sortby" default="stone">
<cfparam name="metadescription" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="pendantsdone" default="no">
<cfparam name="earringsdone" default="no">
<cfparam name="braceletsdone" default="no">
<cfcache timespan="#createtimespan(1,0,0,0)#">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<script language="JavaScript" src="/js/mm_menu.js"></script>
<script language="JavaScript" src="/js/topmenu.js"></script>
<script language="JavaScript" src="/js/global.js"></script>
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<!---<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
 <script src="/test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="/test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script>
--->
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="">
<cfif style neq "" and url.style eq "">
  <cfset url.style=style>
</cfif>
<cfparam name="silverjewelry" default="">
<cfset sj = "">
<cfparam name="invstatus" default=-3	>
<cfif session.mail eq application.admin_email>
  <cfset url.edit =  'mamamia'>
  <cfset invstatus= -5>
</cfif>
<cfparam default="662222" name="l">
<cfset  top = 114 />
<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
  <cfparam name="displayrows" default="10">

<CFPARAM NAME="displaycolumns" DEFAULT="4">
<CFPARAM NAME="numpages" DEFAULT="0">
<cfparam name="jewelrysize" default="">
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="ALL" >
<CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq application.admin_email>
  <cfset invstatus=0>
</cfif>
<cfif category is "bracelets" or category is 'beads'>
  <cfset displayrows=3>
  <cfset displaycolumns="5">
</cfif>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="subcat2" DEFAULT= "">
<CFPARAM NAME="priceless" DEFAULT="">
<cfif priceless is "">
  <cfif subcat is "" and category neq "beads">
    <cfset priceless = "">
  </cfif>
</cfif>
<cfset price_array  = arraynew(1)>
<cfset status_array  = arraynew(1)>
<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
<Cfif style EQ "silver" or style EQ "silverbeaded">
  <cfset url.silverjewelry=silverjewelry>
</Cfif>
<CFINCLUDE TEMPLATE="/setup.cfm">
<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
  <CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
  <cfelse>
  <cfif dateformat(now(),"dddd") eq "Sunday">
    <CFPARAM NAME="url.sortorder" DEFAULT="lastbought">
    <cfelseif dateformat(now(),"dddd") eq "Monday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
    <cfelseif dateformat(now(),"dddd") eq "Tuesday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
    <cfelseif dateformat(now(),"dddd") eq "Wednesday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="lastbought">
    <cfelseif dateformat(now(),"dddd") eq "Thursday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
    <cfelseif dateformat(now(),"dddd") eq "Friday" >
    <CFPARAM NAME="url.sortorder" DEFAULT="newitem desc" >
    <cfelse>
    <CFPARAM NAME="url.sortorder" DEFAULT="datetaken desc" >
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
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="url.subcat" DEFAULT= subcat>
<cfparam name="url.category" default=category />
<CFPARAM NAME="advancedsearch" DEFAULT= "">
<CFPARAM NAME="advancedsearch1" DEFAULT= "">
<CFPARAM NAME="advancedsearch2" DEFAULT= "">
<CFPARAM NAME="advancedsearch3" DEFAULT= "">
<CFPARAM NAME="color" DEFAULT= "">
<CFPARAM NAME="Bcolor" DEFAULT= "white">
<CFPARAM NAME="salestatus" DEFAULT="">
<CFPARAM NAME="newcart" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="">
<CFPARAM NAME="j" DEFAULT="">
<CFPARAM NAME="pricegreater" DEFAULT="">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cfif isnumeric(advancedsearch)>
  <cflocation url="detail.cfm?newitem=#advancedsearch#">
</cfif>
<cfinclude template="/checkinjection.cfm">
<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring; 
 } 

  session.gallery = 'list' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
IF (advancedsearch is not "") {
 category ="" ;
 subcat = "";
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark =''; 
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors ='Red,Blue,Gray,Orange,Green,Maroon,Black,Pink,White,Maroon,Purple';
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=21;
   displaycolumns = 5;
if ( screensize is "small"){
 displaycolumns = 4;
}
}
</cfscript>
<cfset categ=category>
<cfif category is "All">
  <cfset categ="JEWELRY">
</cfif>
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">
<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='nothing'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale'>
    <cfset metatitle="Wholesale #subcat# #categ#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
    <cfelseif cgi.server_name contains "semiprecious.in">
    <cfset metatitle="Jewellery For India #replace(contentbypage.title, 'jewelry', 'jewellery')#">
    <cfset metadescription="Now in India. #replace(contentbypage.metadescription, 'jewelry','jewellery')#">
    <cfset metakeywords="Indian Jewellery, Gifting Jewellery in India, #replace(contentbypage.keywords, 'jewelry', 'jewellery')#">
    <cfset pagedescription="Jewellery for Indian consumer or gifting jewellery within India. #replace(contentbypage.description, 'jewelry', 'jewellery')#">
    <cfelse>
    <cfset metatitle="#contentbypage.title#">
    <cfset metadescription="#contentbypage.metadescription#">
    <cfset metakeywords="#contentbypage.keywords#">
    <cfset pagedescription="#contentbypage.description#">
  </cfif>
</cfif> 
<!--- end meta tags for groups ----> 
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(cgi.script_name)#'>
<!--- speed up things  --->
<cftry>
 <cfif category neq "ALL">
  <cfquery DATASOURCE="gemssql"  name="getlist"> 
	select  distinct stone as subcat2, sum(inventory)+10  as inventory from CatSubCatInStock  where cat='#category#' and inventory>0 and stone <>'bulk lots'  and stone <>'fabric' and stone<>'silk thread'  group by stone  order by <cfif sortby eq 'stone'> stone<cfelse> inventory desc</cfif>  
	</cfquery>
<cfelse>
  <cfquery DATASOURCE="gemssql"  name="getlist">
Select distinct stone as subcat2, sum(inventory)+10 as inventory from catsubcatinstock where inventory>0
and  cat <> 'ornaments' and cat <>'bags'  and cat <>'beads' and cat <>'healing' and cat <>'gems' and stone <>'bulk lots'  and stone <>'fabric' and stone<>'silk thread' group by stone order by <cfif sortby eq 'stone'> stone<cfelse> inventory desc</cfif> 
	</cfquery>
    </cfif>
    
    <!---	
	 and stone not in (
	 
	Select subcat2 from (Select top 25 sum([inventory]) as stock, stone as subcat2 from (select * from catsubcatinstock  where  cat <> 'ornaments' and cat <>'bags' and cat <>'beads') x group by stone, inventory order by stock desc
	) x) 	Select 'Blue Topaz' as subcat2
	Union
	Select 'Lemon Quartz' as subcat2
	Union
	Select 'Amber' as subcat2
	union
	Select 'Ruby' as subcat2
	union
	Select 'Emerald' as subcat2
	union
	Select 'Sapphire' as subcat2
	union
	Select 'Aquamarine' as subcat2
	union
--->
  <cfcatch type="database">
    <b>Sorry, there has been a database error, please call us at 1 512 589 9009 to inform us.</b>
  </cfcatch>
</cftry>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>
<cfif category is "ALL" or category is "">
  <cfset p = "Jewelry">
  <cfelse>
  <cfset p = category>
</cfif>
<CFOUTPUT>
  <TITLE style="text-transform:capitalize;">
  <cfif metatitle neq "">
#metatitle#
    <cfelse>
    <cfif cgi.server_name contains 'semipreciouswholesale.com'>
Wholesale
    </cfif>
    #titleCase(color)# #titleCase(subcat)# #style# #titlecase(p)# gem stone
  </cfif>
  </TITLE>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gem stone,  #p#"</cfif>>
  <meta name="author" content="Anup Pandey" />
  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"</cfif>>
</cfoutput>
<META content="60 days" name=revisit-after>
  <noscript></noscript>
    <style>
	td.stoneslisting a {
	font-size: 10px;
	font-weight:bold ;
	color:#000099;
	text-decoration:none;
	}
	td.stoneslisting {
	padding: 3px;
	}
	</style>
</HEAD><BODY style="margin-top:0;">
<div align=center>
  <CFINCLUDE TEMPLATE="/header#session.country#.cfm">
<div id="container2">
<table id="container1" width="930px" cellspacing="0" cellpadding="0" border="0" style="padding:0 5px 0 5px" >
<tr style="width:904px;" align="left">
  <td valign="top" style="padding-left:10px" width:"830px">
    <h2 align="center" style="font-size:14px;font-weight:bold;color:#CC0000;"><br>ALL GEMSTONES<br><hr></h2>
  <cfset display = displaycolumns*displayrows>
  <cfset tw =  606>
<CFSET columns=1>
<CFSET rows=1>
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>
<table id="container1" cellspacing="0" cellpadding="0" border="0">
  
    <cfset rowsdisplayed = 0>
    <cfset itemCount = 0>
    <cfset itemlist = 0>
  <CFLOOP QUERY="Getlist">
    <cfset itemCount = itemCount + 1>
    <CFIF COLUMNS eq 1>
      <tr >
      
    </CFIF>
<cfoutput>
    <td width="5%" align="center">
    	<img src=/images/stones/gemstone-thumbs/#replace(lcase(subcat2)," ","",'all')#-n.jpg width=20 height=20<!--- alt="#subcat2# gemstone thumbnail" --->>
    </td>
    
    <td width="20%">
    	<a href='/#replace(lcase(subcat2)," ","",'all')#<cfif category neq "ALL">_#category#</cfif>.cfm' style="font-family:Arial,size:10; Helvetica, sans-serif;color:##333333">
        	#ucase(subcat2)#
			<cfif category is "ALL">COLLECTION<cfelse>#ucase(category)#</cfif>
        </a>
        (#inventory#)  
    </td>
    
    </cfoutput>
    <cfif columns EQ displaycolumns>
      <cfset rowsdisplayed = rowsdisplayed + 1>
      </tr>
			<tr>
      	<td colspan="8">
        	&nbsp;
        </td>
      </tr>
      <CFSET columns=1> 
      <cfelse>
      <CFSET columns=columns + 1>
    </cfif>
  </CFLOOP>
   <cfif columns neq 1><cfoutput>
      <!---- means the last box in the row was not filled before comng out of query loop--->
	<td coslpan="#evaluate(displaycolumns - columns+1)#">&nbsp;</td></tr></cfoutput>
  </cfif>
<!---      <cfoutput>
          <td class=rowwb><a href='gemstone-jewelry.cfm?subcat=#subcat#'><b>all #subcat# jewelry together</b></a></td>
      </cfoutput>
      <CFSET columns=columns + 1>
      <cfloop from="#columns#" to="#displaycolumns#" index="idx">
        <td class="rowb">&nbsp;</td>
      </cfloop>
      <cfset rowsdisplayed = rowsdisplayed + 1>
      </tr>
      
      <cfelse>
      <tr>
        <td height=1 colspan="<cfoutput>#displaycolumns#"><a href='gemstone-jewelry.cfm?subcat=#subcat#'><b>all #subcat# jewelry together</b></a></td>
      </tr>
      </cfoutput>
      
    </cfif>
    <tr>
      <td height=10 colspan="<cfoutput>#displaycolumns#</cfoutput>" bgcolor=black></td>
    </tr>--->
    
<cfoutput>  
	<cfif pagedescription neq "" or session.mail is application.admin_email>
    <Tr valign="middle">
      <td valign="middle" style="color:##666600;" class="rowb" colspan=#displaycolumns#><b><font color=gray size="-2"><i>#pagedescription#</i></font></b><br>
        <cfif session.mail is application.admin_email>
          <a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
        </cfif>
      </td>
    </tr>
  </cfif>
<tr>
<td colspan="#displaycolumns#">
  <cfinclude template="../includes/linkexchangebystone.cfm">
    <script language="JavaScript1.1">
		function showDetails(itemNum) {
			hideAll(); 
			document.getElementById('div' + itemNum).style.display = 'block';
		}
		function displayZoom(zoomImg,imageWidth) {
			$.blockUI.defaults.css = {};
			$.blockUI( {
				message: "<input type='button' id='closeZoom' value='Close' /><br><img src='" + zoomImg + "' />",
				css: {  
					width:			imageWidth + 'px',
					padding:        0,
					margin:         0,
					top:  (jQuery(window).height() - 500) /2 + 'px', 
					left: (jQuery(window).width() - imageWidth) /2 + 'px', 
					textAlign:      'center', 
					color:          '##000', 
					border:         '3px solid ##aaa',
					backgroundColor:'##fff'			
				}  
			});      
			$('##closeZoom').click(function() { 
				$.unblockUI(); 
			}); 
 //		    setTimeout(jQuery.unblockUI, 2000); 			
		}
		
		function zoomImage(zoomImg) {

			imgZoom = new Image();
			imgZoom.src = zoomImg;
			if (imgZoom.width > 0) {
				displayZoom(zoomImg, imgZoom.width);
			}
			else {
				imgZoom.onload = function(){
					imgZoom.onload = null;
					displayZoom(zoomImg,imgZoom.width);
				}
			}
		}
function hidex() {
		divx.style.display='none';
			
		}

		function hideAll() {
			for (i=1; i<=#itemcount#; i++) {
				eval('div'+i).style.display='none';
			}
		}
try {		
ShowHide('jumpstart');
	<cfif start eq 1>
ShowHide('jumpstartblinder');
</cfif>			

<cfif subcat neq "" and subcat neq "beaded">
	document.getElementById("#subcat#").style.color = "maroon";
//document.getElementById("#subcat#").style.fontWeight = "bold";
 document.getElementById("#subcat#").style.textDecoration = "none" ;
  document.getElementById("#subcat#").style.backgroundColor = "#light#";
  document.getElementById("#subcat#").parentNode.style.backgroundColor = "#light#";
  
		
  <cfif  listfind('bracelets,necklaces,earrings,pendants',category)>
  <!--- because this element is not created for healing & rings yet. This element is created inthe pop up list of the categories --->
  document.getElementById("#lcase(category)#_#subcat#").style.color = "##000066";
document.getElementById("#lcase(category)#_#subcat#").style.backgroundColor = "#light#";
 document.getElementById("#lcase(category)#_#subcat#").style.textDecoration = "none" ;
 </cfif>
   </cfif>
	<cfif len(category) GT 4 >
	document.getElementById("#lcase(category)#").style.color = "maroon";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
  <cfif  (subcat neq "" and subcat neq "beaded") or color neq ""  or salestatus eq 3 or priceless neq "">
 	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
		document.getElementById("#lcase(category)#_horiz").style.backgroundColor = "#light#";
  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;
	</cfif>
 //	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
//		document.getElementById("#lcase(category)#_horiz").style.backgroundColor = "##DADA99";
//  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;

//  document.getElementById("#lcase(category)#").style.backgroundColor = "##DADA99" ;
  
</cfif>
<cfif isdefined("url.silverjewelry")>
 	document.getElementById("#lcase(url.silverjewelry)#").style.color = "maroon";
	document.getElementById("#lcase(url.silverjewelry)#").style.backgroundColor = "#light#";
/*	document.getElementById("#lcase(url.silverjewelry)#").parentNode.style.backgroundColor = "##DADA99"; 
	*/
    document.getElementById("#lcase(url.silverjewelry)#").style.textDecoration = "none" ;
	<cfif url.silverjewelry is 1>
	document.getElementById("silver").parentNode.style.backgroundColor= "#light#";
	<cfelseif url.silverjewelry is 0 >
		document.getElementById("silver").parentNode.style.backgroundColor = "##E4E4E4";
		</cfif>
</cfif>
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/
} catch (e) {; };
	</script>
  
  <!--- <cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
 --->
  <!---  <cfif isdefined("session.bulkbuyer.id")>
    <script type="text/javascript" language="JavaScript1.1">
 	<!-- 
	document.getElementById("wholesale").style.color = "maroon";
	 	
  document.getElementById("wholesale").style.textDecoration = "none" ;
	//-->
	</script>
  </cfif>
--->
  <cftry>
  <cfset session.gallery= CGI.url />
    <Cfif len(cgi.QUERY_STRING)>
      <cfset session.filter=CGI.QUERY_STRING >
      <cfelse>
      <cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
    </Cfif>
    <cfcatch type="application">
    </cfcatch>
  </cftry>    
  <!--- Footer --->
  <!--- End footer --->
   </td>
  </tr>
</cfoutput>  
</table>
</tr></td></table>
 </div>
 <cfinclude template="/mainfooter.cfm">
 </div>
</BODY>
</HTML>
