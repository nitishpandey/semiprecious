<cfsilent>
<CFPARAM NAME="country" DEFAULT= "">
<CFPARAM NAME="designer" DEFAULT= "">
<cfparam name="session.ajaxcheck" default="0" />
<cfset session.ajaxcheck=0>
<cfparam name="session.bulkbuyer.id" default="">
<CFPARAM NAME="description" DEFAULT="">
<CFPARAM NAME="Price" DEFAULT= "1000">
<cfparam name="pimg" default="">
<cfparam default="0" name="valueadd" />
<cfparam name="status" default="0" />
<cfparam name="catp"  default="jewelry">
<cfparam name="catn"  default="">
<cfparam name="nimg" default="">
<cfparam name="url.optionid" default="0" />
<CFPARAM NAME="SalePrice" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT= "">
<CFPARAM NAME="subcategory" DEFAULT= "">
<CFPARAM NAME="stonename" DEFAULT= "">
<CFPARAM NAME="NameID" DEFAULT= "">
<cfif isdefined("url.newitem")>
  <cfset url.itemnumber = url.newitem>
</cfif>
<cfparam name="itemnumber" default="0">
<cfparam name="existqty" default="1" type="numeric">
<cfparam name="session.screenwidth" default="833" type="numeric">
<CFPARAM NAME="cart" DEFAULT="">
<CFPARAM NAME="itemnumber" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="">
<CFPARAM NAME="editcart" DEFAULT="">
<CFPARAM NAME="url.filter" DEFAULT="">
<cfif cgi.server_name contains "semiprecious.in">
  <cfset session.india=1>
</cfif>
<cfif designer neq "">
  <cfset itemnumber=designer>
  <cfset url.newitem=designer>
  <cfset url.itemnumber=designer>
</cfif>
<!--- processing for item number after a forward slash --->
<cffunction name="filterarrayfind" output=True>
  <cfargument name="a">
  <!---  <cfoutput>#arraylen(session.filterarray)#</cfoutput> --->
  <cfloop from="1" to="#arraylen(session.filterarray)#" index="idx">
    <cfif session.filterarray[idx][1] eq a>
      <cfreturn idx>
    </cfif>
  </cfloop>
  <cfreturn 0>
</cffunction>
<cfset pattern = #cgi.PATH_INFO#>
<!---   <cfoutput>#Pattern#</cfoutput> 
 --->
<cfif not isdefined("url.itemnumber")>
  <cfif Find('/', pattern) gt 0>
    <cftry>
      <cfset  underscore = find('_',pattern,1)>
      <!---   <cfoutput>#underscore# (Uscore)</cfoutput>
 --->
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
      <cfcatch type="any">
        <cfset itemnumber  = "">
        <!---  ERROR CAUTH --->
      </cfcatch>
    </cftry>
    <!--- <cfoutput>#Pattern#,#itemnumber#</cfoutput> 
 --->
  </cfif>
</cfif>
<cfif not isnumeric(itemnumber) >
  <cfset itemnumber  = "">
  <cfset newitem = 1009>
</cfif>
<!---<cfif newitem NEQ "">  <Cfset itemnumber = newitem>  </cfif>end --->
<CFINCLUDE TEMPLATE="setup.cfm">
<!--- <cfoutput>#itemnumber#</cfoutput> --->
<!--- the original before adding quertystring to the url <CFIF (category is "") And (itemnumber is  not "")>--->
<CFIF  isnumeric(itemnumber)>
  <!--- ,<cfoutput>#itemnumber#</cfoutput>
 --->
  <CFQUERY datasource="gemssql" name="details">
  Select size, weight, style, color, storage, imagelink, inventory, price, status, saleprice,clustercount,wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, subcat2, cat, morepics from 
  items where newitem=#itemnumber# 
  </cfquery>
  <cfif details.recordcount is 0>
    <h3>Sorry, nothing found, that was the last record for the selection Please go back.</h3>
    <cfabort>
  </cfif>
  <!---
<cfif designer is "" and session.bulkbuyer.id eq "">  
  <cfif details.storage is "Angela">
  <cflocation url="http://www.semiprecious.com/2process/test/country/details.php?designer=#itemnumber#"  addtoken="yes" />
  </cfif>
</cfif>
--->
  <cfquery name="getGroups" datasource="gemssql">
