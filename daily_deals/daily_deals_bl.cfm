	<cftry>
<cfset session.gallery = "/daily_deals/daily_deals.cfm" />
	<cfset session.filter = "" />
<cfset cat_list = application.cat_list />
<!---<cfset cat_list =  listdeleteat(application.cat_list,listfind(application.cat_list,'beads')) />
<cfset cat_list =  listdeleteat(application.cat_list,listfind(application.cat_list,'bags')) />--->

<Cffunction name="read_daily_deals_metadata">
	       <cffile action="read" file="#expandpath('.')#\daily_deals.xml" variable="datadoc" />
		     <cfset datadoc = XmlParse(datadoc) />
	    	 <cfset application.daily_deals = structnew() />
                 <cfset application.daily_deals.date = datepart('d',now())  /> 		 
	         <cfset Application.daily_deals.days_not_sold=datadoc.daily_deals.metadata.XmlAttributes.days_not_sold />
	         <cfset Application.daily_deals.gallery_size=#datadoc.daily_deals.metadata.XmlAttributes.gallery_size# />
	         <cfset Application.daily_deals.wholesale_factor=#datadoc.daily_deals.metadata.XmlAttributes.wholesale_factor# />
		     <cfset Application.daily_deals.itemlist =#trim(datadoc.daily_deals.data.all_items.XmlText)# />
		  <cfreturn datadoc />
</cffunction>
<!--- to show only look type collection atdd  matchtype in clause below --->

<cfparam name="url.refresh" default=0 />
	<cfif  (not isdefined("application.daily_deals"))> 
	   		<cfset url.refresh = 1 />
		<cfelseif  (not isdefined("application.daily_deals.date"))> 
                    <cfset url.refresh = 1 />
	   <cfelseif datepart('d',now()) neq application.daily_deals.date >
			<cfset url.refresh = 1 />
			
			<cfsilent>
			<cfset url.action = 'run' />
			<cfinclude template="/admintools/cart_reminder_mailer.cfm"  />
			</cfsilent> 
	</cfif><!--- read file, Query DB, update application scope, update file   is done every 3 day --->
	
	<cfif  url.refresh > <!--- read file, Query DB, update application scope, update file   is done every 3 day --->

<!--- read in from file the items that were updated to this special status 
--->

 <cfset datadoc = read_daily_deals_metadata() />

<!--- reverse the price downgrades from the list in application scope --->

