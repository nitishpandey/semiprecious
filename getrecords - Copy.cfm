<cfparam name="stored" default="">
<cfparam name="located" default="">
<cfif url.sortorder contains 'lastbought'><cfset url.sortorder='totalqtysold desc'></cfif>
<cfif sortorder contains 'lastbought'><cfset sortorder='totalqtysold desc'></cfif>
<!---<CFPARAM NAME="advancedsearch" DEFAULT= "">
 <CFPARAM NAME="advancedsearch1" DEFAULT= "">
<CFPARAM NAME="advancedsearch2" DEFAULT= ""> 
<CFPARAM NAME="advancedsearch3" DEFAULT= "">

<cfif style is 'silver beaded'><cfset style='Silverbeaded'></cfif>
<cfif advancedsearch neq "">
    <cfif  advancedsearch contains 'silver'>
    <cfset advancedsearch=replacenocase(advancedsearch,"silver"," ")>
    <cfset url.style='Silver'>
    </cfif>
    
    <cfif  advancedsearch contains ' neck'><cfset category='necklaces'>
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
    <cfset advancedsearch=replacenocase(advancedsearch,"bracelet"," ")>
    <cfset advancedsearch=replacenocase(advancedsearch,"bracelets"," ")>
    </cfif>
    <cfif  advancedsearch contains 'pend'><cfset category='pendants'>
    <cfset advancedsearch=replacenocase(advancedsearch," pendant "," ")>
    <cfset advancedsearch=replacenocase(advancedsearch," pendants "," ")>
    </cfif>
</cfif>
<cfoutput>$$#category# #advancedsearch#</cfoutput>
<cfscript>
cgiqstring = CGI.QUERY_STRING ;
if (session.bulkbuyer.id neq "" )
{
 url.sortorder = replace(url.sortorder,'price','wholesaleprice') ;
 url.sortorder = replace(url.sortorder,'wholesalewholesale','wholesale') ;
cgiqstring= replace(cgi.QUERY_STRING,'sortorder=price','sortorder=wholesaleprice') ;
// unable to do the following within cfscript, but possible in cfset so do outside
// cgi.QUERY_STRING = cgiqstring; 
 } 

  session.gallery = 'list' ;  // used to determine on cart page whether the buyer should be routed to gemstone_jewelry_gallery.cfm or gemstone.cfm when he clicks on continue shopping 
IF (advancedsearch is not "") {
 
 advancedsearch=replacenocase(advancedsearch," & "," ");
 advancedsearch=replacenocase(advancedsearch,"'","");
 advancedsearch=replacenocase(advancedsearch,"jewelry"," ");
 advancedsearch=replacenocase(advancedsearch,"items"," ");
 advancedsearch=replacenocase(advancedsearch,"item"," ");
 advancedsearch=replacenocase(advancedsearch,"gold stone","Goldstone");
 advancedsearch=replacenocase(advancedsearch,"mixed stone","multi-stone");
 advancedsearch=replacenocase(advancedsearch,"multistrand","multi strand");
  advancedsearch=replacenocase(advancedsearch,"multistone","multi stone");
 advancedsearch=replacenocase(advancedsearch,"shap"," styl");
  advancedsearch=replacenocase(advancedsearch,"shap"," styl");
if ( find("$",advancedsearch) or find("dollar",advancedsearch)) {
 remark = '(You can select price range at bottom)'; }
else {
 remark =''; 
}
 advancedsearch=replacenocase(advancedsearch,"jewellery"," ");
 advancedsearch=replacenocase(advancedsearch," or "," ");
 advancedsearch=replacenocase(advancedsearch,","," ");
 advancedsearch=replacenocase(advancedsearch," on "," ");
 advancedsearch=replacenocase(advancedsearch,"colored"," ");
  advancedsearch=replacenocase(advancedsearch,"coloured"," ");
  advancedsearch=replacenocase(advancedsearch,"quartz","crystal quartz");
 advancedsearch=replacenocase(advancedsearch,"color"," ");
  advancedsearch=replacenocase(advancedsearch,"colour"," ");
 advancedsearch=replacenocase(advancedsearch," with "," ");
 advancedsearch=replacenocase(advancedsearch," semiprecious "," ");
if (listlen(advancedsearch," ") gt 0) {
   advancedsearch=replacenocase(advancedsearch," and ", " ");
   advancedsearch1 = left(listGetat(advancedsearch,1," "),4);
}
if (listlen(advancedsearch," ") gt 1) {
   advancedsearch2 = left(listGetat(advancedsearch,2," "),4);
}
if (listlen(advancedsearch," ") gt 2) {
   advancedsearch3 = left(listGetat(advancedsearch,3," "),4);
}
 colors ='Red,Blue,Gray,Orange,Green,Maroon,Black,Pink,White,Maroon,Purple';
if ( listcontainsnocase(colors, advancedsearch1)){
   color= advancedsearch1;
}
   display=21;
   displaycolumns = 5;

}
</cfscript>
<cfoutput>$$#category#</cfoutput>
--->
<cfif url.sortorder is "datetaken desc">
<cfset url.sortorder="newitem desc"></cfif>
<cfoutput>
 <cfif (url.sortorder is "totalqtysold desc" or url.sortorder is "newitem desc") and
  priceless eq "" and groupname eq "" and
  color eq "" and subcat is "" and style is "" and advancedsearch is "">
