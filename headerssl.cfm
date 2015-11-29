<link href="/semiprecious/styles/npstyles1.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/semiprecious/wholesalemenu.files/dmenu.js"></script>
  <noscript></noscript>


<script language="JavaScript" src="/semiprecious/js/macromediafuncs.js" >
</script>
<cfinclude template="/semiprecious/udfinclude.cfm" >
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

 window.setTimeout("hideIt();", 10000)   // change the # 5000 at the left to change the time it takes for the
                                        // links to close. 5000 means 5 seconds
}
// -->
</script>

<table border="0" cellpadding="0" cellspacing="0" width="1000">
<!-- fwtable fwsrc="newheader.png" fwbase="newheader.cfm.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
<cfinclude template="/semiprecious/wholesale-jewellery/header2.cfm">
<cfelseif cgi.sever_name contains "semiprecious.in">
<cfinclude template="/semiprecious/india/header2.cfm">
<cfelse>
  <cfif cgi.server_name contains 'ssl'>
  <cfinclude template="/semiprecious/header2.cfm">
  <cfelse>
  <cfinclude template="/header2.cfm">
  </cfif>
 <!---<tr border=1 bordercolordark="#006633" >
    <td width=309><a href=http://www.semiprecious.com><img src="http://www.semiprecious.com/images/header.gif" alt="Gemstone Banner" name="newheadercfm_r1_c1" width="309" height="57" border="0" /></a></td>
	<td align=center bgcolor="white">Regular mail (flat rate $3.99): Order today and receive between <font color=green><cfoutput>#dateformat(dateadd('d',4,now()),"dddd")# and #dateformat(dateadd('d',7,now()),"dddd")#</cfoutput></font> <br>Shipping world wide -
Australia, U.K., Ireland and more!</td><td>
</td>
<!---<td>

</td>--->
  </tr>  ---> 
    </cfif>
  <tr> 
    <td colspan="4" align="left" valign="top"> 
<cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
<cfinclude template ='/semiprecious/wholesale-jewellery/wholesalemenu.html'>
<cfelse>
<cfinclude template ='/semiprecious/topmenu.cfm'>
</cfif>
</td> 
  
 <td>&nbsp;</td>
  </tr>
 
 
</table>

