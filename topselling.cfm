<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFPARAM NAME="displaycolumns" DEFAULT="5">
<CFPARAM NAME="numpages" DEFAULT="0">
<CFPARAM NAME="PicWidth" DEFAULT= "120">
<CFPARAM NAME="start" DEFAULT= "1">
<CFPARAM NAME="edit" DEFAULT= "">
<CFPARAM NAME="subcat" DEFAULT= "">
<CFPARAM NAME="category" DEFAULT= "">
<cfset refdate  = createodbcdate(dateadd('m',-3,Now()))>
<Cfif len(cgi.QUERY_STRING)>
  <cfset session.filter="#CGI.QUERY_STRING#" >
  <cfelse>
  <cfset session.filter="subcat=#subcat#&category=#category#" >
</Cfif>
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
<CFIF category Is "bracelets">
  <CFSET #PicWidth# = "150">
  <CFSET #displaycolumns# = "4">
</CFIF>
<CFQUERY NAME="qprice2" DATASOURCE="gemssql" >
SELECT buyingrecord.itemid as newitem, sum(buyingrecord.quantity) as tq, max(items.status) as status, items.cat as cat, max(items.price) as price from buyingrecord, items ,cartstatus where ( 1*buyingrecord.itemid = items.newitem and buyingrecord.datebought > #refdate# 
and items.status = 0 and items.inventory > 0)  and cartstatus.status = 'done' and buyingrecord.cartid = cartstatus.cartid group by  items.cat, buyingrecord.itemid
</cfquery>
<CFQUERY Dbtype="query" NAME="GetList" maxrows="40">
select * from qprice2 order by tq asc 
</cfquery>
<!--- <cfoutput>SELECT buyingrecord.itemid as newitem, sum(buyingrecord.quantity) as tq, max(items.status) as status
,items.cat as cat, items. as  , max(items.price) as price from buyingrecord, items , cartstatus
where ( 1*buyingrecord.itemid = items.newitem and buyingrecord.datebought > #refdate# 
and items.status = 0 and items.inventory > 0)  and cartstatus.status = 'done' and buyingrecord.cdartid = cartstatus.cartid group by  items.cat, buyingrecord.itemid ,
</cfoutput> --->
<CFSET numpages=round(GetList.RecordCount/display)>
<CFSET enddisplay= start + display>
<HTML>
<HEAD>
<TITLE>Best Selling  Beaded, Gemstone Sterling Silver Jewelry</TITLE>
<meta name="" content="<CFOUTPUT>Retail and wholesale #subcat# #category#</CFOUTPUT>,<CFLOOP QUERY="Getlist"
startrow="#start#"
endrow="#evaluate(start+5)#"><cfoutput>##. </cfoutput></cfloop>">
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="/styles/npstyles1.css" rel="stylesheet" type="text/css">
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/js/imageswap.js"></script>
</HEAD>
<BODY BGCOLOR="#FFFFFF" text='black' link="black" vlink=black alink=black topmargin='0'  onLoad="MM_preloadImages('images/nextlist2.gif','images/prevlist2.gif')">
<CFINCLUDE TEMPLATE="header.cfm">
<h3>
  <cf_steps step="1" />
