<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD >
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
 <CFPARAM NAME="displaycolumns" DEFAULT="2"> 

 <cfparam name="invstatus" default="0">
 <cfif session.mail eq 'nitishpandey@indiatimes.com'>
 <cfset url.edit =  'mamamia'>
 
 <cfset invstatus= -5>
 </cfif>

 <cfparam default="662222" name="l">

 <cfparam name="displayrows" default="6">
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
<CFINCLUDE TEMPLATE="setup.cfm">
<CFPARAM NAME="sortorder" DEFAULT="newitem desc" >
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
<CFPARAM NAME="newtstart" DEFAULT= "1">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="url.subcat" DEFAULT= "silver">
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
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/"> <CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cftry>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter=CGI.QUERY_STRING >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(urldecode(advancedsearch))#" >
</Cfif>
<cfcatch type="any"> </cfcatch></cftry>
<cfset  session.gallery = 'list'> <!--- used to determine on cart page whether the buyer should be routed to list.cfm or listcluster.cfm when he clicks on continue shopping --->
<CFIF advancedsearch is not "">
<cfset category ="">
<cfset subcat = "">
<cfset advancedsearch=replacenocase(advancedsearch," & "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"'","")>
<cfset advancedsearch=replacenocase(advancedsearch,"jewelry"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"items"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"item"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"gold stone","goldstone")>
<cfset advancedsearch=replacenocase(advancedsearch,"mixed stone","mixedstone")>
<cfset advancedsearch=replacenocase(advancedsearch,"shap"," styl")>
<cfif find("$",advancedsearch) or find("dollar",advancedsearch)>
<cfset remark = '(You can select price range at bottom)'>
<cfelse>
<cfset remark =''> 
</cfif>
<cfset advancedsearch=replacenocase(advancedsearch,"jewellery"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," or "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,","," ")>
<cfset advancedsearch=replacenocase(advancedsearch," on "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"colored"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"color"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," with "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," semiprecious "," ")>
<Cfif listlen(advancedsearch," ") gt 0>
  <cfset advancedsearch=replacenocase(advancedsearch," and ", " ")>
  <CFSET advancedsearch1 = left(listGetat(advancedsearch,1," "),3)>
</cfif>
<Cfif listlen(advancedsearch," ") gt 1>
  <CFSET advancedsearch2 = left(listGetat(advancedsearch,2," "),3)>
</cfif>
<Cfif listlen(advancedsearch," ") gt 2>
  <CFSET advancedsearch3 = left(listGetat(advancedsearch,3," "),3)>
</cfif>
<CFSET colors ='red,blue,gray,orange,green,maroon,black,pink,white,maroon,purple'>
<CFIF listcontainsnocase(colors, advancedsearch1)>
  <CFSET color= advancedsearch1>
</CFIF>
  <CFSET display=21>
  <CFSET displaycolumns = 2>
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>
<!--- speed up things  ---><CFIF start EQ 1 and advancedsearch neq "">
  <cftry>
    <CFQUERY DATASOURCE="gemssql" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery><cfcatch type="database">
	  <cfquery DATASOURCE="gemssql"  name="">
  Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'</cfquery>
</cfcatch></cftry>
  </CFIF>
