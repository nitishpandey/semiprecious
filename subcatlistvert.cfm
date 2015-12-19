<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and not ((status=1) or (status=2) or (status=5) or subcat like '%,%') and inventory>0)
</cfquery>
<cfoutput query="getsubcat"><a href='list.cfm?category=#category#&subcat=#URLEncodedformat(subcat)#'><i><font size='2' color=black>#Ucase(Left(subcat,1))##right(subcat,len(subcat)-1)#</font></i></a> <font color='black'><br> </font> <a href='list.cfm?salestatus=3&category=#category#'></cfoutput><font size='3' color='white'><b>SALE</b>
</font></a>
<a href='http://www.semiprecious.com/otherJewelrySites.cfm#listing'>Jewelry Sites</a>