
<CFPARAM NAME="sortorder" DEFAULT="" >
<CFPARAM NAME="start" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT="">
<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="url.ringsize" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">
<cfparam name="pendantsdone" default="no">
<cfparam name="DESCRIPTIon" default="WHEREFROM">

<cfparam name="earringsdone" default="no">
<cfparam name="braceletsdone" default="no">
<cfparam name="subcat2" default="">
<cfparam name="birthstone" default="MAY">

<cfif start neq "" or category neq "" or sortorder neq "">
<cfheader statuscode='301' statustext='Moved permanently'>
<cfheader name='Location' value='http://www.semiprecious.com/#lcase(subcat)#.cfm'>
<cfabort>
</cfif>
<cfset start=1>

<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
<!---	<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
 		<cfif session.bulkbuyer.id eq "">
  			<cflocation url=login.cfm?email=pondyiitd@yahoo.com>
 	 	</cfif>
	</cfif>--->

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

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >

<script language="JavaScript" src="js/mm_menu.js"></script>
<!-- Deluxe Menu -->
    <noscript><p><a href="http://deluxe-menu.com">Javascript Menu by Deluxe-Menu.com</a></p></noscript>
    <script type="text/javascript" src="newtopmenu.files/dmenu.js"></script>
    <!-- (c) 2009, by Deluxe-Menu.com -->
<link href="styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<link href="styles/hub.css" rel="stylesheet" type="text/css" />

<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery-1.2.6.js" language="JavaScript1.1" type="text/javascript"></script>
<script src="test/./jquery.blockUI.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="pagedescription" default="">
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="">
<cfif style neq "" and url.style eq ""><cfset url.style=style></cfif>
<cfparam name="silverjewelry" default="">
<cfset sj = "">
 <cfparam name="invstatus" default=-3	>
 <cfif session.mail eq 'acemat@vsnl.com'>
 <cfset url.edit =  'mamamia'>
 <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">
<cfset  top = 114 /> <!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
 <cfparam name="displayrows" default="5">
 <cfelse>
 <cfparam name="displayrows" default="5">
 </cfif>

<CFPARAM NAME="displaycolumns" DEFAULT="4">

<CFPARAM NAME="numpages" DEFAULT="0">
 <cfparam name="jewelrysize" default="">

<cfparam default="106" name="stonelistht" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq application.admin_email><cfset invstatus=0></cfif>
<cfif category is "bracelets" or category is 'beads'><cfset displayrows=3><cfset displaycolumns="5"></cfif>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="subcat" DEFAULT= "PERIDOT">
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



<CFINCLUDE TEMPLATE="setup.cfm">
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
<cfif sortorder neq ""><cfset url.sortorder =sortorder>	</cfif>
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

<cfif isnumeric(advancedsearch)> <cflocation url="detail.cfm?newitem=#advancedsearch#"></cfif>
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
<cfset categ=category><cfif category is "All"><cfset categ="jewelry"></cfif>
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">


	<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='#REPLACE(replace(Trim(cgi.script_name),"/",""),"TEST","")#'
	</cfquery>
	<cfif contentbypage.recordcount GT 0>
		<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'>
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
  <cfquery DATASOURCE="gemssql"  name="getlist">
	  Select distinct subcat, cat, style, inventory from qryCatSubcatBeadedAndSilverInventory where (subcat='#subcat#' ) and inventory >0 order by cat desc, inventory desc
  </cfquery>
<cfcatch type="database">
<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
</cfcatch>
</cftry>
<!---
<cfquery name="getlist" dbtype="query">
Select  lastbought, instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from getlist
   </cfquery>--->
<!---
<cfcatch type="database">
<cfmail to="anup@semiprecious.com" server="mail23" subject="error in list query1" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#
 #subcat#,#category#,#url.sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
 #cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
 <CFSET url.sortorder = 'datetaken desc' />
</cfmail>
</cfcatch>--->


<CFIF not isdefined("gETLIst.recordcount")>
	<body topmargin="0" background="/images/leftbackground.jpg">
		<div align="center">

<cfif cgi.server_name contains "semiprecious.in">
			<cfinclude template="/india/header.cfm">
<cfelse>
			<cfinclude template="header.cfm">
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
</html>
	<cfabort />
</cfif>

<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1>

<CFOUTPUT>
<cfif category is "ALL" or category is "">
			<cfset p = "Jewelry">
		<cfelse>
			<cfset p = category>
		</cfif>
	<TITLE style="text-transform:capitalize;">
	<cfif metatitle neq "">#metatitle#<cfelse><cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>
			#color# #subcat# #style#  #p# gem stone  </cfif>
	</TITLE>

	<meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gem stone,  #p#"</cfif>>
	<meta name="author" content="Anup Pandey" />
	<meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. <CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. </cfloop>'</cfif>
	>
</cfoutput>

<META content="20 days" name=revisit-after>

