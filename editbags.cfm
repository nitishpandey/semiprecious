<cfparam name=groupdel default="">
<cfparam name=grouping default="">

<CFPARAM NAME="newitem" DEFAULT="">
<cfif session.mail eq 'acemat@vsnl.com' or session.mail is 'anup@semiprecious.com'>

<cfif groupdel neq "">
<cfset newitem=groupdel>
<cfquery name=x datasource="gemssql">
delete from itemsbygroup where itemid = #groupdel# and groupname='#grouping#'</cfquery>
</cfif>

<HTML>
<HEAD>


<TITLE>Editing Item Details</TITLE>
<META name="description" content="">
<META name="keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script LANGUAGE=JAVASCRIPT>
<!--
function calcprices()
{

document.form.wholesaleprice.value=document.form.basecost*1.5;
	
	}
//-->
</script>
</HEAD>

<BODY  TEXT="#6633CC" LINK="#000000" VLINK="#800080" style="padding:10px;border:thin dotted #CC6600;color:#996666;">
<h2>Semiprecious.com Administration___________________________________________</h2>
<h3> Edit Item Details</h3>

<CFIF newitem eq "">
<FORM name="edititem" action="edititem.cfm" method="get">

ImageID: <INPUT TYPE="text" NAME="newitem" VALUE="">


</FORM>
</body>
</html>
<CFABORT />

</CFIF>

 <CFINCLUDE TEMPLATE="setup.cfm">

<CFQUERY DATASOURCE="gemssql" NAME="EditItem">
SELECT clustercount,saleprice,disporder,storage,CAT,LASTBOUGHT , dimensions, rate, supplier,subcat,subcat2,subcat3,style,size, NameID, price,totalqtysold, wholesaleprice,basecost, Description, weight,   shipping, inventory, color, status, REORDER,internalnote, morepics from Items where newitem=#newitem#
</CFQUERY>
<CFQUERY DATASOURCE="gemssql" NAME="groupassigned">
Select GroupName from itemsbygroup where itemid = #newitem#
</CFQUERY>

Details for Item#: <CFOUTPUT>#newitem# <a href="edititem.cfm?newitem=#evaluate(newitem + 1)#">Edit Next</a> <a href="admin.cfm">admin</a> &nbsp;<a href="cartstatus21.cfm">Carts</a><a href="edititem.cfm?newitem=#evaluate(newitem - 1)#">Edit Prev</a> </cfoutput>

  <CFQUERY datasource="gemssql" name="stonelist">
  Select distinct stone from ltbStones where cat='<cfoutput>#edititem.cat#</cfoutput>' order by stone
  </cfquery>

  <cfquery  datasource="gemssql" name="groups">
  Select GroupName from Groupings where cat='<cfoutput>#edititem.cat#</cfoutput>' order by GroupName
  </cfquery>
  
<cfform  action="updatebags.cfm?cat=#edititem.cat#&newitem=#newitem#" method="post">


<CFOUTPUT>


<br>
  TotQtysold: #edititem.totalqtysold# , Last sold on : {#dateformat(EditItem.lastbought,'mm/dd/yy')#}. <br>

Clustercount : #edititem.clustercount# indicates This is a member of  a <cfswitch expression="#edititem.clustercount#"><cfcase value="0">No cluster.  This is not a healthy sign.</cfcase><cfcase value="1">A lookalike gang</cfcase><cfcase value="2">At least one set of various category</cfcase><cfcase value="3">At least one design cluster and at least one set cluster</cfcase></cfswitch>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr><td>(Over)write  Item No:<cfif isdefined("url.olditem")>
<cfINPUT required="yes" TYPE="hidden" NAME="newitem" VALUE="#olditem#">
<cfelse>
<cfINPUT required="yes" TYPE="hidden" NAME="newitem" VALUE="#newitem#">
</cfif>

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
<cfoutput>#editItem.status#</cfoutput>,    <INPUT TYPE="hidden" NAME="NameID" VALUE="#EditItem.NameID#" size="5">

</td>

</tr>
<tr>
        <td>  Wt :  <cfINPUT TYPE="text" SIZE="10" NAME="weight" VALUE="#EditItem.weight#" required="no">, 
        rate:  <cfINPUT TYPE="text" SIZE="10" NAME="rate" VALUE="#EditItem.rate#" required="no">Rs/gm
		Cat: 	<cfif isdefined("url.cat")>
		   <cfINPUT TYPE="text" SIZE="10" NAME="CAT" VALUE="#url.CAT#" required="yes">
 <cfelse>   <cfINPUT TYPE="text" SIZE="10" NAME="CAT" VALUE="#EditItem.CAT#" required="yes">
 		</cfif>
    <img src="/images/#edititem.cat#/#newitem#.jpg" height="200" > &nbsp;</td>
        <td>Price: Reg:$
