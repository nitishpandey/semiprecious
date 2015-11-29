<cfset summary = " " />
	<CFPARAM NAME="orderonrequest" DEFAULT= "1" />
	<CFPARAM NAME="country" DEFAULT= "" />
	<CFPARAM NAME="designer" DEFAULT= "" />
	<cfparam name="session.address.country_code" default="" />	
	<CFPARAM NAME="session.gallery" DEFAULT= "gemstone_jewelry_gallery.cfm" />
	<CFPARAM NAME="session.filter" DEFAULT= "sortorder=datetaken" />
	<cfparam name="style_for_added" default="" />	
	<CFPARAM NAME="description" DEFAULT="" />
	<CFPARAM NAME="Price" DEFAULT= "1000" >
	<CFPARAM NAME="width" DEFAULT= "" >
	<cfparam name="pimg" default="" >
	<cfparam default="0" name="valueadd" >
	<cfparam name="status" default="0" >
<cfparam name="url.optionid" default="0" >
<cfparam name="url.quantity" default="1" type="numeric" >
<cfparam name="url.existqty" default="0" >
<CFPARAM NAME="SalePrice" DEFAULT= "" >
<CFPARAM NAME="category" DEFAULT= "" >
<CFPARAM NAME="subcategory" DEFAULT= "" >
<CFPARAM NAME="stonename" DEFAULT= "" >
<CFPARAM NAME="NameID" DEFAULT= "" >
<cfif isdefined("url.newitem")>
  <cfset url.itemnumber = url.newitem>
</cfif>
<cfparam name="itemnumber" default="0" >
<cfparam name="session.screenwidth" default="833" type="numeric" >
<CFPARAM NAME="cart" DEFAULT="" >
<CFPARAM NAME="itemnumber" DEFAULT="" >
<CFPARAM NAME="invent" DEFAULT="" >
	<cfparam name="title" default="Semiprecious Silver Jewelry - Peridot, Amethyst...variety of necklaces, bracelets, pendants" >
<CFPARAM NAME="editcart" DEFAULT="" >
<CFPARAM NAME="url.filter" DEFAULT="" >

<cfif designer neq "" >
  <cfset itemnumber=designer>
  <cfset url.newitem=designer>
  <cfset url.itemnumber=designer>
</cfif>
<!--- processing for item number after a forward slash --->
<CFPARAM Name="DSNNAME" default="semiprecious" >
<CFPARAM name="imageloc" default="web" >
<CFPARAM name="display" default="20" >
<CFPARAM name="Currencyexchange" default="1" >
<CFPARAM name= "PicWidth" default= "120" >

<!--- This is set up to differentiate between local test environment and
the web environment --->

<CFPARAM name="stopshipdate" default="07/14/08" >
<CFPARAM name="nextshipdate" default="7/22/08" >



<cffunction name="filterarrayfind" output=True>
  <cfargument name="a" >
  <cfloop from="1" to="#arraylen(session.filterarray)#" index="idx" >
    <cfif session.filterarray[idx][1] eq a>
      <cfreturn idx>
    </cfif>
  </cfloop>
  <cfreturn 0>
</cffunction>

<cfset pattern = #cgi.PATH_INFO#>
<cfif not isdefined("url.itemnumber")>
  <cfif Find('/', pattern) gt 0>
    <cftry>
      <cfset  underscore = find('_',pattern,1)>
      <cfif underscore>
	        <CFSET itemnumber = mid(pattern,2, underscore-2)>
        <cfelse>
	        <cfset  underscore = find('.htm',pattern,1)>
	        <cfif underscore>
		          <CFSET itemnumber = mid(pattern,2, underscore-2)>
	          <cfelse>
		          <CFSET itemnumber = mid(pattern,2, len(pattern)-2)>
	        </cfif>
      </cfif>
      <cfset newitem = itemnumber>
      <cfcatch type="any" >
        <cfset itemnumber  = "7216" >
        <!---  ERROR CAUTH --->
      </cfcatch>
    </cftry>
  </cfif>
