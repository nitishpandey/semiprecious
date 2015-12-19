<html> 
<head> 
    <title>Adding Query Data to an Index</title> 
</head> 
<body> 
 
 <!---Retrieve data from the table. ---> 
<cfif true and datepart('d',now())
mod
3>
<cfquery name="getEmps" datasource="gemssql"> 
    SELECT inventory, cat,cat2,subcat,subcat2,style,color,shape,description,newitem, groupname as grouping FROM items, itemsbygroup  where itemsbygroup.itemid=newitem and (status = 0 or status = 3) and inventory > 0 
</cfquery> 
 
<!--- Update the collection with the above query results. ---> 

<cfindex  
    query="getEmps" 
    collection="sp_solr" 
    action="refresh" 
    type="Custom" 
    key="newitem" 
    title="cat" 
	custom1="inventory"
    body="cat,subcat,grouping,style,color,shape,description,newitem" /> 
 <cfelse>
 <cfcollection collection="sp_solr" action="optimize" />
</cfif>
<h2>Indexing Complete</h2> 
 
<!--- Output the record set. ---> 
</body> 
</html>