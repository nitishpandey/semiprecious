<cfcomponent hint="helps create custom jewelry" output="false">
	<cffunction name="set_stone_type" access="package" output="false" returntype="Any">
		<cfargument name="itemid" type="Numeric" required="true" />
		<cfargument name="stone_group_no." type="Numeric" required="true" />
		<cfargument name="shape" type="String" required="true" />
		<cfargument name="size" type="String" required="true" />
		<cfargument name="count" type="Numeric" default="1" required="false" />
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>

	<cffunction name="get_stones_type" access="package" output="false" returntype="Any">
		<cfargument name="itemid" type="Numeric" required="true" />
		<cfargument name="stone_group_no" type="Numeric" default="1" required="false" />
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>
	

	<cffunction name="get_stone_IHS" access="package" output="false" returntype="Array">
		<cfargument name="stone_name" type="String" required="false" />
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>

	<cffunction name="get_stone_image" hint="gives path of image relative to root" access="package" output="false" returntype="String">
		<cfargument name="stone_name" type="String" required="true" />
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>
<cffunction name="custom_status" access="REMOTE" description="helps toggle mask for a selected item. if not already selected it is adde dto the table" hint="called from zoom page using ajax" output="NO" returntype="STRING">
<cfargument name="itemid" required="YES" type="NUMERIC" />
<cfargument name="category" required="YES" type="string" hint="redundant" />

<cfargument name="todo" default="toggle" required="NO" />
<cfquery datasource="sptm" name="custom_state">
select mask,status from custom_items where imageid = #arguments.itemid#
</cfquery>

<cfswitch expression="#arguments.todo">

<cfcase value="toggle">
<cfif custom_state.recordcount>
<cfif custom_state.mask is 'Y'>
    <cfquery datasource="sptm" name="custom_state">
	    update custom_items set mask = 'N' where imageid = #arguments.itemid#
    </cfquery>
    <cfset return_value = 'N ,' & custom_state.status />
<cfelse>
    <cfquery datasource="sptm" name="custom_state">
    	update custom_items set mask = 'Y' where imageid = #arguments.itemid#
    </cfquery>
        <cfset return_value = 'Y ,' & custom_state.status />
</cfif>
<cfelse>
    <cfquery datasource="sptm" name="custom_state">
	    insert into custom_items (imageid,status,mask,category,dateofupdate,selected_by) values (#arguments.itemid#,'selected','N',#dateformat(now(),'yyyy-mm-dd')#,'#session.apptt#')
    </cfquery>

        <cfset return_value = 'N , selected' />

</cfif>
</cfcase>
<cfcase value="activate">
	<cfif custom_state.recordcount>
        <cfquery datasource="sptm" name="custom_state">
    	    update custom_items set mask = 'N' where imageid = #arguments.itemid#
        </cfquery>

        <cfset return_value = 'N ,' & custom_state.status />

     <cfelse>
          <cfquery datasource="sptm" name="custom_state">
            insert into custom_items (imageid,status,mask,category,dateofupdate,selected_by) values (#arguments.itemid#,'selected','N',#dateformat(now(),'yyyy-mm-dd')#,'#session.apptt#')
	      </cfquery>
			<cfset return_value = 'N , selected' />
          

    </cfif>
</cfcase>
<cfcase value="deactivate">
	<cfif custom_state.recordcount>
        <cfquery datasource="sptm" name="custom_state">
        	update custom_items set mask = 'Y' where imageid = #arguments.itemid#
        </cfquery>
    <cfset return_value = 'Y ,' & custom_state.status />
     
    </cfif>
</cfcase>
</cfswitch>
<cfreturn return_value />
</cffunction>
 	<cffunction name="get_price" access="package" output="false" returntype="Numeric">
		<cfargument name="stone_name" type="String" required="true" />
		<cfargument name="stone_shape" type="String" required="true" />
		<cfargument name="stone_size" type="Numeric" hint="size in mm. the logic will conver to Carat and use a table of price per carat" required="true" />
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>
</cfcomponent>