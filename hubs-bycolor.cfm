<cfset themelink = "">
<cfset themeimage = "">
<cfset imagesUsedList = "">
<cfset themedesc = "">
<cfset subcatout = subcat >


    <!--- Size the table --->
    <tr>
      <td height="15px" width="50%">&nbsp;</td>
      <td width="50%">&nbsp;</td>
    </tr>
    <!--- orange buttons --->
    <tr>
      <td colspan="2" align="center">
			   <!--- <cfoutput>
       <table border="0" cellpadding="0" cellspacing="0" style="margin:auto;width:450px" >
            <tr  >
              <td border="0px" width="8px"><img src="/images/orange_left_curve.jpg" width="8" height="24" /></td>
              <td style="cursor:pointer" border="0px" align="center" width="120px" class="orange_bg"><a href="/#categ#.cfm" class="side_orange_hd"><cfoutput>All #categ#</cfoutput></a></td>
              <td border="0px" width="8px"  ><img src="/images/orange_right_curve.jpg" width="8" height="24" /></td>
              <td width="10px">&nbsp;</td>
              <td border="0px" width="8px" ><img src="/images/orange_left_curve.jpg" width="8" height="24" /></td>
              <td style="cursor:pointer" border="0px" align="center"  width="120px" class="orange_bg" ><a href="/latest-#categ#.cfm" class="side_orange_hd"><cfoutput>New #categ#</cfoutput></a></td>
              <td border="0px" width="8px" ><img src="/images/orange_right_curve.jpg" width="8" height="24" /></td>
              <td width="10px">&nbsp;</td>
              <td border="0px" width="8px" ><img src="/images/orange_left_curve.jpg" width="8" height="24" /></td>
              <td style="cursor:pointer" border="0px" align="center"  width="120px" class="orange_bg" ><a href="/gemstone_jewelry_gallery.cfm?category=#category#&sortorder=lastbought" class="side_orange_hd"><cfoutput>Popular #categ#</cfoutput></a></td>
              <td border="0px" width="8px" ><img src="/images/orange_right_curve.jpg" width="8" height="24" /></td>
            </tr>
          </table>
        </cfoutput---> </td>
    </tr>
    <!--- End orange buttons --->
    <cfset itemcount = 0>
    <cfset displaycateg = "">
    <!--- Some categories have special types that we'll display first --->
    <!--- They don't get displayed if we're showing particular stones --->
    
 <cftry>
  
<CFQUERY DATASOURCE="gemssql" NAME="Colors">
<!--- Get individual item descriptions here --->

    SELECT distinct cat, description, 
      CASE cat
        WHEN 'jewelry' THEN 1
        WHEN 'necklaces' THEN 2
        WHEN 'earrings' THEN 3
        WHEN 'pendants' THEN 4
        WHEN 'bracelets' THEN 5
        WHEN 'rings' THEN 6
        WHEN 'brooches' THEN 7
        WHEN 'beads' THEN 8
        WHEN 'gems' THEN 9
        
        ELSE 10 
      END
      AS sortorder
    FROM ltbcolorcatstyle 
    WHERE color='#color#'	
    AND cat <> 'anklets' and cat<>'ornaments'
    ORDER BY sortorder
</CFQUERY>
 <cfcatch type='database'>
 Color table error
 </cfcatch>
 </cftry>
    <!--- Get the various themes and display --->
    <cfloop query="Colors">

<cftry>
      <cfquery datasource="gemssql" name="GetImage">
      SELECT thumblink, newitem, g2i,status, subcat, cat from Items
       WHERE  color = '#color#' and (status=0 or status=3)
    <cfif cat neq "jewelry">  AND  cat = '#cat#'</cfif>
     ORDER BY g2i desc        
          </cfquery>

 <cfcatch type='database'>
 Color table error
 </cfcatch>
 </cftry>
           <cfset displaycateg = cat>
         <!--- End separate item for jewelry --->
      <cfset themeitem = Colors.cat>     
      <cfset themedesc = Colors.description>

       <cfif GetImage.recordcount gt 0  >
        <!--- Check for duplicate images --->
        <cfif listContains(imagesUsedList, GetImage.newitem)>
          <cfset vItemFound = 0>
          <cfloop query="GetImage">
            <cfif listContains(imagesUsedList, GetImage.newitem) or vItemFound eq 1>
              <cfelse>
              <cfset imagesUsedList = listAppend(imagesUsedList,GetImage.newitem)>
              <cfif categ eq "jewelry">
                <cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg">
                <cfelse>
                <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.newitem & ".jpg">
              </cfif>
              <cfset vItemFound = 1>
            </cfif>
          </cfloop>
          <!--- No non duplicates found --->
          <cfif vItemFound eq 0>
            <cfif categ eq "jewelry">
              <cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg">
              <cfelse>
              <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.newitem & ".jpg">
            </cfif>
          </cfif>
          <!--- Was not a duplicate --->
          <cfelse>
          <cfset imagesUsedList= listAppend(imagesUsedList,GetImage.newitem) >
          <cfif categ eq "jewelry">
            <cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg">
            <cfelse>
            <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.newitem & ".jpg">
          </cfif>
        </cfif>
        <cfif itemcount mod 2 eq 0>
          <tr>
        </cfif>
        <!--- Display an item --->
    
            <cfset themelink = "/color-gem-stone/" & #lcase(color)# & "-" & #lcase(cat)# & ".cfm">
        <CFINCLUDE TEMPLATE="hubs-coloritem.cfm">
        <cfif itemcount mod 2 eq 1>
          </tr>
          
        </cfif>
        <cfset itemcount = itemcount + 1>
      </cfif>
    </cfloop>
    <cfif itemcount mod 2 eq 0>
      </tr>
      
    </cfif>
