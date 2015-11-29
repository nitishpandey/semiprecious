<cfparam name="stored" default="">
<cfparam name="located" default="">
<cfparam name="lastdispval" default="0">
<cfparam name="lastitemid" default="0">
<cfif url.sortorder contains 'lastbought'><cfset sortorder='totalqtysold desc'></cfif>
<cfif sortorder contains 'lastbought'><cfset sortorder='totalqtysold desc'></cfif>
<cfif url.sortorder is "datetaken desc">
<cfset url.sortorder="newitem desc"></cfif>
<cfoutput>

  Select newitem, cat, subcat, color, grouping, size, weight, basecost, status from 
    <cfif (url.sortorder contains "totalqtysold")> itemspopular<cfelse>
   itemsactive  </cfif>
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where  (inventory>0 or orderonrequest=1)  <cfif subcat neq "cubic zirconia"> and (storage not like 'CM%')</cfif>
<CFIF cgi.server_name contains "wholesale" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>
and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = '#category#'  <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags'  and cat <>'healing' and cat <>'chains'
           )
     	   </CFIF>
   <CFIF salestatus is 3>
     and (status = 3)
    <CFELSEIF salestatus is 1>
	 	and (status = 1)
     <CFELSE>
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
	   and (subcat = '#subcat#' or subcat2 = '#subcat#')
	</cfif>	  


  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    <cfset ll = pricegreater >
    <cfset ul = priceless >
    <cfset url.sortorder = 'price desc' />
      
	  <cfif cgi.server_name contains 'wholesale' or session.bulkbuyer.id contains '@'>
	  and (wholesaleprice <= #ul# and wholesaleprice >= #ll#)
	  <cfelse>
	  and (price <= #ul# and price >= #ll#)
	  </cfif>
  </cfif>
<cfif advancedsearch is not "">
and (description like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or description like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or description like '%#advancedsearch3#%'</cfif>
or
grouping like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or grouping like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or grouping like '%#advancedsearch3#%'</cfif>
or
subcat like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or subcat like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or subcat like '%#advancedsearch3#%'</cfif>
) 
</cfif>
  <cfif ringsize neq ""> and newitem in (select  itemid from options, itemsactive where cat='rings' and options.itemid=itemsactive.newitem  and options.description='#ringsize#' )  </cfif>
   
</cfoutput>

