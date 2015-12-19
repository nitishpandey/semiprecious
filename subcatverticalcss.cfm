<cfparam default="" name="category">
<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
<cfif category eq "" or category eq "ALL">
    <tr class="leftstonelist">
<td class="leftstonelist">
<cfoutput>
<a  href='silver.cfm?category=#category#' id="silver">Sterling Silver</a></cfoutput></td>
</tr>
<!---
<cfif not isdefined("Application.listj")>
<cfset listj = "">
<cfset LISTb = Application.allstones >
<cfloop list="#Listb#" index="listing" >
<CFIF ListFindNoCase(listj,trim(lcase(listing)),",") is 0>
<CFSET listj = listappend(listj,trim(lcase(listing)))></CFIF>
</cfloop>
<CFSET listj=LIstSort(listj, "text")>
<cfset application.listj = listj>
</cfif> --->
<cfoutput>
	<cfloop list="#application.allstones#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
    <cfset subcat3 = replace(trim(subcat3)," ","")>
		<tr class="leftstonelist">
		<td class="leftstonelist">
		<a   href='#subcat3#.cfm' id="#subcat2#" >
#subcat2#</a>
		</td>
        </tr>
		</CFIF>
	</cfloop>
	</cfoutput><!-- <tr class="leftstonelist"><td>&nbsp;</td>         
</tr> -->
<tr class="leftstonelist">
<td class="leftstonelist">
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">Clearance</a></cfoutput></td>            
     
</tr>
 	
<cfelse>
<!---
<cfswitch expression="#category#">
<cfcase value="necklaces">
<cfif isdefined("application.necklaceslistj")>
<cfset listj = application.necklaceslistj>
</cfif>
</cfcase>
<cfcase value="bracelets">
<cfif isdefined("application.braceletslistj")>
<cfset listj = application.braceletslistj>
</cfif>
</cfcase>
<cfcase value="pendants">
<cfif isdefined("application.pendantslistj")>
<cfset listj = application.pendantslistj>
</cfif>
</cfcase>
<cfcase value="earrings">
<cfif isdefined("application.earringslistj")>
<cfset listj = application.earringslistj>
</cfif>
</cfcase>
</cfswitch> --->
    <tr class="leftstonelist"><td class="leftstonelist">
<cfoutput><a  href='silver.cfm?category=#category#'>Sterling Silver</a></cfoutput></td>       
</tr>
<!---
<cfif not isdefined("listj")>
<cfset listj = "">
<cfset listb = evaluate("application.#category#tones")>
<cfloop list=#Listb# index="listing" >
<CFIF ListFindNoCase(listj,trim(lcase(listing)),",") is 0>
<CFSET listj = listappend(listj,trim(lcase(listing)))>
</CFIF>
</cfloop>

<CFSET listj=LIstSort(listj, "text")>
<cfswitch expression="#category#">
<cfcase value="necklaces">
<cfset  application.necklaceslistj = listj></cfcase>
<cfcase value="bracelets">
<cfset  application.braceletslistj = listj ></cfcase>
<cfcase value="pendants">
<cfset  application.pendantslistj = listj ></cfcase>
<cfcase value="earrings">
<cfset application.earringslistj = listj >
</cfcase>
</cfswitch>
</cfif> --->
<cfoutput>
<cfset listj = evaluate("application.#category#tones")>

	<cfloop list="#listj#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
    <cfset subcat3 = replace(trim(subcat3)," ","")>
	<tr class="leftstonelist">
	<td class="leftstonelist">
	<a  href='#category#_#subcat3#.cfm' id="#subcat2#" >#subcat2#</a>
		</td>           
</tr>
</CFIF>
	</cfloop></cfoutput>
<tr class="leftstonelist"><td class="leftstonelist">
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">On Sale</a></cfoutput></td>   
</tr>



</cfif>

