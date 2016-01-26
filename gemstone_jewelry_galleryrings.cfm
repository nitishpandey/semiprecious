<cfparam name="metatitle" default="">
<cfparam name="metadescription" default="">
<cfparam name="metakeywords" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="LatesStartingBackMonths" default="1">

<cfparam name="ringsize" default="">
<cfif ringsize neq ""><cfif ringsize does not contain 'size'><cfset ringsize='size ' & ringsize></cfif></cfif>

 <cfif cgi.server_name contains "handmadelaptopcase.com">
  <cflocation url="http://www.handmadelaptopcase.com/laptopbags" addtoken="no">
  </cfif>
  
<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
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
<!--Start Kampyle Exit-Popup Code--> 
<script type="text/javascript">
var k_push_vars = {
	"view_percentage": 30,
	"popup_font_color": "#000000",
	"popup_background": "#F8D763",
	"header": "Your feedback is important to us!",
	"question": "Would you be willing to give us a short (1 minute) feedback?",
	"footer": "Thank you for helping us improve our website",
	"yes": "Yes",
	"no": "No",
	"text_direction": "ltr",
	"images_dir": "http://cf.kampyle.com/",
	"yes_background": "#76AC78",
	"no_background": "#8D9B86",
	"site_code": 4132262
}
</script>
<script type="text/javascript" src="http://cf.kampyle.com/k_push.js"></script>
<!--End Kampyle Exit-Popup Code-->

<!-- Start Kampyle Css -->
<link rel="stylesheet" type="text/css" media="screen" href="http://cf.kampyle.com/k_button.css" />
<!-- End Kampyle Css -->

<link rel="shortcut icon" href="/favicon.ico" />
<SCRIPT language="JavaScript" type="text/javascript">
<!-- Yahoo! Inc.
var ysm_accountid  = "10CC04QGR59A2PT01M2RHEVOJN0";
document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' " 
+ "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid 
+ "></SCR" + "IPT>");
// -->
</SCRIPT>
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
 <cfparam name="displayrows" default="4">
 </cfif>
 
<CFPARAM NAME="displaycolumns" DEFAULT="4">

<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
 
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="ALL" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is 'beads' and session.mail neq "acemat@vsnl.com"><cfset invstatus=0></cfif>
<cfif category is "bracelets"><cfset displaycolumns="4"></cfif>
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
				<CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
				<cfelse>
				<CFPARAM NAME="url.sortorder" DEFAULT="datetaken desc" >
			</cfif>
		</cfif>
<cfparam name="sortorder" default="">		
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
 advancedsearch=replacenocase(advancedsearch,"mixed stone","mixedstone");
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
 advancedsearch=replacenocase(advancedsearch,"color"," ");
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
   displaycolumns = 2;
if ( screensize is "small"){
 displaycolumns = 2;
}
}
</cfscript>
<cfset categ=category><cfif category is "All"><cfset categ="jewelry"></cfif>
<!--- meta tags addition for groups--->
<cfparam name="groupname" default="">
<cfif groupname neq "">
		<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> 
			<cfset metatitle="Wholesale #groupname# #subcat# #categ#">
			<cfset metadescription="Wholesale semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
			<cfset metakeywords="Wholesale <cfoutput>#groupname# #subcat# #categ#</cfoutput> jewelry">
		<cfelse>
			<cfset metatitle="#groupname# #subcat# #categ#">
			<cfset metadescription="semiprecious gemstone <cfoutput>#groupname#</cfoutput> jewelry">
			<cfset metakeywords="<cfoutput>#groupname# #subcat# #categ#</cfoutput> jewelry">
		</cfif>

<cfelse>

	<cfquery name="contentbypage" datasource="gemssql">
	Select * from contentbypage where pagename='#replace(Trim(cgi.script_name),"/","")#'
	</cfquery>
	<cfif contentbypage.recordcount GT 0>
		<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> 
			<cfset metatitle="Wholesale #subcat# #categ#">
			<cfset metadescription="Wholesale #contentbypage.metadescription#">
			<cfset metakeywords="Wholesale #contentbypage.keywords#">
			<cfset pagedescription="Wholesale #contentbypage.description#">
			<cfelse>
			<cfset metatitle="#subcat# #categ#">
			<cfset metadescription="#contentbypage.metadescription#">
			<cfset metakeywords="#contentbypage.keywords#">
			<cfset pagedescription="#contentbypage.description#">
		</cfif>
	</cfif>

</cfif>
<!--- end meta tags for groups ---->
<cfset currentpathfile='#replace(replacenocase(GetCurrentTemplatePath(),'d:\inetpub\semiprecious\',''),'\','/')#'>
<cfset currentfile='#Trim(cgi.script_name)#'>


<!--- speed up things  --->
<CFIF start EQ 1 and advancedsearch neq "">

  <cftry>
    <CFQUERY DATASOURCE="gemssql" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery>
	<cfcatch type="database">
	  <cfquery DATASOURCE="gemssql"  name="">
  	Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'</cfquery>
	</cfcatch>
<cfcatch type="any">
	  	Sorry, an error has occured, please call us to let us know - 1 866 819 7692 
	</cfcatch>

</cftry>
  </CFIF>
<cfif not isdefined("form.submit5")>
<cftry>
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >
 <cfif (url.sortorder is "lastbought desc" or url.sortorder is "datetaken desc") and priceless eq "" and groupname eq "" and color eq "" and subcat is "" and style is "">
