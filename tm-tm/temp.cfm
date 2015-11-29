
			<!---			<cfquery datasource="gemssql" name="cartstatusadd">
				               SELECT  buyer FROM cartstatus WHERE cost =0 and cartid = '83656'
				            </cfquery>
		  <cfdump var="#cartstatusadd#">
		  <cfquery datasource="gemssql" name="cartstatusadd">
		          select paymode from cartstatus  where cartid = '82870' and paymode = 'null' and cost = '0'
	      </cfquery>
		  
		  <cfdump var="#cartstatusadd#">--->
		
		  <cfquery datasource="gemssql" name="ddasd" >
				update  buyingrecord  set cartid =  83252 where  cartid =  83250
		  </cfquery>
		  <cfdump var='#ddasd#' />
