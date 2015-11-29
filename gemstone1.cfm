<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="js/macromediafuncs.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
 <CFPARAM NAME="displaycolumns" DEFAULT="2"> 
 <cfif session.mail eq 'nitishpandey@indiatimes.com'>
 <cfset url.edit =  'mamamia'>
 </cfif><cfset  session.gallery = 'listcluster'> <!--- used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping --->
 <cfparam default="661111" name="l">
 <cfparam name="displayrows" default="4">
<CFPARAM NAME="numpages" DEFAULT="0"> 
<CFPARAM NAME="category" DEFAULT="ALL" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="priceless" DEFAULT="">
<cfset price_array  = arraynew(1)>
<cfset status_array  = arraynew(1)>

<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
<CFINCLUDE TEMPLATE="setup.cfm">

<CFPARAM NAME="sortorder" DEFAULT="datetaken desc" >
<!--- <CFIF sortorder is 'price'>
<CFSET sortorder='orderprice'>
 </cfif>
<CFPARAM NAME="PicWidth" DEFAULT= "120"> 
<cfoutput>sortorder is #sortorder#</cfoutput>
need to figure out from where sort order is coming as datetakendesc --->
<cfif sortorder eq 'datetakendesc' or sortorder eq 'newitemdesc' or sortorder eq 'datetaken'>
<cfset sortorder = 'datetaken desc'>
</cfif>
<link rel="shortcut icon" href="/favicon.ico" />
<!--- <cfoutput>sortorder is #sortorder#</cfoutput> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bgcolor" DEFAULT= "white">
<CFPARAM NAME="salestatus" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="0"> 
<CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> 
  <CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
  <CFSET display=40>
  <CFSET displaycolumns = "2">

<cfset itemidlist = "">
<cfif isdefined("url.clusterid")>
      <CFQUERY DATASOURCE="gemssql" NAME="Getitemid">
select itemid , cat from styles where styleid = #url.clusterid# 
</cfquery>
<cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
<cfelseif isdefined("url.itemid")>
      <CFQUERY DATASOURCE="gemssql" NAME="styleids">
select distinct(styleid) as styleidlist , cat from styles where itemid = #url.itemid# and matchtype = '#url.type#'
</cfquery>
<cfif url.type is 'look'>
<cfset category = '#lcase(styleids.cat)#'>
</cfif>
<cfloop query="styleids" >
<cfquery datasource="gemssql" name="getitemid">
select itemid , cat from styles where styleid = #styleidlist# <!--- <cfif url.type eq 'set'>and cat <> '#cat#'</cfif> --->
</cfquery>
<!--- not required remove if not in use for long
<cfswitch expression="#getitemid.cat#">
<cfcase value="bracelets" >
</cfcase>
<cfcase value="rings" >
</cfcase>
<cfcase value="healings" >
</cfcase>
<cfcase value="necklaces" >
</cfcase>
<cfcase value="pendants" >
</cfcase>
<cfcase value="earrings" >
</cfcase>
<cfdefaultcase >
</cfdefaultcase>
</cfswitch> --->
<cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
</cfloop><div   id="referenceitem" style="position:absolute;top:60px;left:20px;background-color:#white;padding:0px;z-index:2;">
<table  border="0" cellspacing="0" cellpadding="0">
        <tr >
          <td width="15" ><img src="../images/jewelry_box_1.gif" width="15" height="17" align="absbottom" vspace="0" hspace="0" ></td>
          <td width="" bgcolor="#CCCC99" >&nbsp;Your Item</td>
          <td width="15"><img src="../images/jewelry_box_3.gif" width="15" height="17" align="absbottom" vspace="0" hspace="0"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF"> 
     <cfoutput>      <img src="images/#styleids.cat#/thumb/#url.itemid#.jpg" vspace="0" hspace="0" border="0" align="absmiddle">
       </cfoutput>   </td>
          <td bgcolor="#CCCC99">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../images/jewelry_box_4.gif" width="15" height="17" align="absmiddle" vspace="0" hspace="0"></td>
          <td bgcolor="#CCCC99" align="right">&nbsp;  <a href="#" onClick="MM_showHideLayers('referenceitem','','hide');return false;" class="headerfontsmall"><font size="-2">HIDE</font></a> </td>
          <td><img src="../images/jewelry_box_2.gif" width="15" height="17" align="absmiddle"  vspace="0" hspace="0"></td>
        </tr>
      </table>
	
</div>
<cfelse>
<cflocation url="gemstone_jewelry_gallery.cfm" />
</cfif>
<cfif len(itemidlist)>