<script language="JavaScript" src="/js/imageswap.js"></script>
</HEAD>
<BODY  topmargin="0">
<div align="center">


<cfif cgi.server_name contains "semiprecious.in">
<CFINCLUDE TEMPLATE="/india/header.cfm">
<cfelse>
<CFINCLUDE TEMPLATE="/header.cfm">
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


	<table id="container1" width="906px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px">
		<tr style="width:906px;" align="">
			<td valign="top"  align="left" >
		<!--- BEGIN LEFT SIDE STUFF --->
<CFINCLUDE TEMPLATE="leftmenus.cfm">
          <!--- END LEFT SIDE STUFF --->


			</td>

			<td align="center" valign="top" style="border:1px ##DDDDDD ridge;">

			<cfset rowsdisplayed = 0>
			<table style="margin-left:0px;width:760px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;padding:5px 5px 5px 10px"  border="0" cellspacing="0"  cellpadding="0">

        <tr>
              <td height="225" align="center" valign="top"  class="<cfoutput>#replace(subcat," ","_")#</cfoutput>_header">
			  <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
<cfif  subcat neq "chain-silver"   and subcat neq "quartz">
                  <td height="120" align="left" valign="bottom" class="white_txt11"><cfoutput>#metatitle#</cfoutput></td>
                </tr>     </table></td>
</tr>
     </cfif>
					<cfset itemCount = 0>
							<tr align="center">

						<td bgcolor="#FFFFFF" valign=bottom align=center>
					<cfset itemlist = 0>
