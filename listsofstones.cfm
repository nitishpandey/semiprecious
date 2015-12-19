<cfsilent>
 
<CFQUERY DATASOURCE="gemssql" NAME="typesofearrings" cachedwithin="#createtimespan(2,0,0,0)#" >
		Select groupname from groupings where cat='earrings' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofpendants" cachedwithin="#createtimespan(2,0,0,0)#">
		Select groupname from groupings where cat='pendants' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofnecklaces" cachedwithin="#createtimespan(2,0,0,0)#">
		Select groupname from groupings where cat='necklaces' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofrings" cachedwithin="#createtimespan(2,0,0,0)#">
		Select groupname from groupings where cat='rings' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofbracelets" cachedwithin="#createtimespan(2,0,0,0)#">
		Select groupname from groupings where cat='bracelets' order by groupname	</cfquery>

<CFQUERY DATASOURCE="gemssql" NAME="typesofcufflinks" cachedwithin="#createtimespan(2,0,0,0)#">
		Select groupname from groupings where cat='cufflinks' order by groupname	</cfquery>
		</cfsilent>

<div class="stoneslist" id="earringsstones" onMouseOver="MM_showHideLayers('earringsstones' ,'','show')";>

  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td bgcolor="gray">&nbsp;</td>
      <td align="center"  class="noticeboard"><div class="form_heading">Earrings</div>  <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
	  <input type="hidden" name="category" value="earrings" />
          <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Color</option>
            <OPTION value="">Select All</option>
            <OPTION value="Black">Black</option>
            <OPTION value="blue">Blue</option>
            <OPTION value="brown">Brown</option>
            <OPTION value="green">Green</option>
            <OPTION value="gray">Gray</option>
            <OPTION value="orange">Orange</option>
            <OPTION value="pink">Pink</option>
            <OPTION value="gray">gray</option>
            <OPTION value="red">Red</option>
            <OPTION value="white">White</option>
            <OPTION value="yellow">Yellow</option>
			            <OPTION value="Multi">MultiColor</option>
          </select> 
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> By Price</option>
<cfoutput>
	<OPTION value="6">Around #format(6)#</option>
	<OPTION value="10">Around #format(10)#</option>
	<OPTION value="20">Around #format(20)#</option>
	<OPTION value="30">Around #format(30)#</option>
	<OPTION value="40">Around #format(40)#</option>
	<OPTION value="40">Around #format(50)#</option>
</cfoutput>
</select>
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
  <OPTION value="">All Designs</option>
<cfoutput query="typesofearrings">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 

 <CFQUERY DATASOURCE="gemssql" NAME="earringsstones" cachedwithin="#createtimespan(2,0,0,0)#">
		select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='earrings' order by stone
				</cfquery>

        </FORM>
      
<br>BY STONE:
<a href=/gemstone_jewelry_gallery.cfm?category=earrings&amp;>All Stones</a>&nbsp;&nbsp;
<cfoutput query="earringsstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_earrings.cfm' id="earrings_#stone#" > 
        #stone#</a>	
		</cfoutput><br><a href=/gemstone_jewelry_gallery.cfm?category=earrings&amp;>All Stones</a>&nbsp;&nbsp; 

 <a href="/gemstone_jewelry_gallery.cfm?category=earrings&amp;salestatus=3" > 
        <font color="#990000">earrings On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<a href="#"  onMouseDown="javascript:MM_showHideLayers('earringsstones','','hide')"><font color="#FF0000">Close</font></a>]

      <td bgcolor="gray">&nbsp;</td>
    </tr>
    </table>
</div>

<div class="stoneslist" id="necklacesstones" onMouseOver="MM_showHideLayers('necklacesstones' ,'','show')";>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
 
    <tr> 
      <td width="14" bgcolor="gray">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard"><div class="form_heading">Necklaces</div> <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
<input type="hidden" name="category" value="necklaces" />
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
    <OPTION value="">All Designs</option>
<cfoutput query="typesofnecklaces">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 


  <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
      <option  value="" selected >By Color</option>
      <OPTION value="">Select All</option>
      <OPTION value="Black">Black</option>
      <OPTION value="blue">Blue</option>
      <OPTION value="brown">Brown</option>
      <OPTION value="green">Green</option>
      <OPTION value="gray">Gray</option>
      <OPTION value="orange">Orange</option>
      <OPTION value="pink">Pink</option>
      <OPTION value="gray">gray</option>
      <OPTION value="red">Red</option>
      <OPTION value="white">White</option>
      <OPTION value="yellow">Yellow</option>
	        <OPTION value="Multi">Multi-Color</option>
    </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> By Price</option>
