<script type="text/javascript" src="wddx.js" ></script>
<script >
function serializeData(data,formField)
{
wddxSerializer = new WddxSerializer();
wddxPacket = wddxSerializer.serialize(data);
if (wddxPacket != null)
   {
   formField.value = wddxPacket;
   }
   else
   {
   alert("WDDX Error! report to Macromedia !");
   }
}
var records;
var list ;
function changeudstate(a,b)
  {
  if (records[a] != 1)
    {
 records[a] = 1;
 
list.j[list.getRowCount()] = b;
}
//alert("setting " + a + "to" + records[a]);
  var name = "edit" +  b;
//  alert(name);

document.forms[0][name].checked = true;
  }
 function changeudstatedit(a,b)
  {
  var name = "edit" +  b;
if ( document.forms[0][name].checked )
{
// document.forms[0][name].checked 
 if (records[a] != 1)
    {
 records[a] = 1;
 
list.j[list.getRowCount()] = b;
}
}
}
  </script>
<cfset CurrentPage=GetFileFromPath(GetTemplatePath())>
<cfparam name="url.pricetype" default="price">
<cfparam name="form.pricetype" default="price">
<cfparam name="url.minnewitem" default="0">
<cfparam name="url.imgsize" default="20">
<cfparam name="url.maxprice1" default="1000">
<cfparam name="url.maxnewitem" default="1000">
<cfparam name="url.maxrows" default="10">
<cfparam name="url.category" default="">
<cfif isdefined("url.imgsize")>
  <cfset Variables.imgsize = url.imgsize>
  <cfelse>
  <cfset Variables.imgsize =form.imgsize>
</cfif>
<cfif isdefined("form.categories")>
  <cfset url.categories = form.categories>
</cfif>
<cfif isdefined("form.subcategories")>
  <cfset url.subcategories = form.subcategories>
</cfif>
<cfif isdefined("url.minprice1")>
  <cfset form.minnewitem = url.minnewitem>
  <cfset form.maxnewitem = url.maxnewitem>
  <cfset form.minprice1 = url.minprice1>
  <cfset form.maxprice1 = url.maxprice1>
  <cfset form.maxrows = url.maxrows>
  <cfelse>
  <cfset url.pricetype = form.pricetype>
  <cfset url.category = form.category>
