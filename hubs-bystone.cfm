<cfset themelink = "">
<cfset themeimage = "">
<cfset imagesUsedList = "">
<cfset themedesc = "">
<cfset subcatout = subcat >
<cfset subcatout = Replace(subcat, ' ', '' , 'all')>
<cfif subcatout eq 'tigereye'>
	<cfset subcat = 'tiger eye'>
</cfif>
<cfif subcatout eq 'greenamethyst'>
	<cfset subcat = 'green amethyst'>
</cfif>
<cfif subcatout eq 'lapislazuli'>
	<cfset subcat = 'lapis lazuli'>
</cfif>
<cfif subcatout eq 'bluetopaz'>
	<cfset subcat = 'blue topaz'>
</cfif>
<cfif subcatout eq 'rosequartz'>
	<cfset subcat = 'rose quartz'>
</cfif>
<cfif subcatout eq 'lemonquartz'>
	<cfset subcat = 'lemon quartz'>
</cfif>
<cfif subcatout eq 'smokyquartz'>
	<cfset subcat = 'smoky quartz'>
</cfif>
<!--- Size the table --->
<cfset itemcount = 0>
<cfset displaycateg = "">
<!--- Some categories have special types that we'll display first --->
<!--- They don't get displayed if we're showing particular stones --->

<cftry>
	<cfset Stones = Application.stones />
	<cfcatch type="any">
		<cftry>
			<CFQUERY DATASOURCE="gemssql" NAME="Application.Stones" cachedwithin="#createtimespan(0,11,0,0)#" >
		<!--- Get individual item descriptions here --->

		    select distinct cat, description, case
			cat when 'necklaces' then 1
				when 'rings' then 4
				when 'pendants' then 2
				when 'earrings' then 3
				when 'bracelets' then 5
				WHEN 'BEADS' THEN 6
				ELSE 7
				END AS ORDR 	 from catsubcatinstock
		    where stone='#subcat#'
		    and cat <> 'anklets' and cat <>'gems'
		    and inventory > 1 ORDER BY ORDR
		</CFQUERY>
			<cfset Stones = Application.stones />
			<cfcatch type="database">
				<b>
					Sorry, there has been a database error. A mail has been sent to the developers. You can also call us at
					<cfoutput>
						#Application.tollfree#
					</cfoutput>
					to inform us and get on with your shopping.
				</b>
				<cfinvoke method="sendmail" component="backing_beans.mailer" >
					<cfinvokeargument name="mailto" value="stacyanup@gmail.com" />
					<cfinvokeargument name="subject" value="Error" />
					<cfinvokeargument name="mailcontent" value="#cfcatch.detail#|#cfcatch.message#|#cgi.URL#" />
				</cfinvoke>
				<cfinclude template="mainfooter.cfm" />
				<cfabort>
	</cfcatch>
</cftry>
</cfcatch>
</cftry>
<!--- Get the various themes and display --->
<cfloop query="Stones">
	<cftry>
		<cfquery datasource="gemssql" name="GetImage">
      SELECT top 3 thumblink, newitem, g2i, datetaken, status, subcat, cat from Items
       WHERE  inventory>0 and (status=0 or status=3) and subcat = '#subcat#'
    <cfif cat neq "jewelry">  AND  cat = '#cat#'</cfif>
     ORDER BY disporder
          </cfquery>
		<cfcatch type="database">
			<b>
				Sorry, there has been a database error. A mail has been sent to the developers. You can also call us at
				<cfoutput>
					#Application.tollfree#
				</cfoutput>
				to inform us and get on with your shopping.
			</b>
			<cfinvoke method="sendmail" component="backing_beans.mailer" >
				<cfinvokeargument name="mailto" value="stacyanup@gmail.com" />
				<cfinvokeargument name="subject" value="Error" />
				<cfinvokeargument name="mailcontent" value="#cfcatch.detail#|#cfcatch.message# #cgi.URL#" />
			</cfinvoke>
		</cfcatch>
	</cftry>
	<!---          <!--- Separate item for all jewelry --->
	<cfif itemcount eq 0 >
		<tr>
			<cfset displaycateg = "jewelry">
			<cfset themeitem = subcat & " jewelry">
			<cfset themedesc = "">
			<cfset themelink = subcatunspaced & "-jewelry.cfm">
			<cfset imagesUsedList= listAppend(imagesUsedList,GetImage.newitem) >
			<cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg">
			<CFINCLUDE TEMPLATE="hubs-stoneitem.cfm">
			<cfset itemcount = 1>
	</cfif>
	---> <cfset displaycateg = lcase(cat)> <!--- End separate item for jewelry ---> <cfset themeitem = Stones.cat> <cfset themedesc = Stones.description> <cfif GetImage.recordcount gt 0  > <!--- Check for duplicate images ---> <cfif listContains(imagesUsedList, GetImage.newitem)> <cfset vItemFound = 0> <cfloop query="GetImage"> <cfif listContains(imagesUsedList, GetImage.newitem) or vItemFound eq 1> <cfelse> <cfset imagesUsedList = listAppend(imagesUsedList,GetImage.newitem)> <cfif categ eq "jewelry"> <cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg"> <cfelse> <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.newitem & ".jpg"> </cfif> <cfset vItemFound = 1> </cfif> </cfloop> <!--- No non duplicates found ---> <cfif vItemFound eq 0> <cfif categ eq "jewelry"> <cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg"> <cfelse> <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.newitem & ".jpg"> </cfif> </cfif> <!--- Was not a duplicate ---> <cfelse> <cfset imagesUsedList= listAppend(imagesUsedList,GetImage.newitem) > <cfif categ eq "jewelry"> <cfset themeimage = "/images/" & GetImage.cat & "/thumb/" & GetImage.newitem & ".jpg"> <cfelse> <cfset themeimage = "/images/" & categ & "/thumb/" & GetImage.newitem & ".jpg"> </cfif> </cfif> <cfif itemcount mod 2 eq 0> <tr> </cfif> <!--- Display a theme ---> <cfset themelink = "/" & #lcase(subcatout)# & "_" & #lcase(cat)# & ".cfm"> <td valign="top"> <CFINCLUDE TEMPLATE="hubs-stoneitem.cfm"> </td> <cfif itemcount mod 2 eq 1> </tr> </cfif> <cfset itemcount = itemcount + 1> </cfif>
	<!---</cfif>   cfif for description check --->
</cfloop>
<cfif itemcount mod 2 eq 0>
	</tr>
</cfif>