Select distinct groupname from itemsbygroup where itemid=#itemnumber#
</cfquery>
  <cfif session.bulkbuyer.id neq "">
    <CFSET status = details.status>
    <cfif isnumeric(details.wholesaleprice)>
      <CFSET price=details.wholesaleprice>
      <cfelse>
      <cfset price = details.price/2 />
    </cfif>
    <!--- </cfif> --->
    <cfelse>
    <CFSET price=details.price>
    <CFSET status = details.status>
    <cfif details.status eq 3>
      <CFSET SalePrice = #details.saleprice#>
    </cfif>
  </cfif>
  <CFSET description=details.description>
  <cfif findnocase('silver',details.style)>
    <cfset description = description & '<br><font color=gray>Our Jewelry is all hand-made. Silver used is 92.5 sterling silver unless otherwise noted</font>'>
  </cfif>
  <CFSET NameId=details.NameID>
  <cfset optcount = details.optcount>
  <CFSET newitem = details.newitem>
  <CFSET category = details.cat>
  <CFSET subcategory = #details.subcat#>
  <CFSET invent = #details.inventory#>
  <!--- <cfhttp url="http://www.semiprecious.com/listofstoneswithpropertysheets.txt" method="get"   redirect="no" >
</cfhttp><cfif cfhttp.statuscode contains "200">
  <cfset listofstoneswithproperties = cfhttp.FileContent>
  <cfelse>  <cfoutput> --->
  <cfset listofstoneswithproperties ="AGATE,AMETHYST,BLOODSTONE,CARNELIAN,CITRINE,FLUORITE,GARNET,HEMATITE,IOLITE,JADE,JASPER,LAPIS_LAZULI,MALACHITE,MOONSTONE,MOSS_AGATE,PEARL,PERIDOT,ROSE_QUARTZ,QUARTZ,SMOKEY_QUARTZ,SMOKY_QUARTZ,SODALITE,TIGER_EYE,TOURMALINE,TURQUOISE
">
  <!--- #cfhttp.statuscode#.</cfoutput>  
</cfif>--->
  <cfif len(subcategory)>
    <cfset stonelist = replacenocase(subcategory,"and",",","All")>
    <cfset stonelist = replace(subcategory,";",",","All")>
    <cfloop list="#stonelist#" index="ston">
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
  <cfelse>
  <Cfset category = "">
</cfif>
<CFQUERY DATASOURCE="gemssql" NAME="stats">
	update itemstats set zoom=zoom+1 where itemid =#newitem#
</cfquery>
</cfsilent>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<cfoutput>
  <TITLE>
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
Wholesale
  </cfif>
  #subcategory#
  <cfif details.subcat2 neq "">
    &#details.subcat2#
  </cfif>
  #category#
  <cfloop query="getgroups">
    <cfoutput>#groupname#</cfoutput>
  </cfloop>
  #details.color#gem stone#category#in#details.style##itemnumber#</TITLE>
</cfoutput><cfoutput>
  <script language="JavaScript"> 
vCurrentInventory = #invent#;
</script>
</cfoutput>
<script language="JavaScript1.2"> 


//Disable select-text script (IE4+, NS6+)- By Andy Scott
//Exclusive permission granted to Dynamic Drive to feature script
//Visit http://www.dynamicdrive.com for this script 
  
function disableselect(e){
return false
} 
  
function reEnable(){
return true
} 
  
//if IE4+
document.onselectstart=new Function ("return false") 
  
//if NS6
if (window.sidebar){
document.onmousedown=disableselect
document.onclick=reEnable
}
</script>
<SCRIPT language="JavaScript" type="text/javascript">
<!-- Yahoo! Inc.
var ysm_accountid  = "10CC04QGR59A2PT01M2RHEVOJN0";
document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' " 
+ "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid 
+ "></SCR" + "IPT>");
// -->
</SCRIPT>
<script language="JavaScript1.1" src="/javascript/xmlhttp.js"  type="text/javascript" ></script>
<script language=JAVASCRIPT src="/javascript/detail2.js" type="text/javascript">
</script>
<cfif session.mail neq "acemat@vsnl.com">
  <SCRIPT LANGUAGE="JavaScript1.1">
<!-- Original:  Martin Webb (martin@irt.org) --> 
  
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com --> 
  
<!-- Begin

if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);

