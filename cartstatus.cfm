<cfparam default="indate" name="url.orderby" />
<cfset dsn = 'semiprecious'>
  <Cfoutput> 
    <!--- Practically Unique cartid = #session.cartid2#, --->
    #timeformat(now(),'HH:mm')#</Cfoutput>
  <cfquery datasource="gemssql" name="s">
  select * from cartstatus where indate > #createodbcdate(dateadd('d',-22,createdate(datepart('yyyy',Now()),datepart('m',Now()),datepart('d',Now()))))#  or paymode in ('2co','auth.net','pp','chck') order by 
cartid desc,   <cfif isdefined("url.orderby")> 
#url.orderby# desc
</cfif> 
</cfquery>
	<cfset date = 0>
<cfxml casesensitive="yes" variable="transaction" >
<transaction>
<cfoutput query="s">
<cfif date neq datepart('d',indate) >
<cfset date = datepart('d',indate) />
<dategroup>#date#</dategroup>
</cfif>
        <cartid>#cartid#</cartid>
        <saleprice><a href="itemsell.cfm?cartid=#cartid#&amp;paymode=" title="see list" class="noline" >#cost#</a></saleprice><shipping>#shippingdetails#</shipping>
        <cost>#inrcost#</cost>
        <totalqty>#totalqty#/#noofsaleitems# </totalqty><date>#indate#</date><outdate>#outdate#</outdate>
<tps><cfif tps eq 'y'>y
		<cfelse>n
		</cfif></tps>
		<coupon>
		 #couponcode#</coupon>
		 <paymode>paymode</paymode><origin>
			<cfif status is 'done'>
		<a href="showorigin.cfm?cartid=#cartid#"><span ><!--- on being 'done' itemsell.cfm makes the cartid negative
		in the visitrecord table . just a trick to save on a column,
		since as it is we plan to keep only succesful visits in 
		visitrecord table --->
		<cfquery datasource="gemssql" name="s">
select * from visitrecord where cartid = -1*#cartid#
</cfquery>
(#s.firstpage#)</span></a></origin>
<cfelse>
#status#
		</cfif><buyer><a href="showuserdetails.cfm?email=#buyer#"  >#buyer#</a></buyer>
</cfoutput>
</transaction>
</cfxml>
