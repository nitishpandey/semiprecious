<CFPARAM NAME="newitem" DEFAULT="">
<CFPARAM NAME="sku" DEFAULT="">
<CFPARAM NAME="inventory" DEFAULT="">
<cfif session.mail eq 'amanda@silverever.com' or session.mail eq 'nitishpandey@indiatimes.com'>

<cfif inventory neq "">
<CFUPDATE DATASOURCE='gemssql' TABLENAME="Items">

Updated!
<cfabort>
</cfif>

<HTML>
<HEAD>
<TITLE>Editing Pippin Details</TITLE>
<META name="description" content="">
<META name="keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></HEAD>

<BODY  TEXT="#6633CC" LINK="#000000" VLINK="#800080" style="padding:10px;border:thin dotted #CC6600;color:#996666;">
<h4>Semiprecious.com Pippin Administration___________________________________________</h4>
<h3> Edit Item Details</h3>

<CFIF sku eq "">
<FORM name="edititem" action="amandabass.cfm" method="get">

SKU: <INPUT TYPE="text" NAME="sku" VALUE="">


<INPUT TYPE="SUBMIT" VALUE="UPDATE" >
</FORM>
</body>
</html>
<CFABORT />

</CFIF>

 <CFINCLUDE TEMPLATE="setup.cfm">

<CFQUERY DATASOURCE="gemssql" NAME="EditItem">
SELECT newitem, storage,clustercount,saleprice,storage,CAT,lastbought, thumblink,subcat,size, NameID, price,totalqtysold, wholesaleprice,basecost, Description, weight,   shipping, inventory, color, status, REORDER from Items where (internalnote='#sku#') and storage='pippin'</CFQUERY>

Details for Item#: <CFOUTPUT>#newitem# </cfoutput>
<cfform  action="amandabass.cfm?cat=#edititem.cat#&sku=#sku#" method="post">
<CFOUTPUT>
<br>
  TotQtysold: #edititem.totalqtysold# , Last sold on : {#dateformat(EditItem.lastbought,'mm/dd/yy')#}. <br>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr><td>
</td><td>

Status :<Select NAME="status">
    <option <CFIF #editItem.status# is 0>selected</cfif> value="0">Active</option>
    <option value="1" <CFIF #editItem.status# is 1>selected</cfif> >Inactive</option>
    <option value="2"  <CFIF #editItem.status# is 2>selected</cfif>>Discontinued</option>
    <option  <CFIF #editItem.status# is 3>selected</cfif> value="3">On 
    Sale</option>
    <option <CFIF #editItem.status# is 4>selected</cfif> value="4">Free</option>
    <option <CFIF #editItem.status# is 5>selected</cfif> value="5">No 
    Picture</option>
    <option <CFIF #editItem.status# is 6>selected</cfif> value="6">Bad 
    Picture</option>
  </select> 
<cfoutput>#editItem.status#</cfoutput>,   
</td>

</tr>
<tr>
        <td>  Wt :  <cfINPUT TYPE="text" SIZE="10" NAME="weight" VALUE="#EditItem.weight#" required="no">
		Cat: 	<cfif isdefined("url.cat")>
		   <cfINPUT TYPE="text" SIZE="10" NAME="CAT" VALUE="#url.CAT#" required="yes">
 <cfelse>   <cfINPUT TYPE="text" SIZE="10" NAME="CAT" VALUE="#EditItem.CAT#" required="yes">
 		</cfif>
    &nbsp; Sub-cat:  <cfINPUT TYPE="text" SIZE="10" NAME="subcat" VALUE="#EditItem.subCAT#" required="yes" style="display:inline;">
    <img src="#edititem.thumblink#" height="200" > &nbsp;</td>
        <td>Price: Reg:$
<cfINPUT required="yes" TYPE="text" SIZE="5" NAME="price" VALUE="#left(EditItem.price,5)#">&nbsp;
&nbsp;Sale: $<INPUT TYPE="text" SIZE="5" NAME="Saleprice" VALUE="#left(EditItem.saleprice,5)#</CFOUTPUT>">&nbsp;
Cost: Rs<INPUT TYPE="text" SIZE="5" NAME="BaseCost" VALUE="<CFOUTPUT>#left(EditItem.BaseCost,5)#</CFOUTPUT>">&nbsp;
<INPUT TYPE="hidden" SIZE="5" NAME="newitem" VALUE="<CFOUTPUT>#editItem.newitem#</CFOUTPUT>">
<br>
WholeSale : $<INPUT TYPE="text" SIZE="5" NAME="WholeSalePrice" VALUE="<CFOUTPUT>#left(EditItem.WholeSalePrice,5)#</CFOUTPUT>">&nbsp;
In Stock:<INPUT TYPE="text" SIZE="3" NAME="inventory" VALUE="<CFOUTPUT>#EditItem.inventory#"><br>
Descr:
<textarea cols="40" rows="3" name="description"  wrap="virtual">#EditItem.Description#</textarea><br>
        Size: <input type="text" name="size" value="#edititem.size#"> &nbsp;

Color:<INPUT TYPE="text" SIZE="10" NAME="color" VALUE="#EditItem.color#">
<br>
</CFOUTPUT> </td>
      </tr>
	  
    </table>
<INPUT TYPE="SUBMIT" VALUE="UPDATE" >
 
</cfFORM>



<b>List of current sub-categories:</b><CFOUTPUT >#lcase(application.alltones)#

</cfoutput>

</cfif>

</BODY>
</HTML>
