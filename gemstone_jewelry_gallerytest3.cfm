<cfset category="necklaces">
<cfset url.category="necklaces">

<cfsilent>
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="ringsize" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="grouping" default="">
<cfif ringsize neq "">
  <cfif ringsize does not contain 'size'>
    <cfset ringsize='size ' & ringsize>
  </cfif>
</cfif>
<cfif cgi.server_name contains "handmadelaptopcase.com">
  <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
  <cfelseif cgi.server_name contains "semiprecious.in">
  <cfset session.india=1>
</cfif>
<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#"> --->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <cfif session.bulkbuyer.id eq "">
    <cflocation url=login.cfm?email=pondyiitd@yahoo.com>
  </cfif>
</cfif>
<cfscript>
/*
 * function - titleCase()
 * accepts and returns string data
 * this function is similar to LCase or UCase,
 * it was designed for the college database which was provided
 * in ALLCAPS.
 * questions? http://artlung.com/feedback/
 * 2003/04/22
*/
function titleCase(string)  {
string =rtrim(string);	
if (len(string) gt 1)
	{
		string = lcase(string);

		if (refind("^[a-z]", string))  {
		string = ucase(left(string, 1)) & right(string,
(len(string) - 1 ));
		}
		next = refind("[[:space:][:punct:]][a-z]", string);
		while (next)  {
			if (next lt (len(string) - 1)) {
			string = left(string, (next)) & ucase(mid(string,
next+1, 1)) &  right(string, (len(string) - (next + 1)));
			} else {
			string = left(string, (next)) &
ucase(right(string, 1));
			}
		next = refind("[[:space:][:punct:]][a-z]", string, next);
		}
	} else {
	string = ucase(string);
	}
/* post fixes */
/* Recall that "Replace()" is case sensitive */
string = Replace(string," Of "," of ","ALL");
string = Replace(string," And "," and ","ALL");
string = Replace(string,"'S ","'s ","ALL");
string = Replace(string," At "," at ","ALL");
string = Replace(string," The "," the ","ALL");
string = Replace(string," For "," for ","ALL");
string = Replace(string," De "," de ","ALL");
string = Replace(string," Y "," y ","ALL");
string = Replace(string," In "," in ","ALL");
return string;
}
</cfscript>
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
<cfif session.mail eq 'acemat@vsnl.com'>
  <cfset url.edit =  'mamamia'>
  <cfset invstatus= -5>
</cfif>
<cfparam default="662222" name="l">
<cfset  top = 114 />
<!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
  <cfparam name="displayrows" default="1">
  <cfelse>
  <cfparam name="displayrows" default="1">
</cfif>
<CFPARAM NAME="displaycolumns" DEFAULT="4">

<cfparam name="jewelrysize" default="">
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="ALL" >
<CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq "acemat@vsnl.com">
  <cfset invstatus=0>
</cfif>
<cfif category is "bracelets">
  <cfset displayrows=1>
  <cfset displaycolumns="4">
</cfif>
<cfif category is 'beads'>
  <cfset displayrows=1>
  <cfset displaycolumns="4">
</cfif>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="subcat2" DEFAULT= "">
<cfif subcat contains "smokey" or subcat contains "smoky">
  <cfset subcat ="smoky quartz">
</cfif>
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
</cfsilent>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<SCRIPT language="JavaScript" type="text/javascript">
<script language="JavaScript" src="js/mm_menu.js"></script>
<script language="JavaScript" src="js/topmenu.js"></script>
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/favicon.ico" />
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script>
<!--- sortorder options are storage, datetaken, price, pricedesc, newitem --->
<cfsilent>
<CFINCLUDE TEMPLATE="setup.cfm">
<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
  <CFPARAM NAME="url.sortorder" DEFAULT="disporder" >
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
    <CFPARAM NAME="url.sortorder" DEFAULT="newitem desc" >
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
<cfinclude template="checkinjection.cfm">
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

</cfscript>
<cfset categ=category>
<cfif category is "All">
  <cfset categ="jewelry">
