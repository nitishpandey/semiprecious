   <cffunction name="QueryToList" access="public" returntype="String" output="true"
     hint="This turns a query with a single column into an List">
    

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
