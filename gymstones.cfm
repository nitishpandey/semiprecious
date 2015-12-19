<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD ><link rel="shortcut icon" href="/favicon.ico" />

<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
<cfparam name="silverjewelry" default="">
 <CFPARAM NAME="displaycolumns" DEFAULT="3"> 
<cfset sj = "">
 <cfparam name="invstatus" default="0">
 <cfif session.mail eq 'nitishpandey@indiatimes.com'>
 <cfset url.edit =  'mamamia'>
 <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">
<cfset  top = 114 /> <!--- the absolute position of left and right  vertical mentu . subject to alteration due to prescence of certiain visual elements --->
 <cfparam name="displayrows" default="3">
<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
<cfparam name="session.bulkbuyer.id" default="">
<cfparam default="106" name="stonelistht" >
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
 <Cfif silverjewelry NEQ "">
<cfset url.silverjewelry=silverjewelry>
</Cfif>
<CFINCLUDE TEMPLATE="setup.cfm">
<CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
<!--- <CFIF url.sortorder is 'price'>
<CFSET url.sortorder='orderprice'>
 </cfif>
<CFPARAM NAME="PicWidth" DEFAULT= "120"> 
<cfoutput>url.sortorder is #url.sortorder#</cfoutput>
need to figure out from where sort order is coming as datetakendesc --->

<cfif url.sortorder eq 'datetakendesc' or url.sortorder eq 'newitemdesc' or url.sortorder eq 'datetaken'>
<cfset url.sortorder = 'newitem desc'>
</cfif>
<cfif url.sortorder is 'pricedesc'>
<cfset url.sortorder = 'price desc' />
</cfif>
<!--- <cfoutput>url.sortorder is #url.sortorder#</cfoutput> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="subcat" DEFAULT= "">
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
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> <CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cfinclude template="checkinjection.cfm">
<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if ( session.bulkbuyer.id is not "" )
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
 advancedsearch=replacenocase(advancedsearch,"gold stone","goldstone");
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
   advancedsearch1 = left(listGetat(advancedsearch,1," "),3);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),3);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),3);
}
 colors ='red,blue,gray,orange,green,maroon,black,pink,white,maroon,purple';
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
<!--- speed up things  --->
<CFIF start EQ 1 and advancedsearch neq "">

  <cftry>
    <CFQUERY DATASOURCE="gemssql" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery><cfcatch type="database">
	  <cfquery DATASOURCE="gemssql"  name="">
  Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'</cfquery>
</cfcatch></cftry>
  </CFIF>

