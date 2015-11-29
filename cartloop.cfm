   <cfquery datasource="gemssql" name="currentcart">
           SELECT * FROM buyingrecord WHERE cartid = 69813
          </cfquery>
		  
		  
     <cfloop  query="currentcart">
	            <cfset session.cartitem[currentrow][1] = currentcart.itemid>
            <cfquery datasource="gemssql" name="catcheck">
                    SELECT cat FROM Items WHERE newitem = '#currentcart.itemid#'
                  </cfquery>
            <cfset session.cartitem[currentrow][2] =catcheck.cat>
            <cfset session.cartitem[currentrow][3] =currentcart.rate>
            <cfset session.cartitem[currentrow][4] =currentcart.quantity>
            <cfset session.cartitem[currentrow][5] =currentcart.optionid>
<cfoutput>#currentrow#, #session.cartitem[currentrow][1]#</cfoutput>
 			         </cfloop>