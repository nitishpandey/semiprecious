<!-- home_page_left_menu.cfm starts -->
<cftry>
	<cfparam default="" name="category">
	<cfif category neq 'chains' and category neq 'brooches'>
		<cfparam default="" name="categ">
		<cfparam default="" name="subcat">
		<cfparam default="" name="style">
		<cfif style is 'Silver Setting' or style is 'Silversetting'>
			<cfset style='silver'>
		</cfif>
		<cfif style contains 'beaded'>
			<cfset style='beaded'>
		</cfif>
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
		<cfquery name="stonelistpopular" datasource="gemssql"  cachedwithin="#createtimespan(0,0,5,0)#">
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
			<ul class="mega-menu right" >
				<!--- <cfif cgi.server_name  does not contain 'wholesale'>
					<li  style="background-color:##000"><a href="/jewelry-gemstone-clearance.cfm" ><b>Black Friday</b></a></li>
					</cfif>
				<li>
					<a title="Daily Deals on Semiprecious Jewelry" href="/daily_deals/daily_deals.cfm">
						Real Deals
					</a>
				</li>--->
				<cfloop query="temp_stonelist" startrow="1" endrow="#counter1#">
					<CFIF subcat2 neq "">
						<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
						<cfset subcat4 = subcat3>
						<cfset subcat3 = replace(trim(subcat3)," ","")>
						<!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
						<cfif CGI.PATH_INFO contains "gem-stone-">
							<li>
								<a href="
								<cfif category eq "" or category eq "ALL">
									<cfif style neq "">
										/#subcat3#_#categ#.cfm?style=#style#'
									<cfelse>
										/#lcase(subcat3)#_#categ#.cfm"
									</cfif>
								<cfelse>
									/#subcat3#_#category#.cfm
									<cfif style neq "">
										?style=#style#
									</cfif>
									"
								</cfif>
								id="#subcat2#" >#subcat2# </a>
							</li>
						<cfelse>
							<cfif category eq "" or category eq "ALL" or category eq "jewelry">
								<cfif style neq "">
									<li>
										<a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" >
										<cfelse>
											<cfif cgi.server_name contains 'wholesale'>
									<li><a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" > <cfelse> <li><a href="/#lcase(subcat3)#.cfm" id="#subcat2#" > </cfif>
								</cfif>
								#subcat2#<cfif style neq "">-#style#</cfif></a></li>
							<cfelse>
								<li>
									<a  href='/#subcat3#_#category#.cfm' id="#subcat2#" >
										#subcat2#
									</a>
								</li>
							</cfif>
						</cfif>
					</CFIF>
				</cfloop>
				<cfloop query="temp_stonelist" startrow="#Evaluate('counter1+1')#" endrow="#evaluate(temp_stonelist.recordcount/2)#">
					<CFIF subcat2 neq "">
						<cfset subcat3 = replace(trim(lcase(subcat2)),"_","")>
						<cfset subcat4 = subcat3>
						<cfset subcat3 = replace(trim(subcat3)," ","")>
						<!--- If we are on the hubs page, display 'stone+category' otherwise, just the stone --->
						<cfif CGI.PATH_INFO contains "gem-stone-">
							<cfif category eq "" or category eq "ALL">
								<cfif style neq "">
									<li>
										<a href='/#subcat3#_#categ#.cfm?style=#style#' id="#subcat2#" >
										<cfelse>
									<li><a href="/#lcase(subcat3)#_#categ#.cfm" id="#subcat2#" >
								</cfif>
							<cfelse> <li><a href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' id="#subcat2#" >
							</cfif>
							#subcat2# </a></li>
						<cfelse>
							<cfif category eq "" or category eq "ALL" or category eq "jewelry">
								<cfif style neq "">
									<li>
										<a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" >
										<cfelse>
											<cfif cgi.server_name contains 'wholesale'>
									<li><a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" > <cfelse> <li><a href="/#lcase(subcat3)#.cfm" id="#subcat2#" > </cfif>
								</cfif>
								#subcat2#<cfif style neq "">-#style#</cfif></a></li>
							<cfelse>
								<li>
									<a  href='/#subcat3#_#category#.cfm' id="#subcat2#" >
										#subcat2#
									</a>
								</li>
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
							<cfif CGI.PATH_INFO contains "gem-stone-">
								<cfif category eq "" or category eq "ALL">
									<cfif style neq "">
				<li><a href='/#subcat3#_#categ#.cfm?style=#style#' id="#subcat2#" > <cfelse> <li><a href="/#lcase(subcat3)#_#categ#.cfm" id="#subcat2#" > </cfif> <cfelse> <li><a href='/#subcat3#_#category#.cfm<cfif style neq "">?style=#style#</cfif>' id="#subcat2#" > </cfif> #subcat2# </a></li> <cfelse> <cfif category eq "" or category eq "ALL" or category eq "jewelry"> <cfif style neq ""> <li><a  href='/#subcat3#_jewelry.cfm?style=#style#' id="#subcat2#" > <cfelse> <cfif cgi.server_name contains 'wholesale'> <li><a href="/#lcase(subcat3)#_jewelry.cfm" id="#subcat2#" > <cfelse> <li><a href="/#lcase(subcat3)#.cfm" id="#subcat2#" > </cfif> </cfif> #subcat2#<cfif style neq "">-#style#</cfif></a></li> <cfelse> <li><a  href='/#subcat3#_#category#.cfm' id="#subcat2#" > #subcat2#</a></li> </cfif> </cfif> </CFIF> </cfloop>
				<li>
					<a href=/rare-stones/rare-gems-
					<cfoutput>
						#categ#
					</cfoutput>
					.cfm>Other Gemstones</a>
				</li>
				<li>
					<!---<cfif category eq "" or category eq "ALL">--->
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
<!-- home_page_left_menu.cfm ends -->