<cfif not isdefined("form.submit5")>
<cftry>
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select  orderbuy, disporder, newitem, CAT, subcat, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory,
   buylink ,  orderprice from (SELECT 0 as orderbuy, disporder, newitem, CAT, subcat, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory,
   buylink , case status when 3 then saleprice else price end as orderprice from items where storage = 'cmzp' and (inventory>#invstatus#)
<cfif jewelrysize NEQ ""> and size>19</cfif> 
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

  
      <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
	   </cfdefaultcase>
      </CFswitch>
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
  <CFIF advancedsearch is not "">
    UNION SELECT 1 as orderbuy, disporder,newitem, CAT, subcat, datetaken, NameID,       price    , saleprice, status, wholesaleprice, Description, inventory, buylink, case status when 3 then saleprice else price end  as orderprice from Items where (inventory>#invstatus#)
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
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
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
    UNION SELECT 2 as orderbuy, disporder, newitem, CAT, subcat, datetaken, NameID,       price    , saleprice, status, wholesaleprice, Description, inventory, buylink,case status when 3 then saleprice else price end as orderprice from Items where (inventory>#invstatus#)
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
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
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
    UNION SELECT 3 as orderbuy,  disporder, newitem, CAT, subcat, datetaken, NameID,       price    , saleprice, status, wholesaleprice, Description, inventory, buylink, case status when 3 then saleprice else price end as orderprice from Items where (inventory>#invstatus# )
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
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
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
    UNION SELECT 4 as orderbuy,disporder, newitem, CAT, subcat, datetaken, NameID,      price    , saleprice, status, wholesaleprice, Description, inventory, buylink, case status when 3 then saleprice else price end as orderprice from Items where (inventory>#invstatus# )
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
  <cfif advancedsearch1 is not "">
    order by  orderbuy 
    <cfelse>
    order by #urldecode(url.sortorder)# 
     </cfif>

</cfquery>

<cfcatch type="database">
<b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
</cfcatch>
</cftry>
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
  select disporder, newitem, CAT, subcat, NameID,     price  , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink  case status when 3 then saleprice else price end as orderprice from Items 
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
          where storage = 'cmzp' and (cat in (#PreserveSingleQuotes(form.cat)#)) 
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
<body topmargin="0">
 <cfif cgi.server_name contains "semiprecious.in">
    <CFINCLUDE TEMPLATE="/india/header.cfm">
    <cfelse>
    <CFINCLUDE TEMPLATE="/header.cfm">
  </cfif>
  <table id="container1" width="1000px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px">
    <tr style="width:1000px;" align="center">
      <td valign="top"  align="center" ><!--- BEGIN LEFT SIDE STUFF --->
        <CFINCLUDE TEMPLATE="/leftmenus.cfm">
        <!--- END LEFT SIDE STUFF --->
      </td>
      <td align="center" valign="top" style="padding:10px;"><div align="center">


<span class="error">No  item found. PLEASE TRY AGAIN.</span>
        <cfinclude template="/mainfooter.cfm">
      </td>
    </tr>
  </table>
<CFSET enddisplay= start + display -1 >
</div></body>
<cfabort />
</cfif>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >
<CFOUTPUT >
<TITLE style="text-transform:capitalize;">  
 <cfif category is "ALL" or category is "">    <cfset p = "jewelry">    <cfelse><cfset p = category>   </cfif> #color# #subcat# #p# Semi precious Gem stone Sterling Silver Jewelry and Jewels </TITLE>
<meta name="keywords" content="zipper, gym clothing, workout clothing, gym jewelry,workout jewelry, designer zipper, zipper pulls>
<meta name="author" content="Chrsty Martin" /><meta name="description" content='Zipper gym clothing using gemstones, faceted stones in this gymstone pendants add beauty to other wise single color workout clothing. <CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#">#left(description,50)#. </cfloop>'>
</cfoutput>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
  <link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
  <script language="JavaScript" src="/js/imageswap.js"></script>
</HEAD>
<BODY  topmargin="0">
 <cfif cgi.server_name contains "semiprecious.in">
    <CFINCLUDE TEMPLATE="/india/header.cfm">
    <cfelse>
    <CFINCLUDE TEMPLATE="/header.cfm">
  </cfif>
  <table id="container1" width="1000px" cellspacing="0" cellpadding="0" border="0" style="padding:0 10px 0 10px">
    <tr style="width:1000px;" align="center">
      <td valign="top"  align="center" ><!--- BEGIN LEFT SIDE STUFF --->
        <CFINCLUDE TEMPLATE="/leftmenus.cfm">
        <!--- END LEFT SIDE STUFF --->
      </td>
      <td align="center" valign="top" style="padding:10px;"><div align="center">


	  <cfif isdefined("url.silverjewelry")>
	  		 <cfset sj = 'silverjewelry=#url.silverjewelry#' />
					  <cfif subcat eq 'silver'>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.* from Getlist where  Getlist.subcat like '%#left(url.silverjewelry,4)#%'
			  </cfquery>
			  <cfelseif url.silverjewelry eq 1>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.* from Getlist where   getlist.newitem > 800 and (Getlist.subcat like '%silver%' or Getlist.subcat like '%vermeil%') 
			  </cfquery>
				  			 
				  			  <cfelse>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.*  from Getlist where  subcat not like '%silver%' and subcat not like '%vermeil%'
			  </cfquery>
			  		  </cfif>
			  <cfset Getlist = Getlist2>
			  <cfset getlist2 = 0>
			  </cfif>
<cfoutput>
    <cfif subcat eq 'silver' or isdefined("url.silverjewelry") or (listfind(evaluate('application.silver.#category#tones'),subcat) and listfind(evaluate('application.#category#tonesns'),subcat))>
      <cfif len(cgi.QUERY_STRING)>
        <cfset tmp = Rereplace(cgi.QUERY_STRING,'silverjewelry=?','')> 
        <cfset cleanedqstring = Rereplace(tmp,'start=?','start=1&')>
        <cfset cleanedqstring = Rereplace(cleanedqstring,'invstatus=?','')>

        <cfelse>
        <cfset cleanedqstring="subcat=#subcat#&category=#category#&sortorder=#urlencodedformat(url.sortorder)#">
      </cfif>
             <a name="picsonly"  dir="ltr"></a> 
        <cfif subcat neq 'silver' and listfindnocase(evaluate('application.silver.#category#tones'),subcat)>
          <cfset subcatnogap = replace(subcat,' ','') />
		  		  <span class="cyansilverfilter" style="width:800px;margin-top:2px;">&nbsp;<strong>Silver Filter for #subcat# #p#</strong><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absbottom"  title="jewelry gemstone selection" width="15" height="15" />
		  <cfif isdefined("url.silverjewelry")> 
			<cfif url.silverjewelry> 
            <span style="color:maroon;" id="1">Showing Sterling Silver #subcat# #p#</span>&nbsp;&nbsp;&nbsp; <a href="#p#_#subcatnogap#.cfm?#cleanedqSTRING#&silverjewelry=0" style="color:black;"> 
            <font color="black">Check for non-Silver #subcat# #p#</font></a> 
            <cfelse>
            <a href="#p#_#subcatnogap#.cfm?#cleanedqSTRING#&silverjewelry=1" style="color:black;">See  #subcat# #p# in Sterling Silver</a> &nbsp;&nbsp;&nbsp;<span style="color:maroon;background-color:##DADA99;" id="0">Showing 
            Non-Silver #subcat# #p#</span></cfif>
			<cfelse>
			<a href="#p#_#subcatnogap#.cfm?#cleanedqSTRING#&silverjewelry=1" style="color:black;">See  #subcat# #p# in Sterling Silver</a>
			<font color="##666600">&nbsp;&nbsp;&nbsp;</font> 
            <a href="#p#_#subcatnogap#.cfm?#cleanedqSTRING#&silverjewelry=0" style="color:black;">Check for  Non-Silver #subcat# #p#</a>
			</cfif> </span>
          <cfelseif subcat eq 'silver' >
		  <cfset top = top + 5 />
		  <span class="cyansilverfilter" style="width:800px;display:block;margin-top:2px;">&nbsp;<strong>Silver Filter for #p#</strong><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absbottom"  title="jewelry gemstone selection" width="15" height="15" />
		  <form action="gemstone_jewelry_gallery.cfm?#cleanedqstring#" method="get" style="display:inline;margin:0px;">
          <input type="hidden" name="subcat" value="silver">
         See: <select name="silverjewelry" style="text-transform:capitalize;font-size:11px;padding:0px;" onChange="this.form.submit();" class="inputtext">
          <option value="">#p# in Silver and ...</option>
		  <cfset lis = evaluate('application.silver.#category#tones') >
          <cfloop list='#lis#' index="st">
          <option value="#st#">#st#</option>
          </cfloop>
          </select><input type="hidden" name="category" value="#category#"></form>&nbsp;&nbsp;&nbsp;Check For: <form action="gemstone_jewelry_gallery.cfm" method="get" style="display:inline;" >     
	       <select name="subcat" style="text-transform:capitalize;font-size:11px;padding:0px;" onChange="this.form.submit();" class="inputtext">
	 <option value="">Non-Silver #p# in ...</option>
	 <cfloop list='#evaluate("application.#category#tonesns")#' index="st">
              <option value="#st#">#st#</option>
     </cfloop>
	  </select><input type="hidden" name="silverjewelry" value="0" />
	  <input type="hidden" name="category" value="#category#" /></form> &nbsp; &nbsp;</span></cfif>
	   <cfelse>
<div  style="width:800px;" align="center">
<cf_steps step="1" />
</div>
    </cfif>
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

<table width =800 cellpadding=0>
<tr><td valign=top>
<img src='gymstones/images/gymstones_logo.jpg' width=200>&nbsp;&nbsp;<i>by Christy Martin</i></font>, see <a href='pettags.cfm'>Pet Tags</a> by her as well.</h2>

</td></tr></table>
 		        </cfoutput>	
  	 <CFSET columns=1> 
		 <CFSET rows=1> 
	 <CFSET enddisplay= start + display-1>
       <CFSET currentrow= start>
<cfoutput>         
<table id="container1" width="800px" cellspacing="1" cellpadding="0" border="0">
<tr style="width:800px;" align="center"> 
<!---deleted here--->
<td width="612px" align="center" valign="top" style="border:1px ##DDDDDD ridge;">
<table id="infotable" align="center" cellspacing="0"  cellpadding="1">
	   <CFINCLUDE TEMPLATE="jumpstart.cfm" />       
   		<cfif start is 1 > 
	 <cfinclude template="jumpstartblinder.cfm" />
	   <cfset session.filterarray = arraynew(2)>  
   

           <cfelseif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
            </cfif>

	</table>
	  <CFLOOP QUERY="Getlist"	>
              			  <cfset session.filterarray[currentrow][1] = newitem>
					   <cfset session.filterarray[currentrow][2] = cat>
					 </cfloop>

<cfset rowsdisplayed = 0>
   <table align="center" cellspacing="0" cellpadding="3" border=1  width=800 style="margin-top:1px;background-color:##FFFFFF;">
<tr  class="greenbutton"  align="center"><td colspan= <cfoutput>#(displaycolumns*2)#</cfoutput> align="left" style="border-top:2px ridge #dark#"> <cfif  start GT 1>
    	 <cfset newstart = start - display>
		 <cfif newstart LT 1>
		 <cfset newstart = 1>
         </cfif>
		<a href='gymstones.cfm?#sj#&category=#category#&start=#newstart#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(urldecode(advancedsearch))#' ><img src="images/prevlist.gif" name="prev" hspace="0" vspace="0" border="0" align="absmiddle" width="80" height="31"></a>&nbsp;&nbsp;
		<cfelse>&nbsp;</cfif>[#getlist.recordcount# Designs]


</td></tr>
				<CFIF getList.recordcount is 0>
  <div style="margin-top:10px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;"> 

    Sorry no matches found for your criteria (#category# #subcat# #advancedsearch# #color# #priceless#) specified. Could be that the particular     designs are out of stock. Please try with some other words in your search. 
	<cfif sj is 'silverjewelry=0'>
We have non silver jewelry in following gemstones:	#evaluate('application.#category#tonesns')#<br>
<Cftry>
	<cfset a = listdeleteat(evaluate('application.#category#tonesns'), listfind(evaluate('application.#category#tonesns'),subcat))>
<cfset 'application.#category#tonesns'  = a  />
<cfcatch type="any"></cfcatch></Cftry>
	</cfif>

    <br />
    <cfset silver = "">
    <cfif  isdefined("url.relocated")>
 <!---     To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#&#sj#">SEE 
      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
<cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
for #session.mail#.
#cgi.QUERY_STRING# . 
</cfmail>
      <cfelse>
      <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#&#sj#"  addtoken="no" />
    </cfif>
    Often designs and range is discontinued due to  declining     interest.     <form action="gemstone_jewelry_gallery.cfm" method="post"  style="display:inline;" >
      <br>
Search:       <input type='text' maxlength="24" size="12" value="" name='advancedsearch'>
      <input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
    </FORM>
  </div> 
  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="a criteria that is out of stock" type="html" >
#session.mail#,#cgi.QUERY_STRING# .
</cfmail>

  <cfif session.bulkbuyer.id is "">Showing some other items on Sale if available in stock: 
  <cfset salestatus = 3>
      <CFQUERY DATASOURCE="gemssql" NAME="GetList">
      select lastbought, disporder, newitem, CAT, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
      where (Storage ='cmzp'       <cfif advancedsearch is "">
        and storage='cmzp' and (CAT = '#category#' 
         )
      </cfif>
      <CFIF salestatus is 3>
        and (status = 3)
        <CFELSE>
        and (status=0 or status=3)
      </CFIF>
             and inventory > -3
           ) 
      <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like '%silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '%#Left(subcat,4)#%')
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
      order by #url.sortorder# 
      </CFQUERY></cfif> 
    </cfif>
	  <CFLOOP QUERY="Getlist"		startrow="#start#"	endrow="#enddisplay#">
						   <CFIF COLUMNS eq 1>
			  <tr align="center">
			  </CFIF>
		              <CFSET invent=inventory>
                     
        <td class="rowb" valign=top > 
          <cfif inventory GT 0 >
            <cfset status_array[columns] = 1>
            <cfif session.bulkbuyer.id neq "">
              <cfset  l = 'AA2222'>
              
              <cfset price_array[columns] = format(wholesaleprice)>
              <!---         </cfif> --->
              <cfelse>
              <cfset price_array[columns] = format(price)>
              <cfif status is 3  >
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
          <a href='jewelry_item.cfm/#item_array[columns]#.htm' > 
              <img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #category#"></a> 
         <CFIF Edit Is "MAMAMIA">
<br>
<a href="np/match/cluster.cfm?list=1&target=#newitem#&category=#cat#">Ad2Clus</a>
            <a href='edititem.cfm?newitem=#newitem#'>Edit</a> (#inventory#)<font color='red'> 
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
 </td>
        	<td class="rowb" valign=top><cfset column = columns />
			<cfswitch expression="#status_array[column]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='jewelry_item.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
				  <br /><br> </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='jewelry_item.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp; <br />&nbsp;<font color="##FF4444">Sold Out</font>
				  <a href='jewelry_item.cfm/#item_array[column]#.htm' ><font color="##CC3300">Order</font></a>
                    </cfcase>
               <cfdefaultcase >
			   <a href='jewelry_item.cfm/#item_array[column]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
<br /><a href='jewelry_item.cfm/#item_array[column]#.htm' ><font color="##CC3300">Buy</font></a></cfdefaultcase>
				  </cfswitch><div  align="justify"  class="listdescr">#left(description,150)#..</div></td>	
		  <cfif columns EQ displaycolumns>          <cfset rowsdisplayed = rowsdisplayed + 1></tr>
               <CFSET columns=1>
              <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
				  </CFLOOP>
    <cfif columns neq 1 > <!---- means the last box in the row was not filled before comng out of query loop--->
	<cfloop from="#columns#" to="#displaycolumns#" index="idx">
	<td class="rowb" colspan="2">&nbsp;</td> </cfloop>
 <cfset rowsdisplayed = rowsdisplayed + 1></tr>
	</cfif>
<tr> 
              <td align=center valign="top" colspan="6" border=0> 
			  <CFIF start is not "1">
                  <a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#newstart#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlist.gif" name="prev"  align="absbottom" border="0" style="display:inline;" width="80" height="31" /></a>
                 <cfelse>  <a href="topselling.cfm" >Best Selling!</a>  </CFIF>
&nbsp;&nbsp;&nbsp;&nbsp;
    <a name="byprice"></a><span class="category">#p#</span>:  
            <cfinclude template="searchforms.cfm"/>     &nbsp;&nbsp;&nbsp;&nbsp;
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>          <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> 
				   <a href='gymstones.cfm?#sj#&category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absbottom" style="display:inline;" width="80" height="31"  /></a> 
     				<cfelse>
                <a href="howtonavigate.cfm" >How to Find?</a>
</CFIF>   </td> </tr> 
                   <cfif rowsdisplayed LT 5 >
<cfif rowsdisplayed  is 0>
<cfset rowsdisplayed = 1>
</cfif>
				   <tr><td colspan="4" align="center"  class="biggreenwhite" >Random Picks from Top  Selling Designs  Shown Below</td></tr>
				<cf_simpleimages  cols="2"  colspan="2" rows="#evaluate(8 - rowsdisplayed)#"  boxclass="rowb" />
				   </cfif>   
                 </table ></td>
		</tr>
         

    <cfif getlist.recordcount> <tr><td colspan="2" align="center"><cfif isdefined("session.india")><a href='http://www.affiliatecurry.com/affiliate/trackingcode.php?aid=1244&linkid=B11'><img src='http://www.affiliatecurry.com/images/banner1.gif' border='0'></a><cfelse> <cfinclude template="googleadsforlist.htm"></cfif>
             </td> </tr></cfif>
    </table>

 	<script language="JavaScript1.1">
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
 ---><cfif session.bulkbuyer.id neq "">
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
<cfset session.filter="#sj#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
</Cfif>

<cfcatch type="any"> </cfcatch></cftry>
        <cfinclude template="/mainfooter.cfm">
      </td>
    </tr>
  </table>

 </BODY>
</HTML>
