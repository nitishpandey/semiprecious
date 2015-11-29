<cfhttp url="http://www.essentialsjewelry.com/stock/smithsonite/smithsonite-rings/smithsonite-rings.html"
result="rawproducts" method="get">
<!--- how many products? --->
<cfset rowCount = listLen(rawproducts,'>$')

<cfloop from ="2" to="10" index="i">

<cfset thisRow = listGetAt(rawproducts,i,'>$')>


<cfoutput>#thisrow#</cfoutput>




</cfloop>																						   )>