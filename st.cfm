<cfparam default="" name="category">
<CFIF category eq "">
<CFSET category2='necklaces'>
</CFIF>
<cfif category eq "" or category eq "ALL">
  <table width="90" border="0" cellpadding="0" cellspacing="0"  background="/images/hzgreen.png"  >
    <tr class="promos">
<td style="border-top:2px groove #CCCCCC;padding-left:1px;padding-top:2px;padding-bottom:0px;">
<cfoutput><a  href='silver.cfm?category=#category#' id="silver">Sterling Silver</a></cfoutput>
</td></tr>
<cfoutput>
	<cfloop list="#application.allstones#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<tr>
	<td style="padding-left:1px;padding-top:2px;padding-bottom:0px;">
	 <cfset subcat3 = replace(trim(subcat2),"_","")>
     <cfset subcat3 = replace(trim(subcat3)," ","")>
		<a   href='#subcat3#.cfm' id="#subcat2#" >#subcat2#</a>
	</td>
	</tr>
		
		</CFIF>
	</cfloop>
	</cfoutput><!-- <tr class="promos"><td>&nbsp;</td></tr> -->
<tr><td style="padding-left:1px;padding-top:2px;padding-bottom:0px;"><cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">Clearance</a></cfoutput></td></tr>
 </table>
 
 	
<cfelse>

  <table width="90" border="0" cellpadding="0" cellspacing="0" background="/images/hzgreen.png" class="promos">
    <tr class="promos"><td style="border-top:2px groove #CCCCCC;border-right:2px groove #CCCCCC;padding-left:1px;padding-top:2px;padding-bottom:0px;">
<cfoutput><a  href='silver.cfm?category=#category#' >Sterling Silver</a></cfoutput></td></tr>

<cfoutput>
<cfset listj = evaluate("application.#category#tones")>

	<cfloop list="#listj#" index="subcat2" delimiters=",">
	<CFIF subcat2 neq "">
	<cfset subcat3 = replace(trim(subcat2),"_","")>
    <cfset subcat3 = replace(trim(subcat3)," ","")>
<tr><td style="padding-left:1px;padding-top:2px;padding-bottom:0px;">
	<a  href='#category#_#subcat3#.cfm' id="#subcat2#" >#subcat2#</a>
		</td></tr>
</CFIF>
	</cfloop></cfoutput>
<tr><td style="padding-left:1px;padding-top:2px;padding-bottom:0px;">
<cfoutput><a href="list.cfm?salestatus=3&category=#category#" class="whiteonred">On Sale</a></cfoutput></td>   
</tr>
 </table>


</cfif>

