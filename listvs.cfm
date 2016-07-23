<cfcache action="clientcache"  protocol="http://" timespan="#createtimespan(0,1,0,0)#">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD leftmargin=0>
<cfparam name="screensize" default="big">
<CFPARAM NAME="displaycolumns" DEFAULT="4">
<cfparam name="displayrows" default="3">
<CFPARAM NAME="numpages" DEFAULT="0">
<CFPARAM NAME="category" DEFAULT="ALL" >
<CFPARAM NAME="category2" DEFAULT="ALL" >
<CFIF CATEGORY  EQ "">
  <CFSET CATEGORY ="ALL">
</CFIF>
<CFSET CATEGORY2=CATEGORY>
<CFPARAM NAME="priceless" DEFAULT="">
<cfset price_array  = arraynew(1)>
<cfset item_array  = arraynew(1)>
<cfset descr_array  = arraynew(1)>
<CFINCLUDE TEMPLATE="setup.cfm">

<CFPARAM NAME="sortorder" DEFAULT="datetaken" >
<!--- <CFPARAM NAME="PicWidth" DEFAULT= "120"> --->
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFIF category neq 'ornaments' and category neq 'sets'>
<CFPARAM NAME="subcat" DEFAULT= "silver">
<CFELSE>
<CFPARAM NAME="subcat" DEFAULT= "">
</CFIF>
<Cfif len(cgi.QUERY_STRING)>
<cfset session.filter="#CGI.QUERY_STRING#" >
<cfelse>
<cfset session.filter="subcat=#subcat#&category=#category#&#CGI.QUERY_STRING#" >
</Cfif>
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

<cfset advancedsearch=replacenocase(advancedsearch,"Enter Search Text","")>
<cfset advancedsearch=replacenocase(advancedsearch,"Enter "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"Search"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," text"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," show"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," Here"," ")>

