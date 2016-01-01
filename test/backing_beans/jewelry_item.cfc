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



	<cffunction name="get_item_id" access="public" output="false" returntype="any">
		<cfreturn variables.item_id />
	</cffunction>
	<cffunction name="get_cluster" access="public" returntype="Query">

		<cfset itemnumber = variables.item_id />
	   <cfquery datasource="gemssql" name="getcluster">
select top 6 items.newitem as itemid,0 as orderbuy, items.cat,  count(items.newitem) as inventory, items.subcat from (select cat, subcat, newitem from items where newitem=#itemnumber#) i, items, buyingrecord, Cartstatus  ca where
items.newitem=buyingrecord.itemid and ca.cartid=buyingrecord.cartid and
ca.outdate is not null and items.cat<> i.cat and items.cat<>'beads'  and items.inventory>#details.inventory#-3 and g2i>-1 and items.subcat=i.subcat and items.inventory>0 and (items.status=0 or items.status=3)
group by  items.newitem, items.cat, items.subcat
union
            select distinct top 2 styles.itemid as itemid , 1 as orderbuy,  styles.cat,inventory, items.subcat from styles, items where styles.itemid=items.newitem and (status = 0 or status=3) and items.newitem=itemid and inventory>0 and styleid in
            (select  styleid from styles where itemid = #itemnumber#) and itemid <>#itemnumber#
      order by itemid desc
					  </cfquery>
	</cffunction>
	<cffunction name="get_help" access="public">
	<cfsavecontent  variable="temp"><div  id="howto" style="padding:2px;border:4px gray solid;visibility:hidden;position:absolute;top:130px;left:220px;color:#666600;background-color:white;z-index:2;width:300px;" >
              <div class="noticebox" >This page helps you to add an item to your cart. From the drop down  above the 'Add to Cart' button select the quantity (1 or more) you wish to buy   and click on the 'Add to Cart' button.
                Your cart will be filled by the selected number of this design. It does not matter if the item is already there in your cart.
                The quantity in cart will be  the number you select now. <br />Clicking 'Add To Cart' will take you to the cart summary page.
                <span class="error1">At times if a lesser quantity is available in inventory then the lesser quantity is added</span>.
                <ul style="margin-left:10px;text-align:left;">
                  <li><strong>Options:</strong> Before adding/changing the quantity please see if any options/modification  are available for the design.
                    Options are shown at the bottom of the quantity selector and are <span class="optionsinline" >highlighted in this color</span>.
                    If options are available you may select an option. Options are not always compulsory.</li>
                  <li><strong>To remove</strong> an item from your cart select Remove and click on 'Add to Cart' button.</li>
                </ul>
              </div>
              [<a onClick="MM_showHideLayers('howto','','hide');" style="color:red;" >Close Help</a>]
              </div>
			</cfsavecontent>
			<cfreturn temp />
</cffunction>

		<cffunction name="get_header" access="public">
	<cfreturn variables.header />
	</cffunction>
	<cffunction name="set_header" access="private">
		<cfif notValid()>
	     <cfset variables.header = ' <meta name="robots" content="noindex,nofollow">' />
		<cfelse>

		</cfif>
	</cffunction>

   <cffunction name="notValid" returntype="boolean" access="public">

		<cfreturn not isnumeric(variables.item_id) />

	</cffunction>

	<cffunction name="set_item_id" access="private" output="false" returntype="string">
		<cfargument name="pattern" type="string" required="true" />
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
		<cfreturn newitem />
	</cffunction>

	<cffunction name="init" access="public" description="depends on URL scope" output="false" returntype="backing_beans.jewelry_item">
		<cfargument name="template_variables" required="true" />


		<cfscript>
			variables.item_id = '';
			variables.header = "";
			structAppend(Variables,arguments.template_variables) ;
			var pattern = cgi.PATH_INFO;
   		 </cfscript>

	  <cfset variables.newitem = set_item_id(pattern) />
	  <cfset variables.item_id = variables.newitem />
	  <cfinvoke method="set_header" />

	      <CFPARAM NAME="wd.height" DEFAULT= "350" />

    <CFPARAM NAME="testing" DEFAULT= "no" />
    <cfparam name="cfselect_required" default="true">
        <CFPARAM NAME="orderonrequest" DEFAULT= "1" />
        <CFPARAM NAME="country" DEFAULT= "" />
        <CFPARAM NAME="designer" DEFAULT= "" />
        <cfparam name="session.address.country_code" default="" />
        <CFPARAM NAME="session.gallery" DEFAULT= "gemstone_jewelry_gallery.cfm" />
        <CFPARAM NAME="session.filter" DEFAULT= "sortorder=datetaken" />
        <cfparam name="style_for_added" default="" />
        <CFPARAM NAME="description" DEFAULT="" />
        <CFPARAM NAME="Price" DEFAULT= "1000" >
        <CFPARAM NAME="width" DEFAULT= "" >
        <cfparam name="pimg" default="" >
        <cfparam default="0" name="valueadd" >
        <cfparam name="status" default="0" >
        <cfparam name="url.optionid" default="0" >
        <cfparam name="url.quantity" default="1" type="numeric" >
        <cfparam name="url.existqty" default="0" >
        <CFPARAM NAME="SalePrice" DEFAULT= "" >
        <CFPARAM NAME="category" DEFAULT= "" >
        <CFPARAM NAME="subcategory" DEFAULT= "" >
        <CFPARAM NAME="stonename" DEFAULT= "" >

    <cfset itemnumber = variables.item_id  />
    <cfparam name="session.screenwidth" default="833" type="numeric" />
    <CFPARAM NAME="invent" DEFAULT="" />
     <cfparam name="title" default="Semiprecious Silver Jewelry - peridot, amethyst necklaces, bracelets, pendants" />
    <CFPARAM NAME="editcart" DEFAULT="" />
    <CFPARAM NAME="url.filter" DEFAULT="" />

    <cfif designer neq "" >
      <cfset itemnumber=designer>
      <cfset url.newitem=designer>
      <cfset url.itemnumber=designer>
    </cfif>
    <!--- processing for item number after a forward slash --->
    <CFPARAM Name="DSNNAME" default="semiprecious" >
    <CFPARAM name="imageloc" default="web" >
    <CFPARAM name="display" default="20" >
    <CFPARAM name="Currencyexchange" default="1" >
    <CFPARAM name= "PicWidth" default= "120" >

    <!--- This is set up to differentiate between local test environment and
    the web environment --->

    <CFPARAM name="stopshipdate" default="07/14/08" >
    <CFPARAM name="nextshipdate" default="7/22/08" >





    <!---<cfif newitem NEQ "" >  <Cfset itemnumber = newitem>  </cfif>end --->


    <!--- the original before adding quertystring to the url <CFIF (category is "") And (itemnumber is  not "")>--->


     <!--- <CFQUERY DATASOURCE="gemssql" NAME="stats" >
           update itemstats set zoom=zoom+1 where itemid =#itemnumber#
						update items set disporder=disporder-0.1*disporder where newitem=#itemnumber#
        </cfquery>--->

	                         <cftry>
                              <cfquery name='video' datasource='gemssql'>
					        	select videocode from items_video where itemidvideo=#newitem#
	         				</cfquery>
        		                <cfcatch type="database">
                                                      <cfset video = querynew('videocode') />
                                         </cfcatch>
                                          <cfcatch type="any">
                                               stopped in jewelry_item.cfm for videocode
                                                   <cfabort />
                                                  <cfset video = querynew('videocode') />
                                           </cfcatch>
                                </cftry>

    <cfif testing is "yes">
        <Cfset cts = createTimespan(0,0,0,0) />
    <cfelse>
        <Cfset cts = createTimespan(0,0,5,0) />
    </cfif>

      <CFQUERY datasource="gemssql" name="detailsinmemory" 	cachedwithin="#cts#">
              Select   'stone' as material, grouping, itemnumber, size, weight,supplier, style, color, storage, '0' as storageindia, imagelink, inventory,
                 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description,
                  NameID, newitem, subcat, subcat2, cat, morepics from
              items where cat<>'ornaments'  and (status =0 or status=3)
      </cfquery>


      <cfquery  dbtype="query" name="details">
             Select  material , grouping, supplier,itemnumber, size, weight, style, color, storage,  storageindia, imagelink, inventory,
                 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, optcount,description,
                  NameID, newitem, subcat, subcat2, cat, morepics from
              detailsinmemory where newitem=#itemnumber#
              </cfquery>

			  <cfif details.recordcount eq 0>
                <!--- when google re-crawls old items, it registers the page as an error if data not found, so showing inactive items anyway if some one does use an ID that is now inactive or 0 in stock--->
			<cfquery   datasource="gemssql"  name="details">
                      Select 'stone' as material , grouping, itemnumber, size, weight, supplier, style, color, storage, '0' as storageindia, imagelink, inventory,
                 orderonrequest, price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description,
                  NameID, newitem, subcat, subcat2, cat, morepics from
              items where newitem=#itemnumber# </cfquery>
			</cfif>

            <cfquery name="getGroupsinmemory" datasource="gemssql" 		cachedwithin="#createTimespan(0,1,0,0)#">
                    Select distinct groupname, itemid from itemsbygroup where groupname <>'mens'
            </cfquery>

	          <cfif details.recordcount >
                             <cfquery name="getGroups" dbtype="query" >
                                Select  groupname from getGroupsinmemory where itemid=#itemnumber#
                            </cfquery>

                            <CFSET status = details.status>
                             <cfif cgi.server_name contains 'wholesale'  >
                                <cfif isnumeric(details.wholesaleprice)>
                                      <CFSET price=details.wholesaleprice>
                                  <cfelse>
                                      <cfset price = details.price/2 />
                                </cfif>
                                <cfset recoprice = details.price />
                            <cfelse>
                                <CFSET price=details.price>
                                 <cfif details.status eq 3>
                                       <cfif details.saleprice > 0>
                                             <CFSET SalePrice = session.sale_factor*details.saleprice>
                                         <cfelse>
                                              <CFSET SalePrice = session.sale_factor*0.8*details.price>
                                        </cfif>
                                 </cfif>
                         </cfif>
                  <CFSET variables.description=details.description />
                  <CFSET variables.NameId=details.NameID />
                  <cfset variables.optcount = details.optcount />
                  <CFSET variables.newitem = details.newitem />
                  <CFSET variables.category = details.cat />
                  <CFSET variables.subcategory = details.subcat />
                  <CFSET variables.invent = details.inventory>
                  <cfset variables.description = description & '<p><b>Type: </b>'  & details.style & '<p><b>Material: </b>'  & details.material>
                 <cfset  listofstoneswithproperties ="AGATE,AMETHYST,BLOODSTONE,CARNELIAN,CITRINE,FLUORITE,GARNET,HEMATITE,IOLITE,JADE,JASPER,LAPIS_LAZULI,MALACHITE,MOONSTONE,MOSS_AGATE,PEARL,PERIDOT,ROSE_QUARTZ,QUARTZ,SMOKEY_QUARTZ,SMOKY_QUARTZ,SODALITE,TIGER_EYE,TOURMALINE,TURQUOISE" >
              <cfif len(subcategory)>
              <!--- subcategory is basically the stoneslist --->
                    <cfset stonelist = replacenocase(subcategory,"and",",","All")>
                    <cfset stonelist = replace(subcategory,";",",","All")>
                    <cfloop list="#stonelist#" index="stone" >
                       <cfset stone = trim(stone)>
                       <cfset stone = replace(stone," ","_","one")>
                       <cfif ListContainsnocase(listofstoneswithproperties, stone)>
                                        <cfif isdefined("stones2")>
                                              <cfset stones2 = stones2 & "," & stone />
                                              <cfset stonecount = stonecount +1 />
                                          <cfelse>
                                              <cfset stonecount = 1 />
                                              <cfset stones2 = stone />
                                              <cfset Stonename=stone />
                                        </cfif>
                        <cfelse>
                            <cfif find(" ",stone)>
                               <cfset stone = replace(stone," ","_","all") />
                                 <cfif ListContainsnocase(listofstoneswithproperties, stone) >
                                      <cfif isdefined("stones2")>
                                          <cfset stones2 = stones2 & "," & stone />
                                          <cfset stonecount = stonecount +1 />
                                       <cfelse>
                                          <cfset stonecount = 1 />
                                          <cfset stones2 = stone />
                                        </cfif>
                                  </cfif>
                             </cfif>
                         </cfif>
                </cfloop>
              </cfif>
   <cfset variables.details = details />
   <cfinvoke method="set_title" />
       </cfif>
		<cfreturn Variables />
	</cffunction>

	<cffunction name="set_title" access="private">
   <cfsavecontent variable="variables.title" >
            <cfoutput>
                <cfif cgi.server_name contains 'wholesale'>
                    Wholesale
                  </cfif>
                 #variables.subcategory#
                  <cfif variables.details.subcat2 neq "" >
                      & #variables.details.subcat2#
                 </cfif>
          </cfoutput>
    	<cfoutput query="getgroups" >
            #groupname#
          </cfoutput>
              <cfoutput>
                  #variables.details.color# gem stone <cfif details.style is 'silver setting'>Sterling Silver</cfif> #category# #itemnumber#
            </cfoutput>
        </cfsavecontent>
	</cffunction>
</cfcomponent>