<!-- hubs-stoneitem.cfm starts --->
<cfset sub_anchor_title = subcatout & ' ' & cat />
<cfoutput>
	<h2>
		<a title="Buy #sub_anchor_title#" href="#themelink#" class="hubs_item">
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
<cfif  len(trim(mySpaceFreeVariable)) neq 0>
	<cfoutput>
		<a title="Collection of #sub_anchor_title#" style="display:inline;float:right" href="#themelink#">
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
		<a title="Buy #sub_anchor_title#" href="#themelink#">
			<img src="#themeimage#"  border="0">
		</a>
	</cfoutput>
</cfif>
<!-- hubs-stoneitem.cfm end --->
