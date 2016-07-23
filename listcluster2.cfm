<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="js/macromediafuncs.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
 <CFPARAM NAME="displaycolumns" DEFAULT="4"> 
 <cfif session.mail eq 'anup@semiprecious.com'>
 <cfset url.edit =  'mamamia'>
 </cfif>
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
<cfif sortorder eq 'datetakendesc'>
<cfset sortorder = 'datetaken desc'>


</cfif>
<!--- <cfoutput>sortorder is #sortorder#</cfoutput> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bgcolor" DEFAULT= "white">
<CFPARAM NAME="salestatus" DEFAULT="">

<CFPARAM NAME="invent" DEFAULT=""> 
<CFPARAM NAME="j" DEFAULT="">

 <CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> 
  <CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
  <CFSET display=21>
  <CFSET displaycolumns = "3">
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>

<cfquery datasource="semiprecious" name="styleids">
select distinct(styleid) as styleidlist , cat from styles where itemid = #url.itemid# and matchtype = '#url.type#'
</cfquery>
<cfset itemidlist = "">
<cfloop query="styleids" >
<cfquery datasource="semiprecious" name="getitemid">
select itemid , cat from styles where styleid = #styleidlist# <cfif url.type eq 'set'>and cat <> '#cat#'</cfif>
</cfquery>
<cfset itemidlist = listappend(itemidlist,arraytolist(getitemid['itemid']))>
</cfloop>

