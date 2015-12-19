<html>
		<head>
		<meta name="robots" content="noindex,nofollow">
		</head>
		<body>
		</BODY>
		</html>
		<cfabort>
<cfparam name="session.bulkbuyer.id" default="">
<cfparam name="groupname" default="">
<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->

	 
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
 <CFPARAM NAME="displaycolumns" DEFAULT="4">

<CFPARAM NAME="numpages" DEFAULT="0"> 
 <cfparam name="jewelrysize" default="">
 
<cfparam default="106" name="stonelistht" >
<CFPARAM NAME="category" DEFAULT="bags" >
 <CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<cfif category is "bracelets"><cfset displaycolumns="4"></cfif>
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
			<CFPARAM NAME="url.sortorder" DEFAULT="lastbought" >
		<cfelse>
			<cfif dateformat(now(),"dddd") eq "Sunday"> 
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
				<cfelseif dateformat(now(),"dddd") eq "Monday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
				<cfelseif dateformat(now(),"dddd") eq "Tuesday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
				<cfelseif dateformat(now(),"dddd") eq "Wednesday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
				<cfelseif dateformat(now(),"dddd") eq "Thursday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
				<cfelseif dateformat(now(),"dddd") eq "Friday" >
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
				<cfelse>
				<CFPARAM NAME="url.sortorder" DEFAULT="disporder desc" >
			</cfif>
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
<cfif category is 'beads'>
		<cflocation url="semiprecious-stone-beads.cfm?subcat=#subcat#&color=#color#&priceless=#priceless#"></cfif>
		
		<cfinclude template="checkinjection.cfm">
<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if ( session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring; 
 } 

  session.gallery = 'list' ;  // used to determine on cart page whether the buyer should be routed to laptopcases.cfm or gemstone.cfm when he clicks on continue shopping 
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
<cftry>
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >
 <cfif sortorder is "lastbought desc">
Select  getdate() as lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT top 5 0 as orderbuy,  lastbought, restockdate, disporder, newitem, CAT, style, subcat, subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items  
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where storage='Angela' and inventory>0  <CFIF category NEQ "ALL">
      and CAT = '#category#' </cfif><cfif subcat is not "">
	   and subcat like '#Left(subcat,5)#%' 
	</cfif>	 <CFIF salestatus is 3>
    and (status = 3)
    <CFELSE>
    and (status=0 or status=3)
</CFIF> order by lastbought desc) x 
   Union </cfif>
  Select case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock,
orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy, lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items 
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where  (inventory>#invstatus#) and (storage not like 'CM%')
<CFIF session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 AND (Storage <> 'pippin') and (storage not like 'CM%')</CFIF>
<!---
<cfif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
And storage <> 'Angela'</cfif>--->
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
	<body topmargin="0">
		<div align="center">
			<cfinclude template="headerbags.cfm">
			<br>
			<span class="error">No  item found. PLEASE TRY AGAIN.</span>
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
		
		Laptop cases and bags Handmade and Unique
	</TITLE>
	
	<meta name="keywords" content="laptop cases, laptop bags, fabric bags, designer laptop bags">
	<meta name="author" content="Anup Pandey" />
	<meta name="description" content="Laptop cases designed by Ravi Khanna, these laptop bags are strong and colorful, made with strong canvas and care. These are large, have space to hold all you want with your laptop bag">
</cfoutput>

<META content="20 days" name=revisit-after>
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY  topmargin="0">
<div align="center">

<CFINCLUDE TEMPLATE="headerbags.cfm"> 
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
	<table style="margin-left:0px;width:900px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
		<tr style="width:900px;">
			<td valign="top" align="center" width="800px" nowrap class="grayplacard">
				&nbsp;<font face=verdana style="text-transform:capitalize">
				<cfif len(advancedsearch)><cfelse><!--- Selection:  ---><Cfif isnumeric(priceless)>&nbsp;Around #format(priceless)#<img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /><a href="laptopcases.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="laptopcases.cfm?sortorder=#urlencodedformat(sortorder)#&priceless=#priceless#&color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="laptopcases.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="laptopcases.cfm?#sj#&priceless=#priceless#&color=#color#&category=Bracelets&sortorder=#urlencodedformat(sortorder)#" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="laptopcases.cfm?sortorder=#urlencodedformat(sortorder)#&#sj#&priceless=#priceless#&color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
				</Cfif><cfif len(subcat) ><cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
				<cfif listfindnocase(Application.necklacestones,subcat)><a href="#subcat3#_necklaces.cfm?sortorder=#url.sortorder#" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.Braceletstones,subcat)><a href="#subcat3#_bracelets.cfm?sortorder=#url.sortorder#" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.ringstones,subcat)><a href="#subcat3#_rings.cfm?sortorder=#url.sortorder#" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.earringstones,subcat)><a href="#subcat3#_earrings.cfm?sortorder=#url.sortorder#" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;</cfif>
				<cfif listfindnocase(Application.pendantstones,subcat)><a href="#subcat3#_pendants.cfm?sortorder=#url.sortorder#" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;</cfif>
