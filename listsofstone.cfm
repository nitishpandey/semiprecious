 <!--- update the content using listofstones.cfm once a month  last updated on 22 May 05---->
<div class="stoneslist" id="earringsstones" > 
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="14" height="14"><img src="../images/jewelry_box_1.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td width="500" height="14" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td width="14" height="14"><img src="../images/jewelry_box_3.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCC99">&nbsp;</td>
      <td align="center"  class="noticeboard">Earrings:  <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
          <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >Select Color</option>
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
			            <OPTION value="Multi">MultiColor</option>
          </select> 
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> $ Price Range</option>
<OPTION value="6">Around $6</option>
<OPTION value="10">Around $10</option>
<OPTION value="20">Around $20</option>
<OPTION value="30">Around $30</option>
<OPTION value="40">Around $40</option>
<OPTION value="40">Around $50</option>
</select>
          <input type='hidden' name='category' value="earrings" class="greenbutton">
        </FORM>
        <a href="/earrings.cfm"><font color="#B30000">Show All</font></a>&nbsp;&nbsp;<a href="/showearrings.cfm">Sample Designs</a>&nbsp;&nbsp;<a href="/earrings.cfm?sortorder=price">SEE All 
        (Less Costly First)</a>&nbsp;&nbsp;&nbsp;&nbsp;<a  href=/silver_earrings.cfm>Sterling 
        Silver</a>
  <CFQUERY DATASOURCE="gemssql" NAME="earringstones">
Select stone from ltbstones where cat ='earrings' order by cat
    </cfquery>
	<cfoutput query="earringstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_earrings.cfm' id="earrings_#stone#" > 
        #stone#</a>	
	</cfoutput> <br> <a href="/gemstone_jewelry_gallery.cfm?salestatus=3&category=earrings" > 
        <font color="#990000">earrings On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('earringsstones','','hide')"><font color="#FF0000">Close</font></a>]</div></td>
      <td bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td width="14" height="14"><img src="../images/jewelry_box_4.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td width="500" height="14" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td width="14" height="14"><img src="../images/jewelry_box_2.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
  </table>
</div>
<div class="stoneslist" id="necklacesstones"   > 
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="14"><img src="../images/jewelry_box_1.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14"  width="500"  bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_3.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
    <tr> 
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard"> Necklaces: <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
  <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
      <option  value="" selected >Select Color</option>
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
	        <OPTION value="Multi">Multi-Color</option>
    </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> $ Price Range</option>
<OPTION value="6">Around $6</option>

<OPTION value="10">Around $10</option>
<OPTION value="20">Around $20</option>
<OPTION value="30">Around $30</option>
<OPTION value="40">Around $40</option>
<OPTION value="50">Around $50</option>
<OPTION value="75">Around $75</option>
<OPTION value="100">Around $100</option>
</select>
 <input type='hidden' name='category' value="necklaces" class="greenbutton">
</FORM> 


        <a href="/necklaces.cfm"><font color="#B90000">Show All</font></a>&nbsp;&nbsp;<a href="/shownecklaces.cfm">Sample Designs</a>&nbsp;&nbsp;<a href="/necklaces.cfm?sortorder=price">All 
        Less Costly First</a>&nbsp;&nbsp;&nbsp;&nbsp;<a   href='/silver_necklace.cfm'>Sterling 
        Silver</a>
		  <CFQUERY DATASOURCE="gemssql" NAME="necklacesstones">
		Select stone from ltbstones where cat ='necklaces' order by cat
	    </cfquery>
		<cfoutput query="necklacesstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_necklaces.cfm' id="necklaces_#stone#" > 
        #stone#</a>	
		</cfoutput>
		 <br>
<a href="/gemstone_jewelry_gallery.cfm?salestatus=3&category=necklaces" >
<font color="#990000">necklaces On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('necklacesstones','','hide')"><font color="#FF0000">Close</font></a>]</div> 
    </td>
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td height="14"><img src="../images/jewelry_box_4.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_2.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
  </table>
</div>

