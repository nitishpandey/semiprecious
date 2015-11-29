 <CFQUERY datasource="semilocal" name="details" >
		  Select grouping, itemnumber, size, weight, style, color, storage, imagelink, inventory,  price, status, saleprice,clustercount,basecost, wholesaleprice, newitem, itemnumber as optcount,description, NameID, newitem, subcat, subcat2, cat, morepics from 
		  items where newitem=10358
	  </cfquery>
		<cfoutput query=details>
		#color#, #size#, #price#
		</cfoutput>