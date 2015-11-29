

<html>
<head>
<title>Semiprecious.Com The best price, quality and service</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000">

<H1>SEMIPRECIOUS.COM</h1>
<CFINCLUDE template="headerpage.cfm"/ >

<P align=center>
<table>
<tr>
<td>
<a href="http://www.semiprecious.com">Home Page</a>
</td>
<td><a href='addlinksform.cfm'>Add a URL</a></td>
</tr>
</table>
<CFIF IsDefined("Form.Password")>
  <cfquery name="pass" datasource="semiprecious">
     select password from acceptance where password = '#form.password#'
  </cfquery>
    <cfif 1=1>
      
	   <CFQUERY NAME="deleted" DATASOURCE="semiprecious">
         Select * from othersites where accepted = -1
     </CFQUERY>
	  <CFQUERY NAME="selected" DATASOURCE="semiprecious">
         Select * from othersites where accepted = 1
     </CFQUERY>
<CFQUERY NAME="tobeselected" DATASOURCE="semiprecious" >
         Select * from othersites where accepted = 0
     </CFQUERY>
	<CFQUERY NAME="showmode" DATASOURCE="semiprecious" >
         Select acceptance_reqd from acceptance 
		 </CFQUERY>

	  <form action="updatelinksaction.cfm" method="post" >
	  <cfoutput query="showmode" >
 <table border=4 colour="black" >
  <tr><td></td><td>All</td><td>Only Selected</td></tr>
	   <tr><td>Show Links Mode:</td><td><input type=radio name=radio1 value=0 <cfif #showmode.acceptance_reqd# EQ 0>
	     checked=yes
		 </cfif> ></td>
	   <td align=center><input type=radio name=radio1 value=1
	   <cfif #showmode.acceptance_reqd# EQ 1>
	     checked=yes
		 </cfif> ></td></tr>
	   </table>
	   </cfoutput>
  <table border="2" bordercolor="black" >
 <caption>Approved Links</caption>
   <tr><td> Site </td>
   <td> About the Site</td><td>Price Range</td><td>Unaccept ?</td><td>Delete ?</td></tr> 
  <CFOUTPUT QUERY="selected">
      <tr><td>
<a href="#selected.url#">#selected.url#</a></td><td>#selected.description#</td>
<td>#selected.price_range#</td><td><input type="checkbox" name="checkbox1" value="#selected.url#">
   </td><td><input type="checkbox" name="checkbox4" value="#selected.url#">
   </td></tr>
</CFOUTPUT>
<table border=1 color=black>
<caption>Yet to be selected</caption>
 <tr><td> Site </td>
   <td> About the Site</td><td>Price Range</td><td>Accept ?</td><td>Delete ?</td></tr> <CFOUTPUT QUERY="tobeselected">
      <tr><td>
<a href="#tobeselected.url#">#tobeselected.url#</a></td><td>#tobeselected.description#</td>
<td>#tobeselected.price_range#</td><td><input type="checkbox" name="checkbox2" value="#tobeselected.url#">
   </td><td><input type="checkbox" name="checkbox4" value="#tobeselected.url#">
   </td></tr>
</CFOUTPUT></table><table border=1 color=black> 
<caption>Deleted Links</caption>
<tr><td> Site </td>
   <td> About the Site</td><td>Price Range</td><td>UnDelete ?</td></tr><CFOUTPUT QUERY="deleted">
      <tr><td>
<a href="#deleted.url#">#deleted.url#</a></td><td>#tobeselected.description#</td>
<td>#deleted.price_range#</td><td><input type="checkbox" name="checkbox1" value="#deleted.url#">
   </td></tr>
</CFOUTPUT></table>
<table>
<tr><td align=center><input type=button onClick="this.reload()" value=""></td><td><input type=submit name=submit value="Update"></td><td align=center col=2><input type=button onClick="this.reload()" value=""></td></tr></table>
</form>
<table>
<tr>
<td>
<a href="http://www.semiprecious.com">Home Page</a>
</td>
<td><a href='addlinksform.cfm'>Add a URL</a></td>
</tr>
</table>
 <cfelse> <!--- password failed --->
   <h3> The password is incorrect <h3><BR>
 <form name=passform action="updatelinksform.cfm" method=post>
  <table>
<tr><td>Password :</td><td><input type=text name=password size=26></td></tr>
  <tr><td></td><td><input type="submit" value="OK"></td><td></td></tr>  </table>
</form>
<table>
<tr>
<td>
<a href="http://www.semiprecious.com">Home Page</a>
</td>
<td><a href='addlinksform.cfm'>Add a URL</a></td>
</tr>
</table>
 </cfif> 

<cfelse> <!--- password field not defined --->
<form name=passform action="updatelinksform.cfm" method=post>
  <table>
  <tr><td>Password :</td><td><input type=text name=password size=26 ></td></tr>
  <tr><td></td><td><input type="submit" value="OK"></td><td></td></tr>  </table>
</form>
</cfif>
</P>

</body>
</html>
