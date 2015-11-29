<cfset themelink = "">
<cfset themeimage = "">
<cfset imagesUsedList = "">

<cfset themedesc = "">
<CFQUERY DATASOURCE="gemssql" NAME="Groups">
		<!--- hubsequence = 99:don't display,  98:  default value --->
<cfif category neq "all" and category neq "">
    select distinct GroupName, description, hubsequence from Groupings 
    where cat='#category#' and domain='www.semiprecious.com'
  <cfif session.mail neq application.admin_email> and (hubsequence <> 99)</cfif>
<cfelse>
    select GroupName, description, hubsequence, cat  from Groupings 
    where cat='jewelry' and domain='www.semiprecious.com'
     <cfif session.mail neq application.admin_email> and (hubsequence <> 99)</cfif>
</cfif>      								
</CFQUERY>


  <cfparam name="showxthemes" default="Groups.recordcount">
  <table cellpadding="5" cellspacing="5" style="padding:5px 5px 5px 10px">
   <!--- <cfif category eq "necklaces">
      <tr>
        <td colspan="2"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>We welcome you to our gallery of gemstone beaded and silver necklaces. We use genuine natural gemstones and 92.5 sterling silver for all our necklaces. You can refine your search for a suitable necklace by color, by theme and by gemstones. There is one for everyone here in a price range from $10 to above $500. We guarantee full refund if you are not satisfied for any reason.</span> </td>
      </tr>
    </cfif>
    <cfif category eq "earrings">
      <tr>
        <td colspan="2"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>We have put together a vast variety of natural gemstone beads earrings and silver gemstone earrings in a hundreds of natural gems and styles.  All our earrings are handmade into perfection by expert craftsmen of India with high quality gemstones and sterling silver.</span> </td>
      </tr>
    </cfif>
    <cfif category eq "pendants">
      <tr>
        <td colspan="2"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>We handpicked hundreds of lovely colorful natural gemstones and fashioned them into a great collection of beautiful pendants, both for women and men. All our pendants are handmade by artisans in sterling silver with authentic semiprecious stones. We also have a big range of  silver chains in various thickness and lengths.</span> </td>
      </tr>
    </cfif>
    <cfif category eq "bracelets">
      <tr>
        <td colspan="2"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>We bring you here a lovely collection of semiprecious gemstone bracelets in beaded and sterling silver in hundred of gemstones and designs. Choose your favorite silver bracelets , bangles or wrist bands from this amazing variety of handmade bracelet collection. Most of our bracelets come with an adjustment silver chains for length adjustment to fit all wrist sizes.</span> </td>
      </tr>
    </cfif>
    <cfif category eq "rings">
      <tr>
        <td colspan="2"><span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>We handpicked hundreds of lovely colorful natural gemstones and fashioned them into a great collection of beautiful rings, both for women and men. All our rings are handmade by artisans in sterling silver with authentic semiprecious stones.  We resize all our rings for your specific size. So, now you can pick up your favorite silver ring and we will manually resize to fit you. We will soon start to accept your request for custom design jewelry, so you can have your choice of gemstone in your favorite ring design.</span> </td>
      </tr>
    </cfif>--->
    <!--- Size the table --->
    <tr>
      <td height="15px" colspan="2">
