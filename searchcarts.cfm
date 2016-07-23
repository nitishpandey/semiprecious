
<cfif isdefined("form.email")>

<cfquery datasource="gemssql" name="d">
	select cartid,email,firstname ,state,phonenumber from purchase where email like '%/#form.email#' or  firstname like '%#form.email#%' order by cartid desc
</cfquery>
<cfif not d.recordcount>
    <cfquery datasource="gemssql" name="d">
    	select cartid,email,firstname ,state,phonenumber from purchase where email like '%/#form.email#%' or  firstname like '%#form.email#%' order by cartid desc
    </cfquery>
</cfif>
<cfset predicate =  '' />

<table class=""><tr class="biggreenwhite"><td>Email</td><td>Date</td><td>Paid?</td><td>Value</td><td>Status</td><td>Cart</td><td>Name</td><td>Phone</td><td>State</td></tr>
<cfoutput  query="d">
	<cfset predicate = predicate & ' and cartid <> ' & cartid  />
    <cfif isdefined("form.withdates")>
        <cfquery datasource="gemssql" name="dt">
	        select indate,paymode,status,cost from cartstatus where cartid = #cartid# and paymode <> 'emptied' and paymode <>'activated'
        </cfquery>
        <cfif dt.recordcount>
    		<tr><td>#right(d.email,len(d.email)-find('/',d.email))# </td><td>#dateformat(dt.indate,'mm/dd/yy')#</td><td>#dt.paymode#</td><td>#dollarformat(dt.cost)#</td><td>#dt.status#</td><td><A href="/cartview.cfm?cartid=#cartid#">#cartid#</a></td><td>#firstname#</td><td>#phonenumber#</td><td>#state#</td></tr>
	    </cfif>
    </cfif>
</cfoutput>

<cfquery datasource="gemssql" name="dt">
	select indate,paymode,status,cost ,cartid from cartstatus where buyer = '#form.email#' #predicate# and paymode <> 'emptied' and paymode <>'activated'
</cfquery>

<cfoutput  query="dt">
    <cfquery datasource="gemssql" name="d">
    select cartid,email,firstname ,state,phonenumber from purchase where cartid = #dt.cartid#
    </cfquery>
<cfif isdefined("form.withdates")>
<tr><td><cfif len(d.email)>#right(d.email,len(d.email)-find('/',d.email))#</cfif> </td><td>#dateformat(dt.indate,'mm/dd/yy')#</td><td>#dt.paymode#</td><td>#dollarformat(dt.cost)#</td><td>#dt.status#</td><td><A href="/cartview.cfm?cartid=#cartid#">#cartid#</a></td><td>#d.firstname#</td><td>#d.phonenumber#</td><td>#d.state#</td></tr>
</cfif>
</cfoutput>

</table>

 <cfquery datasource="sptm" name="valid">
    select minamt , email, address,membershipdate,status from bulkbuyers where 
    email like '#left(form.email,6)#%' or email like '%#right(form.email,12)#' 
    </cfquery>
    <cfif session.mail is application.admin_email>
<p><span class="action0">Similar Emails Registered as bulk:</span> <br />
<cfoutput query="valid" maxrows="8">
  #valid.email#
</cfoutput>
</cfif>
</cfif>


