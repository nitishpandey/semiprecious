<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and not ((status=1) or (status=2) or (status=5) or subcat like '%,%') and inventory>0)
</cfquery>
<cfoutput query="getsubcat"><a href='list.cfm?category=#category#&subcat=#URLEncodedformat(subcat)#'><b><font size='2' color=black>#Ucase(Left(subcat,1))##right(subcat,len(subcat)-1)#</font></b></a><br> </cfoutput><a href='list.cfm?salestatus=3&category=<cfoutput>#category#</cfoutput>'><font size='3' color='red'><b>Sale Items!</b></font></a>