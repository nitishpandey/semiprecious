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

	<cffunction name="getItemId" access="public" output="false" returntype="any">
		<cfargument name="_URL" required="true">
		<cfset var pattern = arguments._URL />
		<cfset var newitem = "" />
		<cfset var underscore = "" />
		<CFSET var itemnumber = "" />
		<cfparam default="" name="designer" type="string" />
		<cfif designer neq "" >
			<cfset itemnumber=designer>
			<cfset url.newitem=designer>
			<cfset url.itemnumber=designer>
		</cfif>
		<cfif not isdefined("url.itemnumber")  and not isdefined("url.newitem")>
			<cfif Find('/', pattern) gt 0>
				<cfset  underscore = find('_',pattern,1)>
				<cfif underscore>
					<CFSET  itemnumber = mid(pattern,2, underscore-2) />
				<cfelse>
					<cfset  underscore = find('.htm',pattern,1) />
					<cfif underscore>
						<CFSET  itemnumber = mid(pattern,2, underscore-2) />
					<cfelse>
						<CFSET  itemnumber = mid(pattern,2, len(pattern)-2) />
					</cfif>
				</cfif>
				<cfset  variables.newitem = itemnumber />
			<cfelse>
				<cfif isdefined("url.itemnumber")>
					<cfset   variables.newitem = url.itemnumber />
				<cfelse>
					<cfset  variables.newitem = url.newitem />
				</cfif>
			</cfif>
		<cfelse>
			<cfif isdefined("url.itemnumber")>
				<cfset  variables.newitem = url.itemnumber />
			<cfelse>
				<cfset  variables.newitem = url.newitem />
			</cfif>
		</cfif>


		<cfset variables.itemnumber = variables.newitem />
		<cfreturn variables.newitem />
	</cffunction>
	<cffunction name="getCanonical" access="public" output="false" >
			<cfargument name="details" type="query">
			<cfset var temp = '' />
<cftry>

		<cfif arguments.details.grouping neq "">
			<cfset temp  = "_" & LCASE(listfirst(arguments.details.grouping)) />
		</cfif>
		<cfreturn  "#Application.protocol#://www.#session.tld#/gem_stone_#LCASE(arguments.details.cat)#.cfm/#LCASE(arguments.details.newitem)#_#LCASE(arguments.details.cat)#_#LCASE(replace(trim(arguments.details.subcat)," ",""))##temp#.htm" />
<cfcatch type="any">
		<cfmail to="stacyanup@gmail.com" from="cs@semiprecious.com" subject="Error at Jewelry Item bean canonical construction"  type="html">
  			Catch Detail: #cfcatch.detail#,<br />
	  		Catch Message: #cfcatch.message# <br />
	    	Script Name: #getbasetemplatePath()#
	     	</cfmail>
