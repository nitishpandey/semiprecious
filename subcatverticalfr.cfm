<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
	<CFQUERY datasource="semiprecious" NAME="getsubcat">
Select distinct subcat from items where (<cfif category neq "" and category neq "ALL">cat = '#category#'<cfelse> (cat = 'NECKLACES' OR CAT ='bRACELETS' OR CAT ='BRACELETS' OR CAT ='EARRINGS' OR CAT ='pENDANTS' )</cfif>and not ((status=1) or (status=2) or (status=5)) and inventory>0)
</cfquery>
<CFSET LISTA=ValueList(getsubcat.subcat,",")>
<CFSET LISTB=trim(lcase(ListFirst(LISTA)))>
<table width="112" border="0" cellpadding="0" cellspacing="0">
<tr class="leftstonelist"><td>
<a  class='leftstonelist' href='silver.cfm<cfif category eq "pendants">?category=pendants
	<cfelseif category eq "bracelets">?category=bracelets
	<cfelseif category eq "earrings">?category=earrings
	<cfelseif category eq "sets">?category=sets
	<cfelseif category eq "necklaces">?category=necklaces
	</cfif>'>Sterling Silver</a></td></tr>

<cfloop list=#ListA# index="listing" >
<CFIF ListFindNoCase(LISTB,trim(lcase(listing)),",") is 0>
<CFSET LISTB = ListAppend(ListB,trim(lcase(listing)))></CFIF>
</cfloop>

<CFSET LISTB=LIstSort(ListB, "text")>
	<cfloop list="#ListB#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<tr class="leftstonelist"><td>
	<a  class='leftstonelist' href='<cfoutput>#replace(trim(subcat2)," ","")#</cfoutput>.cfm
	<cfif category eq "pendants">?category=pendants
	<cfelseif category eq "bracelets">?category=bracelets
	<cfelseif category eq "earrings">?category=earrings
	<cfelseif category eq "sets">?category=sets
	<cfelseif category eq "necklaces">?category=necklaces
	</cfif>'>
<cfoutput>#Ucase(Left(subcat2,1))##right(subcat2,len(subcat2)-1)#</cfoutput></a>
		</td></tr></CFIF>
	</cfloop>
<tr><td>
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">#category# on Sale</a></cfoutput></td></tr>
 </table>