</cfif>
<cfif IsDefined("FORM.MM_UpdateRecord") AND FORM.MM_UpdateRecord EQ "form1" AND isdefined("form.wddxpacket")>
  <cfwddx action="wddx2cfml" input="#form.wddxpacket#" output="query2">
  <cfloop query="query2" >
    <cfif isdefined("form.edit" & j)>
      <!--- <cfloop list="#form.edit#" index="j"> --->
      <cfquery datasource="semiprecious" username="pandey" password="pandey">
      UPDATE Items SET 
      <cfif IsDefined("FORM.cat" & j)>
        cat = 
        <cfif #evaluate("FORM.cat" & j)# NEQ "">
          '#evaluate("FORM.cat" & j)#' 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.ItemNumber" & j)>
        , ItemNumber= 
        <cfif #evaluate("FORM.ItemNumber" & j)# NEQ "">
          #evaluate("FORM.ItemNumber" & j)# 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.subcat" & j)>
        , subcat= 
        <cfif #evaluate("FORM.subcat" & j)# NEQ "">
          '#evaluate("FORM.subcat" & j)#' 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.color" & j)>
        , color= 
        <cfif #evaluate("FORM.color" & j)# NEQ "">
          '#evaluate("FORM.color" & j)#' 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.size" & j)>
        , size= 
        <cfif #evaluate("FORM.size" & j)# NEQ "">
          #evaluate("FORM.size" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.style" & j)>
        , style= 
        <cfif #evaluate("FORM.style" & j)# NEQ "">
          '#evaluate("FORM.style" & j)#' 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.description" & j)>
        , Description= 
        <cfif #evaluate("FORM.description" & j)# NEQ "">
          '#evaluate("FORM.description" & j)#' 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.Inventory" & j)>
        , Inventory= 
        <cfif #evaluate("FORM.Inventory" & j)# NEQ "">
          #evaluate("FORM.Inventory" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.Shipping" & j)>
        , Shipping= 
        <cfif #evaluate("FORM.Shipping" & j)# NEQ "">
          #evaluate("FORM.Shipping" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.BaseCost" & j)>
        , BaseCost= 
        <cfif #evaluate("FORM.BaseCost" & j)# NEQ "">
          #evaluate("FORM.BaseCost" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.price" & j)>
        , price= 
        <cfif #evaluate("FORM.price" & j)# NEQ "">
          #evaluate("FORM.price" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.saleprice" & j)>
        , saleprice= 
        <cfif #evaluate("FORM.saleprice" & j)# NEQ "">
          #evaluate("FORM.saleprice" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.num_sold" & j)>
        , num_sold= 
        <cfif #evaluate("FORM.num_sold" & j)# NEQ "">
          #evaluate("FORM.num_sold" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif IsDefined("FORM.wholesaleprice" & j)>
        , wholesaleprice= 
        <cfif #evaluate("FORM.wholesaleprice" & j)# NEQ "">
          #evaluate("FORM.wholesaleprice" & j)# 
          <cfelse>
          0 
        </cfif>
      </cfif>
      <cfif isdefined("form.showlink")>
        <cfif IsDefined("FORM.Imagelink" & j)>
          , Imagelink= 
          <cfif #evaluate("FORM.Imagelink" & j)# NEQ "">
            '#evaluate("FORM.Imagelink" & j)#' 
            <cfelse>
            NULL 
          </cfif>
        </cfif>
        <cfif IsDefined("FORM.locallink" & j)>
          , Imagelink= 
          <cfif #evaluate("FORM.locallink" & j)# NEQ "">
            '#evaluate("FORM.locallink" & j)#' 
            <cfelse>
            NULL 
          </cfif>
        </cfif>
        <cfif IsDefined("FORM.weblink" & j)>
          , weblink= 
          <cfif #evaluate("FORM.weblink" & j)# NEQ "">
            '#evaluate("FORM.weblink" & j)#' 
            <cfelse>
            NULL 
          </cfif>
        </cfif>
        <cfif IsDefined("FORM.amazon_z_shop" & j)>
          , "amazon z shop"= 1 
          <cfelse>
          0 
        </cfif>
        , "Price w/earrings"= 
        <cfif IsDefined("FORM.Price_wearrings") AND #FORM.Price_wearrings# NEQ "">
          #FORM.Price_wearrings# 
          <cfelse>
          NULL 
        </cfif>
        , Earrings= 
        <cfif IsDefined("FORM.Earrings") AND #FORM.Earrings# NEQ "">
          #FORM.Earrings# 
          <cfelse>
          NULL 
        </cfif>
        , IndiaplazaID= 
        <cfif IsDefined("FORM.IndiaplazaID") AND #FORM.IndiaplazaID# NEQ "">
          #FORM.IndiaplazaID# 
          <cfelse>
          NULL 
        </cfif>
        , IndiaPLAZA= 
        <cfif IsDefined("FORM.IndiaPLAZA")>
          1 
          <cfelse>
          0 
        </cfif>
        , datetaken= 
        <cfif IsDefined("FORM.datetaken") AND #FORM.datetaken# NEQ "">
          '#FORM.datetaken#' 
          <cfelse>
          NULL 
        </cfif>
        , needsbetterpic= 
        <cfif IsDefined("FORM.needsbetterpic")>
          1 
          <cfelse>
          0 
        </cfif>
        , Catalog= 
        <cfif IsDefined("FORM.Catalog")>
          1 
          <cfelse>
          0 
        </cfif>
        , buylink= 
        <cfif IsDefined("FORM.buylink") AND #FORM.buylink# NEQ "">
          '#FORM.buylink#' 
          <cfelse>
          NULL 
        </cfif>
      </cfif>
      <!---- show link defined --->
      , g2i= 
      <cfif IsDefined("FORM.g2i" & j)>
        1 
        <cfelse>
        0 
      </cfif>
      , reorder= 
      <cfif IsDefined("FORM.reorder" & j)>
        1 
        <cfelse>
        0 
      </cfif>
      , needsbetterpic = 
      <cfif IsDefined("FORM.needsbetterpic" & j)>
        1 
        <cfelse>
        0 
      </cfif>
      <cfif IsDefined("FORM.status" & j)>
        , status= #evaluate("FORM.status" & j)# 
      </cfif>
      WHERE NewItem= #j# 
      </cfquery>
    </cfif>
  </cfloop>
  <!--- since data has changed need to reload the page that is being loaded right now --->
  <cflocation url="#CurrentPage#?#CGI.QUERY_STRING#" addtoken="no">