<cfelse>
	 <cfset newitem = url.itemnumber>
</cfif>

<!---<cfif newitem NEQ "" >  <Cfset itemnumber = newitem>  </cfif>end --->
<!--- the original before adding quertystring to the url <CFIF (category is "") And (itemnumber is  not "")>--->
<CFIF  isnumeric(itemnumber)>
	<CFQUERY DATASOURCE="gemssql" NAME="stats" >
		update itemstats set zoom=zoom+1 where itemid =#newitem#
	</cfquery>
	  <CFQUERY datasource="gemssql" name="details" >
		  Select grouping, itemnumber, size, weight, style, color, storage, imagelink, inventory, orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, subcat2, cat, morepics from 
		  items where newitem=#itemnumber# 
	  </cfquery>
	  
	  <cfif details.recordcount >
		     <cfquery name="getGroups" datasource="gemssql" >
				Select distinct groupname from itemsbygroup where itemid=#itemnumber#
			</cfquery>

		  <CFSET status = details.status>
		  <cfif session.bulkbuyer.id neq ""  >
			    <cfif isnumeric(details.wholesaleprice)>
				      <CFSET price=details.wholesaleprice>
			      <cfelse>
				      <cfset price = details.price/2 />
		    	</cfif>
				<cfset recoprice = details.price />
		    <cfelse>
			    <CFSET price=details.price>
			     <cfif details.status eq 3>
				      <CFSET SalePrice = session.sale_factor*details.saleprice>
			     </cfif>
			 </cfif>
		  <CFSET description=details.description />
		  <CFSET NameId=details.NameID />
		  <cfset optcount = details.optcount />
		  <CFSET newitem = details.newitem />
		  <CFSET category = details.cat />
		  <cfset folder = lcase(category) />
		  <CFSET subcategory = details.subcat />
		  <CFSET invent = details.inventory />
		  <cfif findnocase('silver',details.style)>
		    <cfset description = description & '<br /><font color=gray>Our Jewelry is all hand-made. Silver used is 92.5 sterling silver unless otherwise noted</font>'>
		  </cfif>
 			<cfset listofstoneswithproperties ="AGATE,AMETHYST,BLOODSTONE,CARNELIAN,CITRINE,FLUORITE,GARNET,HEMATITE,IOLITE,JADE,JASPER,LAPIS_LAZULI,MALACHITE,MOONSTONE,MOSS_AGATE,PEARL,PERIDOT,ROSE_QUARTZ,QUARTZ,SMOKEY_QUARTZ,SMOKY_QUARTZ,SODALITE,TIGER_EYE,TOURMALINE,TURQUOISE" >
		  <cfif len(subcategory)><!--- subcategory is basically the stoneslist --->
			    <cfset stonelist = replacenocase(subcategory,"and",",","All")>
			    <cfset stonelist = replace(subcategory,";",",","All")>
		    <cfloop list="#stonelist#" index="ston" >
			       <cfset ston = trim(ston)>
			       <cfset ston = replace(ston," ","_","one")>
			       <cfif ListContainsnocase(listofstoneswithproperties, ston)>
				        <cfif isdefined("stones2")>
					          <cfset stones2 = stones2 & "," & ston>
					          <cfset stonecount = stonecount +1>
				          <cfelse>
					          <cfset stonecount = 1>
					          <cfset stones2 = ston>
					          <cfset Stonename=ston>
				        </cfif>
			        <cfelse>
				        <cfif find(" ",ston)>
				           <cfset stone = replace(ston," ","_","all")>
				             <cfif ListContainsnocase(listofstoneswithproperties, ston)>
					              <cfif isdefined("stones2")>
						              <cfset stones2 = stones2 & "," & ston>
						              <cfset stonecount = stonecount +1>
					               <cfelse>
						              <cfset stonecount = 1>
						              <cfset stones2 = ston>
						            </cfif>
					          </cfif>
				         </cfif>
				     </cfif>
		    </cfloop>
		  </cfif>

				<cfsavecontent variable="title" >
							<cfoutput>  
								<cfif cgi.server_name contains 'wholesale'>
						Wholesale
						  </cfif>
						  		 #subcategory#
						  <cfif details.subcat2 neq "" >
						    & #details.subcat2#
						  </cfif>
						  #category#
						  </cfoutput>
						  <cfloop query="getgroups" >
						    <cfoutput>#groupname#</cfoutput>
						  </cfloop>
						  <cfoutput>
						  #details.color# gem stone #details.style# #category# #itemnumber#
						</cfoutput>  
				</cfsavecontent>
		<cfelse>
