<cftry>
<cfhttp url="http://www.jewelryadvertise.com/index.php?inl_theme=discuss" method="get" resolveurl="yes" timeout="4">
</cfhttp>
<cfoutput>#replace(cfhttp.FileContent,'../../','','All')#</cfoutput>
<cfcatch type="any">
    Visit Home <a href="http://www.semiprecious.com">!</a> 
  </cfcatch>
</cftry>