<cfif not len(session.bulkbuyer.id)>
	</cfif>
  		</td>
    </tr>
    <!--- orange buttons --->
    <tr>
      <td colspan="2" align="center"><cfoutput>
          <table border="0" cellpadding="0" cellspacing="0" style="margin:auto;width:450px" >
            <tr  >

              <td border="0px" width="8px"><img src="/images/orange_left_curve.jpg" width="8" height="24" /></td>
              <td style="cursor:pointer" border="0px" align="center" width="180px" class="orange_bg">
				<a href="/gem-stone-#categ#.cfm" class="side_orange_hd"><cfoutput>All #titlecase(categ)# Gallery</cfoutput></a></td>
              <td border="0px" width="8px"  ><img src="/images/orange_right_curve.jpg" width="8" height="24" /></td>
              <td width="10px">&nbsp;</td>
              <td border="0px" width="8px" ><img src="/images/orange_left_curve.jpg" width="8" height="24" /></td>
              <td style="cursor:pointer" border="0px" align="center"  width="140px" class="orange_bg" ><a href="/latest-#categ#.cfm" class="side_orange_hd"><cfoutput>New Arrivals</cfoutput></a></td>
              <td border="0px" width="8px" ><img src="/images/orange_right_curve.jpg" width="8" height="24" /></td>
              <td width="10px">&nbsp;</td>
              <td border="0px" width="8px" ><img src="/images/orange_left_curve.jpg" width="8" height="24" /></td>
              <td style="cursor:pointer" border="0px" align="center"  width="150px" class="orange_bg" ><a href="/gemstone_jewelry_gallery.cfm?category=#category#&sortorder=lastbought" class="side_orange_hd"><cfoutput>Popular #titlecase(categ)#</cfoutput></a></td>
              <td border="0px" width="8px" ><img src="/images/orange_right_curve.jpg" width="8" height="24" /></td>
            </tr>
          </table>
        </cfoutput> </td>
    </tr>
    <!--- End orange buttons --->
    <cfset itemcount = 0>
    <cfset displaycateg = "">
    <!--- Some categories have special types that we'll display first --->
    <!--- They don't get displayed if we're showing particular stones --->
    <cfif subcat eq "">
      <cfif category eq "necklaces">
		<tr>
        <cfset displaycateg = "">
        <cfset themeitem = "Beaded Necklaces">
        <cfset themedesc = "">
        <cfset themelink = "beaded_necklaces.cfm">
        <cfset themeimage = "/images/Necklaces/thumb/8100.jpg">
        <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        <cfset themeitem = "Necklaces In Sterling Silver">
        <cfset themedesc = "">
        <cfset themelink = "silver_necklaces.cfm">
        <cfset themeimage = "/images/Necklaces/thumb/448.jpg">
        <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        </tr>
        
        <tr>
        
        <cfset themeitem = "Necklaces With Silver Beads">
        <cfset themedesc = "">
        <cfset themelink = "silver_bead_necklaces.cfm">
        <cfset themeimage = "/images/Necklaces/thumb/1158.jpg">
        <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        <cfset itemcount = 3>
        <cfset imagesUsedList = "8100,448,1158">
      </cfif>
      <cfif category eq "earrings">
        <tr>
          <cfset themeitem = "Beaded Earrings">
          <cfset themedesc = "A unique collection of beaded earrings in a fine variety of real gemstone beads at the most affordable prices, so make your collection to go with different outfits.">
          <cfset themelink = "beaded_earrings.cfm">
          <cfset themeimage = "/images/earrings/thumb/9787.jpg">
          <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
          <cfset themeitem = "Earrings in Silver/Gold">
          <cfset themedesc = "This exclusive silver gemstone earrings showcases the finest examples of workmanship of our silversmiths and creativity of our designers.">
          <cfset themelink = "silver_earrings.cfm">
          <cfset themeimage = "/images/earrings/thumb/12120.jpg">
          <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        </tr>
        <tr>
        
        <cfset themeitem = "Earrings with Studs/Post">
        <cfset themedesc = "We have put together a vast variety of natural gemstone beads earrings and silver gemstone earrings in a hundreds of natural gems and styles.  All our earrings are handmade into perfection by expert craftsmen of India with high quality gemstones and sterling silver.">
        <cfset themelink = "stud_earrings.cfm">
        <cfset themeimage = "/images/earrings/thumb/7134.jpg">
        <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        <cfset itemcount = 3>
        <cfset imagesUsedList = "9787,12120,7134">
      </cfif>
      <cfif category eq "pendants">