Select top 2000 weight, size, totalqtysold, itemnumber as optcount, grouping, color, getdate() as lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, orderbuy, disporder, disporderwhole, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink ,  orderprice from (SELECT  top 4 weight, size, 0 as orderbuy,  totalqtysold, itemnumber,  grouping, color, lastbought, restockdate, disporder, disporderwhole, newitem, CAT, style, subcat, subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from 
    <cfif (url.sortorder contains "totalqtysold")> itemspopular<cfelse>
   items  </cfif>
     where storage='Angela' and inventory>-3  <CFIF category NEQ "ALL">
      and CAT = '#category#' </cfif>  and cat <>'bags' and cat <>'ornaments'  
	<CFIF cgi.server_name contains "wholesale" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
	<CFELSE>
	and price>0 
	</CFIF>
	  <cfif subcat is not "">
	
	   and subcat = '#subcat#' 
	</cfif>	 
	<CFIF salestatus is 3>
	 	and (status = 3)
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
	   and ((style='beaded') or (style ='Silver Beaded'))
		</cfif>
		  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>

  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
   order by		  <cfoutput>#url.sortorder#</cfoutput> ) x 
   Union
    </cfif>
  Select top 2000 weight,  size, totalqtysold, itemnumber as optcount, grouping, color, case 
   when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case when inventory>0 then '0' else '1'
		end as instock, 
	0+<cfif advancedsearch1 is not "">
		case 
		  when description like '%#advancedsearch1#%' then -1 else 0 end +
		  </cfif>  
		<cfif advancedsearch2 is not "">
		  case 
		  when description like '%#advancedsearch2#%' then -1 else 0 end +
		 </cfif>
		<cfif advancedsearch3 is not "">
		 case 
		  when description like '%#advancedsearch3#%' then -1 else 0 end +
		  </cfif> 1		 as orderbuy,  disporder, disporderwhole, newitem, CAT, style, subcat,subcat2, datetaken,   NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink , case status when 3 then saleprice else price end as orderprice from 
    <cfif (url.sortorder contains "totalqtysold")> itemspopular<cfelse>
   items  </cfif>
   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') igr on newitem=itemid </cfif> 
   where  (inventory>-1)  <cfif subcat neq "cubic zirconia"> and (storage not like 'CM%')</cfif>
<CFIF cgi.server_name contains "wholesale" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>
and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = '#category#'  <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags' AND cat <> 'gems'  and cat <>'healing' and cat <>'chains'
           )
     	   </CFIF>
   <CFIF salestatus is 3>
     and (status = 3)
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
  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
    
    <cfif advancedsearch1 is not "">
   order by instock, orderbuy 
    <cfelse>
    order by instock, status , <cfoutput>#url.sortorder#</cfoutput>    
 </cfif>
</cfoutput>

