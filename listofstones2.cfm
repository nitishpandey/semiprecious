<!--- can we cache this at the client ? --->

<cfset listb = evaluate("application.#category#stones")>
<cfoutput>
[<a href="##"  onMouseDown="javascript:MM_showHideLayers('#category#sstones','','hide')"><font color="##FF0000">X</font></a>]&nbsp;&nbsp;&nbsp;<span style="text-transform:capitalize;text-align:center;">#category# Collection:
</cfoutput>
<cfset temp = category>
<cfset category = category &"s">
<cfinclude template="searchcolor2.cfm"> 
<cfset category = temp>
<cfoutput>
<a href="/#category#.cfm">All</a>(New First)&nbsp;&nbsp;&nbsp;&nbsp;<a href="/#category#.cfm?sortorder=price">All</a>(Less Costly to More Costly)&nbsp;&nbsp;&nbsp;&nbsp;<a   href='/silver.cfm?category=#category#s'>Sterling Silver</a>&nbsp;&nbsp;
</cfoutput>
<!---
<cfset lista = "">
  <cfloop list="#Listb#" index="listing" >
        <CFIF ListFindNoCase(LISTa,trim(lcase(listing)),",") is 0>
      <CFSET LISTa = ListAppend(Lista,trim(lcase(listing)))></CFIF>
</cfloop>

<CFSET LISTj=LIstSort(Lista, "text")>
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
--->
<cfoutput>

<cfset listj = listb >
	<cfloop list="#Listj#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
<cfset subcat3 = replace(trim(subcat3)," ","")>
	<a   href='/#category#_#subcat3#.cfm' id="#category#s_#subcat2#" >
#subcat2#</a>&nbsp;&nbsp;

		</CFIF>
	</cfloop><br>
<a href="/list.cfm?salestatus=3&category=#category#s" >
<font color="##990000">#category# On Sale</font></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div align="right" style="display:inline;">[<a href="##"  onMouseDown="javascript:MM_showHideLayers('#category#sstones','','hide')"><font color="##FF0000">Close</font></a>]</div> 
  </cfoutput> 


