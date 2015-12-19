<!--- This include file fetches groupnames/themes --->
<cfif isdefined("categ")>
<cfif categ is "">
<cfset categ = "all">
</cfif>
<Cfset category  = categ />
</cfif>
<cfparam name=category default="all">

<cfquery name="getgroupnames" datasource="gemssql">
select itemsbygroup.groupname,count(*) k 
from (select itemid, groupings.GroupName , hubsequence from ItemsByGroup, groupings where 
groupings.GroupName=itemsbygroup.groupname 
 <cfif category neq "All" and category neq "jewelry" and category neq "">
and category = '#category#'
<cfelse>
and  category<>'gems' and category <> 'beads' and category <> 'healing'
</cfif>
and hubsequence<20 ) ItemsByGroup, (select newitem, inventory from items where inventory>0) items
 where ItemsByGroup.itemid=newitem

group by ItemsByGroup.groupname having COUNT(*)>5 
order by ItemsByGroup.groupname
</cfquery>
<cfset counter1 = round(getgroupnames.recordcount/3)>

<cfoutput>
<ul>
	<li><a href="##">Themes</a>
        <ul>
            <cfloop query="getgroupnames" startrow="1" endrow="#counter1#">
                
                    <li>
                        <a  href="/shaped/#lcase(groupname)#-gemstone-<cfif category neq "All" and category neq "jewelry" >#lcase(category)#<cfelse>jewellery</cfif>.cfm">
                            #Left( UCase(groupname), 1 )##Right( LCase( groupname), Len( groupname ) - 1 )# 
                            <cfif category neq 'All' and len(groupname) lt 7>#titlecase(category)#</cfif>
                        </a>
                    </li> 
            </cfloop>
        </ul>
	</li>
    <li>
    	<ul>
        	<cfloop query="getgroupnames" startrow="#Evaluate('counter1+1')#" endrow="#Evaluate('2*getgroupnames.recordcount/3')#">
                    <li>
                        <a  href="/shaped/#lcase(groupname)#-gemstone-<cfif category neq "All" and category neq "jewelry" >#lcase(category)#<cfelse>jewellery</cfif>.cfm">
                            #Left( UCase(groupname), 1 )##Right( LCase( groupname), Len( groupname ) - 1 )# 
                            <cfif category neq 'All' and len(groupname) lt 7>#titlecase(category)#</cfif>
                        </a>
                    </li> 
                
            </cfloop>
        </ul>
	</li>
    <li>
    	<ul>
        	<cfloop query="getgroupnames" startrow="#Evaluate('2*getgroupnames.recordcount/3+1')#" endrow="#getgroupnames.recordcount#">
                    <li>
                        <a  href="/shaped/#lcase(groupname)#-gemstone-<cfif category neq "All" and category neq "jewelry" >#lcase(category)#<cfelse>jewellery</cfif>.cfm">
                            #Left( UCase(groupname), 1 )##Right( LCase( groupname), Len( groupname ) - 1 )# 
                            <cfif category neq 'All' and len(groupname) lt 7>#titlecase(category)#</cfif>
                        </a>
                    </li> 
                
            </cfloop>
        </ul>
	</li>
</ul>
</cfoutput>