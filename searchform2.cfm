<html>
<head>
<title>Search Semiprecious Beaded Stone Jewelry Inventory</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfquery name="q_cats" datasource="semiprecious">
select distinct(cat) from items where (inventory>0) order by cat
</cfquery>
<cfquery name="q_stones" datasource="semiprecious">
select distinct(subcat) from items where subcat not like '%,%' order by subcat 
</cfquery>
<!---
<cfquery name="q_prices" datasource="semiprecious">
select distinct(price) from items order by price
</cfquery>
--->

<cfinclude template="header.htm">
<table width="80%" >
  <tr><td>
<font size="4" >Just choose from the options you have in mind ...<BR />
You could specify more than one criteria.
</td></tr>
</table>
<cfform name="form1" method="GET" action="searchaction2.cfm">
  <table width="74%" border="1" cellspacing="2" cellpadding="1" align=center>
    <tr> 
      <td width="31%" align="center" bgcolor="#1111F8"><b><font color="#FFFFF">Type 
        of Item</font></b></td>
      <td width="53%" align="center" bgcolor="#1111F8"><b><font color="#FFFFFF">Price 
        range </font></b></td>
    </tr>
    <tr> 
      <td align="right" width="31%" bgcolor="#FffFF8"><b>All 
        <input type=checkbox  value="Any" name="cat1">
        <cfoutput query="q_cats"> 
          <cfif  #len("#LTrim(cat)#")# NEQ 0>
            <br />
            #Ucase(cat)# 
            <input type="checkbox" value="'#cat#'" name="cat" onClick="javascript:if (this.checked){ document.form1.cat1.checked = false };">
          </cfif>
        </cfoutput></b></td>
      <td align="right" width="53%" bgcolor="#FffFF8"><b>Dont Bother ! 
        <input type=radio name=price value=0  checked>
        <br />
        Upto $5 
        <input type=radio name=price value=5 >
        <br />
        Upto $10 
        <input type=radio name=price value=10 >
        <br />
        More than $10 but less than $20 
        <input type=radio name=price value=1020 >
        <br />
        Upto $20 
        <input type=radio name=price value=20 >
        <br />
        More than $20 
        <input type=radio name=price  value=25 >
        </b></td>
    </tr>
    <tr> 
      <td width="31%" bgcolor="#FFFFF9"><b> 
        <!---        <input type=submit value="Search only from this category" name=submit1>--->
        </b></td>
      <td width="53%" bgcolor="#FFFFF9"><b> 
        <!---        <input type=submit value="Show all ornaments with this cost" name=submit2>--->
        </b></td>
    </tr>
  </table>
  <table width="92%" border="2" cellspacing="2" cellpadding="1" align="center">
    <tr> 
      <td bgcolor="#1111F8" width="36%" align="center" colspan=4><b> <font color="#FFFFF">One 
        or More Stones</font></b></td>
    </tr>
    <tr> 
      <cfset count=2>
      <td bgcolor="#FffFF8" width="36%" align="right"> Any Type 
        <input type=checkbox checked value="Any" name="subcat1"> </td><cfoutput query="q_stones"><cfif  #len("#LTrim(subcat)#")# NEQ 0><cfif count EQ 5>
      <cfset count = 1>
    </tr>
    <tr> </cfif>
      <td bgcolor='##FffFF8' align=right  > #Ucase(subcat)# <input type=checkbox value="'#subcat#'" name="subcat" onClick="javascript:if (this.checked){ document.form1.subcat1.checked = false };"> 
      </td>
      <cfset count = count + 1></cfif></cfoutput>
      <cfif count EQ 3>
        <td bgcolor='#FffFF8'></td>
        <td bgcolor='#FffFF8'></td>
      </cfif>
      <cfif count EQ 4>
        <td bgcolor='#FffFF8'></td>
      </cfif>
    </tr>
  
  </table>
  <table bgcolor="#FFFF66" bordercolor="#111100" cellpadding="4" cellspacing="4" align="center">
    <tr bgcolor="#FffFF8"> 
      <td align="center" colspan=4 bgcolor="#FffFF8" valign="top"><b><font color="#FFF399"> 
        <input type=submit value="Search ... " name="submit5">
        </font></b></td>
    </tr>
  </table>
</cfform>
</body>
</html>
