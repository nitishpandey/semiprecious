<cfparam name='category' default="">
<!---
	<cfinclude template="setup.cfm"> --->
<cfset session.india=0>
<TABLE border="0" width="100%" align="center" style="margin-left: 10px">
	<tr>
		<td align="left" valign="top" width="100%" style="padding:0px">
			<table cellpadding="10" align=left  border=0 width="100%" style="margin:0px;">
				<!---
				   <tr >

					<td  align="center" valign="top" background="images/Bracelets/thumb/5064.jpg" >
<br><br><a href='http://www.semiprecious.com/bracelets.cfm'><strong>BRACELETS</strong></a> 
</td>

					<td   align="left" valign="top" background="images/indexcenter/amber.jpg"><a href="amber.cfm"><strong>Amber!</strong></a>
<td width=140 align="center" valign="middle" background="images/indexcenter/beads.jpg">

					<a href='beads.cfm'><strong>GEMSTONE BEADS</strong></a></td>

					</tr>
				   --->
				<!---	<cfinclude template="bags.htm">--->
				<tr valign=top >
					<td align=left width=360>
						<a href=http://www.semiprecious.com/jewelry-sale.cfm>
							<img src="/holidays/blackfridayhome.jpg" width="360" height="162" border="0" alt='gemstone sterling silver jewelry' />
						</a>
					</td>
					<td  align=left Class="bradley_big">
						<div style="padding-left:10px;position:relative;left:30px">
							<ul>
								<li>
									Authentic gemstone jewelry in sterling silver
								</li>
								<li>
									Over 18000 designs of silver jewelry and over
									<br>
									80 types of gemstone beads
								</li>
								<li>
									30 days flexible return policy
								</li>
								<li>
									Wholesale Discounts
								</li>
								<li>
								</li>
								<li>
									Rings sizes from US size 4 to 12
								</li>
								<li>
									Shipped worldwide from Austin, TX, USA
								</li>
							</ul>
						</div>
					</td></tr>
					<!---   <cfinclude template="includes/search.cfm">--->
					<cfquery  datasource="gemssql" name="accouncementhome" cachedwithin="#createtimespan(0,0,1,0)#">
  select description, linkto from contenthome where domain like '#left(cgi.server_name,5)#%' and category='announcement' and seq is null
  </cfquery>
			<cfif accouncementhome.recordcount gt 0>
				<tr align=center valign="top">
                 <td colspan="2" valign="top" align=left width=100%> <font color=brown><b>
                 <cfoutput>#accouncementhome.description#. Click <a href=#accouncementhome.linkto#>here</a>.</cfoutput></b></font> </td> </tr> </cfif>
						<tr align=center valign="top">
					<td colspan="2" valign="top" align=left class="jewelry content " >
						
						Astrology and Zodiac based 
						birthstone Jewelry</a> - earrings, pendants, necklaces, rings for the <a class="reg_price link" href=
						<cfoutput>
							#lcase(monthasstring(month(now())))#-birthstone.cfm>#monthasstring(Month(now()))#
						</cfoutput> month</a>. Or you can plan ahead for  <a class="reg_price link" href=
						<cfoutput>
							#lcase(monthasstring(dateformat(dateadd("M",1,now()),"m")))#-birthstone.cfm>#monthasstring(dateformat(dateadd("M",1,now()),"m"))#
						</cfoutput>
						Birthstone Jewelry</a>
					</td>
				</tr><tr align=center valign="top">
					<td colspan="2" valign="top" align=right >
						<cfinclude template="/indexhubcssasclass.cfm">
					</td>
				</tr>
				
				<!---           <cfinclude template="pippinindex.htm">--->
				<!---<cfinclude template="stone-beads.htm">--->
				<!---    <tr align=center valign="top">
					<td colspan="6" valign="top" align=left background=images/tdbg2.jpg><font =arial>
					<cfinclude template=vacation.inc>
					<a href=valentines-day-jewelry.cfm>Stone Hearts Collection</a> - Even the stone-hearted can not resist the little  hearts carved in stone on this Saint Valentines Day, our love collection of beautiful jewelry just for your beloved.
					</td>
					</tr>--->
		
			</table>
		</td>
	</TR>
	<!---<tr><td colspan=6>	<tr><td colspan="2">  <cfinclude template="includes/bycolor.cfm">
