<cfif thistag.executionmode is 'start' ><cfif Attributes.option>
<cfquery datasource="gemssql" name="opts">
                  select description, optionid, valueadd, inventory from options where itemid = #Attributes.newitem#  and optionid= #Attributes.option#
                  </cfquery><cfoutput>#opts.description#, (#opts.inventory#)</cfoutput> </cfif></cfif> 