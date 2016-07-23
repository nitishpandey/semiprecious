
 
  <!--- Start Matt Bayuk - SGM --->
  <cfset itemCount = 0>
  <cfset itemlist = 0>
  <cfset COLUMNS = 1>
  <CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#enddisplay#">
     <cfif inventory GT 0>
      <cfset itemlist=listAppend(itemlist, newitem)>
    </cfif>
    <cfset itemCount = itemCount + 1>
    
    <!--- If we're the first item in a row, set up the row --->
    <CFIF COLUMNS eq 1>
      <cfoutput>
      <tr  id="#displayrowid#">
      </cfoutput>
    </CFIF>
    
    <CFSET invent=inventory>
    
    <!--- We'll create 12 items.  Only 4 will be displayed --->
<cfoutput>
    <td class="rowb" style="border-left:0px solid black;" >
    </cfoutput>
    
    <!--- Item Image --->
    <cfsavecontent variable="smallContent">
      <cfif inventory GT 0>
        <cfset status_array[columns] = 1>
        <cfif  cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "">
          <cfset l = 'AA2222'>
          <cfset price_array[columns] = format(wholesaleprice)>
          <cfelse>
          <cfset price_array[columns] = format(price)>
          <cfif status is 3>
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
      <cfif getlist.storage EQ 'Pippin'>
        <a href=gem_stone_#cat#.cfm/#item_array[columns]#.htm> <img src ="#thumblink#" longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" title="#subcat# #category#" <cfif category is 'bracelets'>width="100"</cfif>> </a>
        <CFELSE>

        <table border=0>
          <tr valign=top>
            <td valign=top height="150" align=center><a href='gem_stone_#cat#.cfm/#item_array[columns]#.htm'> <img src ='images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'  name="img#newitem#" <cfif category is 'bracelets'>width="100"</cfif>>
              </a> </td>
          </tr>
        </table>
      </CFIF>
      </cfsavecontent>
      <!--- End item image --->
      
      
      <cfsavecontent variable="smallContent">
      <cfoutput>
      <table border=0>
      <!--- Item name --->
        <tr valign=center>
          <td valign=center height="130" align=center><a href='/gem_stone_#cat#.cfm/#item_array[columns]#<cfif grouping neq "">_#grouping#</cfif>.htm'><img src ='/images/#getlist.cat#/thumb/#newitem#.jpg' longdesc="http://www.semiprecious.com/longdesc.cfm?newitem=#newitem#" border='0' bordercolor='black'></a> </td>
        </tr>
      
        <tr>
          <td align=center valign=top><a href='/gem_stone_#cat#.cfm/#item_array[columns]#<cfif grouping neq "">_#grouping#</cfif>.htm'>
            <cfif subcat neq "">
              <br>
              #subcat#
            </cfif>
            <cfif subcat2 neq "">
              #subcat2#
            </cfif>
            <cfif grouping neq "">
              #grouping#
            </cfif>
 <!---           <cfif category neq 'healing' and categ neq 'jewelry'>
              #category#
              <cfelse>
              #categ#
            </cfif>--->
            </a><br>
            <cfif #style# contains "silver">
              Sterling Silver
            </cfif></td>
        </tr>
      <!--- End item name --->
      </table>
      </cfoutput>
      <cfset column = columns />

	<!--- Item price --->
    <!---
      <br>
      <cfoutput>
      <cfswitch expression="#status_array[column]#">
        <cfcase value="1">
        <a href='/gem_stone_#cat#.cfm/#item_array[columns]#.htm'>#price_array[column]#</a> <br>
        </cfcase>
        <cfcase value="0">
        <font color="##FF9966">Out of Stock</font>#price_array[column]#
        </cfcase>
        <cfdefaultcase>
        <br>
        <a href='/gem_stone_#cat#.cfm/#item_array[column]#.htm'> <b><font color="maroon">sale!</font></b></a> &nbsp;&nbsp;&nbsp; <font color="##000099"><s>#price_array[column]#</s>&nbsp;&nbsp;&nbsp;<a href='/gem_stone_#cat#.cfm/#item_array[column]#.htm' ><b>#status_array[column]#</b></a> </font> <br />
        Promotional Pricing Limited Time
        </cfdefaultcase>
      </cfswitch>
      </cfoutput>
	  --->
      <!--- End item price --->
      </cfsavecontent>
      
      
      <cfsavecontent variable="bigContent">
      <cfoutput>
      <div id="div#itemCount#" class="rowb" style="position:absolute; display:none; background-color:white; border:2px solid black; padding:4px;">
      </cfoutput>
        <table cellpadding="2" cellspacing="0" border="0" >
          <tr valign="top">
            <cfif columns lt 4>
              <td align="center"> #smallContent# </td>
            </cfif>
            <td ><a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Buy</a><br>
              <br>

              <div aligh=left class="listdescr">
                <cfif cgi.server_name contains "wholesale-gemstone-jewelry.com">
                  Wholesale
                </cfif>
                <br>
                <br>
                <a href='/gem_stone_#lcase(cat)#.cfm/#item_array[columns]#.htm'>Buy</a><br>
                <br>
                <span onMouseOver="div#itemCount#.style.display='none';"><a><font size=-1>close</font></a></span>
              </div>
            </td>
            <cfif columns GT 3>
              <td align="center"> #smallContent# </td>
            </cfif>
          </tr>
        </table>
      </div>
      </cfsavecontent>
      
      <!--- 1-4 are displayed.  1-12 are created hidden --->
      <!--- The hidden ones can be used to update without redoing the entire page --->
      <cfoutput>
      <cfset idhidden= displayrowid & "Hidden" & itemcount>
      <cfset idshown= displayrowid & "Shown" & itemcount>
      <cfif itemcount lt 5>
      <div id="#idshown#">
      #bigContent#
      #smallContent# 
      </div>
      </cfif>
      <div id="#idhidden#" style="display:none">
      #bigContent#
      #smallContent# 
      </div>
      
      </cfoutput>
      
      </td>
      
     
    <cfif columns EQ displaycolumns>
      <cfset rowsdisplayed = rowsdisplayed + 1>
      </tr>
      <CFSET columns=1>
      <cfelse>
      <CFSET columns=columns + 1>
    </cfif>
  </CFLOOP>
  <!--- End Matt Bayuk - SGM --->
