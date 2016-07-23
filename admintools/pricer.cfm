
			<!---			<cfquery datasource="gemssql" name="cartstatusadd">
				               SELECT  buyer FROM cartstatus WHERE cost =0 and cartid = '83656' <!---AND paymode='null' and paymode is not null--->
				            </cfquery>
		  <cfdump var="#cartstatusadd#">
		<!---  <cfquery datasource="gemssql" name="cartstatusadd">
		          select paymode from cartstatus  where cartid = '82870' and paymode = 'null' and cost = '0'
	      </cfquery>
		  
		  <cfdump var="#cartstatusadd#">--->
		  	<cfquery datasource="gemssql" name="cartstatusadd">
				               SELECT  buyer FROM cartstatus WHERE cost >0 and cartid = '83656' <!---AND paymode='null' and paymode is not null--->
				            </cfquery>
		  <cfdump var="#cartstatusadd#">
		  <cfquery datasource="gemssql" name="cartstatusadd">
				               SELECT  buyer FROM cartstatus WHERE cost <>0 and cartid = '83656' <!---AND paymode='null' and paymode is not null--->
				            </cfquery>
		  <cfdump var="#cartstatusadd#">
		  use the pricing formula only for active retail price and sale can be 70% of that + wt*3/45--->
		  <cfscript>
	    p = 0 ;
		s = 0 ;
		w = 1 ;
		  weight_factor = 1.6 ;
		  freight_factor = 1.071;
          params = arraynew(1);
		  params[1]["LOWer"] = 0;
		  params[1]["multiplier"] = 0;
		  params[1]["sales_multiplier"] = 0;
		  params[1]["ws_multiplier"] = 0;
		  params[1]["on"] = 0;
		  
		  params[2]["LOWer"] = 0;
		  params[2]["multiplier"] = 5;
		  params[2]["sales_multiplier"] = 4;
		  params[2]["ws_multiplier"] = 1.7;
		  params[2]["on"] = 1;
		  
		  params[3]["lower"] = 200;
		  params[3]["multiplier"] = 4;
		  params[3]["sales_multiplier"] = 2.9;
		  params[3]["ws_multiplier"] = 1.65;
		  params[3]["on"] = 1;
		  
		  params[4]["lower"] = 500;
		  params[4]["multiplier"] = 3;
		  params[4]["sales_multiplier"] = 2.05;
		  params[4]["ws_multiplier"] = 1.6;
		  params[4]["on"] = 1;
		  
		  params[5]["lower"] = 1000;
		  params[5]["multiplier"] = 2.5;
		  params[5]["sales_multiplier"] = 1.52;
		  params[5]["ws_multiplier"] = 1.5;
		  params[5]["on"] = 1;
		  
		  params[6]["lower"] = 141000;
		  params[6]["on"] = 0;
		  
		  function accel(j) {
		  return 1;
		  /* (1+(j-1)/10); */
		  }
		  </cfscript>
	
<cfif isdefined("url.action")> 
runningg
		  <cfloop from="1" to="#arraylen(params)#" index="j">
		  <cfif params[j]["on"]>

	<cfquery datasource="gemssql" name="qprice">
	
    	update items set  <cfif p> price = ((#params[j]["multiplier"]#*(basecost-#params[j]["lower"]#)+ #accel(j)#*#params[j]["lower"]#*#params[j-1]["multiplier"]#)*#freight_factor#+#weight_factor#*weight)/#application.exchangerate#,</cfif>
		<cfif s>           saleprice =((#params[j]["sales_multiplier"]#*(basecost-#params[j]["lower"]#)+#accel(j)#*#params[j]["lower"]#*#params[j-1]["sales_multiplier"]#)*#freight_factor#+#weight_factor#*weight)/#application.exchangerate#,</cfif>
		<cfif w>		   WHOLESALEPRICE =((#params[j]["ws_multiplier"]#*(basecost-#params[j]["lower"]#)+#accel(j)#*#params[j]["lower"]#*#params[j-1]["ws_multiplier"]#)*#freight_factor#+#weight_factor#*weight)/#application.exchangerate#,</cfif>  
				  status = status where basecost >= #PARAMS[j]["lower"]# and basecost < #PARAMS[j+1]["lower"]# and cat <> 'beads' and storage <> 'Angela' and supplier not like 'OC%'
    </cfquery>
	</cfif>
	</cfloop>





	...over and done ...hope all is well.
	</cfif>
	Please append "action" to URL to run this pricer
	<cfdump var="#params#" />
	<cfoutput>S#s#, p#p#, w#w#, wf:#weight_factor#, f#freight_factor#</cfoutput>