</cfif>			</cfif>&nbsp;
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
	<table id="container1" width="850px" cellspacing="1" cellpadding="0" border="0">
		<tr style="width:800px;" align="center">
			<td valign="top"  align="center" width="91px">
							</td>
			<td width="612px" align="center" valign="top" style="border:1px ##DDDDDD ridge;">
				<table id="infotable" align="center" cellspacing="0" cellpadding="1">
					<CFINCLUDE TEMPLATE="jumpstart.cfm" />
					<cfif start is 1>
						<cfinclude template="jumpstartblinder.cfm" />
						<cfset session.filterarray = arraynew(2)>
						
						<CFLOOP QUERY="Getlist">
							<cfset session.filterarray[currentrow][1] = newitem>
							<cfset session.filterarray[currentrow][2] = cat>
						</cfloop>
					</cfif>
				</table>
				
				<cfset rowsdisplayed = 0>
				<table align="center" cellspacing="0" border="0" cellpadding="3">
					<tr  align="center">
						<td colspan="<cfoutput>#displaycolumns#</cfoutput>" 
						align="center">
							<cfif start GT 1>
								<cfset newstart = start - display>
								<cfif newstart LT 1>
									<cfset newstart = 1>
								</cfif>
								<a href='laptopcases.cfm?#sj#&category=#category#&start=#newstart#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(urldecode(advancedsearch))#&style=#style#&groupname=#groupname#' ><img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a>&nbsp;&nbsp;
							<cfelse>
								&nbsp;
							</cfif>
<b>ALL BAGS 40% REDUCED PRICES AS AN INTRODUCTION, LIMITED TIME</b>
							<!---</cfif>--->

<!---<cfif salestatus neq 3><a href=laptopcases.cfm?salestatus=3><font color="red">Bags on Introductory Sale!</font></a><cfelseif salestatus is 3><a href=laptopcases.cfm>All Bags</a></cfif>&nbsp;&nbsp;&nbsp;		--->		
	&nbsp;<CFIF #Evaluate(start + display - 1)# LT #GetList.Recordcount#><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# --->
