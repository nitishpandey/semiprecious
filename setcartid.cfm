   <cfif not session.cartid>
      <!--- to come to confirmation page one has to in each and every case of ecentric shopping
come through cart.cfm  and there this variable will be set to 0  . thus refresh of this page or
return to this page from a paypal's first page will not cause cartid to be incremented --->
      <cflock name="setcartid" type="exclusive" timeout="10">
        <cfset application.cartid = application.cartid + 1>
        <cfset session.cartid = application.cartid >
      </cflock>
      <cfelse>
      <cfquery  datasource="gemssql" name="qpm">
      select paymode from cartstatus where cartid = #session.cartid# 
      </cfquery>
      
  <cfif qpm.paymode neq 'null'>
    
            <cflock name="setcartid" type="exclusive" timeout="10">
          <cfset application.cartid = application.cartid + 1>
          <cfset session.cartid = application.cartid >
        </cflock>
      </cfif>
    </cfif>  