<cfset folder="rings" />		  
           <cfset k = QueryAddRow(details) />
	        <cfset k = QuerySetCell(details,"grouping","classic") />
	        <cfset k = QuerySetCell(details,"optcount","12210") />
	        <cfset k = QuerySetCell(details,"size","1") />
	        <cfset k = QuerySetCell(details,"style","silver") />
	        <cfset k = QuerySetCell(details,"color","orange") />
	        <cfset k = QuerySetCell(details,"storage","USA") />
	        <cfset k = QuerySetCell(details,"imagelink","") />
	        <cfset k = QuerySetCell(details,"inventory",0) />
	        <cfset k = QuerySetCell(details,"orderonrequest",0) />
	        <cfset k = QuerySetCell(details,"price",0) />
	        <cfset k = QuerySetCell(details,"status",1) />
	        <cfset k = QuerySetCell(details,"saleprice",0) />
	        <cfset k = QuerySetCell(details,"clustercount",0) />
	        <cfset k = QuerySetCell(details,"basecost",320) />
	        <cfset k = QuerySetCell(details,"wholesaleprice",320) />
	        <cfset k = QuerySetCell(details,"newitem",1320) />
	        <cfset k = QuerySetCell(details,"description","Item not available") />
	        <cfset k = QuerySetCell(details,"nameid","Item not available") />
	        	        <cfset k = QuerySetCell(details,"subcat","Moonstone") />
	        	        <cfset k = QuerySetCell(details,"subcat","Moon stone") />
	        	        <cfset k = QuerySetCell(details,"cat","Jewelry") />
	        	        <cfset k = QuerySetCell(details,"morepics",0) />
	        	                                 <cfset getgroups = QueryNew("groupname","varchar")>
	        	                                 
	        	        	        	        <cfset k = QueryAddRow(getgroups) />

	        	        	        	        <cfset k = QuerySetCell(getgroups,"groupname","sterling silver") />
	        	
	  </cfif>
	
	
	
	
	<cfquery datasource="gemssql" name="checkcluster">
	select  itemid from styles,items where  itemid = #itemnumber#
	</cfquery>
	
    	<cfquery datasource="gemssql" name="getcluster">
    	select top 5 styles.itemid , 0 as orderbuy, styles.cat,inventory from styles, items where (status = 0 or status=3) and items.newitem=itemid and inventory>0 and styleid =
    	(select  max(styleid) from styles where itemid = #itemnumber#) and itemid <>#itemnumber# order by disporder
<!---    	union
		Select top 5 newitem as itemid, 1 as orderbuy, cat, inventory from items where subcat='#subcategory#' and cat <>'#details.cat#' and inventory>0 order by orderbuy  
	--->
		</cfquery>
		                    <CFIF #NameID# is "" >
                      <cfset imagename= newitem & ".jpg" >
                      <CFELSE>
                      <cfset imagename = NameID >
                    </CFIF> 

  <cfelse>
	  <Cfset category = "" >
	  <cfset itemnumber  = "" >
	  <cfset newitem = 1009>
</cfif>
<cfsavecontent variable="headpart" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<cfif session.mail neq application.admin_email >
  <SCRIPT LANGUAGE="JavaScript1.1" >
<!-- Original:  Martin Webb (martin@irt.org) --> 
  
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com --> 
  
<!-- Begin

if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);

//  End -->
</script>
  <SCRIPT LANGUAGE="JavaScript1.1" >