<div class="stoneslist" id="braceletsstones"  > 
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="14"><img src="../images/jewelry_box_1.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14" width="500"  bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_3.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
    <tr> 
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard">Bracelets: <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
          <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >Select Color</option>
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
			            <OPTION value="Multi">MultiColor</option>
          </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> $ Price Range</option>
<OPTION value="6">Around $6</option>

<OPTION value="10">Around $10</option>
<OPTION value="20">Around $20</option>
<OPTION value="30">Around $30</option>
<OPTION value="40">Around $40</option>
<OPTION value="50">Around $50</option>
<OPTION value="75">Around $75</option>
<OPTION value="100">Around $100</option>
</select>
          <input type='hidden' name='category' value="bracelets" class="greenbutton">
        </FORM>
        <a href="/bracelets.cfm"><font color="#B30000">Show All</font></a>&nbsp;&nbsp;<a href="/showbracelets.cfm">Sample Designs</a>&nbsp;&nbsp;<a href="/bracelets.cfm?sortorder=price">All 
        Less Costly First</a>&nbsp;&nbsp;&nbsp;&nbsp;<a   href='/silver_bracelets.cfm'>Sterling 
        Silver</a>
		 <CFQUERY DATASOURCE="gemssql" NAME="braceletsstones">
		Select stone from ltbstones where cat ='bracelets' order by cat
	    </cfquery>
		<cfoutput query="braceletsstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_bracelets.cfm' id="bracelets_#stone#" > 
        #stone#</a>	
		</cfoutput>
		 <br> <a href="/gemstone_jewelry_gallery.cfm?salestatus=3&category=bracelets" > 
        <font color="#990000">bracelets On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('braceletsstones','','hide')"><font color="#FF0000">Close</font></a>]</div></td>
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td height="14"><img src="../images/jewelry_box_4.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_2.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
  </table>
</div>

<div class="stoneslist" id="pendantsstones"  > 
  <table width="600" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td height="14"><img src="../images/jewelry_box_1.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14"  width="500" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_3.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
    <tr> 
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard">Pendants: <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
          <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >Select Color</option>
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
			            <OPTION value="Multi">MultiColor</option>
          </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> $ Price Range</option>
<OPTION value="6">Around $6</option>
<OPTION value="10">Around $10</option>
<OPTION value="20">Around $20</option>
<OPTION value="30">Around $30</option>
<OPTION value="40">Around $40</option>
<OPTION value="50">Around $50</option>
<OPTION value="75">Around $75</option>
<OPTION value="100">Around $100</option>
</select>
          <input type='hidden' name='category' value="pendants" class="greenbutton">
        </FORM>
        <a href="/pendants.cfm"><font color="#C40000">Show All</font></a>&nbsp;&nbsp;<a href="/showpendants.cfm">Sample Designs</a>&nbsp;&nbsp;<a href="/pendants.cfm?sortorder=price">SEE ALL 
        (Costly First)</a>&nbsp;&nbsp;&nbsp;&nbsp;<a   href='/silver_pendant.cfm'>Sterling 
        Silver</a>
			 <CFQUERY DATASOURCE="gemssql" NAME="pendantsstones">
		Select stone from ltbstones where cat ='pendants' order by cat
	    </cfquery>
		<cfoutput query="pendantsstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_pendants.cfm' id="pendants_#stone#" > 
        #stone#</a>	
		</cfoutput>
		 <br> <a href="/gemstone_jewelry_gallery.cfm?salestatus=3&category=pendants" > 
        <font color="#990000">pendants On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('pendantsstones','','hide')"><font color="#FF0000">Close</font></a>]</div></td>
      <td width="14" bgcolor="#CCCC99">&nbsp;</td>
    </tr>
    <tr> 
      <td height="14"><img src="../images/jewelry_box_4.gif" width="14" height="14" hspace="0" vspace="0"    /></td>
      <td height="14" bgcolor="#CCCC99"><img src="images/space.gif" width="1" height="14" /></td>
      <td height="14"><img src="../images/jewelry_box_2.gif" width="14" height="14" hspace="0" vspace="0" align="absmiddle" /></td>
    </tr>
  </table>
</div>