<cfoutput>
	<OPTION value="6">Around #format(6)#</option>
	
	<OPTION value="10">Around #format(10)#</option>
	<OPTION value="20">Around #format(20)#</option>
	<OPTION value="30">Around #format(30)#</option>
	<OPTION value="40">Around #format(40)#</option>
	<OPTION value="50">Around #format(50)#</option>
	<OPTION value="75">Around #format(75)#</option>
	<OPTION value="100">Around #format(100)#</option>
</cfoutput>
</select>

  <SELECT class="inputtext" NAME="jewelrysize" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value="">Size Inches</option>
<OPTION value="17">15 to 19</option>
<OPTION value="24">20 to 28</option>
<OPTION value="34">28 to 38</option>
</select>

		  <CFQUERY DATASOURCE="gemssql" NAME="necklacesstones" cachedwithin="#createtimespan(2,0,0,0)#">
				select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='necklaces' order by stone
	    </cfquery>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<!---  <SELECT class="inputtext" NAME="subcat" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >Select Stone</option>
  <OPTION value="">All Stones</option>
<cfoutput query="necklacesstones">
<OPTION value="#stone#">#stone#</option>	
	</cfoutput>
          </select> --->

</FORM>
 
<a href=/gemstone_jewelry_gallery.cfm?category=necklaces&amp;>All Stones</a>&nbsp;&nbsp;
<cfoutput query="necklacesstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_necklaces.cfm' id="pendants_#stone#" > 
        #stone#</a>	
		</cfoutput><br><a href=/gemstone_jewelry_gallery.cfm?category=necklaces&amp;>All Stones</a>&nbsp;&nbsp;

<a href="/gemstone_jewelry_gallery.cfm?category=necklaces&amp;salestatus=3" >
<font color="#990000">necklaces On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('necklacesstones','','hide')"><font color="#FF0000">Close</font></a>]</div> 
    </td>
      <td width="14" bgcolor="gray">&nbsp;</td>
    </tr>
  </table>
</div>

<div class="stoneslist" id="braceletsstones" onMouseOver="MM_showHideLayers('braceletsstones' ,'','show')";  >
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="14" bgcolor="gray">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard"><div class="form_heading">Bracelets</div> <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
<input type="hidden" name="category" value="bracelets" />
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
    <OPTION value="">All Designs</option>
<cfoutput query="typesofbracelets">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 
       

   <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Color</option>
            <OPTION value="">Select All</option>
            <OPTION value="Black">Black</option>
            <OPTION value="blue">Blue</option>
            <OPTION value="brown">Brown</option>
            <OPTION value="green">Green</option>
            <OPTION value="gray">Gray</option>
            <OPTION value="orange">Orange</option>
            <OPTION value="pink">Pink</option>
            <OPTION value="gray">gray</option>
            <OPTION value="red">Red</option>
            <OPTION value="white">White</option>
            <OPTION value="yellow">Yellow</option>
			            <OPTION value="Multi">MultiColor</option>
          </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> By Price</option>
<cfoutput>
	<OPTION value="6">Around #format(6)#</option>
	
	<OPTION value="10">Around #format(10)#</option>
	<OPTION value="20">Around #format(20)#</option>
	<OPTION value="30">Around #format(30)#</option>
	<OPTION value="40">Around #format(40)#</option>
	<OPTION value="50">Around #format(50)#</option>
	<OPTION value="75">Around #format(75)#</option>
	<OPTION value="100">Around #format(100)#</option>
</cfoutput>
</select>
        
       
		 <CFQUERY DATASOURCE="gemssql" NAME="braceletsstones" cachedwithin="#createtimespan(2,0,0,0)#" >
				select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='bracelets' order by stone
	    </cfquery>
</FORM>

<br>		
BY STONE:

<a href=/gemstone_jewelry_gallery.cfm?category=bracelets&amp;>All Stones</a>&nbsp;&nbsp;
<cfoutput query="braceletsstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_bracelets.cfm' id="bracelets_#stone#" > 
        #stone#</a>	
		</cfoutput><br><a href=/gemstone_jewelry_gallery.cfm?category=bracelets&amp;>All Stones</a>&nbsp;&nbsp; <a href="/gemstone_jewelry_gallery.cfm?category=bracelets&amp;salestatus=3" > 
        <font color="#990000">Bracelets On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('braceletsstones','','hide')"><font color="#FF0000">Close</font></a>]</div></td>
      <td width="14" bgcolor="gray">&nbsp;</td>
    </tr>
  </table>
</div>