<cfreturn "" />
</cfcatch>
</cftry>	</cffunction>
	<cffunction name="getTitle" access="public" output="false" returntype="String">
		<cfargument name="details" type="query">
		<cfargument name="getgroups" type="query">
		<cfargument name="category" type="string">
		<cfargument name="subcategory" type="string">
		<cfargument name="itemnumber" type="numeric">


		<cfset var title = "" />
	<cfsavecontent variable="title" >
            <cfoutput>
                <cfif cgi.server_name contains 'wholesale'>
                    Wholesale
                  </cfif>
                 #arguments.subcategory#
                  <cfif arguments.details.subcat2 neq "" >
                      & #arguments.details.subcat2#
                 </cfif>
          </cfoutput>
    	<cfoutput query="arguments.getgroups" >
            #groupname#
          </cfoutput>
              <cfoutput>
                  #arguments.details.color# gem stone <cfif arguments.details.style is 'silver setting'>Sterling Silver</cfif> #arguments.category# #arguments.itemnumber#
            </cfoutput>
        </cfsavecontent>
		<cfreturn title />
	</cffunction>
	<cffunction name="getVideo" access="public" output="false" returntype="Query">
		<cftry>
			<cfset var video = '' />
			<cfquery name='video' datasource='gemssql'>
					        			select videocode from items_video where itemidvideo=#variables.newitem#
	         						</cfquery>
			<cfcatch type="any">
				<cfset var video = querynew('videocode') />
			</cfcatch>
		</cftry>
		<cfreturn  video />
	</cffunction>

	<cffunction name="getGroup">
		<cfset var findGroup = "" />
		<cfquery name="findGroup" datasource="gemssql" >
                Select top 1 groupname from itemsbyGroup with (nolock) where itemid=#variables.itemnumber#
      </cfquery>
		<cfreturn findGroup>
	</cffunction>

	<cffunction name="getGroups" returntype="Query">
		<cfset var groups = "" />
		<cfquery name="Application.getGroupsinmemory" datasource="gemssql" 		cachedwithin="#createTimespan(0,1,0,0)#">
                    Select distinct groupname, itemid from itemsbygroup where groupname <>'mens'
            </cfquery>
		<cfquery name="Groups" dbtype="query" >
                 Select  groupname from Application.getGroupsinmemory where itemid=#variables.itemnumber#
            </cfquery>
		<cfreturn groups />
	</cffunction>

	<cffunction name="getGroupItems" returntype="Query">
		<cfargument name="numbershow" required="true" />
		<cfargument name="groupName" required="true" />
		<cfargument name="category" required="true" />
		<cfset var groupItems = "" />
		<cfquery name="groupItems" datasource="gemssql" >
                                Select top #arguments.numbershow# itemID from itemsBygroup with (nolock), items with (nolock) where itemsbygroup.itemid = newitem and GroupName='#arguments.groupname#'
                            <cfif category neq "All" > and category = '#arguments.category#'</cfif> and category <>'gems' and itemid <> #variables.itemnumber# and inventory>0 and (items.status =0 or items.status=3) order by disporder
                            </cfquery>
		<cfreturn groupItems />
	</cffunction>

	<cffunction name="getCluster" returnType="Query">
		<cfargument name="inventory" required="true">
		<cfset var cluster = "" />
		<cfquery datasource="gemssql" name="cluster">
