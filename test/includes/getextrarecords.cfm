<cfset newstart=1>
<cfset color="green">
<cfquery name=getlist datasource="gemssql">
Select <cfif salestatus is 3>saleprice<cfelse>Price</cfif> as orderprice,  grouping, case when lastbought is null then restockdate 
when restockdate is null then datetaken
else lastbought end as  lastbought, case 	when inventory>0 then '0' else '1'
		end as instock, disporder, newitem, CAT, style, subcat, subcat2, datetaken,  NameID,     price  , saleprice, status, wholesaleprice, Description, inventory, storage, thumblink, imagelink,
   buylink  from items  
   where  (inventory>-3)  <CFIF cgi.server_name IS "www.wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq ""> AND WHOLESALEPRICE >0 and (storage not like 'CM%')
<CFELSE>
and price>0 
</CFIF>

         <CFIF category NEQ "ALL">
           and (CAT = '#category#' <!---or CAT2 = '#category#'--->
           )
     	    <cfelse>
           and (CAT <> 'beads' and cat <> 'bags'
           )
     	   </CFIF>
     and (status=0 or status=3)
  <cfif jewelrysize is not "">
	    and size >= #jewelrysize#*0.7 and size < #jewelrysize#*1.3
	</cfif> 
	  <cfif url.style is 'silver'>
    	   and (style like 'Silver%') 
    		<cfelseif url.style is 'silverbeaded'>
    	   and (style = 'Silver Beaded') 
          <cfelseif url.style is 'beaded'>
    	   and ((style='beaded') or (style = 'Silver Beaded'))
		</cfif>
		  <CFIF color is not "">
    and (color like '%#color#%')
  </CFIF>
  <CFIF isnumeric(priceless)>
    <cfset ll = 0.5 * priceless >
    <cfset ul = 1.5 * priceless >
    <cfset url.sortorder = 'price desc' />
      and (price <= #ul# and price >= #ll#)
  </cfif>
  <cfif ringsize neq "" and ringsize neq 0> 
  and newitem in (select  itemid from options, items where cat='rings' and options.itemid=items.newitem  and options.description='#ringsize#' )  </cfif>
</cfquery>

<cfset rowsdisplayed = 0>
<cfset start = 1>
<tr  class="greenbutton"  align="center"><td colspan=6	 align="left" style="border-top:2px ridge #dark#"> <cfif  start GT 1>
    	 <cfset newstart = start - display></cfif>
		 <cfif newstart LT 1>
		 <cfset newstart = 1>
         </cfif>
</td></tr>
  <CFLOOP QUERY="Getlist"		startrow="#start#"	endrow="#enddisplay#">
						   <CFIF COLUMNS eq 1>
			  <tr align="center">
			  </CFIF>
		              <CFSET invent=inventory>
                     
        <td class="rowb" valign=top > 
          <cfif inventory GT 0 >
            <cfset status_array[columns] = 1>
            <cfif isdefined("session.bulkbuyer.id")>
              <cfset  l = 'AA2222'>
              
              <cfset price_array[columns] = format(wholesaleprice)>
              <!---         </cfif> --->
              <cfelse>
              <cfset price_array[columns] = format(price)>
              <cfif status is 3  >
                <CFIF getList.saleprice is "" or getList.Saleprice eq 0>
                  <CFSET Saleprice = 0.80*price>
                </cfif>
                <cfset status_array[columns] = format(saleprice)>
                  </cfif>
            </cfif>
              <cfelse>
              <cfset status_array[columns] = 0>
            <cfset price_array[columns] = soldformat(saleprice)>
          </cfif>
          <cfset item_array[columns] = '#newitem#_#cat#_#replace(replace(subcat," ","","All"),",","_","All")#'>
          <a href='jewelry_item.cfm/#item_array[columns]#.htm' > 
              <img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #category#"></a> 
     <br>   <cfif #style# contains "silver">92.5% Silver</cfif>
               <CFIF Edit Is "MAMAMIA">
<br>
<a href="np/match/cluster.cfm?list=1&target=#newitem#&category=#cat#">Ad2Clus</a>
            <a href='edititem.cfm?newitem=#newitem#'>Edit</a> (#inventory#)<font color='red'> 
            <CFIF status is "1">
              Inactive 
              <cfelseif status is "2">
              Discont. 
              <cfelseif status is "4">
              Free 
              <cfelseif status is "3">
              Sale 
              <cfelseif status is "5">
              Picture 
            </cfif>
            </font> 
          </CFIF>
 </td>
        	<td class="rowb" valign=top><cfset column = columns />
			<cfswitch expression="#status_array[column]#">
				  <cfcase value="1">
				  <font color="###l#">
				  <a href='jewelry_item.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[column]#.htm' ><b>Buy</b></a>
				  <br /><br> </cfcase>
				  <cfcase value="0"><font color="##000099"><a href='jewelry_item.cfm/#item_array[column]#.htm' >
                  <b>Zoom</b></a>&nbsp;&nbsp;&nbsp;#price_array[column]#</font>&nbsp; <br />&nbsp;<font color="##FF4444">Sold Out</font>
				  <a href='jewelry_item.cfm/#item_array[column]#.htm' ><font color="##CC3300">Order</font></a>
                    </cfcase>
               <cfdefaultcase >
			   <a href='jewelry_item.cfm/#item_array[column]#.htm'  > 
                  <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp;
<font color="##000099" ><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='jewelry_item.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font>
<br /><a href='jewelry_item.cfm/#item_array[column]#.htm' ><font color="##CC3300">Buy</font></a></cfdefaultcase>
				  </cfswitch><div  align="justify" >#left(description,150)#...</div></td>	
		  <cfif columns EQ displaycolumns>          <cfset rowsdisplayed = rowsdisplayed + 1></tr>
               <CFSET columns=1>
              <cfelse>
              <CFSET columns=columns + 1>
			  </cfif>
				  </CFLOOP>
    <cfif columns neq 1 > <!---- means the last box in the row was not filled before comng out of query loop--->
	<cfloop from="#columns#" to="#displaycolumns#" index="idx">
	<td class="rowb" colspan="2">&nbsp;</td> </cfloop>
 <cfset rowsdisplayed = rowsdisplayed + 1></tr>
	</cfif>  
    
