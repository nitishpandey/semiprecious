
<cfcomponent > <!--- only one method doAction --->
	<cffunction name="doAction" access="remote" returntype="string">
		<cfargument name="actionName" type="string" required="true">
		<cfswitch expression="#Arguments.actionName#" >
		<cfcase value="additem"> 
       <cfset formcollection = structnew() >
       <cfset formcollection = form />
		<cfinvoke component="cart" method="additem" returnvariable="success" argumentcollection="formcontent" />
		</cfcase>
		</cfswitch>
		
		
		
		
		
		<cfset myResult="done">
		<cfreturn myResult>
	</cffunction>
</cfcomponent>