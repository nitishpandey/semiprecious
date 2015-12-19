<!--- called as a cusTom tage in shopping pages --->
<cfif 0>
<cfif thistag.executionmode  is 'end'><div  style="color:#A5A5A8;background-color:white;margin-top:2px;" >
<span style="background-color:#226;color:#FFF;padding:1px;">Shopping Steps &rarr;</span>  
<cfswitch expression="#attributes.step#">
<cfcase value="0">
Search <> Add To Cart > Check Cart > Shipping Details > Select Payment Mode > Pay
</cfcase>
<cfcase value="1">
<span class="this_step">Search</span> > Add To Cart > Check Cart > Shipping Details > Select Payment Mode > Pay
</cfcase>
<cfcase value="2">
Search > <span class="this_step">Add To Cart</span> > Check Cart > Shipping Details > Select Payment Mode > Pay
</cfcase>
<cfcase value="4">
Search > Add To Cart > Check Cart > <span class="this_step">Shipping Details</span> > Select Payment Mode > Pay
</cfcase>
<cfcase value="5">
Search > Add To Cart > Check Cart > Shipping Details > <span class="this_step">Select Payment Mode</span> > Pay
</cfcase>
<cfcase value="3">
Search <> Add To Cart > <span class="this_step">Check Cart </span>> Shipping Details > Select Payment Mode > Pay
</cfcase>
</cfswitch></div></cfif>
</cfif>