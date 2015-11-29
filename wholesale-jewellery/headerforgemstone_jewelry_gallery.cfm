<cfinclude template="udfinclude.cfm" >
<table width=1000>
	<cfif cgi.server_name eq "63.135.126.234">
<tr  align="center"><td><img src='http://www.aiyanainc.com/includes/templates/aiycust/images/aiyana.png' height=100></td><td bgcolor="white">Regular mail: Order today and receive by <font color=green><cfoutput>#dateformat(dateadd('d',3,now()),"dddd")# or #dateformat(dateadd('d',4,now()),"dddd")#</cfoutput></font>
Shipping Worldwide!<br>Except items that say "2 week delivery".</td></td></tr>
<cfelseif cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or cgi.server_name IS "wholesale-gemstone-jewelry.com">
<cfinclude template=/wholesale-jewellery/header2.cfm>
<cfelse>
<cfinclude template=/header2.cfm>
</cfif>
  <tr> 
    <td colspan="4" align="left" valign="top"> 
	<cfinclude template ='/topmenu.cfm'></td> <td>&nbsp;</td>
  </tr>
 
</table>
<script language="JavaScript" src="/js/macromediafuncs.js" >
</script>
<cfsilent>
 <!--- update the content using listofstones.cfm once a month  last updated on 22 May 05---->
<CFQUERY DATASOURCE="gemssql" NAME="typesofearrings">
		Select groupname from groupings where cat='earrings' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofpendants">
		Select groupname from groupings where cat='pendants' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofnecklaces">
		Select groupname from groupings where cat='necklaces' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofrings">
		Select groupname from groupings where cat='rings' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofbracelets">
		Select groupname from groupings where cat='bracelets' order by groupname	</cfquery>
		</cfsilent>
<script language="JavaScript" type="text/javascript">
<!-- Copyright 2003, Sandeep Gangadharan -->
<!-- For more free scripts go to http://www.sivamdesign.com/scripts/ -->
<!--
(document.getElementById) ? dom = true : dom = false;

function hideIt() {
  if (dom) {document.getElementById('layer1').style.visibility='hidden';}
  if (document.layers) {document.layers["layer1"].visibility='hide';}
  }

function showIt() {
 if (dom) {
  if (document.getElementById('layer1').style.visibility=='visible') { hideIt(); }
  else {document.getElementById('layer1').style.visibility='visible'} }

 if (document.layers) {
  if (document.layers["layer1"].visibility=='show') { hideIt(); }
  else {document.layers["layer1"].visibility='show'} }

 window.setTimeout("hideIt();", 10000)  
}
// -->
</script>