//  End -->
</script>
  <SCRIPT LANGUAGE="JavaScript1.1">
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
</cfif>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<!---
<meta http-equiv="pics-label" content='(pics-1.1 "http://www.icra.org/ratingsv02.html" l gen true for "http://www.semiprecious.com" r (cz 1 lz 1 nz 1 oz 1 vz 1) "http://www.rsac.org/ratingsv01.html" l gen true for "http://www.semiprecious.com" r (n 0 s 0 v 0 l 0))'>
--->
<meta name="description" content="<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>Wholesale </cfif><cfoutput>#subcategory#<cfloop query="getgroups"><cfoutput> #groupname# </cfoutput></cfloop> #category#: #details.description#</cfoutput>. We are in Austin TX and India">
<meta name="keywords" content="<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>Wholesale </cfif><cfoutput>#subcategory# #category#,<cfloop query="getgroups"><cfoutput> #groupname# #subcategory#  #category#,</cfoutput></cfloop> <cfif details.color contains ",">multicolor<cfelse>#details.color#</cfif> stone #category#</cfoutput>">
<script language="JavaScript" src="/js/imageswap.js"></script>
</HEAD>


<BODY BGCOLOR="white" link="black" topmargin='0' leftmargin="0" onLoad="javascript:ajaxcheck();"  >
<cfif cgi.server_name contains "semiprecious.in">
  <cfinclude template="/india/header.cfm">
  <cfelse>
  <cfinclude template="headerforgemstone_jewelry_gallery.cfm">
</cfif>
<cf_steps step="2" />
<!--- No category --->
<CFIF (category is "")>
<br>
<div align="center" style="background-color:pink;margin-top:4px;border:thin ridge #CCFCCC;padding-top:12px;width:798px">
  <FORM action='/jewelry_item.cfm' method='get' >
    If you have the jewelry item number handy please fill it and click on 'Details':
    <input type='text' name='itemnumber' size='5'>
    <INPUT type='submit'  class="greenbutton" value='details'>
  </form>
  <br>
  If you were trying to add an item to the shopping cart then make sure you 
  clicked on the 'Add to Cart' button. Hitting 'Enter' on your keyboard can 
  cause error.Browser
  <div style="border:2px #DADA99 ridge; position:relative;margin-top:2px;padding-right:1px;background-color:white;width:100px"> <span style="width:100%;background-color:#660066;color:white;font-weight:bold;text-align:center;"> <strong>Designs</strong><br>
    </span> <a href="showearrings.cfm">earrings</a> <br>
    <a href="shownecklaces.cfm">necklaces</a><br>
    <a href="showbracelets.cfm">bracelets</a> <br>
    <a href="showpendants.cfm">pendants</a>
    </p>
  </div>
</div>
<cfinclude template="footer.htm" >
</div>
</html>
</body>
<CFABORT>
</CFIF>
<!--- End no category --->

<table style="padding:0 10px 0 10px" cellpadding="0" cellspacing="0">
<tr valign=top>
  <td><!--- BEGIN LEFT SIDE STUFF --->
    <CFINCLUDE TEMPLATE="leftmenus.cfm">
    <!--- END LEFT SIDE STUFF ---></td>
  <td valign=top>
    <table  align='left' border="0" cellspacing="0"  bgcolor=white width="800" cellpadding="0" style="margin-top:0px;">
      <tr  valign="top" align="center">
        <td   valign="top" align="left"><CFSET folder = #LCASE(category)#>
          <cfif not isnumeric(newitem)>
            <cfset newitem = 1010>
          </cfif>
          <cfset prevpos = newitem - 1>
          <cfset nextpos = newitem + 1>
          <CFFORM ACTION="/cart.cfm" METHOD="POST" NAME="wishbuy" onSubmit="javascript:goProcess('add');return false;" style="display:inline;">
  <input type="hidden" name="ajaxcheck" value="#session.ajaxcheck#"  id="ajaxcheck"/>
             <table  width="800" bgcolr="#ff7777" cellspacing="0" cellpadding="0" border="0" align="center" style="border:0px gray solid;" >
              <!--DWLayoutTable-->
              <tr valign="top">
              <cfoutput>
                <!--- Main image --->
                <td  align="center" valign="center"   ><cfset imgname ="d:\inetpub\semiprecious\images\#folder#\#newitem#.jpg">
                  <cfx_imageinfo file="#imgname#">
                  <cftry>
                    <cfset width = imageinfo.width>
                    <cfset ht = imageinfo.height>
                    <cfif imageinfo.width GT 550 or imageinfo.height GT 400>
                      <cfif imageinfo.width GT  evaluate(imageinfo.height +50 ) >
                        <cfset width =  550>
                        <cfelse>
                        <cfset width = imageinfo.width*400/imageinfo.height>
                      </cfif>
                    </cfif>
                    <Cfcatch type="any">
                      <cfset width = 350>
                    </Cfcatch>
                  </cftry>
                  <cfif details.storage EQ 'pippin'>
                    <img  src ='#details.imagelink#' alt="#subcategory# gem stone #category# Jewelry" border=0>
                    <cfelse>
                    <!---<img width="#width#"--->
                    <img  src ='/images/#folder#/<CFIF #NameID# is "">#newitem#.jpg<CFELSE>#NameID#</CFIF>'  alt="unique #subcategory# #category# Jewelry"  border="0">
                  </cfif>
                  <!--- Item Description --->
                  <table>
                    <tr>
                      <td><img src=/images/#category#/thumb/#newitem#.jpg></td>
                      <td><div align="justify"  >
                        <a href=/images/pictureonly.cfm?category=#category#&itemid=#newitem#><img src=/images/magglass.jpg border=0 width="25" height="24"></a><font color="black" face="Verdana, Arial, Helvetica, sans-serif" >
                        <cfif details.subcat neq 'wood'>
                          #ucase(subcategory)##ucase(details.subcat2)#
                          <cfloop query="getgroups">
                            <cfoutput>#Ucase(groupname)#</cfoutput>
                          </cfloop>
                          <cfif category neq 'healing'>
                            #ucase(left(Category,len(category)-1))#
                            <cfelse>
                            #ucase(category)#
                          </cfif>
                          :
                        </cfif>
                        <CFIF invent LT 1 and details.storage neq 'angela'>