</cfif>
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">
<cfif groupname neq "">
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <cfset metatitle="Wholesale #groupname# #subcat# #categ# in gemstones">
    <cfset metadescription="Wholesale semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
    <cfset metakeywords="Wholesale <cfoutput>#groupname# #subcat# #categ#</cfoutput>  in gemstones">
    <cfelse>
    <cfset metatitle="#groupname# #subcat# #categ# in gemstones">
    <cfset metadescription="semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
    <cfset metakeywords="<cfoutput>#groupname# #subcat# #categ#</cfoutput> gemstone jewelry">
  </cfif>
</cfif>
<cfquery name="contentbypage" datasource="gemssql">
	Select * from nitish.contentbypage where pagename='#replace(Trim(CGI.path_info),"/","")#'
	</cfquery>
<cfif contentbypage.recordcount GT 0>
  <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
    <cfset metatitle="Wholesale #contentbypage.title#">
    <cfset metadescription="Wholesale #contentbypage.metadescription#">
    <cfset metakeywords="Wholesale #contentbypage.keywords#">
    <cfset pagedescription="Wholesale #contentbypage.description#">
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
<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(CGI.path_info)#'>
<!--- speed up things  --->
<CFIF start EQ 1 and advancedsearch neq "">
  <cftry>
    <CFQUERY DATASOURCE="gemssql" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery>
    <cfcatch type="database">
      <cfquery DATASOURCE="gemssql"  name="">
  	Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'
</cfquery>
    </cfcatch>
    <cfcatch type="any">
Sorry, an error has occured, please call us to let us know - 1 866 819 7692
    </cfcatch>
  </cftry>
</CFIF>
<cfif not isdefined("form.submit5")>
  <!---<cftry>--->
  <CFQUERY NAME="GetList" DATASOURCE="gemssql" >
 <cfif cgi.server_name contains "semiprecious.in">
 <cfinclude template="includes/getrecordsindia.cfm">
 <cfelse>
<cfinclude template="includes/getrecords.cfm">
</cfif>
</cfquery>

</cfif>


