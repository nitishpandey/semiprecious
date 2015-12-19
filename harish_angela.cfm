Harish, these are items out of stock in order of last purchased date. So latest out of stock shows on top.  These are all 0 inventory. Make the items at the bottom first and the ones on top later.<p>
<cfset session.bulk.id ="anupsulekha@hotmail.com">

 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select disporder, weight, lastbought, cat, '<img src=images/' + cat + '/thumb/' + cast([newitem] as varchar) + '.jpg height=50>' as itemimage,
 '<A href=detail.cfm?newitem=' + cast([newitem] as varchar) +'>' +   cast([newitem] as varchar) + '</a>' as item, left([description],100) as description, internalnote, subcat from items where  inventory<1 and storage='Angela' and style='silver setting' and reorder =1 order by disporder desc, price desc, lastbought

</cfquery>

<cfoutput query=getlist>
<cfif disporder GT 50><font color=RED>URGENT:</font></cfif>
#item#, #itemimage#  #subcat# #cat#, Wt:#weight# gms #description#, #internalnote#, LastSale:#dateformat(lastbought, "mmm-dd-yy")#<br></cfoutput>
