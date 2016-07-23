<cffunction output="true" returntype="string" name="couponcalc"   >
<cfset chars = 'ts!199234kjhwpr)[77s]+567890abs_kk^^^cedefgefghigjklmnopqrstdefg258uvwxyuierdz32(h12'>
<cfset l = len(chars)>
<cfloop condition="1 eq 1">
<cfset value = "">
	<cfloop from="1" to="7" index="j">
		<cfset p = randrange(1,l)>
		<cfset value = value & mid(chars,p,1)>
	</cfloop>
<cfquery datasource="sptm"  name="valid">
select * from	 bulkbuyercoupons  where code = '#value#'
</cfquery>
<cfif valid.recordcount eq 0>
<cfbreak />
</cfif>
</cfloop>
<cfset value = 'rp' & value>
<cfreturn value>
</cffunction>
<cffunction name="cflocation" >
  <cfargument name="location" type="string" required="yes">
<cflocation url="#arguments.location#" addtoken="yes" />
<cfreturn />
</cffunction>