<!---        <tr>
          <cfset themeitem = "Just Stone Pendants">
          <cfset themedesc = "">
          <cfset themelink = "stone_pendants.cfm">
          <cfset themeimage = "/images/pendants/thumb/1350.jpg">
          <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
          <cfset themeitem = "Pendants in Sterling Silver">
          <cfset themedesc = "We handpicked hundreds of lovely colorful natural gemstones and fashioned them into a great collection of beautiful pendants, both for women and men. All our pendants are handmade by artisans in sterling silver with authentic semiprecious stones. We also have a big range of  silver chains in various thickness and lengths.">
          <cfset themelink = "silver_gemstone_pendants.cfm">
          <cfset themeimage = "/images/pendants/thumb/8613.jpg">
          <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        </tr>
      --->  <cfset itemcount = 2>
        <cfset imagesUsedList = "1350,8613">
      </cfif>
      <cfif category eq "bracelets">
        <tr>
          <cfset themeitem = "Beaded Bracelets">
          <cfset themedesc = "Simple yet elegant- you will see a great range of beaded bracelets in a variety of gemstone beads of varying shapes, cuts, sizes and finish.">
          <cfset themelink = "beaded_bracelets.cfm">
          <cfset themeimage = "/images/bracelets/thumb/12377.jpg">
          <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
          <cfset themeitem = "Bracelets in Sterling Silver">
          <cfset themedesc = "Find here the beauty of colorful natural gems set in silver in this collection of silver bracelets, silver bangles, and wrist bands. Express your bonding with a bracelet gift.">
          <cfset themelink = "silver_bracelets.cfm">
          <cfset themeimage = "/images/bracelets/thumb/9141.jpg">
          <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
        </tr>
        <cfset itemcount = 2>
        <cfset imagesUsedList = "12377,9141">
      </cfif>
    </cfif>
    <cfset displaycateg = categ>
         <cfset vThemelist = "">
    <!--- Get the various themes and display --->
    <cfloop query="Groups">
      <cfset themeitem = Groups.GroupName>
      <!---  <cfif category neq "all" and category neq "">--->
      <cfset themedesc = Groups.description>
      <!--- <cfelse>
   <cfset themedesc= "">
   </cfif>--->
      <!---        <cfset mySpaceFreeVariable = ReReplace(themedesc, "[[:space:]]","","ALL")>
        <cfif showxthemes gt itemcount and mySpaceFreeVariable neq ""  and mySpaceFreeVariable neq " ">
--->
      <cfquery datasource="gemssql" name="GetImage">
          SELECT Items.thumblink, Items.newitem, Items.g2i, Items.status, Items.subcat,  ItemsByGroup.groupname,   ItemsByGroup.category, ItemsByGroup.itemid
    FROM Items 
              
