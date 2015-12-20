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

	<cffunction name="get_item_id" access="public" output="false" returntype="any">
		<cfreturn variables.item_id />
	</cffunction>

	<cffunction name="setItem_id" access="public" output="false" returntype="void">
		<cfargument name="item_id" type="any" required="true" />
		<cfset item_id = arguments.item_id />
	</cffunction>

	<cffunction name="init" access="public" output="false" returntype="backing_beans.jewelry_item">
		<cfset variables.item_id = '' />

		<cfif not isdefined("url.itemnumber")  and not isdefined("url.newitem")>
                  <cfif Find('/', pattern) gt 0>
                                  <cfset  underscore = find('_',pattern,1)>
                                      <cfif underscore>
                                                    <CFSET itemnumber = mid(pattern,2, underscore-2) />
                                        <cfelse>
                                                    <cfset  underscore = find('.htm',pattern,1) />
                                                        <cfif underscore>
                                                              <CFSET itemnumber = mid(pattern,2, underscore-2) />
                                                          <cfelse>
                                                              <CFSET itemnumber = mid(pattern,2, len(pattern)-2) />
                                                       </cfif>
                                      </cfif>
                                  <cfset newitem = itemnumber />
                          <cfelse>
                                <cfif isdefined("url.itemnumber")>
                                        <cfset newitem = url.itemnumber />

                                    <cfelse>
                                       <cfset newitem = url.newitem />

                                  </cfif>
								<cfset itemnumber = newitem />

                      </cfif>
        <cfelse>
                                      <cfset newitem = 16435/>
                                       <cfif isdefined("url.itemnumber")>
                                            <cfset newitem = url.itemnumber />
                                    <cfelse>
                                           <cfset newitem = url.newitem />
                                  </cfif>
    </cfif>
	  <cfset variables.item_id = newitem />
		<cfreturn this />
	</cffunction>
</cfcomponent>