</td></tr>
		--->
	<tr>
		<td  class="jewelry content" >
			Semiprecious.com opens up a spectacular world of semiprecious gemstone and sterling silver jewelry, over 15000 items with prices ranging from less $10 to over $500. You may also contact us to buy jewelry at reasonable wholesale prices. Our jewelry is made from hundreds of gemstones sourced from the world over and handmade into gorgeous jewelry pieces by skilled artisans. Buy one to pamper yourself or as a gift for one you love. Serving you since 1990, with high customer satisfaction.
			<br />
			We feature gemstone Jewelry with designer items at
			<a href="cheapjewelry.cfm">
				affordable
			</a>
			rates. The collection has brooches, cufflinks, loose gems, rings, earrings, pendants, beads, necklaces in sterling silver guaranteed. Check out our
			<a href=silver_jewelry.cfm>
				silver jewelry
			</a>
			and
			<a href=beaded_jewelry.cfm>
				beaded jewelry
			</a>
			with semiprecious stones, beaded and set in 925 silver, premium and affordable jewelry -
			<b>
				over 18000
			</b>
			affordable designs in silver. New range includes healing crystals and decorations that also make excellent gifts.
			<br />
			Semiprecious gem stones have properties - healing, physical chemical, history etc. that we have compiled for your reading.
			</td>
	</tr>
	<cfif cgi.server_name neq "63.135.126.234">
		
<!--- TODO: Removed to reduce clutter 
<TR align="center" valign="top">

			<td  valign=top align="justify" >
				<table  border=0 align="center" >
					<tr class="customrequest">
						<td align="center" class="darkbox">
							<font color="#FFFFFF">
								JEWELRY GIFTS
							</font>
						</td>
						<td align="center" class="darkbox">
							<font color="#FFFFFF">
								PROMOTION
							</font>
						</td>
						<td align="center" class="darkbox">
							<font color="#FFFFFF">
								Jewelry Newsletters
							</font>
						</td>
					</tr>
					<tr class="customrequest">
						<td align="center" valign="top" >
							<div align="justify" style="border-right:thin ridge black;padding-right:4px;padding-top:6px;">
								<font color="#400000">
									Don't just adorn yourself; buy &amp; email
									<strong>
										Value plus
									</strong>
									Jewelry
									<a href="gift_certificatenew.cfm">
										gift certificates
									</a>
									to your friends.
								</font>
							</div>
						</td>
						<td align="center" valign="top" >
							<div align="justify" style="border-right:thin ridge black;padding-left:4px;padding-right:4px;padding-top:6px;">
								<font color="#000000">
									<a href="apply.cfm">
										Sign-up
									</a>
									to get purchase credit, discounts &amp; new item alerts via email, email enabled saving of cart, wish list etc. It takes a minute...
								</font>
							</div>
						</td>
						<td align="center" valign="top" width=200 >
							<font color="#000040">
								<a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=9>
									Friends Referal Credit
								</a>
								<br>
								<a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=14>
									Tiny discount lots 4 U
								</a>
								<br>
								<a href=http://www.semiprecious.com/Mysticquartz.cfm>
									Mystic Quartz
								</a>
								<br>
								<a href=http://www.semiprecious.com/newsletters/nlviewerwithurlid.cfm?id=14>
									Jewelry on Sale
								</a>
							</font>
						</td>
					</tr>
				</table>
			</td>
                </tr>
                --->
		<tr>
			<td align="center" >
<div class="jewelry_hub" style="margin-top:5px;margin-bottom:5px;border:1px solid black">
				<span class="details">
					Stone Facts:
				</span>
				<a title="Medicinal and Healing Mysteries Unravelled" href="/healing_properties.cfm" class="headeranchor">
					Healing
				</a>
				|
				<a title="Chemical and Physical properties of the gemstones" href="/physical_chemical_properties.cfm" class="headeranchor">
					Physical Chemical
				</a>
				
					|
				
				<a title="Find out Where they were first mined" href="/origin_history.cfm" class="headeranchor">
					History
				</a>
				
					|
				
				<a title="Know About Geographic Sources" href="/geographical_deposits.cfm" class="headeranchor">
					Geology
				</a>
				
					|
				
				<a title="Alphabetically Sorted Information for the gemstones"  href='/agate.htm' class="headeranchor">
					All By Stone
				</a>
</div>
			</td>
		</TR>
		<TR>
			<TD   align="right"  vAlign="middle" bordercolor="#000066"  bgcolor="#FFFFFF" >
				<cfif not isdefined("session.india")>
				   <div align="center">				<strong>
									Payment Modes: PayPal, Credit cards, Money Order, Check, Cash on Delivery (COD)
								</strong>
						</div><div align="center" class="row3">		You can also order by phone
								<strong>
									<cfoutput>
										#Application.tollfree#
									</cfoutput>
								</strong>
								(USA)
							</div>
				</cfif>
			</td>
		</TR>
	</cfif>
	<!--- cgi --->
</TABLE>