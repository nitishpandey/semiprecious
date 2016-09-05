<cfcomponent hint="helps create custom jewelry" output="false">
   <cffunction name="QueryToList" access="public" returntype="String" output="true"     hint="This turns a query with a single column into an List">
     <!--- Define arguments. --->
     <cfargument name="Data" type="query" required="yes" />
     <cfargument name="size" type="numeric" required="no" default="0" />
     <cfargument name="start" type="numeric" required="no" default="1" />

<cfif not arguments.size>
	<cfset arguments.size = data.recordcount />
</cfif>

     <cfscript>
     // Define the local scope.
     var LOCAL = StructNew();


     // Get the column names as an List.


     // Create an List that will hold the query equivalent.
     LOCAL.QueryList = "";


     // Loop over the query.
     for (LOCAL.RowIndex = Arguments.start ; LOCAL.RowIndex LTE  (Arguments.start + Arguments.size -1) AND  (LOCAL.RowIndex LTE  Arguments.data.recordcount) ; LOCAL.RowIndex = (LOCAL.RowIndex + 1))
     {
   Local.QueryList = ListAppend( LOCAL.QueryList, Arguments.data[listgetat(Arguments.data.Columnlist,1)][Local.rowindex]);
         }


     // Return the List equivalent.
     return( LOCAL.QueryList );


     </cfscript>
     </cffunction>
	<cffunction name="get_color_codes" access="package" output="false" returntype="string" >
		<cfquery datasource="sptm" name="cc">
			select color_code from stone_color_codes
		</cfquery>
<cfinvoke method="querytolist" component="custom" returnvariable="color_list"  >
  <cfinvokeargument name="Data" value="#cc#" />
</cfinvoke>
<cfreturn color_list />
	</cffunction>
<cffunction name="set_stone_type" access="package" output="false" returntype="Any">
		<cfargument name="itemid" type="Numeric" required="true" />
		<cfargument name="stone_group_no" type="Numeric" required="true" />
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
<cffunction name="custom_status" access="REMOTE" returnformat="json" description="helps toggle mask for a selected item. if not already selected it is adde dto the table" hint="called from zoom page using ajax" output="NO" returntype="STRING">
<cfargument name="itemid" required="YES" type="NUMERIC" />
<cfargument name="category" required="no" type="string" hint="redundant" />
<cfargument name="status"  required="NO" type="string" default="" hint="without this value, the function serves as a getter" />

<cfquery datasource="sptm" name="custom_state">
select mask,status from custom_items where imageid = #arguments.itemid#
</cfquery>
<cfif custom_state.recordcount is 0 >
 <cfset custom_state.status = '' />
 <cfset custom_state.mask = '' />

</cfif>

	<cfif not len(arguments.status)>
		<cfset result = '#custom_state.status#, #custom_state.mask#' />
		<cfreturn result />
	</cfif>

<cftry>

<cfswitch expression="#arguments.status#">
<cfdefaultcase>
Nothing to do
</cfdefaultcase>
<cfcase value="initiated">
	<cfif custom_state.recordcount>
		<cfif custom_state.status eq "colored">
             <cfquery datasource="sptm" name="custom_state"><!--- so that we go only one stage back --->
                update custom_items set status = 'initiated' where imageid = #arguments.itemid#
            </cfquery>
	    </cfif>

    <cfelse>

        <cfquery datasource="sptm" name="custom_state">
            insert into custom_items (imageid,status,mask,category,dateofupdate,selected_by) values (#arguments.itemid#,'initiated','N','#Arguments.category#','#dateformat(now(),'yyyy-mm-dd')#','#session.apptt#')
        </cfquery>
   </cfif>
</cfcase>

<cfcase value="colored">
	<cfif custom_state.recordcount>
		<cfif custom_state.status eq "initiated" or custom_state.status eq "layered" ><!--- layered is the auto process to be invoked manually since it uses js --->
             <cfquery datasource="sptm" name="custom_state"><!--- so that we go only one stage back --->
                update custom_items set status = 'colored' where imageid = #arguments.itemid#
            </cfquery>
	    </cfif>
         </cfif>
</cfcase>
<cfcase value="layered">
	<cfif custom_state.recordcount>
		<cfif custom_state.status eq "colored" or custom_state.status eq "metadata" ><!--- layered is the auto process to be invoked manually since it uses js --->
             <cfquery datasource="sptm" name="custom_state"><!--- so that we go only one stage back --->
                update custom_items set status = 'layered' where imageid = #arguments.itemid#
            </cfquery>
	 </cfif>
  </cfif>
</cfcase>

<cfcase value="metadata">
	<cfif custom_state.recordcount>
		<cfif custom_state.status eq "layered"  ><!--- layered is the auto process to be invoked manually since it uses js --->
             <cfquery datasource="sptm" name="custom_state"><!--- so that we go only one stage back --->
                update custom_items set status = 'metadata' where imageid = #arguments.itemid#
            </cfquery>
	 </cfif>
  </cfif>
</cfcase>

<cfcase value="mask">
	<cfif custom_state.recordcount>
	 <cfquery datasource="sptm" name="custom_state">
	    update custom_items set mask = 'Y' where imageid = #arguments.itemid#
    </cfquery>
   </cfif>
</cfcase>
<cfcase value="unmask">
<cfif custom_state.recordcount>
	 <cfquery datasource="sptm">
	    update custom_items set mask = 'N' where imageid = #arguments.itemid#
    </cfquery>
   <cfelse>
    <cfquery datasource="sptm" >
	    insert into custom_items (imageid,status,mask,category,dateofupdate,selected_by) values (#arguments.itemid#,'initiated','N','#dateformat(now(),'yyyy-mm-dd')#','#session.apptt#')
    </cfquery>

   </cfif>
</cfcase>

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
	    insert into custom_items (imageid,status,mask,category,dateofupdate,selected_by) values (#arguments.itemid#,'selected','N','#Arguments.category#','#dateformat(now(),'yyyy-mm-dd')#','#session.apptt#')
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
            insert into custom_items (imageid,status,mask,category,dateofupdate,selected_by) values (#arguments.itemid#,'initiated','N','#Arguments.category#','#dateformat(now(),'yyyy-mm-dd')#','#session.apptt#')
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
<cfquery datasource="sptm" name="custom_state">
	select mask,status from custom_items where imageid = #arguments.itemid#
</cfquery>
<cfdump var='#custom_state#' />
<cfset return_value = '#custom_state.status#, #custom_state.mask#' />
<cfcatch type="any"><cfoutput>#cfcatch.message#, #cfcatch.sql#, #cfcatch.detail#</cfoutput><cfabort /></cfcatch></cftry>
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