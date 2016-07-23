<cfparam name="url.category" default="all" type="String">
<cfset category = url.category />
<cfparam name="edit" default="" type="String">
<cfif session.mail eq 'nitishpandey@indiatimes.com'>
<cfset edit = 'mamamia' />
</cfif>
<html >
<head>
<title>Gemstone &amp; silver  - designs at the healing and jewelry web store</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css" />
<cfif len("session.mail")>
<style   type="text/css" media="screen">

.rangedesc {
text-align:justify;
visibility:hidden;
display:none;
}
 </style>

</cfif>
</head>
<body  bgcolor="#FFFFFF" topmargin="0">
<div align="center">
<cfinclude template="headerforgemstone_jewelry_gallery.cfm">
<cfif  datepart('d',now()) mod 3>
<cfset sortorder = 'styleid desc'>
<cfelse>
<cfset sortorder = 'styleid asc'>
</cfif>
<!--- to show only look type collection atdd  matchtype in clause below --->
<cfquery name="q_already" datasource="gemssql">
    select   styleid , itemid,matchtype  from styles where  <cfif matchtype is 'look'>cat = '#url.category#'  AND </cfif> matchtype = '#matchtype#' order by #sortorder#
    </cfquery><br />
<CFOUTPUT>
	<table style="width:799px;color:black;text-weight:bold;">
	<tr  >
    <td  align="center" valign="middle" class="grayplacard"  width="799px">See Assorted Sets & Design Range <img src="/images/arrow_right.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /> <a href="showsets.cfm"  id="all_" title="see designs range and sets suggestions in bracelets">&nbsp;Sets&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showearrings.cfm"  id="earrings_" title="see designs range and sets suggestions in earrings">&nbsp;Earrings&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showpendants.cfm" id="pendants_">&nbsp;Pendants&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="shownecklaces.cfm"   id="necklaces_">&nbsp;Necklaces&nbsp;</a>&nbsp;&nbsp;&nbsp;<a href="showbracelets.cfm"  id="bracelets_" title="see designs range and sets suggestions in bracelets">&nbsp;Bracelets&nbsp;</a></td>
  </tr>	</table>
  <table cellpadding="0" cellspacing="0" width="800px"><tr><td valign="top"> <table style="display:inline;background-color:##FFFFFF;border:1px ridge ##666600;" cellspacing="0"  cellpadding="1">
	<tr align="center"   class="greenbutton">
	<td  style="border-bottom:1px black solid;" ><span  class="category">#category#<img src="/images/arrow_down.gif" style="display:inline;" border="0" hspace="0" vspace="0" align="absmiddle"  title="jewelry gemstone selection" width="15" height="15" /> </span></td>
	</tr>
    <CFINCLUDE TEMPLATE="subcatvertical.cfm">
	 <!--- removed bottom fading img from here ---> 
   </table>
  </td><td><table cellspacing="0" style="margin-top:1px;border:1px dashed ##DADA99;width:604px;background-color:white;">
<tr><td    align="center" colspan="3" class="cyansilverfilter"  >These are just some of the  designs  or our suggestions for sets from over 1200 designs in our store. <i><a href="gemstone_jewelry_gallery.cfm?category=#category#&sortorder=newitem%20desc">Click here for more!</a></i> </td></tr>
</CFOUTPUT>
<tr><td background="images/leftroundwhitegray.gif" height="6">&nbsp;</td><td background="images/centerwhitegray.gif">&nbsp;</td><td background="images/rightroundwhitegray.gif">&nbsp;</td></tr>
<tr>

<cfset counter = 1>
<cfset ref = 0>
	<cfoutput query="q_already" group="styleid"  >
    <cfif itemid neq ref>	
    <cfset ref = itemid>
	<cfquery datasource="gemssql" name="about">
      	select inventory, <cfif isdefined("session.bulkbuyer.id")>wholesaleprice as </cfif> price,description,cat from items where newitem = #itemid#  
	</cfquery>
	<cfif about.recordcount >
	<cfset flag = 0>
		<cfset counter = counter + 1>
	<td align="center" valign="bottom"  class="row1range">
	<img src="images/#about.cat#/thumb/#itemid#.jpg" border="0" style="text-decoration:none;"  alt="gemstone_jewelry_gallery.cfm"/><br />
        #format(about.price)#<br />
        <a href="gemstone.cfm?itemid=#itemid#&styleid=#styleid#&type=#matchtype#" >Other Items 
        of this #matchtype#...</a>
		<div class="rangedesc" >
#about.description#</div>
<cfif edit eq 'mamamia'>
<a href="/np/match/matchmaker.cfm?styleid=#styleid#&type=#matchtype#">Edit</a></cfif>
</td>
	</cfif>
 <cfif counter is 4 >
  </tr><!---<tr><td colspan="4"><hr /></td></tr><tr>---><cfset counter = 1>
  <tr>
   </cfif>
     </cfif>
	  </cfoutput>
 <cfif counter neq 1>
  	<cfloop from="3" to="#counter#"  index="j">
<td  class="row1">&nbsp;</td>
	</tr>

  </cfloop>
  	</cfif>
<tr><td colspan="3" align="center">   <cfinclude template="adminfooter.cfm">
</td></tr>
  	</table>
</td><td valign="top">
    <table cellpadding="0" cellspacing="0" style="horizontal-align:right;text-align:center;width:98px;font-size:12px;display:block;padding:0px;margin-top:1px;">
 <tr><td>
<cfinclude template="bycolor.cfm" />
</td></tr></table></td></tr></table>
</div>   
<cfoutput>
  <script language="JavaScript1.1" type="text/JavaScript1.1">
<!--
//  document.getElementById("#category#_").parentNode.style.backgroundColor = "yellow";
     document.getElementById("#category#_").className = "#matchtype#inline";
       document.getElementById("#category#").style.color = "maroon";
	    document.getElementById("#category#").style.textDecoration = "none";
	 
	
<cfif isdefined("session.bulkbuyer.id")>
 	document.getElementById("wholesale").style.color = "maroon";
    document.getElementById("wholesale").style.textDecoration = "none" ;
</cfif>
	//	-->
  </script>
  </cfoutput>

</body>
</html>