</CFIF> 
<cfif not isdefined("form.submit5")>
<cftry>
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select orderbuy, disporder, newitem, CAT, subcat, datetaken, 
  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory,
   buylink ,  orderprice from (SELECT 0 as orderbuy, disporder, newitem, CAT, subcat, datetaken, 
  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory,
   buylink , case status when 3 then saleprice else price end as orderprice from items where  (inventory>#invstatus#)
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
    and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
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
    order by #urldecode(sortorder)# 
     </cfif>

</cfquery>



<cfcatch type="database">
<cfmail to="nitish@semiprecious.com" server="mail23.webcontrolcenter.com" subject="error in list query1" from="service@semiprecious.com"
 type="html" >
 #cgi.HTTP_REFERER# : #cgi.REMOTE_HOST# #cgi.REMOTE_HOST#  
 #subcat#,#category#,#sortorder#,#session.mail#,#advancedsearch#,#salestatus#,#color#,#advancedsearch1#,#advancedsearch2#
 #cgi.QUERY_STRING# #cgi.HTTP_REFERER# #cfcatch.Detail# #cfcatch.Message# #cfcatch.Type#
 <CFSET SORTORDER = 'datetaken desc' />
 <cfset url.sortorder  = sortorder >
                </cfmail>
</cfcatch></cftry>
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
<cfinclude template="header.cfm">

NO ITEM FOUND! PLEASE TRY AGAIN.
<cfinclude template="footer.htm">
<cfabort />
</cfif>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >
<CFOUTPUT >
<TITLE>#color# #subcat#   <cfif category is "ALL" or category is "">    <cfset p = "jewelry">    <cfelse><cfset p = category>   </cfif>  #p# <cfif isdefined("reversefilename")> Beaded, Gemstone Sterling Silver Jewellery<cfelse>Semi-precious Gemstone Sterling Silver Jewelry</cfif></TITLE>
<meta name="keywords" content="valentine gift under $10 #color# gemstone, #subcat# #category# jewelry,semiprecious, semi-precious, jewellery">
<meta name="author" content="anup pandey" /><meta name="description" content='Retail and wholesale #subcat# #category#,<CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>'>
</cfoutput>
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY  topmargin="0">
<div align="center">
<CFINCLUDE TEMPLATE="headerforlist.cfm"> 
	  <cfif isdefined("url.silverjewelry")>
				  <cfif subcat eq 'silver'>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.* from Getlist where  Getlist.subcat like '%#left(url.silverjewelry,4)#%'
			  </cfquery>
			  <cfelseif url.silverjewelry eq 1>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.* from Getlist where  Getlist.subcat like '%silver%'
			  </cfquery>
				  			  <cfelse>
			  <cfquery dbtype="query" name="Getlist2">
			  select Getlist.*  from Getlist where  subcat not like '%silver%'
			  </cfquery>
			  		  </cfif>
			  <cfset Getlist = Getlist2>
			  <cfset getlist2 = 0>
			  </cfif>
<cfoutput>
    <cfif subcat eq 'silver' or isdefined("url.silverjewelry") or listfindnocase(evaluate('application.silver.#category#tones'),subcat)>
      <cfif len(cgi.QUERY_STRING)>
        <cfset tmp = Rereplace(cgi.QUERY_STRING,'silverjewelry=?','')>
        <cfset cleanedqstring = Rereplace(tmp,'start=?','start=1&')>
        <cfelse>
        <cfset cleanedqstring="subcat=#subcat#&category=#category#&sortorder=#sortorder#">
      </cfif>
     
         <a name="picsonly"  dir="ltr"></a> 
        <cfif subcat neq 'silver' and listfindnocase(evaluate('application.silver.#category#tones'),subcat)>
          <span style="display:inline;padding-left:0px;width:799px;">
		  <span class="silverfilterlabel">Silver Filter &gt;</span><span style="background-color:##EEEEEE;line-height:12px;"><cfif isdefined("url.silverjewelry")> 
			<cfif url.silverjewelry> 
            <span style="color:maroon;font-size:12;background-color:##EEEEEE;" id="1">Showing Sterling Silver #subcat# #p#</span><font color="##666600">&nbsp;|&nbsp;</font> <a href="list.cfm?#cleanedqSTRING#&silverjewelry=0"> 
            <font color="black">Check for non-Silver #subcat# #p#</font></a> 
            <cfelse>
            <a href="list.cfm?#cleanedqSTRING#&silverjewelry=1"><font color="black">See 
            #subcat# #p# in Sterling Silver</font></a> <font color="##666600">&nbsp;|&nbsp;</font><span style="color:maroon;font-size:12;background-color:##DADA99;" id="0">Showing 
            NON-Silver #subcat# #p#</span></cfif>
			<cfelse>
			<a href="list.cfm?#cleanedqSTRING#&silverjewelry=1"><font color="black">See  #subcat# #p# in Sterling Silver</font></a>
			<font color="##666600">&nbsp;|&nbsp;</font> 
            <a href="list.cfm?#cleanedqSTRING#&silverjewelry=0"><font color="black">Check for #subcat# #p# NOT in Sterling Silver</font></a>
			</cfif> 
          <cfelseif subcat eq 'silver' >
          <span class="silverfilterlabel">Silver Filter &gt;</span><span style="background-color:##EEEEEE;line-height:12px;">
		  <form action="list.cfm?#cleanedqstring#" method="get" style="display:inline;margin:0px;">
          <input type="hidden" name="subcat" value="silver">
          <select name="silverjewelry" style="text-transform:capitalize;" onChange="this.form.submit();" class="inputtext">
          <option value="">Sterling Silver #p# in ...</option>
		  <cfset lis = evaluate('application.silver.#category#tones') >
          <cfloop list='#lis#' index="st">
          <option value="#st#">#st#</option>
          </cfloop>
          </select><input type="hidden" name="category" value="#category#"></form>&nbsp;|&nbsp;<span style="font-size:12px;font-weight:normal;">Check For:</span> <form action="list.cfm" method="get" style="display:inline;" >     
	       <select name="subcat" style="text-transform:capitalize;" onChange="this.form.submit();" class="inputtext">
	 <option value="">Non-Silver #p# in ...</option>
	 <cfloop list='#application.allstones#' index="st">
              <option value="#st#">#st#</option>
     </cfloop>
	  </select><input type="hidden" name="silverjewelry" value="0" />
	  <input type="hidden" name="category" value="#category#" /></form></cfif> | <a href="google.cfm?ie=utf-8&q=#subcat#&filter=3%y6asd^as&en=" type="text/html" rel="alternate">Google Us!</a>&nbsp;</span></span>
	   <cfelse>
<cfif  isdefined("session.bulkbuyer.id")><span class="whiteonred"><span style="font-size:11px;">Wholesale/Reseller Shopping Mode</span></span>
<cfelseif session.mail is "">
<cfelse><span class="category">#session.mail# Logged In</span></cfif>
    </cfif>
<cfset display = displaycolumns*displayrows>
  <CFIF GetList.cat is not "">
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'><br>
 <cfset tw =  606>
 <table style="margin-left:0px;display:block;width:800px;background-color:##EDEDED;text-align:center;position:relative;top:2px;horizontal-align:center;"  border="0" cellspacing="0"  cellpadding="0">
    <tr   ><td valign="top" align="center" nowrap   width="800px" class="grayplacard"><cfif  start GT 1><cfset newstart = start - display>
			 <cfif newstart LT 1>
			 <cfset newstart = 1>
			 </cfif>
			 <cfif isdefined("url.silverjewelry")>
			 <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a><cfelse><a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(urldecode(advancedsearch))#' ><img src="images/prev.gif" name="prev" hspace="0" vspace="0" height="18"  border="0" align="absmiddle"></a></cfif></cfif> &nbsp;<font face=verdana style="text-transform:capitalize">
 <cfif len(advancedsearch) >Displaying verity search results   in order of matching words/criteria #remark#.<cfelse><!--- Selection:  ---><Cfif isnumeric(priceless)>&nbsp;(Around #format(priceless)#)&nbsp;|</Cfif><cfif len(subcat) ><cfset subcat3 = replace(trim(replace(trim(subcat),"_",""))," ","")>
<cfif listfindnocase(Application.necklacestones,subcat)><a href="#subcat3#_necklaces.cfm" id="necklaces_horiz" title="more necklaces in this stone">#subcat# necklaces</a>&nbsp;</cfif>
<cfif listfindnocase(Application.Braceletstones,subcat)><a href="#subcat3#_bracelets.cfm" id="bracelets_horiz" title="click for bracelets in this collection">#subcat# bracelets</a>&nbsp;</cfif>
<cfif listfindnocase(Application.ringstones,subcat)><a href="#subcat3#_rings.cfm" id="rings_horiz" title="see rings in this semiprecious stone">#subcat# rings</a>&nbsp;</cfif>
<cfif listfindnocase(Application.earringstones,subcat)><a href="#subcat3#_earrings.cfm" id="earrings_horiz" title="see earrings in this semiprecious stone">#subcat# earrings</a>&nbsp;</cfif>
<cfif listfindnocase(Application.pendantstones,subcat)><a href="#subcat3#_pendants.cfm" id="pendants_horiz" title="pendants of this stone">#subcat# pendants</a>&nbsp;</cfif>
<cfelseif  color neq ""><a href="list.cfm?color=#color#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="list.cfm?color=#color#&category=rings" id="rings_horiz">Rings</a>&nbsp;<a href="list.cfm?color=#color#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="list.cfm?color=#color#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="list.cfm?color=#color#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;
<cfelseif  salestatus is 3 ><span style="color:red ;font-size:12px;font-family: Arial;">On Sale:</span> <a href="list.cfm?salestatus=#salestatus#&category=pendants" id="pendants_horiz">Pendants</a>&nbsp;<a href="list.cfm?salestatus=#salestatus#&category=rings" id="rings_horiz">rings</a>&nbsp;<a href="list.cfm?salestatus=#salestatus#&category=Earrings" id="earrings_horiz">Earrings</a>&nbsp;<a href="list.cfm?salestatus=#salestatus#&category=Bracelets" id="bracelets_horiz">Bracelets</a>&nbsp;<a href="list.cfm?salestatus=#salestatus#&category=Necklaces" id="necklaces_horiz">Necklaces</a>&nbsp;</cfif><cfif category EQ "All" ><span style="color:##990000;background-color:##DADA99;font-size=12 px;">All</span>&nbsp;</cfif></cfif>&nbsp;<cfif sortorder is "price"><a href='list.cfm?category=#category#&sortorder=datetaken&subcat=#subcat#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black">See New First</font></a><cfelse><a href='list.cfm?category=#category#&sortorder=price&subcat=#subcat#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black">See By Price</font></a></cfif>&nbsp;<CFIF #Evaluate(start + display - 1)# LT #GetList.Recordcount#><!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# ---><a href="##" onMouseDown="ShowHide('jumpstart'); return false;">Pages</a>&nbsp;<cfif isdefined("url.silverjewelry")><a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' >
<img src="images/next.gif" height="18" name="next"  border="0" align="absmiddle" vspace="0" hspace="0"></a>
<cfelse><a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/next.gif" height="18" name="next"  border="0" align="absmiddle" vspace="0" hspace="0"></a>
</cfif>
 </CFIF>
</font>
				   </td>
				   </tr></table>	
	
 	 <!---  <cfif advancedsearch neq "">
	     <cfsearch  collection="jewelrydescription" type="explicit" criteria="#advancedsearch#,#advancedsearch1#,#advancedsearch2#"
startrow=1 name="vertiylist"
 maxrows="40"
>	  
			  <cfset inventory = 1>
			
<cfset getlist = querynew('')>
<cfset queryaddcolumn(getlist,"cat",vertiylist["custom1"])>
<cfset queryaddcolumn(getlist,"status",vertiylist["url"])>
<cfset queryaddcolumn(getlist,"description",vertiylist["summary"])>
<cfset queryaddcolumn(getlist,"price",vertiylist["custom2"])>
 
<cfset queryaddcolumn(getlist,"saleprice",vertiylist["title"])>
<cfset queryaddcolumn(getlist,"newitem",vertiylist["key"])> 
 <CFSET display=21>
  <CFSET displaycolumns = 3>
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>
</cfif>  ---> <CFIF getList.recordcount is 0>
  <div style="position:relative;margin-left:94px;margin-top:30px;border:1px black inset;width:606px;text-align:justify;"> 
    <!-- <font size="2" face="Times New Roman, Times, serif"><a href="detail.cfm">By Item number</a>  </font> --><cfoutput> 
    No matches found for your criteria specified. Could be that the particular 
    designs are out of stock. Please try with some other words in your search. 
    <br>
    To see and order any out of stock items please click here <a href="list.cfm?invstatus=-3&#cgi.QUERY_STRING#">SEE 
    OUT OF STOCK DESIGNS</a>. Shipping of out of stock items will be confirmed     to you via email and can take upto 3 weeks. Often designs and range is discontinued 
    due to rising prices or declining interest. 
    <form action="list.cfm" method="post"  style="display:inline;" >
      <input type='text' maxlength="24" size="12" value="" name='advancedsearch'>
      &nbsp; 
      <input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)"></cfoutput> 
    </FORM>
    <br>
    Showing some other items on Sale: </div> 
  <cfset salestatus = 3>
      <CFQUERY DATASOURCE="gemssql" NAME="GetList">
      select disporder, newitem, CAT, subcat, NameID,        price
      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
      where (1=1 
      <cfif advancedsearch is "">
        and (CAT = '#category#' 
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
      order by #sortorder# 
      </CFQUERY>
    </cfif>
		 <CFSET columns=1> 
		 <CFSET rows=1> 
	 <CFSET enddisplay= start + display-1>
       <CFSET currentrow= start>

	 <cfif start is 1 >
	 <cfinclude template="jumpstartblinder.cfm" />
               	<table cellspacing="0" style="margin-left:94px;display:block;width:#tw#;">
         <cfset session.filterarray = arraynew(2)>  
           <cfif subcat is not "">
             <CFINCLUDE template="stoneinfo.inc">
            </cfif>
<cfif category is 'ornaments'>
	<Tr valign="middle"><td valign="middle" style="color:##666600;border-left:1px ##666600 groove;border-right:1px ##666600 groove"> 
         <b><font color=green>Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b>
	</td></tr>
		 </cfif> 
<!---    <cfif category is 'earrings'>
	<Tr valign="middle"><td valign="middle" style="color:##666600;border-left:1px ##666600 groove;border-right:1px ##666600 groove"> 
          <b><font color=brown size=-1>Nickel Free plated, Hypo Allergenic option  available for dangling earrings by emailing anup@semiprecious.com or calling 
      us 512 589 9009. </font></b><br>
	</td></tr>
</cfif> --->
    <!--- <cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif> --->
    <cfif subcat is 'pearl'>
	<Tr valign="middle"><td valign="middle" style="color:##666600;"> 
      <b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
	</td></tr>
</cfif> 
	</table>
	  <CFLOOP QUERY="Getlist"	>
              			  <cfset session.filterarray[currentrow][1] = newitem>
					   <cfset session.filterarray[currentrow][2] = cat>
					 </cfloop>
		
</cfif>
<cfset rowsdisplayed = 0>
   <table  cellspacing="0" cellpadding="1" style="margin-left:94px;display:inline;width:606px; border-right:1px groove ##666600;border-bottom:1px ridge ##CCCCCC;border-top:1px ridge ##CCCCCC;background-color:##FFFFFF;">
          			  <CFLOOP QUERY="Getlist"		startrow="#start#"	endrow="#enddisplay#">
						   <CFIF COLUMNS eq 1>
			  <tr>
			  </CFIF>
		              <CFSET invent=inventory>
                     
        <td class="row1"  rowspan="1"> 
          <!---			<CFIF getList.status is 3> --->

          <cfif inventory GT 0 >
            <cfset status_array[columns] = 1>
            <cfif isdefined("session.bulkbuyer.id")>
              <cfset  l = 'AA2222'>
              <!---           <cfif wholesaleprice eq "" or wholesaleprice eq "null" or wholesaleprice eq 0>
                          <cfset price_array[columns] = format(0.50*price)>
                          <cfelse> --->
              <cfset price_array[columns] = dollarformat(wholesaleprice)>
              <!---         </cfif> --->
              <cfelse>
              <cfset price_array[columns] = format(price)>
              <!--- 1 is normal, -1 is sale, 0 is sold out --->
              <!--- this is defined in bulkbuyerlogin.cfm --->
              <cfif status is 3  >
                <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                  <CFSET Saleprice = 0.80*price>
                </cfif>
                <cfset status_array[columns] = format(saleprice)>
                <!---   <img src="images/sale.gif"> <span class="whiteonred"><B>#format(saleprice)#</B></span> 
                &nbsp;Regular --->
              </cfif>
            </cfif>
            <!--- wholesale --->
            <cfelse>
            <!---    <font color=red size=2>Sold Out!</font> <br /> --->
            <cfset status_array[columns] = 0>
            <cfset price_array[columns] = soldformat(saleprice)>
          </cfif>
          <cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
          <a href='detail.cfm/#item_array[columns]#.htm' > 
          <!---                  	<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
	<CFELSE>
			<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
          <img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #category#"></a> 
          <!---  <cfset price_array[columns] = #format(price)#> --->
          <CFIF Edit Is "MAMAMIA">
<a href="np/match/cluster.cfm?list=1&target=#newitem#&category=#cat#">Add2cluster</a>
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
        	<td class="row2"><div  align="center"><cfset column = columns />
			<cfswitch expression="#status_array[column]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='detail.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
				  <br /><br> </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
				  <br />
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[column]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
<br /><a href='detail.cfm/#item_array[column]#.htm' ><font color="##CC3300">Buy</font></a></cfdefaultcase>
				  </cfswitch></div>#description#</td>	
		  <cfif columns EQ displaycolumns>              <!---
		<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
		<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
		--->   <cfset rowsdisplayed = rowsdisplayed + 1></tr><!---
<tr>
		 <cfloop from="1" to="#columns#" index="column">

		  <td class="pricerow">
		  <cfswitch expression="#status_array[column]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='detail.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[column]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[column]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='detail.cfm/#item_array[1]#.htm' ><b>#status_array[column]#</b></a> 
      		   </cfdefaultcase>
				  </cfswitch>
				</td>
				</cfloop>
				</tr>
      <!--
		     <tr>
			    <td colspan="#evaluate(2*displaycolumns)#" height="1" style="border-top:2px dotted ##666600;">&nbsp;</td>
			   </tr> --->
               <CFSET columns=1>
              <!---</table>
		<Table cellpadding=2 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
              <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
				  </CFLOOP>
    <cfif columns neq 1 > <!---- means the last box in the row was not filled before comng out of query loop--->
	<cfloop from="#columns#" to="#displaycolumns#" index="idx">
	<td rowspan="2" class="row2">&nbsp;</td><td rowspan="2" class="row2">&nbsp;</td></tr> </cfloop>
	<!---
	<tr>	<cfloop from="1" to="#evaluate(columns -1)#" index="column">

		  <td class="pricerow">
		  <cfswitch expression="#status_array[column]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='detail.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='detail.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
				  </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='detail.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<font color="##FF4444">Sold Out</font>
                    </cfcase>
               <cfdefaultcase >
			   <a href='detail.cfm/#item_array[column]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[column]#</s></font>&nbsp;&nbsp;&nbsp;<font color="##000099"><a href='detail.cfm/#item_array[1]#.htm' ><b>#status_array[column]#</b></a> 
      		   </cfdefaultcase>
				  </cfswitch>
				</td>
			</cfloop></tr> ---> <cfset rowsdisplayed = rowsdisplayed + 1>
	</cfif>
	
	 <!--- <b><font color="##000080">#format(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br> --->
                   <cfif rowsdisplayed LT 3 and rowsdisplayed gt 0>
				   <tr><td colspan="4" align="center" bgcolor="##FFCC66">SOME OF OUR TOP SELLING DESIGNS SHOWN BELOW</td></tr>
<TR>
 	            
                  <TD class="row1" colspan="2">
 
                  
                      <FONT size="1" verdana="">
 
                  
                    
                    
                    
                    
                        <A href="detail.cfm/1249.htm">
 
                  
                          <IMG border="0" alt="image of garnet,silver " name="img1249"
             bordercolor="black" src="images/pendants/thumb/1249.jpg" width="120" height="120"/>
      </A>
 
                  
                  
                  
                  
                  
                      </FONT>
   </TD>

				  
              
			  
			
			  
			
			   
	            
                  <TD class="row1" colspan="2">
 
                  
                      <FONT size="1" verdana="">
 
                  
                    
                    
                    
                    
                        <A href="detail.cfm/1248.htm">
 
                  
                          <IMG border="0" alt="image of turquoise,silver " name="img1248"
             bordercolor="black" src="images/pendants/thumb/1248.jpg" width="120" height="120"/>
      </A>
 
                  
                  
                  
                  
                  
                      </FONT>
   </TD>

				   
                  
              </TR><TR>
 
              
                  <TD nowrap="" class="row3" colspan="2">
    <A href="detail.cfm/1249.htm">

                        <B>
Zoom      </B>
    </A>
&nbsp;&nbsp;&nbsp;
				       <FONT color="##000099">
$14.00    </FONT>
&nbsp; &nbsp;&nbsp;    <A href="detail.cfm/1249.htm">
 
                        <B>
Buy      </B>
    </A>

				    </TD>

              
                  <TD nowrap="" class="row3" colspan="2">
    <A href="detail.cfm/1248.htm">

                        <B>
Zoom      </B>
    </A>
&nbsp;&nbsp;&nbsp;
				       <FONT color="##000099">
$12.00    </FONT>
&nbsp; &nbsp;&nbsp;    <A href="detail.cfm/1248.htm">
 
                        <B>
Buy      </B>
    </A>

				    </TD>

              
            </TR>

<cfif rowsdisplayed LT 2>
<TR>

			  
	            
                  <TD class="row1" colspan="2">
 
                  
                      <FONT size="1" verdana="">
 
                  
                    
                    
                    
                    
                        <A href="detail.cfm/1247.htm">
 
                  
                          <IMG border="0" alt="image of garnet,silver " name="img1247"
             bordercolor="black" src="images/necklaces/thumb/1247.jpg" width="120" height="80"/>
      </A>
 
                  
                  
                  
                  
                  
                      </FONT>
   </TD>
                  <TD class="row1" colspan="2">
 
                  
                      <FONT size="1" verdana="">
                  <BR/>
              <A href="detail.cfm/1246.htm">
 
                  
                          <IMG border="0" alt="image of silver,citrine " name="img1246"
             bordercolor="black" src="images/earrings/thumb/1246.jpg" width="120" height="120"/>
      </A>
        
                  
                      </FONT>
   </TD>
                
              </TR>
<TR>
  
                  <TD nowrap="" class="row3" colspan="2">
    <A href="detail.cfm/1247.htm">

                        <B>
Zoom      </B>
    </A>
&nbsp;&nbsp;&nbsp;
				       <FONT color="##000099">
$85.00    </FONT>
&nbsp; &nbsp;&nbsp;    <A href="detail.cfm/1247.htm">
 
                        <B>
Buy      </B>
    </A>

				    </TD>

              
                  <TD nowrap="" class="row3" colspan="2">
    <A href="detail.cfm/1246.htm">

                        <B>
Zoom      </B>
    </A>
&nbsp;&nbsp;&nbsp;
				      <FONT color="##000099">
      <S>
$15.00      </S>
    </FONT>
&nbsp; &nbsp;&nbsp;     <A href="detail.cfm/1246.htm">
 
                        <B>
        <FONT color="maroon">
sale!        </FONT>
      </B>
    </A>
 
                  
				    </TD>

              
            </TR>
</cfif>
				   </cfif>   
                 </table ><table><tr><td>
  <div style="text-align:left;text-transform:capitalize;border:2px ##DADA99 ridge; margin-top:2px;background-color:white;"><span style="width:100%;background-color:##666600;color:white;font-weight:bold;text-align:center;"> 
<strong>Designs & Sets</strong><br></span><a href="showearrings.cfm">earrings</a> <br>
        <a href="shownecklaces.cfm">necklaces</a><br>
 <a href="showbracelets.cfm">bracelets</a> <br>
 <a href="showpendants.cfm">pendants</a><br>
  <a href="showsets.cfm">Matching Sets</a>

</div>
		  <br>
     <div style="border:2px ##DADA99 ridge; margin-top:3px;background-color:white;"><span style="width:100%;background-color:##666600;color:white;font-weight:bold;text-align:center;"><img src="images/colorsbutton.gif" width="16" height="16" hspace="0" vspace="0" border="0" align="absmiddle" style="display:inline;"> 
<strong>By Color</strong><br></span>
        <a href="orange_jewelry.cfm"><font color="##FF6600">Orange Jewelry</font></a><br>
        <a href="brown_jewelry.cfm"><font color="##663300">Brown Jewelry</font></a><br>
        <a href="yellow_jewelry.cfm"><font color="##FFCC00">Yellow Jewelry</font></a><br>        <a href="red_jewelry.cfm"><font color="##CC3333">Red Jewelry</font></a><br>
        <a href="green_jewelry.cfm"><font color="##009933">Green Jewelry</font></a><br>
        <a href="blue_jewelry.cfm"><font color="##330099">Blue Jewelry</font></a><br>
        <a href="gray_jewelry.cfm"><font color="##808080">Gray Jewelry</font></a><br>
        <a href="purple_jewelry.cfm"><font color="##990099">Purple Jewelry</font></a><br>
        <a href="pink_jewelry.cfm"><font color="##FF66CC">Pink Jewelry</font></a><br>
       <a href="white_jewelry.cfm">White Jewelry</a><br><a href="black_jewelry.cfm">Black Jewelry</a></div> 
<br>
		<a href="detail.cfm"  ><span style="color:black;border:1px ridge ##660066;padding:2px;font-size:11px;"> By Item No. </span></a><br>

<br><a  href="##byprice" ><span style="color:black;border:1px ridge ##660066;padding:2px;font-size:11px;"> By Price </span></a><br>
<hr />

</td></tr></table>
		 	   <table width="608"   style="margin-left:94px;" BORDER=0>
            <tr> 
              <td align=left border=0> 
			  <CFIF start is not "1">
			  <cfif isdefined("url.silverjewelry")>
                  <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/prevlist.gif" name="prev"  border="0" width="80" height="31"></a>
				  <cfelse>
                  <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlist.gif" name="prev"  border="0" width="80" height="31"></a>
				  </cfif>
                 <cfelse>  <a href="topselling.cfm" class="headerfont">The Best Selling!</a>  </CFIF>
          </td>
          <td nowrap align="center"><a name="byprice">&nbsp;</a><span class="category">#p#</span>:  
            <cfinclude template="searchforms.cfm"/></td>
                <td align="center" > 
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>          <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> 
<cfif isdefined("url.silverjewelry")>
				   <a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#&silverjewelry=#url.silverjewelry#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absmiddle" width="80" height="31"></a> 
				   <cfelse><a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#subcat#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif"  name="next"  border="0" align="absmiddle" width="80" height="31"></a> 
				   </cfif>
     				<cfelse>
                <a href="howtonavigate.cfm" class="headerfont">How to Find?</a>
</CFIF>   </td> </tr>
            <tr><td colspan="3" align="center"> <cfinclude template="googleadsforlist.htm">
  <!---  <script type="text/javascript"><!--
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
   --->            </td> </tr>
   </table>
 	   <table width="707"   style="margin-left:92px;"BORDER=0>
		 <tr bgcolor="white"  >
      <td align="center" valign="middle"   >&nbsp;  <a href="http://www.myexhibition.com" class="error1" target="artwindow">Love Art?</a> </td>
    <td align="center" valign="middle"  class="row3n"> 
        <cfinclude template="adminfooter.cfm">
			 </td>
          </tr>
    </table>
	 <cfif category neq "ornaments">
	<table style="position:absolute;top:121px;left:0px;display:inline;background-color:##FFFFFF;border:1px ridge ##666600;" cellspacing="0"  cellpadding="0">
	<tr align="center"  style="background-color:##DADA99;color:black;" ><td  style="border-bottom:1px black solid;">
<span style="color:black;font-weight:bold;text-transform:capitalize;font-size:12px;">#p# in<br /></span>
<CFINCLUDE TEMPLATE="subcatvertical.cfm">
	 <!--- removed bottom fading img from here ---> 
	 </td></tr></table><cfelse>&nbsp;</cfif>
 <CFINCLUDE TEMPLATE="jumpstart.cfm">
 	<script language="JavaScript1.1">
ShowHide('jumpstart');
	<cfif start eq 1>
ShowHide('jumpstartblinder');
</cfif>			

<cfif subcat neq "" and subcat neq "beaded">
	document.getElementById("#subcat#").style.color = "maroon";
//document.getElementById("#subcat#").style.fontWeight = "bold";
 document.getElementById("#subcat#").style.textDecoration = "none" ;
  document.getElementById("#subcat#").style.backgroundColor = "##DADA99";
  document.getElementById("#subcat#").parentNode.style.backgroundColor = "##DADA99";
  
		<cfif len(category) GT 4 >
 	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
		document.getElementById("#lcase(category)#_horiz").style.backgroundColor = "##DADA99";
  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;
  <cfif  listfind('bracelets,necklaces,earrings,pendants',category)>
  <!--- because this element is not created for healing & rings yet. This element is created inthe pop up list of the categories --->
  document.getElementById("#lcase(category)#_#subcat#").style.color = "##000066";
document.getElementById("#lcase(category)#_#subcat#").style.backgroundColor = "##DADA99";
 document.getElementById("#lcase(category)#_#subcat#").style.textDecoration = "none" ;
 </cfif>
	</cfif>
   </cfif>
	<cfif len(category) GT 4 >
	document.getElementById("#lcase(category)#").style.color = "maroon";
  document.getElementById("#lcase(category)#").style.textDecoration = "none" ;
 //	document.getElementById("#lcase(category)#_horiz").style.color = "maroon";
//		document.getElementById("#lcase(category)#_horiz").style.backgroundColor = "##DADA99";
//  document.getElementById("#lcase(category)#_horiz").style.textDecoration = "none" ;

//  document.getElementById("#lcase(category)#").style.backgroundColor = "##DADA99" ;
  
</cfif>
<cfif isdefined("url.silverjewelry")>
 	document.getElementById("#lcase(url.silverjewelry)#").style.color = "maroon";
	document.getElementById("#lcase(url.silverjewelry)#").style.backgroundColor = "##DADA99";
/*	document.getElementById("#lcase(url.silverjewelry)#").parentNode.style.backgroundColor = "##DADA99"; */
    document.getElementById("#lcase(url.silverjewelry)#").style.textDecoration = "none" ;
	<cfif url.silverjewelry is 1>
	document.getElementById("silver").parentNode.style.backgroundColor= "##DADA99";
	<cfelseif url.silverjewelry is 0 >
		document.getElementById("silver").parentNode.style.backgroundColor = "##E4E4E4";
		</cfif>
</cfif>
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/
	</script>
	<!--- <cfset balance = session.screenwidth - 800>
	<div style="position:absolute;background-image:url(/images/horizontalgrad.gif);top:0px;left:800px;height:900px;width=#balance#px;">&nbsp;</div>
 --->	</cfoutput>
</div>
</BODY>
</HTML>
