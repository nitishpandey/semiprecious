<cfif isdefined("cookie.screenwidth") and (session.screenwidth eq 833)>
<!-- cookie screen defined ; initiallized t0 833 -->
<cfif isNumeric(cookie.screenwidth)>
  <cfif session.screenwidth neq cookie.screenwidth>
  <!-- session screen width defined -->
    <cfset session.screenwidth = cookie.screenwidth>  <!--- thus this area wont be entered again --->
	  <cfquery  datasource="semiprecious" >
      update properties set pvalue = pvalue + 1 where pname = 'todvisits' 
      </cfquery>
	  </cfif>
	  </cfif>
  <cfelse>
  <script>
writeCookie("screenwidth",screen.availWidth,4);
</script>
</cfif>
<!----
<cfif isdefined("cookie.navver")>
<cfif cookie.navver eq 3>
	  <cfquery  datasource="semiprecious" >
      update properties set pvalue = pvalue + 1 where pname = 'navver3' 
      </cfquery>

<cfelse>
	  <cfquery  datasource="semiprecious" >
      update properties set pvalue = pvalue + 1 where pname = 'navver4' 
      </cfquery>
</cfif>
</cfif> 
	
	 <cfquery datasource="semiprecious" name="lv">
	  select pvalue from properties where pname = 'widthundefin'
	  </cfquery>
	     <cfquery datasource="semiprecious" >
      update properties set pvalue = #now()# where pname = 'widthundefin' 
      </cfquery>
	   <cfquery datasource="semiprecious" >
      update properties set pvalue = '#lv.pvalue#' where pname = 'lastvisit' 
      </cfquery> ---> 
 <!---   <cfquery datasource="semiprecious" name="ret" >
    select * from properties where pname = 'width#cookie.screenwidth#' 
    </cfquery>
	  <cfif ret.recordcount>
	<!-- pname found 
      <cfquery datasource="semiprecious" >
      update properties set pvalue = pvalue + 1 where pname = 'width#cookie.screenwidth#' 
      </cfquery>
      <cfelse>
	  <!-- pname not found -->
      <cfquery datasource="semiprecious" >
      insert into properties (pname,pvalue) values ('width#cookie.screenwidth#',1) 
      </cfquery>
    </cfif> ---> 
  
