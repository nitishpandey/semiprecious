
   
   <cfloop list="1048,1057,1502,7359,7589,7596,7621,7622,7692,7695,7696,7697,7698,7699,7700,7701,7702,7703,7704,9591,9732,9796,9797,9798,9799,9800,9801,9802,9803,9804,9805,9806,9807,9808,9809,9810,9880" index="j">       

<cfquery datasource='gemssql' name='secimage'>
select morepics from items where newitem=#j#
</cfquery>
<cfif secimage.morepics is 1>
   <cfset filename ="d:\inetpub\semiprecious\images\jewelry\necklaces\#j#-1.jpg" >
 <cffile action="move" nameconflict="overwrite" source="#filename#"  destination="d:\inetpub\semiprecious\images\jewelry\chains\#j#-1.jpg" >
</cfif>
 </cfloop>
