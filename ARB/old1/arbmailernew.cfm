<cfset arb = 1>
<cfset cartid = 12345>



<!--- <cfdump var="#cart#">  --->

<!--- EMPTY THE CART BELOW --->
<CFSET session.cartitem=ArrayNew(2)  />
<Cfset session.cartitem[1][1] = 0  />
<Cfset session.cartitem[1][4] = 0  />
<cfset session.totalqty = 0>
<cfset session.grandtotal = 0>
<!--- cflocation addtoken="no" url="http://www.semiprecious.com/cart.cfm"  / --->



<!--- EMPTY THE CART BELOW  AND SEND A FORM POSTING THE INFO --->
<form action="http://www.semiprecious.com/cart_ARB.cfm" method="post" name="theForm" id="theForm">
<input type="hidden" name="arb" value="<cfoutput>#arb#</cfoutput>">
<input type="hidden" name="cartid" value="<cfoutput>#cartid#</cfoutput>">
</form>

<script>
document.theForm.submit();
</script>



         