<Cfparam   name="url.controlvariable" default='index' />

<cfif isdefined("form.cv") >
     <Cfset form.controlvariable = form.cv  />
	   <cfelseif isdefined("url.cv") >
  <Cfset url.controlvariable = url.cv />
</cfif>
<cfif isdefined("form.controlvariable")>
<cfinvoke component="switch" argumentcollection="#form#" method="action" />
<cfelse>
<cfinvoke component="switch" argumentcollection="#url#" method="action" />
</cfif>
