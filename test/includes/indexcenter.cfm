<cfparam name='category' default="">
<cfinclude template="/setup.cfm">
<cfset session.india=0>
<TABLE border="0" width="740" cellspacing="2" cellpadding="4" valign="top" align="center" style="margin:0px;">     
<tr>
 <td align="center" valign="top" width="758" style="padding:0px">
 <table align="left"  cellpadding="4" border="0" width="100%" style="margin:0px;">
         <!--- <tr height=100> 
            <td  align="center" valign="top" background="images/Bracelets/thumb/5064.jpg" ><br><br><a href='http://www.semiprecious.com/bracelets.cfm'><strong>BRACELETS</strong></a> </td>
            <td   align="left" valign="top" background="images/indexcenter/amber.jpg"><a href="amber.cfm"><strong>Amber!</strong></a><td width=140 align="center" valign="middle" background="images/indexcenter/beads.jpg">
	<a href='beads.cfm'><strong>GEMSTONE BEADS</strong></a></td>
          </tr>---> 
		  <!---	<cfinclude template="bags.htm">--->	
	  <tr valign="top" >
	  <td align="left" width="360" style="padding:0px;"><div style="position:relative;">
 <a href=gem-stone-jewelry.cfm>
 <img src="/images/gemstone-jewelry.jpg" width="450" height="223" border="0" alt='gemstone sterling silver jewelry' /></a>
	  		 </div> </td><td align="left" Class="bradley_small">
		 
  <ul>
    <li>8000 designs in authentic 92.5 silver</li>
	<li>Over 40 different real gemstones</li>
    <li>Ships all over the world from USA</li>
	<li>Pay in easy monthly installments</li>
	<li>Wholesale section for resellers</li>
    <li>Rings & bracelets in all sizes</li>
    <li>Secure payment gateways</li>
	
  </ul>  
<!---  <table  cellpadding=5><tr><td rowspan=2 width=10>&nbsp;</td><td colspan=2>
  <font color=CC3333><b>THIS WEEK'S SPECIAL</b></font></td></tr><tr><td valign=top>
<a href=/silver_gemstone_necklaces.cfm><img src=/images/necklaces/thumb/12671.jpg height=75></a></td>
<td width=100 valign=top> 
<font color=993333>Sterling Silver Necklaces On Sale! </font></td></tr>
</table>--->
</td>

    		 <!---   <cfinclude template="includes/search.cfm">--->
  <cfquery  datasource="gemssql" name="accouncementhome" cachedwithin="#createtimespan(0,0,1,0)#">
  select description, linkto from contenthome where domain like '#left(cgi.server_name,5)#%' and category='announcement' and seq is null
  </cfquery>
  <cfif accouncementhome.recordcount gt 0> 
   <tr align="center" valign="top"> 
      <td colspan="2" valign="top" align="left">
	  <font color="brown"><b><cfoutput>#accouncementhome.description#. Click <a href=#accouncementhome.linkto#>here</a>.</cfoutput></b></font>
  </td>
  </tr>
  </cfif>

   <tr align="center" valign="top"> 
      <td colspan="2" valign="top" align="left" >
      <cfinclude template="/indexhubcssasclass.cfm">
	  </td>
	
<!---           <cfinclude template="pippinindex.htm">--->
	<!---<cfinclude template="stone-beads.htm">--->

	
		<!---    <tr align=center valign="top"> 
     <td colspan="6" valign="top" align=left background=images/tdbg2.jpg><font =arial>
<cfinclude template=vacation.inc>
	<a href=valentines-day-jewelry.cfm>Stone Hearts Collection</a> - Even the stone-hearted can not resist the little  hearts carved in stone on this Saint Valentines Day, our love collection of beautiful jewelry just for your beloved.
 
  
      </td>
    </tr>--->
<tr align=center valign="top"> 
      <td colspan="2" valign="top" align=left ><!-- <font =arial>
<b>We Also Sell Wholesale</b>: We have another site for wholesale buyers, for selling to larger buyers or to those who resell.
 That site is the largest wholesale gemstone jewelry site with over 6000 jewllery designs to pick from. 
 We have 92.5 silver jewelry and beaded jewellery as well, shipped via Austin, TX from India. Click <a href=http://www.semipreciouswholesale.com>here</a> to go to our wholesale site. A lot of our jewelry is handmade or handcrafted. -->  
      </td>
    </tr>

   <tr align="center" valign="top"> 
      <td colspan="2" valign="top" align="left" >
      <font ="arial">
	<cfoutput><a href="#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))#"></cfoutput>Birthstone Jewelry</a> - Birthstone Earrings, pendants, necklaces, rings for the current month.
 Also, next months - <a href="<cfoutput>#lcase(monthasstring(dateformat(dateadd("M",1,now()),"m")))#-birthstone.cfm">#monthasstring(dateformat(dateadd("M",1,now()),"m"))#"</cfoutput> Birthstone Jewelry</a>
 </font>
  
      </td>
    </tr>

         </table></td>
    </TR>

    <!---
        <tr><td colspan=6>	  <cfinclude template="includes/bycolor.cfm"></td></tr>
    --->