<cfquery datasource="gemssql" name="getlist">
select cat,newitem, description, <cfif isdefined("session.bulkbuyer.id")>wholesaleprice as  price , wholesaleprice as saleprice <cfelse> price ,  saleprice</cfif> , status, inventory from items where newitem  in   (#itemidlist#) and (status = 3 or status  = 0) order by cat
</cfquery>
</cfif>
<CFIF not ISDEFINED("gETLIst.recordcount")>
<cfinclude template="header.cfm">Sorry, NO ITEM FOUND!.
<cfinclude template="footer.htm">
<cfabort />
</cfif>
  <cfset session.filterarray = 0>
  <cfset session.filterarray = arraynew(2)>
         <CFLOOP QUERY="Getlist"	>
              		  <cfset session.filterarray[currentrow][1] = newitem>
					   <cfset session.filterarray[currentrow][2] = cat>
		</cfloop>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >
<CFOUTPUT >
<TITLE>#color# #subcat# 
  <cfif category is "ALL">
    <cfset p = "jewelry">
    <cfelse>
<cfset p = category> 
  </cfif>
  #p#
<cfif isdefined("reversefilename")>
Beaded, Gemstone Sterling Silver Jewellery
<cfelse>
Semi-precious Gemstone Sterling Silver Jewelry
</cfif>
</TITLE>
<meta name="keywords" content="valentine gift under $10 #color# gemstone, #subcat# #category# jewelry,semiprecious, semi-precious, jewellery">
<meta name="description" content="Retail and wholesale #subcat# #category#,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>">
</cfoutput>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<!--- removed this behaviour onLoad="MM_showHideLayers('referenceitem','','hide');"--->
<BODY leftmargin="0"  BGCOLOR="white" text='black' link="black" onLoad="MM_showHideLayers('referenceitem','','hide');" vlink='#006600' topmargin='0' >
<CFINCLUDE TEMPLATE="headerforlist.cfm"> 
<cfoutput>
<h3><cfif  isdefined("session.bulkbuyer.id")>Wholesale Shopper: #session.name#
<cfelseif session.mail neq "">Member: #session.mail#<cfelse>&nbsp;</cfif></h3>
<cfset displaycolumns = 2>
<cfset displayrows = 5>
<cfset display = displaycolumns*displayrows>
  <CFIF GetList.cat is not "">
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'>
<br>

  <table border="0" width="800" cellpadding="0" cellspacing="0"  >
  <cfif isdefined("url.clusterid")>
<cfswitch expression="#url.clusterid#">
<cfcase value="334">
	<tr><Td align="center" class="grayplacard" colspan="2" >THE VERMEIL (pronounced ver-may) EARRINGS COLLECTION</Td></tr>
</cfcase>
<cfdefaultcase >
	<tr><Td align="center" class="grayplacard" colspan="2" >CLASSICS COLLECTION - DESIGNS THAT ARE UNIQUE AND METICULOUSLY DESIGNED</Td></tr>
</cfdefaultcase>
</cfswitch>
<cfelse>
<tr   >
    <Td  align="center" valign="middle" colspan="2"   class="grayplacard">See Assorted Sets & Design Range<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /> <a href="showsets.cfm" class="" id="all_" title="see designs range and sets suggestions in bracelets">&nbsp;Sets&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showearrings.cfm" class="" id="earrings_" title="see designs range and sets suggestions in earrings">&nbsp;Earrings&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showpendants.cfm" class="" id="pendants_">&nbsp;Pendants&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="shownecklaces.cfm" class=""  id="necklaces_">&nbsp;Necklaces&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showbracelets.cfm" class="" id="bracelets_" title="see designs range and sets suggestions in bracelets">&nbsp;Bracelets&nbsp;</a></Td>
  </tr>	<!---
	<tr>
<td valign="top" align="center" class="topnavigator">
  See Your Item's <a href="##" onClick="MM_showHideLayers('referenceitem','','show');return false;">Picture</a> &nbsp;&nbsp;<a href="jewelry_item.cfm?newitem=#url.itemid#">Details</a>&nbsp;&nbsp;&nbsp;These designs from same  #url.type#  as  '<a href="##" onClick="MM_showHideLayers('referenceitem','','show');return false;">Your item</a>' &nbsp;&nbsp;&nbsp;&nbsp;<a href="gemstone_jewelry_gallery.cfm?#urldecode(session.filter)#">Return to Main gallery</a></td></tr> --->
</cfif>   <tr >
  <td width="93" valign="top" bordercolor="##999933" bgcolor="white" >
	<table style="background-color:##FFFFFF;border:1px ridge ##666600;" cellspacing="0"  cellpadding="0">
	<tr align="center"   class="greenbutton" ><td  style="border-bottom:1px black solid;" >
<span style="color:black;font-weight:bold;text-transform:capitalize;" >#p#<img src="/images/arrow_down.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><br /></span>          	 <!--- removed bottom fading img from here ---> 
	 </td>
	 </tr>
    <CFINCLUDE TEMPLATE="subcatvertical.cfm">
	 </table>	 </td>
	<td valign="top">
	<table width="707" border="0"  cellpadding="0"  cellspacing="0"  style="border-right: 1px black solid;margin-left:1px;" >
	<CFIF getList.recordcount is 0>
<Tr valign="middle"><td colspan="#evalulate(2*displaycolumn)#" valign="middle" style="color:##666600">
      <font size='4' color='black'>
      No matches found for your criteria specified. Please try with some other words in your search.</font> 
    </td></tr>
</cfif></cfoutput>
	 <CFSET columns=1> <CFSET rows=1> 
<CFSET currentrow= start>
	
	                  <cfoutput group="cat" QUERY="Getlist"		startrow="#start#"		maxrows="#enddisplay#">
					  				  <cfif columns NEQ 1> 
			  <td colspan="#evaluate(2*(displaycolumns - columns +1))#" class="row2">&nbsp;</td></tr>
              
			  </cfif><CFSET columns=1>
<tr><td class="cyansilverfilter" colspan="#evaluate(2*displaycolumns)#">#cat# of  same #type#</td></tr>
					  <cfoutput>
						   <CFIF COLUMNS eq 1>
            			  <tr>
			  </CFIF>
              <CFSET invent=inventory>
            <td class="rowlb" align="center"> 
              <font verdana size='1'> 
              <cfif inventory GT 0 >
                  <cfset status_array[columns] = 1>
                  <cfset price_array[columns] =format(price)>
                  <cfif status is 3 >
                      <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                      <CFSET Saleprice = 0.80*price>
                    </cfif>
                    <cfset status_array[columns] = format(price)>
					 <cfset price_array[columns] =format(saleprice)>
                  </cfif>
                <cfelse>
                <cfset status_array[columns] = 0 >
                <cfset price_array[columns] = soldformat(price)>
              </cfif>
              <cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
              <a href='jewelry_item.cfm/#item_array[columns]#.htm' > 
              <img src ='images/#getlist.cat#/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#" style="display:inline;"></a> 
			  </td>
			  <td class="row2">
			  <span style="margin-top:0;">				<cfswitch expression="#status_array[columns]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='jewelry_item.cfm/#item_array[columns]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[columns]#</font>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[columns]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='jewelry_item.cfm/#item_array[columns]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[columns]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <cfif isdefined("session.bulkbuyer.id")>
			     <font color="###l#">
				  <a href='jewelry_item.cfm/#item_array[columns]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[columns]#</font>&nbsp;
			   <cfelse>
			   <a href='jewelry_item.cfm/#item_array[columns]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp; <font color="##000099" ><s>#status_array[columns]#</s></font>&nbsp;<a href='jewelry_item.cfm/#item_array[columns]#.htm' ><b>#price_array[columns]#</b></a></cfif>&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[columns]#.htm' ><font color="##CC3300">Buy</font></a> 
               </cfdefaultcase>
				  </cfswitch></span><br />
       <span  align="justify">#description#</span>
              <CFIF Edit Is "MAMAMIA">[#inventory#]
                <a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'> 
                <CFIF status is "1">
                  Inactive 
                  <cfelseif status is "2">
                  Discont. 
                  <cfelseif status is "4">
                  Free 
                  <cfelseif status is "3">
                  Sale 
                  <cfelseif status is "5">
                  Picture 
                </cfif>
                </font> 
              </CFIF>
              </font> </td>
				  <cfif columns EQ displaycolumns> 
                            </tr>			                       
                         <CFSET columns=1>
         <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
</cfoutput>
</cfoutput>
		  <cfoutput>
				  <cfif columns nEQ 1> 
              <td colspan="#evaluate(2*(displaycolumns - columns + 1 ))#" class="row2">&nbsp;</td></tr>
              <CFSET columns=1>
			  </cfif>
	      
		  <tr><td colspan="#evaluate(2*displaycolumns)#">
		   <table width="705"  BORDER=0>
            <tr > 
              <td align=left border=0> 
	             <a href="topselling.cfm" class="headeranchor">The Best Selling!</a> 
          </td>
          <td nowrap align="center"><span class="category">#p#:</span><cfinclude template="searchforms.cfm"/></td>
                <td align="right" > 
				<a href="howtonavigate.cfm" class="headeranchor">Need Help?</a>
  </td>
            </tr>
</table></td></tr></table></td></tr>
		 <tr bgcolor="white"  >
      <td align="center" valign="middle"  style="row3"  >&nbsp;  <a href="http://www.myexhibition.com"> 
       Love Art?</a> </td>
    <td align="center" valign="middle"  class="row3"> 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>
		              <tr>
              <td colspan="2" align="center"> <script type="text/javascript"><!--
				google_ad_client = "pub-2709788135063072";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_format = "728x90_as";
				google_ad_channel ="1741562433";
				google_ad_type = "text";
				google_color_border = "CCCCCC";
				google_color_bg = "FFFFFF";
				google_color_link = "000000";
				google_color_url = "666666";
				google_color_text = "333333"; 
			//--></script> 
              <script type="text/javascript"
				  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
              </td>
            </tr>
   
    </table><script language="JavaScript1.1">
//ShowHide('jumpstart');
//ShowHide('jumpstartblinder');

<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>
	<cfif listfind('rings,necklaces,bracelets,earrings,pendants,healing',category)  >
	document.getElementById("#lcase(category)#").style.color = "maroon";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
	document.getElementById("#lcase(category)#_").className = "lookinline";
//  document.getElementById("#lcase(category)#_").style.textDecoration = "none" ;
<cfelse>
	document.getElementById("all_").className = "setinline";
//  document.getElementById("all_").style.textDecoration = "none" ;

</cfif>
	</script>
#category#
	</cfoutput>	

</BODY>
</HTML>

