<cfsilent><cfif session.mail neq "acemat@vsnl.com">
					<CFQUERY DATASOURCE="gemssql" NAME="stats">
						update itemstats set thumbexposure=thumbexposure+1
						<cfif color neq "">, color=color+1</cfif>
						<cfif style neq "">, style=style+1</cfif>
						<cfif subcat neq "">, subcat=subcat+1</cfif>

<cfif priceless neq "">, price=price+1</cfif>

<cfif jewelrysize neq "" or ringsize neq "" or url.ringsize neq "">, size=size+1</cfif>
						<cfif groupname neq "">, groupname=groupname+1</cfif>
						<cfif sortorder eq "price">, orderbyprice=orderbyprice+1</cfif>
						<cfif sortorder eq "price desc">, orderbypremium=orderbypremium+1</cfif>
						<cfif sortorder eq "datetaken desc">, orderbynew=orderbynew+1</cfif>
			
<cfif category eq "necklaces">, necklaces=necklaces+1</cfif>
<cfif category eq "beads">, beads=beads+1</cfif>		
<cfif category eq "pendants">, pendants=pendants+1</cfif>		
<cfif category eq "earrings">, earrings=earrings+1</cfif>		
<cfif category eq "bracelets">,bracelets =bracelets+1</cfif>
<cfif category eq "rings">, rings=rings+1</cfif>	
<cfif category eq "healing">, healing=healing+1</cfif>	
<cfif category eq "All">, jewelry=jewelry+1</cfif>	
						 where itemid in (#itemlist#)
						</cfquery>
</cfif>
</cfsilent>