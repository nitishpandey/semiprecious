
<cfif 0 EQ 1>


<H1>SEMIPRECIOUS.COM</h1>
<CFINCLUDE template="header.htm">

<P align=center>
<CFIF IsDefined("Form.Password")>
  <cfquery name="pass" datasource="semiprecious">
     select password from acceptance where password = '#form.password#'
  </cfquery>
    <cfif #pass.Recordcount# EQ 1>
       <CFQUERY NAME="se" DATASOURCE="semiprecious">
         Select * from main
     </CFQUERY>
<form action="updatelinksaction.cfm" method="post">
 <table border=2 bordercolor=black>
   <tr><td> Site </td>
   <td> About the Site</td><td>Price Range</td><td>Accept ?</td></tr> 
  <CFOUTPUT QUERY="se">
      <tr><td>
<a href="#se.url#">#se.url#</a></td><td>#se.description#</td>
<td>#se.price_range#</td><td><input type="checkbox" name="checkbox" value="checkbox">
   </td></tr>
</CFOUTPUT>
</table>
<input type=submit name=submit>
</form>
 <cfelse> <!--- password failed --->
   <h3> The password is incorrect <h3><BR>
 <form name=passform action="updatelinksform.cfm" method=post>
  <table>
<tr><td>Password :</td><td><input type=text name=password size=26></td></tr>
  <tr><td></td><td><input type="submit" value="OK"></td><td></td></tr>  </table>
</form>
 </cfif> 

<cfelse> <!--- password field not defined --->
<form name=passform action="updatelinksform.cfm" method=post>
  <table>
  <tr><td>Password :</td><td><input type=text name=password size=26 ></td></tr>
  <tr><td></td><td><input type="submit" value="OK"></td><td></td></tr>  </table>
</form>
</cfif>
</P>
<cfelse>

<CFINCLUDE template="header.htm">
<link rel="stylesheet" href="stylesheet1.css" type="text/css">
</cfif>