This is out of stock, we restock most items within 6 weeks                          </font>
                        </cfif>
                        #description#<br>
                        <b>Size:</b>
                        <cfif details.size neq "">
                          <cfif details.size is 0 and details.storage neq 'Angela'>
                            <i>Select size from drop down above 'Add to cart button'</i>
                          </cfif>
                          <cfif details.size LT 100>
                            <cfif details.size LT 0.2 and details.size neq 0>
Adjustable
                              <cfelseif details.size neq 0>
                              #details.size#
                            </cfif>
                            <cfif category is "necklaces" or category is "bracelets" or category is "bags">
inches
                              <cfelseif (category is "pendants"or category is "earrings" or category is "brouches") and details.size LT 5>
                              inches
                              <cfelseif details.size GT 0.2>
                              mm
                            </cfif>
                            <cfelse>
                            #Round(evaluate(details.size/25.4))#inches
                          </cfif>
                        </cfif>
                        <cfif details.weight neq "0" and details.weight neq "">
                          <b>Weight:</b>#details.weight#
                          <cfif category is "gems">
Ct.
                            <cfelse>
                            gm
                          </cfif>
                        </cfif>
                        <cfif details.storage is 'angela'>
                          <a href='../designer_jewelry_angela.cfm'>More by Angela.</a>
                        </cfif>
                        <cfif details.storage is 'CMZP'>
                          <a href='../pettags.cfm'>Also see Pet Tags by Gymstones</a>
                        </cfif>
                        <cfif category is 'beads'>
** Unless specified differently, all strands are 16 inches.                          <br>
                          <cfif details.size neq "" and details.size GT 0>