<cfINPUT required="yes" TYPE="text" SIZE="5" NAME="price" VALUE="#left(EditItem.price,5)#">&nbsp;
&nbsp;Sale: $<INPUT TYPE="text" SIZE="5" NAME="Saleprice" VALUE="#left(EditItem.saleprice,5)#</CFOUTPUT>">&nbsp;
Cost: Rs<INPUT TYPE="text" SIZE="5" NAME="basecost" VALUE="<CFOUTPUT>#left(EditItem.BaseCost,5)#</CFOUTPUT>">&nbsp;
<br>
WholeSale : $<INPUT TYPE="text" SIZE="5" NAME="Wholesaleprice" VALUE="<CFOUTPUT>#left(EditItem.WholeSalePrice,5)#</CFOUTPUT>">&nbsp;
In Stock:<INPUT TYPE="text" SIZE="3" NAME="inventory" VALUE="<CFOUTPUT>#EditItem.inventory#">; display:<INPUT TYPE="text" SIZE="2" NAME="disporder" VALUE="#EditItem.disporder#"><br>
Descr:
<textarea cols="40" rows="3" name="description"  wrap="virtual">#EditItem.Description#</textarea><br>
        Size: <input type="text" name="size" value="#edititem.size#"> &nbsp;Shipping: 
        <INPUT TYPE="text" SIZE="3" NAME="shipping" VALUE="#left(EditItem.shipping,4)#">
Color:<INPUT TYPE="text" SIZE="10" NAME="color" VALUE="#EditItem.color#">
<br>
Storage:<input type="text" size="12" name="storage" value="#Edititem.storage#">
re-order?:<INPUT TYPE="text" SIZE="5" NAME="reorder" VALUE="#EditItem.reorder#">
Supplier:<INPUT TYPE="text" SIZE="10" NAME="supplier" VALUE="#EditItem.supplier#">
Extra images:<INPUT TYPE="text" SIZE="1" NAME="morepics" VALUE="#EditItem.morepics#">&nbsp; Dimensions:<INPUT TYPE="text" SIZE="25" NAME="dimensions" VALUE="#EditItem.dimensions#"><br>
<br>Note:<INPUT TYPE="text" SIZE="50" NAME="internalnote" VALUE="#EditItem.internalNote#"><br>
</cfoutput>
Current Group(s): <font color=blue><cfoutput query="groupassigned">#Groupname# <a href='edititem.cfm?grouping=#groupname#&groupdel=#newitem#'>X</a>,</cfoutput></font>
Group Item in (submit multiple times to assign to more groups):
<Select NAME="grouping">
<option value=<cfoutput>#groupassigned.GroupName# selected>#groupassigned.GroupName#</cfoutput></option>
<cfoutput query="groups">
   <option value=#groupname#>#groupname#</option>
</cfoutput>    
    </select> 
<cfoutput>
<br><span style="border:2px dashed white;width:280px;display:block;hieght:50px;background-color:##DDDDDD">
<a href="np/match/cluster.cfm?list=0&target=#newitem#&category=#edititem.cat#">Add to Clusters</a> <a href="np/match/cluster.cfm?list=007&itemid=#newitem#">#edititem.clustercount# </a>&nbsp;
      <br>
  <a href="options/optionsoptions.cfm?itemid=#newitem#">Work 
        On Options</a><a href="whensold.cfm?newitem=#newitem#"> When all sold?</a></span></CFOUTPUT> </td>
      </tr>
	  <tr><td colspan="3">      
	  	  Stone1: 
       <Select NAME="subcat">
	           <option value="<cfoutput>#EditItem.subCAT#</cfoutput>" selected ><cfoutput>#EditItem.subCAT#</cfoutput></option>
	   <cfloop query="stonelist">
	   <cfoutput>
        <option value="#Stone#"  >#Stone#</option>
		</cfoutput>
		</cfloop>		<option>wood</option>
      </select>
	        Stone2: 
       <Select NAME="subcat2">
        <option value="<cfoutput>#EditItem.subCAT2#</cfoutput>" selected ><cfoutput>#EditItem.subCAT2#</cfoutput></option>
	   <cfloop query="stonelist">
       <cfoutput> <option value="#Stone#"  >#Stone#</option></cfoutput>
		</cfloop>
      </select>
      <br>Stone3: 
       <Select NAME="subcat3">
	           <option value="<cfoutput>#EditItem.subCAT3#</cfoutput>"  selected><cfoutput>#EditItem.subCAT3#</cfoutput></option>
	   <cfloop query="stonelist">
       <cfoutput> <option value="#Stone#" >#Stone#</option></cfoutput>
		</cfloop>
		<option>wood</option>
      </select>
	  
	  <br>Style: 
       <Select NAME="style">
	   	           <option value=<cfoutput>"#edititem.style#"</cfoutput>  selected><cfoutput>#edititem.style#</cfoutput></option>
	           <option value="Messenger College"  >Messenger College</option>
        <option value="Messenger Vegas" >Messenger Vegas</option>
			<option value="Business" >Business</option>
		<option value="Stylish" >Stylish</option>
		<option value="Classic">Classic</option>
		<option value="Leather Lace" >Leather Lace</option>
		<option value="Back Packs" >Back Packs</option>
		

      </select>
 </td></tr>
	  
    </table>

<INPUT TYPE="SUBMIT" VALUE="UPDATE" >
  [Read carefully: If this number is changed then, the newnumber.jpg is removed 
  and copied to the oldnumber.jpg. You must then specify the correct cat of newnumber 
  item on top. Or all will fail. The new category will be the newitems. Thus you 
  can replace image or use an old number for totally new item. If you want to 
  just change the category, just change that simple, the images will be moved.] 

<input type='button' onClick="javascript:calcprices()">

</cfFORM>


</cfif>
Last inventory update: <cfoutput>#edititem.lastbought#</cfoutput>

</BODY>
</HTML>
