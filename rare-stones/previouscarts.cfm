<cfparam name=buyeremail default="">
<cfif buyeremail contains "@" or session.mail contains '@' and not (session.mail contains 'guest')>
	<cfset buyeremail=session.mail>
<cfquery datasource="gemssql" name="getcarts">
		Select cartid, paymode from cartstatus where buyer='#buyeremail#' and paymode <>'emptied' and paymode <>'activated'  and cartid <> '#session.cartid#'
</cfquery>

<font color=red>Your Previous Cart IDs:</font> 
<cfif getcarts.recordcount gt 0>
<br />
<cfoutput query="getcarts" startrow="1" maxrows="4" >(#currentrow#) #Cartid#
<a href=/itemsell.cfm?cartid=#cartid# target="cart_window" class="side_link">View in a new window</a> 
 
<cfif paymode neq 'null'> Paid<cfelse><a class="login_link" href=/activate_cart.cfm?cartid=#Cartid#>Re-activate as new cart (items get added to your current cart, if any)</a></cfif> | | <br />
</cfoutput>
<cfelse>
	None. Looks like you are shopping with us for the first time. We encourage you to get in touch with us if you have any concern or queries.
</cfif>
<cfelse>
Sign up with your email id. Using you email id our online store software will help you save your shopping carts and then you can shop over several hours and days.
</cfif>
