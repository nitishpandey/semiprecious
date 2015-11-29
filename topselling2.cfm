<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFPARAM NAME="displaycolumns" DEFAULT="4">
<CFPARAM NAME="numpages" DEFAULT="0">
<CFPARAM NAME="category" DEFAULT="ALL" >
<CFPARAM NAME="category2" DEFAULT="ALL" >
<CFPARAM NAME="sortorder" DEFAULT="datetaken" >
<CFPARAM NAME="PicWidth" DEFAULT= "120">
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="subcat" DEFAULT= "">
<cfset refdate  = createodbcdate(dateadd('m',-3,Now()))>

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
<cfparam name="display" default="48">
<CFPARAM NAME="salestatus" DEFAULT="">
<CFPARAM NAME="newcart" DEFAULT="">
<CFPARAM NAME="invent" DEFAULT="">
<CFPARAM NAME="j" DEFAULT="">
<CFPARAM NAME="priceless" DEFAULT="">
<CFPARAM NAME="pricegreater" DEFAULT="">
<CFPARAM NAME="imagepath" DEFAULT="http://www.semiprecious.com/images/">
<CFPARAM NAME="masterpath" DEFAULT="http://www.semiprecious.com/">
<cfset advancedsearch=replacenocase(advancedsearch," semiprecious "," ")>
<CFIF category Is "bracelets">
  <CFSET #PicWidth# = "150">
  <CFSET #displaycolumns# = "3">
</CFIF>
<CFQUERY NAME="qprice" DATASOURCE="semiprecious" cachedwithin="#createtimespan(0,6,0,0)#">
SELECT buyingrecord.itemid as newitem, sum(buyingrecord.quantity)as tq, max(items.status) as status
,items.cat as cat, items.description as description , max(items.price) as price from buyingrecord, items 
where ( 1*buyingrecord.itemid = items.newitem and buyingrecord.datebought > #refdate# 
and items.status = 0 and items.inventory > 1) group by buyingrecord.itemid, items.cat, 
items.description 
</cfquery>
<CFQUERY Dbtype="query" NAME="GetList" maxrows="48">
select * from qprice order by tq desc 
</cfquery>
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display>
<HTML>
<HEAD>
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
<cfset t = datepart('m',now())>
<cfif numpages mod 2>
  <cfset fbc = '##000000'>
  <cfset fc = '##FFFFFF'>
  <cfelse>
  <cfset fbc = '##E5E5E5'>
  <cfset fc = '##000000'>