Select  getdate() as lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT top 4 0 as orderbuy,  lastbought, restockdate, disporder, newitem, CAT, style, subcat, subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items  
     where storage='Angela' and inventory>0  <CFIF category NEQ "ALL">
      and CAT = '#category#' </cfif>  and cat <>'bags'    <cfif subcat is not "chain-silver"> and subcat <> 'Chain-Silver' </cfif>
	<CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
	<CFELSE>
	and price>0 
	</CFIF>
	  <cfif subcat is not "">
	
	   and subcat like '#Left(subcat,5)#%' 
	</cfif>	 
	<CFIF salestatus is 3>
	 	and (status = 3)
    <CFELSE>
    	and (status=0 or status=3)
 	</CFIF>
	  <cfif url.style is 'silver'>
	   and (style like 'Silver%') 
		<cfelseif url.style is 'silverbeaded'>
	   and (style = 'Bali Silver Beaded') 
      <cfelseif url.style is 'beaded'>
	   and ((style='beaded') or (style = 'Bali Silver Beaded'))
		</cfif>
		  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
 ) x 
   Union
    </cfif>
  Select  case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock,
orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy, lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from 
   <cfif (url.sortorder is "lastbought desc" or url.sortorder is "datetaken desc") and subcat is "" and groupname is "" and color is "" and priceless is "" and style is ""> 
   (select top 200 * from items where (1=1)  and <CFIF category NEQ "ALL">
        CAT = '#category#' and </cfif> inventory>#invstatus# order by datetaken desc) <cfelseif    url.sortorder is "price desc" and subcat is ""> 
	     (select top 100 * from items where  (1=1)  and <CFIF category NEQ "ALL">
       CAT = '#category#' and  </cfif> inventory>#invstatus# order by price desc) 
	     </cfif> items
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where  (inventory>#invstatus#)  <cfif subcat neq "cubic zirconia"> and (storage not like 'CM%')</cfif>
<CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>

  <cfif advancedsearch is "">
    <CFIF category NEQ "ALL">
      and (CAT = '#category#' <!---or CAT2 = '#category#'--->
      )
 <cfelse>
      and (CAT <> 'beads' and cat <> 'bags'
      )
     </CFIF>
  </cfif>
  <CFIF salestatus is 3>
    and (status = 3)
    <CFELSE>
    and (status=0 or status=3)
</CFIF>
  
	  <cfif url.style is 'silver'>
	   and (style like 'Silver%') 
		<cfelseif url.style is 'silverbeaded'>
	   and (style = 'Silver Beaded') 
      <cfelseif url.style is 'beaded'>
	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
	<cfif subcat is not "chain-silver"> and subcat <> 'Chain-Silver' </cfif> 
	<cfif subcat is not "">

	   and (subcat = '#subcat#' or subcat2 = '#subcat#' or subcat3 = '#subcat#')
	</cfif>	  


  <CFIF advancedsearch1 is not "">
    and (left(subcat,3) ='#advancedsearch1#')  
  </CFIF>
  <CFIF advancedsearch2 is not "">
    and ((left(subcat,3) = '#advancedsearch2#') or (left(cat,3) = '#advancedsearch2#'))
  </CFIF>
  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
  <cfset ll = 0.5 * priceless >
  <cfset ul = 1.5 * priceless >
  <cfset url.sortorder = 'price desc' />
    and (price <= #ul# and price >= #ll#)
  </cfif>

  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
    
  <CFIF advancedsearch is not "">
    UNION lastbought, SELECT 1 as orderbuy, disporder,newitem, CAT, subcat, datetaken, NameID,       price    , saleprice, status, wholesaleprice, Description, inventory,  storage, thumblink, imagelink, buylink, case status when 3 then saleprice else price end  as orderprice from Items where (inventory>#invstatus#)
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#'             )
      </CFIF>
    </cfif>
    <CFIF salestatus is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)
    </CFIF>

        <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like 'silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '#Left(subcat,4)#%')
	   </cfdefaultcase>
      </CFswitch>
    <CFIF advancedsearch1 is not "">
      and (left(subcat,3)  like '%#advancedsearch1#%')
    </CFIF>
    <CFIF 	color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>
  </CFIF>
  <CFIF advancedsearch is not "">
    UNION lastbought , SELECT 2 as orderbuy, disporder, newitem, CAT,  subcat, datetaken, NameID,       price    , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink,imagelink, buylink,case status when 3 then saleprice else price end as orderprice from Items where (inventory>#invstatus#)
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
     )
      </CFIF>
    </cfif>
    <CFIF salestatus is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)

    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->

         <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like 'silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '#subcat#')
	   </cfdefaultcase>
      </CFswitch>
    <CFIF advancedsearch1 is not "">
      and (description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      and (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF advancedsearch3 is not "">
      and (description like '%#advancedsearch3#%')
    </CFIF>
    <CFIF color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>
  </CFIF>
  <CFIF advancedsearch3 is not "">
    UNION SELECT 3 as orderbuy,  disporder, newitem, CAT,  subcat, datetaken, NameID,       price    , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink, buylink, case status when 3 then saleprice else price end as orderprice from Items where (inventory>#invstatus# )
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
         )
      </CFIF>
    </cfif>
    <CFIF salestatus	 is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->

      <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like 'silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '#subcat#')
	   </cfdefaultcase>
      </CFswitch>
    <CFIF advancedsearch1 is not "">
      and (description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      and (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>
  </CFIF>
  <CFIF advancedsearch1 is not "">
    UNION 	lastbought, SELECT 4 as orderbuy,disporder, newitem, CAT,  subcat, datetaken, NameID,      price    , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink, buylink, case status when 3 then saleprice else price end as orderprice from Items where (inventory>#invstatus# )
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
      )
      </CFIF>
    </cfif>
    <CFIF salestatus is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->

    <CFIF subcat is not "">
      and (subcat like '%#Left(subcat,4)#%')
    </CFIF>
    <CFIF advancedsearch1 is not "">
      and ((description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      or (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF advancedsearch3 is not "">
      or (description like '%#advancedsearch3#%')
    </CFIF>
    ) And NOT ( 
    <CFIF advancedsearch1 is not "">
      (description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      and (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF advancedsearch3 is not "">
      and (description like '%#advancedsearch3#%')
    </CFIF>
) 
    <CFIF color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>
  </cfif>
)   s
 <!--- <cfif advancedsearch1 is not "">
    order by  orderbuy 
    <cfelse>--->
    order by instock, <cfif url.sortorder is "datetaken desc"> disporder desc <cfelse>#urldecode(url.sortorder)# </cfif>
<!---     </cfif>--->

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

<CFIF not isdefined("gETLIst.recordcount")>
	<body topmargin="0" background="/images/leftbackground.jpg">
		<div align="center">
			<cfinclude template="header.cfm">
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
			#titleCase(color)# #titleCase(subcat)# #style#  #titlecase(p)# gem stone  </cfif>
	</TITLE>
	
	<meta name="keywords" content=<cfif metakeywords neq "">"#metakeywords#"<cfelse>"<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>Affordable #color# #subcat#, Gem stone,  #p#"</cfif>>
	<meta name="author" content="Anup Pandey" />
	<meta name="description" content= <cfif metadescription neq "">"#metadescription#"<cfelse>'<cfif cgi.server_name contains 'wholesale-gemstone-jewelry.com'> Wholesale</cfif>#subcat# #style# #p# gem stone jewelry, retail and wholesale. <CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. </cfloop>'</cfif>
	>
</cfoutput>

<META content="20 days" name=revisit-after>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY  topmargin="0" background="/images/leftbackground.jpg">
<div align="center">

<CFINCLUDE TEMPLATE="headerforgemstone_jewelry_gallery.cfm"> 
<cfif color neq "">
	<CFINCLUDE TEMPLATE="colorinfo.inc">
</cfif>

<cfoutput>
    
	<cfif getlist.recordcount LT 13>
		<cfset displayrows = 6 /> <!--- else it remains at 5. Makes no sense to change page for 1 or 2 pictures --->
	</cfif>
	
	<cfset display = displaycolumns*displayrows>
	<CFIF GetList.cat is not "">
		<input type='hidden' name='category' value='#GetList.cat#'>
	<CFELSE>
		<input type='hidden' name='category' value='#category#'>
	</cfif>
	<input type='hidden' name='url.sortorder' value='#url.sortorder#'>
	
	<cfset tw =  606>
	<cfif subcat neq "">
	<table style="margin-left:0px;width:800px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
		<tr style="width:800px;">
			<td valign="top" align="center" width="800px" nowrap class="grayplacard">
				&nbsp;<font face=verdana style="text-transform:capitalize">
				<cfif len(advancedsearch)><cfelse><!--- Selection:  ---><Cfif isnumeric(priceless)>&nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gem stone selection" width="15" height="15" /><a href="#currentfile#?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
				</Cfif><cfif len(subcat) ><cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
				<cfif listfindnocase(Application.necklacestones,subcat)><a href="#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.Braceletstones,subcat)><a href="#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.ringstones,subcat)><a href="#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.earringstones,subcat)><a href="#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.pendantstones,subcat)><a href="#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;</cfif>
				<cfelseif  color neq "">In #color#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
				<cfelseif  salestatus is 3 ><span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;</cfif><cfif category EQ "All" ><span style="color:maroon;background-color:#light#;font-size=12 px;">All</span>&nbsp;</cfif></cfif>&nbsp;
				</font>
			</td>
		</tr>
	</table>
	</cfif>
</cfoutput>	

<CFSET columns=1> 
<CFSET rows=1> 
<CFSET enddisplay= start + display-1>
<CFSET currentrow= start>

<cfoutput>         
	<table id="container1" width="800px" cellspacing="1" cellpadding="0" border="0">
		<tr style="width:800px;" align="center">
<cfif cgi.server_name does not contain "wholesale-gemstone-jewelry.com" or category eq "beads">
			<td valign="top"  align="center" width="91px">
					<table style="background-color:##FFFFFF;border:1px ridge ##666600;" cellspacing="3"  cellpadding="2">
					<tr><td width=91>
					    <p style="margin:0px;font:12px;padding-left:2px;padding-bottom:2px;">
         <a href="/" class="headerfont" id="gemstone home">Home</a></td></tr><tr><td>
		 <a href="/gemstone-jewelry.cfm" class="headerfont" id="gemstone-jewelry">All Jewelry</a></td></tr><tr><td>
	   <a href="##" onMouseDown="MM_showHideLayers('necklacesstones' ,'','show','braceletsstones' ,'','hide','earringsstones' ,'','hide','pendantsstones' ,'','hide')" class="headerfont" id="necklaces">Necklaces</a> </td></tr><tr><td>
         <a href="##" onMouseDown="MM_showHideLayers('earringsstones' ,'','show','braceletsstones' ,'','hide','necklacesstones' ,'','hide', 'pendantsstones' ,'','hide')" class="headerfont" id="earrings">Earrings</a> </td></tr><tr><td>
         <a href="##" onMouseDown="MM_showHideLayers('pendantsstones' ,'','show','braceletsstones' ,'','hide','necklacesstones' ,'','hide', 'earringsstones' ,'','hide')" class="headerfont" id="pendants">Pendants</a> </td></tr><tr><td>
	    <a href="##"  onMouseDown="MM_showHideLayers('ringsstones' ,'','show','braceletsstones' ,'','hide','necklacesstones' ,'','hide', 'pendantsstones' ,'','hide')" class="headerfont" id='rings'>Rings</a></td></tr><tr><td>
         <a href="##"  onMouseDown="MM_showHideLayers('braceletsstones' ,'','show','earringsstones' ,'','hide','necklacesstones' ,'','hide', 'pendantsstones' ,'','hide')" class="headerfont" id='bracelets'>Bracelets</a></td></tr><tr><td>
       <a href="/designer_jewelry_angela.cfm" class="headerfont" id="beads">Exclusive Designs</a> </td></tr><tr><td>
	         <a href="/beads.cfm" class="headerfont" id="beads">Beads</a></td></tr><tr><td>
   <a href="laptopcases.cfm" class="headerfont" id="laptop bags">Fashion Bags</a> </td></tr><tr><td>
<cfif cgi.server_name neq "63.135.126.234">
	<a href="/pettags.cfm" class="headerfont" id="Pet Jewelry" title="Jewelry for Pets">Pet Tags</a> </td></tr><tr><td>
	</cfif>
	<a href="/healing.cfm" class="headerfont" id="healing" title="healing and decorative items">Healing</a>  </td></tr>
	<tr><td align="center"><a href="cart.cfm"><img src=http://www.semiprecious.com/images/smallcart.gif border="0" width=25></a><br><a href=cart.cfm>Cart</a></td></tr>

				
											<cfif category is "rings" or category is "beads">
						<tr align="center"  class="greenbutton">
							<td style="border-bottom:1px black solid;width:91px;">
						


						<!---		<cfinclude template="searchforms.cfm"/> --->

							<span style="color:black;font-weight:bold;text-transform:capitalize;font-size:11px;">#p# <img src="/images/arrow_down.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><br /></span>
						<CFINCLUDE TEMPLATE="subcatvertical.cfm">
													</td>
						</tr>
										</cfif>

										<tr bgcolor="##FFFFCC" bordercolor="##996600"><td width=100>
										<b><cfoutput>#Category# </cfoutput>by theme</b><br>
										<cfinclude template="includes/groups.cfm">	
										</td>
										</tr>
					</table>
				

			</td>
									</cfif>
			<td width="712px" align="center" valign="top" style="border:1px ##DDDDDD ridge;">
				<table id="infotable" align="center" cellspacing="0" cellpadding="1 ">
					<CFINCLUDE TEMPLATE="jumpstart.cfm" />
					<cfif start is 1>
						<cfinclude template="jumpstartblinder.cfm" />
						<cfset session.filterarray = arraynew(2)>
						<cfif category is 'ornaments'>
							<Tr valign="middle">
								<td valign="middle" style="color:##666600;" class="rowb">
									<b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b>
								</td>
							</tr>
						<cfelseif subcat is 'pearl'>
							<Tr valign="middle">
								<td valign="middle" style="color:##666600;" class="rowb" colspan=5> 
									<b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
								</td>
							</tr>
						</cfif>
							<cfif pagedescription neq "" or session.mail is 'acemat@vsnl.com'>
							<Tr valign="middle">
								<td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>> 
									<b><font color=gray size="-2"><i><cfoutput>#pagedescription#</cfoutput></i></font></b><br>
								<cfif session.mail is 'acemat@vsnl.com'>	<a href="http://www.semiprecious.com/admintools/contentadder.cfm?newname=#right(currentfile, len(currentfile)-1)#">Content Edit</a></cfif>
								</td>
							</tr>
							</cfif>
						<CFLOOP QUERY="Getlist">
							<cfset session.filterarray[currentrow][1] = newitem>
							<cfset session.filterarray[currentrow][2] = cat>
						</cfloop>
					</cfif>
				</table>
				
				<cfset rowsdisplayed = 0>
				<table align="center" cellspacing="0" border="0" cellpadding="3" style="margin-top:1px;background-color:##FFFFFF;">
					<cfif category is 'beads'>
						<tr><td colspan="<cfoutput>#displaycolumns#</cfoutput>" ><font color=green>Stone beads, thousands of them, now and forever growing on semiprecious.com. These lovely gem stones are calling you to combine them into pretty jewelry. Send us a picture when you make something and we will share the beaded jewelry with our visitors.  We will soon have a blog for that.</font></td></tr>
					</cfif>

		<cfif subcat neq "bulk lots" and (cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "")>
					<tr><td colspan="<cfoutput>#displaycolumns#</cfoutput>" ><a href=>HOME</a>&nbsp;&nbsp;&nbsp;<font color=red><b>FOR BULK LOTS CLICK</b></font>	 <a href=bulklots.cfm>HERE</a></font></td></tr>
		</cfif>
		<cfif category eq "rings">
					<tr><td colspan="<cfoutput>#displaycolumns#</cfoutput>" ><b>RINGS BY SIZE:</b> <a href=rings.cfm?ringsize=4>Size 4</a> | <a href=rings.cfm?ringsize=5>Size 5</a> | <a href=rings.cfm?ringsize=6>Size 6</a> | <a href=rings.cfm?ringsize=7>Size 7</a> | <a href=rings.cfm?ringsize=8>Size 8</a> |  <a href=rings.cfm?ringsize=9>Size 9</a> | <a href=rings.cfm?ringsize=10>Size 10</a></tr>
		</cfif>
					<tr class="greenbutton"  align="center">
						<td colspan="<cfoutput>#displaycolumns#</cfoutput>" 
						align="center" style="border-top:2px ridge #dark#">
							<cfif start GT 1>
								<cfset newstart = start - display>
								<cfif newstart LT 1>
									<cfset newstart = 1>
								</cfif>
								   <a href='#currentfile#?category=#category#&start=#newstart#<cfif url.sortorder neq "">&sortorder=#url.sortorder#</cfif><cfif subcat neq "">&subcat=#subcat#</cfif><cfif color neq "">&color=#color#</cfif><cfif priceless neq "">&priceless=#priceless#</cfif><cfif pricegreater neq "">&pricegreater=#pricegreater#</cfif><CFIF salestatus neq "">&salestatus=#salestatus#</CFIF><cfif advancedsearch neq "">&advancedsearch=#URLEncodedformat(advancedsearch)#</cfif><cfif style neq "">&style=#style#</cfif><cfif groupname neq "">&groupname=#groupname#</cfif>' ><img src="images/prevlist.gif" name="prev"  align="absbottom" border="0" style="display:inline;" width="80" height="31" /></a>&nbsp;&nbsp;
							<cfelse>
								&nbsp;
							</cfif>
							<cfif getlist.recordcount GT 50>
						<!---		<cfif url.sortorder neq "lastbought desc">--->
							<a href='#currentfile#?category=#category#&sortorder=lastbought'>Most Popular</a> ||
						<!---		<cfelse>--->
							<a href='#currentfile#?category=#category#&sortorder=pricedesc'>Premium </a> || &nbsp;&nbsp;
						<!---	</cfif>--->
											
					<!---	<cfif url.sortorder neq "datetaken desc">--->
							<a href='#currentfile#?category=#category#&sortorder=datetaken'>New Arrivals</a> || &nbsp;&nbsp;
							<!---<cfelse>--->
							<a href='cheap<cfif category is "All">jewelry<cfelse><cfoutput>-#category#</cfoutput></cfif>.cfm'>Cheaper <cfif category is "All">Jewelry<cfelse><cfoutput>#category#</cfoutput></cfif></a> || 
							
							<!---</cfif>--->
	&nbsp;&nbsp;&nbsp;	</cfif>			
	<cfif subcat is "pearl">Pearl and...
<form action="gemstone_jewelry_gallery.cfm" name="pearlform" method="get" style="display:inline;">
<input type="hidden" name="category" value="<cfoutput>#category#" />
<input type="hidden" name="subcat" value="pearl" />
<select name="color" onChange="javascript:submit(this.form);">  <option selected value="">colored</option>
      <OPTION value="">Select All</option>
      <OPTION value="Black">Black</option>
      <OPTION value="blue">Blue</option>
      <OPTION value="brown">Brown</option>
      <OPTION value="green">Green</option>
      <OPTION value="gray">Gray</option>
      <OPTION value="orange">Orange</option>
      <OPTION value="#light#">#light#</option>
      <OPTION value="purple">Purple</option>
      <OPTION value="red">Red</option>
      <OPTION value="white">White</option>
	        <OPTION value="multi">Multi-Color</option>
      <OPTION value="yellow">Yellow</option>
   </select></form>Stone</cfoutput></cfif>
	&nbsp;<CFIF #Evaluate(start + display - 1)# LT #GetList.Recordcount#><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# --->
&nbsp;&nbsp;&nbsp;&nbsp;<a href='#currentfile#?category=#category#&start=#evaluate(start + display)#<cfif url.sortorder neq "">&sortorder=#url.sortorder#</cfif><cfif subcat neq "">&subcat=#subcat#</cfif><cfif color neq "">&color=#color#</cfif><cfif priceless neq "">&priceless=#priceless#</cfif><cfif pricegreater neq "">&pricegreater=#pricegreater#</cfif><CFIF salestatus neq "">&salestatus=#salestatus#</CFIF><cfif advancedsearch neq "">&advancedsearch=#URLEncodedformat(advancedsearch)#</cfif><cfif style neq "">&style=#style#</cfif><cfif groupname neq "">&groupname=#groupname#</cfif>' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0" width="80" height="31"></a>
	<cfelse>	&nbsp;			</CFIF>
						</td>
					</tr>
					
					<CFIF getList.recordcount is 0>
						<div style="margin-top:10px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;"> 
							Sorry no matches found for your criteria (#category# #subcat# #advancedsearch# #color# #priceless#) specified. Could be that the particular designs are out of stock. Please try with some other words in your search.
							<br />
							<cfset silver = "">
							<cfif isdefined("url.relocated")>
								 <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#">SEE 
							      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
								<cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
									for #session.mail#.
									#cgi.QUERY_STRING# . 
								</cfmail>
							<cfelse>
							    <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#"  addtoken="no" />
								--->
						    </cfif>
							Often designs and range is discontinued due to  declining     interest.     
							<form action="gemstone_jewelry_gallery.cfm" method="post"  style="display:inline;" ><br>
								Search: <input type='text' maxlength="24" size="12" value="" name='advancedsearch'>
								<input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
							</FORM>
						</div> 
						<!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
						#session.mail#,#cgi.QUERY_STRING# .
						</cfmail>
						--->

						<cfif not isdefined("session.bulkbuyer.id")>Showing some other items on Sale if available in stock: 
						<cftry>
							<cfset salestatus = 3>
							<CFQUERY DATASOURCE="gemssql" NAME="GetList">
								select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								where   price >20
																	and (CAT = '#category#')
																<CFIF salestatus is 3>
									and (status = 3)
								<CFELSE>
									and (status=0 or status=3)
								</CFIF>	
								and inventory > -3) 
								<Cfswitch expression="#style#">
									<cfcase value=""></cfcase>
									<cfcase value="beaded">
										and (subcat not like 'silver%')
									</cfcase>
									<cfdefaultcase >
										and (style like '#Left(subcat,4)#%')
									</cfdefaultcase>
								</CFswitch>
								<CFIF color is not "">
									and (color like '%#color#%')
								</CFIF>
								<CFIF priceless is not "">
									and (price <= #priceless#)
								</cfif>
								<CFIF pricegreater is not "">
									and (price >= #pricegreater#)
								</CFIF>
								order by  #url.sortorder# 
							</CFQUERY>
								<cfcatch type="database">
						<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
						</cfcatch>
					</cftry>
						</cfif>
					
					</cfif>
	
	
	
	
	
					<!--- Start Matt Bayuk - SGM --->
					<cfset itemCount = 0>
					<cfset itemlist = 0>
					<CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#enddisplay#">
					<cfset itemlist=listAppend(itemlist, newitem)>
						<cfset itemCount = itemCount + 1>
						<CFIF COLUMNS eq 1>
							<tr align="center">
						</CFIF>
						
						<CFSET invent=inventory>
<!-- CCH
						<td class="rowb" style="border-left:1px solid black;" width="30%" onClick="hideAll(); div#itemCount#.style.display = 'block';">
-->						
						<td class="rowb" style="border-left:1px solid black;" width="30%">
							<cfsavecontent variable="smallContent">
								<cfif inventory GT 0>
						            <cfset status_array[columns] = 1>
									<cfif  cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "">
										<cfset l = 'AA2222'>
										<cfset price_array[columns] = format(wholesaleprice)>
									<cfelse>
										<cfset price_array[columns] = format(price)>
										<cfif status is 3>
											<CFIF getList.saleprice is "" or getList.Saleprice eq 0>
												<CFSET Saleprice = 0.80*price>
											</cfif>
											<cfset status_array[columns] = format(saleprice)>
										</cfif>
									</cfif>
								<cfelse>
									<cfset status_array[columns] = 0>
									<cfset price_array[columns] = soldformat(saleprice)>
								</cfif>
								<cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
					        
								<cfif getlist.storage EQ 'Pippin'>
									<a href=gem_stone_#cat#.cfm/#item_array[columns]#.htm>
										<img src ="#thumblink#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #category#" <cfif category is 'bracelets'>width="100"</cfif>>
									</a>
								<CFELSE>
									<a href='gem_stone_#cat#.cfm/#item_array[columns]#.htm'>
										<img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" <cfif category is 'bracelets'>width="100"</cfif>>
									</a>
								</CFIF>
								
								<CFIF Edit Is "MAMAMIA">
									<br><a href="np/match/cluster.cfm?list=1&target=#newitem#&category=#cat#">Ad2Clus</a>
									<a href='edititem.cfm?newitem=#newitem#'>Edit</a> (#inventory#)<font color='red'> 
									<cfif status is "1">
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
							</cfsavecontent>
						
		<cfsavecontent variable="smallContent">
<!---		<img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black' onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')">		--->
		<a href='/gem_stone_#cat#.cfm/#item_array[columns]#.htm'><img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'></a>
		<br /><img src='magnify.gif'  height="20" onClick="javascript:zoomImage('/images/#getlist.cat#/#newitem#.jpg')"/>&nbsp;&nbsp;&nbsp;<!---<a href="javascript:showDetails('#itemCount#');">Info</a>---><br><a href='/gem_stone_#cat#.cfm/#item_array[columns]#.htm'>Details /  Buy</a>

		<cfif subcat neq ""><br>#subcat#</cfif><cfif subcat2 neq "">-#subcat2#</cfif> <cfif category neq 'healing'>#left(Category,len(category)-1)#<cfelse>#category#</cfif><br><cfif #style# contains "silver">Sterling Silver</cfif><br>
			<cfset column = columns />
													<cfswitch expression="#status_array[column]#">
														<cfcase value="1">
															<a href='/gem_stone_#cat#.cfm/#item_array[columns]#.htm'>#price_array[column]#</a>
															<br>
														</cfcase>
														<cfcase value="0">
															<font color="##FF9966">2 - 4 week delivery</font>#price_array[column]#
														</cfcase>
														
														<cfdefaultcase>
															<br><a href='/gem_stone_#cat#.cfm/#item_array[column]#.htm'>
															<b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
															<font color="##000099"><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='/gem_stone_#cat#.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
															<br />
														</cfdefaultcase>
													</cfswitch>
		</cfsavecontent>				
	
							<cfsavecontent variable="bigContent">
								<div id="div#itemCount#" class="rowb" style="position:absolute; display:none; background-color:white; border:2px solid black; padding:4px;">
									<table cellpadding="2" cellspacing="0" border="0" width=300>
										<tr valign="top">
											<cfif columns lt 4>
											<td align="center">
												#smallContent#
													
											</td>
											</cfif>
											<td width="300">
											<a href='gem_stone_#cat#.cfm/#item_array[columns]#.htm'>Buy</a><br><br>
											<!---
												<table cellpadding="2" cellspacing="0" border="0"><tr><td nowrap>
													
													<cfset column = columns />
													<cfswitch expression="#status_array[column]#">
														<cfcase value="1">
															<font color="###l#">
															<a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' >
															<b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
															<br /><br>
														</cfcase>
														<cfcase value="0">
															<font color="##000099"><a href='gem_stone_#cat#.cfm/#item_array[column]#.htm'>
															<b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp; <br />
														</cfcase>
														
														<cfdefaultcase>
															<a href='gem_stone_#cat#.cfm/#item_array[column]#.htm'>
															<b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
															<font color="##000099"><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
															<br /><a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' ><font color="##CC3300">Buy</font></a>
														</cfdefaultcase>
													</cfswitch>
												</td></tr></table>--->
												<div aligh=left class="listdescr">
														<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">Wholesale</cfif> #left(description, 700)# 
													<br><br><br><a href='gem_stone_#cat#.cfm/#item_array[columns]#.htm'>Buy</a><br><br><span onMouseOver="div#itemCount#.style.display='none';"><a><font size=-1>close</font></a></span> 
													<!---<cfif not isdefined("session.bulkbuyer.id")><p>Wholesale <a href='wholesale_jewelry.cfm'>here</a></cfif>--->
												</div>
											
											</td>
											<cfif columns GT 3>
											<td align="center">
												#smallContent#
											
											</td>
											</cfif>
										</tr>
									</table>
								</div>
							</cfsavecontent>
							#bigContent#
							#smallContent#
									
						</td>
						
						<cfif columns EQ displaycolumns>
							<cfset rowsdisplayed = rowsdisplayed + 1>
							</tr>
							<CFSET columns=1>
						<cfelse>
							<CFSET columns=columns + 1>
						</cfif>
					</CFLOOP>
					<!--- End Matt Bayuk - SGM --->
				<cfinclude  template="statsrecord.cfm">
	
				    <cfif columns neq 1> <!---- means the last box in the row was not filled before comng out of query loop--->
						<cfloop from="#columns#" to="#displaycolumns#" index="idx">
							<td class="rowb" colspan="2">&nbsp;</td>
						</cfloop>
	
						<cfset rowsdisplayed = rowsdisplayed + 1></tr>
					</cfif>
					
<tr>
						<td align=left valign="top" colspan="1" border=0> 

			  <CFIF start is not "1">
                <a href='#currentfile#?category=#category#&start=#newstart#<cfif url.sortorder neq "">&sortorder=#url.sortorder#</cfif><cfif subcat neq "">&subcat=#subcat#</cfif><cfif color neq "">&color=#color#</cfif><cfif priceless neq "">&priceless=#priceless#</cfif><cfif pricegreater neq "">&pricegreater=#pricegreater#</cfif><CFIF salestatus neq "">&salestatus=#salestatus#</CFIF><cfif advancedsearch neq "">&advancedsearch=#URLEncodedformat(advancedsearch)#</cfif><cfif style neq "">&style=#style#</cfif><cfif groupname neq "">&groupname=#groupname#</cfif>' ><img src="images/prevlist.gif" name="prev"  align="absbottom" border="0" style="display:inline;" width="80" height="31" /></a>
                
				 <cfelse>  <a href="topselling.cfm" >Best Selling!</a>  </CFIF>
&nbsp;</td><td align=left valign="top" colspan="2" border=0> 
    <a name="byprice"></a><span class="category">#p#</span>:  
            <cfinclude template="searchforms.cfm"/> 
                </td><td align=right>  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>          <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> 
				   <a href='#currentfile#?category=#category#&start=#evaluate(start + display)#<cfif url.sortorder neq "">&sortorder=#url.sortorder#</cfif><cfif subcat neq "">&subcat=#subcat#</cfif><cfif color neq "">&color=#color#</cfif><cfif priceless neq "">&priceless=#priceless#</cfif><cfif pricegreater neq "">&pricegreater=#pricegreater#</cfif><CFIF salestatus neq "">&salestatus=#salestatus#</CFIF><cfif advancedsearch neq "">&advancedsearch=#URLEncodedformat(advancedsearch)#</cfif><cfif style neq "">&style=#style#</cfif><cfif groupname neq "">&groupname=#groupname#</cfif>' ><img src="images/nextlist.gif"  name="next"  border="0" align="absbottom" style="display:inline;" width="80" height="31"  /></a> 
     				<cfelse>
                <a href="howtonavigate.cfm" >How to Find?</a>
</CFIF>   </td> </tr> 
<cfinclude template="includes/linkexchangebystone.cfm">


                   <cfif rowsdisplayed LT 5 >
<cfif rowsdisplayed  is 0>
<cfset rowsdisplayed = 1>
</cfif>
<!---
				   <tr><td colspan="4" align="center"  class="biggreenwhite" >Random Picks from Top  Selling Designs  Shown Below</td>  <td  align="center"><a href='gemstone_jewelry_gallery.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#&groupname=#groupname#' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0"></a></td></tr--->
<!---<cf_simpleimages  cols="3"  colspan="2" rows="#evaluate(4 - rowsdisplayed)#"  boxclass="rowb" />--->
				   </cfif>   
				   <tr><td  colspan="6" align=middle>
				   <a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
				     <cfinclude template="googleadsforlist.htm"></td></tr>

<cfif subcat neq ""> <cfinclude template="marketing/stonelinks.cfm"></cfif> 
                 </table >
		</td></cfoutput><td valign="top" align="right" style="width:94px;">	
 <table cellpadding="3" cellspacing="0" style="horizontal-align:right;text-align:right;font-size:12px;display:block;padding:0px;margin-top:1px;">
<tr><td align="right" width="94px">
<table cellpadding="0" bgcolor=white   align="right" cellspacing="0" style="horizontal-align:right;text-align:right;text-transform:capitalize;border:1px <cfoutput>#light# ridge;border-left:solid 1px #light#</cfoutput>; ">
  <tr><td style="background-color:<cfoutput>#dark#</cfoutput>;color:white;font-weight:bold;text-align:center;font-size:12px;"> 
<a href=designer_jewelry_angela.cfm><img src='angela/designervertical.jpg' width="131" height="400"></a>
<br>
</td></tr>

<TR>	
          <td align="center" class="darkbox"><a href=laptopcases.cfm><img src="laptopbags/ads/vertical120x400.jpg" alt="designer laptopbags" width="120" height="400"></a>
		  
	


<cfif category neq 'beads'>
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

</TD></TR>
 <tr><td class=""><a href="showsets.cfm"><u>Matching Sets</u></a></td></tr>
</table></td></tr>
		  <tr><td>&nbsp;</td></tr>

<tr><td>
  <table cellpadding="3"  bgcolor=white align="right" cellspacing="0" style="horizontal-align:right;text-align:right;text-transform:capitalize;border:1px #DADA99 ridge;border-left:solid 1px #DADA99; ">
 	 <tr><td class="greenbutton" align="center" > <strong>By Color</strong></td></tr>
     <tr><td><a href="red_jewelry.cfm"><font color="#CC3333">Red Jewelry</font></a></td></tr>
<tr><td><a href="blue_jewelry.cfm"><font color="#330099">Blue Jewelry</font></a></td></tr>
        <tr><td><a href="gray_jewelry.cfm"><font color="#808080">Gray Jewelry</font></a></td></tr>
        <tr><td><a href="pink_jewelry.cfm"><font color="#FF66CC">Pink Jewelry</font></a></td></tr>
      <tr><td><a href="black_jewelry.cfm"><font color="black">Black Jewelry</font></a></td></tr>
	  <tr><td><a href="white_jewelry.cfm">White Jewelry</a></td></tr>
	 <tr><td><a href="green_jewelry.cfm"><font color="#009933">Green Jewelry</font></a></td></tr>
 <tr><td><a href="brown_jewelry.cfm"><font color="#663300">Brown Jewelry</font></a></td></tr>
        <tr><td><a href="yellow_jewelry.cfm"><font color="#FFCC00">Yellow Jewelry</font></a></td></tr>  
		<tr><td><a href="purple_jewelry.cfm"><font color="#990099">Purple Jewelry</font></a></td></tr>
              <tr><td><a href="orange_jewelry.cfm"><font color="#FF6600">Orange Jewelry</font></a></td></tr>
	   </table> 
</td></tr>		  <tr><td>&nbsp;</td></tr>
<span style="background-color:white">
<tr><td bgcolor="white" style="border: #light# 1px dotted;border-bottom: #light# 0px dotted">		<a href="gem_stone_#cat#.cfm"  >By Item No.</a><br>
</td></tr>		 
<tr><td bgcolor="white"><a  href="#byprice" >By Price</a><br>
</td></tr>		  <tr><td class="category" style="border: #light# 1px dotted;border-top: #light# 0px dotted" align="right" bgcolor="white">
<a href="apply.cfm">Sign Up</a><br>
</td></tr>
<cfoutput><tr><td bgcolor="white">
<a  href="google.cfm?q=#subcat#%2B#category#">Google Us</a></td></tr></span>
 </table></td></tr></table>     

 	   <table width="800"    align="center" BORDER=0>
         
<tr bgcolor="white"  >
      <td align="center" valign="middle"   >&nbsp;  <a href="http://www.myexhibition.com" class="error1" target="artwindow">Host Art!</a> </td>
    <td align="center" valign="middle"  > 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>     <cfif getlist.recordcount> <tr><td colspan="2" align="center">
    <cfif isdefined("session.india") and session.India is 1>
         <a href='http://www.affiliatecurry.com/affiliate/trackingcode.php?aid=1244&linkid=B11'><img src='http://www.affiliatecurry.com/images/banner1.gif' border='0'></a><cfelse> 
			
					  <font size=+3>NOW designer Gnana laptop cases ON SEMIPRECIOUS.COM <a href=laptopcases.cfm>CLICK HERE</a>
					
			
          </cfif>
             </td> </tr></cfif>
    </table>

	<script language="JavaScript1.1">
		function showDetails(itemNum) {
			hideAll(); 
			document.getElementById('div' + itemNum).style.display = 'block';
		}
		function displayZoom(zoomImg,imageWidth) {
			$.blockUI.defaults.css = {};
			$.blockUI( {
				message: "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<input type='button' id='closeZoom' value='Close' /><br><img src='" + zoomImg + "' />",
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

	</script>		</cfoutput> 
	<!--- <cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
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

<cfcatch type="application"> </cfcatch></cftry>
</div>

           <cfif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
	</cfif>
<!--Start Kampyle Feedback Form Button-->
<div id="k_close_button" class="k_float kc_bottom kc_right"></div>
<div><a href="http://www.kampyle.com/feedback_form/ff-feedback-form.php?site_code=4132262&amp;form_id=5330&amp;lang=en" target="kampyleWindow" id="kampylink" class="k_float k_bottom k_right" onClick="k_button.open_ff();return false;"><img src="http://cf.kampyle.com/en-orange-band-low-right.gif" alt="Feedback Form"/></a></div>
<script src="http://cf.kampyle.com/k_button.js" type="text/javascript"></script>
<!--End Kampyle Feedback Form Button-->

 </BODY>
</HTML>
