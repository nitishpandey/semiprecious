<!---
  --- items_of_interest
  --- -----------------
  ---
  --- author: nitish
  --- date:   3/8/15
  --->
<cfcomponent accessors="true" output="false" persistent="false">


	<cffunction name="get_i_o_i" access="public" output="false" returntype="string">
		<cftry> 
                <cfif isdefined("cookie.i_o_i")>
                    <cfset itemslist = cookie.i_o_i />
                	<cfreturn itemslist />
                </cfif>
		<cfreturn "9044,13159,14915,13588" />
        <cfcatch>
        <cfrethrow />
        </cfcatch>
        </cftry>
	</cffunction>

	<cffunction name="add_i_o_i" access="public" output="false" returntype="void">
		<cfargument name="design_id" type="string" required="true" />
		
		<cfset var i_o_i = get_i_o_i() />    
		<cfif not listfind(i_o_i,arguments.design_id) >
		    <cfset i_o_i = listprepend(i_o_i,arguments.design_id) />
                    <cfif listlen(i_o_i) GT 20>
                        <cfset i_o_i  = listdeleteat(i_o_i,21) />
                    </cfif>
                    <cfcookie expires="never" name="i_o_i" value="#i_o_i#" />
                  </cfif>
		<cfreturn />
	</cffunction>
</cfcomponent>