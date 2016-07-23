
<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
	
	<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
 		<cfif not isdefined("session.bulkbuyer.id")>
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
<HEAD ><link rel="shortcut icon" href="/favicon.ico" />

<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
<cfparam name="style" default="">
<cfparam name="url.style" default="">
<cfif style neq ""><cfset url.style=style></cfif>
<cfparam name="silverjewelry" default="">
<cfset sj = "">
 <cfparam name="invstatus" default="-3">
 <cfif session.mail eq 'nitishpandey@indiatimes.com'>
 <cfset url.edit =  'mamamia'>
 <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">
<cfset  top = 114 /> <!--- the absolute position of left and right  vertical menu . subject to alteration due to prescence of certiain visual elements --->
 <cfparam name="displayrows" default="4">
 <CFPARAM NAME="displaycolumns" DEFAULT="5">
<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
 
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="ALL" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="subcat" DEFAULT= "">
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
 <Cfif style EQ "silver" or style EQ "silverbead">
	<cfset url.silverjewelry=silverjewelry>
</Cfif>
<CFINCLUDE TEMPLATE="setup.cfm">
 		<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
			<CFPARAM NAME="url.sortorder" DEFAULT="wholesaleprice" >
		<cfelse>
			<CFPARAM NAME="url.sortorder" DEFAULT="datetaken" >
		</cfif>
		<cfif category is 'beads'>
		<cflocation url="semiprecious-stone-beads.cfm?subcat=#subcat#&color=#color#&priceless=#priceless#"></cfif>
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
Select  case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock,
orderbuy, disporder, newitem, CAT, subcat, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy, lastbought, restockdate, disporder, newitem, CAT, subcat, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items where  (inventory>#invstatus#) and (storage not like 'CM%')
<CFIF isdefined("session.bulkbuyer.id")> AND WHOLESALEPRICE >0 AND (Storage <> 'pippin') and (storage not like 'CM%')</CFIF>

<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
And storage <> 'Angela'</cfif>
<!---<cfif jewelrysize NEQ ""> and size>19</cfif> --->
  <cfif advancedsearch is "">
    <CFIF category NEQ "ALL">
      and (CAT = '#category#' or CAT2 = '#category#'
      )
     <cfelse>
      and (CAT <> 'beads' 
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

	<cfif subcat is not "">
	   and (subcat like '#Left(subcat,5)#%' or subcat2 like '#Left(subcat,4)#%' or subcat3 like '#Left(subcat,4)#%')
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
	   and (subcat like '#Left(subcat,4)#%')
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
	   and (subcat like '#Left(subcat,4)#%')
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
    order by instock, #urldecode(url.sortorder)# 
<!---     </cfif>--->

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
	<TITLE style="text-transform:capitalize;">
		<cfif category is "ALL" or category is "">
			<cfset p = "Jewelry">
		<cfelse>
			<cfset p = category>
		</cfif> 
		#titleCase(color)# semiprecious Gem Stone #titleCase(subcat)# #style# #titlecase(p)#
	</TITLE>
	
	<meta name="keywords" content="cheap #color# semiprecious, Gem stone, #subcat#, #p#">
	<meta name="author" content="Anup Pandey" />
	<meta name="description" content='semiprecious  #subcat# #p#, gem stone #style# jewelry, retail and wholesale. <CFLOOP QUERY="Getlist" startrow="#start#"
		endrow="#evaluate(start+5)#">#description#. </cfloop>'
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
	<table style="margin-left:0px;width:800px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
		<tr style="width:800px;">
			<td valign="top" align="center" width="800px" nowrap class="grayplacard">
				&nbsp;<font face=verdana style="text-transform:capitalize">
				<cfif len(advancedsearch)><cfelse><!--- Selection:  ---><Cfif isnumeric(priceless)>&nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?#sj#&priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="gemstone_jewelry_gallery.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
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
		<tr style="width:800px;" align="center">
			<td valign="top"  align="center" width="91px">
				<cfif category neq "ornaments">
					<table style="background-color:##FFFFFF;border:1px ridge ##666600;" cellspacing="0"  cellpadding="1">
						<tr align="center"  class="greenbutton">
							<td style="border-bottom:1px black solid;width:91px;">
							<span style="color:black;font-weight:bold;text-transform:capitalize;font-size:11px;">#p# <img src="/images/arrow_down.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><br /></span>
							<cfinclude template="searchforms.cfm"/> 
							<CFINCLUDE TEMPLATE="subcatvertical.cfm">
							</td>
						</tr>
					</table>
				<cfelse>
					&nbsp;
				</cfif>
			</td>
			<td width="612px" align="center" valign="top" style="border:1px ##DDDDDD ridge;">
				<table id="infotable" align="center" cellspacing="0" cellpadding="1">
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
								<td valign="middle" style="color:##666600;" class="rowb"> 
									<b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
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
						<tr><td colspan=6><font color=green>beads being added daily Nov to December! Come back every day</font></td></tr>
					</cfif>
					<tr class="greenbutton"  align="center">
						<td colspan=1 align="left" style="border-top:2px ridge #dark#">
							<cfif start GT 1>
								<cfset newstart = start - display>
								<cfif newstart LT 1>
									<cfset newstart = 1>
								</cfif>
								<a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#newstart#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(urldecode(advancedsearch))#&style=#style#' ><img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>&nbsp;&nbsp;
							<cfelse>
								&nbsp;
							</cfif>
							<a href='gemstone_jewelry_gallery.cfm?category=#category#&sortorder=lastbought desc'>Purchased by others</a>
						</td>
						<td style="border-top:2px ridge #dark#">&nbsp;<cfif category is 'necklaces'>Special: <a href=http://www.semiprecious.com/silver_bead_necklaces.cfm>Bali Necklaces</a></cfif>
						</td>
						<td align="center" colspan=2 valign="middle"  class="greenbutton" style="border-top:2px ridge #dark#">&nbsp;

							</td><td colspan="2" align="center"  valign="middle"  class="greenbutton" style="border-top:2px ridge #dark#">
							
							<CFIF #Evaluate(start + display - 1)# LT #GetList.Recordcount#><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# --->
								&nbsp;&nbsp;&nbsp;&nbsp;<a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0" width="80" height="31"></a>
							<cfelse>
								&nbsp;
							</CFIF>
						</td>
					</tr>
					
					<CFIF getList.recordcount is 0>
						<div style="margin-top:10px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;"> 
							Sorry no matches found for your criteria (#category# #subcat# #advancedsearch# #color# #priceless#) specified. Could be that the particular designs are out of stock. Please try with some other words in your search.
							<br />
							<cfset silver = "">
							<cfif isdefined("url.relocated")>
								 <!--- To see and order any out of stock items please click here <a href="gemstone_jewelry_gallery.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#&#sj#">SEE 
							      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
								<cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
									for #session.mail#.
									#cgi.QUERY_STRING# . 
								</cfmail>
							<cfelse>
							    <!---  <cflocation url="gemstone_jewelry_gallery.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#&#sj#"  addtoken="no" />
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
							<cfset salestatus = 3>
							<CFQUERY DATASOURCE="gemssql" NAME="GetList">
								select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								where (1=1  <cfif isdefined("session.bulkbuyer.id")> and wholesaleprice >0</cfif>
								<cfif advancedsearch is "">
									and (CAT = '#category#')
								</cfif>
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
						</cfif>
					</cfif>
	
					<!--- Start Matt Bayuk - SGM --->
					<cfset itemCount = 0>
					<CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#enddisplay#">
						<cfset itemCount = itemCount + 1>
						<CFIF COLUMNS eq 1>
							<tr align="center">
						</CFIF>
						
						<CFSET invent=inventory>
				        
						<td class="rowb" style="border-left:1px solid black;" width="30%" onClick="hideAll(); div#itemCount#.style.display = 'block';">
							<cfsavecontent variable="smallContent">
								<cfif inventory GT 0>
						            <cfset status_array[columns] = 1>
									<cfif isdefined("session.bulkbuyer.id")>
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
		
		<img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'>
			<cfset column = columns />
													<cfswitch expression="#status_array[column]#">
														<cfcase value="1">
															<font color="###l#">
															<b>Details</b>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
															<br /><br>
														</cfcase>
														<cfcase value="0">
															<font color="##000099">
															<b>Details</b>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp; <br />
														</cfcase>
														
														<cfdefaultcase>
															<br><a href='gem_stone_#cat#.cfm/#item_array[column]#.htm'>
															<b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
															<font color="##000099"><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
															<br /><a href='gem_stone_#cat#.cfm/#item_array[column]#.htm' ><font color="##CC3300">Buy</font></a>
														</cfdefaultcase>
													</cfswitch>
		</cfsavecontent>
	
							<cfsavecontent variable="bigContent">
								<div id="div#itemCount#" class="rowb" style="position:absolute; display:none; background-color:white; border:2px solid black; padding:4px;" onClick="div#itemCount#.style.display='none';">
									<table cellpadding="2" cellspacing="0" border="0">
										<tr valign="top">
											<td>
												#smallContent#
											</td>
											<td>
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
												</td></tr></table>
												<div aligh=left class="listdescr">
													#left(description, 700)# 
													<cfif not isdefined("session.bulkbuyer.id")><p>Wholesale <a href='wholesale_jewelry.cfm'>here</a></cfif>
												</div>
											</td>
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
	
				    <cfif columns neq 1> <!---- means the last box in the row was not filled before comng out of query loop--->
						<cfloop from="#columns#" to="#displaycolumns#" index="idx">
							<td class="rowb" colspan="2">&nbsp;</td>
						</cfloop>
	
						<cfset rowsdisplayed = rowsdisplayed + 1></tr>
					</cfif>
					
					<tr>
						<td align=center valign="top" colspan="4" border=0> 

			  <CFIF start is not "1">
                  <a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#newstart#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#' ><img src="images/prevlist.gif" name="prev"  align="absbottom" border="0" style="display:inline;" width="80" height="31" /></a>
                 <cfelse>  <a href="topselling.cfm" >Best Selling!</a>  </CFIF>
&nbsp;&nbsp;&nbsp;&nbsp;
    <a name="byprice"></a><span class="category">#p#</span>:  
            <cfinclude template="searchforms.cfm"/>     &nbsp;&nbsp;&nbsp;&nbsp;
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>          <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> 
				   <a href='gemstone_jewelry_gallery.cfm?#sj#&category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absbottom" style="display:inline;" width="80" height="31"  /></a> 
     				<cfelse>
                <a href="howtonavigate.cfm" >How to Find?</a>
</CFIF>   </td> </tr> 
<cfif subcat is 'turquoise'><tr><td bgcolor='lightyellow' colspan=6 align=center>For more on turquoise, visit <a href=http://www.TurquoiseJewelry.com>TurquoiseJewelry.com</a></td></tr></cfif>	
                   <cfif rowsdisplayed LT 5 >
<cfif rowsdisplayed  is 0>
<cfset rowsdisplayed = 1>
</cfif>

				   <tr><td colspan="6" align="center"  class="biggreenwhite" >Random Picks from Top  Selling Designs  Shown Below</td></tr>

				
<cf_simpleimages  cols="3"  colspan="2" rows="#evaluate(4 - rowsdisplayed)#"  boxclass="rowb" />
				   </cfif>   
                 </table >
		</td></cfoutput><td valign="top" align="right" style="width:94px;">	
 <table cellpadding="3" cellspacing="0" style="horizontal-align:right;text-align:right;font-size:12px;display:block;padding:0px;margin-top:1px;">
<tr><td align="right" width="94px">
<table cellpadding="0" bgcolor=white   align="right" cellspacing="0" style="horizontal-align:right;text-align:right;text-transform:capitalize;border:1px <cfoutput>#light# ridge;border-left:solid 1px #light#</cfoutput>; ">
  <tr><td style="background-color:<cfoutput>#dark#</cfoutput>;color:white;font-weight:bold;text-align:center;font-size:12px;"> 
<strong><span class="" title="Other Sources">Other Sources</span><br /><span class="" title="suggested jewelry to make sets"> &amp; Sets</span></strong></td></tr>
<TR><TD> <cfif category eq 'healing'><script type="text/javascript"><!--
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
</td></tr>		  <tr><td class="category" style="border: #light# 1px dotted;border-top: #light# 0px dotted" align="right" bgcolor="white"><cfif subcat is "pearl">Pearl and...<br>
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
   </select></form><br>
Stone</cfoutput><cfelse><a href="apply.cfm">Sign Up</a></cfif><br>
</td></tr>
<cfoutput><tr><td bgcolor="white">
<a  href="google.cfm?q=#subcat#+#category#">Google Us</a></td></tr></span>
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
          <font size=+3>NEW NEW NEW - BEADS LAUNCHED ON SEMIPRECIOUS.COM <a href='beads.cfm'>CLICK HERE</a><!---<cfinclude template="googleadsforlist.htm">--->
          </cfif>
             </td> </tr></cfif>
    </table>

 	<script language="JavaScript1.1">
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
<cfset session.filter="#sj#&subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
</Cfif>

<cfcatch type="any"> </cfcatch></cftry>
</div>

           <cfif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
	</cfif>


 </BODY>
</HTML>
