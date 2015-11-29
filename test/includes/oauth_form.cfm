<cfif thisTag.ExecutionMode is 'END'>
<cfset l = aTTributes.list>
<cfset l = listsort(l,'textnocase')>	
	<FORM method="post" ACTION="/INVITE.CFM">
	 	
	<div style="float:left;width:100px;margin-top:20px;margin-left:20px;">
		<a href="/invite.cfm" class="side_link">Click Here To Go Back To Invite Form</a></div>
	<table style="display:table;"><thead>	<th align="center" style="width:290px;">Friend's Email Id</th><th>Invite?</th></thead>
</table>
<cfoutput>	<table style="display:block;margin-top:4px;border:1px black solid;width:400px;height:300px;overflow-y:scroll;overflow-x:none;">
	<tbody style="margin-top:4px;border:1px black solid;height:400px;overflow-x:none;overflow-y:none;width:400px;">
	<cfloop from=1 to="#listlen(l)#" index=j>
	<tr><td align="right" style="width:200px;">
#listgetat(l,j)#</td><td align="left"><input type="checkbox" name="email1" value="#listgetat(l,j)#"></td></tr>	
</cfloop>

</tbody>
</table>
</cfoutput>
	<input type="hidden" name="invitation" />
	<input type="hidden" name="referral_credit" value="5" />
<table style='display:table;width:400px;text-align:center;'>
<tr align="center"><td><input class="green_bg" type="reset" ></td><td><input class="green_bg" type="submit" value="Invite"></td></tr>
</table>
</form>
</cfif>