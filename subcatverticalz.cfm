<cfparam default="" name="category">
<cfparam default="" name="subcat">
<cfparam default="" name="style">
<cfif style is 'Silver Setting' or style is 'Silversetting'><cfset style='silver'></cfif>
<cfif style contains 'beaded'><cfset style='beaded'></cfif>

<cfset origcat=category>
<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
<cfif category neq 'beads' and category neq 'healing'><cfset category=""></cfif>
<cfset style="">

<cfif (category eq "" or category eq "ALL") and style eq 'silver'>
	<cfquery name="stonelist" datasource="gemssql">
	
Select * from (Select top 25 sum([count(newitem)]) as stock, stone from catsubcatinstock  group by stone order by stock desc) x order by stone		
		<!---select distinct stone  as subcat2 from CatSubCatInStock where  (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and style like 'silver%' order by subcat2--->
	</cfquery>
	<cfelseif category neq "" and category neq "ALL" and style eq "">
	<cfquery name="stonelist" datasource="gemssql">
		select distinct stone  as subcat2 from CatSubCatInStock  where cat='#category#' order by  subcat2
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
	Select subcat2 from (Select top 25 sum([inventory]) as stock, stone as subcat2 from catsubcatinstock  group by stone order by stock desc) x order by subcat2




<!---		select distinct stone as subcat2 from CatSubCatInStock where (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') and inventory>10--->
	</cfquery>

	
</cfif>
	<cfquery name="otherstones" datasource="gemssql">
	Select distinct stone as subcat2  from catsubcatinstock where stone not in ( Select 'Blue Topaz' as subcat2
	Union
	Select 'Lemon Quartz' as subcat2
	Union
	Select 'Amber' as subcat2
	union
	Select subcat2 from (Select top 25 sum([inventory]) as stock, stone as subcat2 from catsubcatinstock  group by stone order by stock desc) x) 

and

 (cat <> 'beads' and cat <> 'healing' and cat <> 'ornaments' and cat <>'bags') order by stone
	</cfquery>

   <tr>
                              <td border=0 width="0" align="left"><img src="images/green_left_curve.jpg" width="8" height="34" border=0/></td>
                              <td border=0 align="center"  class="green_bg side_hd"><cfif category eq "All" or category eq "">Popular Gemstones<cfelse><cfoutput>#category# in</cfoutput></cfif></td>
                              <td border=0 width="0" align="left"><img src="images/green_right_curve.jpg" width="8" height="34" border=0/></td>
                            </tr>
<!---<tr>	<td colspan=3 class="bdr_lr green_side_bg green_link_bg">
<cfoutput><a  href='silver<cfif category neq "All" and Category neq "">_#category#</cfif>.cfm' class="side_link" id="silver">Sterling Silver</a></cfoutput></td> </tr>--->

<cfoutput>
	<cfloop query="stonelist" >
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
    <cfset subcat4 = subcat3>
	<cfset subcat3 = replace(trim(subcat3)," ","")>
		<tr>
		<td colspan=3 class="bdr_lr green_side_bg green_link_bg">
		<cfif category eq "" or category eq "ALL">
			<cfif style neq "">
			<a  href='#subcat3#.cfm?style=#style#' class="side_link" id="#subcat2#" >
			<cfelse>	
			<a  href="stones.cfm?subcat=#subcat4#" class="side_link" id="#subcat2#" >
			</cfif>
		<cfelse>
		<a  href='#category#_#subcat3#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
		</cfif>
#subcat2#<cfif style neq "">-#style#</cfif></a>
		</td> 
        </tr>
		</CFIF>
	</cfloop>
		<cfif category eq "" or category eq "ALL">
<tr><td colspan=3 class="green_bg side_hd" align="center"><b>Other Gemstones</b></td></tr>
	<cfloop query="otherstones" >
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
    <cfset subcat3 = replace(trim(subcat3)," ","")>
		<tr>
		<td colspan=3 class="bdr_lr green_side_bg green_link_bg">
		<cfif category eq "" or category eq "ALL">
		<a   href='#subcat3#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
		<cfelse>
		<a   href='#category#_#subcat3#.cfm<cfif style neq "">?style=#style#</cfif>' class="side_link" id="#subcat2#" >
		</cfif>
#subcat2#<cfif style neq "">-#style#</cfif></a>
		</td> 
        </tr>

		</CFIF>
	</cfloop>
		</cfif>
	</cfoutput>
<cfset category=origcat>
