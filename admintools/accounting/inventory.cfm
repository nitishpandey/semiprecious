

<h3>    ACCOUNTING: Inventory</h3>

	<cfquery name="indiainstock" datasource="gemssql">
	 Select Cost from AccountingInventoryCostIndia
    </cfquery> 
<p>
Total Cost of Items in India: Rs <cfoutput query="indiainstock">#cost#</cfoutput>

	<cfquery name="indiainstock" datasource="gemssql">
	 Select Cost from AccountingInventoryCostUSA
    </cfquery> 
<p>
Total Cost of Items in USA: Rs <cfoutput query="indiainstock">#cost#</cfoutput>


<p>
Inventory by Category, owned by semiprecious:<br>

	<cfquery name="indiainstock" datasource="gemssql">
	 Select CAt, Count from AccountingInstockOuritems
    </cfquery> 
	
			  <cfset sumi = 0>
<cfoutput query="indiainstock">
		  #CAT#				 #Count#<br>
		  <cfset sumi = sumi+count>
		  </cfoutput><br>
		  <cfoutput>TOTAL: #sumi#</cfoutput>
<p>
<p>
Inventory by Category, stock in India:<br>

	<cfquery name="indiainstock" datasource="gemssql">
	 Select CAt, Count from AccountingInstockIndia
    </cfquery> 
	
			  <cfset sumi = 0>
<cfoutput query="indiainstock">
		  #CAT#				 #Count#<br>
		  <cfset sumi = sumi+count>
		  </cfoutput><br>
		  <cfoutput>TOTAL: #sumi#</cfoutput>
<p>

<p>
Inventory by Category, stock in USA:<br>

	<cfquery name="indiainstock" datasource="gemssql">
	 Select CAt, Count from AccountingInstockUSA
    </cfquery> 
	
			  <cfset sumi = 0>
<cfoutput query="indiainstock">
		  #CAT#				 #Count#<br>
		  <cfset sumi = sumi+count>
		  </cfoutput><br>
		  <cfoutput>TOTAL: #sumi#</cfoutput>
<p>


Inventory by Category, owned by Angela:<br>

	<cfquery name="indiainstock" datasource="gemssql">
	 Select CAt, Count from AccountingInventoryAngela
    </cfquery> 
	
			  <cfset sumi = 0>
<cfoutput query="indiainstock">
		  #CAT#				 #Count#<br>
		  <cfset sumi = sumi+count>
		  </cfoutput><br>
		  <cfoutput>TOTAL: #sumi#</cfoutput>
		  
		  