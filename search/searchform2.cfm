<html>
<head>
<title>Search Our Inventory</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfquery name="q_cats" datasource="semiprecious">
select distinct(cat) from items order by cat
</cfquery>
<cfquery name="q_stones" datasource="semiprecious">
select distinct(subcat) from items order by subcat
</cfquery>
<cfquery name="q_prices" datasource="semiprecious">
select distinct(price) from items order by price
</cfquery>

<cfinclude template="headerpage.cfm">
<body bgcolor="#CCCCCC">
<table bgcolor="#CCCCFF" width="80%" >
  <tr><td>
<font size="4" >Just choose a description of the ornament you have in mind ...<BR />
You could specify more than one criteria also by keeping the 'ctl'<br />
key pressed while making the selection in the drop down list. </font>
</td></tr>
</table>
<cfform name="form1" method="post" action="searchaction2.cfm">
  <table width="74%" border="1" cellspacing="2" cellpadding="1" align=center>
    <tr> 
      <td width="31%" align="center" bgcolor="#FFCC99"><b><font color="#663399">You 
        could specify Ornament type here</font></b></td>
      <td width="16%" bgcolor="#CCCCFF" rowspan="3">&nbsp;</td>
      <td width="53%" align="center" bgcolor="#FFCC66"><b><font color="#663399">Limit 
        the price range if you want to </font></b></td>
    </tr>
    <tr> 
      <td align="right" width="31%" bgcolor="#CCFF99"><b>Any Type 
        <input type=checkbox  value="Any" name="cat1" checked>
        <cfoutput query="q_cats"> 
          <cfif  #len("#LTrim(cat)#")# NEQ 0>
          <br />
          #Ucase(cat)# 
          <input type="checkbox" value="'#cat#'" name="cat">
          </cfif>
        </cfoutput></b></td>
      <td align="right" width="53%" bgcolor="#FFCCFF"><b>Dont Bother ! 
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
      <td width="31%" bgcolor="#660099"><b> 
        <input type=submit value="Show all ornaments of this Type" name=submit1>
        </b></td>
      <td width="53%" bgcolor="#660099"><b> 
        <input type=submit value="Show all ornaments with this cost" name=submit2>
        </b></td>
    </tr>
  </table>
  <table bgcolor="#FFFF66" bordercolor="#663300" cellpadding="4" cellspacing="4" align="center">
    <tr bgcolor="#99CC99"> 
      <td align="center" colspan=4 bgcolor="#9933FF" valign="middle"><b><font color="#663399"> 
        <input type=submit value="Search... " name=submit5>
        </font></b></td>
    </tr>
  </table>
  <table width="92%" border="2" cellspacing="2" cellpadding="1" align="center">
    <tr> 
      <td bgcolor="#CCFFFF" width="36%" align="center" colspan=4><b>Any particular 
        <font color="#663399">Stone or Stone combination in mind ? Select all 
        of them here...</font></b></td>
    </tr>
    <tr> 
      <cfset count=2>
      <td bgcolor="#CffC38" width="36%" align="right"> Any Type 
        <input type=checkbox checked value="Any" name="subcat1">
      </td><cfoutput query="q_stones"><cfif  #len("#LTrim(subcat)#")# NEQ 0><cfif count EQ 5>
      <cfset count = 1>
    </tr>
    <tr> </cfif>
      <td bgcolor='##CffC38' align=right  > #Ucase(subcat)# 
        <input type=checkbox value="'#subcat#'" name="subcat">
      </td>
      <cfset count = count + 1></cfif></cfoutput>
      <cfif count EQ 3>
      <td bgcolor='#CffC38'></td>
      <td bgcolor='#CffC38'></td>
      </cfif>
      <cfif count EQ 4>
      <td bgcolor='#CffC38'></td>
      </cfif>
    </tr>
    <tr> 
      <td bgcolor="#660099" width="36%">&nbsp;</td>
      <td bgcolor="#660099" width="36%" colspan=2> 
        <input type=submit value="Show all items made of these stones" name=submit3>
      </td>
      <td bgcolor="#660099" width="36%">&nbsp; </td>
    </tr>
  </table>
  <table bgcolor="#FFFF66" bordercolor="#663300" cellpadding="4" cellspacing="4" align="center">
    <tr bgcolor="#99CC99"> 
      <td align="center" colspan=4 bgcolor="#9933FF" valign="top"><b><font color="#663399"> 
        <input type=submit value="Search ... " name=submit5>
        </font></b></td>
    </tr>
  </table>
</cfform>
</body>
</html>
