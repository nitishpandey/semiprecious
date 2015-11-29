<CFIF subcat is "" and color is "">
<cfparam name=pricegreater default=5>
<cfparam name=priceless default=1000>
</cfif>
<cfparam name="stored" default="">
<cfparam name="located" default="">

 
<cfset url.sortorder="price">
<cfsavecontent variable="qry">
<cfoutput>
  Select top 1000 status, newitem, wholesaleprice,saleprice, price, case 	when inventory>0 then 1 else 0
		end as instock   from <cfif session.country is 'india'>itemsindia<cfelse>items</cfif> 
   where saleprice<=1.3*wholesaleprice and inventory>0	 and wholesaleprice >0 
and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#category#"  maxlength="15" />  <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags' and cat <>'gems' and cat <>'chains'
           )
     	   </CFIF>
     and (status = 3)
	
	<cfif session.country neq 'india' and category neq 'gems'>
	and  (storage not like 'IN%')</cfif>
		<cfif stored is 'angela'>
		and (storage = 'angela' )
		</cfif>	
 
	  <cfif url.style is 'silver'>
    	   and ((style = 'Silver Setting') or  (style = 'German Silver')) 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
  		   and ((style='beaded') or (style = 'Silver Beaded'))
	      <cfelseif url.style is 'gs'>
    	   and ((style='german silver'))
				       <cfelseif url.style is 'none'>
    	   and ((style is null))
			  <cfelseif url.style is 'gold'>
    	   and ((style like 'gold%') or material like 'gold%')
		
		</cfif>
		
	<cfif subcat is not "">
	   and (subcat = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#subcat#"  maxlength="35" /> or
		  subcat2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#subcat#"  maxlength="35" />)
	</cfif>	  


  <CFIF color is not "">
    and (color like '#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    <cfset ll = pricegreater >
    <cfset ul = priceless >
      
	  and (price <= #ul# and price >= #ll#)
  </cfif>
<!---<cfif advancedsearch is not "">
and (description like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or description like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or description like '%#advancedsearch3#%'</cfif> or  --->
  <cfif ringsize neq ""> and newitem in (select  itemid from options, <cfif session.country is 'india'>itemsindia<cfelse>items</cfif> where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>  
    order by  instock desc,
	 <cfif cgi.server_name contains 'wholesale'>  disporderwhole<cfelse> #url.sortorder#, status</cfif>   
	</cfoutput>
 </cfsavecontent>
 <cfoutput>
 #qry#
</cfoutput>

