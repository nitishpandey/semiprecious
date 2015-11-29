
<CFQUERY DATASOURCE="gemssql" NAME="typesofearring">
		Select distinct groupname from groupings where cat='earrings'  order by groupname	</cfquery>


<div>
 <FORM ACTION="/earrings.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
          <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Color</option>
            <OPTION value="">All</option>
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
<option selected value="">By Price</option>
<OPTION value="">ALL</option>
<OPTION value="6">About $6</option>
<OPTION value="10">About $10</option>
<OPTION value="20">About $20</option>
<OPTION value="30">About $30</option>
<OPTION value="40">About $40</option>
<OPTION value="50">About $50</option>
<OPTION value="60">About $60</option>
<OPTION value="70">About $70</option>
<OPTION value="80">About $80</option>
<OPTION value="100">About $100</option>
<OPTION value="120">About $120</option>
<OPTION value="150">About $150</option>
</select>
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >By Design</option>
  <OPTION value="">All Designs</option>
<cfoutput query="typesofearring">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 
  

        </FORM>
</div>