Approx. number of beads calculate out to:                            #round(evaluate(16*25.4/details.size))#(this is auto calculated based on bead size entered and 16 inch strand length and can be wrong if lenght of strand is different or size of bead is not along the strand length)
                          </cfif>
                          <br>
                          <font color=red>**</font>Size and color of natural stones may vary slightly
                        </cfif>
                        <cfif category eq "rings">
                          <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a>
                          <cfelseif category is 'pendants'>
                          <br>
                          <a href='http://www.semiprecious.com/necklace.cfm?subcat=chain-silver'>Buy chains for your pendants</a>
                        </cfif>
                        <br /></td>
                    </tr>
                    <!---<cfif details.morepics GT 0>
			<tr><td bgcolor="##666633" align="center"><font color="##FFFFFF"> Extra Picture Below</font></td></tr><tr><td align="center"><img  src ='/images/jewelry/#category#/<CFIF #NameID# is "">#newitem#<CFELSE>#NameID#</CFIF>-1.jpg'></td></tr>
			</cfif>--->
                  </table>
                  <!---  <a  href="/customrequest.cfm?newitem=#newitem#&msg=modification:"><span style="border:blue;padding:2px;background-color:yellow;color:black;font:arial;">Customize/Modify</span></a>--->
                  <cfif category eq "necklaces">
                    <a href='http://www.qvc.com/jw/jw_necksizeguide.html' class="highlightred">Necklace Size Guide by QVC</a><br />
                    <!---<br><b>To place order by phone 24x7 call 512-589-9009</b>--->
                    <cfelseif category eq "rings">
                    <a href=http://67.110.108.250/ringsize.html class=highlighted>Ring Sizing Guide</a><br />
                  </cfif>
                  <br>
                  <br>
                  Check out our<a href=http://www.semiprecious.com/designer_jewelry_angela.cfm>designer jewelry</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="color:maroon;font-size:11px;">For more information within 15 min to 12 hrs on this item:<a href="/contactus.cfm?newitem=<cfoutput>#newitem#&folder=#folder#</cfoutput>">Ask Us</a></span>
                  <!--- End Item Description --->
                  <!--- End main image --->
                  </td>
                  <td align="center" >
                  <!--- 3rd column --->
                  <table>
                      <tr>
                        <td align="center"><cfinclude template="includes/groupsShowOtherItems.cfm">
                          <cfif session.mail is 'acemat@vsnl.com'>
                            <br>
                            <cfif category is 'bags'>
                              <a href="/editbags.cfm?newitem=#newitem#"  />EDIT</a>
                              <cfelse>
                              <a href="/edititem.cfm?newitem=#newitem#"  />EDIT</a>
                            </cfif>
                            <cfelse>
                            <br>
                            <br>
                            <a href="/contactus.cfm?newitem=<cfoutput>#newitem#&folder=#folder#<</cfoutput>">Ask Us</a>
                          </cfif>
                        </td>
                      </tr>
                    </table>
                    <!--- End 3rd column --->
                    </td>
                    <!--- Right side start --->
                  <td valign="top" align=center width="140px">Item Id:#newitem#<br>
                    <!--- Prev button --->
                    <a href="/jewelry_item.cfm/#prevpos#_#catp#.htm"><img border="0" src="/images/prev.gif" hspace="0" vspace="0"   align="absbottom" width="18" height="18" />PREV</a>
                    <!--- End Prev button --->
                    <!--- Next/Edit button --->
                    <a href="/jewelry_item.cfm/#nextpos#_#catn#.htm?thiswidth=#width#">NEXT<img  border="0" src="/images/next.gif" hspace="0" vspace="0"  align="absbottom" width="18" height="18" /></a>
                    <cfif session.mail is 'acemat@vsnl.com'>
                      <br>
                      <cfif category is 'bags'>
                        <a href="/editbags.cfm?newitem=#newitem#"  />EDIT</a>
                        <cfelse>
                        <a href="/edititem.cfm?newitem=#newitem#"  />EDIT</a>
                      </cfif>
                    </cfif>
                    <!--- End next/edit button --->
                    <br><br>                    <br>
                    <div class="details" align="center">
                      <CFIF price eq 0 and session.bulkbuyer.id is "">
Not for retail sale
                        <CFELSEif session.bulkbuyer.id neq "" and price eq 0>
                        Not available for wholesale
                        <cfelse>
                        <cfif status eq 0 or status eq 3 >
                          <!---		    <cfif session.bulkbuyer.id is "">
							<FONT verdana > 
								 Elsewhere Retail: <strike>#format(round(evaluate(price*1.5*(1+(newitem mod 150)/1000))))#</strike>
							</font> <br>
							</cfif>--->
                          <font color="black">
                          <cfif session.bulkbuyer.id neq "">
Wholesale
                            <cfelse>
                            <cfif cgi.server_name neq "63.135.126.234">
Your Price
                              <cfelse>
                              Through Agent
                            </cfif>
                          </cfif>
                          :<b>#format(price)#</b></FONT><br>
                          <cfif cgi.server_name neq "63.135.126.234">
                            <cfif session.bulkbuyer.id eq "">
                              <CFIF  status eq 3>
                                <b><font color="red">Sale!</font>:#format(saleprice)#</b><br>
                              </CFIF>
                            </cfif>
                            <cfif details.inventory GT 0>
                              <cfif cgi.server_name contains  "semiprecious.in">
Ships in 24 hrs
                                <cfelse>
                                <cfif details.storage contains 'IN'>
                                  <b><font color="red">Ships in 6-8 days</b>
                                  <cfelse>
                                  <b></font><font color=green size=-3>Express Shipping Available on Checkout</font></b>
                                </cfif>
                              </cfif>
                              <br>
                            </cfif>
                            <div id="ajaxoutput" align="center">
                            <span id="erroraddingitem"  class="hidden" >Add To Cart Failed!</span>
                            <INPUT TYPE="hidden" NAME="bought" VALUE="buy">
                            <!---       <CFIF invent LT 1 and details.storage does not contain 'CM'><font color="##FF9966">4 week delivery</font><cfelse>--->
                            <cfif invent gt 0>
                              #invent#in stock
                            </cfif>
                            <!---</cfif>--->
                            <br>
                            <CFIF invent LT 1>