<!-- Original:  Martin Webb (martin@irt.org) --> 
  
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com --> 
  
<!-- Begin
function right(e) {
if (navigator.appName == 'Netscape' &&
(e.which == 3 || e.which == 2))
return false;
else if (navigator.appName == 'Microsoft Internet Explorer' &&
(event.button == 2 || event.button == 3)) {
alert("I'm sorry, The Right click option on your mouse has been disabled for the download window pages.");
return false;
}
return true;
} 
  
document.onmousedown=right;
document.onmouseup=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);
window.onmousedown=right;
window.onmouseup=right;
//  End -->
</script>
<cfelse>
</cfif>
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
<script language="JAVASCRIPT1.1" type="TEXT/JAVASCRIPT">
<cfoutput>
var cat = '#category#' ;
var current_item = #newitem#;
</cfoutput>

function customChange()
{

if (req.readyState == 4) {
		if (req.status == 200 ) {
//alert(req.readyState);
			good = 0;
			if (window.DOMParser) // our CFC is sending in xml disguised as text. this we had to do  because when we try to send in XML content (http header text/xml) then it creates problems for normal cfmx pages since then the browser believes everything else is also xml compliant
			{
			document.getElementById('custom_state').innerHTML =req.responseText;
return;
			xmlDoc=parser.parseFromString(req.responseText,"text/xml");
			}
			else // Internet Explorer
			{
			xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false";
			xmlDoc.loadXML(req.responseText);
			} 
			if (xmlDoc)	{
				if (xmlDoc.documentElement)  // for mozilla we need to test for req.response itself and this one is for IE
				{
					good = 1;
				}
			}

			if ( good == 0 )
			{
				//document.getElementById("ajaxcheck").value  = 0 ;
				goProcess('add'); // that process basically submits the form for post to web
			}

	if (good == 1) {

				var	response = xmlDoc.documentElement;
                        }

			}
		}	
	return;
}

function custom_select(i,s)
{
var p = Math.random();

var url = '/customrequest/custom.cfc?method=custom_status&itemid='+i+'&category='+cat+"&status="+s +"&dcache="+p;
if (window.XMLHttpRequest) {
//alert('i called successfully');
  req = new XMLHttpRequest();
  req.onreadystatechange = customChange;
  req.open("GET",url,true);
  req.send(null);
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");
if (req) {
 //alert(url);
 req.onreadystatechange = processReqChange;
 req.open("GET",url,true);
 req.send();
         } 
     }

return;
}

function alsolikethis(i)
{
var p = Math.random();

var url = '/zoomx.cfm?itemnumber='+i+"&dcache="+p;
if (window.XMLHttpRequest) {
//alert('i called successfully');

  document.getElementById("curtain").style.display= 'block';
	var element =         document.getElementById("curtain");   
	element.style.height= "100%";

//  document.getElementById("thumb_"+current_item).style.borderStyle = "dotted";
 // document.getElementById("thumb_"+current_item).style.color = "red";
  document.getElementById("thumb_"+current_item).style.border = '0px dashed red'
  document.getElementById("thumb_"+current_item).style.display = 'inline'

  current_item = i;
  document.getElementById("thumb_"+current_item).style.border = '1px dashed red'
  document.getElementById("thumb_"+current_item).style.display = 'none'

  req = new XMLHttpRequest();
  req.onreadystatechange = itemdetails;
  req.open("GET",url,true);
  req.send(null);
 }
 else if ( window.ActiveXObject) {

  req = new ActiveXObject("Microsoft.XMLHTTP");
if (req) {
 //alert(url);
 req.onreadystatechange = itemdetails;
 req.open("GET",url,true);
 req.send();
         } 
     }

return;
}

function changeColorIncremental(i) {     
	var element =         document.getElementById("curtain");   
	element.style.height= i+"%";
	      if (i > 0) {         // Note the 50 millisecond wait below.  Decrease this to speed up  
	      	       // the transition, and increase it to slow it down.  
	      	              setTimeout('changeColorIncremental(' + (i - 1) + ')', 20);     }
	      	              else
	      	              element.style.display= 'none'; 
	      } 