&nbsp;&nbsp;&nbsp;&nbsp;<a href='laptopcases.cfm?#sj#&category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#&groupname=#groupname#' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0" width="80" height="31"></a>
	<cfelse>	&nbsp;			</CFIF>
						</td>
					</tr>
					
					<CFIF getList.recordcount is 0>
						<div style="margin-top:10px;border : 1px solid ##ECCCC;	width:607px;text-align:justify;font-size:12px;color:maroon;"> 
							Sorry no matches found for your criteria (#category# #subcat# #advancedsearch# #color# #priceless#) specified. Could be that the particular designs are out of stock. Please try with some other words in your search.
							<br />
							<cfset silver = "">
							<cfif isdefined("url.relocated")>
								 <!--- To see and order any out of stock items please click here <a href="laptopcases.cfm?invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#&#sj#">SEE 
							      OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed      to you via email and can take upto 3 weeks.  --->
								<cfmail from="service@semiprecious.com" to="anup@semiprecious.com"  server="mail23.webcontrolcenter.com" subject="#session.mail# - silver:#sj#,#category#,#subcat#,#color#," type="html" >
									for #session.mail#.
									#cgi.QUERY_STRING# . 
								</cfmail>
							<cfelse>
							    <!---  <cflocation url="laptopcases.cfm?&relocated=1&invstatus=-3&color=#color#&category=#category#&subcat=#subcat#&priceless=#priceless#&#sj#"  addtoken="no" />
								--->
						    </cfif>
							Often designs and range is discontinued due to  declining     interest.     
							<form action="laptopcases.cfm" method="post"  style="display:inline;" ><br>
								Search: <input type='text' maxlength="24" size="12" value="" name='advancedsearch'>
								<input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
							</FORM>
						</div> 
						<!---  <cfmail from="nitish@semiprecious.com" to="anup@semiprecious.com"  server="mail23" subject="a criteria that is out of stock" type="html" >
						#session.mail#,#cgi.QUERY_STRING# .
						</cfmail>
						--->

						<cfif session.bulkbuyer.id eq "">Showing some other items on Sale if available in stock: 
							<cfset salestatus = 3>
							<CFQUERY DATASOURCE="gemssql" NAME="GetList">
								select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
								where (1=1  <cfif session.bulkbuyer.id neq ""> and wholesaleprice >0</cfif>
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
					<cfset itemlist = 0>
					<CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#enddisplay#">
					<cfset itemlist=listAppend(itemlist, newitem)>
						<cfset itemCount = itemCount + 1>
						<CFIF COLUMNS eq 1>
							<tr align="center">
						</CFIF>
						
						<CFSET invent=inventory>
				        
						<td class="rowb"  width="30%" onClick="hideAll(); div#itemCount#.style.display = 'block';">
							<cfsavecontent variable="smallContent">
								<cfif inventory GT 0>
						            <cfset status_array[columns] = 1>
									<cfif session.bulkbuyer.id neq "">
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
		
		<img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'><br>

		
			<cfset column = columns />
													<cfswitch expression="#status_array[column]#">
														<cfcase value="1">
															<a href='laptop-case.cfm/#item_array[columns]#.htm'>#price_array[column]#</a>
															<br>
														</cfcase>
														<cfcase value="0">
															Sold!
														</cfcase>
														
														<cfdefaultcase>
															<br><a href='laptop-case.cfm/#item_array[column]#.htm'>
															<b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
															<font color="##000099"><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='laptop-case.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
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
											<a href='laptop-case.cfm/#item_array[columns]#.htm'>Zoom/Buy Page</a><br><br>
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
													#left(description, 300)#...[zoom for more] 
													<br><br><br><a href='laptop-case.cfm/#item_array[columns]#.htm'>Zoom/Buy Page</a><br><br><span onMouseOver="div#itemCount#.style.display='none';"><a><font size=-1>close</font></a></span> 
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
					<CFQUERY DATASOURCE="gemssql" NAME="stats">
						update itemstats set thumbexposure=thumbexposure+1 where itemid in (#itemlist#)
						</cfquery>
	
	<cfif subcat is 'turquoise'><tr><td bgcolor='lightyellow' colspan=6 align=center>For more on turquoise, visit <a href=http://www.TurquoiseJewelry.com>TurquoiseJewelry.com</a></td></tr></cfif>	
                   <cfif rowsdisplayed LT 5 >
<cfif rowsdisplayed  is 0>
<cfset rowsdisplayed = 1>
</cfif>
<!---
				   <tr><td colspan="4" align="center"  class="biggreenwhite" >
				   Similar Interesting Items from Our Associate Websites</td></tr>
		<tr><td colspan=4 align=center>
<iframe src="http://rcm.amazon.com/e/cm?t=onlineportfolian&o=1&p=16&l=st1&mode=pc-hardware&search=laptop%20bags&fc1=000000&lt1=_blank&lc1=3366FF&bg1=FFFFFF&f=ifr" marginwidth="0" marginheight="0" width="468" height="336" border="0" frameborder="0" style="border:none;" scrolling="no"></iframe>
</td></tr>
--->
<tr><td colspan=4 align="right">	&nbsp;<CFIF #Evaluate(start + display - 1)# LT #GetList.Recordcount#><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# --->
<a href='laptopcases.cfm?#sj#&category=#category#&start=#evaluate(start + display)#&sortorder=#url.sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&style=#style#&groupname=#groupname#' ><img src="images/nextlist.gif"  name="next" border="0" align="absmiddle" vspace="0" hspace="0" width="80" height="31"></a>
	<cfelse>	&nbsp;			</CFIF></td></tr>
				   </cfif>   
                 </table >
		</td></cfoutput><td valign="top" align="right" style="width:94px;">	
 <table cellpadding="3" cellspacing="0" style="horizontal-align:right;text-align:right;font-size:12px;display:block;padding:0px;margin-top:1px;">
<tr><td align="right" width="94px">
<table cellpadding="0" bgcolor=white   align="right" cellspacing="0" style="horizontal-align:right;text-align:right;text-transform:capitalize;border:1px <cfoutput>#light# ridge;border-left:solid 1px #light#</cfoutput>; ">
  <tr><td style="background-color:<cfoutput>#dark#</cfoutput>;color:white;font-weight:bold;text-align:center;font-size:12px;"> 
<br>
</td></tr>
</table></td></tr>
		  <tr><td>
		  

		  </td></tr>


<cfoutput></span>
 </table></td></tr></table>     

 	   <table width="800"    align="center" BORDER=0>
         
<tr bgcolor="white"  >
      <td align="center" valign="middle"   >&nbsp;  <a href="http://www.myexhibition.com" class="error1" target="artwindow">Host Art!</a> </td>
    <td align="center" valign="middle"  > 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>    
    </table>

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
</div>

           <cfif (subcat is not "" or color is not "") and not len(session.mail)>
             <CFINCLUDE template="stoneinfo.inc">
	</cfif>

 </BODY>
</HTML>