<div id="wrapper">
<div id="bottomTiles">
					<CFLOOP QUERY="Getlist">
					<cfif getlist.cat is 'necklaces' or getlist.cat is 'healing' or getlist.cat is 'beads' or getlist.cat is 'rings' or (getlist.cat is 'pendants' and pendantsdone is "no") or (getlist.cat is "bracelets" and braceletsdone is "no")  or (getlist.cat is "earrings" and earringsdone is "no") >
					<cfif getlist.cat is 'pendants'><cfset pendantsdone="yes"><cfset getlist.style=""></cfif>
					<cfif getlist.cat is 'bracelets'><cfset braceletsdone="yes"><cfset getlist.style=""></cfif>
					<cfif getlist.cat is 'earrings'><cfset earringsdone="yes"><cfset getlist.style=""></cfif>
					<cfif getlist.cat is 'rings'>
						<cfset ringsdone="yes">
						  	<cfset getlist.style=""></cfif>
						<cfset itemCount = itemCount + 1>
						<cfoutput>
						<cfquery datasource="gemssql" name="getfirstitem">
						Select top 1 newitem from items where cat='#cat#' and style like '%#getlist.style#%' and (subcat='#subcat#' or subcat2='#subcat#')  and  inventory>0 order by disporder, lastbought
						</cfquery>
						<cfoutput>
	<div class="sub1">
        <div class="subTop"><span></span></div>
           <div class="sub-content">
            	<div id="bottomBarTitle">
       					<a href='#replace(subcat," ","")#_#cat#.cfm<cfif style neq "">?style=#getlist.Style#</cfif>'><img src=images/#cat#/thumb/#getfirstitem.newitem#.jpg border=0 <cfif cat is "beads" or cat is "necklaces" or cat is "bracelets">width=120</cfif>></a>
    					</cfoutput>
						<br> <a href='#replace(subcat," ","")#_#cat#.cfm<cfif style neq ""><cfif style contains "silver">?style=silver<cfelse>?style=#getlist.Style#</cfif></cfif>'><cfif cat neq "beads" and cat neq "healing"> <cfif getlist.style is 'beaded'>#subcat# beaded #cat#<cfelseif getlist.style is "">#subcat# #cat#<cfelse>#subcat# #cat# in sterling silver</cfif><cfelse>#subcat# #cat#</cfif></a> <br>
						<b>[#inventory# designs]</b><p>
   					</cfoutput>
		            </div>
          </div>
        <div class="subBottom"><span></span></div>
	</div>




					</cfif>
					</CFLOOP>
   </div>
</div></td></tr>
					<cfif columns neq 1> <!---- means the last box in the row was not filled before comng out of query loop--->

						<cfoutput>
						<a href='gemstone-jewelry.cfm?subcat=#subcat#'><b>all #subcat# jewelry together</b></a></cfoutput>
						<CFSET columns=columns + 1>

						<cfset rowsdisplayed = rowsdisplayed + 1></tr>
						<cfelse>
				<CFOUTPUT>
						<tr><td height=1 ><a href='gemstone-jewelry.cfm?subcat=#subcat#'>All #subcat# jewelry together</a></td></tr>
						</cfoutput>
					</cfif>
                    <cfif birthstone neq "">
						<cfoutput>  <tr><td ><a href='#birthstone#-birthstone-information.cfm'>#birthstone# birthstone information</a></td></tr>
<tr><td height=10 bgcolor=black></td></tr></cfoutput>
                    </cfif>
	<cfquery datasource="gemssql" name="getdesigner">
	Select top 6 newitem, cat from items where supplier='Angela' and inventory>0 and subcat='#subcat#'
	</cfquery>
		<cfif getdesigner.recordcount GT 0>
<CFOUTPUT>
	<tr><td bgcolor="##FFFFFF"  bgcolor=black height=20>Designer #subcat# Jewelry</cfoutput></td></tr>
			<tr><td bgcolor="#FFFFFF" >
			<table border=1 bordercolor="#66CCCC"><tr>
			<cfloop query="getdesigner">
			<td valign="top">
			<cfoutput><a href='designer_jewelry_angela.cfm?subcat=#subcat#&category=#getdesigner.cat#'><img src=images/#getdesigner.cat#/thumb/#getdesigner.newitem#.jpg border=0></a></cfoutput>
			</td>
			</cfloop>
			</tr></table></td></tr>

		</cfif>

<cfif pagedescription neq "" or session.mail is application.admin_email>
							<Tr valign="middle">
								<td valign="middle" style="color:#666600;" class="rowb" >
									<b><font color=gray size="-2"><i><cfoutput>#pagedescription#</cfoutput></i></font></b><br>
								<cfif session.mail is application.admin_email>	<a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=<cfoutput>#right(currentfile, len(currentfile)-1)#</cfoutput>">Content Edit</a></cfif>
								</td>
							</tr>
							</cfif>

		<cfset subcat3 = replace(trim(subcat),"_","")>
		<cfset subcat3 = replace(trim(subcat3)," ","")>
				<CFOUTPUT>	<tr  bgcolor="white"><td align="center" height=30  ><a href=#subcat3#.cfm>SEE RANDOM #subcat# JEWELRY</cfoutput></a></td></tr>
					<!--- End Matt Bayuk - SGM --->
				<!---<cfinclude  template="statsrecord.cfm">--->

				<cfinclude template="includes/linkexchangebystone.cfm">
                <br>
                <cfoutput>
                   <cfif rowsdisplayed LT 5 >
<cfif rowsdisplayed  is 0>
<cfset rowsdisplayed = 1>
</cfif>

				   </cfif>
				   <tr><td  colspan="6" align=middle>
				   <a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
				     <cfinclude template="googleadsforlist.htm"></td></tr>

<cfif subcat neq ""> <cfinclude template="marketing/stonelinks.cfm"></cfif>
<tr><td colspan="#displaycolumns#" align="center"></cfoutput>
         <!--- Footer --->
             <cfinclude template="/mainfooter.cfm">
         <!--- End footer --->
</td></tr>

                 </table >
</td></tr></table>

 	   <table width="760"    align="center" BORDER=0>


     <cfif getlist.recordcount> <tr><td colspan="2" align="center">
    <cfif isdefined("session.india") and session.India is 1>
         <a href='http://www.affiliatecurry.com/affiliate/trackingcode.php?aid=1244&linkid=B11'><img src='http://www.affiliatecurry.com/images/banner1.gif' border='0'></a><cfelse>



          </cfif>
             </td> </tr></cfif>
    </table>
<cfoutput>
	<script language="JavaScript1.1">
		function showDetails(itemNum) {
			hideAll();
			document.getElementById('div' + itemNum).style.display = 'block';
		}
		function displayZoom(zoomImg,imageWidth) {
			$.blockUI.defaults.css = {};
			$.blockUI( {
				message: "<<<<<<<<<<<<<input type='button' id='closeZoom' value='Close' /><br><img src='" + zoomImg + "' />",
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

	</script>

 	<script language="JavaScript1.1">

		function hidex() {
			divx.style.display='none';

		}

		function hideAll() {
			for (i=1; i<=#itemcount#; i++) {
				eval('div'+i).style.display='none';
			}
		}
		/*
ShowHide('jumpstart');
	<cfif start eq 1>
ShowHide('jumpstartblinder');
</cfif>
*/
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

	</script>		</cfoutput>
	<!--- <cfset balance = session.screenwidth - 760>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:760px;height:900px;width=#balance#px;">&nbsp;</div>
 ---><cfif isdefined("session.bulkbuyer.id")>
<script type="text/javascript" language="JavaScript1.1">
 	<!--
	document.getElementById("wholesale").style.color = "maroon";

  document.getElementById("wholesale").style.textDecoration = "none" ;
	//-->
	</script>
</cfif><cftry>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter=CGI.QUERY_STRING >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
</Cfif>

<cfcatch type="application">
<CFOUTPUT>#CFCATCH.DETAIL#, #CFCATcH.MESSAGe#</CFOUTPUT>
</cfcatch></cftry>


           <cfif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
	</cfif>
</div>
 </BODY>
</HTML>
