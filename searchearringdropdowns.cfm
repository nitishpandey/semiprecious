
<CFQUERY DATASOURCE="gemssql" NAME="typesofearring">
		Select distinct groupname from groupings where cat='earrings'  order by groupname	</cfquery>


<div>
 <FORM ACTION="/earrings.cfm" method="get" name="srchfrm"  style="display:inline;margin:4px;">
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
<OPTION value="">ALL</option>
<OPTION value="6">Around $6</option>
<OPTION value="10">Around $10</option>
<OPTION value="20">Around $20</option>
<OPTION value="30">Around $30</option>
<OPTION value="40">Around $40</option>
<OPTION value="50">Around $50</option>
<OPTION value="60">Around $60</option>
<OPTION value="70">Around $70</option>
<OPTION value="80">Around $80</option>
<OPTION value="100">Around $100</option>
<OPTION value="120">Around $120</option>
<OPTION value="150">Around $150</option>
</select>
  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
            <option  value="" selected >Select Type</option>
  <OPTION value="">All Designs</option>
<cfoutput query="typesofearring">
            <OPTION value="#groupname#">#groupname#</option>
</cfoutput>
          </select> 
  

        </FORM>
</div>



