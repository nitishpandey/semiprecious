<cfquery datasource="semiprecious" name="q_description">
SELECT cat +' : '+ subcat+ ' : ' + description  as content,
  cat+ ',' + Cstr(price)+','+ Cstr(saleprice) +','+Cstr(wholesaleprice)+','+Cstr(clustercount)+','+Cstr(status)  + ','  + subcat  as content2,
subcat,cat,  
 newitem,
 inventory  
 FROM items where 
(status = 3 or status = 0 ) 
</cfquery>
<cfindex  collection="jewelrydescription" action="update"
  type="custom"  query="q_description"  key="newitem" body="content"
custom1="subcat" urlpath="inventory" custom2="cat" title="content2" 
/>
<!---- use custom1 and custom2 if the visitor has specified stone and category explicitly else use only body ---->

