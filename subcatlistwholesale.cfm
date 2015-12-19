<cfparam name="category" default="rings" />
<cftry>
<CFQUERY datasource="gemssql" NAME="getsubcat">
Select distinct subcat from items where (cat = '#category#'  and not ((status=1) or (status=2) or (status=5) or subcat like '%,%') and inventory>0)
</cfquery>
<table width='750' align='center' cellpadding='0' cellspacing='0' border='0'><tr align='LEFT'><td>
<cfoutput query="getsubcat"><a href='listwholesale.cfm?category=#category#&subcat=#URLEncodedformat(subcat)#'>
<i><font size='2' face="times new roman" color=black>#Ucase(Left(subcat,1))##right(subcat,len(subcat)-1)#</font></i></a> <font color='black'>| </font> </cfoutput><a href='list.cfm?salestatus=3&category=<cfoutput>#category#</cfoutput>'><font size='2' color='red'><b>Sale!</b></font></a>
      </td>  </tr></table>
      <cfcatch type="any">
      <cfdump var="#cfcatch#" />
      </cfcatch>
      </cftry>

