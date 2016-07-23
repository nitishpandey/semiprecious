<cfparam name="category" default="jewelry" />
 <cfsavecontent variable="price_color_filter"><cfoutput>
<form style="display:inline;" method="get" action=""> <span style="color:##ff8040">see #category#</span>  <span style="color:##80ff40">in color:</span><select name="color" onchange="javascript:this.form.submit();">
<option value="">&nbsp;</option>

	<cfloop list="#application.color_list#" index="c">
	<option value="#c#">#c#</option>
	</cfloop>
</select> 
<input type="hidden" value="#pricegreater#" name="pricegreater" />
<input type="hidden" value="#priceless#" name="priceless" />
<input type="hidden" value="#category#" name="category" />

</form></cfoutput>
</cfsavecontent>
