<!---  <section class="feature-product">
        <div class="sliderWrapper">
            <table>
                <tr>
                    <td>
										<img src="/images/center_pics/scarlet-beaded-jewelry.jpg" alt="beaded gemstone jewelry">
                    </td>
                </tr>
            </table>
        </div>
	</section>
  --->
	<!--- list of stones with jewelry --->
<cfif session.country is "india"> 
<cfquery DATASOURCE="gemssql"  name="getlist">
select newitem, subcat,cat from itemsindia
where inventory>0 order by datetaken desc
</cfquery>
<cfelse>

<cfquery DATASOURCE="gemssql"  name="getlist" cachedwithin="#createtimespan(0,1,0,0)#">
select * from (select top 4 newitem, subcat,cat, datetaken from items
where inventory>0 and price>0 and  cat='earrings' order by disporder
UNION 
select top 4 newitem, subcat,cat, datetaken from items
where inventory>0 and   price>0 and cat='rings' order by disporder
union
select top 4 newitem, subcat,cat, datetaken from items
where inventory>0 and price>0 and cat='pendants' order by disporder
union
select top 4 newitem, subcat,cat, datetaken from items
where inventory>0 and  price>0 and cat='necklaces' order by disporder
union
select top 4 newitem, subcat,cat, datetaken from items
where inventory>0 and   price>0 and cat='bracelets' order by disporder   
union
select top 4 newitem, subcat,cat, datetaken from items
where inventory>0 and  price>0 and cat='cufflinks' order by disporder

) x 
</cfquery>

</cfif>
		 <cfcache timespan="0.1"> 

	<section class="mid-product">
     	<ul>
        	<cfoutput query="Getlist" maxrows="24">
                <li class="nobor">
                	<table style="font-size:11px;text-align:center"  border="0" width="80%">
                    	<tr>
                    		<td width="30%">
												<a href="/jewelry_item.cfm?newitem=#newitem#" border=0><img src=/images/#cat#/thumb/#newitem#.jpg alt="#subcat# gemstone #cat#" height=60 border=0></a>
                    		</td>
                    		<td>
                    			<a href='/#replace(lcase(subcat)," ","",'all')#.cfm' style="font-family:Arial, Helvetica, sans-serif;color:##333333">#lcase(subcat)#</a> 
                    		</td>
                    	</tr>
                    </table>
                    <div class="clr"></div>
                </li>
            </cfoutput>
        </ul>
        <div class="clr" align="right" style="font-family:Arial, Helvetica, sans-serif;color:##33333;margin-bottom:14px">
        	<br><a href="/latest-jewelry.cfm" style="color:##333333"><b>Click here to view more ...</b></a>
        </div>
    </section><!--Mid Product Ends--> 
    
</CFCACHE>    		
