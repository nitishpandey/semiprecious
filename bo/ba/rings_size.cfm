<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
          

 		Various Options available:
			<cfquery datasource="gemssql" name="opts">
				     select distinct(options.description) as d from options inner join items on options.itemid = items.newitem where items.cat = 'rings' 
			 </cfquery>
	 <cfdump var="#opts#" expand="no" />

				<cfquery datasource="gemssql" name="opts">
				  select sum(q) as sq , de  from ( select case when charindex(',',op.description) = 0  then replace(op.description,'size ','') else replace(left(op.description,charindex(',',op.description)),'size ','') end  as de,
				  sum(ba.quantity) as q 
				  from options op inner join items on items.newitem = op.itemid 

				    inner join buyingrecord_archive ba on  op.optionid = ba.optionid 
				  and
				  op.itemid = ba.itemid 				  where   items.cat = 'rings'
				  group by op.description ) v  group by de
                  </cfquery>
Note that the x axis is not sorted on size:
<cfchart
   format="png"
   scalefrom="0"
  chartwidth="800"
   scaleto="820">
  <cfchartseries
      type="bar"
      serieslabel="Website Traffic 2006"
      seriescolor="blue">
	  <cfloop query="opts">
	    <cfchartdata item="#de#" value="#sq#">
	 </cfloop>	
  </cfchartseries>
</cfchart>

				  <cfoutput>#opts.recordcount#</cfoutput>
</body>
</html>