Not Availble now
                              <cfelse>
                              Qty:
                              <CFINPUT  type="text" SIZE="1"  id="quantity" Name="quantity" VALUE="#existqty#" REQUIRED="yes" Message="Please enter quantity" VALIDATE="integer" />
                              <br>
                              <br>
                              <!--- Display item options --->
                              <cfif optcount>
                                <div  class="optionsinline" align="right" style="width:100%;horizontal-align:right">
                                  <select id="optionidpulldown" name="optionid"   >
                                    <cfquery datasource="gemssql" name="opts">
                  select description, optionid, <cfif session.bulkbuyer.id neq "" >valueadd/2 <cfelse> valueadd </cfif>as _valueadd from options where itemid               = #newitem#  and inventory>0
                  </cfquery>
                                    <cfloop query="opts">
                                      <cfif _valueadd>
                                        <!--- if there is a change in price because of this option --->
                                        <cfif url.optionid eq opts.optionid>
                                          <option value="#opts.optionid#" selected>#description#. Charge: $#_valueadd#</option>
                                          <cfelse>
                                          <option value="#opts.optionid#">#description#. Charge: $#_valueadd#</option>
                                        </cfif>
                                        <cfelse>
                                        <cfif url.optionid eq opts.optionid>
                                          <option value="#opts.optionid#" selected>#description#</option>
                                          <cfelse>
                                          <option value="#opts.optionid#">#description#</option>
                                        </cfif>
                                      </cfif>
                                    </cfloop>
                                  </select>
                                 </div>
                                <cfelse>
                                <input type="hidden" name="optionid"  id="optionid" value="0">
                              </cfif>
                              <!--- End item options displays --->
                              </div>
                              
                              <INPUT TYPE="button"  id="a2cb" class="greenbutton" onClick="javascript:goProcess('add')" VALUE="Add to Cart" />
                              <input type="button" class="hidden" id="a2cw" value="Wait..." />
                            </cfif>
                            <!--- Angela --->
                            <INPUT TYPE="button" id="a2wl" class="greenbutton" onClick="javascript:goProcess('Add to Wish List')" VALUE="Add To Wish List">
                            <br>
                            <a accesskey="Z" href="/wish.cfm"  >See Wish List</a><br>
                            <br>
                            <a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#><img src="../images/speaker.jpg" border="0" width="86" height="48"></a><br>
                            <!---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=http://www.semiprecious.com/viral/tellafriend.cfm?item=#newitem#>Tell a Friend</a>--->
                            <!-- AddThis Button BEGIN -->
                            <script type="text/javascript">var addthis_pub="anuppandey";</script>
                            <a href="http://www.addthis.com/bookmark.php?v=20" onClick="return addthis_open(this, '', '[URL]', '[TITLE]')" onMouseOut="addthis_close()"><img src="http://s7.addthis.com/static/btn/sm-share-en.gif" width="83" height="16" alt="Bookmark and Share" style="border:0"/></a>
                            <script type="text/javascript" src="http://s7.addthis.com/js/200/addthis_widget.js"></script>
                            <!-- AddThis Button END -->
                            <INPUT TYPE="hidden" NAME="cart" VALUE="#cart#">
                            <INPUT TYPE="hidden" NAME="NameID" VALUE="#NameID#">
                            <input type="hidden" name="invent" value="#invent#">
                            <INPUT TYPE="hidden" NAME="newitem"  id="newitem" VALUE="#newitem#">
                            <INPUT TYPE="hidden" NAME="price"  id="price" VALUE="
				 <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "">
				 #decimalformat(details.wholesaleprice)#
				 <cfelse>
				<CFIF status is 3>#decimalformat(details.saleprice)#<cfelse>#decimalformat(details.price)#</cfif></cfif>">
                            <INPUT TYPE="hidden" NAME="category" id="unclashcategory" VALUE="#category#">
                            <!-- because if id was category, javascript was picking up another tag with name category  which could not be removed because that would have meant much more work-->
                            <cfelse>
                            <cfif cgi.server_name neq "63.135.126.234">
