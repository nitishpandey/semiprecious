<!---
<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and not ((status=1) or (status=2) or (status=5) or subcat like '%,%') and inventory>0)
</cfquery>
<table width='750' align='center' cellpadding='0' cellspacing='0' border='0'><tr align='LEFT'><td>
<cfoutput query="getsubcat"><a href='list.cfm?category=#category#&subcat=#URLEncodedformat(subcat)#'><i><font size='2' face="times new roman" color=black>#Ucase(Left(subcat,1))##right(subcat,len(subcat)-1)#</font></i></a> <font color='black'>| </font> </cfoutput><a href='list.cfm?salestatus=3&category=<cfoutput>#category#</cfoutput>'><font size='2' color='red'><b>Sale!</b></font></a>
---><FORM ACTION="/list.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
  <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
      <option selected value="">Select Color</option>
      <OPTION value="">Select All</option>
      <OPTION value="Black">Black</option>
      <OPTION value="blue">Blue</option>
      <OPTION value="brown">Brown</option>
      <OPTION value="green">Green</option>
      <OPTION value="gray">Gray</option>
      <OPTION value="orange">Orange</option>
      <OPTION value="pink">Pink</option>
      <OPTION value="purple">Purple</option>
      <OPTION value="red">Red</option>
      <OPTION value="white">White</option>
      <OPTION value="yellow">Yellow</option>
    </select><!--- <input type="button" value='Go' Onclick="submit(this.form)" class="greenbutton"> --->
<!---
<input type="button" value='Go' Onclick="submit(this.form)">
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<font size="2" face="Times New Roman, Times, serif"><a href='searchform2.cfm'>Advanced Search</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;By item number: <a href="detail.cfm">Click here</a> </font> 
<input type="button" value='Go' Onclick="submit(this.form)" class="greenbutton">
        </FORM>

		
    &nbsp;
<input type='text' value="Tourmaline in Silver ?" onFocus="javascript:this.value='';" name='advancedsearch'>&nbsp;<input type="button" value='Search' class="greenbutton" Onclick="submit(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         &nbsp;&nbsp;<!-- <font size="2" face="Times New Roman, Times, serif"><a href="detail.cfm">By Item number</a>  </font> -->
---> <input type='hidden' name='category' value="<cfoutput>#category#</cfoutput>" class="greenbutton">
       </FORM>