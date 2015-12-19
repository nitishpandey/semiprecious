<!---
<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and not ((status=1) or (status=2) or (status=5) or subcat like '%,%') and inventory>0)
</cfquery>
<table width='750' align='center' cellpadding='0' cellspacing='0' border='0'><tr align='LEFT'><td>
<cfoutput query="getsubcat"><a href='list.cfm?category=#category#&subcat=#URLEncodedformat(subcat)#'><i><font size='2' face="times new roman" color=black>#Ucase(Left(subcat,1))##right(subcat,len(subcat)-1)#</font></i></a> <font color='black'>| </font> </cfoutput><a href='list.cfm?salestatus=3&category=<cfoutput>#category#</cfoutput>'><font size='2' color='red'><b>Sale!</b></font></a>
--->
<FORM ACTION="gemstone_jewelry_gallery.cfm" method="get" name="srchfrm" style="display:inline;">
  <cfif category is not 'ornaments'>
    <!--- <img src="/images/colorsbutton.gif" vspace="0" hspace="0" width="10" height="16" align="absmiddle" />: 
    	<cfoutput><input type="hidden" name="category" value="#category#">
    </cfoutput> --->
    <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
      <option selected value="">By Color</option>
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
    </select>
    <!--- <input type="button" value='Go' Onclick="submit(this.form)" class="greenbutton"> --->
  </cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <!--- <img src="images/dollarbutton.gif" width="10" height="20"  align="absmiddle" vspace="0">  --->
  <SELECT class="inputtext" NAME="priceless" SIZE="" VALUE="" onChange="javascript:submit(this.form);">
<option selected value="">$Range</option>
<OPTION value="All">Any</option><OPTION value="10">About $6</option>
<OPTION value="10">About $10</option>
<OPTION value="20">About $20</option>
<OPTION value="30">About $30</option>
<OPTION value="40">About $40</option>
<OPTION value="50">About $50</option>
<OPTION value="75">About $75</option>
<OPTION value="100">About $100</option>
</select>
<!---
<input type="button" value='Go' Onclick="submit(this.form)">
       &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<font size="2" face="Times New Roman, Times, serif"><a href='searchform2.cfm'>Advanced Search</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;By item number: <a href="jewelry_item.cfm">Click here</a> </font> 
<input type="button" value='Go' Onclick="submit(this.form)" class="greenbutton">
        </FORM>

		
    &nbsp;
<input type='text' value="Tourmaline in Silver ?" onFocus="javascript:this.value='';" name='advancedsearch'>&nbsp;<input type="button" value='Search' class="greenbutton" Onclick="submit(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         &nbsp;&nbsp;<!-- <font size="2" face="Times New Roman, Times, serif"><a href="jewelry_item.cfm">By Item number</a>  </font> -->
--->
    <input type='hidden' name='category' value="<cfoutput>#category#</cfoutput>" class="greenbutton">
<input type="hidden"  name="sortorder" value="newitem" />
       </FORM>
<!---		<script language="JavaScript1.1">
function delay()
{			for (i = 0;i < 2000;i++)
				   {
				   ; // do nothing
				   }
				   
				   }
		self.document.srchfrm.advancedsearch.focus();
				self.document.srchfrm.advancedsearch.value = 'En';
									delay();
					self.document.srchfrm.advancedsearch.value = 'Enter';
					delay();
						self.document.srchfrm.advancedsearch.value = 'Enter Se';
												delay();
												self.document.srchfrm.advancedsearch.value = 'Enter Search';
																	delay();
								self.document.srchfrm.advancedsearch.value = 'Enter Search te';					delay();
									self.document.srchfrm.advancedsearch.value = 'Enter Search text';
		</script>
--->
