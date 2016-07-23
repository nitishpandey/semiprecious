
<cfparam name="url.cartid" default="" />
<cfparam name="form.cartid" default="#url.cartid#" />
<cfparam name="url.itemid" default="" />

<cfinclude template="moomenu.cfm" />
<cfif isuserinrole("superadmin") or isuserinrole("admin")>
<cfquery cachedwithin="#createtimespan(1,0,0,0)#" datasource="gemssql" name="sc">
select apptt from users where usertype = 'supplier'
</cfquery>
Supplier code query cached for 1 day!<br /><br />
<table>
		<form method="post" action="">
		<cfif isdefined("form.supcode")>
	<cfquery datasource="gemssql" name="moocheck">
		select optionid from buyingrecord where cartid = #form.cartid# and itemid = #form.itemid#
	</cfquery>
	<cfif moocheck.recordcount is  0>
		<span style="color:red"><cfoutput>#form.cartid# cart with item #form.itemid# does not exist</cfoutput></span>
		<cfelse>
	       <cfif (moocheck.recordcount GT 1 and isdefined("form.optionid")) or moocheck.recordcount is 1 >
		       <cfif moocheck.recordcount is 1>
						<cfquery datasource="gemssql" name="moocheck">
							update buyingrecord set makeondemandnote = '#form.supcode#', inventoryatsale= -1 where cartid = #form.cartid# and itemid = #form.itemid# 
						</cfquery>
							<cfoutput>		                updated for #form.cartid# cart and #form.itemid# item </cfoutput>
				<br />	<cfelse>
						<cfquery datasource="gemssql" name="moocheck">
							update buyingrecord set makeondemandnote = '#form.supcode#', inventoryatsale= -1 where cartid = #form.cartid# and itemid = #form.itemid#       and optionid = #form.optionid#
						</cfquery>				
						<cfoutput>		                updated for #form.cartid# cart and #form.itemid# item  and optionid #form.optionid#</cfoutput>
	       <br />      </cfif>
		    <cfelse>
		    <cfquery name="od" datasource="gemssql">

					   select  DESCRIPTION, optionid	 from options where ITEMID=#itemid# 

			</cfquery><br /><br />
				Need to Select Option too! <br /><cfoutput>
				Cartid: <input type="text" name="cartid" value="#form.cartid#" /><br />
				Itemid: <input type="text" name="itemid" value="#form.itemid#" /><br />
				Supplier: <input type="hidden" name="supcode" value="#form.supcode#" /> #form.supcode#<br />
				Option :  <select name="optionid">
					      
					   <cfoutput query="od">
					      <option value="#optionid#">#description#</option>
					      </cfoutput>
					      </select>
				</select></cfoutput>
				<input type="submit">
		   </cfif>    
		</cfif>	
	

</cfif>
<br /><cfoutput>
  Add or Update supplier for MOO<br />
Cartid: <input type="text" name="cartid" value="#form.cartid#" /><br />
Itemid: <input type="text" name="itemid" value="#url.itemid#" /><br /></cfoutput>
Supplier: <select name="supcode">
	   <cfoutput query="sc">
	      <option value="#apptt#">#apptt#</option>
	      </cfoutput>
	      </select>
</select><br />

<input type="submit">

	</form>		    

</table>
<cfelse>
Please log in with proper privileges.

</cfif>