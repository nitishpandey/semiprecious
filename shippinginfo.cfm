<cftry>
    <CFPARAM NAME="shipping" DEFAULT="4.99" />
    <cfparam name="price" default="50" />
    <cfparam name="url.country" default="us" />
    <cfoutput>
	<cfif len(session.bulkbuyer.id)>
            <CFSET shipping= "9.99" />
        </cfif> 

    <cfquery name="getshippingInfo" datasource="gemssql">
        SELECT	*
        FROM	ltbshipping
        WHERE 	lower(country) = Lower('#url.country#')
				AND 	greaterthanorderamount < #price#
				AND		lessthanorderamount >= #price#
				AND active = 1
    </cfquery>
    
    <!---<td  align="left"> 
    	<b>Shipping Options</b>: <br />
	</td>
    <td  align="left" >--->
        <select name="SpecialHandling">
            <cfif getShippingInfo.recordCount gt 0>
                <cfloop query="getShippingInfo">
                	<!---<cfif url.country eq 'USA'>
                    	<cfquery name="getshippingUSInfo" datasource="gemssql">
                            SELECT	*
                            FROM	ltbshipping
                            WHERE 	lower(country) = 'usa'
														AND 	greaterthanorderamount  < #price#
                            AND		greaterthanorderamount <> 0.00
                        </cfquery>
                        
                    	<cfif getshippingUSInfo.shipamount eq '0.00' >
                        	<option value="#Evaluate(decimalFormat(0.00))#">#shipcarrier# | #shipmethod# | $#decimalFormat(0.00)#</option>
                            <cfbreak>
                        <cfelse>
                        	<option value="#Evaluate(decimalFormat(shipamount-shipping))#">#shipcarrier# | #shipmethod# | $#decimalFormat(shipamount)#</option>
                            <cfbreak>
                        </cfif>
                    <cfelse>
                    	<cfif price gt 69>
                    		<option value="#Evaluate(decimalFormat(shipamount))#">#shipcarrier# | #shipmethod# | $#decimalFormat(shipamount)#</option>
                        <cfelse>--->
                        	<option value="#Evaluate(decimalFormat(shipamount))#">#shipcarrier# | #shipmethod# | $#decimalFormat(shipamount)#</option>
                        <!---</cfif>
                    </cfif>--->
                </cfloop>
            </cfif>  
        </select>
    <!---</td>--->
</cfoutput>
<cfcatch type="any">
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>