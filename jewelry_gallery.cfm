<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD ><link rel="shortcut icon" href="/favicon.ico" />

<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
<cfparam name="silverjewelry" default="">
 <CFPARAM NAME="displaycolumns" DEFAULT="2"> 
<cfset sj = "">
 <cfparam name="invstatus" default="0">
 <cfif session.mail eq 'nitishpandey@indiatimes.com'>
 <cfset url.edit =  'mamamia'>
 <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">
<cfset  top = 114 /> <!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
 <cfparam name="displayrows" default="10">
<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
 
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
<CFPARAM NAME="url.sortorder" DEFAULT="price desc" >
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
<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if ( isdefined("session.bulkbuyer.id") )
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
   display=20;
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

 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select  orderbuy, disporder, newitem, CAT, subcat, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory,
   buylink ,  orderprice from (SELECT 0 as orderbuy, disporder, newitem, CAT, subcat, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory,
   buylink , case status when 3 then saleprice else price end as orderprice from items where  (inventory>#invstatus#)
<CFIF isdefined("session.bulkbuyer.id")> AND WHOLESALEPRICE >0</CFIF>
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
<cfinclude template="footer.htm"><CFSET enddisplay= start + display -1 >
</div></body>
<cfabort />
</cfif>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >
<CFOUTPUT >
<TITLE style="text-transform:capitalize;">  
 <cfif category is "ALL" or category is "">    <cfset p = "jewelry">    <cfelse><cfset p = category>   </cfif> #color# #subcat# #p# Semi precious Gem stone Sterling Silver Jewelry and Jewels </TITLE>
<meta name="keywords" content="#color# gemstone, #subcat# #category# jewelry,semi precious, semi-precious, jewellery">
<meta name="author" content="anup pandey" /><meta name="description" content='#subcat# #category# gem stone jewelry, retail and wholesale catalog. <CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>'>
</cfoutput>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY  topmargin="0" background="/images/leftbackground.jpg">
<div align="center">
<CFINCLUDE TEMPLATE="headerforgemstone_jewelry_gallery.cfm"> 

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
				  			  <!--- <cfquery dbtype="query" name="Getlist3">
			  select Getlist.* from Getlist where   getlist.newitem < 1000 and (Getlist.subcat like '%silver%' or Getlist.subcat like '%vermeil%') 
			  </cfquery>
			   --->
				  			  <cfelse>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.*  from Getlist where  subcat not like '%silver%' and subcat not like '%vermeil%'
			  </cfquery>
			  		  </cfif>
			  <cfset Getlist = Getlist2>
			  <cfset getlist2 = 0>
			  </cfif>
<cfoutput>
<!--- Temporarily removed by Anup, until non 0 inventory only would be shown --->
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
--->
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
 <table 	"style="margin-left:0px;width:800px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
    <tr style="width:800px;"     >
  
  
		
			<td valign="top" align="center"  width="800px" nowrap    class="grayplacard">
			 &nbsp;<font face=verdana style="text-transform:capitalize">
 <cfif len(advancedsearch) ><cfelse><!--- Selection:  ---><Cfif isnumeric(priceless)>&nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?#sj#&priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
</Cfif><cfif len(subcat) ><cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
<cfif listfindnocase(Application.necklacestones,subcat)><a href="#subcat3#_necklaces.cfm?sortorder=#url.sortorder#" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;</cfif>
<cfif listfindnocase(Application.Braceletstones,subcat)><a href="#subcat3#_bracelets.cfm?sortorder=#url.sortorder#" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;</cfif>
<cfif listfindnocase(Application.ringstones,subcat)><a href="#subcat3#_rings.cfm?sortorder=#url.sortorder#" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;</cfif>
<cfif listfindnocase(Application.earringstones,subcat)><a href="#subcat3#_earrings.cfm?sortorder=#url.sortorder#" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;</cfif>
<cfif listfindnocase(Application.pendantstones,subcat)><a href="#subcat3#_pendants.cfm?sortorder=#url.sortorder#" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;</cfif>
<cfelseif  color neq "">In #color#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?#sj#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
<cfelseif  salestatus is 3 ><span style="color:red ;font-size:12px;font-family: Arial;">On Sale</span><img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&color=#color#&salestatus=#salestatus#&#sj#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;</cfif><cfif category EQ "All" ><span style="color:maroon;background-color:#light#;font-size=12 px;">All</span>&nbsp;</cfif></cfif>&nbsp;
</font>
   </td>
	   </tr>
	       </table>
		        </cfoutput>	
  	 <CFSET columns=1> 
		 <CFSET rows=1> 
	 <CFSET enddisplay= start + display-1>
       <CFSET currentrow= start>
<cfoutput>         
<table id="container1" width="800px" cellspacing="1" cellpadding="0" border="0">
<tr style="width:800px;" align="center"> <td valign="top"  align="center" width="91px">
   <cfif category neq "ornaments">
	<table style="background-color:##FFFFFF;border:1px ridge ##666600;" cellspacing="0"  cellpadding="1">
	<tr align="center"  class="greenbutton"  ><td  style="border-bottom:1px black solid;width:91px;">
<span style="color:black;font-weight:bold;text-transform:capitalize;font-size:11px;">#p# <img src="/images/arrow_down.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><br /></span>
<CFINCLUDE TEMPLATE="subcatvertical.cfm">
	 </td></tr></table><cfelse>&nbsp;</cfif>
</td><td width="612px" align="center" valign="top" style="border:1px ##DDDDDD ridge;">
<table id="infotable" align="center" cellspacing="0"  cellpadding="1">
	   <CFINCLUDE TEMPLATE="jumpstart.cfm" />       
   		<cfif start is 1 > 
	 <cfinclude template="jumpstartblinder.cfm" />
	   <cfset session.filterarray = arraynew(2)>  
<cfif category is 'ornaments'>
	<Tr valign="middle">
	<td valign="middle" style="color:##666600;" class="rowb"> 
         <b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b>
	</td></tr>

    <cfelseif subcat is 'pearl'>
	<Tr valign="middle"><td valign="middle" style="color:##666600;" class="rowb"> 
      <b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
	</td></tr>

           <cfelseif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
            </cfif>

	</table>
	  <CFLOOP QUERY="Getlist"	>
              			  <cfset session.filterarray[currentrow][1] = newitem>
					   <cfset session.filterarray[currentrow][2] = cat>
					 </cfloop>
</cfif>
<cfset rowsdisplayed = 0>
   <table align="center" cellspacing="0" cellpadding="3" style="margin-top:1px;background-color:##FFFFFF;">
<tr  class="greenbutton"  align="center"><td align="left" style="border-top:2px ridge #dark#"> <cfif  start GT 1>
    	 <cfset newstart = start - display>
		 <cfif newstart LT 1>
		 <cfset newstart = 1>
         </cfif>
		<a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#newstart#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(urldecode(advancedsearch))#' ><img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>&nbsp;&nbsp;
		<cfelse>&nbsp;</cfif>[#getlist.recordcount# Designs]</td><td colspan="2" align="center"  valign="middle"  class="greenbutton" style="border-top:2px ridge #dark#">          
		<cfif find('price',url.sortorder)>
<a href='gemstone_jewelry_gallery.cfm?priceless=#priceless#&#sj#&category=#category#&sortorder=datetaken&subcat=#subcat#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black">Latest Additions</font></a><cfelse><a href='gemstone_jewelry_gallery.cfm?priceless=#priceless#&#sj#&category=#category#&sortorder=price&subcat=#subcat#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black">Sort On Price</font></a></cfif>&nbsp;&nbsp;&nbsp;<a href="##" onMouseDown="ShowHide('jumpstart'); return false;" style="color:black;">Index To Pages</a>
</td><td align="right" style="border-top:2px ridge #dark#"><CFIF #Evaluate(start + display - 1)# LT #GetList.Recordcount#><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# --->
<a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/next.gif" height="18" name="next" border="0" align="absmiddle" vspace="0" hspace="0"></a><cfelse>&nbsp;</CFIF>
</td></tr>
				<CFIF getList.recordcount is 0>
  <div style="margin-top:10px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;"> 

    Sorry no matches found for your criteria (#category# #subcat# #advancedsearch# #color# #priceless#) specified. Could be that the particular     designs are out of stock. Please try with some other words 