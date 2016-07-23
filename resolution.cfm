<cfquery datasource="semiprecious" name="s">
select * from properties 
</cfquery>

<cftry>
<cfoutput>Appcartid:#application.cartid#, #now()#. <cfset session.cartid2 = application.cartid></cfoutput>
<cfset total = 0>
<font  verdana>
<cfoutput query='s'>
#pname# &nbsp;= #pvalue# &nbsp;|&nbsp;
<!--- <cfif find('width',pname)>
<cfset total = total + pvalue>
</cfif> --->
</cfoutput>
</font>
<cfoutput><br>
<!--- Visitors:#total#, ---> </cfoutput>
<cfcatch type="application">
The application.cartid is not defined. Seems like the server restarted or the application variable faded out dueto
time limit on vaildity (like session variables but these have nothing to do with idle time).
<cfinclude template="uniquecartid.cfm"><br>

Now just refresh.

</cfcatch>
<cfcatch type="any">
abscence of applicaiton.cartid is not an applicaition type exception.
<cfinclude template="uniquecartid.cfm"><br>
</cfcatch>
</cftry>
<a href="admin.cfm">Admin page</a>, <br>
   ,<a href="/">Site Home page</a>, <a href="cartstatus21.cfm">carts page</a>, <a href="visitcheck.cfm">Visits</a>