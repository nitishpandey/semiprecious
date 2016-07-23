
<cfif isdefined("form.email")>

<cfquery datasource="gemssql" name="d">
select cartid,email,firstname ,state,phonenumber from purchase where email like '%/#form.email#' or  firstname like '%#form.email#%'
</cfquery>
<Cfif d.recordcount>

<cfoutput  query="d"><br /><cfif isdefined("form.withdates")>
<cfquery datasource="gemssql" name="dt">
select indate,paymode,status,cost from cartstatus where cartid = #cartid#
</cfquery>
#dateformat(dt.indate,'mm/dd/yy')#/#dt.paymode#/#dollarformat(dt.cost)#/#dt.status#: </cfif>
<A href="/itemsell.cfm?cartid=#cartid#">#cartid#</A>#email#  - #firstname# /#phonenumber#/(#state#)
</cfoutput>

<cfelse>
<cfquery datasource="gemssql" name="d">
select cartid,email,firstname ,state,phonenumber from purchase where email like '%/#form.email#%' or  firstname like '%#form.email#%'
</cfquery>

<cfoutput  query="d"><br />
<cfif isdefined("form.withdates")>
<cfquery datasource="gemssql" name="dt">
select indate,paymode,status,cost from cartstatus where cartid = #cartid#
</cfquery>
#dateformat(dt.indate,'mm/dd/yy')#/#dt.paymode#/#dollarformat(dt.cost)#/#dt.status#: </cfif>

<A href="/cartview.cfm?cartid=#cartid#">#email#/#firstname# /#phonenumber#/(#state#)</A>
</cfoutput>
</Cfif>

 <cfquery datasource="sptm" name="valid">
    select minamt , email, address,membershipdate,status from bulkbuyers where 
    email like '#left(form.email,6)#%' 
    </cfquery>
<p>Bulk: 
<cfoutput query="valid">
#valid.email#
</cfoutput>
</cfif>


