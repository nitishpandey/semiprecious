<cfparam name="onlyitems" default="">
<cfparam name="itemnum" default="0">
<cfparam name="suppliername" default="royal" />
<cfparam name="orderby" default="wishcount">
<h1><a href=/admintools/vendors.htm>vendor page</a></h1>
<h2>For Supplier - <cfoutput>#suppliername#</cfoutput></h2>
Urgent items are the ones requested by customers. Star Rating is max. months it takes to sell an item. Items that sell 1 or more than one per month will show as 1. That is the highest rating. 

ORDER BY : <cfoutput><a href="supplierrestock.cfm?suppliername=#suppliername#&orderby=wishcount desc">WishCount</a> | <a href=supplierrestock.cfm.cfm?suppliername=#suppliername#&orderby=cat>CATEGORY</a> | <a href=supplierrestock.cfm.cfm?suppliername=#suppliername#&orderby=newitem>ITEM NUMBER</a>
</cfoutput>
<form >
Select Supplier : <SELECT NAME="suppliername">
<OPTION>Here</OPTION>
<OPTION>Harish</OPTION>
<OPTION>Vijay</OPTION>
<OPTION>Anup</OPTION>
<OPTION>Arpit</OPTION>
<OPTION>Kashish</OPTION>
<OPTION>Pawan</OPTION>
<OPTION>Royal</OPTION>
<OPTION>GR</OPTION>
<OPTION>USA</OPTION>
<OPTION>Preety</OPTION>
</SELECT> <input type="submit" >
</form>

<!--- inner join nitish.sellingfrequency  s on s.itemid = items.newitem --->
 <CFQUERY NAME="GetList" DATASOURCE="semilocal" >

Select newitem, daysactive, t2z, tbyznorm, z2c, zbycnorm, soldbyday, dayspersell, dayspersellnorm,  wishcount,  num_sold,  inventory, weight, lastbought, basecost*0.7 as basecost, cat, '<img src=/images/' + cat + '/thumb/' + cast([newitem] as varchar) + '.jpg height=50>' as itemimage,
 '<A href=detail.cfm?newitem=' + cast([newitem] as varchar) +'>' +   cast([newitem] as varchar) + '</a>' as item, left([description],100) as description, internalnote, subcat from items right outer join 
 (select itemid, i.daysactive, thumbexposure/(zoom+1) as t2z, (thumbexposure/(zoom+1))/c.TbyZcat as tbyznorm, zoom/(addtocart+1) as z2c,
 zoom/(addtocart+1)/c.ZbyCcat as zbycnorm , cast(sold as real)/daysactive as soldbyday, daysactive/(sold+0.01) as dayspersell, (daysactive/(sold+0.01))/dbyscat  as dayspersellnorm from nitish.itemstats i, itemsCat_rating c, items where items.newitem=i.itemid and items.cat=c.CAT and daysactive>0 and sold>0) newstat
  on itemid=newitem right outer join 
( SELECT     COUNT(*) AS wishcount, newitem as wishitem FROM wish GROUP BY newitem) w on wishitem = newitem where  newitem not in (select itemnum from anup.restock) and  ( (wishcount>1 and inventory<3) or (dayspersellnorm <=1 and inventory <3) or inventory<1) and  supplier like '%#suppliername#%' and 
 (storage not like 'CM%')  order by   #orderby#

</cfquery>



<p>
Number of items out of stock, loss of opportunity to sell is: <cfoutput>#getlist.recordcount#</cfoutput><p>.
<cfset anchor="start" />
<cfoutput query=getlist>
<table><tr><td>
 <cfif onlyitems is "yes">#newitem#<cfelse> #item#, Wishcount:<font color=green>#wishcount#</font>, num. sold: #num_sold#, instock: #inventory#, #itemimage#  #subcat#,  #cat#, Wt:#weight# gms Rs:#basecost#, #description#, #internalnote# </cfif>
<form name=order action="/admintools/reorder.cfm###anchor#" method="post" > 
<!---Change Supplier to:<a href='admintools/reassignsupplier.cfm?oldsupplier=#suppliername#&supplier=harish&itemid=#newitem#'>Harish</a> {} <a href='admintools/reassignsupplier.cfm?oldsupplier=#suppliername#&supplier=Vijay&itemid=#newitem#'>Vijay</a> {} <a href='admintools/reassignsupplier.cfm?oldsupplier=#suppliername#&supplier=Royalagate&itemid=#newitem#'>RoyalAgate</a> {} <a href='admintools/reassignsupplier.cfm?oldsupplier=#suppliername#&supplier=USA&itemid=#newitem#'>USA</a>--->
<cfset anchor="#newitem#" />  
<a name="#anchor#">&rarr;</a>QTY: <input type="text" size=2 name="quantity" value="5">, note: <input type="text" size=40 name="notes" value="">

<select name="orderfor">
<OPTION selected="true">#suppliername#</OPTION>
<OPTION>Harish</OPTION>
<OPTION>Vijay</OPTION>
<OPTION>Anup</OPTION>
<OPTION>Arpit</OPTION>
<OPTION>Kashish</OPTION>
<OPTION>Royal</OPTION>
<OPTION>GR</OPTION>
<OPTION>pawan</OPTION>
<OPTION>Preety</OPTION>
<OPTION>USA</OPTION>
</SELECT>
<input type=submit value="Place Order">
<input type="hidden" name="itemnum" value="#newitem#">
<input type="hidden" name="orderdate" value="#dateformat(now(), "dd-mmm-yy")#">
</form></td><td>
<table border=1><tr bgcolor=lightblue><td>DaysActive</td><td>DaysPerSell</td><td>DaysPerSellN</td><td>z2c</td><td>zbycnorm</td></tr>
<tr><td>#daysactive#</td><td>#dayspersell#</td><td>#dayspersellnorm#</td><td>#z2c#</td><td>#zbycnorm#</td></tr>
</table>

</td></tr></table>
</cfoutput>