</h3>
<cfoutput>
  <CFIF (#GetList.cat# is not "")>
    <input type='hidden' name='category' value='#GetList.cat#'>
    <CFELSE>
    <input type='hidden' name='category' value='#category#'>
  </cfif>
</cfoutput> &nbsp; <a name="picsonly" dir="ltr"></a>
<table border="0" cellpadding="0" cellspacing="0"   width="1000px">
  <tr >
  
  <td valign="top" style="padding:10px"><!--- BEGIN LEFT SIDE STUFF --->
    <CFINCLUDE TEMPLATE="leftmenus.cfm">
    <!--- END LEFT SIDE STUFF --->
  </td>
  <td valign="top"  style="padding:5px 5px 5px 10px"><CFSET columns=1>
    <CFSET rows=1>
    <table align="center" cellpadding="1"  cellspacing="0" >
      <cfset session.filterarray = arraynew(2)>
      <CFLOOP QUERY="Getlist"		>
        <cfset session.filterarray[currentrow][1] = newitem>
        <cfif cat is "sets">
          <cfset session.filterarray[currentrow][2] = "Necklaces">
          <cfelse>
          <cfset session.filterarray[currentrow][2] = cat>
        </cfif>
      </cfloop>
      <tr bgcolor="white" valign="top">
      
      <CFSET #enddisplay#= #start# + #display#-1>
      <CFSET #currentrow#=#start#>
      <CFLOOP QUERY="Getlist"
		startrow="#start#"
		endrow="#enddisplay#">
        <CFOUTPUT>
          <td align="center" valign="bottom" class="row1" style="padding:3px 10px 3px 10px"><!----			<CFIF getList.status is 3> --->
            <font verdana size='1'> <a href='jewelry_item.cfm/#newitem#.htm' >
            <!---	<a href='jewelry_item.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&saleprice=#saleprice#&=#URLEncodedFormat()#&newitem=#newitem#&invent=#invent#'>
			<CFELSE>
			<a href='jewelry_item.cfm?subcategory=#subcat#&category=#getList.cat#&newitem=#newitem#&price=#price#&=#URLEncodedFormat()#&newitem=#newitem#&invent=#invent#'>
			</cfif> --->
            <img src = 'images/<cfif getlist.cat is "sets">necklaces<cfelse>#lcase(getlist.cat)#</cfif>/thumb/#newitem#.jpg'  border='0' bordercolor='black'  name="img#newitem#" alt="image of #subcat# #category#"></a>
            <cfset price_array[columns] = #dollarformat(price)#>
            <cfset descr_array[columns] = '' >
            <cfset item_array[columns] = newitem>
            <!--- <b><font color="##000080">#Dollarformat(price)#</font></b><br><font face="Verdana" verdana size="1">##</font><br> --->
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
            </font>
          <cfif columns EQ #displaycolumns#>
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
                <td align="center" valign="top" nowrap  class="rowb"><font verdana size='2'><a href='jewelry_item.cfm/#item_array[Indx]#.htm' > <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;<font color="##000099">#price_array[indx]#</font> &nbsp; &nbsp;&nbsp; <a href='jewelry_item.cfm/#item_array[Indx]#.htm' > <b>Buy</b></a></font></td>
              </cfloop>
            </tr>
            <tr>
            
            <CFSET columns=1>
            <!---</table>
		<Table cellpadding=10 cellspacing=0 border='0' width="100%"><tr width=750 bgcolor="#bcolor#" valign="top">--->
            <cfelse>
            <CFSET columns=columns + 1>
          </cfif>
        </CFOUTPUT>
      </CFLOOP>
      <cfset columns  = columns - 1>
      <cfif columns >
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
              <td align="center" valign="top" class="rowb"><a href='jewelry_item.cfm/#item_array[Indx]#.htm' > <b>Zoom</b></a>&nbsp; &nbsp;&nbsp;<font color="##000099">#price_array[indx]#</font>&nbsp; &nbsp;&nbsp; <a href='jewelry_item.cfm/#item_array[Indx]#.htm' > <b>Buy</b></a></font></td>
            </cfloop>
          </cfoutput>
          <cfset columns  = columns + 1>
          <cfloop from="#columns#" to="#displaycolumns#" index="cd">
            <td>&nbsp;</td>
          </cfloop>
        </tr>
        <tr>
          <CFSET columns=0>
          <!--- code of 19 aug 04 --->
          <cfoutput>
            <td colspan="#displaycolumns#">&nbsp;</td>
            <td>&nbsp;</td>
          </cfoutput> </tr>
      </cfif>
    </table>

    <table>
        <tr>
          <td width="690"  align=center><script type="text/javascript"><!--
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
      <!--- Footer --->
      <cfinclude template="/mainfooter.cfm">
      <!--- End footer --->
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <!---          <tr>
            <td ><p>&nbsp;</p>
              <i>Advertisement: </i>
              <SCRIPT language="JavaScript">
terve('10896');
</SCRIPT>
            </td>
          </tr>
--->
</table>

</BODY>
</HTML>
