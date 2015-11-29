<cfif session.mail is application.admin_email>
<cfset salestatus = 9 />
</cfif>
<cftry><cfparam name="stored" default="">
<cfparam name="located" default="">
<cfif url.sortorder contains 'lastbought'><cfset url.sortorder='totalqtysold desc'></cfif>
<cfif sortorder contains 'lastbought'><cfset sortorder='totalqtysold desc'></cfif>
<!---<CFPARAM NAME="advancedsearch" DEFAULT= "">
 <CFPARAM NAME="advancedsearch1" DEFAULT= "" />
<CFPARAM NAME="advancedsearch2" DEFAULT= "" /> 
<CFPARAM NAME="advancedsearch3" DEFAULT= "" />

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
 
  Select top 500 newitem  from 
   items  with (nolock)
   <cfif groupname neq ""> inner join  
	 (select itemid from itemsbyGroup with (nolock) where groupname='#groupname#') gvr on newitem=itemid </cfif> 
   where 
    INVENTORY <1
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
     and (status=0 or status=3 or status = 1)
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
<cfif color neq "">
	and (color like '#color#%')
</cfif>


<!---<cfif advancedsearch is not "">
and (description like '%#advancedsearch1#%' <cfif advancedsearch2 is not "">or description like '%#advancedsearch2#%'</cfif> <cfif advancedsearch3 is not "">or description like '%#advancedsearch3#%'</cfif> or  --->
    
  
 
</cfoutput>

<cfcatch type="any">
<cfdump var="#cfcatch.tagcontext#">
</cfcatch>
</cftry>