<div class="stoneslist" id="pendantsstones" onMouseOver="MM_showHideLayers('pendantsstones' ,'','show')";>
  <table width="600" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td width="14" bgcolor="gray">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard"><div class="form_heading">Pendants</div> <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
         <input type="hidden" name="category" value="pendants" />
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
    <OPTION value="">All Designs</option>
<cfoutput query="typesofpendants">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 

 <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Color</option>
            <OPTION value="">Select All</option>
            <OPTION value="Black">Black</option>
            <OPTION value="blue">Blue</option>
            <OPTION value="brown">Brown</option>
            <OPTION value="green">Green</option>
            <OPTION value="gray">Gray</option>
            <OPTION value="orange">Orange</option>
            <OPTION value="pink">Pink</option>
            <OPTION value="gray">gray</option>
            <OPTION value="red">Red</option>
            <OPTION value="white">White</option>
            <OPTION value="yellow">Yellow</option>
			            <OPTION value="Multi">MultiColor</option>
          </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> By Price</option>
<cfoutput>
	<OPTION value="6">Around #format(6)#</option>
	<OPTION value="10">Around #format(10)#</option>
	<OPTION value="20">Around #format(20)#</option>
	<OPTION value="30">Around #format(30)#</option>
	<OPTION value="40">Around #format(40)#</option>
	<OPTION value="50">Around #format(50)#</option>
	<OPTION value="75">Around #format(75)#</option>
	<OPTION value="100">Around #format(100)#</option>
</cfoutput>
</select>

  <SELECT class="inputtext" NAME="jewelrysize" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value="">Size Inches</option>
<OPTION value="0.5">Around 1/2 </option>
<OPTION value="1">Around 1</option>
<OPTION value="1.5">Around 1.5</option>
<OPTION value="2">Around 2</option>
<OPTION value="2.5">Around 2.5</option>
<OPTION value="3">Around 3</option>
</select>

      
        
			 <CFQUERY DATASOURCE="gemssql" NAME="pendantsstones" cachedwithin="#createtimespan(2,0,0,0)#">
				select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='pendants' order by stone
	    </cfquery>
</FORM>
<br>		
BY STONE: <a href=/gemstone_jewelry_gallery.cfm?category=pendants&amp;>All Stones</a><cfoutput query="pendantsstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_pendants.cfm' id="pendants_#stone#" > 
        #stone#</a>	
		</cfoutput>
		   <a href="/gemstone_jewelry_gallery.cfm?category=pendants&amp;salestatus=3" > 
        <font color="#990000">Pendants On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('pendantsstones','','hide')"><font color="#FF0000">Close</font></a>]</div></td>
      <td width="14" bgcolor="gray">&nbsp;</td>
    </tr>
    
  </table>
</div>

<!--- rings --->
<div class="stoneslist" id="ringsstones" onMouseOver="MM_showHideLayers('ringsstones' ,'','show')";  >
  <table width="600" border="0" cellspacing="0" cellpadding="0">
 
    <tr> 
      <td width="14" bgcolor="gray">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard"><div class="form_heading"> Rings</div> <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
	  <input type="hidden" name="category" value="rings" />
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
    <OPTION value="">All Designs</option>
<cfoutput query="typesofrings">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 

  <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
      <option  value="" selected >By Color</option>
      <OPTION value="">Select All</option>
      <OPTION value="Black">Black</option>
      <OPTION value="blue">Blue</option>
      <OPTION value="brown">Brown</option>
      <OPTION value="green">Green</option>
      <OPTION value="gray">Gray</option>
      <OPTION value="orange">Orange</option>
      <OPTION value="pink">Pink</option>
      <OPTION value="gray">gray</option>
      <OPTION value="red">Red</option>
      <OPTION value="white">White</option>
      <OPTION value="yellow">Yellow</option>
	        <OPTION value="Multi">Multi-Color</option>
    </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> By Price</option>
<cfoutput>
	<OPTION value="6">Around #format(6)#</option>
	
	<OPTION value="10">Around #format(10)#</option>
	<OPTION value="20">Around #format(20)#</option>
	<OPTION value="30">Around #format(30)#</option>
	<OPTION value="40">Around #format(40)#</option>
	<OPTION value="50">Around #format(50)#</option>
	<OPTION value="75">Around #format(75)#</option>
	<OPTION value="100">Around #format(100)#</option>
</cfoutput>
</select>

  <SELECT class="inputtext" NAME="ringsize" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value="">Size USA</option>
<OPTION value="0.11">Adjustable</option>
<OPTION value="4">4-5</option>
<OPTION value="5">5-6</option>
<OPTION value="6">6-7</option>
<OPTION value="7">7-8</option>
<OPTION value="8">8-9</option>
<OPTION value="10">9-12</option>

