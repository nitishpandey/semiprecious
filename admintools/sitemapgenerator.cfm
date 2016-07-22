<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<url>
<loc>http://www.semiprecious.com</loc>
<lastmod>2009-09-20</lastmod>
<changefreq>weekly</changefreq>
<priority>1</priority>
</url>
<cfsilent>
<!---categories  Priority 1 --->
<cfquery name=categories datasource=gemssql2>
Select distinct cat from CatSubCatInStock where cat <>'bags' 
</cfquery>
</cfsilent>
<cfoutput query=categories>
<url>
<loc>http://www.semiprecious.com/#lcase(cat)#.cfm</loc>
<lastmod>2009-09-15</lastmod>
<changefreq>monthly</changefreq>
<priority>1</priority>
</url>
 <url>
<loc>http://www.semiprecious.com/cheap-#lcase(cat)#.cfm</loc>
<lastmod>2009-09-15</lastmod>
<changefreq>monthly</changefreq>
<priority>0.6</priority>
</url>
</cfoutput>
<cfsilent><!---stones  Priority 1 --->
<cfquery name=stones datasource=gemssql2>
Select distinct stone from CatSubCatInStock where cat <>'beads' and cat <>'bags'
</cfquery>
</cfsilent>
<cfoutput query=stones>
 <url>
<loc>http://www.semiprecious.com/#lcase(replace(replace(stone," ","","All"),",","_","All"))#.cfm</loc>
<lastmod>2009-09-15</lastmod>
<changefreq>monthly</changefreq>
<priority>1</priority>
</url>
</cfoutput>
<cfsilent><!---stones-category  Priority 0.9 --->
<cfquery name=stonecat datasource=gemssql2>
Select distinct stone as subcat, cat from CatSubCatInStock 
</cfquery>
</cfsilent>
<cfoutput query=stonecat>
 <url>
<loc>http://www.semiprecious.com/#lcase(replace(replace(subcat," ","","All"),",","_","All"))#_#lcase(cat)#.cfm</loc>
<lastmod>2009-09-14</lastmod>
<changefreq>weekly</changefreq>
<priority>0.9</priority>
</url>
</cfoutput>
<cfsilent><!--- color pages --->
  <cfset colorlist ="orange,purple,white,pink,red,blue,gray,grey,black,green,brown,yellow,multi-color">
 <!---color-category pages  Priority 1 --->
  <cfset colorlist ="orange,purple,white,pink,red,blue,gray,grey,black,green,brown,yellow,multi-color">
  <cfset catlist ="jewelry,jewellery,beads,necklaces,pendants,earrings,brouches,rings,healing,bracelets">
</cfsilent>         <cfloop index="catname" 
         list=#catlist#>
            <cfloop index="colorname"
             list=#colorlist#>
  	
         <url>
         <loc>http://www.semiprecious.com/color-gem-stone/<cfoutput>#lcase(colorname)#-#lcase(catname)#</cfoutput>.cfm</loc>
         <lastmod>2009-09-16</lastmod>
         <changefreq>monthly</changefreq>
         <priority>0.9</priority>
         </url>
            </cfloop>
          </cfloop>
 <cfsilent>
 <!---groups  Priority 1 --->
<cfquery name=group datasource=gemssql2>
Select distinct groupname from groupings
</cfquery></cfsilent>
	<cfoutput query=group>
         <url>
         <loc>http://www.semiprecious.com/shaped/#lcase(groupname)#-gemstone-jewellery.cfm</loc>
         <lastmod>2009-09-16</lastmod>
         <changefreq>monthly</changefreq>
         <priority>0.8</priority>
         </url>   </cfoutput>
   <cfsilent><!---categories  Priority 1 --->
<cfquery name=groupcat datasource=gemssql2>
Select  groupname, cat from groupings
</cfquery>
</cfsilent>	<cfoutput query=groupcat>
            <url>
         <loc>http://www.semiprecious.com/shaped/#lcase(groupname)#-gemstone-#lcase(cat)#.cfm</loc>
         <lastmod>2009-09-16</lastmod>
         <changefreq>monthly</changefreq>
         <priority>0.8</priority>
         </url>
   </cfoutput>
   <cfsilent>   <!---each item  Priority 1 --->
<cfquery name=items datasource=gemssql2>
Select  newitem, cat, subcat, grouping from items where (status=0 or status=3) and cat <>'bags'
</cfquery></cfsilent>
	<cfoutput query=items>
         <url>
         <loc>http://www.semiprecious.com/gem_stone_#cat#.cfm/#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#<cfif grouping neq "">_#grouping#</cfif>.htm</loc>
		 <lastmod>2009-09-16</lastmod>
         <changefreq>monthly</changefreq>
         <priority>0.6</priority>
         </url>
   </cfoutput>
 </urlset>  
   