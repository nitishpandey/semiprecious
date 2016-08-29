<cfoutput>
	<h2>
		<a href="#themelink#" class="hubs_item">
			<cfif cgi.server_name contains "wholesale">
				WHOLESALE #subcat# #displaycateg#
			<cfelse>
				#subcat# #displaycateg#
			</cfif>
		</a>
	</h2>
</cfoutput>
<cfif session.mail eq application.admin_email>
	<cfoutput>
		<a href="/admintools/stoneedit.cfm?category=#cat#&subcat=#subcat#">
			Retail EDIT
		</a>
	</cfoutput>
</cfif>
<cfset mySpaceFreeVariable = ReReplace(themedesc, "[[:space:]]","","ALL")>
<cfif  mySpaceFreeVariable neq ""  and mySpaceFreeVariable neq " ">
	<cfoutput>
		<a style="display:inline" href="#themelink#">
			<img src="#themeimage#"  border="0">
		</a>
	</cfoutput>
	<span style='font-size:10pt;font-family:"Palatino Linotype","serif";color:black'>
		<cfif cgi.server_name contains "wholesale">
		<cfelse>
			<cfoutput>
				#themedesc#
			</cfoutput>
		</cfif>
	</span>
<cfelse>
	<cfoutput>
		<a href="#themelink#">
			<img src="#themeimage#"  border="0">
		</a>
	</cfoutput>
</cfif>
