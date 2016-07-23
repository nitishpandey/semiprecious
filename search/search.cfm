<html> 
<head> 
    <title>Searching a collection</title> 
</head> 
<body> 
 
<h2>Searching a collection</h2> 
 
<form method="post" action="/silver_jewelry_gallery.cfm"> 
 <input type="hidden" name="collname" size="30" value="sp_solr" maxLength="30">
 
    <p>Enter search term(s) in the box below. You can use AND, OR, NOT,  
    and parentheses. Surround an exact phrase with quotation marks.</p> 
    <p><input type="text" name="search_criteria" size="50" maxLength="50"> 
    </p> 
    <p><input type="submit" value="Search"></p> 
</form> 
 
</body> 
</html>