Item Not Available.
                            Need it? Email us.
                            </cfif>
                          </cfif>
                        </CFIF>
                      </cfif>
                      <!--- cgi--->
                      <!---                Shop By<br>
                Item No.: <br>
                <input type="text" name="nextitem" value="" size="4" maxlength="4">
                <INPUT TYPE="button" class="greenbutton" onClick="javascript:goProcess('Show Next')" VALUE="Show">--->
                    </div>
                    </div>
                    <cftry>
                      <cfif  details.clustercount mod 2>
                        <input type="hidden" name="style"  value="1">
                        <span  class="look"><a href="/gemstone.cfm?itemid=#newitem#&type=look" >This In Other Stones</a></span>
                      </cfif>
                      <cfcatch type="any">
                        <cfquery datasource="gemssql">
            update items set clustercount =  0  where newitem = #details.newitem#
 </cfquery>
                      </cfcatch>
                    </cftry>
                    <cftry>
                      <cfif  details.clustercount GT 1>
                        <!--- 2 and 3 => set , 1, 3 indicate style --->
                        <input type="hidden" name="set" value="1">
                        <span  class="set"><a href="/gemstone.cfm?itemid=#newitem#&type=set" >Make  a Set</a></span>
                      </cfif>
                      <cfcatch type="any">
                        <cfquery datasource="gemssql">
update items set clustercount =  0  where newitem = #details.newitem#
 </cfquery>
                      </cfcatch>
                    </cftry>
                    <br>
                    <cfif category eq 'beads'>
                      <a href='/semiprecious-stone-beads.cfm?#session.filter#' >Back to Gallery</a>
                      <cfelse>
                      <a href='/gemstone_jewelry_gallery.cfm?#session.filter#' >Back to Gallery</a>
                    </cfif>
                    <br>
                    <cfif category is 'beads'>
                      <a href="../semiprecious-stone-beads.cfm?category=#category#&subcat=#subcategory#">More <cfoutput>#subcategory# #category#</cfoutput></a>
                      <cfelse>
                      <a href="../gemstone_jewelry_gallery.cfm?category=#category#&subcat=#subcategory#">More <cfoutput>#subcategory# #category#</cfoutput></a>
                    </cfif>
                    <br>
                    <!--- Help button --->
                    <a onClick="MM_showHideLayers('howto','','show');" style="color:maroon;margin-bottom:2px;"><img src="/images/help.gif" border="0" vspace="0" hspace="0" align="absmiddle" width="43" height="30" /></a>
                    <!--- End help button --->
                    <br>
</td>
                </tr>
              </cfoutput>
              <!-- change this to darkgreen when putting image back -->
              <cfoutput>
                <cfif isdefined("session.filterarray")>
                  <cfif arraylen(session.filterarray) GT 1>
                    <cfset thispos =  filterarrayfind(newitem)>
                    <cfif thispos>
                      <cfif thispos EQ 1>
                        <cfset prevpos = arraylen(session.filterarray)>
                        <cfelse>
                        <cfset prevpos = thispos -1>
                      </cfif>
                      <cfset catp =	session.filterarray[prevpos][2]>
                      <cfset prevpos = session.filterarray[prevpos][1]>
                    </cfif>
                  </cfif>
                  <cfelse>
                  <cfset catp = 'jewelry'>
                  <cfset prevpos = newitem - 1>
                </cfif>
              </cfoutput>

              <cfif isdefined("session.filterarray") >
                <cfif arraylen(session.filterarray) GT 2>
                  <cfset thispos =  filterarrayfind(newitem)>
                  <cfif thispos>
                    <cfif thispos EQ arraylen(session.filterarray)>
                      <cfset nextpos = 1>
                      <cfelse>
                      <cfset nextpos  = thispos + 1>
                    </cfif>
                    <cfset catn = 	session.filterarray[nextpos][2] >
                    <cfset nextpos = 	session.filterarray[nextpos][1]>
                    <cfset variables.ht = 90 />
                    <cfset imgname ="d:\inetpub\semiprecious\images\#catn#\#nextpos#.jpg">
                    <cfx_imageinfo file="#imgname#">
                    <cftry>
                      <cfif imageinfo.width GT imageinfo.height >
                        <cfset width1 =  90>
                        <cfset ht = round((imageinfo.height*90)/imageinfo.width)>
                        <cfelse>
                        <cfset ht =  90>
                      </cfif>
                      <cfset nimg = "/images/#catn#/#nextpos#.jpg">
                      <cfcatch type="any">
                        <cfset ht =  "">
                        <cfset nimg = "/images/#catn#/thumb/#nextpos#.jpg">
                      </cfcatch>
                    </cftry>
                    <cfset nimg = "/images/#catn#/#nextpos#.jpg">
                    <cfif category neq 'beads'>
                      <cfoutput><a href='/jewelry_item.cfm/#nextpos#_#catn#.htm?thiswidth=#width#'><img  src="/images/#catn#/thumb/#nextpos#.jpg" border="1"  name="nimg" hspace="0" vspace="0"  alt="Next" height="#variables.ht#"   ></a></cfoutput>
                    </cfif>

                  </cfif>
                  <cfelse>
                  <cfset nextpos = prevpos>
                  <cfset catn = 'jewelry'>
                </cfif>
                <cfelse>
                <cfset nextpos = newitem + 1>
                <cfset catn = 'jewelry'>
              </cfif>
          
            
            </table>
          </CFFORM></TD>
      </tr>
      <cfif cgi.server_name neq "63.135.126.234" and cgi.server_name neq "www.ornamentscollect.com">
        <tr>
          <td  align="center"><cfif stonename NEQ "">
              <a href='/<cfoutput>#stonename#</cfoutput>.htm'><i>Learn more about this and other semi precious stones</i></a>
            </cfif>
            <br>
            <br>
            <br>
            <cfinclude template='adminfooter.cfm'></td>
        </tr>
      </cfif>
      <!-- cgi -->

    </TABLE>
    <cfoutput>
      <script language="javascript">
	document.getElementById("#lcase(folder)#").style.color = "maroon";
  document.getElementById("#lcase(folder)#").style.textDecoration = "none" ;
 window.focus();
 document.getElementById('quantity').focus();
 