<!--- use contentbypage to put content here
<tr>
<td > Welcome to the world of semiprecious gemstone and sterling silver jewelry, over 27000 designs with prices ranging from $2 to over $500. You may also contact us to buy jewelry at reasonable wholesale prices. Our jewelry is made from hundreds of gemstones sourced from the world over and handmade into gorgeous jewelry pieces by skilled artisans. Buy one to pamper yourself or as a gift for one you love. Serving you since 1990, with high customer satisfaction.<br />
	<p>You can pick gemstone Jewelry and designer items at <a href="cheapjewelry.cfm">affordable</a> prices. The store has rings, earrings, pendants, beads, necklaces. Check out our <a href=silver_jewelry.cfm>silver jewelry</a> and <a href=beaded_jewelry.cfm>beaded jewelry</a> with semiprecious stones, beaded and set in 925 silver, premium and affordable jewelry -  <b>over 7000</b> affordable designs in silver. New range includes healing crystals and decorations that also make excellent gifts. <br />
	Semiprecious gem stones all have properties  - healing, physical chemical, history etc. that we have compiled for your reading.  <br />
	 We ship FPO, APO, internationally and accept no-questions asked returns up to 30 days! 

</td>
</tr>
--->
<cfif cgi.server_name neq "63.135.126.234">
   <!--- <TR align="center" valign="top"> 
      <td  valign=top align="justify" > <table  border=0 align="center" >
          <tr class="customrequest"> 
            <td align="center" class="darkbox"><font color="#FFFFFF">JEWELRY 
              GIFTS</font></td>
            <td align="center" class="darkbox"><font color="#FFFFFF">PROMOTION</font></td>
            <td align="center" class="darkbox"><font color="#FFFFFF">Jewelry Newsletters</font></td>
          </tr>
          <tr class="customrequest"> 
            <td align="center" valign="top" > <div align="justify" style="border-right:thin ridge black;padding-right:4px;padding-top:6px;"><font color="#400000">Don't 
                just adorn yourself; buy &amp; email <strong>Value plus</strong> 
                Jewelry <a href="gift_certificatenew.cfm">gift certificates</a> 
                to your friends.</font></div></td>
            <td align="center" valign="top" > <div align="justify" style="border-right:thin ridge black;padding-left:4px;padding-right:4px;padding-top:6px;"><font color="#000000"><a href="apply.cfm">Sign-up 
                </a> to get purchase credit, discounts &amp; new item alerts via 
                email, email enabled saving of cart, wish list etc. It takes a 
                minute...</font></div></td>
            <td align="center" valign="top" width=200 ><font color="#000040"> 
                <a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=9>Friends Referal Credit</a><br>
                <a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=14>Tiny discount lots 4 U</a><br>
               <a href=http://www.semiprecious.com/Mysticquartz.cfm>Mystic Quartz</a><br>
                <a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=14>Jewelry on Sale</a>
                
</font></td>
          </tr>--->
        <tr><td >
 <span class="details">Stone Facts:</span> <a href="/healing_properties.cfm" class="headeranchor">Healing</a> 
        | <a href="/physical_chemical_properties.cfm" class="headeranchor">Physical 
        Chemical</a> <span > | </span> <a href="/origin_history.cfm" class="headeranchor">History</a><span > 
        | </span><a href="/geographical_deposits.cfm" class="headeranchor">Geology</a><span > 
        | </span><a href='/agate.htm' class="headeranchor"> All By Stone</a></td>
    </TR>

    <TR> 
      <TD   align="right"  vAlign="middle" bordercolor="#000066"  bgcolor="#FFFFFF"> 
      <cfif isdefined("session.india")>
	  <cfelse>
  <table width="80%"  align="right"  cellpadding="0" cellspacing="0" border="0">
    <tr valign="bottom" align="center"  > 
      <td align="center" valign="top"   class="darkbox"  ><strong>Payment 
        Modes: PayPal, Credit cards, Money Order, Check, Cash on Delivery (COD)</strong></td>
    </tr>
    <tr  class="row3"align="center"  > 
      <td nowrap class="row2"   >You can also order by phone<strong><cfoutput>#Application.tollfree#</cfoutput></strong> (USA)</td>
    </tr>

		
  </table>
</cfif>

</td>
    </TR>
</cfif> 
  </TABLE>