<cfif isdefined("form.submit5")>
  <CFQUERY DATASOURCE="gemssql" NAME="GetList">
  select disporder, newitem, CAT, subcat, NameID,  storage, thumblink, imagelink,   price  , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink  case status when 3 then saleprice else price end as orderprice from Items 
  <cfif isdefined("form.submit5")>
    where (saleprice 
    <cfif form.price EQ 0>
      < 1000 ) 
      <cfelse>
      <cfif form.price EQ 5>
        < 5.1) 
        <cfelse>
        <cfif #form.price#  EQ 10>
          < 10.1 ) 
          <cfelse>
          <cfif #form.price# EQ 20>
            < 20.1) 
            <cfelse>
            <cfif #form.price# EQ 1020>
              < 20.1) and (saleprice > 9.99) 
              <cfelse>
              > 19.99) 
            </cfif>
          </cfif>
        </cfif>
      </cfif>
    </cfif>
    <cfif not isDefined("form.cat1")>
      <cfif isDefined("form.cat")>
        and (cat in (#PreserveSingleQuotes(form.cat)#)) 
      </cfif>
    </cfif>
    <cfif not isDefined("form.subcat1")>
      <cfif isDefined("form.subcat")>
        and (subcat like (%#PreserveSingleQuotes(form.subcat)#%)) 
      </cfif>
    </cfif>
    <cfelse>
    <cfif isDefined("form.submit1")>
      <cfif not isDefined("form.cat1")>
        <cfif isDefined("form.cat")>
          where (cat in (#PreserveSingleQuotes(form.cat)#)) 
        </cfif>
      </cfif>
      <cfelse>
      <cfif isDefined("form.submit3")>
        <cfif not isDefined("form.subcat1")>
          <cfif isDefined("form.subcat")>
            where(subcat in (#PreserveSingleQuotes(form.subcat)#)) 
          </cfif>
        </cfif>
        <cfelse>
        <cfif isDefined("form.submit2")>
          where (saleprice 
          <cfif #form.price# EQ 0>
            < 1000 ) 
            <cfelse>
            <cfif #form.price# EQ 5>
              < 5.1) 
              <cfelse>
              <cfif #form.price#  EQ 10>
                < 10.1 ) 
                <cfelse>
                <cfif #form.price# EQ 20>
                  < 20.1) 
                  <cfelse>
                  <cfif #form.price# EQ 1020>
                    < 20.1) and (saleprice > 9.99) 
                    <cfelse>
                    > 19.99) 
                  </cfif>
                </cfif>
              </cfif>
            </cfif>
          </cfif>
          <cfelse>
          <h3>How on earth did we land up here !</h3>
        </cfif>
      </cfif>
    </cfif>
  </cfif>
  order by  cat, saleprice 
  </cfquery>
</cfif>
</cfsilent>

<!-- No items found -->
<CFIF not isdefined("getlist.recordcount")>
  <body topmargin="0">
  <div align="center">
    <cfif cgi.server_name contains "semiprecious.in">
      <cfinclude template="india/header.cfm">
      <cfelse>
      <cfinclude template="headertest.cfm">
    </cfif>
    <br>
    <span class="error">No  item found. PLEASE TRY AGAIN.</span>
    <cfif subcat is 'amber'>
      <cfinclude template="pippinindex.htm">
    </cfif>
    <cfinclude template="footer.htm">
    <CFSET enddisplay= start + display -1 >
  </div>
  </body>
  <cfabort />
</cfif>



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
    <cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
Wholesale
    </cfif>
    #titleCase(color)##titleCase(subcat)##style#Gemstone#titlecase(p)#
  </cfif>
  </TITLE>
  <meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gemstone, #p#, Austin"</cfif>>
  <meta name="author" content="Anup Pandey" />
  <meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. <CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. Shipped from Austin, TX. </cfloop>'</cfif>>
</cfoutput>
<META content="20 days" name=revisit-after>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY  topmargin="0">
<!--- Include themes popup when themes is rolledover --->
<cfinclude template="includes/themes.cfm">

<div align="center">
  <cfif cgi.server_name contains "semiprecious.in">
    <CFINCLUDE TEMPLATE="india/header.cfm">
    <cfelse>
    <CFINCLUDE TEMPLATE="headerforgemstone_jewelry_gallerytest.cfm">
  </cfif>
  <cfif color neq "">
    <CFINCLUDE TEMPLATE="colorinfo.inc">
  </cfif>
  <cfoutput>
    <cfset display = displaycolumns*displayrows>
    <CFIF GetList.cat is not "">
      <input type='hidden' name='category' value='#GetList.cat#'>
      <CFELSE>
      <input type='hidden' name='category' value='#category#'>
    </cfif>
    <input type='hidden' name='url.sortorder' value='#url.sortorder#'>
    <cfset tw =  606>
  </cfoutput>
  <CFSET columns=1>
  <CFSET rows=1>
  <CFSET enddisplay= start + display-1>
  <CFSET currentrow= start>
  <table id="container1" width="1000px" cellspacing="0" cellpadding="0" border="0">
    <tr style="width:1000px;" align="left">
    <cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com">
      <td valign="top"  align="left" width="91px">
         <!--- BEGIN LEFT SIDE STUFF --->
      <table border="0" align=center cellpadding="0" cellspacing="0">
      <tr><td colspan=3 class="hubtitle">
     <cfoutput>Search for #category#</cfoutput>
      </td></tr>
        <tr>
          <td colspan="3">Search or Item Number
            <label>
            <form action="gemstone_jewelry_gallery.cfm">
              <input name="advancedsearch" type="text" size="20" >
              <input type="submit" name="submit" value="Search" >
            </form>
            </label></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
         <FORM ACTION="/necklaces.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
        <td align="left"  border=1 colspan="3">
        
       
          <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
            <OPTION value="">All Designs</option>
            <cfoutput query="typesofnecklaces">
              <OPTION value="#groupname#">#groupname#</option>
            </cfoutput>
          </select>
          </td>
          
          </tr>
        <tr><td>&nbsp;</td></tr>
         
          <tr>
            <td align="left"  border=1 colspan="3" ><SELECT class="inputtext" NAME="color" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
                <option  value="" selected >By Color</option>
                <OPTION value="">Select All</option>
                <OPTION value="Black">Black</option>
                <OPTION value="blue">Blue</option>
                <OPTION value="brown">Brown</option>
                <OPTION value="green">Green</option>
                <OPTION value="gray">Gray</option>
                <OPTION value="orange">Orange</option>
                <OPTION value="pink">Pink</option>
                <OPTION value="purple">Purple</option>
                <OPTION value="red">Red</option>
                <OPTION value="white">White</option>
                <OPTION value="yellow">Yellow</option>
                <OPTION value="Multi">Multi-Color</option>
              </select>
            </td>
          </tr>
        <tr><td>&nbsp;</td></tr>
         <tr>
            <td align="left"  border=1  colspan="3"><SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
                <option selected value=""> By Price</option>
                <OPTION value="6">Around $6</option>
                <OPTION value="10">Around $10</option>
                <OPTION value="20">Around $20</option>
                <OPTION value="30">Around $30</option>
                <OPTION value="40">Around $40</option>
                <OPTION value="50">Around $50</option>
                <OPTION value="75">Around $75</option>
                <OPTION value="100">Around $100</option>
              </select>
            </td>
          </tr>
       <tr><td>&nbsp;</td></tr>
          <tr>
            <td align="left"  border=1  colspan="3"><SELECT class="inputtext" NAME="jewelrysize" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
                <option selected value="">Size Inches</option>
                <OPTION value="17">15 to 19</option>
                <OPTION value="24">20 to 28</option>
                <OPTION value="34">28 to 38</option>
              </select>
            </td>
          </tr>
          <tr><td>&nbsp;</td></tr>
       <tr>
            <td align="left"  border=1  colspan="3"><CFQUERY DATASOURCE="gemssql" NAME="typesofjewelry">
		Select distinct groupname from groupings  order by groupname	
</cfquery>
              <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
                <option  value="" selected >Select Themes</option>
                <OPTION value="">All Designs</option>
                <cfoutput query="typesofjewelry">
                  <OPTION value="#groupname#">#groupname#</option>
                </cfoutput>
              </select>
            </td>
          </tr>
          <CFQUERY DATASOURCE="gemssql" NAME="necklacesstones">
				select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='necklaces' order by stone
	    </cfquery>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </FORM>
        <tr bgcolor="##FFFFCC" bordercolor="##996600" align=left>
          <td  align=left  colspan="3"><cfinclude template="includes/groups.cfm">
          </td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
        </tr>
        <CFINCLUDE TEMPLATE="subcatverticaltest.cfm">
      </table>
      <!--- END LEFT SIDE STUFF --->

            </td>
    </cfif>
    <td align="center" valign="top" style="border:1px ##DDDDDD ridge;">
    <table id="infotable" align="center" cellspacing="0" cellpadding="1 ">

      <cfif start is 1>

        <cfset session.filterarray = arraynew(2)>
        <cfif category is 'ornaments'>
          <Tr valign="middle">
            <td valign="middle" style="color:##666600;" class="rowb"><b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b> </td>
          </tr>
          <cfelseif subcat is 'pearl'>
          <Tr valign="middle">
            <td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>><b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
            </td>
          </tr>
        </cfif>
        
        <cfif pagedescription neq "" or session.mail is 'acemat@vsnl.com'>
          <Tr valign="middle">
            <td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>><b><font color=gray size="-2"><i><cfoutput>#pagedescription#</cfoutput></i></font></b><br>
              <cfif session.mail is 'acemat@vsnl.com'>
                <a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
              </cfif>
            </td>
          </tr>
        </cfif>
        
        <Tr valign="middle">
          <td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>><center>
              <div name="wholesalebanner" > <font color=red size=2><b>WHOLESALE BUYERS MUST LOGIN FOR WHOLESALE PRICES</b></font></div>
            </center></td>
        </tr>
        <CFLOOP QUERY="Getlist">
          <cfset session.filterarray[currentrow][1] = newitem>
          <cfset session.filterarray[currentrow][2] = cat>
        </cfloop>
      </cfif>
    </table>
    <cfset rowsdisplayed = 0>
    <table style="margin-left:0px;width:850px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
    <cfif subcat neq "bulk lots" and (cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "")>
      <tr>
        <td colspan="<cfoutput>#displaycolumns#</cfoutput>" ><a href=>HOME</a>&nbsp;&nbsp;&nbsp;<font color=red><b>FOR BULK LOTS CLICK</b></font> <a href=bulklots.cfm>HERE</a></font></td>
      </tr>
    </cfif>
    
    <cfif category eq "rings">
      <tr>
        <td colspan="<cfoutput>#displaycolumns#</cfoutput>" ><b>RINGS BY SIZE:</b> <a href=rings.cfm?ringsize=4>Size 4</a> | <a href=rings.cfm?ringsize=5>Size 5</a> | <a href=rings.cfm?ringsize=6>Size 6</a> | <a href=rings.cfm?ringsize=7>Size 7</a> | <a href=rings.cfm?ringsize=8>Size 8</a> | <a href=rings.cfm?ringsize=9>Size 9</a> | <a href=rings.cfm?ringsize=10>Size 10</a>
      </tr>
      <tr>
        <td colspan="<cfoutput>#displaycolumns#</cfoutput>" >&nbsp;
      </tr>
    </cfif>
    
  <cfif subcat is "">
    <tr>
      <td align="right" colspan="<cfoutput>#evaluate(displaycolumns)#</cfoutput>">
	    <cfif category is "pendants">
          <cfinclude template="includes/searchpendantdropdowns.cfm">
          <cfelseif category is "earrings">
          <cfinclude template="includes/searchearringdropdowns.cfm">
        </cfif>
      </td>
    </tr>
  </cfif>
  
  <!---  Start  Main Images --->
  		  <tr align=center valign=top><td colspan=6>
		  <a href=gemstone-jewelry.cfm><img src="ads/angelacenter.jpg" border=0 alt='gemstone jewelry' width="581" height="223"></a>
		  </td></tr>
  <!--- End Main Images --->
  
  
  <cfset url.sortorder="lastbought">

   <tr><td class="hubtitle">Most Popular</td></tr>
        <cftry>
        <CFQUERY DATASOURCE="gemssql" NAME="GetList">
		select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								
																	where (CAT = '#category#')
								and (inventory > 0) 
								order by  #url.sortorder# 
							</CFQUERY>
      <cfcatch type="database">
          <b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
        </cfcatch>
      </cftry>

  <CFINCLUDE TEMPLATE="singleitem.cfm">

    <tr><td class="hubtitle">Newest Items</td></tr>
      <cfset url.sortorder="datetaken">
        <cftry>
        <CFQUERY DATASOURCE="gemssql" NAME="GetList">
		select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								
																	where (CAT = '#category#')
								and (inventory > 0) 
								order by  #url.sortorder# 
							</CFQUERY>
      <cfcatch type="database">
          <b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
        </cfcatch>
      </cftry>

   <CFINCLUDE TEMPLATE="singleitem.cfm">  
   <tr><td class="hubtitle">Items on Sale</td></tr>
      <cfset url.sortorder="price">
        <cftry>
        <CFQUERY DATASOURCE="gemssql" NAME="GetList">
		select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								
																	where (CAT = '#category#')
								and (inventory > 0) and (status = 3)
								order by  #url.sortorder# 
							</CFQUERY>
      <cfcatch type="database">
          <b>tttSorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
        </cfcatch>
      </cftry>

   <CFINCLUDE TEMPLATE="singleitem.cfm">

<!--- Birthstone section --->
       <tr><td colspan="4"><div  class="greenbutton"> <strong>Birthstones</strong></div></td></tr>
         <tr align=center valign="top">
          <td valign="top" align=left colspan="4"><font =arial> <a href=<cfoutput>#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))#</cfoutput> Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
            Also, next months - <a href=<cfoutput>#lcase(monthasstring(month(now())+1))#-birthstone.cfm>#monthasstring(Month(now())+1)#</cfoutput> Birthstone Jewelry</a> </td>
        </tr>
<!--- End birthstone section --->
  
  
  <!--- Start By color section --->
  <tr><td colspan=4>	  <cfinclude template="includes/bycolortest.cfm"></td></tr>
  <!--- End by color section --->
  
  <!--- Start Necklace Type section --->
  <tr><td colspan="4">
  <div  class="greenbutton"> <strong>Necklaces</strong></div>
  </td></tr>
  <tr>
      <td align="center" valign="top" colspan="4">
              <font size="-1"><a href=beaded_necklaces.cfm>Beaded</a></font>&nbsp;&nbsp;||&nbsp;&nbsp;
              <font size="-1"><a href=silver_necklaces.cfm>In Sterling Silver</a></font>&nbsp;&nbsp;||&nbsp;&nbsp;
              <font size="-1"><a href=silver_bead_necklaces.cfm>With Silver Beads</a></font> </td>
   </tr>
   <!---  End Necklace Type section --->
 
  <cfinclude  template="statsrecord.cfm">
  <cfif columns neq 1>
    <!---- means the last box in the row was not filled before comng out of query loop--->
    <cfloop from="#columns#" to="#displaycolumns#" index="idx">
      <td class="rowb" colspan="2">&nbsp;</td>
    </cfloop>
    <cfset rowsdisplayed = rowsdisplayed + 1>
    </tr>
  </cfif>
   <cfoutput>
    <cfinclude template="includes/linkexchangebystone.cfm">
    <cfif rowsdisplayed LT 5 >
      <cfif rowsdisplayed  is 0>
        <cfset rowsdisplayed = 1>
      </cfif>
      <!---
				   <tr><td colspan="4" align="center"  class="biggreenwhite" >Random Picks from Top  Selling Designs  Shown Below</td>  <td  align="center"><a href='gemstone_jewelry_gallery.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#<CFIF jewelrysize neq "">&jewelrysize=#jewelrysize#</CFIF>
&groupname=#groupname#' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0"></a></td></tr--->
      <!---<cf_simpleimages  cols="3"  colspan="2" rows="#evaluate(4 - rowsdisplayed)#"  boxclass="rowb" />--->
    </cfif>
    <tr>
      <td  colspan="6" align=middle><a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
        <cfinclude template="/googleadsforlist.htm"></td>
    </tr>
    <cfif subcat neq "">
      <cfinclude template="/marketing/stonelinks.cfm">
    </cfif>
    </table >
    </td>
  </cfoutput>
  <td valign="top" align="right" style="width:94px;"></td>
  </tr>
  </table>
  <table width="800"    align="center" BORDER=0>
    <tr bgcolor="white"  >
      <td align="center" valign="middle"   >&nbsp; <a href="http://www.myexhibition.com" class="error1" target="artwindow">Host Art!</a> </td>
      <td align="center" valign="middle"  ><cfinclude template="adminfooter.cfm">
      </td>
    </tr>
    <cfif getlist.recordcount>
      <tr>
        <td colspan="2" align="center"><cfif isdefined("session.india") and session.India is 1>
            <a href='http://www.affiliatecurry.com/affiliate/trackingcode.php?aid=1244&linkid=B11'><img src='http://www.affiliatecurry.com/images/banner1.gif' border='0'></a>
            <cfelse>
          </cfif>
        </td>
      </tr>
    </cfif>
    <tr>
    <td>
    <!--- Start BBB row --->
    <table cellpadding="0" bgcolor=white   align="right" cellspacing="0" style="horizontal-align:right;text-align:right;text-transform:capitalize;border:1px <cfoutput>#light# ridge;border-left:solid 1px #light#</cfoutput>; ">
            <tr>
              <td><a href=/designer_jewelry_angela.cfm>Designer Section</a><br /><a href="/showsets.cfm"><u>Matching Sets</u></a> </td>
            
            <cfinclude template="/includes/rightpanelhorizontal.cfm">
         
              <td align="center" class="darkbox"><cfif category neq 'beads'>
                  <script type="text/javascript"><!--
google_ad_client = "pub-2709788135063072";
google_ad_width = 120;
google_ad_height = 600;
google_ad_format = "120x600_as";
google_ad_type = "text";
google_ad_channel ="";
//--></script>
                  <script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
                </cfif>
              </TD>
            </TR>
          </table>
    <!--- End BBB row --->
    
    </td>
    </tr>
  </table>

  <!--- <cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
 --->
  <cfif isdefined("session.bulkbuyer.id")>
    <script type="text/javascript" language="JavaScript1.1">
 	<!-- 
	document.getElementById("wholesale").style.color = "maroon";
	 	
  document.getElementById("wholesale").style.textDecoration = "none" ;
	//-->
	</script>
  </cfif>
  <cftry>
    <Cfif len(cgi.QUERY_STRING)>
      <cfset session.filter=CGI.QUERY_STRING >
      <cfelse>
      <cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
    </Cfif>
    <cfcatch type="application">
    </cfcatch>
  </cftry>
</div>
<cfif (subcat is not "" or color is not "") and not len(session.mail)>
  <CFINCLUDE template="stoneinfo.inc">
</cfif>
</BODY>
</HTML>
