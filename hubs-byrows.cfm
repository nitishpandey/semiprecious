
<td align="center" valign="top"><table id="infotable" align="center" cellspacing="0" cellpadding="1 ">
    <cfif start is 1>
      <cfset session.filterarray = arraynew(2)>
      <cfif category is 'ornaments'>
        <Tr valign="middle">
          <td valign="middle" style="color:##666600;" class="rowb"><b><font color=green size="-1">Christmas Ornaments handmade with paper mache and hand  painted intricately in the Indian state of Jammu and Kashmir.</font></b> </td>
        </tr>
        <cfelseif subcat is 'pearl'>
        <Tr valign="middle">
          <td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>><b><font color=gray size="-1">Our Pearls are good quality Freshwater Cultured Pearls, come with a 100% money back guarantee.</font></b><br>
          </td>
        </tr>
      </cfif>
      <cfif pagedescription neq "" or session.mail is 'acemat@vsnl.com'>
        <Tr valign="middle">
          <td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>><b><font color=gray size="-2"><i><cfoutput>#pagedescription#</cfoutput></i></font></b><br>
            <cfif session.mail is 'acemat@vsnl.com'>
              <a href="http://www.semiprecious.com/admintools/contentadder.cfm?pagename=#right(currentfile, len(currentfile)-1)#">Content Edit</a>
            </cfif>
          </td>
        </tr>
      </cfif>
      <Tr valign="middle">
        <td valign="middle" style="color:##666600;" class="rowb" colspan=<cfoutput>#displaycolumns#</cfoutput>><center>
            <div name="wholesalebanner" > <font color=red size=2><b>WHOLESALE BUYERS MUST LOGIN FOR WHOLESALE PRICES</b></font></div>
          </center></td>
      </tr>
      <CFLOOP QUERY="Getlist">
        <cfset session.filterarray[currentrow][1] = newitem>
        <cfset session.filterarray[currentrow][2] = cat>
      </cfloop>
    </cfif>
  </table>
  <cfset rowsdisplayed = 0>
  <table style="margin-left:0px;width:850px;background-color:##EDEDED;text-align:center;horizontal-align:center;margin-top:2px;"  border="0" cellspacing="0"  cellpadding="0">
    <cfif subcat neq "bulk lots" and (cgi.server_name contains "wholesale-gemstone-jewelry.com" or session.bulkbuyer.id neq "")>
      <tr>
        <td colspan="<cfoutput>#displaycolumns#</cfoutput>" ><a href=>HOME</a>&nbsp;&nbsp;&nbsp;<font color=red><b>FOR BULK LOTS CLICK</b></font> <a href=bulklots.cfm>HERE</a></font></td>
      </tr>
    </cfif>
    <!---  Start  Main Images --->
    <!---
          <tr align=center valign=top>
            <td colspan=6><a href=gemstone-jewelry.cfm><img src="ads/angelacenter.jpg" border=0 alt='gemstone jewelry'></a> </td>
          </tr>--->
    <!--- End Main Images --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <cfscript>
		    
		  </cfscript>
    <!--- Start Newest Items Listings --->
    <cfset url.sortorder="newitem desc">
    <cftry>
      <CFQUERY DATASOURCE="gemssql" NAME="GetList">
		select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
                               where (status = 0 or status = 3) 
                                    and (g2i = 1)
								<cfif category neq "all" and category neq  "">
									and (CAT = '#category#')
                                 </cfif>
                                    and (inventory > 0) 
								order by  #url.sortorder# 
							</CFQUERY>
      <cfcatch type="database">
        <b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
      </cfcatch>
    </cftry>
    <cfif GetList.recordcount gt 0>
      <tr> <cfoutput>
          <td class="hubtitle" colspan="4" align="left">&nbsp;&nbsp;&nbsp;Latest #titleCase(categ)#</td>
        </cfoutput> </tr>
      <cfset start = 1>
      <cfset end = 12>
      <cfset enddisplay = 12>
      <cfset displayrowid = "DisplayNewestItem">
      <!--- Set destination for javascript for when they click past 12 --->
      <cfoutput>
        <script language="Javascript" type="text/javascript">
		             setDestination("Newest","/latest-#categ#.cfm");
					 </script>
      </cfoutput>
      <cfif Getlist.recordcount lt 12>
        <cfoutput>
          <script language="Javascript" type="text/javascript">
		             setMax("Newest",#Getlist.recordcount#);
					 </script>
        </cfoutput>
      </cfif>
      <CFINCLUDE TEMPLATE="singleitem.cfm">
    <!--- Prev/Next --->
    <tr>
      <td colspan="4" align="center"><span id="NewestPrevButton" style="visibility:hidden"><a href="javascript:redisplay('prev','Newest');">Previous</a></span> &nbsp;&nbsp;&nbsp; <cfoutput><span id="NewestNextButton"><a href="javascript:redisplay('next','Newest');">More Latest #categ#</a></span></cfoutput> </td>
    </tr>
     </cfif>
   <!--- End Newest Items Listings --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <!--- Start Most Popular listings --->
    <cfset url.sortorder="lastbought desc">
    <cftry>
      <CFQUERY DATASOURCE="gemssql" NAME="GetList">
		select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
                               where (status = 0 or status = 3) 
                                    and (g2i = 1)
 								<cfif category neq "all" and category neq  "">
									and (CAT = '#category#')
                                 </cfif>
                                    and (inventory > 0) 
								order by  #url.sortorder# 
							</CFQUERY>
      <cfcatch type="database">
        <b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
      </cfcatch>
    </cftry>
    <!--- only display the row, if there are items in the row --->
    <cfif GetList.recordcount gt 0>
      <tr> <cfoutput>
          <td class="hubtitle" colspan="4" align="left">&nbsp;&nbsp;&nbsp;Most Popular #titleCase(categ)#</td>
        </cfoutput> </tr>
      <cfset start = 1>
      <cfset end = 12>
      <cfset enddisplay = 12>
      <cfset displayrowid = "DisplayPopularItem">
      <cfoutput>
        <script language="Javascript" type="text/javascript">
		             setDestination("Popular","/gemstone_jewelry_gallery.cfm?category=#category#&sortorder=lastbought");
					 </script>
      </cfoutput>
      <cfif Getlist.recordcount lt 12>
        <cfoutput>
          <script language="Javascript" type="text/javascript">
		             setMax("Popular",#Getlist.recordcount#);
					 </script>
        </cfoutput>
      </cfif>
      <CFINCLUDE TEMPLATE="singleitem.cfm">
    <!--- Prev/Next --->
    <tr>
      <td colspan="4" align="center"><span id="PopularPrevButton" style="visibility:hidden"><a href="javascript:redisplay('prev','Popular');">Previous</a></span> &nbsp;&nbsp;&nbsp; <cfoutput><span id="PopularNextButton"><a href="javascript:redisplay('next','Popular');">More Popular #categ#</a></span></cfoutput> </td>
    </tr>
    </cfif>
    <!--- End Most Popular Listings --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <!--- Start Sale Items Listings --->
    <cfset url.sortorder="newitem desc">
    <cftry>
      <CFQUERY DATASOURCE="gemssql" NAME="GetList">
		select lastbought, disporder, newitem, CAT, storage, thumblink, imagelink, subcat, NameID,        price      , saleprice, status, wholesaleprice, Description, subcat, inventory, buylink from Items 
                               where (status = 3) 
                                    and (g2i = 1)
								<cfif category neq "all" and category neq  "">
									and (CAT = '#category#')
                                </cfif>
                                    and (inventory > 0) 
								order by  #url.sortorder# 
							</CFQUERY>
      <cfcatch type="database">
        <b>Sorry, there has been a database error, please call us at 1 866 819 7692 to inform us.</b>
      </cfcatch>
    </cftry>
    <cfif GetList.recordcount gt 0>
      <tr> <cfoutput>
          <td class="hubtitle" colspan="4" align="left">&nbsp;&nbsp;&nbsp;#titleCase(categ)# on Sale</td>
        </cfoutput> </tr>
      <cfset start = 1>
      <cfset end = 12>
      <cfset enddisplay = 12>
      <cfset displayrowid = "DisplaySaleItem">
      <cfoutput>
        <script language="Javascript" type="text/javascript">
		             setDestination("Sale","/cheap-#categ#.cfm");
					 </script>
      </cfoutput>
      <cfif Getlist.recordcount lt 12>
        <cfoutput>
          <script language="Javascript" type="text/javascript">
		             setMax("Sale",#Getlist.recordcount#);
					 </script>
        </cfoutput>
      </cfif>
      <CFINCLUDE TEMPLATE="singleitem.cfm">
    <!--- Prev/Next --->
    <tr>
      <td colspan="4" align="center"><span id="SalePrevButton" style="visibility:hidden"><a href="javascript:redisplay('prev','Sale');">Previous</a></span> &nbsp;&nbsp;&nbsp; <cfoutput><span id="SaleNextButton"><a href="javascript:redisplay('next','Sale');">More Sale #categ#</a></span></cfoutput> </td>
    </tr>
    </cfif>
    <!--- End Sale Items Listings --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <!--- Birthstone section --->
    <tr>
      <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Birthstones</strong></div></td>
    </tr>
    <tr align=center valign="top">
      <td valign="top" align=left colspan="4"><font =arial> <a href=<cfoutput>#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))#</cfoutput> Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
        Also, next months - <a href=<cfoutput>#lcase(monthasstring(month(now())+1))#-birthstone.cfm>#monthasstring(Month(now())+1)#</cfoutput> Birthstone Jewelry</a> </td>
    </tr>
    <!--- End birthstone section --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <!--- Start By color section --->
    <tr>
      <td colspan="4" align="center"><cfinclude template="includes/bycolor.cfm"></td>
    </tr>
    <!--- End by color section --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <!--- Start Necklace Type section --->
    <cfif category eq "necklaces">
      <tr>
        <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Necklaces</strong></div></td>
      </tr>
      <tr>
        <td align="center" valign="top" colspan="4"><font size="-1"><a href=beaded_necklaces.cfm>Beaded</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=silver_necklaces.cfm>In Sterling Silver</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=silver_bead_necklaces.cfm>With Silver Beads</a></font> </td>
      </tr>
    </cfif>
    <!---  End Necklace Type section --->
    <!--- Start Beads Type section --->
    <cfif category eq "beads">
      <tr>
        <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Beads</strong></div></td>
      </tr>
      <tr>
        <td align="center" valign="top" colspan="4"><font size="-1"><a href=beads_Pearl.cfm>Pearls</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=beads.cfm>Gemstone Beads</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"> <a href=beads_BaliSterling.cfm>Silver Beads</a> </font></td>
      </tr>
    </cfif>
    <!--- End Beads Type section --->
    <!--- Start Earrings Type section --->
    <cfif category eq "earrings">
      <tr>
        <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Earrings</strong></div></td>
      </tr>
      <tr>
        <td align="center" valign="top" colspan="4"><font size="-1"><a href=beaded_earrings.cfm>Beaded</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=Silver_earrings.cfm>Silver/Gold</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=stud_earrings.cfm>Studs/Post</a> </font></td>
      </tr>
    </cfif>
    <!--- End Earrings Type section --->
    <!--- Start Pendants Type section --->
    <cfif category eq "pendants">
      <tr>
        <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Pendants</strong></div></td>
      </tr>
      <tr>
        <td align="center" valign="top" colspan="4"><font size="-1"><a href=stone_pendants.cfm>Just Stone</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=silver_gemstone_pendants.cfm>In Sterling Silver</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=cross_pendant.cfm>Cross Pendants</a></font> </td>
      </tr>
    </cfif>
    <!--- End Pendants Type section --->
    <!--- Start Bracelets Type section --->
    <cfif category eq "Bracelets">
      <tr>
        <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Bracelets</strong></div></td>
      </tr>
      <tr>
        <td align="center" valign="top" colspan="4"><font size="-1"><a href=beaded_bracelets.cfm>Beaded</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=silver_bracelets.cfm>In Sterling Silver</a></font> </td>
      </tr>
    </cfif>
    <!--- End Bracelets Type section --->
    <!--- Start Rings Type section --->
    <cfif category eq "rings">
      <tr>
        <td colspan="4" align="left"><div  class="greenbutton"> <strong>&nbsp;&nbsp;&nbsp;Rings by Size</strong></div></td>
      </tr>
      <tr>
        <td align="center" valign="top" colspan="4"><font size="-1"><a href=rings.cfm?ringsize=5>Size 5</a></font> &nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=rings.cfm?ringsize=6>Size 6</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=rings.cfm?ringsize=7>Size7</a></font> &nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=rings.cfm?ringsize=8>Size 8</a></font>&nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=rings.cfm?ringsize=9>Size 9</a></font> &nbsp;&nbsp;||&nbsp;&nbsp; <font size="-1"><a href=rings.cfm?ringsize=10>Size 10</a></font> </td>
      </tr>
    </cfif>
    <!---  End Rings Type section --->
    <tr>
      <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4"><div  class="greenbutton"> &nbsp;</div></td>
    </tr>
    <!--- <cfinclude  template="statsrecord.cfm"> --->
    <!--- Start bottom ad --->
    <cfoutput>
      <cfinclude template="includes/linkexchangebystone.cfm">
      <tr>
        <td  colspan="6" align=middle><a href=http://www.handmadelaptopcase.com><img src=http://www.handmadelaptopcase.com/laptopbags/ads/400x80bags.jpg></a>
          <cfinclude template="/googleadsforlist.htm"></td>
      </tr>
      <!--- End bottom ad --->
      <cfif subcat neq "">
        <cfinclude template="/marketing/stonelinks.cfm">
      </cfif>
    </cfoutput>
  </table ></td>
