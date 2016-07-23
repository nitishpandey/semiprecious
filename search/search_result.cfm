<html> 
<head> 
<title>Search Results</title> 
</head> 
 
<body> 
 
<cfsearch  
        collection="#Form.collname#" 
        name="getEmps" 
        criteria="#Form.Criteria#" 
    maxrows = "100"> 
 
<!--- Output the record set. ---> 
<cfoutput> 
Your search returned #getEmps.RecordCount# file(s). 
</cfoutput> 
 
<cfoutput query="getEmps"> 
    <p><table> 
    <tr><td>Title: </td><td>#Title#</td></tr> 
    <tr><td>Score: </td><td>#Score#</td></tr> 
    <tr><td>Key: </td><td>#Key#</td></tr> 
    <tr><td>Summary: </td><td>#Summary#</td></tr> 
    <tr><td>Custom 1:</td><td>#Custom1#</td></tr> 
    <tr><td>Column list: </td><td>#ColumnList#</td></tr> 
</table></p> 
 
</cfoutput> 
</body> 
</html>