function itemdetails()
{

if (req.readyState == 4) {
		if (req.status == 200 ) {
			
			//    document.getElementById("curtain").style.display= 'none';

	        
	//alert(req.readyState);
			good = 0;
			if (window.DOMParser) // our CFC is sending in xml disguised as text. this we had to do  because when we try to send in XML content (http header text/xml) then it creates problems for normal cfmx pages since then the browser believes everything else is also xml compliant
			{
			document.getElementById('itemdetails').innerHTML =req.responseText;
			    changeColorIncremental(99);
			return;
			xmlDoc=parser.parseFromString(req.responseText,"text/xml");
			}
			else // Internet Explorer
			{
							document.getElementById('itemdetails').innerHTML =req.responseText;
							    changeColorIncremental(99);
							return;
			xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
			xmlDoc.async="false";
			xmlDoc.loadXML(req.responseText);
			} 
			if (xmlDoc)	{
				if (xmlDoc.documentElement)  // for mozilla we need to test for req.response itself and this one is for IE
				{
					good = 1;
				}
			}

			if ( good == 0 )
			{
				//document.getElementById("ajaxcheck").value  = 0 ;
				goProcess('add'); // that process basically submits the form for post to web
			}

	if (good == 1) {

				var	response = xmlDoc.documentElement;
                        }

			}
		}	
	return;
}


</script>




<cfoutput>
  <link rel="canonical" href="/gem_stone_#details.cat#.cfm/#details.newitem#_#details.cat#_#details.subcat#<cfif details.grouping neq "">_#listfirst(details.grouping)#</cfif>.htm"/>
  <TITLE>#titlecase(title)#</TITLE>
<script language="JavaScript" src="/js/global.js"></script>
<script language="JavaScript" src="/js/macromediafuncs.js"></script>
<!---
<script language="JavaScript" src="/js/mag.js"></script>--->
<style type="text/css">     
<!--
<cfif isdefined("form.bought")>
.#form.newitem#_#form.optionid# {
	background-color:##FDFDFD;
}
</cfif>
.place_holder #style_for_added# {
padding-left:18px;font-weight:700;height:16px;background:url('/images/added.png') no-repeat scroll 0px 0px ##E6F8DD;padding-top:1px;
}

    --> </style>
	<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" >
  <script language="JavaScript" > 
vCurrentInventory = #invent#;
                     
						function swapMainImage(pImage)
						   { document.getElementById('mainimage').src = pImage; }

</script>
<!--- 
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
 --->
 <cfif cgi.server_name contains "wholesale">
<script language=JAVASCRIPT src="/javascript/wholesalezoom.js" type="text/javascript" ></script>
<cfelse>
<script language=JAVASCRIPT src="/javascript/#session.country#zoom.js" type="text/javascript" ></script>
</cfif>

    <style type="text/css">
        .style1
        {
            width: 930px;
        }
        .style2
        {
            width: 100%;
        }
		td { vertical-align:top;}
		td.topmenu_td td { vertical-align:middle;}
        .style3
        {
            vertical-align:top;
        }
    </style>
	
<meta name="description" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory#</cfoutput>
<cfloop query="getgroups" >
<cfoutput> #groupname# </cfoutput></cfloop> <cfoutput>#category#: #details.description#</cfoutput>. We are in Austin TX and India" >
<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale'>Wholesale </cfif><cfoutput>#subcategory# #category#,</cfoutput><cfloop query="getgroups" ><cfoutput> #groupname# #subcategory#  #category#,</cfoutput></cfloop><cfoutput> <cfif details.color contains "," >multicolor<cfelse>#details.color#</cfif> stone #category#</cfoutput>" >
</cfoutput>
</head>
<body style="margin-top:0px">
<div style="filter:alpha(opacity = 70); position:absolute;top:0px;left:0px;width:100%;height:100%;background-color:rgb(122,80,100);opacity:0.7;display:none;z-index:5;" id="curtain">
	<span style="height:28px;position:relative;top:50%;left:50%;color:white;font-weight:700">Loading ... <img  src="/images/ajax.gif" alt="loading indicator" />
