					<CFQUERY DATASOURCE="gemssql" NAME="stats">
						update itemstats set thumbexposure=thumbexposure+1
						<cfif color neq "">, color=color+1</cfif>
						<cfif style neq "">, style=style+1</cfif>
						<cfif subcat neq "">, subcat=subcat+1</cfif>
						<cfif groupname neq "">, groupname=groupname+1</cfif>
						<cfif sortorder eq "price">, orderbyprice=orderbyprice+1</cfif>
						<cfif sortorder eq "price desc">, orderbypremium=orderbypremium+1</cfif>
						<cfif sortorder eq "datetaken desc">, orderbynew=orderbynew+1</cfif>
						
						 where itemid in (#itemlist#)
						</cfquery>
