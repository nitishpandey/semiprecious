<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 ---><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD >
<cfparam name="screensize" default="big">
<CFPARAM NAME="displaycolumns" DEFAULT="4">

<cfparam name="displayrows" default="6">
<CFPARAM NAME="numpages" DEFAULT="0">
<CFPARAM NAME="category" DEFAULT="Jewelry" >
<CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="Jewelry">
</CFIF>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="priceless" DEFAULT="">
<cfset price_array  = arraynew(1)>
<cfset status_array  = arraynew(1)>

<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
<CFINCLUDE TEMPLATE="setup.cfm">

<CFPARAM NAME="sortorder" DEFAULT="datetaken" >
<!--- <CFPARAM NAME="PicWidth" DEFAULT= "120"> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFIF category neq 'ornaments' and category neq 'sets'>
<CFPARAM NAME="subcat" DEFAULT= "">
<CFELSE>
<CFPARAM NAME="subcat" DEFAULT= "silver">
</CFIF>

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
<CFPARAM NAME="priceless" DEFAULT="">
<CFPARAM NAME="pricegreater" DEFAULT="">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
  <CFSET display=21>
  <CFSET displaycolumns = "3">
<cfif screensize is "small">
<cfset displaycolumns = 2>
</CFIF>

 <CFQUERY DATASOURCE="gemssql" NAME="GetList" >
 SELECT newitem, CAT, subcat, datetaken, 
  NameID, 
    price
  , saleprice, status, Description, inventory, buylink from Items where 
 (status=0 or status=3)
    order by newitem
      Desc
   </CFQUERY>

<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display>
<CFOUTPUT ><TITLE>#subcat# 
     #category# 
  Beaded, Gemstone Sterling Silver Jewelry</TITLE>
<meta name="description" content="Retail and wholesale #subcat# #category#,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>">
<meta name="keywords" content="<CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#">#subcat# #category#, </cfloop>"></cfoutput>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY leftmargin=0 BGCOLOR="white" text='black' link="black" vlink=black alink=black topmargin='0' >
<div align="center">
<CFINCLUDE TEMPLATE="headerforlist.cfm"> 

  
   
<cfset displaycolumns = 2>
<cfset displayrows = 9>
 
<cfset display = displaycolumns*displayrows>
<cfoutput> 
  <CFIF GetList.cat is not "">
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'>
</cfoutput> 
&nbsp; <a name="picsonly" dir="ltr"></a> 
<cfset tw = 0.96*session.screenwidth>
<cfoutput>
  <table border="0" width="800" cellpadding="0" cellspacing="0"  >
    <tr  >  <td width="92" valign="top" bordercolor="##999933" bgcolor="white"   >
  <table width="92" border="0" cellpadding="0" cellspacing="0"  style="border:1px solid black;"  >
        <tr >          <td>
<script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 120;
google_ad_height = 600;
google_ad_format = "120x600_as";
google_ad_type = "text_image";
google_ad_channel ="1741562433";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
<br>
<script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 120;
google_ad_height = 240;
google_ad_format = "120x240_as";
google_ad_type = "text_image";
google_ad_channel ="1741562433";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
		  		 
 
			</td>