<cfquery datasource="semiprecious" name="getlist">
select cat,newitem, description,  saleprice, wholesaleprice, price, status, inventory from items where newitem  in   (#itemidlist#)
</cfquery>
<CFIF not ISDEFINED("gETLIst.recordcount")>
<cfinclude template="header.cfm">
NO ITEM FOUND! PLEASE TRY AGAIN.
<cfinclude template="footer.htm">
<cfabort />
<cfelse>
<div   id="referenceitem" style="position:absolute;top:60px;left:20px;background-color:#DADA99;padding:0px;z-index:2;">
<table  border="0" cellspacing="0" cellpadding="0">
        <tr >
          <td width="15" ><img src="../images/Untitled-1.gif" width="15" height="15" align="absbottom" vspace="0" hspace="0" ></td>
          <td width="" bgcolor="#CCCC99" >&nbsp;Your Item</td>
          <td width="15"><img src="../images/Untitled-3.gif" width="15" height="15" align="absbottom" vspace="0" hspace="0"></td>
        </tr>
        <tr>
          <td bgcolor="#CCCC99">&nbsp;</td>
          <td align="center" bgcolor="#FFFFFF"> 
     <cfoutput>      <img src="images/#styleids.cat#/thumb/#url.itemid#.jpg" vspace="0" hspace="0" border="0" align="absmiddle">
       </cfoutput>   </td>
          <td bgcolor="#CCCC99">&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../images/Untitled-4.gif" width="15" height="15" align="absbottom" vspace="0" hspace="0"></td>
          <td bgcolor="#CCCC99" align="right">&nbsp;  <a href="#" onClick="MM_showHideLayers('referenceitem','','hide');return false;" class="headerfontsmall"><font size="-2">HIDE</font></a> </td>
          <td><img src="../images/Untitled-2.gif" width="15" height="15" align="absbottom"  vspace="0" hspace="0"></td>
        </tr>
      </table>
	
</div>
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
<BODY leftmargin=1 BGCOLOR="white" text='black' link="black" vlink='#006600'black alink=black topmargin='1' >
<CFINCLUDE TEMPLATE="headerforlist.cfm"> 
<cfoutput>
   <cfif  isdefined("session.bulkbuyer.id")>Wholesale/Reseller Shopping Mode is ON
<cfelseif session.mail is ""><h3>Click on the small yellow arrows to choose listing of specific type and stone.</h3>
<cfelse><h3>Member: #session.mail# </h3></cfif>

<cfif session.screenwidth LT 1023 >
<cfset screensize = "small">
<cfset displaycolumns = 3>
<cfset displayrows = 2>
</cfif>
<CFIF category Is "bracelets"> <!---  <CFSET #PicWidth# = "150"> --->
  <CFSET displaycolumns = 3>
  <cfif screensize is "small" >
<cfset displaycolumns = 2>
<cfset displayrows = 2>
</cfif>
</CFIF>
<cfset display = displaycolumns*displayrows>
  <CFIF GetList.cat is not "">
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'>
 <cfset tw = 0.96*session.screenwidth>

  <table border="0" width="#tw#" cellpadding="0" cellspacing="0"  >
    <tr >
  <td width="90" valign="top" bordercolor="##999933" bgcolor="white" >
  <table width="90" border="0" cellpadding="0" cellspacing="0"  bgcolor="##D3D3AA">
        <tr >
		 <td width="90"  align="center"  background="images/bggreen1.gif" bgcolor="##D3D3AA" style="border-top:1px groove ##000066;border-right:1px ridge ##666666;border-left:1px ridge ##666666;" ><cfif category neq "ornaments">
		  <font face="Geneva, Arial, Helvetica, sans-serif" color="##000000">
		  <span class="category">#p#<br>
              Available In</span></font><cfelse>&nbsp;</cfif></td>
        </tr>
      </table>
	   <cfset display = displaycolumns*displayrows>  
	    <CFSET enddisplay= start + display-1>
<cfif category neq "ornaments">

    <CFINCLUDE TEMPLATE="subcatvertical.cfm">
	 </cfif><!--- removed bottom fading img from here ---> 
	 </td>
	<td valign="top">
	<table><tr>
<td valign="top" align="center" class="topnavigator">
  See Your Item's <a href="##" onClick="MM_showHideLayers('referenceitem','','show');return false;">Picture</a> &nbsp;&nbsp;<a href="detail.cfm?newitem=#url.itemid#">Details</a>&nbsp;&nbsp;&nbsp;These can go in  #url.type#  with  'Your item' &nbsp;&nbsp;&nbsp;&nbsp;<a href="list.cfm?#urldecode(session.filter)#">Return to previous gallery</a></td></tr>
<Tr valign="middle"><td valign="middle" style="color:##666600">
    <!--- <cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif> --->
 <CFIF getList.recordcount is 0>
      <font size='4' color='black'>
      No matches found for your criteria specified. Please try with some other words in your search.</font> 
</cfif>
	
	 <CFSET columns=1> <CFSET rows=1> 

              <CFSET currentrow= start>
			  
			 
    </td></tr>
	<tr> <td>
		<Table cellpadding="2" cellspacing="0" width="#evaluate(tw - 118)#"  >
                         

			  <CFLOOP QUERY="Getlist"		startrow="#start#"		endrow="#enddisplay#">
						   <CFIF COLUMNS eq 1>
			  <tr>
			  </CFIF>
			  
              <CFSET invent=inventory>
                    
                <td class="row1"> 
                  <!---			<CFIF getList.status is 3> --->
                  <font verdana size='1'> 
                  <cfif inventory GT 0 >
                    <cfset status_array[columns] = 1>
                    <cfif isdefined("session.bulkbuyer.id")>
                      <cfset  l = 'AA1111'>
                      <cfif wholesaleprice eq "" or wholesaleprice eq "null" or wholesaleprice eq 0>
                        <cfset price_array[columns] = dollarformat(0.50*price)>
                        <cfelse>
                        <cfset price_array[columns] = dollarformat(wholesaleprice)>
                      </cfif>
                      <cfelse>
                      <cfset price_array[columns] = dollarformat(price)>
                      <!--- 1 is normal, -1 is sale, 0 is sold out --->
                      <!--- this is defined in bulkbuyerlogin.cfm --->
                      <cfif status is 3 and session.mail neq 'pandey@aol.com' >
                        <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                          <CFSET Saleprice = 0.80*price>
                        </cfif>
                        <cfset status_array[columns] = dollarformat(saleprice)>
                        <!---   <img src="images/sale.gif"> <span class="whiteonred"><B>#dollarformat(saleprice)#</B></span> 
                &nbsp;Regular --->
                      </cfif>
                    </cfif>
                    <!--- wholesale --->
                    <cfelse>
                    <!---    <font color=red size=2>Sold Out!</font> <br /> --->
                    <cfset status_array[columns] = 0>
                    <cfset price_array[columns] = dollarformat(ceiling(1.1*price))>
                  </cfif>
                  <cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
                  <a href='detail.cfm/#item_array[columns]#.htm' > 
                  <!---                  	<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
	<CFELSE>
			<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
                  <img src ='images/#getlist.cat#/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a> 
                  <!---  <cfset price_array[columns] = #dollarformat(price)#> --->
                  <cfset descr_array[columns] = description>
                  <!--- <b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br> --->
                  <CFIF Edit Is "MAMAMIA">
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
                  <!---
		<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
		<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
		--->
              </tr>
            <tr > 
              <cfloop from="1" to="#columns#" index="indx">
                <td class="row2">#descr_array[Indx]#
                   </td><!--- <cfflush  interval="400"> --->
              </cfloop>
            </tr>
            <tr  > 
              <cfloop from="1" to="#columns#" index="indx">
                <td  class="row3" nowrap>
				<cfswitch expression="#status_array[indx]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[Indx]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' ><b>#status_array[indx]#</b></a> 
                 
				  
			   </cfdefaultcase>
				  </cfswitch>
				  </td>
              </cfloop>
            </tr>
            
              <CFSET columns=1>
              <!---</table>
		<Table cellpadding=2 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
              <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
				  </CFLOOP>
              <cfset columns  = columns - 1><cfif columns >
              <!--- code of 19 aug 04 --->
              <cfset columns  = columns + 1>
			  
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                 
                  <td class="row1">&nbsp;</td>
              </cfloop>
            </tr>
            <tr>
              <cfset columns  = columns - 1>
                  <cfloop from="1" to="#columns#" index="indx">
                  <td class="row2">#descr_array[Indx]#
                   
                  </td>
                </cfloop>
             
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row2">&nbsp;</td>
              </cfloop>
            </tr>
            <tr> 
              <cfset columns  = columns - 1>
         
                <cfloop from="1" to="#columns#" index="indx">
                  <td class="row3">
					<cfswitch expression="#status_array[indx]#">
				  <cfcase value="1"><font color="###l#">
				  <a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;
				  #price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[Indx]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[indx]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='detail.cfm/#item_array[Indx]#.htm' ><b>#status_array[indx]#</b></a> 
   			   </cfdefaultcase>
				    </td></cfswitch>
	               </cfloop>
            
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row3" nowrap>&nbsp;</td>
              </cfloop>
            </tr>
                 <CFSET columns=0>
          </cfif>
	       </table >
		   </td>
		   </tr>
		  <tr><Td>
		  		   <table width="#evaluate(session.screenwidth - 140)#"  align="left" BORDER=0>
            <tr> 
              <td align=left border=0> 
	
	
                 <a href="topselling.cfm" class="row2"> See the Best Selling !</a> 
          </td>
          <td nowrap align="center">  
            <cfinclude template="searchforms.cfm"/></td>
                <td align="left" > 
                 
                  
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> 
				   		 
     		
                <a href="howtonavigate.cfm" class="row2">Need Help Finding ?</a>

                  </td>
				
            </tr>
            <tr>
              <td colspan="3" align="center"> <script type="text/javascript"><!--
				google_ad_client = "pub-2709788135063072";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_format = "728x90_as";
				google_ad_channel ="";
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
              <!---  <tr>
              <td colspan=3><p>&nbsp;</p>
             <i>Advertisement: </i>
                <SCRIPT language="JavaScript">
terve('10896');
</SCRIPT>  </td>
            </tr>--->
          </table>
</td>
		  </tr></table></td></tr>
		 <tr bgcolor="white"  >
      <td align="center" valign="middle"  style="row3"  >&nbsp;  <a href="http://www.myexhibition.com"> 
       Love Art?</a> </td>
    <td align="center" valign="middle"  class="row3"> 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>
    </table><script language="JavaScript1.1">
ShowHide('jumpstart');
ShowHide('jumpstartblinder');
	<cfif subcat neq "" and subcat neq "beaded">
	document.getElementById("#subcat#").style.color = "maroon";
//document.getElementById("#subcat#").style.fontWeight = "bold";
 
 document.getElementById("#subcat#").style.textDecoration = "none" ;
		<cfif len(category) GT 4 >
 	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;
  document.getElementById("#lcase(category)#_#subcat#").style.color = "##000066";
//document.getElementById("#lcase(category)#_#subcat#").style.fontWeight = "bold";
 
 document.getElementById("#lcase(category)#_#subcat#").style.textDecoration = "none" ;
	</cfif>
    
	</cfif>
	<cfif len(category) GT 4 >
	document.getElementById("#lcase(category)#").style.color = "yellow";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
</cfif>
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/
	</script>

	</cfoutput>	

</BODY>
</HTML>

