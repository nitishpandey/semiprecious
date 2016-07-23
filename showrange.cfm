<cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>
<cfscript>
param name="PageNum_q_already" default="1";
param name="matchtype" default="set" type="String" ;
param name="url.category" default="cufflinks" type="String" ;
 columncount = 4 ;
 category = url.category;
param name="edit" default="" type="String" ;
style1 = "";
if (len(session.mail)) {
  style1 ='<style   type="text/css" media="screen"> .rangedesc { text-align:justify; visibility:hidden; display:none;} </style>' ;
 }

if ( datepart('d',now()) mod 3)
   {sortorder = 'styleid desc';
  }else
  {sortorder = 'styleid asc' ;}
</cfscript>

<!--- to show only look type collection atdd  matchtype in clause below --->
 <cfquery name="q_already" datasource="gemssql" cachedwithin="#createTimespan(1,0,0,0)#">
    select   distinct styleid , itemid , matchtype from styles where  <cfif matchtype is 'look'>cat = '#url.category#'  AND </cfif> matchtype = '#matchtype#' order by #sortorder#
    </cfquery><cfset MaxRows_q_already=20>
<cfset StartRow_q_already=Min((PageNum_q_already-1)*MaxRows_q_already+1,Max(q_already.RecordCount,1))>
<cfset EndRow_q_already=Min(StartRow_q_already+MaxRows_q_already-1,q_already.RecordCount)>
<cfset TotalPages_q_already=Ceiling(q_already.RecordCount/MaxRows_q_already)>
<cfset QueryString_q_already=Iif(CGI.QUERY_STRING NEQ "",DE("&"&XMLFormat(CGI.QUERY_STRING)),DE(""))>
<cfset tempPos=ListContainsNoCase(QueryString_q_already,"PageNum_q_already=","&")>
<cfif tempPos NEQ 0>
  <cfset QueryString_q_already=ListDeleteAt(QueryString_q_already,tempPos,"&")>
</cfif>
<html lang="en-US" >
<head>
<title>Gemstone &amp; silver  - designs at the healing and jewelry web store</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="/styles/style_semiprecious.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="/js/mm_menu.js"></script>
<cfoutput>#style1#</cfoutput>
<script language="JavaScript" src="/js/global.js"></script>
</head>
<body  style="margin-top:0;" >
<div align="center" id="container1">
<cfinclude template="/header#session.country#.cfm">

	<div id="container2">
  
<CFOUTPUT>
  <Div  class="grayplacard" style="width:924px;margin-top:4px;">See Assorted Sets & Design Range <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /> <a href="showsets.cfm"  id="all_" title="see designs range and sets suggestions in bracelets">&nbsp;Sets&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showearrings.cfm"  id="earrings_" title="see designs range and sets suggestions in earrings">&nbsp;Earrings&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showpendants.cfm" id="pendants_">&nbsp;Pendants&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="shownecklaces.cfm"   id="necklaces_">&nbsp;Necklaces&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showbracelets.cfm"  id="bracelets_" title="see designs range and sets suggestions in bracelets">&nbsp;Bracelets&nbsp;</a>
   </div>
  <table cellpadding="0" cellspacing="0" width="930px" style="padding:0 2px 0 2px;">

  <tr>
  <td valign="top"  ><!--- BEGIN LEFT SIDE STUFF --->
    <CFINCLUDE TEMPLATE="leftmenus.cfm">
    <!--- END LEFT SIDE STUFF --->
  </td>
  <td align="center">
  <table cellpadding="4" cellspacing="2px" style="background:white;margin-top:2px;width:774px;text-align:center;">
  <tr style="width:100%">
    <td    align="center" colspan="4" class="done"  >Showing a few distinct themes from over #application.variety_count# designs so that you put together your very own unique jewelry set</td>
  </tr>
</CFOUTPUT>
<tr style="width:100%">
  <cfset counter = 1>
<cfset ref = 0>
<cfoutput query="q_already" group="styleid"  startrow="#Startrow_q_already#"  maxrows="#Maxrows_q_already#" >
<cfif itemid neq ref>
  <cfset ref = itemid>
  <cfquery datasource="gemssql" name="about">
      	select inventory, <cfif len(session.bulkbuyer.id)>wholesaleprice as </cfif> price,description,cat from items where newitem = #itemid#  and inventory > 0
	</cfquery>
  <cfif about.recordcount >
    <cfset flag = 0>
    <cfset counter = counter + 1>
    <td align="center" valign="bottom"  class="row1range"><a href="gemstone.cfm?itemid=#itemid#&styleid=#styleid#&type=#matchtype#" ><img src="images/#about.cat#/thumb/#itemid#.jpg" border="0" style="text-decoration:none;"  alt="gemstone_jewelry_gallery.cfm"/></a><br />
      #format(about.price)#<br />
      <a href="gemstone.cfm?itemid=#itemid#&styleid=#styleid#&type=#matchtype#" class="login_link" >Other Items 
      for this #matchtype#...</a>
      <div class="rangedesc" > #about.description#</div>
      <cfif edit eq 'mamamia'>
        <a href="/np/match/matchmaker.cfm?styleid=#styleid#&type=#matchtype#">Edit</a>
      </cfif>
    </td>
  </cfif>
  <cfif counter is columncount + 1>
    </tr>
   
    <cfset counter = 1>
  <tr style="width:100%">
  </cfif>
</cfif>
<cfoutput></cfoutput>
</cfoutput>
<cfoutput>
<cfif counter neq 1>
  <cfloop from="#columncount#" to="#counter#"  index="j">
    <td  class="row1">&nbsp;</td>
    </tr>
  </cfloop>
</cfif>

</cfoutput>

<cfoutput><table border="0">
  <tr>
    <td colspan="#columncount#"><cfif PageNum_q_already GT 1>
      <a href="#CurrentPage#?PageNum_q_already=1#QueryString_q_already#">First</a>
    </cfif></td>
    <td><cfif PageNum_q_already GT 1>
      <a href="#CurrentPage#?PageNum_q_already=#Max(DecrementValue(PageNum_q_already),1)##QueryString_q_already#">Previous</a>
    </cfif></td>
    <td><cfif PageNum_q_already LT TotalPages_q_already>
      <a href="#CurrentPage#?PageNum_q_already=#Min(IncrementValue(PageNum_q_already),TotalPages_q_already)##QueryString_q_already#">Next</a>
    </cfif></td>
    <td><cfif PageNum_q_already LT TotalPages_q_already>
      <a href="#CurrentPage#?PageNum_q_already=#TotalPages_q_already##QueryString_q_already#">Last</a>
    </cfif></td>
  </tr>
</table>
Records #StartRow_q_already# to #EndRow_q_already# of #q_already.RecordCount#
</table></cfoutput>
</td>
</tr>
</table> 
</div>   <cfinclude template="/mainfooter.cfm">
</div>


</body>
</html>
