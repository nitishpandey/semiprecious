<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Inventory Status</title>
</head>

<body>
 <CFQUERY DATASOURCE="gemssql" NAME="catsubcat">
		select cat, stone, style, inventory  from CatSubCatInStock where cat <>'bags' and cat <>'beads' and cat <>'anklets' and cat <>'healing' order by stone 
				</cfquery>
				Stone		  	 				Cat		  		Style		 	 Inventory<br>		  		   
				<cfoutput query="catsubcat">
				
				#Stone#	  |					#cat#			   | #style#	  | <cfif inventory LT 4><font color=red><b></cfif>#inventory#<cfif inventory LT 4></b></font></cfif>		 <br>
				</cfoutput>

</body>
</html>