<!--- must first incrfease the wholesale price then the saleprice based on the increased wholesale price to reverse the price down grade done in the earlier pass 
        ---> 
		
		<cftry>
		
		   <CFIF LISTLEN(APPLICATION.DAILY_DEALS.ITEMLIST)  >
	<!--- <cfquery  datasource="gemssql" name="setpricestatus"  >
        		          update dbo.items set wholesaleprice = wholesaleprice *#application.daily_deals.wholesale_factor# where newItem in (#application.daily_deals.itemlist#)  
				 </cfquery>
		 --->
				<cfquery  datasource="gemssql" name="setpricestatus" >
        				   update dbo.items set status =3,  saleprice = price/(2*#application.daily_deals.wholesale_factor#) where newItem in (#application.daily_deals.itemlist#) 
		 		</cfquery>
    		</CFIF>
			<cfcatch type="any">		<cfoutput>
			#LISTLEN(APPLICATION.DAILY_DEALS.ITEMLIST)#..#APPLICATION.DAILY_DEALS.ITEMLIST#..			                 		update dbo.items set wholesaleprice = wholesaleprice *#application.daily_deals.wholesale_factor# where newItem in (#application.daily_deals.itemlist#)  
                 		update dbo.items set status =3,  saleprice = price/#application.daily_deals.wholesale_factor# where newItem in (#application.daily_deals.itemlist#) 
  	#cfcatch.detail#, #cfcatch.message#</cfoutput>
			<cfabort />
	</cfcatch>
	</cftry>


<cfset lag = application.daily_deals.date + application.daily_deals.days_not_sold />
<!--- #datadoc.order.items.item[i].quantity.XmlText# --->
	<cfquery  datasource="gemssql" name="q1" >
	Select 	top 1
		newItem, 
		lastbought,
		  wholesaleprice*#application.daily_deals.wholesale_factor# as dealprice,
	wholesaleprice as wdealprice,

		price,	rate,
		CAT,
		CAT2
 from dbo.items where price <> 0 and (g2i = 1 or g2i=2) and 
 supplier <> 'OC'
  and supplier <> 'Angela' 
  and cat <> 'beads' and cat <> 'bags' 
  and inventory > 5
  and lastbought > restockdate and    datediff(d,[lastbought],getDate()) > #lag#
   order by  lastbought asc

  
	 </cfquery>
	<cfquery  datasource="gemssql" name="q2" >
	Select 	top 1
		newItem, rate,
		lastbought as di,
		wholesaleprice*#application.daily_deals.wholesale_factor# as dealprice,
	wholesaleprice as wdealprice,

		price,	
		CAT,
		CAT2
	 from dbo.items where price <> 0 and (g2i = 1 or g2i=2) and 
	 supplier <> 'OC'
	  and supplier <> 'Angela' 
	  and cat <> 'beads' and cat <> 'bags' and inventory > 5
	  and  restockdate > lastbought  and    datediff(d,[restockdate],getDate()) > #lag#
  
	 order by  restockdate asc
	 </cfquery>

	<cfquery  datasource="gemssql" name="q3" >
	Select 	top 1
		newItem, rate,
		lastbought as di,
		wholesaleprice*#application.daily_deals.wholesale_factor# as dealprice,
	wholesaleprice as wdealprice,

		price,	
		CAT,
		CAT2
	
	 from dbo.items where price <> 0 and (g2i = 1 or g2i=2) and 
	 supplier <> 'OC'
	  and supplier <> 'Angela' 
	and cat <> 'beads' and cat <> 'bags'
	  and inventory > 5
	  and      datediff(d, [restockdate],[lastbought]) > #lag#
	  
	 order by  price <cfif application.daily_deals.date mod 2> asc <cfelse> desc </cfif>
	 </cfquery>
<!--- xml file appending code goes here. while appending to the file also update
status of the items to 3 (on sale) and saleprice to wholesaleprice * wholesale_factor
--->
  	
<!--
the file is writtent for two reasons: 1 to be used when application restarts and second to make
the culprits names persistent even if they get bought from the gallery.
--->
<!--- update
status of the items to 3 (on sale) and saleprice to wholesaleprice * wholesale_factor
--->
<!--- after writing the file record the lists of items--->
	<cfloop list="#cat_list#" index="cat" >
	<cfset application.daily_deals[cat] = structnew() />
	<cfset application.daily_deals[cat].list  =  ""  />
	</cfloop>
		<cfset application.daily_deals.itemlist  =  ""  />
<!---
<cfset application.daily_deals.bracelets = structnew() />
<cfset application.daily_deals.earrings = structnew() />
<cfset application.daily_deals[cat].list  =  ""  />
<cfset application.daily_deals.bracelets.list  =  ""  />
<cfset application.daily_deals.earrings.list  =  ""  />
<cfset application.daily_deals.pendants.list  =  ""  />
<cfloop query="q1" >
	<cfset application.daily_deals[cat].list = listappend(application.daily_deals[cat].list,newItem) />
</cfloop>	
HEY, to make it easier for future, always name queries in a way that they give indication of what they do lke updateDail
--->
	<cftry>
	 <cfloop from=1 to=3 index=i>
                	<cfloop query="q#i#" >
		<cfset application.daily_deals[cat].list = listappend(application.daily_deals[cat].list,newItem) />
		<cfset application.daily_deals.itemlist = listappend(application.daily_deals.itemlist,newItem) />
		<cfset application.daily_deals[cat][newItem] = structnew() />
		<cfset application.daily_deals[cat][newItem].price = price/>
		<cfset application.daily_deals[cat][newItem].dprice = dealprice/>		
		<cfset application.daily_deals[cat][newItem].wdprice = wdealprice/>		

	 	</cfloop>
	</cfloop>
		<cfquery  datasource="gemssql" name="setpricestatus" >
           update dbo.items set status =3,   saleprice = wholesaleprice * #application.daily_deals.wholesale_factor# where newItem in (#application.daily_deals.itemlist#) 
		</cfquery>


	<cfcatch type="any">		<cfoutput>
	
	                 		update dbo.items set status =3,  saleprice = wholesaleprice * #application.daily_deals.wholesale_factor# where newItem in (#application.daily_deals.itemlist#) 
                 		update dbo.items set  wholesaleprice = wholesaleprice/#application.daily_deals.wholesale_factor# where newItem in (#application.daily_deals.itemlist#)  
#cfcatch.detail#, #cfcatch.message#</cfoutput>
	</cfcatch>
	</cftry>

<!---
such simple assignment not allowed
       	    <cfset datadoc.data[cat].XmlText  = application.daily_deals[cat].list />
       	    <cfset datadoc.data.pendants.XmlText  = application.daily_deals.pendants.list />
       	    <cfset datadoc.data.bracelets.XmlText  = application.daily_deals.bracelets.list />
      	    <cfset datadoc.data.earrings.XmlText  = application.daily_deals.earrings.list />
			--->
 <cfxml variable="newdatadoc"> 
 	<cfoutput>
 <daily_deals date="#application.daily_deals.date#">
 	<metadata gallery_size="#evaluate(20+application.daily_deals.date)#" wholesale_factor="#application.daily_deals.wholesale_factor#"
	days_not_sold="#application.daily_deals.days_not_sold#"  /> 
	<data>
		<cfloop list="#cat_list#" index="cat">
		<cfif LISTlen(application.daily_deals[cat].list)>
		<#cat# count="#LISTlen(application.daily_deals[cat].list)#">
			#application.daily_deals[cat].list#
			</#cat#>
			</cfif>
	</cfloop>
<all_items count="#LISTlen(application.daily_deals.itemlist)#">
#application.daily_deals.itemlist#
</all_items>
		</data>
	</daily_deals>
		</cfoutput>

	</cfxml>
	 <cffile action="write" file="#expandpath('.')#\daily_deals.xml" output="#toString(newdatadoc)#" />
	
</cfif>
<!--- now compute how many of each categories is to be shown --->
<cfset items_available = 0 />
<cfloop list="#cat_list#" index="cat">
	<cfset items_available= items_available +  listlen(application.daily_deals[cat].list) />
</cfloop>
<cfset head = "" />
 <cfif items_available GT application.daily_deals.gallery_size >
		<cfloop list="#cat_list#" index="cat">
			<cfset application.daily_deals[cat].toshowcount = round( (listlen(application.daily_deals[cat].list)*application.daily_deals.gallery_size)/items_available) />
		</cfloop>
	<cfelse>
		<cfloop list="#cat_list#" index="cat">
			<cfset application.daily_deals[cat].toshowcount = listlen(application.daily_deals[cat].list) />
	
		</cfloop>
		</cfif>
	
<cfcatch>
<cfdump var="#cfcatch#">
</cfcatch>
</cftry>
  