</select>
 <input type='hidden' name='jewelrysize' value="">
 <input type='hidden' name='category' value="rings" class="greenbutton">

		  <CFQUERY DATASOURCE="gemssql" NAME="ringsstones" cachedwithin="#createtimespan(2,0,0,0)#">
				select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='rings' order by stone
	    </cfquery>
		 
<!--- <SELECT class="inputtext" NAME="subcat" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">


            <option  value="" selected >Select Stone</option>
  <OPTION value="">All Stones</option>
<cfoutput query="ringsstones">
<OPTION value="#stone#">#stone#</option>	
	</cfoutput>
          </select>--->

</FORM> 
<br>BY STONE: <a href=/gemstone_jewelry_gallery.cfm?category=rings&amp;>All Stones</a>&nbsp;&nbsp;
<cfoutput query="ringsstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_rings.cfm' id="rings_#stone#" > 
        #stone#</a>	
		</cfoutput>&nbsp; <a href=/gemstone_jewelry_gallery.cfm?category=rings&amp;>All Stones</a><br>
<a href="/gemstone_jewelry_gallery.cfm?category=rings&amp;salestatus=3" >
<font color="#990000">Rings On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('ringsstones','','hide')"><font color="#FF0000">Close</font></a>]</div> 
    </td>
      <td width="14" bgcolor="gray">&nbsp;</td>
    </tr>
    
  </table>
</div>


<div class="stoneslist" id="cufflinksstones" onMouseOver="MM_showHideLayers('cufflinksstones' ,'','show')";>
  <table width="600" border="0" cellspacing="0" cellpadding="0" >
    <tr> 
      <td width="14" bgcolor="gray">&nbsp;</td>
      <td width="500" align="center"  class="noticeboard"><div class="form_heading">Cufflinks</div> <FORM ACTION="/gemstone_jewelry_gallery.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
         <input type="hidden" name="category" value="cufflinks" />
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
    <OPTION value="">All Designs</option>
<cfoutput query="typesofcufflinks">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 

 <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Color</option>
            <OPTION value="">Select All</option>
            <OPTION value="Black">Black</option>
            <OPTION value="blue">Blue</option>
            <OPTION value="brown">Brown</option>
            <OPTION value="green">Green</option>
            <OPTION value="gray">Gray</option>
            <OPTION value="orange">Orange</option>
            <OPTION value="pink">Pink</option>
            <OPTION value="gray">gray</option>
            <OPTION value="red">Red</option>
            <OPTION value="white">White</option>
            <OPTION value="yellow">Yellow</option>
			            <OPTION value="Multi">MultiColor</option>
          </select>
  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value=""> By Price</option>
<cfoutput>
	<OPTION value="6">Around #format(6)#</option>
	<OPTION value="10">Around #format(10)#</option>
	<OPTION value="20">Around #format(20)#</option>
	<OPTION value="30">Around #format(30)#</option>
	<OPTION value="40">Around #format(40)#</option>
	<OPTION value="50">Around #format(50)#</option>
	<OPTION value="75">Around #format(75)#</option>
	<OPTION value="100">Around #format(100)#</option>
</cfoutput>
</select>

  <SELECT class="inputtext" NAME="jewelrysize" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
<option selected value="">Size Inches</option>
<OPTION value="0.5">Around 1/2 </option>
<OPTION value="1">Around 1</option>
<OPTION value="1.5">Around 1.5</option>
<OPTION value="2">Around 2</option>
<OPTION value="2.5">Around 2.5</option>
<OPTION value="3">Around 3</option>
</select>

      
        
			 <CFQUERY DATASOURCE="gemssql" NAME="cufflinksstones" cachedwithin="#createtimespan(2,0,0,0)#">
				select distinct lower(stone) as stone  from CatSubCatInStock where  cat ='cufflinks' order by stone
	    </cfquery>
</FORM>
<br>		
BY STONE: <a href=/gemstone_jewelry_gallery.cfm?category=cufflinks&amp;>All Stones</a><cfoutput query="cufflinksstones">
		&nbsp;&nbsp; <a   href='/#replace(stone, " ","")#_cufflinks.cfm' id="cufflinks_#stone#" > 
        #stone#</a>	
		</cfoutput>
		   <a href="/gemstone_jewelry_gallery.cfm?category=cufflinks&amp;salestatus=3" > 
        <font color="#990000">cufflinks On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div align="right" style="display:inline;">[<a href="#"  onMouseDown="javascript:MM_showHideLayers('cufflinksstones','','hide')"><font color="#FF0000">Close</font></a>]</div></td>
      <td width="14" bgcolor="gray">&nbsp;</td>
    </tr>
    
  </table>
</div>
