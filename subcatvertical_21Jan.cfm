<cfif category neq 'chains' and category neq 'brooches'>
<cfparam default="" name="category">
<cfparam default="" name="categ">
<cfparam default="" name="subcat">
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
  <cfset category="all">
</cfif>
<cfset style="">

	<cfquery name="stonelistpopular" datasource="gemssql"  cachedwithin="#createtimespan(0,1,0,0)#">	
select cat, stone,  style, count(stone) as inventory,   popular
from items, ltbstonesmaster 
where inventory>0 and items.subCAT=ltbstonesmaster.stone 
  group by cat, stone,style,  popular order by cat,popular desc , stone 
</cfquery>

<cfif (category eq "" or category eq "ALL") and style eq 'silver'>
	<cfquery name="stonelist" dbtype="query">	
Select  top 100 30 as stock, stone from stonelistpopular  	order by popular desc	
		<!---select distinct stone  as subcat2 from CatSubCatInStock where  (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and style like 'silver%' order by subcat2--->
	</cfquery>
   <cfset temp_stonelist = stonelist />

	<cfelseif category neq "" and category neq "ALL" and style eq ""  >
	<cfquery name="stonelist1" dbtype="query">
	select distinct stone as subcat2, sum(inventory)  as inventory from 
	stonelistpopular   where cat='#category#' and inventory>0 <cfif category neq 'beads' and category neq  'gems' and category neq  'brooches' and category neq 'healing'>and popular=1</cfif> group by stone  	</cfquery>
   <cfset temp_stonelist = stonelist1 />
	<cfelseif category neq "" and category neq "ALL" and style eq "beaded"  >
	<cfquery name="stonelist2" dbtype="query">
		select distinct stone  as subcat2 from stonelistpopular  where cat='#category#'<cfif category neq 'beads' and category neq  'gems'  and category neq  'brooches' and category neq 'healing'> and popular=1</cfif> and style like   '%beaded%' order by  subcat2
	</cfquery>
       <cfset temp_stonelist = stonelist2 />
	<cfelseif category neq "" and category neq "ALL" and style eq 'silver'  >
	<cfquery name="stonelist3"  dbtype="query">
		select distinct  stone as subcat2 from stonelistpopular where cat='#category#'<cfif category neq 'beads' and category neq  'gems' and category neq  'brooches'  and category neq 'healing'>and popular=1</cfif>  and style like 'silver%'  order by subcat2
	</cfquery>
       <cfset temp_stonelist = stonelist3 />
	<cfelseif (category eq "" or category eq "ALL") and style eq 'beaded'  >
	<cfquery name="stonelist4" dbtype="query">
		select  distinct stone as subcat2 from stonelistpopular where  (cat <> 'healing' and cat <>  'ornaments' and cat <> 'beads' and cat <>'bags')<cfif category neq 'beads' and category neq  'gems'  and category neq  'brooches' and category neq 'healing'>and popular=1</cfif> and style like '%beaded%' order by subcat2
	</cfquery>	
       <cfset temp_stonelist = stonelist4 />
	<cfelseif category eq "" or category eq "ALL">
	<cfquery name="stonelist5" dbtype="query">
Select distinct stone as subcat2 from  stonelistpopular<cfif category neq 'beads' and category neq  'gems' and category neq  'brooches'  and category neq 'healing'> where popular=1</cfif></cfquery>

<!---		select distinct stone as subcat2 from CatSubCatInStock where (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and inventory>10--->

	   <cfset temp_stonelist = stonelist5 />
</cfif>

	<cfquery name="otherstones" datasource="gemssql">
	Select distinct stone as subcat2  from catsubcatinstock where 
 ( cat <> 'ornaments' and cat <>'bags')
  order by stone
	</cfquery>
    <cfif category neq 'beads' and category neq 'healing'>
   <cfset category=holdcategory>
</cfif>
<!---
 <cfif category neq 'beads' and category neq 'healing'>
<cfset categ="Jewelry">
</cfif> --->
<cfif categ eq "">
<cfset categ = category>
<cfif category eq "" or category eq "all" or category eq "jewelry" or category eq "chains">
   <cfset categ="Jewelry">
</cfif>
</cfif>
<!--- below is to show left menu only as jewelry and not filtered by category
<cfif category neq "healing" and category neq "beads" and category neq "findings">
   <cfset categ="Jewelry">
	    <cfset category="Jewelry">
</cfif>
style="display:#LeftGemstoneDisplay#"--->

<!--- End all the queries.  Start actual html ---><cfoutput>
<!---
<cfif category neq "" and category neq "ALL">
	<div  border="0px" align="left"  class="" >#categ# by <br />gemstone
                     &nbsp;<img src='/images/down.gif'>     </div><br>
										 </cfif>
			--->							 
<div id="LeftGemstoneDisplay" >

<!---
    <cfif category neq "" and category neq "ALL">
			<a  href='/gem-stone-#categ#.cfm' >All #categ#</a>
    <cfelse>
			<a  href='/gemstone_jewelry_gallery.cfm' >All stones</a>
     </cfif>
   --->
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
#subcat2# <!---<cfif len(subcat2) LT 10>#lcase(categ)#</cfif><font color=grey size=-2>(#inventory#)</font><cfif style neq "">-#style#</cfif>---></a>  
		
    <cfelse>

		<cfif category eq "" or category eq "ALL" or category eq "jewelry">
			<cfif style neq "">
			<a  href='/#subcat3#_jewelry.cfm?style=#style#' class="side_link" id="#subcat2#" >
			<cfelse>	
			<cfif cgi.server_name contains 'wholesale'>
			<a  href="/#lcase(subcat3)#_jewelry.cfm" class="side_link" id="#subcat2#" >
			<cfelse>
			<a  href="/#lcase(subcat3)#.cfm" class="side_link" id="#subcat2#" >
			</cfif>
			</cfif>
#subcat2#<cfif style neq "">-#style#</cfif></a>

		<cfelse>
		<a  href='/#subcat3#_#category#.cfm' class="side_link" id="#subcat2#" >
#subcat2# #category#
 <!---<cfif len(subcat2) LT 10>#lcase(categ)#</cfif><font color=grey size=-3>(#inventory#)</font><cfif style neq "">-#style#</cfif>---></a>

		</cfif>
        </cfif>
		</CFIF>
	</cfloop>
		<!---<cfif category eq "" or category eq "ALL">--->

<b><a href=/rare-stones/rare-gems-<cfoutput>#categ#</cfoutput>.cfm><b>Other Gemstones</b></a></b>
		<!---</cfif>--->
	</cfoutput>
 </div>

<cfset category=origcat>
</cfif>