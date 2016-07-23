<cfif cgi.server_name neq "www.wholesale-gemstone-jewelry.com" and cgi.server_name neq "wholesale-gemstone-jewelry.com">
Select  case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock,
orderbuy, disporder, newitem, CAT, subcat, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy, lastbought, restockdate, disporder, newitem, CAT, subcat, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items where  (inventory>#invstatus#) and (storage ='Angela')



<!---<cfif jewelrysize NEQ ""> and size>19</cfif> --->
    <CFIF category NEQ "ALL">
      and (CAT = '#category#' or CAT2 = '#category#'
      )
     <cfelse>
      and (CAT <> 'beads' 
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

	<cfif subcat is not "">
	   and (subcat like '#Left(subcat,5)#%' or subcat2 like '#Left(subcat,4)#%' or subcat3 like '#Left(subcat,4)#%')
	</cfif>	  
Union
</cfif>
