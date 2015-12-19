<!--- <cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
 --->
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD >
<script src="/js/basicfunctions.js" language="JavaScript1.1" type="text/javascript"></script>
<cfparam name="screensize" default="big">
<CFPARAM NAME="displaycolumns" DEFAULT="4">
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
<CFIF sortorder is 'price'>
  <CFSET sortorder='orderprice'>
</cfif>
<!--- <CFPARAM NAME="PicWidth" DEFAULT= "120"> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFIF category eq 'ornaments' or category eq 'sets'>
  <CFPARAM NAME="subcat" DEFAULT= "">
  <CFELSE>
  <CFPARAM NAME="subcat" DEFAULT= "">
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
<Cfif len(cgi.QUERY_STRING)>
  <cfset session.filter="#CGI.QUERY_STRING#" >
  <cfelse>
  <cfset session.filter="subcat=#subcat#&category=#category#&advancedsearch=#urlencodedformat(advancedsearch)#" >
</Cfif>
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
    <CFSET advancedsearch1 = left(listGetat(advancedsearch,1," "),4)>
  </cfif>
  <Cfif listlen(advancedsearch," ") gt 1>
    <CFSET advancedsearch2 = left(listGetat(advancedsearch,2," "),4)>
  </cfif>
  <Cfif listlen(advancedsearch," ") gt 2>
    <CFSET advancedsearch3 = left(listGetat(advancedsearch,3," "),4)>
  </cfif>
  <CFSET colors ='red,blue,grey,orange,green,yellow,black,pink,white,maroon,purple'>
  <CFIF listcontainsnocase(colors, advancedsearch1)>
    <CFSET color= advancedsearch1>
  </CFIF>
  <CFSET display=21>
  <CFSET displaycolumns = "3">
  <cfif screensize is "small">
    <cfset displaycolumns = 2>
  </cfif>
  <CFIF start EQ 1 and advancedsearch neq "">
    <CFQUERY DATASOURCE="semiprecious" NAME="searched">
    select * from track_keywords where keywords = '#advancedsearch#' 
    </cfquery>
    <cfif  searched.recordcount>
      <cfquery DATASOURCE="semiprecious"  name="">
      Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#' 
      </cfquery>
      <cfelse>
      <CFQUERY DATASOURCE="semiprecious" NAME="searched">
      insert into track_keywords (keywords, dated) values ('#advancedsearch#', 
      #now()# ) 
      </cfquery>
    </cfif>
  </CFIF>
</CFIF>
<cfif not isdefined("form.submit5")>
  <CFQUERY DATASOURCE="semiprecious" NAME="GetList">
  Select * from (SELECT 0 as orderbuy, disporder, newitem, CAT, subcat, datetaken, 
  NameID, 
  <cfif #session.mail# eq 'pandey@aol.com'>
    (basecost*2.5/48) as price 
    <cfelse>
    price 
  </cfif>
  , saleprice, 
  <!--- iif(status=3, saleprice,price) as orderprice, --->
  status, Description, inventory, buylink from Items where (1=1 
  <cfif advancedsearch is "">
    <CFIF category NEQ "ALL">
      and (CAT = '#category#' 
      <CFIF category is 'necklaces'>
        or CAT = 'sets' 
      </cfif>
      ) 
    </CFIF>
  </cfif>
  <CFIF salestatus is 3>
    and (status = 3) 
    <CFELSE>
    and (status=0 or status=3) 
  </CFIF>
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
  <CFIF advancedsearch1 is not "">
    and (left(subcat,3) ='#advancedsearch1#') 
  </CFIF>
  <CFIF advancedsearch2 is not "">
    and ((left(subcat,3) = '#advancedsearch2#') or (left(cat,3) = '#advancedsearch2#')) 
  </CFIF>
  <CFIF color is not "">
    and (color like '%#color#%') 
  </CFIF>
  <CFIF priceless is not "">
    and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#) 
  </cfif>
  <CFIF advancedsearch is not "">
    UNION SELECT 1 as orderbuy, disporder,newitem, CAT, subcat, datetaken, NameID, 
    <cfif session.mail eq 'pandey@aol.com'>
      (basecost*2.5/48) as price 
      <cfelse>
      price 
    </cfif>
    , saleprice, status, Description, inventory, buylink from Items where (1=1 
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
        <CFIF category is 'necklaces'>
          or CAT = 'sets' 
        </cfif>
        ) 
      </CFIF>
    </cfif>
    <CFIF salestatus is 3>
      and (status = 3) 
      <CFELSE>
      and (status=0 or status=3) 
    </CFIF>
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
    <CFIF advancedsearch1 is not "">
      and (left(subcat,3) = '#advancedsearch1#') 
    </CFIF>
    <CFIF 	color is not "">
      and (color like '%#color#%') 
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#) 
    </cfif>
  </CFIF>
  <CFIF advancedsearch is not "">
    UNION SELECT 2 as orderbuy, disporder, newitem, CAT, subcat, datetaken, NameID, 
    <cfif #session.mail# eq 'pandey@aol.com'>
      (basecost*2.5/48) as price 
      <cfelse>
      price 
    </cfif>
    , saleprice, status, Description, inventory, buylink from Items where (1=1 
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
        <CFIF category is 'necklaces'>
          or CAT = 'sets' 
        </cfif>
        ) 
      </CFIF>
    </cfif>
    <CFIF salestatus is 3>
      and (status = 3) 
      <CFELSE>
      and (status=0 or status=3) 
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->
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
    UNION SELECT 3 as orderbuy, disporder, newitem, CAT, subcat, datetaken, NameID, 
    <cfif #session.mail# eq 'pandey@aol.com'>
      (basecost*2.5/48) as price 
      <cfelse>
      price 
    </cfif>
    , saleprice, status, Description, inventory, buylink from Items where (1=1 
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
        <CFIF category is 'necklaces'>
          or CAT = 'sets' 
        </cfif>
        ) 
      </CFIF>
    </cfif>
    <CFIF salestatus	 is 3>
      and (status = 3) 
      <CFELSE>
      and (status=0 or status=3) 
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->
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
    UNION SELECT 4 as orderbuy,disporder, newitem, CAT, subcat, datetaken, NameID, 
    <cfif #session.mail# eq 'pandey@aol.com'>
      (basecost*2.5/48) as price 
      <cfelse>
      price 
    </cfif>
    , saleprice, status, Description, inventory, buylink from Items where (1=1 
    <cfif advancedsearch is "">
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
        <CFIF category is 'necklaces'>
          or CAT = 'sets' 
        </cfif>
        ) 
      </CFIF>
    </cfif>
    <CFIF salestatus is 3>
      and (status = 3) 
      <CFELSE>
      and (status=0 or status=3) 
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->
    ) 
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
  ) 
  <cfif advancedsearch1 is not "">
    order by orderbuy 
    <cfelse>
    order by #sortorder# 
  </cfif>
  </CFQUERY>
</cfif>
<cfif isdefined("form.submit5")>
  <CFQUERY DATASOURCE="semiprecious" NAME="GetList">
  select disporder, newitem, CAT, subcat, NameID, 
  <cfif #session.mail# eq 'pandey@aol.com'>
    (basecost*2.5/48) as price 
    <cfelse>
    price 
  </cfif>
  , saleprice, status, Description, subcat, inventory, buylink from Items 
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
        and (subcat in (#PreserveSingleQuotes(form.subcat)#)) 
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
  order by cat, saleprice 
  </cfquery>
</cfif>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display -1 >
<CFOUTPUT > 
  <TITLE>#subcat# 
  <cfif category is "ALL">
    Jewelry 
    <cfelse>
    #category# 
  </cfif>
  <cfif isdefined("reversefilename")>
    Beaded, Gemstone Sterling Silver Jewellery 
    <cfelse>
    Semi precious Gemstone Sterling Silver Jewelry 
  </cfif>
  </TITLE>
  <meta name="keywords" content="semi precious #subcat# #category# jewellery">
  <meta name="keywords" content="<CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#">#subcat# #category#, </cfloop>">
  <meta name="description" content="Retail and wholesale #subcat# #category#,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#">#description#. </cfloop>">
</cfoutput> 
<link href="styles/rows.css" rel="stylesheet" type="text/css">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
#colormenu {
	display: inline;
	position: static;
	visibility: visible;
	z-index: 2;
	height: 530px;
	width: auto;
}
-->
</style>
</HEAD>

<BODY leftmargin=1 BGCOLOR="white" text='black' link="black" vlink='#006600'black alink=black topmargin='1' >
<CFINCLUDE TEMPLATE="jumpstart.cfm"><CFINCLUDE TEMPLATE="headerforlist.cfm"> 


<cfif session.screenwidth LT 1023 >
  
<cfset screensize = "small">
<cfset displaycolumns = 3>
<cfset displayrows = 2>
</cfif>


<CFIF category Is "bracelets">
  
 <!---  <CFSET #PicWidth# = "150"> --->
  <CFSET displaycolumns = 3>

  <cfif screensize is "small" >
    
<cfset displaycolumns = 2>
<cfset displayrows = 2>
</cfif>
 
</CFIF>
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
  <table border="0" width="#tw#" cellpadding="0" cellspacing="0"  >
    <tr   >
  <td width="90" valign="top" bordercolor="##999933" bgcolor="white"  rowspan="1"  >
  <table width="90" border="0" cellpadding="0" cellspacing="0"  bgcolor="##D3D3AA">
        <tr > 
          <td width="90"  align="center"  background="images/bggreen1.gif" bgcolor="##D3D3AA" class="colormenu" style="border-top:thin groove ##000066;border-right:thin groove ##000066;border-left:thin groove ##000066;" >
<cfif category neq "ornaments">
		  <font face="Geneva, Arial, Helvetica, sans-serif" color="##000000">
		  <span class="category">#Category#<br>
              Available In</span></font><cfelse>&nbsp;</cfif></td>
        </tr>
      </table> <cfset display = displaycolumns*displayrows>    <CFSET enddisplay= start + display-1>
<cfif category neq "ornaments">
    <CFINCLUDE TEMPLATE="subcatvertical.cfm"> </cfif><!--- removed bottom fading img from here ---> </td><td valign="top">
	<table><tr>
<td valign="top" align="center" class="topnavigator">
  &nbsp;&nbsp;&nbsp;  
			 <CFIF start is not "1">
			 <cfset newstart = start - display>
			 <cfif newstart LT 1>
			 <cfset newstart = 1>
			 </cfif>
                  <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlistmini.gif" name="prev" hspace="0" vspace="0" height="14"  border="0"></a>
                &nbsp; &nbsp; &nbsp;</CFIF>
 <cfif advancedsearch is not "">&nbsp;Displaying verity search results 
    in order of matching words/criteria #remark#.
    <cfelse><!--- Selection:  ---><b><font face=verdana style="textTransform capitalize">
<Cfif priceless is not "">
        &nbsp;(Around #dollarformat(priceless)#)&nbsp;|</Cfif>
     </font></b><!--- &nbsp; <font size=2>Sort 
      </font> <a href='list.cfm?category=#category#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=2>Newest 
      First</font></a> --->
	  <cfif len(subcat) GT 1><!--- &nbsp;<font  face=verdana color='maroon'>#subcat#</font>&nbsp;&nbsp; --->
	<cfset subcat3 = replace(trim(subcat),"_","")>
<cfset subcat3 = replace(trim(subcat3)," ","")>

<cfif listfindnocase(Application.necklacestones,subcat)>
<i>
<a href="#subcat3#_necklaces.cfm?subcat=#subcat#&category=necklaces" id="necklaces_horiz"><cfif subcat neq "">#subcat# </cfif>Necklaces</a>&nbsp;</cfif>
<cfif listfindnocase(Application.Braceletstones,subcat)>

<a href="#subcat3#_bracelets.cfm?subcat=#subcat#&category=bracelets" id="bracelets_horiz"><cfif subcat neq "">#subcat# </cfif>Bracelets</a>&nbsp;</cfif>
<cfif listfindnocase(Application.earringstones,subcat)>
<a href="#subcat3#_earrings.cfm?subcat=#subcat#&category=earrings" id="earrings_horiz"><cfif subcat neq "">#subcat# </cfif>Earrings</a>&nbsp;</cfif><cfif listfindnocase(Application.pendantstones,subcat)>
<a href="#subcat3#_pendants.cfm?subcat=#subcat#&category=pendants" id="pendants_horiz"><cfif subcat neq "">#subcat# </cfif>Pendants</a>&nbsp;
</cfif></cfif></i> <cfif subcat eq "" and color neq "">Filter &nbsp;:&nbsp;<div id="colormenu" style="z-index:3;"><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,0,0"
 WIDTH="152" HEIGHT="30" id="colormenu" ALIGN="">
 <PARAM NAME=movie VALUE="colormenu.swf"> <PARAM NAME=menu VALUE=false> <PARAM NAME=quality VALUE=high> <PARAM NAME=scale VALUE=noborder> <PARAM NAME=wmode VALUE=opaque> <PARAM NAME=bgcolor VALUE=##FFFFFF> <EMBED src="colormenu.swf" menu=false quality=high scale=noborder wmode=opaque bgcolor=##FFFFFF  WIDTH="152" HEIGHT="30" NAME="colormenu" ALIGN=""
 TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
</OBJECT>
</div>&nbsp;<a href="list.cfm?color=#color#&category=Earrings">Earrings</a>&nbsp;<a href="list.cfm?color=#color#&category=Bracelets">Bracelets</a>&nbsp;<a href="list.cfm?color=#color#&category=Necklaces">Necklaces</a>&nbsp;</cfif><cfif category EQ "All"> 
<font color="##990000">[Showing All]</font>&nbsp;   </cfif></cfif>|&nbsp;<cfif sortorder is "price"><a href='list.cfm?category=#category#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black"> 
      See New First</font></a><cfelse><a href='list.cfm?category=#category#&sortorder=price&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><font color="black">Sort by Price</font></a></cfif>&nbsp;|&nbsp;&nbsp;      
                  <CFIF enddisplay LT GetList.Recordcount>    <font size="-1">
                      <b> <i>(<!--- #Ceiling(evaluate(GetList.recordcount-enddisplay)/9)# ---><span onMouseDown="javascript:ShowHide('jumpstart');"><u>More Pages</u></span>)</i></b>
                    </font>
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> --->  &nbsp;<a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif" height="14" name="next"  border="0"></a>      			
</CFIF></td></tr><Tr valign="middle"><td valign="middle" style="color:##666600">&nbsp;<cfif session.mail eq 'pandey@aol.com'>
      <font size=5 color='orange'>APPROX. WHOLESALE RATES</font></cfif> <cfif category is 'ornaments'>
      <br>
      <b><font color=green>Christmas Ornaments handmade with paper mache and hand 
      painted intricately in the Indian state of Jammu and Kashmir.</font></b></cfif> 
    <cfif category is 'earrings'>
      <br>
      <b><font color=brown size=-1>Nickel Free plated, Hypo Allergenic option 
      available for dangling earrings by emailing anup@semiprecious.com or calling 
      us 512 589 9009. </font></b></cfif> 
    <!--- <cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif> --->
    <cfif subcat is 'pearl'>
      <br>
      <b><font color=gray size=-1>Our Pearls are good quality Freshwater Cultured 
      Pearls, come with a 100% money back guarantee.</font></b></cfif> 	 <!---  <cfif advancedsearch neq "">
	     <cfsearch  collection="jewelrydescription" type="explicit" criteria="#advancedsearch#,#advancedsearch1#,#advancedsearch2#"
startrow=1 name="vertiylist"
 maxrows="40"
>	  
			  <cfset inventory = 1>
			
<cfset getlist = querynew('')>
<cfset queryaddcolumn(getlist,"cat",vertiylist["custom1"])>
<cfset queryaddcolumn(getlist,"status",vertiylist["url"])>
<cfset queryaddcolumn(getlist,"price",vertiylist["custom2"])>
 
<cfset queryaddcolumn(getlist,"saleprice",vertiylist["title"])>
<cfset queryaddcolumn(getlist,"description",vertiylist["summary"])>
<cfset queryaddcolumn(getlist,"newitem",vertiylist["key"])> 
 <CFSET display=21>
  <CFSET displaycolumns = 3>
<cfif screensize is "small">
<cfset displaycolumns = 2>
</cfif>

</cfif>  ---> <CFIF getList.recordcount is 0>
	  <form action="list.cfm" method="post" class=""><input type='text' maxlength="24" size="12" value="" name='advancedsearch'>&nbsp;<input type="submit" value='Search' class="greenbutton" Onclick="submit(this.form)">
     <!-- <font size="2" face="Times New Roman, Times, serif"><a href="detail.cfm">By Item number</a>  </font> -->
      </FORM>
      <font size='4' color='black'>
      No matches found for your criteria specified. Please try with some other words in your search.</font> 
      <br>
      However some other items on sale: 
      <cfset salestatus = 3>
      <CFQUERY DATASOURCE="semiprecious" NAME="GetList">
      select disporder, newitem, CAT, subcat, NameID, 
      <cfif #session.mail# eq 'pandey@aol.com'>
        (basecost*2.5/48) as price
        <cfelse>
        price
      </cfif>
      , saleprice, status, Description, subcat, inventory, buylink from Items 
      where (1=1 
      <cfif advancedsearch is "">
        and (CAT = '#category#' 
        <CFIF category is 'necklaces'>
          or CAT = 'sets' 
        </cfif>
        )
      </cfif>
      <CFIF salestatus is 3>
        and (status = 3)
        <CFELSE>
        and (status=0 or status=3)
      </CFIF>
      <cfif edit is "" and session.mail is not 'pandey@aol.com'>
        and inventory>-1
      </cfif>
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
    </cfif> <CFSET columns=1> <CFSET rows=1> 
    </td></tr><tr><td><CFIF (GetList.cat is "Sets")>
                  <CFSET category = "Necklaces">
        </cfif><Table cellpadding="2" cellspacing="0" width="#evaluate(tw - 118)#"  >
                         <CFSET enddisplay= start + display-1>
              <CFSET currentrow= start>
 <cfif start is 1 >
 <cfset session.filterarray = arraynew(2)>  
 <cfif subcat is not "">
             <CFINCLUDE template="stoneinfo.inc">
            </cfif>
			  
            <CFLOOP QUERY="Getlist"		>
              
			  <cfset session.filterarray[currentrow][1] = newitem>
			  <cfif cat is "sets">
                
			    <cfset session.filterarray[currentrow][2] = "Necklaces">
			<cfelse>
				   <cfset session.filterarray[currentrow][2] = cat>
			
			 </cfif>
			 </cfloop>
			 </cfif>
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
                    <!--- 1 is normal, -1 is sale, 0 is sold out --->
                    <cfif status is 3 and session.mail neq 'pandey@aol.com'>
                      <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                        <CFSET Saleprice = 0.80*price>
                      </cfif>
                      <cfset status_array[columns] = dollarformat(saleprice)>
                      <!---   <img src="images/sale.gif"> <span class="whiteonred"><B>#dollarformat(saleprice)#</B></span> 
                &nbsp;Regular --->
                    </cfif>
                    <cfelse>
                    <!---    <font color=red size=2>Sold Out!</font> <br /> --->
                    <cfset status_array[columns] = 0>
                  </cfif>
                  <a href='detail.cfm/#newitem#.htm' > 
                  <!---	<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			<CFELSE>
			<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
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
                <td  class="row3" nowrap>
				<cfswitch expression="#status_array[indx]#">
				  <cfcase value="1"><font color="##000099">
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
				  <cfcase value="1"><font color="##000099">
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
              <!--- code of 19 aug 04 --->
      
          </cfif>
		  
          </table >
		   </td>
		   </tr>
		  
        <CFIF (#GetList.cat# is "Sets")>
          
            <CFSET #category# = "Sets">
          </cfif> 
		 
		  <tr><Td>
		  		   <table width="#evaluate(session.screenwidth - 140)#"  align="left" BORDER=0>
            <tr> 
              <td align=left border=0> <CFIF start is not "1">
                  <a href='list.cfm?category=#category#&start=#newstart#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlist.gif" name="prev"  border="0" width="80" height="31"></a>
                 <cfelse>  <a href="topselling.cfm" class="row2">See the Best Selling !</a>  </CFIF>
          </td>
			 
          <td nowrap align="center">  
            <cfinclude template="searchforms.cfm"/></td>
                <td align="left" > 
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
                  
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> <a href='list.cfm?category=#category#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif"  name="next"  border="0" width="80" height="31"></a> 
              
					<cfelse>
                <a href="howtonavigate.cfm" class="row2">Need Help Finding ?</a>
</CFIF>
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
		  
      <td align="center" valign="middle"    > <a href="http://www.myexhibition.com"> 
        Art Gallery</a></td>
		     
      <td align="center" valign="middle"  class="row3"> 
        <cfinclude template="adminfooter.cfm">
			 </td>
    
      </tr>
    </table><script language="JavaScript1.1">
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
ShowHide('jumpstart');
ShowHide('jumpstartblinder');
/*
document.getElementById('jumpstart').style.visibility = 'hidden';
document.getElementById('jumpstartblinder').style.visibility = 'hidden';
*/
	</script>

	</cfoutput>	

<!---
<CFIF #session.mail# is "">
You are not logged in and will not earn 10% credit</i>
<CFELSE>
<i>You are logged in as: #session.mail#
</CFIF>
    <cfoutput><font color="##FFFFFF">#screensize#, #session.screenwidth#,#displaycolumns#</font></cfoutput>
 --->
</BODY>
</HTML>

