<cfparam default="" name="category">
<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
<cfif category eq "" or category eq "ALL">
<cfset LISTb = Application.allstones >
<table width="92" border="0" cellpadding="0" cellspacing="0">
<tr class="leftstonelist"><td class="leftstonelist">
<cfoutput><a  class='leftstonelist' href='silver.cfm?category=#category#' id="silver">Sterling Silver</a></cfoutput></td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>
<cfset lista = "">
<cfloop list=#Listb# index="listing" >
<CFIF ListFindNoCase(LISTa,trim(lcase(listing)),",") is 0>
<CFSET LISTa = ListAppend(Lista,trim(lcase(listing)))></CFIF>
</cfloop>

<CFSET LISTa=LIstSort(Lista, "text")>
<cfoutput>	<cfloop list="#Lista#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
<cfset subcat3 = replace(trim(subcat3)," ","")>

		<tr class="leftstonelist">
		<td class="leftstonelist">
	<a  class='leftstonelist' href='#subcat3#.cfm' id="#subcat2#" >
#subcat2#</a>
		</td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>

		</CFIF>
	</cfloop></cfoutput><tr class="leftstonelist"><td>&nbsp;</td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>
<tr class="leftstonelist"><td>
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">on Sale</a></cfoutput></td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>
 </table>
 
 	
<cfelse>
<cfset listb = evaluate("application.#category#tones")>
<table width="92" border="0" cellpadding="0" cellspacing="0">
<tr class="leftstonelist"><td class="leftstonelist">
<cfoutput><a  class='leftstonelist' href='silver.cfm?category=#category#'>Sterling Silver</a></cfoutput></td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>
<cfset lista = "">
<cfloop list=#Listb# index="listing" >
<CFIF ListFindNoCase(LISTa,trim(lcase(listing)),",") is 0>
<CFSET LISTa = ListAppend(Lista,trim(lcase(listing)))></CFIF>
</cfloop>

<CFSET LISTa=LIstSort(Lista, "text")>
<cfoutput>	<cfloop list="#Lista#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
<cfset subcat3 = replace(trim(subcat3)," ","")>

	
	<tr class="leftstonelist"><td class="leftstonelist">
	<a  class='leftstonelist' href='#category#_#subcat3#.cfm' id="#subcat2#" >
#subcat2#</a>
		</td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>

		</CFIF>
	</cfloop></cfoutput><tr class="leftstonelist"><td>&nbsp;</td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>
<tr class="leftstonelist"><td>
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">on Sale</a></cfoutput></td><td><img src="images/lightgreenrightroundedend.gif" border="0" vspace="0" height="14" hspace="0" align="absmiddle" ></td></tr>
 </table>
 

</cfif>

