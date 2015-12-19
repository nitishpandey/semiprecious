	<cftry><cfparam name="stored" default="">
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
Select top <cfif url.sortorder eq 'newitem desc'>500<cfelse>1000</cfif> status, newitem, orderonrequest, price,  cat, color, subcat,grouping,size,weight, case 	when inventory>0 then '0' else '1'
		end as instock      <cfif (sortorder contains "totalqtysold")>, totalqtysold from itemspopular<cfelse>
   from items  </cfif>

     where <cfif session.country is 'india'>storage like 'IN%' and </cfif> storage='Angela' and inventory>0<CFIF category NEQ "ALL">
      and CAT = '#category#' </cfif>  and cat <>'bags' and cat <>'ornaments' and cat <> 'gems' 
	<CFIF cgi.server_name contains "wholesale" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 
	<CFELSE>
	and price>0 
	</CFIF>
	<cfif url.sortorder is 'newitem desc'>
and inventory>1
</cfif>
	  <cfif subcat is not "">
	
	   and subcat = '#subcat#' 
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
    and (color like '%#color#%')
  </CFIF>

  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
   Union
    </cfif>
  Select top <cfif url.sortorder eq 'newitem desc'>500<cfelse>1000</cfif> status, newitem,  orderonrequest, price, cat, color, subcat, grouping,size, weight,case 	when inventory>0 then '0' else '1'
		end as instock      <cfif (sortorder contains "totalqtysold")>, totalqtysold from itemspopular<cfelse>
   from items  </cfif>

   <cfif groupname neq ""> inner join  (select itemid from itemsbyGroup  where groupname='#groupname#') gvr on newitem=itemid </cfif> 
   where <cfif session.country is 'india'>storage like 'IN%' and </cfif> (inventory>=0 or orderonrequest=1)  
<CFIF cgi.server_name contains "wholesale" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>
<cfif url.sortorder is 'newitem desc'>
and inventory>0
</cfif>
and cat <>'ornaments'
         <CFIF category NEQ "ALL" and category neq "">
           and (CAT = '#category#'  <!---or CAT2 = '#category#'--->
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
<!---<cfif advancedsearch is not "">
and (description like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or description like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or description like '%#advancedsearch3#%'</cfif> or  --->
<cfif advancedsearch is not ""> and
(grouping like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or grouping like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or grouping like '%#advancedsearch3#%'</cfif>
or
subcat like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or subcat like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or subcat like '%#advancedsearch3#%'</cfif>
) 
</cfif>
  <cfif ringsize neq ""> and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
    
  
    order by  <cfif url.sortorder neq 'newitem desc'>instock,</cfif>   newitem desc <cfif url.sortorder neq 'newitem desc'>, status desc</cfif>    
 
</cfoutput>
		   
<cfcatch type="any">
<cfdump var="#cfcatch.tagcontext#">
</cfcatch>
</cftry>