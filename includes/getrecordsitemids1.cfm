<CFIF subcat is "" and color is "">
<cfparam name=pricegreater default=15>
<cfparam name=priceless default=1000>
</cfif>
<cfparam name="stored" default="">
<cfparam name="located" default="">
<cfparam name="sortorder" default="" />
<cfparam name="url.sortorder" default="#sortorder#" />
<cfif url.sortorder contains 'lastbought'>
	<cfset url.sortorder='totalqtysold desc'>
</cfif>
<cfif sortorder contains 'lastbought'>
	<cfset url.sortorder='totalqtysold desc'>
</cfif>


<cfif url.sortorder is "datetaken desc">
<cfset url.sortorder="newitem desc"></cfif>
<cfsavecontent variable="qry">
<cfoutput> <cfif (url.sortorder is "totalqtysold desc" or url.sortorder is "newitem desc") and
  priceless eq "" and groupname eq "" and
  color eq "" and subcat is "" and style is "" and advancedsearch is "">
Select top 1000 status,newitem, price,
  case 	when inventory>0 then 1 else 0
		end as instock      <cfif  (url.sortorder contains "totalqtysold")>, totalqtysold from 
		(select top 1000 k.status, k.newitem, k.cat, k.color, k.subcat,k.subcat2,k.style,k.inventory,storage, <CFIF len(session.bulkbuyer.id)>wholesaleprice as price<cfelse>price</cfif>, p.totalqtysold from items k inner join (select newitem, sum(dbo.buyingrecord.quantity) as totalqtysold 
		from dbo.items inner join dbo.buyingrecord on dbo.items.newitem = dbo.buyingrecord.itemid
		group by newitem) p on k.newitem = p.newitem ) temp_table1
		<cfelse>
   from items  
   </cfif>

     where <cfif session.country is 'india'>storage like 'IN%' and </cfif> storage='Angela' and inventory>0 
	 <CFIF category NEQ "ALL">
      and CAT = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#category#"  maxlength="35" />
	  </cfif>  
	  and cat <>'bags' and cat <>'ornaments' and cat <> 'gems' 
	<cfif cgi.server_name contains 'wholesale'>
	and wholesaleprice>0
	</cfif>

	<CFIF len(session.bulkbuyer.id)>  and (storage not like 'CM%')
	</CFIF>
	<cfif pricegreater is "" or pricegreater is 0>
	and price>10
	<cfelse>
	and price>0
	</cfif> 
	  <cfif subcat is not "">
	
	   and subcat = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#subcat#"  maxlength="35" />
	</cfif>	 
	<CFIF salestatus is 3>
	 	and (status = 3)
    <CFELSEIF salestatus is 1>
	 	and (status = 1)
    <cfelse>
    	and (status=0 or status=3)
 	</CFIF>
		<CFIF located is 'US'>
	 	and (storage not like 'IN%' )
 		</CFIF>
		<cfif stored is 'angela'>
		and (storage = 'angela' )
		</cfif>	
	  <cfif url.style is 'silver'>
	   and (style = 'Silver Setting') 
		<cfelseif url.style is 'silverbeaded'>
	   and (style = 'Silver Beaded') 
      <cfelseif url.style is 'beaded'>
	   and ((style='beaded') or (style ='Silver Beaded'))
		</cfif>
		  <CFIF color is not "">
    and (color like '#color#%')
  </CFIF>

  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  
  </cfif>
	
   Union
  </cfif>
  Select top 1000 status, newitem, price, case 	when inventory>0 then 1 else 0
		end as instock      <cfif (url.sortorder contains "totalqtysold")>, totalqtysold from 
				(select top 1000 k.status, k.newitem,k.subcat,k.color, k.subcat2,k.style, k.inventory,k.cat, storage,<CFIF len(session.bulkbuyer.id)>wholesaleprice as price<cfelse>price</cfif>, p.totalqtysold from items k inner join (select newitem, sum(dbo.buyingrecord.quantity) as totalqtysold 
		from dbo.items inner join dbo.buyingrecord on dbo.items.newitem = dbo.buyingrecord.itemid
		group by newitem) p on k.newitem = p.newitem ) temp_table2
		<cfelse>
   from items  </cfif>

   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') gvr on newitem=itemid </cfif> 
   where <cfif session.country is 'india'>storage like 'IN%' and </cfif> (inventory>0)  <cfif subcat neq "cubic zirconia"> and (storage not like 'CM%')</cfif>
<CFIF len(session.bulkbuyer.id)>  and (storage not like 'CM%')
</CFIF>
		<cfif cgi.server_name contains 'wholesale'>
	and wholesaleprice>0
	</cfif>

	<cfif pricegreater is "" or pricegreater is 0>
	and price>10
	<cfelse>
	and price>0
	</cfif>
 
and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#category#"  maxlength="15" />  <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags'  and cat <>'healing' and cat <> 'gems' and cat <>'chains'
           )
     	   </CFIF>
   <CFIF salestatus is 3>
     and (status = 3)
    <CFELSEIF salestatus is 1>
	 	and (status = 1)
     <CFELSE>
     and (status=0 or status=3)
	</CFIF>
		<CFIF located is 'US'>
	 	and (storage not like 'IN%' )
 		</CFIF>
		<cfif stored is 'angela'>
		and (storage = 'angela' )
		</cfif>	
 
	  <cfif url.style is 'silver'>
    	   and (style = 'Silver Setting') 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
    	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
	<cfif subcat is not "">
	   and (subcat = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#subcat#"  maxlength="35" /> or subcat2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#subcat#"  maxlength="35" />)
	</cfif>	  


  <CFIF color is not "">
    and (color like '#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    <cfset ll = pricegreater >
    <cfset ul = priceless >
    <cfset url.sortorder = 'price desc' />
      
	  and (price <= #ul# and price >= #ll#)
  </cfif>
<!---<cfif advancedsearch is not "">
and (description like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or description like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or description like '%#advancedsearch3#%'</cfif> or  --->
<cfif advancedsearch is not ""> and
(grouping like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or grouping like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or grouping like '%#advancedsearch3#%'</cfif>
or
subcat like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or subcat like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or subcat like '%#advancedsearch3#%'</cfif>
) 
</cfif>
  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
    
  
    order by  instock desc,   #url.sortorder#, status asc   
	</cfoutput>
 </cfsavecontent>
 <cfoutput>
 #qry#
</cfoutput>

