<cfif nextshipdate neq "" and ('#Dateformat(stopshipdate,"mm/dd/yy")#' GT '#Dateformat(now(),"mm/dd/yy")#' and '#Dateformat(nextshipdate,"mm/dd/yy")#' GT '#Dateformat(now(),"mm/dd/yy")#') >	
<br />
<font color=red>
Non beads, non designer items ordered after <cfoutput>#stopshipdate#</cfoutput> will be 
shipped on <cfoutput>#nextshipdate#.</cfoutput>.
</font>
</cfif>