<CFIF advancedsearch is not "">
<cfset advancedsearch=replacenocase(advancedsearch," & "," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"'","")>
<cfset advancedsearch=replacenocase(advancedsearch,"jewelry"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"items"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"item"," ")>
<cfset advancedsearch=replacenocase(advancedsearch,"gold stone","goldstone")>
<cfset advancedsearch=replacenocase(advancedsearch,"mixed stone","mixedstone")>
<cfset advancedsearch=replacenocase(advancedsearch,"shap"," styl")>

<cfset advancedsearch=replacenocase(advancedsearch,"jewellery"," ")>
<cfset advancedsearch=replacenocase(advancedsearch," or "," ")>
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
<CFSET colors ='red,blue,green,yellow,black,pink,white'>
<CFIF listcontainsnocase(colors, advancedsearch1)>
  <CFSET color= advancedsearch1>
</CFIF>

  <CFSET display=21>
  <CFSET displaycolumns = "3">
<cfif screensize is "small">
<cfset displaycolumns = 2>

</cfif>

  <CFIF start EQ 1>
    <CFQUERY DATASOURCE="semiprecious" NAME="searched">
  select * from  track_keywords where keywords = '#advancedsearch#'
        </cfquery>
  <cfif  searched.recordcount>
  <cfquery DATASOURCE="semiprecious"  name="">
  Update track_keywords set numtimes= numtimes + 1 where keywords = '#advancedsearch#'</cfquery>
  <cfelse>
    <CFQUERY DATASOURCE="semiprecious" NAME="searched">
    insert into track_keywords (keywords, dated) values ('#advancedsearch#', #now()#    ) 
    </cfquery>
	</cfif>
  </CFIF>
  <cfsearch 
 collection="jewelrydescription"
 type="simple"
 criteria="aventurine"
startrow=1 name="vertiylist"
 maxrows="40"
>
<cfset getlist = querynew('')>
<cfset queryaddcolumn(getlist,"cat",vertiylist["custom1"])>
<cfset queryaddcolumn(getlist,"status",vertiylist["title"])>

<cfset queryaddcolumn(getlist,"saleprice",vertiylist["custom2"])>
<cfset queryaddcolumn(getlist,"description",vertiylist["summary"])>
<cfset queryaddcolumn(getlist,"newitem",vertiylist["key"])>


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
  <CFIF subcat is not "">
    and (subcat like '%#Left(subcat,4)#%')
  </CFIF>
  <CFIF advancedsearch1 is not "">
    and ((left(subcat,3) ='#advancedsearch1#') or (left(color,3) ='#advancedsearch1#')) 
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
    <CFIF subcat is not "">
      and (subcat like '%#Left(subcat,4)#%')
    </CFIF>
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
    <CFIF subcat is not "">
      and (subcat like '%#Left(subcat,4)#%')
    </CFIF>
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
    <CFIF subcat is not "">
      and (subcat like '%#Left(subcat,4)#%')
    </CFIF>
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
    <CFIF sortorder is "datetaken" or sortorder is "inventory">
      Desc
    </CFIF>
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
<CFSET enddisplay= start + display>
<TITLE><CFOUTPUT >#subcat# 
  <cfif category is "ALL">
    Jewelry 
    <cfelse>
    #category# 
  </cfif>
</CFOUTPUT> Beaded, Gemstone Sterling Silver Jewelry</TITLE>
<meta name="description" content="<CFOUTPUT>Retail and wholesale #subcat# #category#</CFOUTPUT>,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#"><cfoutput>#description#. </cfoutput></cfloop>">
<meta name="keywords" content="<CFLOOP QUERY="Getlist" startrow="#start#"
endrow="#evaluate(start+5)#"><cfoutput>#subcat# #category#, </cfoutput></cfloop>">

<!--- <SCRIPT LANGUAGE="JavaScript" src="http://www.txtswap.com/serveng3">
</SCRIPT> --->
<link href="styles/rows.css" rel="stylesheet" type="text/css">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
// -->
</script>
</HEAD>
<BODY BGCOLOR="white" text='black' link="black" vlink=black alink=black topmargin='0' onLoad="MM_preloadImages('images/nextlist2.gif','images/prevlist2.gif'); ">

<CFINCLUDE TEMPLATE="header.cfm"> 
<cfif session.screenwidth LT 844 >
<cfset screensize = "small">
<cfset displaycolumns = 3>
<cfset displayrows = 3>
</cfif>

<CFIF advancedsearch is not "">
  <CFSET display=21>
  <CFSET displaycolumns = 3>
<cfif screensize is "small">
<cfset displaycolumns = 2>

</cfif>
</cfif>
<CFIF category Is "bracelets">
 <!---  <CFSET #PicWidth# = "150"> --->
  <CFSET displaycolumns = 3>

<cfif screensize is "small" >
<cfset displaycolumns = 2>
<cfset displayrows = 3>
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

<table border="0" width="<cfoutput>#session.screenwidth#</cfoutput>" cellpadding="0" cellspacing="0"  > 
<tr >
  <td width="112" valign=top bordercolor="#999933" bgcolor="#CCCC99"> 
  <table width="112" border="0" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
        <tr > 
          <td width="112" height="40" align="center"  background="images/bggreen1.gif" bgcolor="#FFFFFF" ><cfoutput><b><font face="Geneva, Arial, Helvetica, sans-serif" color="##000000">#ucase(Category)#<br>
              Available In</font></b></cfoutput></td>
        </tr>
      </table><br>

    <CFINCLUDE TEMPLATE="subcatvertical.cfm"> </td>
  <td valign="top">
  
   <b><cfif advancedsearch is not "">Displaying search results 
    in order of matching words/criteria. 
    <cfelse>
    Current selection:</b> <b><font size=3 face=verdana color='maroon'><CFOUTPUT>#Ucase(subcat)# #Ucase(color)# 
      <cfif category2 NEQ "All">
        #Ucase(category2)#
      </cfif>
      <Cfif priceless is not "">
        around #dollarformat(priceless)#
      </Cfif>
      , #GetList.recordcount# items</CFOUTPUT></font> </cfif> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput> 
      <font size=2>Sort </font> <a href='list.cfm?category=#category#&sortorder=price&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=2> 
      by Price</font></a> ;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=2>Sort 
      </font> <a href='list.cfm?category=#category#&sortorder=datetaken&subcat=#URLEncodedformat(subcat)#&color=#color#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#'><b><font size=2>Newest 
      First</font></a></cfoutput> <cfif session.mail eq 'pandey@aol.com'>
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
      Pearls, come with a 100% money back guarantee.</font></b></cfif> 
	  <CFIF #getList.recordcount# is 0>
      <font size='4' color='black'><br>
      No matches found for your criteria specified. Redefine your search.</font> 
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
      <CFIF subcat is not "">
        and (subcat like '%#Left(subcat,4)#%')
      </CFIF>
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
      <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">
        Desc
      </CFIF>
      </CFQUERY>
    </cfif> <CFSET columns=1> <CFSET rows=1> <br>
    &nbsp;<br> 
	<table align="center" >
      <tr valign="top">
         <CFIF (GetList.cat is "Sets")>
          <CFSET category = "Necklaces">
        </cfif>
        <td valign="top" align="left">
		
		 <Table cellpadding="2" cellspacing="0" width="<cfoutput>#evaluate(session.screenwidth - 118)#</cfoutput>"  >
            <cfif start is 1 and subcat is not "">
              <CFINCLUDE template="stoneinfo.inc">
            </cfif>

              <CFSET enddisplay= start + display-1>
              <CFSET currentrow= start>
			  <CFLOOP QUERY="Getlist"		startrow="#start#"		endrow="#enddisplay#">
			  <CFIF COLUMNS eq 1>
			  <tr>
			  </CFIF>
			  <CFOUTPUT>
			  
              <CFSET invent=inventory>
                
              
            <td class="row1"> 
              <!---			<CFIF getList.status is 3> --->
              <font verdana size='1'> 
              <cfif inventory >
                <cfif status is 3 and session.mail neq 'pandey@aol.com'>
                  <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                    <CFSET Saleprice = 0.80*price>
                  </cfif>
                  <img src="images/sale.gif" width="80" height="120"> <span class="whiteonred"><B>#dollarformat(saleprice)#</B></span> 
                  <!--- &nbsp;Regular --->
                  <br />
                </cfif>
                <cfelse>
                <font color=red size=2>Sold Out!</font> <br />
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
                <td  class="row3" nowrap><font verdana size='2'><a href='detail.cfm/#item_array[Indx]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;<font color="##000099">#price_array[indx]#</font> &nbsp; &nbsp;&nbsp; 
				  
                  <a href='detail.cfm/#item_array[Indx]#.htm' > 
                  <b>Buy</b></a></font></td>
              </cfloop>
            </tr>
            
              <CFSET columns=1>
              <!---</table>
		<Table cellpadding=10 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
              <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
			  </CFOUTPUT>
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
              <cfoutput> 
                <cfloop from="1" to="#columns#" index="indx">
                  <td class="row2">#descr_array[Indx]#
                   
                  </td>
                </cfloop>
              </cfoutput> 
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row2">&nbsp;</td>
              </cfloop>
            </tr>
            <tr> 
              <cfset columns  = columns - 1>
              <cfoutput> 
                <cfloop from="1" to="#columns#" index="indx">
                  <td class="row3"><a href='detail.cfm/#item_array[Indx]#.htm' >
                    <b>Zoom</b></a>&nbsp; &nbsp;&nbsp;<font color="##000099">#price_array[indx]#</font>&nbsp; &nbsp;&nbsp; 
					<a href='detail.cfm/#item_array[Indx]#.htm' > 
                    <b>Buy</b></a></font></td>
                </cfloop>
              </cfoutput>
              <cfset columns  = columns + 1>
              <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                <td class="row3" nowrap>&nbsp;</td>
              </cfloop>
            </tr>
            <tr> 
              <CFSET columns=0>
              <!--- code of 19 aug 04 --->
              <cfoutput>
                <td colspan="#displaycolumns#">&nbsp;</td>
              </cfoutput> </tr>
          </cfif>
          </table>
		  
		  <CFIF (#GetList.cat# is "Sets")>
            <CFSET #category# = "Sets">
          </cfif> <CFOUTPUT>
		  </td></tr>
		  <tr>
		  		   <table width="<cfoutput>#evaluate(session.screenwidth - 120)#</cfoutput>"  align="left" BORDER=0>
            <tr> 
              <td align=left border=0> <CFIF start is not "1">
                  <a href='list.cfm?category=#category2#&start=#evaluate(start - display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/prevlist.gif" name="prev"  border="0" width="80" height="31"></a>
                  </CFIF> </CFOUTPUT>&nbsp;
              </td>
			  <td align="center" >			  <cfinclude template="searchforms.cfm" />
            <!--- removed for putting search form
<cfif advancedsearch eq "">
                  Pages: 
                  <cfloop index="page" from="1" to="#numpages#" step="1">
                    <cfoutput> <a href='<cfif category neq "" and category neq "All">#category2#<cfelseif subcat neq "">#replace(trim(subcat)," ","")#<cfelse>list</cfif>.cfm?category=#category2#&start=#evaluate(display*(page-1)+1)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#'><font face= class="helvetica" size=-1>&nbsp;#Page#</font></a></cfoutput> | 
                  </CFLOOP>
                </cfif> ---></td> 
                <td align="left" >  <CFOUTPUT> 
                  <CFIF #Evaluate(start + display-1)# LT #GetList.Recordcount#>
                  
                   <!---  <b> <font size=4><i>(#evaluate(GetList.recordcount-enddisplay)# More)</i>/font></b> ---> <a href='list.cfm?category=#category2#&start=#evaluate(start + display)#&sortorder=#sortorder#&subcat=#URLEncodedformat(subcat)#&color=#color#&&priceless=#priceless#&pricegreater=#pricegreater#&salestatus=#salestatus#&advancedsearch=#URLEncodedformat(advancedsearch)#' ><img src="images/nextlist.gif"  name="next"  border="0" width="80" height="31"></a> 
                  <font size="-1">
                      <b> <i>(#evaluate(GetList.recordcount-enddisplay)# More)</i></b>
                    </font></CFIF>
                  </CFOUTPUT>
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
            <tr>
              <td colspan=3><p>&nbsp;</p>
               <!---  <i>Advertisement: </i>
                <SCRIPT language="JavaScript">
terve('10896');
</SCRIPT> ---> </td>
            </tr>
          </table>
</td>
		  
		  </tr>
		  
		  
		  </table></td>
		  </tr>
		    
		  <tr>
		  
    <td bgcolor="##CCCC99">Advert : <br>
      <a href="http://www.myexhibition.com"> Art Enthusiast ?</a></td>
		  <td>&nbsp;
		  </td>
      </tr>
    </table>
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

