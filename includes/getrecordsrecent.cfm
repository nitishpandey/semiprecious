
<cfif url.sortorder is "datetaken desc"><cfset url.sortorder="newitem desc"></cfif>
<cfoutput>
 <cfif (url.sortorder is "lastbought desc" or url.sortorder is "newitem desc") and priceless eq "" and groupname eq "" and color eq "" and subcat is "" and style is "" and advancedsearch is "">
Select  getdate() as lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT top 4 0 as orderbuy,  lastbought, restockdate, disporder, newitem, CAT, style, subcat, subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items  
     where storage='Angela' and inventory>-3  <CFIF category NEQ "ALL">
      and CAT = '#category#' </cfif>  and cat <>'bags' and cat <>'ornaments'   <cfif subcat is not "chain-silver"> and subcat <> 'Chain-Silver' </cfif>
	<CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
	<CFELSE>
	and price>0 
	</CFIF>
	  <cfif subcat is not "">
	
	   and subcat like '#Left(subcat,5)#%' 
	</cfif>	 
	<CFIF salestatus is 3>
	 	and (status = 3)
    <CFELSE>
    	and (status=0 or status=3)
 	</CFIF>
	  <cfif url.style is 'silver'>
	   and (style like 'Silver%') 
		<cfelseif url.style is 'silverbeaded'>
	   and (style = 'Silver Beaded') 
      <cfelseif url.style is 'beaded'>
	   and ((style='beaded') or (style ='Silver Beaded'))
		</cfif>
		  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
 ) x 
   Union
    </cfif>
  Select  case 
   when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case when inventory>0 then '0' else '1'
		end as instock, 
	0+<cfif advancedsearch is not "">
		case 
		  when description like '%#advancedsearch#%' then -1 else 0 end +  
		   </cfif> 1		 as orderbuy,  disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from 
  items
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where  (inventory>-3)  <cfif subcat neq "cubic zirconia"> and (storage not like 'CM%')</cfif>
<CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>
and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = '#category#' <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags'
           )
     	   </CFIF>
   <CFIF salestatus is 3>
     and (status = 3)
     <CFELSE>
     and (status=0 or status=3)
	</CFIF>
  
	  <cfif url.style is 'silver'>
    	   and (style like 'Silver%') 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
    	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
	<cfif subcat is not "chain-silver"> and subcat <> 'Chain-Silver' </cfif> 
	<cfif subcat is not "">

	   and (subcat = '#subcat#' or subcat2 = '#subcat#' or subcat3 = '#subcat#')
	</cfif>	  


  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    <cfset ll = 0.5 * priceless >
    <cfset ul = 1.5 * priceless >
    <cfset url.sortorder = 'price desc' />
      and (price <= #ul# and price >= #ll#)
  </cfif>
<cfif advancedsearch is not "">
and description like '%#advancedsearch#%'
</cfif>
  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
    
    <cfif advancedsearch1 is not "">
   order by  orderbuy 
    <cfelse>
    order by instock, <cfif url.sortorder is "newitem desc"> disporder desc <cfelse><cfoutput>#url.sortorder#</cfoutput> </cfif>    
 </cfif>
</cfoutput>