,ItemsByGroup
    
  where ItemsByGroup.itemid = Items.newitem
    and
    (
     ItemsByGroup.groupname = '#Groups.GroupName#'
                    <cfif category neq "all" and category neq "">
                   and  (ItemsByGroup.category='#category#')
                </cfif> 
                <cfif subcat neq "">      
          and (Items.subcat = '#subcat#')
          </cfif>
    ) 
    ORDER BY Items.g2i desc
          
          </cfquery>
          
          <!--- Check for duplicate theme in jewelry --->
         <cfset duplicatetheme = 0>
          <cfif category eq "all" or category eq "">
             <cfif listContains(vThemelist, themeitem) >
                <cfset duplicatetheme = 1>                
             <cfelse>
                <cfset vThemelist= listAppend(vThemelist,themeitem) >
             </cfif>
          </cfif>
          
      <cfif GetImage.recordcount gt 0 and duplicatetheme eq 0 >
        <!--- Check for duplicate images --->
        <cfif listContains(imagesUsedList, GetImage.itemid)>
          <cfset vItemFound = 0>
          <cfloop query="GetImage">
            <cfif listContains(imagesUsedList, GetImage.itemid) or vItemFound eq 1>
              <cfelse>
              <cfset imagesUsedList = listAppend(imagesUsedList,GetImage.itemid)>
              <cfif categ eq "jewelry">
                <cfset themeimage = "/images/" & GetImage.category & "/thumb/" & GetImage.itemid & ".jpg">
                <cfelse>
                <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.itemid & ".jpg">
              </cfif>
              <cfset vItemFound = 1>
            </cfif>
          </cfloop>
          <!--- No non duplicates found --->
          <cfif vItemFound eq 0>
            <cfif categ eq "jewelry">
              <cfset themeimage = "/images/" & GetImage.category & "/thumb/" & GetImage.itemid & ".jpg">
              <cfelse>
              <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.itemid & ".jpg">
            </cfif>
          </cfif>
          <!--- Was not a duplicate --->
          <cfelse>
          <cfset imagesUsedList= listAppend(imagesUsedList,GetImage.itemid) >
          <cfif categ eq "jewelry">
            <cfset themeimage = "/images/" & GetImage.category & "/thumb/" & GetImage.itemid & ".jpg">
            <cfelse>
            <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.itemid & ".jpg">
          </cfif>
        </cfif>


        <!--- Display a theme --->
        <cfif displaycateg eq "jewelry">
          <!--- Jewellery is intentionally misspelled. One day, we need to fix the file names --->
          <cfif subcat neq "">
               <cfset themelink = "/shaped/" & #lcase(Groups.GroupName)# & "-gemstone-jewellery.cfm" >
            <!--- <cfset themelink = "/list.cfm?category=all&subcat=" & #subcat# & "&groupname="  & #Groups.GroupName#>--->
          <cfelse>
                <cfset themelink = "/shaped/" & #lcase(Groups.GroupName)# & "-gemstone-jewellery.cfm" >
           <!---  <cfset themelink = "/list.cfm?category=all&groupname="  & #Groups.GroupName#>--->
          </cfif>
        <cfelse>
          <cfif subcat neq "">
          <cfset themelink = "/shaped/" & #lcase(Groups.GroupName)# & "-gemstone-" & #displaycateg# & ".cfm" >
             <!--- <cfset themelink = "/list.cfm?category=" & #displaycateg# & "&subcat=" & #subcat# & "&groupname="  & #Groups.GroupName#>--->
          <cfelse>
          <cfset themelink = "/shaped/" & #lcase(Groups.GroupName)# & "-gemstone-" & #displaycateg# & ".cfm" >
              <!---<cfset themelink = "/list.cfm?category=" & #displaycateg# & "&groupname="  & #Groups.GroupName#>--->
          </cfif>
        </cfif>
        <CFINCLUDE TEMPLATE="hubs-themeitem.cfm">
      
          
        <cfset itemcount = itemcount + 1>
      </cfif>
      <!---</cfif>   cfif for description check --->
    </cfloop>
      </tr>
      

<CFQUERY DATASOURCE="gemssql" NAME="Groups">
<!--- hubsequence = 99:display just links --->
<cfif category neq "all" and category neq "">
    select distinct GroupName from Groupings 
    where cat='#category#' and domain='#cgi.server_name#'
  <cfif session.mail neq application.admin_email> and (hubsequence = 99)</cfif>
    
<cfelse>
    select GroupName from Groupings 
    where cat='jewelry' and domain='#cgi.server_name#'
     <cfif session.mail neq application.admin_email> and (hubsequence = 99)</cfif>
 </cfif>      								
</CFQUERY>
<tr><td colspan=2>
<p><strong>MORE THEMES:</strong>
<cfoutput query="groups">
<a href=/shaped/#lcase(groupname)#-gemstone-<cfif category is "all">jewellery<cfelse>#category#</cfif>.cfm>#lcase(groupname)#</a>  ||  
</cfoutput>

</td></tr>
  </table>

