<cfparam name="lastitem" default="0">
<cfparam name="deletenum" default="">
<cfparam name="suppliername" default="vijay">
<cfparam name="onlyitems" default="">
<cfparam name="itemnum" default="0">
<cfparam name="orderby" default="newitem">
<b>Copyright Acematrix Industries - For Vendor: <cfoutput>#suppliername#</cfoutput></b>


<!--- inner join nitish.sellingfrequency  s on s.itemid = items.newitem --->
 <CFQUERY NAME="GetList" DATASOURCE="gemssql" maxrows=12 >

Select  anup.restock.notes as notes, anup.restock.quantity as qty, newitem, 1 as monthstosell, disporder, weight, lastbought, basecost*0.7 as basecost, cat, '<img src=/images/' + cat + '/' + cast([newitem] as varchar) + '.jpg width=350>' as itemimage,
 '<A href=/detail.cfm?newitem=' + cast([newitem] as varchar) +'>' +   cast([newitem] as varchar) + '</a>' as item, left([description],100) as description, internalnote, subcat from items inner join anup.restock on newitem=itemnum where #orderby# > #lastitem# and orderfor like '%#suppliername#%'  order by   #orderby#

</cfquery>

<cfif deletenum neq "">
<CFQUERY NAME="remove" DATASOURCE="gemssql" >
delete from anup.restock where itemnum=#deletenum#
</cfquery>
</cfif>
<p>
Number of items out of stock, loss of opportunity to sell is: <cfoutput>#getlist.recordcount#</cfoutput><p>.
<table>
<cfset col=0>
<tr>
<cfoutput query=getlist>
<cfset col=col+1>
<td>Item number: <cfif onlyitems is "yes">#newitem#<cfelse> #item#, #itemimage#<br>  #subcat#,  #cat#, Wt:#weight# gms Rs:#basecost#, #description#, #internalnote#, Star Rating:#monthsToSell#</cfif>
<br><font color=red>Qty: #qty# - #notes#</font>&nbsp;
</td><cfif col is 2><cfset col=0></tr><tr></cfif>
<cfset lastitem=newitem>
</cfoutput>
</table>

<a href=vijayprintable.cfm?lastitem=<cfoutput>#evaluate(lastitem+1)#</cfoutput>>Next</a>