</span>
</div>
    <table align="center" class="style1 ">
        <tr>
            <td class="topmenu_td">
             		  <cfinclude template="/header#session.country#.cfm" ></td>
        </tr>
        <tr>
            <td>
                <table align="left" class="style2">
                    <tr>
                        <td class="style3">
  <cfset leftgemstonedisplay="inline" />
   <CFINCLUDE TEMPLATE="/leftmenus.cfm" >
</td>
                        <td>
 
						<table align="left" cellspacing="1" class="style2">
                                <tr>
                                    <td id="itemdetails" style="text-align:center; border:1px #6c3D3A solid;" >
</cfsavecontent>										
				<cfsavecontent  variable="display" >
					<cftry>
						<cfinclude template="itemdetails.cfm" />
						<cfcatch type="any">
						Item Id provided is not valid
						</cfcatch>
						</cftry>
				</cfsavecontent>
			
				<cfsavecontent variable="bottompart">
									</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
            
					 <cfif getcluster.recordcount gt 0 >
        <div style="position:relative;">
        <div id="zoom_like_these" style="position:absolute;top:0px;left:363px;width:250px;text-align:center;padding:2px;"></div>
		<div id="easy_string" style="display:none;"><div style="width:inherit;text-align:center;cursor:pointer" class="grayplacard" onClick="document.getElementById('zoom_like_these').innerHTML='';">Close Zoom Window</div>
		<div style="width:inherit;text-align:center;" class="component_box"><strong>To Buy Click on Thumb Nail or Picture Below</strong></div>
		</div>
		<div style="position:relative;border:1px gray solid;padding:0;margin:0;border-top:2px black solid;" > 
        <span style="position:absolute;top:-10px;left:30px;background-color:white;border:1px gray solid;border-left:2px black solid;border-right:2px black solid;background-color:orange;">&nbsp;<font color="black" >YOU MAY ALSO LIKE THESE &dArr;&nbsp;</font></b></span>
		<table border=0 cellpadding=4>
        <cfset coll=1>
        <tr>
    <td align="center">
	<cfoutput>
		<a	href="javascript:alsolikethis(#newitem#);">
		<img id="thumb_#newitem#" border="1" style="border:1px dashed red" title="click to buy this design" alt="click here to buy this design" src="/images/#category#/thumb/#newitem#.jpg" border="0" width="100" />
	</a>
	</cfoutput>
	    <cfoutput query="getcluster">
        <cfset coll=coll+1>
        <td align="center" >
        <a title="click to buy this design" href="javascript:alsolikethis(#itemid#);" onouseOver="document.getElementById('zoom_like_these').innerHTML=document.getElementById('easy_string').innerHTML + ' <a href=\'/jewelry_item.cfm?newitem=#itemid###jewelry_top\'><img src=\'/images/#cat#/#itemid#.jpg\' /></a>';" >
		<img id="thumb_#itemid#" title="click to buy this design" alt="click here to buy this design" src="/images/#cat#/thumb/#itemid#.jpg" border=1 width=100>
		<cfif not getcluster.inventory and not getcluster.orderonrequest ><br /><i>sold out</i></cfif></td>
		<cfif coll is 7></tr><tr><cfset coll=0></cfif>
        </cfoutput>
        <cfset missingTDs=#evaluate(7-coll)#>
        <cfloop from="1" to="#missingtds#" index=k><td></td></cfloop></tr>
        </table></div>	
        </cfif>
               </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <cfinclude template="/mainfooter.cfm" >
</td>
        </tr>
    </table>

</body>
</html>
</cfsavecontent>
<cfoutput><cfif isdefined("url.dcache")>
#display#
<cfelse>
#headpart##display#
#bottompart#
</cfif></cfoutput>
