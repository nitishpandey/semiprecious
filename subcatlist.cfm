<!---
<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and not ((status=1) or (status=2) or (status=5) or subcat like '%,%') and inventory>0)
</cfquery>
<table width='750' align='center' cellpadding='0' cellspacing='0' border='0'><tr align='LEFT'><td>
<cfoutput query="getsubcat"><a href='list.cfm?category=#category#&subcat=#URLEncodedformat(subcat)#'><i><font size='2' face="times new roman" color=black>#Ucase(Left(subcat,1))##right(subcat,len(subcat)-1)#</font></i></a> <font color='black'>| </font> </cfoutput><a href='list.cfm?salestatus=3&category=<cfoutput>#category#</cfoutput>'><font size='2' color='red'><b>Sale!</b></font></a>
---><FORM ACTION="list.cfm" method="get">
<cfif category is not 'ornaments'>

<SELECT NAME="color" SIZE="1" VALUE="subcat">
<option selected value="">Select Color</option>
<OPTION value="">Select All</option>
<OPTION value="Black">Black</option>
<OPTION value="blue">Blue</option>
<OPTION value="brown">Brown</option>
<OPTION value="green">Green</option>
<OPTION value="grey">Grey</option>
<OPTION value="orange">Orange</option>
<OPTION value="pink">Pink</option>
<OPTION value="yellow">Purple</option>
<OPTION value="red">Red</option>
<OPTION value="white">White</option>
<OPTION value="yellow">Yellow</option></select>
<input type="button" value='Go' Onclick="submit(this.form)" class="greenbutton">
&nbsp;
<SELECT NAME="priceless" SIZE="1" VALUE="">
<option selected value=""> $ Price Range</option>
<OPTION value="All">Select All</option>
<OPTION value="10">Around $10</option>
<OPTION value="20">Around $20</option>
<OPTION value="30">Around $30</option>
<OPTION value="40">Around $40</option>
<OPTION value="50">Around $50</option>
<OPTION value="75">Around $75</option>
<OPTION value="100">Around $100</option>
</select>
</cfif>
<!---
<input type="button" value='Go' Onclick="submit(this.form)">
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<font size="2" face="Times New Roman, Times, serif"><a href='searchform2.cfm'>Advanced Search</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;By item number: <a href="detail.cfm">Click here</a> </font> 

        </FORM>
		--->
<input type='hidden' name='category' value="<cfoutput>#category#</cfoutput>" class="greenbutton">
<input type="button" value='Go' Onclick="submit(this.form)" class="greenbutton">
  &nbsp;&nbsp; 
  <input type='text' name='advancedsearch'>&nbsp;<input type="button" value='Search' class="greenbutton" Onclick="submit(this.form)">

  &nbsp;&nbsp;&nbsp; &nbsp;<!-- &nbsp;<font size="2" face="Times New Roman, Times, serif"><a href="detail.cfm">By 
  Item number</a> </font> 
 --></FORM>

