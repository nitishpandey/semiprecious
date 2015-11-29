<cfquery name='couponvalidity' datasource='gemssql'>
Select dateused, cartid, ValueUSD from certificatecode where CouponCode='#url.couponcode#'
</cfquery>

<cfif couponvalidity.recordcount GT 0 and couponvalidity.dateused is ''>
Unused,<cfoutput>#couponvalidity.ValueUSD#</cfoutput>
<cfelse>
invalid
</cfif>