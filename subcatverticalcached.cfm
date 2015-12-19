<cftry>
<cfparam default="" name="category">
<cfparam default="" name="categ">
<cfparam default="" name="subcat">
<cfparam default="none" name="LeftGemstoneDisplay" />
<cfparam default="" name="style">
<cfif style is 'Silver Setting' or style is 'Silversetting'><cfset style='silver'></cfif>
<cfif style contains 'beaded'><cfset style='beaded'></cfif>

<cfset origcat=category>
<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
<cfif category is "chains">
<cfset category2 ="all" />
</cfif>

<cfif category neq 'beads' and category neq 'healing'>
   <cfset holdcategory = category>
<!---   <cfset category="">--->
</cfif>
<cfset style="">


 

<cfif (category eq "" or category eq "ALL") and style eq 'silver'>
	<cfquery name="stonelist" datasource="gemssql"  cachedwithin="#createtimespan(0,6,0,0)#">
	
Select top 30 sum([inventory]) as stock, stone from catsubcatinstockpopular  group by stone ) x order by stone		
		<!---select distinct stone  as subcat2 from CatSubCatInStock where  (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and style like 'silver%' order by subcat2--->
	</cfquery>
   <cfset temp_stonelist = stonelist />

	<cfelseif category neq "" and category neq "ALL" and style eq ""  >
		<cfif category is 'necklaces'>
          <cfquery name="stonelist1necklaces" datasource="gemssql" cachedwithin=				"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from 	catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1necklaces />
         <cfelseif category is 'pendants'>
          <cfquery name="stonelist1pendants" datasource="gemssql" cachedwithin="#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1pendants />
         <cfelseif category is 'rings'>
			          <cfquery name="stonelist1rings" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1rings />
         <cfelseif category is 'bracelets'>
			          <cfquery name="stonelist1bracelets" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1bracelets />
         <cfelseif category is 'earrings'>
			          <cfquery name="stonelist1earrings" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1earrings />
         <cfelseif category is 'gems'>
			          <cfquery name="stonelist1gems" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1gems/>
         <cfelseif category is 'brooches'>
			          <cfquery name="stonelist1brooches" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1brooches />
         <cfelseif category is 'cufflinks'>
			          <cfquery name="stonelist1cufflinks" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1cufflinks />
         <cfelseif category is 'healing'>
			          <cfquery name="stonelist1healing" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1healing />
         <cfelseif category is 'beads'>
			          <cfquery name="stonelist1beads" datasource="gemssql" cachedwithin=	"#createtimespan(0,6,0,0)#">
          select  distinct top 30 stone as subcat2, sum(inventory)  as inventory from catsubcatinstockpopular  where cat='#category#' and inventory>0 group by stone   order by stone
          </cfquery>
         <cfset temp_stonelist = stonelist1beads />
         </cfif>
                 
	<cfelseif category neq "" and category neq "ALL" and style eq "beaded"  >
	<cfquery name="stonelist2" datasource="gemssql" cachedwithin="#createtimespan(0,0,0,0)#">
		select distinct stone  as subcat2 from catsubcatinstockpopular  where cat='#category#' and style like  '%beaded%' order by  subcat2
	</cfquery>
       <cfset temp_stonelist = stonelist2 />
	<cfelseif category neq "" and category neq "ALL" and style eq 'silver'  >
	<cfquery name="stonelist3" datasource="gemssql" cachedwithin="#createtimespan(0,0,0,0)#">
		select  distinct stone as subcat2 from catsubcatinstockpopular where cat='#category#' and style like 'silver%' order by subcat2
	</cfquery>
       <cfset temp_stonelist = stonelist3 />
	<cfelseif (category eq "" or category eq "ALL") and style eq 'beaded'  >
	<cfquery name="stonelist4" datasource="gemssql" cachedwithin="#createtimespan(0,6,0,0)#">
		select  distinct stone as subcat2 from catsubcatinstockpopular where (cat <> 'healing' and cat <> 'ornaments' and cat <> 'beads' and cat <>'bags') and style like '%beaded%' order by subcat2
	</cfquery>	
       <cfset temp_stonelist = stonelist4 />
	<cfelseif category eq "" or category eq "ALL">
	<cfquery name="stonelist5" datasource="gemssql"  cachedwithin="#createtimespan(0,0,0,0)#">
	Select 'Blue Topaz' as subcat2
	Union
	Select 'Lemon Quartz' as subcat2
	Union
	Select 'Amber' as subcat2
	union
	Select 'Ruby' as subcat2
	union
	Select 'Emerald' as subcat2
	union
	Select 'Sapphire' as subcat2
	union
	Select 'Aquamarine' as subcat2
	union
	Select subcat2 from (Select top 30 sum([inventory]) as stock, stone as subcat2 from catsubcatinstockpopular  group by stone order by stock desc) x order by subcat2




<!---		select distinct stone as subcat2 from CatSubCatInStock where (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and inventory>10--->
	</cfquery>

	   <cfset temp_stonelist = stonelist5 />
</cfif>

	<cfquery name="otherstones" datasource="gemssql" CachedWithin="#CreateTimeSpan(0,6,0,0)#">
	Select distinct stone as subcat2  from catsubcatinstockpopular where stone not in (
	 
		Select 'Blue Topaz' as subcat2
	Union
	Select 'Lemon Quartz' as subcat2
	Union
	Select 'Amber' as subcat2
	union
	Select 'Ruby' as subcat2
	union
	Select 'Emerald' as subcat2
	union
	Select 'Sapphire' as subcat2
	union
	Select 'Aquamarine' as subcat2
	union
	Select subcat2 from (Select top 30 sum([inventory]) as stock, stone as subcat2 from catsubcatinstockpopular  group by stone order by stone
	) x) 

and

 (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') order by stone
	</cfquery>
    <cfif category neq 'beads' and category neq 'healing'>
   <cfset category=holdcategory>
</cfif>

<cfif categ eq "">
<cfset categ = category>
<cfif category eq "" or category eq "all" or category eq "jewelry" or category eq "chains">
   <cfset categ="Jewelry">
</cfif>
</cfif>

<!--- End all the queries.  Start actual html --->

	<div  border="0px" align="center"  class="green_bg side_hd" onClick="flipDisplay('LeftGemstoneDisplay')"  ><cfoutput>#categ# by <br />Gemstone
                     &nbsp;<img src='/images/down.gif'>     </div>
<div id="LeftGemstoneDisplay" style="display:#LeftGemstoneDisplay#">


    <cfif category neq "" and category neq "ALL">
			<a  href='/gem-stone-#categ#.cfm' class="side_link" >All #categ#</a>
    <cfelse>
			<a  href='/gemstone_jewelry_gallery.cfm' class="side_link" >All stones</a>
     </cfif>
   
	<cfloop query="temp_stonelist" >
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
    <cfset subcat4 = subcat3>
	<cfset subcat3 = replace(trim(subcat3)," ","")>
    
    <!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
    <cfif CGI.PATH_INFO contains "gem-stone-">
		<cfif category eq "" or category eq "ALL">
			<cfif style neq "">
			<a  href='/#subcat3#_#categ#.cfm?style=#style#' class="side_link" id="#subcat2#" >
			<cfelse>	
			<a  href="/#lcase(subcat3)#_#categ#.cfm" class="side_link" id="#subcat2#" >
			</cfif>
		<cfelse>
		<a  href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
		</cfif>
#subcat2# <!---<cfif len(subcat2) LT 10>#lcase(categ)#</cfif>---><font color=grey size=-2>(#inventory#)</font><cfif style neq "">-#style#</cfif></a>  
		
    <cfelse>

		<cfif category eq "" or category eq "ALL">
			<cfif style neq "">
			<a  href='/#subcat3#.cfm?style=#style#' class="side_link" id="#subcat2#" >
			<cfelse>	
			<a  href="/#lcase(subcat3)#.cfm" class="side_link" id="#subcat2#" >
			</cfif>
#subcat2#<cfif style neq "">-#style#</cfif></a>
		<cfelse>
		<a  href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
#subcat2# <!---<cfif len(subcat2) LT 10>#lcase(categ)#</cfif>---><font color=grey size=-3>(#inventory#)</font><cfif style neq "">-#style#</cfif></a>

		</cfif>
        </cfif>
		</CFIF>
	</cfloop>
		<!---<cfif category eq "" or category eq "ALL">--->

<b><a href=/rare-stones/rare-gems-<cfoutput>#categ#</cfoutput>.cfm><b>More Gemstones</b></a></b>
		<!---</cfif>--->
	</cfoutput>
 </div>

<cfset category=origcat>
<cfcatch type="any">
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>