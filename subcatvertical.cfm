<<<<<<< HEAD
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


<cfif category neq 'beads' and category neq 'healing'>
   <cfset holdcategory = category>
<!---   <cfset category="">--->
</cfif>
<cfset style="">

<cfif (category eq "" or category eq "ALL") and style eq 'silver'>
	<cfquery name="stonelist" datasource="gemssql">
	
Select * from (
Select 1 as stock, stone from catsubcatinstock  where stone in ('ruby','emerald','tourmaline','aquamarine','sapphire')
union
Select top 25 sum([inventory]) as stock, stone from catsubcatinstock  group by stone order by stock desc) x order by stone		
		<!---select distinct stone  as subcat2 from CatSubCatInStock where  (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and style like 'silver%' order by subcat2--->
	</cfquery>
	<cfelseif category neq "" and category neq "ALL" and style eq "">
	<cfquery name="stonelist" datasource="gemssql">
			 select top 15 distinct stone as subcat2, sum(inventory)  as inventory from CatSubCatInStock  where cat='#category#' and inventory>0 group by stone   order by inventory
	</cfquery>
	<cfelseif category neq "" and category neq "ALL" and style eq "beaded">
	<cfquery name="stonelist" datasource="gemssql">
		select distinct stone  as subcat2 from CatSubCatInStock  where cat='#category#' and style like  '%beaded%' order by  subcat2
	</cfquery>
	<cfelseif category neq "" and category neq "ALL" and style eq 'silver'>
	<cfquery name="stonelist" datasource="gemssql">
		select  distinct stone as subcat2 from CatSubCatInStock where cat='#category#' and style like 'silver%' order by subcat2
	</cfquery>
	<cfelseif (category eq "" or category eq "ALL") and style eq 'beaded'>
	<cfquery name="stonelist" datasource="gemssql">
		select  distinct stone as subcat2 from CatSubCatInStock where (cat <> 'healing' and cat <> 'ornaments' and cat <> 'beads' and cat <>'bags') and style like '%beaded' order by subcat2
	</cfquery>	
	<cfelseif category eq "" or category eq "ALL">
	<cfquery name="stonelist" datasource="gemssql">
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
	Select subcat2 from (Select top 25 sum([inventory]) as stock, stone as subcat2 from catsubcatinstock  group by stone order by stock desc) x order by subcat2




<!---		select distinct stone as subcat2 from CatSubCatInStock where (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and inventory>10--->
	</cfquery>

	
</cfif>

	<cfquery name="otherstones" datasource="gemssql" CachedWithin="#CreateTimeSpan(0,4,0,0)#">
	Select distinct stone as subcat2  from catsubcatinstock where stone not in (
	 
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
	Select subcat2 from (Select top 25 sum([inventory]) as stock, stone as subcat2 from catsubcatinstock  group by stone order by stock desc
	) x) 

and

 (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') order by stone
	</cfquery>
    <cfif category neq 'beads' and category neq 'healing'>
   <cfset category=holdcategory>
</cfif>

<cfif categ eq "">
<cfset categ = category>
<cfif category eq "" or category eq "all" or category eq "jewelry">
   <cfset categ="Jewelry">
</cfif>
</cfif>

<!--- End all the queries.  Start actual html --->
<table>
   <tr>
       <td  border="0px" align="center"  class="gray_bg side_hd" onClick="flipDisplay('LeftGemstoneDisplay')"  style="cursor:pointer;padding:0px"><cfoutput>#categ# by&nbsp;Gemstone</cfoutput></td>
                            

<div id="LeftGemstoneDisplay" style="display:inline">

<table cellpadding="0" cellspacing="0" border="0">
<cfoutput>
    <cfif category neq "" and category neq "ALL">
		<tr>
		<td >
			<a  href='/#categ#.cfm' class="side_link" >All #categ#</a>
		</td> 
        </tr>
    <cfelse>
		<tr>
		<td >
			<a  href='/jewelry.cfm' class="side_link" >All stones</a>
		</td> 
        </tr>
     </cfif>

	<cfloop query="stonelist" >
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
    <cfset subcat4 = subcat3>
	<cfset subcat3 = replace(trim(subcat3)," ","")>
    
    <!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
    <cfif CGI.PATH_INFO contains "gem-stone-">
		<tr>
		<td >
		<cfif category eq "" or category eq "ALL">
			<cfif style neq "">
			<a  href='/#subcat3#_#categ#.cfm?style=#style#' class="side_link" id="#subcat2#" >
			<cfelse>	
			<a  href="/#lcase(subcat3)#_#categ#.cfm" class="side_link" id="#subcat2#" >
			</cfif>
		<cfelse>
		<a  href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
		</cfif>
#subcat2# <cfif len(subcat2) LT 10>#lcase(categ)#</cfif><font color=grey size=-2>[#inventory#]</font><cfif style neq "">-#style#</cfif></a>
		</td> 
        </tr>
    <cfelse>

		<tr>
		<td  >
		<cfif category eq "" or category eq "ALL">
			<cfif style neq "">
			<a  href='/#subcat3#.cfm?style=#style#' class="side_link" id="#subcat2#" >
			<cfelse>	
			<a  href="/#lcase(subcat3)#.cfm" class="side_link" id="#subcat2#" >
			</cfif>
#subcat2#<cfif style neq "">-#style#</cfif></a>
		<cfelse>
		<a  href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
#subcat2# <cfif len(subcat2) LT 10>#lcase(categ)#</cfif><font color=grey size=-3>[#inventory#]</font><cfif style neq "">-#style#</cfif></a>
		</cfif>
		</td> 
        </tr>
        </cfif>
		</CFIF>
	</cfloop>
		<!---<cfif category eq "" or category eq "ALL">--->
<tr><td  align="center"><b><a href=/rare-stones/rare-gems-<cfoutput>#categ#</cfoutput>.cfm><b>More Gemstones</b></a></b></td></tr>
		<!---</cfif>--->
	</cfoutput>
     </table>
 </div>

 </td>
 </tr></table>
<cfset category=origcat>
=======
<cftry>
<cfparam default="" name="category">
<cfif category neq 'chains' and category neq 'brooches'>

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

<cfquery name="stonelistpopular" datasource="gemssql"  cachedwithin="#createtimespan(0,0,1,0)#">	
select distinct top 200 cat, stone,   popular
from items, ltbstonesmaster 
where popular=1 and items.subCAT=ltbstonesmaster.stone 
order by cat, stone
</cfquery>

<cfif (category eq "" or category eq "ALL") and style eq 'silver'>
	<cfquery name="stonelist" dbtype="query">	
Select  top 80 stone from stonelistpopular  	order by stock desc	
		<!---select distinct stone  as subcat2 from CatSubCatInStock where  (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and style like 'silver%' order by subcat2--->
	</cfquery>
   <cfset temp_stonelist = stonelist />

	<cfelseif category neq "" and category neq "ALL" and style eq ""  >
	<cfquery name="stonelist1" dbtype="query">
	select distinct stone as subcat2  from 
	stonelistpopular   where cat='#category#' <cfif category neq 'beads' and category neq  'gems' and category neq  'brooches' and category neq 'healing'>and popular=1</cfif> group by stone  	</cfquery>
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
Select distinct stone as subcat2 from  stonelistpopular<cfif category neq 'beads' and category neq  'gems' and category neq  'brooches'  and category neq 'healing'> where popular=1</cfif> </cfquery>

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

<cfoutput>
	<cfset counter1 = temp_stonelist.recordcount/2>
    <ul><li>
    <ul>
	<cfloop query="temp_stonelist" startrow="1" endrow="#counter1#">
		<CFIF subcat2 neq "">
			<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
            <cfset subcat4 = subcat3>
            <cfset subcat3 = replace(trim(subcat3)," ","")>
    		<!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
			<cfif cgi.script_name contains "gem-stone-">
                <cfif category eq "" or category eq "ALL">
                    <cfif style neq "">
                    <li><a href='/#subcat3#_#categ#.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	                   <li>
										<a href="/#lcase(subcat3)#_#categ#.cfm" id="#subcat2#" >
                    </cfif>
                <cfelse>
                    <li><a href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' id="#subcat2#" >
                </cfif>
                #subcat2# </a></li>  
                
            <cfelse>
        
                <cfif category eq "" or category eq "ALL" or category eq "jewelry">
                    <cfif style neq "">
                        <li><a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	
                        <cfif cgi.server_name contains 'wholesale'>
                            <li><a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" >
                        <cfelse>
                            <li><a href="/#lcase(subcat3)#.cfm" id="#subcat2#" >
                        </cfif>
                    </cfif>
                    #subcat2#<cfif style neq "">-#style#</cfif></a></li>
        
                <cfelse>
                
                    <li><a  href='/#subcat3#_#category#.cfm' id="#subcat2#" >
        #subcat2#</a></li>
        
                </cfif>
            </cfif>
        </CFIF>
	</cfloop>
    
    </ul>
    </li>
    
    
    <li>
    <ul>
    
    <cfloop query="temp_stonelist" startrow="#Evaluate('counter1+1')#" endrow="#evaluate(temp_stonelist.recordcount/2)#">
		<CFIF subcat2 neq "">
			<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
            <cfset subcat4 = subcat3>
            <cfset subcat3 = replace(trim(subcat3)," ","")>
    		<!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
			<cfif cgi.script_name contains "gem-stone-">
                <cfif category eq "" or category eq "ALL">
                    <cfif style neq "">
                    <li><a href='/#subcat3#_#categ#.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	
                    <li><a href="/#lcase(subcat3)#_#categ#.cfm" id="#subcat2#" >
                    </cfif>
                <cfelse>
                    <li><a href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' id="#subcat2#" >
                </cfif>
                #subcat2# </a></li>  
                
            <cfelse>
        
                <cfif category eq "" or category eq "ALL" or category eq "jewelry">
                    <cfif style neq "">
                        <li><a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	
                        <cfif cgi.server_name contains 'wholesale'>
                            <li><a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" >
                        <cfelse>
                            <li><a href="/#lcase(subcat3)#.cfm" id="#subcat2#" >
                        </cfif>
                    </cfif>
                    #subcat2#<cfif style neq "">-#style#</cfif></a></li>
        
                <cfelse>
                
                    <li><a  href='/#subcat3#_#category#.cfm' id="#subcat2#" >
        #subcat2#</a></li>
        
                </cfif>
            </cfif>
        </CFIF>
	</cfloop>
    
<li>
<cfloop query="temp_stonelist" startrow="#evaluate(temp_stonelist.recordcount/2+1)#" endrow="#temp_stonelist.recordcount#">
		<CFIF subcat2 neq "">
			<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
            <cfset subcat4 = subcat3>
            <cfset subcat3 = replace(trim(subcat3)," ","")>
    		<!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
			<cfif cgi.script_name contains "gem-stone-">
                <cfif category eq "" or category eq "ALL">
                    <cfif style neq "">
                    <li><a href='/#subcat3#_#categ#.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	
                    <li><a href="/#lcase(subcat3)#_#categ#.cfm" id="#subcat2#" >
                    </cfif>
                <cfelse>
                    <li><a href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' id="#subcat2#" >
                </cfif>
                #subcat2# </a></li>  
                
            <cfelse>
        
                <cfif category eq "" or category eq "ALL" or category eq "jewelry">
                    <cfif style neq "">
                        <li><a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" >
                    <cfelse>	
                        <cfif cgi.server_name contains 'wholesale'>
                            <li><a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" >
                        <cfelse>
                            <li><a href="/#lcase(subcat3)#.cfm" id="#subcat2#" >
                        </cfif>
                    </cfif>
                    #subcat2#<cfif style neq "">-#style#</cfif></a></li>
        
                <cfelse>
                
                    <li><a  href='/#subcat3#_#category#.cfm' id="#subcat2#" >
        #subcat2#</a></li>
        
                </cfif>
            </cfif>
        </CFIF>
	</cfloop>
	<a href=/rare-stones/rare-gems-<cfoutput>#categ#</cfoutput>.cfm>Other Gemstones</a></li>

    </li>
    </ul>
    
    <li>
    <ul>
    
		<!---<cfif category eq "" or category eq "ALL">--->
</ul>
                    </li>
                    </ul>
		<!---</cfif>--->
	</cfoutput>

<cfset category=origcat>
</cfif>
<cfcatch type="any">
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>





>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
