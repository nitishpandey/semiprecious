<cfscript>
 welcome_bottom = "We have been supplying authentic gemstone sterling silver jewelry, beads and healing crystals at wholesale prices to small and medium retail stores and resellers since 1996. We source our gemstones and beads from highly reputed manufacturers and suppliers and all our jewellery is handcrafted by skilled artisans in India. India has a long and respected tradition of manufacturing silver and gold gemstone jewelry. We have a huge collection of silver gemstone necklaces, pendants, rings, earrings, bracelets, brooches, cuff links both for women and men at very competitive wholesale prices. We also manufacture silver jewelry on special customized orders." ;
 txt_your_price = "Wholesale" ;
txt_In_Store_Price = "In Stores";
</cfscript>
<cfparam name="homecols" default="6">
<div style="text-align:right">
<table width="767px" border="0">

       	 <tr>
          <td    align="center" valign="top">
			<div align=center style="text-align:center;float:left;margin-left:0px;width:372px;padding-left:6px;">

				<div align="left" style="margin-left:50px">
<img src="/images/wholesalecenter.jpg" width=320 alt="wholesale sterling jewelry"></div>
			</div>

<cfloop list='beads,rings,pendants,earrings,necklaces,bracelets,healing,brooches,cufflinks,gems' index='category'>

<cfquery name="topselection" datasource="gemssql" cachedWithin="#createTimeSpan(0, 20, 0, 0)#">
	select top #homecols# newitem,basecost, wholesaleprice from items where (cat='#category#' or subcat ='#category#') and (status =0 or status=3) and wholesaleprice>0 and inventory>0 and disporder<100 order by price 
</cfquery>
	
<cfoutput query="topselection" maxrows="1">
	<div class="jewelry_box_home" style="width:165px;text-align:center;" >
       	<div class=heading> 
		    	<div class=URL> 
				<a href="/gem-stone-#category#.cfm" >#category#</a>
					<cfset img = "http://www.semipreciouswholesale.com/images/#category#/thumb/#newitem#.jpg" />
				</div> <!-- here i do not know how to get a new line by use of CSS -->
		</div>
		<div class="content" >
						<div class="big_image" >
			     		<a href="/gem-stone-#category#.cfm" >
								 <img src="#img#" alt="gemstone in silver" /></a>
						</div>
				</div>			  
					<div class="category_description" style="height:50px;"  >
	<b><font =+1 color=purple><cfif category neq 'healing' and category neq 'beads'>SILVER <cfif category is 'necklaces' or category is 'bracelets' or category is 'earrings'> AND BEADED</cfif> </cfif>GEMSTONE #ucase(CATEGORY)#</font></b>		 </div>
<div class="retail_price">
	<cfif category neq 'beads'>
				#txt_In_Store_Price#:&nbsp;#format(value_convert(1)*7.12*basecost/(value_convert(application.exchangerate)))#
				<cfelse>
				<div style="width:80px;height:14px;">&nbsp;</div>
	        </cfif>
			   <!---[<a href="/gemstone_jewelry_gallery.cfm?category=#cat_list#" >More #cat_i#</a>]--->
 		</div>
				<div class="reg_price" style="margin-bottom:4px;">
				<a href="/detail.cfm?newitem=#newitem#" class="side_link" >#txt_your_price#:&nbsp;#format(wholesaleprice)#</a>
			   <!---[<a href="/gemstone_jewelry_gallery.cfm?category=#cat_list#" >More #cat_list#</a>]--->
 
		</div>


</div>	</cfoutput>	
				

</cfloop>

<h1> <b><a href="/bulklots.cfm">GEMSTONE JEWELRY <br>BULK LOTS ARE BACK!!!<br> CLICK HERE!</a></h1>
 </td>
           </tr>
</table>
</div>