select top 6 items.newitem as itemid,0 as orderbuy, items.cat,  count(items.newitem) as inventory, items.subcat from (select cat, subcat, newitem from items where newitem=#variables.itemnumber#) i, items, buyingrecord, Cartstatus  ca where
items.newitem=buyingrecord.itemid and ca.cartid=buyingrecord.cartid and
ca.outdate is not null and items.cat<> i.cat and items.cat<>'beads'  and items.inventory>#arguments.inventory#-3 and g2i>-1 and items.subcat=i.subcat and items.inventory>0 and (items.status=0 or items.status=3)
group by  items.newitem, items.cat, items.subcat
                      union
            select distinct top 2 styles.itemid as itemid , 1 as orderbuy,  styles.cat,inventory, items.subcat from styles, items where styles.itemid=items.newitem and (status = 0 or status=3) and items.newitem=itemid and inventory>0 and styleid in
            (select  styleid from styles where itemid = #variables.itemnumber#) and itemid <>#variables.itemnumber#
      order by itemid desc
	</cfquery>
		<cfreturn cluster />
	</cffunction>

	<cffunction name="getOptions" returntype="Query">
		<cfargument name="optionid" default="-1" type="numeric" required="false" />
		<cfset var opts  = "" />
		<cfif optionid is -1>
			<cfquery datasource="gemssql" name="opts" >
                   select description, optionid, valueadd from options where itemid    = #variables.newitem#  and inventory>0
      </cfquery>
		<cfelse>
			<cfquery datasource="gemssql" name="opts" >
					select description,  valueadd from options where itemid     = #variables.newitem# and optionid = #url.optionid#
		</cfquery>
		</cfif>
		<cfreturn opts />
	</cffunction>

	<cffunction name="getsubcatcatcount" returntype="query">
		<cfargument name="subcategory" required="true" />
		<cfargument name="category" required="true" />
		<cfset var subcatcatcount = "" />
		<cfquery name="subcatcatcount" dbtype="query">
														Select count(*) as sccount from Application.detailsinmemory where subcat='#arguments.subcategory#' and cat='#arguments.category#'
						</cfquery>
		<cfreturn subcatcatcount />
	</cffunction>

	<cffunction name="getothercatbestsellers" returntype="Query">
		<cfargument name="category" required="true" />
		<cfargument name="subcategory" required="true" />
		<cfset var othercatbestsellers = "" />
		<cfquery name="othercatbestsellers" datasource="gemssql" >
                                Select  top 6 newitem, cat
                                from (Select * from    items with (nolock) where cat<>'ornaments' and cat <>'bags' and (status =0 or status=3)) detailsinmemory
                                where subcat='#arguments.subcategory#' and cat <>'#arguments.category#' and cat <> 'beads'
                                and cat<>'gems' and (status=0 or status=3) and inventory>0
                                order by newitem
                            </cfquery>
		<cfreturn othercatbestsellers />
	</cffunction>

	<cffunction name="getDetails" access="public" output="false" returntype="Query">
		<cfargument name="testing" default="false" required="false" type="boolean">
		<cfset var details = "" />
		<cfif arguments.testing is "yes">
			<cfset cts = createTimespan(0,0,0,0) />
		<cfelse>
			<cfset cts = createTimespan(0,10,5,0) />
		</cfif>
		<CFQUERY  datasource="gemssql" name="Application.detailsinmemory"  	cachedwithin="#cts#">
              Select   'stone' as material, grouping, itemnumber, size, weight,supplier, style, color, storage, '0' as storageindia, imagelink, inventory,
                 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description,
                  NameID, newitem, subcat, subcat2, cat, morepics, restockdate from
              items where cat<>'ornaments'  and (status =0 or status=3)
      </cfquery>
		<cfquery  dbtype="query" name="details">
             Select   material , grouping, supplier,itemnumber, size, weight, style, color, storage,  storageindia, imagelink, inventory,
                 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, optcount,description,
                  NameID, newitem, subcat, subcat2, cat, morepics,restockdate from
              Application.detailsinmemory where newitem=#variables.newitem#
              </cfquery>
		<cfif details.recordcount eq 0>
			<!--- when google re-crawls old items, it registers the page as an error if data not found, so showing inactive items anyway if some one does use an ID that is now inactive or 0 in stock--->
			<cfquery   datasource="gemssql"  name="details">
                      Select 'stone' as material ,restockdate, grouping, itemnumber, size, weight, supplier, style, color, storage, '0' as storageindia, imagelink, inventory,
                 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description,
                  NameID, newitem, subcat, subcat2, cat, morepics from
              items where newitem=#variables.newitem# </cfquery>
		</cfif>
		<CFSET subcategory = details.subcat>
		<cfreturn details />
	</cffunction>

	<cffunction name="getStonesListWithProperty" access="Public" Returntype="any">
		<cfset var stones2 = "" />
		<cfset var stone = "" />
		<cfif len(subcategory)>
			<!--- subcategory is basically the stoneslist --->
			<cfset var stonelist = replacenocase(variables.subcategory,"and",",","All")>
			<cfset stonelist = replace(variables.subcategory,";",",","All")>
			<cfloop list="#stonelist#" index="stone" >
				<cfset stone = trim(stone)>
				<cfset stone = replace(stone," ","_","one")>
				<cfif ListContainsnocase(variables.listofstoneswithproperties, stone)>
					<cfif isdefined("stones2")>
						<cfset stones2 = stones2 & "," & stone />
					<cfelse>
						<cfset stones2 = stone />
					</cfif>
				</cfif>
			</cfloop>
		</cfif>
		<cfreturn stones2 />
	</cffunction>

	<cffunction name="init" access="public" output="false" returntype="backing_beans.bb_jewelry_item">
		<cfargument name="callerVariables" type="struct" required="true" />
		<cfscript>
			//structAppend(Variables,arguments.callerVariables) ;
			variables.listofstoneswithproperties = "AGATE,AMETHYST,BLOODSTONE,CARNELIAN,CITRINE,FLUORITE,GARNET,HEMATITE,IOLITE,JADE,JASPER,LAPIS_LAZULI,MALACHITE,MOONSTONE,MOSS_AGATE,PEARL,PERIDOT,ROSE_QUARTZ,QUARTZ,SMOKEY_QUARTZ,SMOKY_QUARTZ,SODALITE,TIGER_EYE,TOURMALINE,TURQUOISE";
		</cfscript>
		<!--- TODO: Implement Method --->
		<cfreturn this />
	</cffunction>

</cfcomponent>