</cfif>
<html>
<head>
<title>Saving More Time Editing Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../npstyles1.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
</head>
<body class="title">
<CFQUERY DATASOURCE="semiprecious" NAME="query1" username="pandey" password="pandey" >
SELECT saleprice, CAT, subcat, NewItem,Num_sold, itemnumber, price, wholesaleprice,basecost, 
size, Description, needsbetterpic, shipping, g2i,inventory, color, status, REORDER 
FROM Items WHERE (#url.pricetype# > #form.minprice1# and #url.pricetype# < #form.maxprice1#) 
<cfif isdefined("url.categories")>
  <!--- it is showing defined yet it is empty --->
  AND ( 
  <cfloop list="#url.categories#" index="ct">
    cat = '#ct#' or 
  </cfloop>
  1 = 0) 
</cfif>
<cfif isdefined("url.subcategories")>
  AND ( 
  <cfloop list="#url.subcategories#" index="sct">
    subcat like '%#sct#%' or 
  </cfloop>
  1 = 0) 
</cfif>
<cfif isdefined("url.status")>
<cfif url.status NEQ "-1">
and status = #url.status#
</cfif>
</cfif>
AND (newitem >= #form.minnewitem# and newitem <= #form.maxnewitem#) order by #url.category# 
#url.pricetype# 
</CFQUERY>
<cfif query1.RecordCount GT 0>
  <script  >
  <cfoutput>
  list = new WddxRecordset(new Array("j"),true);
 records = new Array(#query1.RecordCount#);
  </cfoutput>
  </script>
  <cfparam name="PageNum_query1" default="1">
  <cfset MaxRows_query1=Form.maxrows>
  <cfset StartRow_query1=Min((PageNum_query1-1)*MaxRows_query1+1,Max(query1.RecordCount,1))>
  <cfset EndRow_query1=Min(StartRow_query1+MaxRows_query1-1,query1.RecordCount)>
  <cfset TotalPages_query1=Ceiling(query1.RecordCount/MaxRows_query1)>
  <cfset QueryString_query1=Iif(CGI.QUERY_STRING NEQ "",DE("&"&CGI.QUERY_STRING),DE(""))>
  <cfset tempPos=ListContainsNoCase(QueryString_query1,"PageNum_query1=","&")>
  <cfif tempPos NEQ 0>
    <cfset QueryString_query1=ListDeleteAt(QueryString_query1,tempPos,"&")>
  </cfif>
  <cfif not isdefined("url.minprice1")>
    <cfset QueryString_query1 = QueryString_query1 & "&minprice1=" & Form.minprice1 &"&maxprice1="& Form.maxprice1 &"&maxrows=" & FOrm.maxrows & "&imgsize=" & form.imgsize &"&pricetype=" & url.pricetype & "&minnewitem=" & Form.minnewitem & "&maxnewitem=" & form.maxnewitem>
    <cfset QueryString_query1 = QueryString_query1 & "&category=" & url.category>
    <cfif isdefined("url.categories")>
      <cfset QueryString_query1 = QueryString_query1 & "&categories="&url.categories>
    </cfif>
    <cfif isdefined("url.subcategories")>
      <cfset QueryString_query1 = QueryString_query1 & "&subcategories="&url.subcategories>
    </cfif>
  </cfif>
  <table border="0" width="80%" align="center">
    <cfoutput> 
      <tr> 
        <td width="39%">Click on Image to see full view.(Even if thumbnail is 
          missing) #query1.RecordCount# Items</td>
        <td width="7%" align="center"> <cfif PageNum_query1 GT 1>
            <a href="#CurrentPage#?PageNum_query1=1#QueryString_query1#"><img src="../../First.gif" border=0></a> 
          </cfif> </td>
        <td width="8%" align="center"> <cfif PageNum_query1 GT 1>
            <a href="#CurrentPage#?PageNum_query1=#Max(DecrementValue(PageNum_query1),1)##QueryString_query1#"><img src="../../Previous.gif" border=0></a> 
          </cfif> </td>
        <td width="11%" align="center"> <cfif PageNum_query1 LT TotalPages_query1>
            <a href="#CurrentPage#?PageNum_query1=#Min(IncrementValue(PageNum_query1),TotalPages_query1)##QueryString_query1#"><img src="../../Next.gif" border=0></a> 
          </cfif> </td>
        <td width="17%" align="center"> <cfif PageNum_query1 LT TotalPages_query1>
            <a href="#CurrentPage#?PageNum_query1=#TotalPages_query1##QueryString_query1#"><img src="../../Last.gif" border=0></a> 
          </cfif> </td>
        <td width="18%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,29,0" width="70" height="30">
            <param name="movie" value="gotoeditingloginform.swf">
            <param name="quality" value="high">
            <embed src="gotoeditingloginform.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="70" height="50"></embed></object></td>
      </tr>
    </cfoutput> 
  </table>
  <!--     <div class="banner">Note: After editing a row check it's U/D box. To commit 
      changes to all checked rows click on 'any' of the '!'s.</div> -->
  <cfform method="post" name="form1" action="#CurrentPage#?PageNum_query1=#PageNum_query1##QueryString_query1#">
    <input type="hidden" name="wddxpacket" value="">
    <cfif isdefined("form.category")>
      <input type="hidden" name="category" value="1">
    </cfif>
    <cfoutput> 
      <input type="hidden" name="minprice1" value="#form.minprice1#" >
      <input type="hidden" name="maxprice1" value="#form.maxprice1#">
    </cfoutput> 
    <table align="center">
      <!--DWLayoutTable-->
      <tr class="tdcenter"> 
        <td align="center" >No.</td>
        <td align="center" nowrap>Cat/Stone</td>
        <td align="center" nowrap>Color</td>
        <td align="center" >Img/Size</td>
        <td align="center" >Descr</td>
        <td align="center" >G2I</td>
        <td align="center" >Inv</td>
        <td align="left">ReOrder ?</td>
        <td align="center"  >Base</td>
        <td align="center" >Regu.</td>
        <td align="center"  >Sale</td>
        <td align="center" >Whole</td>
        <td align="center" nowrap>Ship</td>
        <td align="center"  nowrap>U/D ?</td>
        <td align="center"  >sold</td>
        <td align="center" >Stat</td>
        <!---     <td align="center"  >Reorder</td> --->
      </tr>
      <cfoutput query="query1" startrow="#startrow_query1#" maxrows="#maxrows_query1#" > 
        <tr> 
          <td align="center" valign="baseline" > 
            <!--          <input type="hidden" name="newitem#query1.NewItem#" value="#query1.newitem#"  size="3" range="0,1000" validate="integer" required="yes" message="Error in  item no. of  #newitem#">  -->
            #newitem#</td>
          <!--- validate="regular_expression" pattern="([a-zA-Z ])+" 
		  the above has been removed from cfinput of string data because of
		  CF 5 --->
          <td align="center" valign="baseline"> 
            <cfinput onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="CAT#query1.NewItem#" value="#query1.CAT#" size="6"  required="yes" message="Error in cat of item with item no. #newitem#.">
            <br> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="subcat#query1.NewItem#" value="#query1.subcat#" size="9" required="no" message="Error in sub-cat of item with item no. #newitem#."></td>
          <td align="center" valign="baseline"> 
            <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="color#query1.NewItem#" value="#query1.color#" size="8"  required="no" message="Error in color of item with item no. #newitem#."> 
            <br>
            size 
            <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="size#query1.NewItem#" value="#query1.size#" size="1" range="0,50" validate="float" required="no" message="Error in Size of item no. #newitem#"> 
          </td>
          <td align="center" valign="baseline"><a href="/images/#cat#/#newitem#.jpg" target="imgwin"><img src="/images/#cat#/thumb/#newitem#.jpg" alt="Click to View Larger Image" name="#newitem#.jpg" width="#imgsize#" height="#imgsize#" border="0" id="#newitem#.jpg" ></a> 
            <br>
            Pic ? 
            <cfif needsbetterpic>
              <input name="needsbetterpic#query1.NewItem#" type="checkbox"  checked  onClick="javascript:changeudstate(#currentrow#,#newitem#);">
              <cfelse>
              <input name="needsbetterpic#query1.NewItem#" type="checkbox"  unchecked onClick="javascript:changeudstate(#currentrow#,#newitem#);">
            </cfif> </td>
          <td align="center" valign="baseline"> <textarea  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" cols="18" rows="3" name="Description#query1.NewItem#" value="#query1.Description#" >#query1.Description#</textarea></td>
          <td  align="center" valign="baseline"> <cfif #query1.g2i# >
              <input type="checkbox" name="g2i#query1.NewItem#"  checked onClick="javascript:changeudstate(#currentrow#,#newitem#);">
              <cfelse>
              <input type="checkbox" name="g2i#query1.NewItem#"  unchecked onClick="javascript:changeudstate(#currentrow#,#newitem#);">
            </cfif> </td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="Inventory#query1.NewItem#" value="#query1.inventory#" size="1" range="0,1000" validate="integer" required="yes" message="Error in Inventory of item no. #newitem#"></td>
          <td align="center" valign="baseline"> <cfif #query1.reorder# >
              <input type="checkbox" name="reorder#query1.NewItem#"  checked onClick="javascript:changeudstate(#currentrow#,#newitem#);">
              <cfelse>
              <input type="checkbox" name="reorder#query1.NewItem#"  unchecked onClick="javascript:changeudstate(#currentrow#,#newitem#);">
            </cfif></td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="BaseCost#query1.NewItem#" value="#query1.basecost#" size="4" range="0,5000" validate="float" required="yes" message="Error in Base Price of item no. #newitem#"></td>
          <td align="center" valign="baseline"> <cfinput onFocus="javascript:changeudstate(#currentrow#,#newitem#);"  type="text" name="price#query1.NewItem#" value="#price#" size="1" range="0,200" validate="float" required="yes" message="Error in Price of item no. #newitem#"></td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="saleprice#query1.NewItem#" value="#query1.saleprice#" size="1" range="0,200" validate="float" required="yes" message="Error in Sale Price of item no. #newitem#"></td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="wholesaleprice#query1.NewItem#" value="#query1.wholesaleprice#" size="1" range="0,200" validate="float" required="yes" message="Error in Whole sale Price of item no. #newitem#"></td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="Shipping#query1.NewItem#" value="#query1.shipping#" size="1" range="0,200" validate="float" required="yes" message="Error in Price of item no. #newitem#"></td>
          <td align="center" valign="baseline" > <input name="edit#newitem#" value="#newitem#" type="checkbox" unchecked onClick="javascript:changeudstatedit(#currentrow#,#newitem#);"> 
            <a href="javascript:serializeData(list,document.form1.wddxpacket);document.form1.updater.click();">!</a></td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="num_sold#query1.NewItem#" value="#num_sold#" size="1" range="0,200" validate="float" required="no" message="Error in Num Sold of item no. #newitem#"></td>
          <td align="center" valign="baseline"> <cfinput  onFocus="javascript:changeudstate(#currentrow#,#newitem#);" type="text" name="status#query1.NewItem#" value="#query1.status#" size="1" range="0,7" validate="integer" required="yes" message="Error in Status of item no. #newitem#. &sect; Should be between 0 and 6."></td>
          <!---    <cfif #query1.reorder# >
        
            <input type="checkbox" name="reorder#query1.NewItem#"  checked>
          <cfelse>
<input type="checkbox" name="reorder#query1.NewItem#"  unchecked >
        </cfif>  --->
        </tr>
        <cfif isdefined("showlinks")>
          <tr> 
            <td height="20" align="right" nowrap>Datetaken</td>
            <td nowrap align="right">Amazon</td>
            <td nowrap align="right">Needsbetterpic</td>
            <td nowrap align="right">Imagelink</td>
            <td nowrap align="right">Locallink</td>
            <td nowrap align="right">Buylink</td>
            <td nowrap align="right">Weblink</td>
            <td nowrap align="right">Style</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td width="53">&nbsp;</td>
            <td width="1">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="24"><input type="text" name="datetaken" value="#datetaken#" size="9"></td>
            <cfif amazon_z_shop>
              <td><input name="needsbetterpic" type="checkbox"  checked ></td>
              <cfelse>
              <td><input name="needsbetterpic" type="checkbox"  unchecked ></td>
            </cfif>
            <td><input type="text" name="Imagelink" value="" size="12"></td>
            <td><input type="text" name="locallink" value="#query1.locallink#" size="12"></td>
            <td><input type="text" name="buylink" value="#buylink#" size="12"></td>
            <td><input type="text" name="weblink" value="#query1.weblink#" size="12"></td>
            <td><input type="text" name="style" value="#style#" size="12"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <input type="hidden" name="showlinks" value="1">
        </cfif>
        <tr > 
          <td colspan="16"><hr /></td>
        </tr>
      </cfoutput> 
      <tr > 
        <input type="hidden" name="items" value="0">
        <td height="26" colspan="8" align="center" class="imgdiv1" nowrap><input type="reset" name="Reset" value="Undo All Edits !"> 
          &nbsp;&nbsp;&nbsp; <input type="submit" value="Update Marked Rows (You can click the ! symbol as well)" name="updater" ></td>
        <td colspan="8" rowspan="2" valign="top"><table border="0" width="50%" align="center">
            <cfoutput> 
              <tr> 
                <td width="23%" align="center"> <cfif PageNum_query1 GT 1>
                    <a href="#CurrentPage#?PageNum_query1=1#QueryString_query1#"><img src="../../First.gif" border=0></a> 
                  </cfif> </td>
                <td width="31%" align="center"> <cfif PageNum_query1 GT 1>
                    <a href="#CurrentPage#?PageNum_query1=#Max(DecrementValue(PageNum_query1),1)##QueryString_query1#"><img src="../../Previous.gif" border=0></a> 
                  </cfif> </td>
                <td width="23%" align="center"> <cfif PageNum_query1 LT TotalPages_query1>
                    <a href="#CurrentPage#?PageNum_query1=#Min(IncrementValue(PageNum_query1),TotalPages_query1)##QueryString_query1#"><img src="../../Next.gif" border=0></a> 
                  </cfif> </td>
                <td width="23%" align="center"> <cfif PageNum_query1 LT TotalPages_query1>
                    <a href="#CurrentPage#?PageNum_query1=#TotalPages_query1##QueryString_query1#"><img src="../../Last.gif" border=0></a> 
                  </cfif> </td>
              </tr>
            </cfoutput> </table></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr > 
        <td height="20" colspan="8">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <input type="hidden" name="MM_UpdateRecord" value="form1">
  </cfform>
</cfif>
<cfif query1.RecordCount EQ 0>
  No Record Found 
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="70" height="30">
    <param name="movie" value="gotoeditingloginform.swf">
    <param name="quality" value="high">
    <embed src="gotoeditingloginform.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="70" height="50"></embed></object></td> 
</cfif>
</body>
</html>
