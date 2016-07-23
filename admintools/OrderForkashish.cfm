<cfparam name="deletenum" default="">
<cfparam name="suppliername" default="kashish">
<cfparam name="onlyitems" default="">
<cfparam name="itemnum" default="0">
<cfparam name="orderby" default="newitem">
<h1>For Supplier - <cfoutput>#suppliername#</cfoutput></h1>
<h2>Urgent items are the ones requested by customers. Star Rating is max. months it takes to sell an item. Items that sell 1 or more than one per month will show as 1. That is the highest rating. </h2>

<a href=../kashish.cfm?orderby=cat>ORDER BY CATEGORY</a> | <a href=../kashish.cfm?orderby=itemid>ORDER BY ITEM NUMBER</a>

<!--- inner join nitish.sellingfrequency  s on s.itemid = items.newitem --->
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" >

Select  anup.restock.notes as notes, anup.restock.quantity as qty, newitem, 1 as monthstosell, disporder, weight, lastbought, basecost*0.7 as basecost, cat, '<img src=/images/' + cat + '/thumb/' + cast([newitem] as varchar) + '.jpg height=50>' as itemimage,
 '<A href=/detail.cfm?newitem=' + cast([newitem] as varchar) +'>' +   cast([newitem] as varchar) + '</a>' as item, left([description],100) as description, internalnote, subcat from items inner join anup.restock on newitem=itemnum where orderfor like '%#suppliername#%'  order by   #orderby#

</cfquery>

<cfif deletenum neq "">
<CFQUERY NAME="remove" DATASOURCE="gemssql" >
delete from anup.restock where itemnum=#deletenum#
</cfquery>
</cfif>
<p>
Number of items out of stock, loss of opportunity to sell is: <cfoutput>#getlist.recordcount#</cfoutput><p>.
<cfset pr_it = '' />
<cfoutput query=getlist>
<cfif disporder GT 50><font color=RED>URGENT:</font></cfif>
<cfif onlyitems is "yes">#newitem#<cfelse> #item#, #itemimage#  #subcat#,  #cat#, Wt:#weight# gms Rs:#basecost#, #description#, #internalnote#, Star Rating:#monthsToSell#</cfif>
<br><font color=red><a name="#pr_it#">Qty</a>: #qty# - #notes#</font>&nbsp;&nbsp;<a href=?deletenum=#newitem#&amp;###pr_it#>DELETE from order!</a>
<cfset pr_it = newitem /><form name=order action="reorder.cfm">
<input type="hidden" name="itemnum" value="#newitem#">
<input type="hidden" name="orderfor" value="#suppliername#">
<input type="hidden" name="orderdate" value="#dateformat(now(), "dd-mmm-yy")#">
</form></cfoutput>
