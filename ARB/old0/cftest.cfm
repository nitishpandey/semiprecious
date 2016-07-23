<cfset myjson = SerializeURLData(1967)>
<cfoutput> #SerializeURLData(1967)# </cfoutput>




<cffunction
	name="SerializeURLData"
	access="public"
	returntype="string"
	output="false"
	hint="Serializes the given data using WDDX. Optionally encodes for URL.">
 
	<!--- Define arguments. --->
	<cfargument
		name="Data"
		type="any"
		required="true"
		hint="ColdFusion struct or array data."
		/>
 
	<cfargument
		name="Encode"
		type="boolean"
		required="false"
		default="true"
		hint="Flag for URL encoded format."
		/>
 
 
	<!--- Create local scope. --->
	<cfset var LOCAL = StructNew() />
 
	<!---
		Serialize the data using WDDX. This will convert the
		ColdFusion data into WDDX standards XML data.
	--->
	<cfwddx
		action="CFML2WDDX"
		input="#ARGUMENTS.Data#"
		output="LOCAL.WDDXData"
		usetimezoneinfo="false"
		/>
 
 
	<!---
		Check to see if we are encoding the data for URL.
		If do this here, then the user has to be carful NOT
		to run URLEncodedFormat() on the returned data
		(that would be like double-escaping it).
	--->
	<cfif ARGUMENTS.Encode>
 
		<!--- Return the encoded data. --->
		<cfreturn URLEncodedFormat(
			LOCAL.WDDXData
			) />
 
	<cfelse>
 
		<!--- Return the data as-is. --->
		<cfreturn LOCAL.WDDXData />
 
	</cfif>
</cffunction>