</cfif>
<cfset fbc = '##E5E6E5'>
<cfset fc = '##000000'>
<SCRIPT LANGUAGE="JavaScript" src="http://www.txtswap.com/serveng3">
</SCRIPT>
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
//-->
</script>
<style type="text/css">
<!--
.unnamed2 {
	border-right-width: thin;
	border-bottom-width: thin;
	border-left-width: thin;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #CCCC99;
	border-right-color: #CCCC99;
	border-bottom-color: #CCCC99;
	border-left-color: #CCCC99;
}
.unnamed3 {
	border-top-width: thin;
	border-right-width: thin;
	border-left-width: thin;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: solid;
	border-top-color: #CCCC99;
	border-right-color: #CCCC99;
	border-left-color: #CCCC99;
}
.unnamed4 {
	border-right-width: thin;
	border-left-width: thin;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: none;
	border-left-style: solid;
	border-right-color: #CCCC99;
	border-left-color: #CCCC99;
}
-->
</style>
</HEAD>
<BODY BGCOLOR="white" text='black' link="black" vlink=black alink=black topmargin='0' background="images/spbg1.gif" onLoad="MM_preloadImages('images/nextlist2.gif','images/prevlist2.gif')">
<CFINCLUDE TEMPLATE="header.htm">
<cfoutput> 
  <CFIF (#GetList.cat# is not "")>
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
  <input type='hidden' name='sortorder' value='#sortorder#'>
</cfoutput> &nbsp; <a name="picsonly" dir="ltr">&nbsp;</a> 
<table border="0" cellpadding="0" cellspacing="0"  >
  <tr > 
    <td width=112 valign=top bordercolor="#999933" bgcolor="#CCCC99"> <table width=112 border="0" cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF">
        <tr > 
          <td width="112" height="40" align="center"  background="images/bggreen1.gif" bgcolor="#FFFFFF" ><font face=geneva><b><cfoutput><font color="##000000">#ucase(Category)#<br>
              Available In</font></cfoutput></b></font></td>
        </tr>
      </table>
      <CFINCLUDE TEMPLATE="subcatvertical.cfm"> 
    <td valign=top> <b> <div class="row2"> OUR BEST SELLING JEWELRY </div> 
            <cfif session.mail eq 'pandey@aol.com'>
        <font size=5 color='orange'>APPROX. WHOLESALE RATES</font> 
      </cfif> 

               <b><font color=brown size=-1>Nickel Free plated, Hypo Allergenic option 
        available for dangling earrings by emailing anup@semiprecious.com or calling 
        us 512 589 9009. </font></b>
      <!---<cfif category is 'necklaces' or category is 'sets'><br><b><font color=brown size=-1>You can request dangling earrings for almost all necklaces in the Necklaces section</font></b></cfif>--->
        <br>
        <b><font color=gray size=-1>Our Pearls are good quality Freshwater Cultured 
        Pearls, come with a 100% money back guarantee.</font></b><CFIF #getList.recordcount# is 0>
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
        <CFIF #subcat# is not "">
          and (subcat like '%#Left(subcat,4)#%') 
        </CFIF>
        <CFIF #color# is not "">
          and (color like '%#color#%') 
        </CFIF>
        <CFIF #priceless# is not "">
          and (price <= #priceless#) 
        </cfif>
        <CFIF #pricegreater# is not "">
          and (price >= #pricegreater#) 
        </CFIF>
        order by #sortorder# 
        <CFIF #sortorder# is "datetaken" or #sortorder# is "inventory">
          Desc 
        </CFIF>
        </CFQUERY>
      </cfif> <CFSET #columns#=1> <CFSET #rows#=1> <br> &nbsp;<br> <table align="center" width=100%>
        <tr valign=top> 
          <td valign=top align=left> </td>
          <CFIF (#GetList.cat# is "Sets")>
            <CFSET #category# = "Necklaces">
          </cfif>
          <td valign=top align=left> <Table cellpadding=4 cellspacing=0  width="100%">
              <cfif start is 1 and subcat is not "">
                <CFINCLUDE template="stoneinfo.inc">
              </cfif>
              <tr bgcolor="white" valign="top"> 
                <CFSET #enddisplay#= #start# + #display#-1>
                <CFSET #currentrow#=#start#><CFLOOP QUERY="Getlist"
		startrow="#start#"
		endrow="#enddisplay#"><CFOUTPUT>
                 
                <td align="center" valign="bottom" class="unnamed3"> 
                  <!----			<CFIF getList.status is 3> --->
                  <font verdana size='1'> <a href='detail.cfm/#newitem#.htm' > 
                  <!---	<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			<CFELSE>
			<a href='detail.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&description=#URLEncodedFormat(description)#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
                  <img src = 'images/<cfif getlist.cat is "sets">necklaces<cfelse>#lcase(getlist.cat)#</cfif>/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a> 
                  <cfset price_array[columns] = #dollarformat(price)#>
                  <cfset descr_array[columns] = description>
                  <cfset item_array[columns] = newitem>
                  <!--- <b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">#description#</font><br> --->
                  <CFIF #Edit# Is "MAMAMIA">
                    #tq#, <a href='edititem.cfm?newitem=#newitem#'>Edit</a><font color='red'> 
                    <CFIF #status# is "1">
                      Inactive 
                      <cfelseif #status# is "2">
                      Discont. 
                      <cfelseif #status# is "4">
                      Free 
                      <cfelseif #status# is "3">
                      Sale 
                      <cfelseif #status# is "5">
                      Picture 
                    </cfif>
                    </font> 
                  </CFIF>
                  </font> <cfif columns EQ #displaycolumns#> 
                  <!---
		<h4><font color=gray>Place mouse/cursor on small images to see large image below.</font><h4>
		<img src = "images/#category#/#newitem#.jpg"  border='10' bordercolor='black' name="image#rows#"><br><b><font color=gray size=2><i>Please scroll down to check for more</i></font><br>
		--->
              </tr>
              <tr  > 
                <cfloop from="1" to="#columns#" index="indx">
                  <td valign="top" class="row2"><font color="##535300">#descr_array[Indx]#</font> </td>
                </cfloop>
              </tr>
              <tr  > 
                <cfloop from="1" to="#columns#" index="indx">
                  <td align="center" valign="top" nowrap  class="row3"><font verdana size='2'><a href='detail.cfm/#item_array[Indx]#.htm' > 
                    <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;<font color="##000099">#price_array[indx]#</font> &nbsp; &nbsp;&nbsp; <a href='detail.cfm/#item_array[Indx]#.htm' > 
                    <b>Buy</b></a></font></td>
                </cfloop>
              </tr>
              <tr> 
                <CFSET columns=1>
                <!---</table>
		<Table cellpadding=10 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
                <cfelse>
                <CFSET columns=columns + 1></cfif></CFOUTPUT></CFLOOP>
                <cfset columns  = columns - 1><cfif columns >
                <!--- code of 19 aug 04 --->
                <cfset columns  = columns + 1>
                <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                  <td valign="bottom" class="unnamed3">&nbsp;</td>
                </cfloop>
              </tr>
              <tr> 
                <cfset columns  = columns - 1>
                <cfoutput> 
                  <cfloop from="1" to="#columns#" index="indx">
                    <td valign="top" class="row2"><font color="##535300">#descr_array[Indx]#</font> </td>
                  </cfloop>
                </cfoutput> 
                <cfset columns  = columns + 1>
                <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                  <td>&nbsp;</td>
                </cfloop>
              </tr>
              <tr> 
                <cfset columns  = columns - 1>
                <cfoutput> 
                  <cfloop from="1" to="#columns#" index="indx">
                    <td align="center" valign="top" class="row3"><a href='detail.cfm/#item_array[Indx]#.htm' > 
                      <b>Zoom</b></a>&nbsp; &nbsp;&nbsp;<font color="##000099">#price_array[indx]#</font>&nbsp; &nbsp;&nbsp; <a href='detail.cfm/#item_array[Indx]#.htm' > 
                      <b>Buy</b></a></font></td>
                  </cfloop>
                </cfoutput> 
                <cfset columns  = columns + 1>
                <cfloop from="#columns#" to="#displaycolumns#" index="cd">
                  <td nowrap>&nbsp;</td>
                </cfloop>
              </tr>
              <tr> 
                <CFSET columns=0>
                <!--- code of 19 aug 04 --->
                <cfoutput> 
                  <td colspan="#displaycolumns#">&nbsp;</td>
                </cfoutput> </tr>
            </table></cfif>
            <CFIF (#GetList.cat# is "Sets")>
              <CFSET #category# = "Necklaces">
            </cfif> <table>
              <tr> 
                <td width="651" colspan=2 align=center> <script type="text/javascript"><!--
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
			//--></script> <script type="text/javascript"
				  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script> </td>
              </tr>
              <tr> 
                <td colspan=2><p>&nbsp;</p>
                  <i>Advertisement: </i> <SCRIPT language="JavaScript">
terve('10896');
</SCRIPT> </td>
              </tr>
            </table></td>
        </tr>
      </table>
</table>
<!---
<CFIF #session.mail# is "">
You are not logged in and will not earn 10% credit</i>
<CFELSE>
<i>You are logged in as: #session.mail#
</CFIF>--->
</BODY>
</HTML>