<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>

</script>
    </cfoutput>
    <cfif details.morepics GT 0>
      <script language="Javascript" src="/js/drop.js">
		</script>
      <div id="dropin" style="position:absolute; left:100px; top:100px; 
		width:250px; height:300px; visibility: hidden;">
        <table width="100%" height="100%" border="0" cellpadding="0" 
		cellspacing="0" id="tbl" style="border:thick ridge #CCCCCC">
          <tr>
            <td><table width="100%" height="100%" border="0" cellpadding="0" 
		cellspacing="0">
                <tr>
                  <td height="12" valign="top" bgcolor="#FFFFFF" style="cursor:hand"><div align="right"><a href="#" onClick="dismissbox();return false" 
		style="font-family:verdana; color:#000000; font-size: 
		10px;">[<u>X</u>]</a></div></td>
                </tr>
                <tr>
                  <td width="100%" colspan="2" valign="top" bgcolor="#FFFFFF" id="dragtext" 
		style="padding:4px"><cfoutput><img  src ='/images/jewelry/#category#/<CFIF #NameID# is "">#newitem#-1.jpg<CFELSE>#NameID#</CFIF>'  alt="unique #subcategory# #category# Jewelry"  border="0" width=250></cfoutput></td>
                </tr>
              </table></td>
          </tr>
          <tr bgcolor="#FFFFCC">
            <td height=12><font size=2>Made with<a
		href=http://www.crecon.com>Creative
              Connectivity's Drop-In Maker</a></FONT>&nbsp;&nbsp;<a href="#" onClick="dismissbox();return false" 
		style="font-family:verdana; color:#000000; font-size: 
		10px;">[<u>CLOSE THIS</u>]</a></td>
          </tr>
        </table>
      </div>
      <cfoutput>
        <script language="Javascript">
		DropIn('##FFFFFF','Arial',14,'##000000','<img  src ="/images/jewelry/#category#/<CFIF #NameID# is "">#newitem#-1.jpg<CFELSE>#NameID#</CFIF>" alt="unique #subcategory# #category# Jewelry"  border="0" width=300> <p>','200','300',	'67','67','##000000','solid',1,0,true);
		</script>
      </cfoutput>
    </CFIF>

    <div  id="howto" style="visibility:hidden;position:absolute;top:90px;left:220px;color:##666600;background-color:white;z-index:2;width:300px;">
      <div class="noticebox">This page helps you to add an item to your cart. Enter the number of  pieces (1 or more) you wish to buy  in the text box shown before the 'Add to Cart' button and click on the 'Add to Cart' button. Your cart will be filled by the desired number of this item.  If the item is already there in the cart, the quantity in cart is updated to the number you have just entered. You will get the message of   item addition on top left.
        <ul>
          <li>Options:Before adding/changing the quantity please see if any options/modification  are available for the jewelry. Options are shown at the bottom of the picture and are<span class="optionsinline">highlighted in this color</span>.
            If options are available you may select an option, options are not always compulsory.</li>
          <li>To remove an item from your cart enter the number 0 (Zero).</li>
        </ul>
      </div>
      <a onClick="MM_showHideLayers('howto','','hide');" style="color:red;">Close Help</a></div>
\
    </BODY>
    </HTML>