<cfset category = "">
</table> </td>
    <td valign="top" align="center"> &nbsp;&nbsp;&nbsp; <span class="row2">The latest additions to our collection. New Stuff being added every Week!!</span>
      <CFSET columns=1> <CFSET rows=1> 
    
	<table align="center" >
      <tr valign="top">
         
        <td valign="top" align="left">
		
		 <Table cellpadding="2" cellspacing="0" width="707"  >
             <CFSET enddisplay= start + display-1>

              <CFSET currentrow= start>
 <cfif start is 1 >
 <cfset session.filterarray = arraynew(2)>  
			  
            <CFLOOP QUERY="Getlist"		>
             
			  <cfset session.filterarray[currentrow][1] = newitem>
				   <cfset session.filterarray[currentrow][2] = cat>
		
			 </cfloop>
			 </cfif>
		
			  <CFLOOP QUERY="Getlist"		startrow="#start#"		endrow="#enddisplay#">
			
			   <CFIF COLUMNS eq 1>		  <tr>
			  </CFIF>
	            <CFSET invent=inventory>
                <td class="row1"> 
                  <!---			<CFIF getList.status is 3> --->
                  <font verdana size='1'> 
                  <cfif inventory GT 0 >
                    <cfset status_array[columns] = 1>
                    <!--- 1 is normal, -1 is sale, 0 is sold out --->
                    <cfif status is 3 >
                      <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                        <CFSET Saleprice = 0.80*price>
                      </cfif>
                      <cfset status_array[columns] = -1>
                      <!---   <img src="images/sale.gif"> <span class="whiteonred"><B>#dollarformat(saleprice)#</B></span> 
                &nbsp;Regular --->
                      <br />
                    </cfif>
                    <cfelse>
                    <!---    <font color=red size=2>Sold Out!</font> <br /> --->
                    <cfset status_array[columns] = 0>
                  </cfif>
                  <a href='jewelry_item.cfm/#newitem#.htm' > 
                  <!---	<a href='jewelry_item.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			<CFELSE>
			<a href='jewelry_item.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
                  <img src ='images/<cfif getlist.cat is "sets">necklaces<cfelse>#lcase(getlist.cat)#</cfif>/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a> 
                  <cfset price_array[columns] = #dollarformat(price)#>
                  <cfset descr_array[columns] = description>
                  <cfset item_array[columns] = newitem>
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
                <td  class="row3" nowrap><a href='jewelry_item.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;
				  <cfswitch expression="#status_array[indx]#">
				  <cfcase value="1"> <font color="##000099">#price_array[indx]#</font>&nbsp; &nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[Indx]#.htm' > 
                  <b>Buy</b></a></cfcase>
				  <cfcase value="-1"><font color="##000099" ><s>#price_array[indx]#</s></font>&nbsp; &nbsp;&nbsp; <a href='jewelry_item.cfm/#item_array[Indx]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> 
                  </cfcase>
				  <cfcase value="0">
                   <font color="##000099">#price_array[indx]#</font>&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               
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
                  <td class="row3"><a href='jewelry_item.cfm/#item_array[Indx]#.htm' >
                    <b>Zoom</b></a>&nbsp; &nbsp;&nbsp;  <cfswitch expression="#status_array[indx]#">
				  <cfcase value="1"> <font color="##000099">#price_array[indx]#</font> &nbsp; &nbsp;&nbsp;   <a href='jewelry_item.cfm/#item_array[Indx]#.htm' > 
                  <b>Buy</b></a></cfcase>
				  <cfcase value="-1"><font color="##000099" ><s>#price_array[indx]#</s></font> &nbsp; &nbsp;&nbsp; <a href='jewelry_item.cfm/#item_array[Indx]#.htm'  > 
                    <b><font color="maroon">sale!</font></b></a> 
                    </cfcase>
				  <cfcase value="0">
                   <font color="##000099">#price_array[indx]#</font>&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               
				  </cfswitch></font></td>
                </cfloop>
            <cfflush interval="200">
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row3" nowrap>&nbsp;</td>
              </cfloop>
            </tr>
            
              <CFSET columns=0>
              <!--- code of 19 aug 04 --->
      
          </cfif>
		  
          </table >
		   </td>
		   </tr>
	  <tr><Td>
		  		   <table width="708px"  align="left" BORDER=0>
            <tr> 
              <td align="left" border=0>   <a href="topselling.cfm" class="row2">See the Best Selling !</a>  
          </td>
         <td nowrap align="center">  
            <cfinclude template="searchforms.cfm"/></td>
                <td align="center" > 
            <a href="howtonavigate.cfm" class="row2">Need Help Finding ?</a>
                  </td>
		
            </tr>
            <tr>
              <td colspan="3" align="center"><cfinclude template="googleads.htm" />
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
		  
		  </tr>
		  
		  
		  </table></td>
		  </tr>
		    
		 <tr bgcolor="white"  >
		  
      <td align="center" valign="middle"    > <a href="http://www.myexhibition.com"> 
        Art Gallery</a></td>
		     
      <td align="center" valign="middle" background="images/bottom_bg.gif"> 
        <cfinclude template="adminfooter.cfm">
			 </td>
    
      </tr>
     </table>
	</cfoutput>
<!---
<CFIF #session.mail# is "">
You are not logged in and will not earn 10% credit</i>
<CFELSE>
<i>You are logged in as: #session.mail#
</CFIF>
    <cfoutput><font color="##FFFFFF">#screensize#, #session.screenwidth#,#displaycolumns#</font></cfoutput>
 ---><script language="JavaScript1.1">
<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;

</cfif>
	</script>
</div>
</BODY>
</HTML>

