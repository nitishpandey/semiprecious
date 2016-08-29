
<!--- This test fails. --->

<cfset k = 1 />
<cfoutput>#K# is value of K</cfoutput>
<cfcache action="servercache" timespan="#createtimespan(0,0,0,30)#">
This created at <cfoutput>#createodbcdatetime(Now())#.</cfoutput>
Setting the variable of K to double <cfset K = 2*K />
<cfoutput>#K# is value of K</cfoutput>
Setting y to 0
<cfset y =  0>

</cfcache>

Setting the variable of K to double <cfset K = 2*K />
<cfoutput>#K# is value of K</cfoutput>


<cfoutput>#y# is value of y</cfoutput>

It fails because y is set inside the cache block that does not execute every time.

In same vein, do not cache regions that depend on variables set before outside of them and can change. You can only do so with URL variables because
cfcache does consider that set to decide to execute or not execute.

