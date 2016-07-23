<cfparam name=category default='jewelry'>
<cfif category is "all"><cfset category='jewelry'></cfif>
<cfquery name="getthemes" datasource="gemssql">
Select  top 6 groupname  from groupings where cat='#category#' and hubsequence <>99 and domain='#cgi.server_name#' order by hubsequence
</cfquery>

<font size="5" face="Bradley Hand ITC"><cfoutput>#category#</cfoutput> by Price:</font><br>
<a href="/gemstone_jewelry_gallery.cfm?priceless=10"><font size="4" face="Bradley Hand ITC">under 10</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?priceless=20&priecegreater=10"><font size="4" face="Bradley Hand ITC">$11-$20</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?priceless=30&priecegreater=20"><font size="4" face="Bradley Hand ITC">$21-$30</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?priceless=50&priecegreater=30"><font size="4" face="Bradley Hand ITC">$30-$50</font></a><br>
<a href="/gemstone_jewelry_gallery.cfm?pricegreater=49&priceless=1000"><font size="4" face="Bradley Hand ITC">Over $50</font></a><br><br>
 

<font size="5" face="Bradley Hand ITC"><cfoutput>#category#</cfoutput> by design:<br>
<cfoutput query="getthemes">
<a href="/shaped/#groupname#-gemstone-jewellery.cfm"><font size="4" face="Bradley Hand ITC">#groupname#</font></a><br></cfoutput>
<br><a href="/<cfoutput>#lcase(category)#</cfoutput>.cfm"><b>More Designs</b>..</a></font>

<font size="5" face="Bradley Hand ITC">
<br><br><cfoutput>#category#</cfoutput> by gemstone:<br>
<a href="/amethyst.cfm"><font size="4" face="Bradley Hand ITC">Amethyst</font></a><br>
<a href="/bluetopaz.cfm"><font size="4" face="Bradley Hand ITC">Blue Topaz</font></a><br>
<a href="/crystal.cfm"><font size="4" face="Bradley Hand ITC">Crystal</font></a><br>
<a href="/moonstone.cfm"><font size="4" face="Bradley Hand ITC">Moonstone</font></a><br>
<a href="/turquoise.cfm"><font size="4" face="Bradley Hand ITC">Turquoise</font></a><br>
<br><a href="/<cfoutput>rare-stones/rare-gems-#lcase(category)#.cfm</cfoutput>"><b>More Stones</b>..</a></font>




