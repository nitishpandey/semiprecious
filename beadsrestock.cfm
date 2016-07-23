<cfparam name="orderby" default="subcat">
<h1>For Supplier - <cfoutput>#suppliername#</cfoutput></h1>
<h2>Urgent items are the ones requested by customers. Star Rating is max. months it takes to sell an item. Items that sell 1 or more than one per month will show as 1. That is the highest rating. </h2>

<a href=outofstockbeads.cfm?orderby=subcat>ORDER BY CATEGORY</a> | <a href=outofstockbeads.cfm?orderby=itemid>ORDER BY ITEM NUMBER</a>

 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select  disporder, weight, lastbought, size, basecost*0.4 as basecost, '<img src=images/' + cat + '/thumb/' + cast([newitem] as varchar) + '.jpg height=50>' as itemimage,
 '<A href=detail.cfm?newitem=' + cast([newitem] as varchar) +'>' +   cast([newitem] as varchar) + '</a>' as item, left([description],100) as description, internalnote, subcat from items   where  inventory<1 and supplier like '#suppliername#%' and 	
cat='beads' 	order by #orderby#
</cfquery>
<p>
Number of items out of stock, loss of opportunity to sell is: <cfoutput>#getlist.recordcount#</cfoutput><p>.

<cfoutput query=getlist>
<cfif disporder GT 50><font color=RED>URGENT:</font></cfif>
#item#, #itemimage#,  #subcat# Rs: #basecost#, Wt:#weight# gms size:#size#, #description#, #internalnote# <br></cfoutput>
