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
select top 24 subcat as subcat2, SUM(inventory) as inventory from itemsindia
 group by subcat order by inventory desc
</cfquery>
<cfelse>

<cfquery DATASOURCE="gemssql"  name="getlist">
    Select  distinct top 24 stone as subcat2, sum(inventory) as inventory 
    from catsubcatinstock where inventory>0 and popular =1
    and  cat <> 'ornaments' 
    and cat <>'bags'  
    and cat <>'beads' 
    and cat <>'healing' 
    and cat <>'gems' 
    and stone <>'bulk lots'  
    and stone <>'fabric' 
    and stone<>'silk thread' 
    group by stone 
    order by inventory desc 
</cfquery>

</cfif>

<section class="mid-product">
          <div id="divider1" style="position:relative;background-color:#9bc8d2;width:800px;height:10px"></div>
     	<ul>
        	<cfoutput query="Getlist" maxrows="24">
                <li class="nobor">
                	<table style="font-size:11px;" border="0" width="100%">
                    	<tr>
                    		<td width="40%">
                    			<img src=/images/stones/gemstone-thumbs/#replace(lcase(subcat2)," ","",'all')#-n.jpg alt="#subcat2# gemstone thumbnail">
                    		</td>
                    		<td width="80%">
                    			<a href='/#replace(lcase(subcat2)," ","",'all')#.cfm' style="font-family:Arial, Helvetica, sans-serif;color:##333333">#ucase(subcat2)# Jewelry</a> 
                    		</td>
                    	</tr>
                    </table>
                    
                </li>
            </cfoutput>
        </ul>
       <div class="clr" align="right" style="font-family:Arial, Helvetica, sans-serif;color:##33333;margin-bottom:8px">
        	<a href="/rare-stones/rare-gems-jewelry.cfm" style="color:##333333"><b>Click here to view more ...</b></a>
        </div>
    </section><!--Mid Product Ends--> 
    
    		
