<cftry>
  <cfparam name="page_no" default="1" type="numeric" >
<cfparam name="maxrows" default="30" type="numeric" >
<cfparam name="category" type="string" default="" >

<cfquery datasource="sptm" debug="true" name="get" blockfactor="20">
select imageid from custom_items <cfif len(category)> where category = '#category#' </cfif> order by imageid
</cfquery>

<cfset start = maxrows*(page_no-1)+1 />
<cfinvoke method="querytolist" component="custom" returnvariable="itemid_list"  >
  <cfinvokeargument name="Data" value="#get#" />
  <cfinvokeargument name="Size" value="#maxrows#" />
  <cfinvokeargument name="Start" value="#start#" />
</cfinvoke>

<cfif len(itemid_list)>
<cfquery datasource="sptm" debug="true" name="get2" blockfactor="20">
select * from custom_items where imageid in (#itemid_list#) order by category, imageid, status, mask
</cfquery>
Custom Items: <br />
<cfoutput query="get2" startrow="#evaluate(maxrows*(page_no-1)+1)#" maxrows="#maxrows#" >
#category#<a href="/admintools/edititem.cfm?newitem=#imageid#" target="edit"  >#imageid#</a> <img src="/images/#category#/#imageid#.jpg" width="70"> <a href="add_metadata.cfm?image=#imageid#&category=#category#" target="edit"  >#status#</a>  ,   <cfif status neq 'initiated'> 	<a href="http://www.semiprecious.com/customrequest/build_layers_IHS.cfm?image=#imageid#&category=#category#" target="edit"  >Build / Re-Build Layers</a> <img src="/images/custom/#category#/#imageid#.png" width="70"></cfif>
<br />

	
</cfoutput>
<cfelse>
Not custom item requests found.
</cfif>
<cfcatch type="any">
<cfdump var='#cfcatch#' />
<cfoutput>#cfcatch.message#</cfoutput>
</cfcatch>
</cftry>


