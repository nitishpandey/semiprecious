<!---
  --- jewelry_item
  --- ------------
  --- 
  --- Used by jewelry_item.cfm in the main folder. All content creation done here. Rendering and structur of placement done in main jewelry_item.cfm
  --- 
  --- author: nitish
  --- date:   20/12/15
  --->
<cfcomponent displayname="jewelry_item backing bean" hint="Used by jewelry_item.cfm in the main folder. All content creation done here. Rendering and structur of placement done in main jewelry_item.cfm" accessors="false" output="false" persistent="false">

	<cfproperty name="item_id" type="any" />

	<cffunction name="getItem_id" access="public" output="false" returntype="any">
		<cfreturn item_id />
	</cffunction>

	<cffunction name="setItem_id" access="public" output="false" returntype="void">
		<cfargument name="item_id" type="any" required="true" />
		<cfset item_id = arguments.item_id />
	</cffunction>

	<cffunction name="init" access="public" output="false" returntype="jewelry_item">
		<cfargument name="item_id" type="string" required="true" />
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>
</cfcomponent>