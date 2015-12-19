<cfset dispcount=14> 
<cfif mobile is "yes"><cfset dispcount=3></cfif>
<cfquery name="latestslide" datasource="gemssql" 	cachedwithin="#createTimespan(0,1,0,0)#"> 
 
select * from (Select top #dispcount#  newitem, cat, subcat, grouping from items with (nolock) where inventory>0 and (status=0 or status=3) and price>0 and subcat<>'bulk lots' and cat='necklaces' and g2i>0   order by disporder ) x
union 
select * from (Select top  #dispcount# newitem, cat, subcat, grouping from items with (nolock)  where inventory>0 and (status=0 or status=3) and price>0 and  subcat<>'bulk lots' and cat='rings'  
and g2i>0 and price>30  order by disporder ) x
union
select * from (Select top  #dispcount# newitem, cat, subcat, grouping from items with (nolock)  where inventory>0 and (status=0 or status=3) and price>0 and  subcat<>'bulk lots' and cat='earrings' and  g2i>0  order by disporder) x
union
select * from (Select top  #dispcount# newitem, cat, subcat, grouping from items with (nolock)  where inventory>0 and (status=0 or status=3) and price>0 and  subcat<>'bulk lots' and cat='bracelets' 
 and  g2i>0    order by disporder) x
union
select * from (Select top  #dispcount# newitem, cat, subcat, grouping from items
 with (nolock)  where inventory>0 and price>0 and  (status=0 or status=3) and subcat<>'bulk lots'
  and cat='healing' and g2i>0  order by disporder) x

order by cat desc
</cfquery>


<cfset counter = #latestslide.recordCount#/2>
<cfif #Evaluate('counter%2')# eq 0>
	<cfset counter = #counter#>
<cfelse>
	<cfset counter = #counter# + 0.5>
</cfif>

<cfset colcount=0> 

<!---
 <a href="/jewelry-sale.cfm"><img src="../images/banner_5.jpg" alt="" align="right"></a> --->

<cfinclude template="/includes/newarrivals.cfm">
<cfquery name="beads" datasource="gemssql" 	cachedwithin="#createTimespan(0,0,5,0)#"> 
 Select top  #dispcount# newitem, cat, subcat, grouping from items with (nolock)  where inventory>0 and (status=0 or status=3) and subcat<>'bulk lots' and cat='beads' order by disporder 

</cfquery> 
     <section class="feature-product">
		<!--- <cfinclude template="/indexhubcssasclass.cfm">--->
	
        <div class="sliderWrapper" id="mySlideshow2" z-index:3>
            <div class="SliderImg">
                <ul>
                	<cfoutput query="beads">
                    <li>	BEADS:
                    	<table border="0" width="100%">
                            <tr align="center">
                                <td>
                                    <div>
                                        <a href="/#replace(trim(lcase(subcat))," ","")#_#lcase(cat)#.cfm" style="font-family:Arial,Helvetica,sans-serif;color:##333333"><img src="/images/#cat#/thumb/#newitem#.jpg" align="middle" alt="#subcat# #grouping# #cat#" 
                                            <cfif cat is 'beads' or cat is 'bracelets'>
                                                width=80
                                            <cfelse>
                                                height=90
                                            </cfif>
                                         ></a>
                                    </div><!--Featured Thumb Ends-->
                                 </td>
                             </tr>
                        	 <tr>
                        	 	<td align="center">
                                    <a href="/#replace(trim(lcase(subcat))," ","")#_#lcase(cat)#.cfm" style="font-family:Arial,Helvetica,sans-serif;color:##333333">
                                        #lcase(subcat)#
                                    </a>
                                </td>
                        	</tr>
                        </table>
                        <div class="clr"></div>
                    </li>
                    </cfoutput>
                </ul>
                <div class="clr"></div>
            </div>

        </div>
				<!--Slider Glass Ends-->
    </section> 
    </article>

