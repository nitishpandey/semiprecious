<CFIF subcat is "" and color is "">
<cfparam name=pricegreater default=5>
<cfparam name=priceless default=1000>
</cfif>
<cfparam name="stored" default="">
<cfparam name="located" default="">

 
<cfif url.sortorder is "datetaken desc">
<cfset url.sortorder="newitem desc"></cfif>
<cfsavecontent variable="qry">
<cfoutput>
  Select top 700 status, newitem, price, case 	when inventory>0 then 1 else 0
		end as instock   from <cfif session.country is 'india'>itemsindia<cfelse>items</cfif> 
<!---  <cfif subcat is "" and color is ""> inner join (Select MAX(itemid) as itemid from  styles group by styleid) style on newitem=itemid	</cfif>--->
	 <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') gvr on newitem=itemid </cfif> 
   where 

	 (inventory>-4 	
	 <!---MOO --- <cfif cgi.server_name contains 'wholesale'>or orderonrequest=1<cfelse>or (orderonrequest=1 and price>10)</cfif>--->
	 )  
	 
		<cfif cgi.server_name contains 'wholesale'>
	 and wholesaleprice >0 
	<cfelse>
	and price>0
	</cfif>

and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#category#"  maxlength="15" />  <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags' and cat <>'gems' and cat <>'chains'
           )
     	   </CFIF>
   <CFIF salestatus is 3>
     and (status = 3)
    <CFELSEIF salestatus is 1>
	 	and (status = 1)
     <CFELSE>
     and (status=0 or status=3)
	</CFIF>
	
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

