<cfif url.ringsize is "0.11"> <cfset jewelrysize="0.11"><cfset ringsize=0></cfif>
<cfif style is 'silver beaded'><cfset style='Silverbeaded'></cfif>
<cfif  advancedsearch contains 'silver'>
<cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
<cfset url.style='Silver'>
</cfif>
<cfif url.style is 'silver setting'><cfset url.style='silver'></cfif>
<cfset style=url.style>
<cfif  advancedsearch contains 'neck'><cfset category='necklaces'>
<cfset advancedsearch=replacenocase(advancedsearch," necklace "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," necklaces "," ")>
</cfif>
<cfif  advancedsearch contains 'earr'><cfset category='earrings'>
<cfset advancedsearch=replacenocase(advancedsearch," earring "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," earrings "," ")>
</cfif>
<cfif  advancedsearch contains ' ring'><cfset category='rings'>
<cfset advancedsearch=replacenocase(advancedsearch," rings "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," ring "," ")>
</cfif>
<cfif  advancedsearch contains 'brace'><cfset category='bracelets'>
<cfset advancedsearch=replacenocase(advancedsearch," bracelet "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," bracelets "," ")>
</cfif>
<cfif  advancedsearch contains 'pend'><cfset category='pendants'>
<cfset advancedsearch=replacenocase(advancedsearch," pendant "," ")>
<cfset advancedsearch=replacenocase(advancedsearch," pendants "," ")>
</cfif>


<cfif category is ""><cfset category=categ></cfif>
<cfif category is ""><cfset category="All"></cfif>

<cfoutput>
 <cfif (url.sortorder is "lastbought desc" or url.sortorder is "datetaken desc") and priceless eq "" and groupname eq "" and color eq "" and subcat is "" and style is "" and advancedsearch is "">
Select  grouping, getdate() as lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT top 4 0 as orderbuy,   grouping,  lastbought, restockdate, disporder, newitem, CAT, style, subcat, subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from items  
     where storage='Angela' and inventory>-3 <cfif category is 'jewelry'> and category <>'healing'<cfset category='all'></cfif> <CFIF category NEQ "ALL">
       and CAT = '#category#' </cfif>  and cat <>'bags'    <cfif subcat is not "chain-silver"> and subcat <> 'Chain-Silver' </cfif>
	<CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
	<CFELSE>
	and price>0 
	</CFIF>
	  <cfif subcat is not "">
	
	   and subcat like '#Left(subcat,5)#%' 
	</cfif>	
  <cfif jewelrysize is not "">
	
	   and size >= #jewelrysize#*0.75 and size < #jewelrysize#*1.25
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
  <cfif ringsize neq "" and ringsize neq 0> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
 ) x 
   Union
    </cfif>
  Select   grouping, case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock,
orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy, grouping,  lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from 
   <cfif (url.sortorder is "lastbought desc" or url.sortorder is "datetaken desc") and subcat is "" and groupname is "" and color is "" and priceless is "" and style is "" and advancedsearch is ""> 
   (select top 500 * from items where (1=1)  and <CFIF category NEQ "ALL">
        CAT = '#category#' and </cfif> inventory>-3 order by datetaken desc) <cfelseif    url.sortorder is "price desc" and subcat is ""> 
	     (select top 500 * from items where  (1=1)  and <CFIF category NEQ "ALL">
       CAT = '#category#' and  </cfif> inventory>-3 order by price desc) 
	     </cfif> items
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where  (inventory>-3)  <cfif subcat neq "cubic zirconia"> and (storage not like 'CM%')</cfif>
<CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>

         <CFIF category NEQ "ALL">
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
  <cfif jewelrysize is not "">
	
	    and size >= #jewelrysize#*0.7 and size < #jewelrysize#*1.3
	</cfif> 
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


  <CFIF advancedsearch1 is not "">
    and (left(subcat,5) ='#advancedsearch1#')  
  </CFIF>
  <CFIF advancedsearch2 is not "">
    and ((left(subcat,5) = '#advancedsearch2#'))
  </CFIF>
  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    <cfset ll = 0.5 * priceless >
    <cfset ul = 1.5 * priceless >
    <cfset url.sortorder = 'price desc' />
      and (price <= #ul# and price >= #ll#)
  </cfif>

  <cfif ringsize neq "" and ringsize neq 0> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>) c
    
  <CFIF advancedsearch is not "">
    UNION 
	
	 SELECT   grouping, case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, 1 as orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy,  grouping, lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from Items where (inventory>-3)
      <CFIF category NEQ "ALL">
        and (CAT = '#category#'             )
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
        <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like 'silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '#Left(subcat,5)#%')
	   </cfdefaultcase>
      </CFswitch>
    <CFIF advancedsearch1 is not "">
      and (left(subcat,5)  like '%#advancedsearch1#%')
    </CFIF>
    <CFIF 	color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>) y
  </CFIF>
  <CFIF advancedsearch is not "">
    UNION 
		 SELECT  grouping,  case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, 1 as orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 0 as orderbuy,  grouping,  lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice
 from Items where (inventory>-3)
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
     )
      </CFIF>
    <CFIF salestatus is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)

    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->
		<cfif url.style is 'silver'>
    	   and (style like 'Silver%') 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
    	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
         <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like 'silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '#subcat#')
	   </cfdefaultcase>
      </CFswitch>
    <CFIF advancedsearch1 is not "">
      and (description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      and (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF advancedsearch3 is not "">
      and (description like '%#advancedsearch3#%')
    </CFIF>
    <CFIF color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>
  ) j</CFIF>
  <CFIF advancedsearch3 is not "">
    UNION 	 SELECT   grouping, case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 3 as orderbuy,  grouping, lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice
 from Items where (inventory>-3 )
      <CFIF category NEQ "ALL">
        and (CAT = '#category#' 
         )
      </CFIF>
    <CFIF salestatus	 is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->
<cfif url.style is 'silver'>
    	   and (style like 'Silver%') 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
    	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
      <Cfswitch expression="#subcat#">
	  <cfcase value="">
	  </cfcase>
      <cfcase value="beaded">
	   and (subcat not like 'silver%')
	  </cfcase>
	  <cfdefaultcase >
	   and (subcat like '#subcat#')
	   </cfdefaultcase>
      </CFswitch>
    <CFIF advancedsearch1 is not "">
      and (description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      and (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>) k
  </CFIF>
  <CFIF advancedsearch1 is not "">
    UNION	SELECT   grouping, case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT 4 as orderbuy,  grouping, lastbought, restockdate, disporder, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from Items where (inventory>-3 )
      <CFIF category NEQ "ALL">
        and (CAT = '#category#')
      </CFIF>
    <CFIF salestatus is 3>
      and (status = 3)
      <CFELSE>
      and (status=0 or status=3)
    </CFIF>
    <!--- <cfif edit is "" and session.mail is not 'pandey@aol.com'>and inventory>0</cfif> --->
	<cfif url.style is 'silver'>
    	   and (style like 'Silver%') 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
    	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
    <CFIF subcat is not "">
      and (subcat like '%#Left(subcat,4)#%')
    </CFIF>
    <CFIF advancedsearch1 is not "">
      and ((description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      or (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF advancedsearch3 is not "">
      or (description like '%#advancedsearch3#%')
    </CFIF>
    ) 
	
	<!---And NOT ( 
    <CFIF advancedsearch1 is not "">
      (description like '%#advancedsearch1#%')
    </CFIF>
    <CFIF advancedsearch2 is not "">
      and (description like '%#advancedsearch2#%')
    </CFIF>
    <CFIF advancedsearch3 is not "">
      and (description like '%#advancedsearch3#%')
    </CFIF>
) --->
    <CFIF color is not "">
      and (color like '%#color#%')
    </CFIF>
    <CFIF priceless is not "">
      and (price <= #evaluate(priceless+10)# and price >= #evaluate(priceless-10)#)
    </cfif>
  ) v
  </cfif>
  <cfif advancedsearch1 is not "">
   order by  orderbuy 
    <cfelse>
    order by instock, <cfif url.sortorder is "datetaken desc"> disporder desc <cfelse><cfoutput>#url.sortorder#</cfoutput> </cfif>    
 </cfif>
</cfoutput>