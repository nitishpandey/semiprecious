<cfinclude template="moomenu.cfm" />
<cfquery datasource="gemssql" name="sc">
select aptt from users where usertype = 'supplier'
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
		                updated for #form.cartid# cart and #form.itemid# item 
				<cfelse>
						<cfquery datasource="gemssql" name="moocheck">
							update buyingrecord set makeondemandnote = '#form.supcode#', inventoryatsale= -1 where cartid = #form.cartid# and itemid = #form.itemid#                and #form.itemid# item 
						</cfquery>				
		                updated for #form.cartid# cart and #form.itemid# item  and optionid #form.optionid#
	             </cfif>
		    <cfelse>
		    <cfquery name="od" datasource="gemssql">

					   select  DESCRIPTION, optionid	 from options where ITEMID=#itemid# 

			</cfquery>
				
				Cartid: <input type="text" name="cartid" value="#form.cartid#" />
				Itemid: <input type="text" name="itemid" value="#form.itemid#" />
				Supplier: <input type="hidden" name="supcode" value="#form.supcode#" /> #form.supcode#
				Option :  <select name="optionid">
					   <cfoutput query="od">
					      <option value="#optionid#">#description#</option>
					      </cfoutput>
					      </select>
				</select>
				<input type="submit">
		   </cfif>    
		</cfif>	
	
<cfelse>
Cartid: <input type="text" name="cartid" />
Itemid: <input type="text" name="itemid" />
Supplier: <select name="supcode">
	   <cfoutput query="sc">
	      <option value="#appt#">#aptt#</option>
	      </cfoutput>
	      </select>
</select>

<input type="submit">

</cfif>

	</form>		    

</table>