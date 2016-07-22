<cftry>
 

<cfif not isuserinrole("superadmin")>
Not enough privileges.
<cfabort />
</cfif>
<cfsavecontent variable="inheader">
<script LANGUAGE=JAVASCRIPT>
<!--

vCurrentBase= 1;
vExchangeRate = 45;
function multiplier(multi)
{
   vCurrentMultiplier = multi;
   if (multi==2)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 2).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 1.5).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
   if (multi==3)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 3).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 1.7 ).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
   if (multi==4)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 4).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 2).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
   if (multi==5)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 5).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 2.3).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
   if (multi==6)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 6).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 2.5).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
	 if (multi==7)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 7).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 2.7).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
	 if (multi==8)
   {
   vBase = document.CFForm_1.basecost.value / vExchangeRate;
   document.CFForm_1.price.value = (vBase * 8).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 3).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * 0.8 ).toFixed(2);
   }
   if (multi==9)
   {
   document.CFForm_1.Saleprice.value =    document.CFForm_1.Wholesaleprice.value;
   }

}

function changeBase(country)
{
   if (country == "in")
   {
       vBase = document.CFForm_1.basecost.value / vExchangeRate;
	  document.getElementById("basecostus").innerHTML = vBase.toFixed(2);
  }

   if (vCurrentBase != 0)
   {
   Ratio =  (vBase)/(vCurrentBase/vExchangeRate);
   document.CFForm_1.price.value = (document.CFForm_1.price.value *  Ratio).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (document.CFForm_1.Wholesaleprice.value * Ratio).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.Saleprice.value * Ratio ).toFixed(2);
   }
   else
   {
   document.CFForm_1.price.value = (vBase * 3 ).toFixed(2);
   document.CFForm_1.Wholesaleprice.value = (vBase * 2).toFixed(2);
   document.CFForm_1.Saleprice.value = (document.CFForm_1.price.value * .7 ).toFixed(2);
   }
   vCurrentBase = document.CFForm_1.basecost.value;
}

function calcprices()
{

document.form.wholesaleprice.value=document.form.basecost*1.5;

	}


function verifyinput()
// Confirm that all required fields are filled.  If so, update, else alert user
{

var badinput = 0;
var baditems = "Please enter a value for:\n";
if (document.getElementById("itemweight").value == "" )
  { badinput = 1; baditems = baditems + "Weight\n" ; }
if (isNaN(document.getElementById("itemweight").value) || document.getElementById("itemweight").value < 0 )
  { badinput = 1; baditems = baditems + "Weight - Please enter a valid number.\n" ; }

if (document.getElementById("itemrate").value == "" )
  { badinput = 1; baditems = baditems + "Rate\n" ; }
if (isNaN(document.getElementById("itemrate").value) || document.getElementById("itemrate").value < 0 )
  { badinput = 1; baditems = baditems + "Rate - Please enter a valid number.\n" ; }

if (document.getElementById("itemcat").value == "" )
  { badinput = 1; baditems = baditems + "Rs/Gm Cat\n" ; }

if (document.getElementById("itemprice").value == "" )
  { badinput = 1; baditems = baditems + "Price: Reg:\n" ; }
if (isNaN(document.getElementById("itemprice").value) || document.getElementById("itemprice").value < 0 )
  { badinput = 1; baditems = baditems + "Price: Reg: - Please enter a valid number.\n" ; }

if (document.getElementById("itemsalesprice").value == "" )
  { badinput = 1; baditems = baditems + "Price: Sale:\n" ; }
if (isNaN(document.getElementById("itemsalesprice").value) || document.getElementById("itemsalesprice").value < 0 )
  { badinput = 1; baditems = baditems + "Price: Sale: - Please enter a valid number.\n" ; }

if (document.getElementById("itembasecost").value == "" )
  { badinput = 1; baditems = baditems + "Cost: Rs\n" ; }
if (isNaN(document.getElementById("itembasecost").value) || document.getElementById("itembasecost").value < 0 )
  { badinput = 1; baditems = baditems + "Cost: Rs - Please enter a valid number.\n" ; }

if (document.getElementById("itemwholesaleprice").value == "" )
  { badinput = 1; baditems = baditems + "WholeSale\n" ; }
if (isNaN(document.getElementById("itemwholesaleprice").value) || document.getElementById("itemwholesaleprice").value < 0 )
  { badinput = 1; baditems = baditems + "itemstorage - Please enter a valid number.\n" ; }

if (document.getElementById("itemsize").value == "" )
  { badinput = 1; baditems = baditems + "Size\n" ; }
if (isNaN(document.getElementById("itemsize").value) || document.getElementById("itemsize").value < 0 )
  { badinput = 1; baditems = baditems + "Size - Please enter a valid number.\n" ; }

  var colorlist = "";
  var selObj = document.CFForm_1.color;
  var colorcount = 0;
	  var i;
	  for (i=0; i<selObj.length; i++) {
		if (selObj[i].checked) {
		  	    colorcount= colorcount + 1;

		  if (colorlist == "")
			{ colorlist = selObj[i].value; }
		  else
			{  colorlist = colorlist + "," + selObj[i].value; }
		}
	  }
		  if (colorcount > 3)
             { badinput = 1; baditems = baditems + "Too many colors selected.\n" ; }
else
{

		if (colorlist == "" )
		  { badinput = 1; baditems = baditems + "Color not selected.\n" ; }
		else
		  { document.CFForm_1.color.value = colorlist; }
    }
if (document.getElementById("itemstorage").value == "" )
  { badinput = 1; baditems = baditems + "Storage\n" ; }
if (document.getElementById("orderonrequest").value == "" )
  { badinput = 1; baditems = baditems + "re-order?\n" ; }

if (document.CFForm_1.faceted.value == "")
  { badinput = 1; baditems = baditems + "Faceted - Check faceted or unfaceted.\n"; }

if (badinput == 0 )
  { document.CFForm_1.submit(); }
else
  { alert(baditems); }

}
//-->
</script>
</cfsavecontent>



<cfinclude template="/header.cfm" />
<cfparam name=groupdel default="">
<cfparam name=session.apptt default="">
<cfparam name=grouping default="">
<cfparam name=grouping2 default="">
<cfparam name=grouping3 default="">
<CFPARAM NAME="newitem" DEFAULT="">
<CFIF newitem eq "" and groupdel eq "">
  <FORM name="" action="" method="get">
ImageID:
    <INPUT TYPE="text" NAME="newitem" VALUE="">
  </FORM>

  <cfelse>
<CFINCLUDE TEMPLATE="/setup.cfm">
<CFQUERY DATASOURCE="gemssql" NAME="EditItem">
    SELECT nameid, 'Not Found' as storageindia,  'Not Found'  as material, 0  as  inventoryindia, datetaken, g2i,orderonrequest, morepics, cwt,cwt2, cwt3,clustercount,saleprice,disporder,storage,cat,lastbought , rate, supplier,subcat,subcat2,subcat3,style,size, NameID, price,totalqtysold, wholesaleprice,basecost, Description, weight,   shipping, faceted, inventory, color, status, shape, REORDER,internalnote from Items with (nolock) where newitem=#newitem#

</CFQUERY>
<CFQUERY DATASOURCE="gemssql" NAME="groupassigned">
    Select GroupName from itemsbygroup with (nolock) where itemid = #newitem#
</CFQUERY>

<!--- Changes by ankur --->
<cftry>
<CFQUERY DATASOURCE="gemssql" NAME="qryGetAccess">
    Select	limitedAccess
    from 	users with (nolock)
    where 	apptt = '#session.apptt#'
    And	  	usertype = 'superadmin'
</CFQUERY>
<cfcatch>
<cfset qryGetAccess = querynew("limitedaccess") />
<cfset k = queryaddrow(qrygetAccess) />
<cfset k = querysetCEll(qryGetAccess,"limitedaccess",1,1) />
</cfcatch>
</cftry>


<cfparam name="root" default="#Application.rootfolder#">
<cfif session.apptt neq "">
<cfif groupdel neq "">
  <cfset newitem=groupdel>
  <cfquery name=x datasource="gemssql">
    delete from itemsbygroup where itemid = #groupdel# and groupname='#grouping#'
    </cfquery>
	<cfoutput>delete from itemsbygroup where itemid = #groupdel# and groupname='#urldecode(grouping)#'
    </cfoutput>
<cfset url.newitem = groupdel>
<!--- <cflocation url="http://www.semiprecious.com/edititem.cfm?newitem=#groupdel#" addtoken="no">
 ---></cfif>


<div id="container2" style="margin-top:20px">
Semiprecious.com Administration - Edit Details for Item#: <CFOUTPUT>#newitem# <a href="?newitem=#evaluate(newitem + 1)#">Edit Next</a> <a href="/admin.cfm">go to admin page</a> &nbsp;<a href="/cartstatus21.cfm">Carts</a><a href="?newitem=#evaluate(newitem - 1)#">Edit Prev</a> </cfoutput>
<CFQUERY datasource="gemssql" name="stonelist">
  Select distinct stone from ltbStones with (nolock) order by stone
  </cfquery>
<cfquery  datasource="gemssql" name="groups">
  Select distinct GroupName from Groupings with (nolock) where cat='<cfoutput>#edititem.cat#</cfoutput>'  and manuallydefined=1 order by GroupName
  </cfquery>
    <cfquery name="suppliers" datasource="gemssql" >
	select suppliername from ltbsuppliers with (nolock)
	</cfquery>
<b><font color=green><cfoutput>#session.apptt#</cfoutput> is editing</font></b>
<cfif qryGetAccess.limitedaccess neq '1'>
    <div align="righ                                                 t">
        <a href="limitaccess.cfm">Limit SuperAdmin Access</a></span>
    </div>
</cfif>
<cfform  action="updateitem.cfm?" method="post">
  <CFOUTPUT> <br>
 Existing Cat (change this only if you have created this form byy copying an item from a category that is different from the one you are about to create): <input type="text" value="#edititem.cat#" name="existing_cat" >
 Existing Item (change to move this item from this cat to another): <input type="hidden" value="#newitem#" name="url_newitem" >

    TotQty added to cart: #edititem.totalqtysold# , Last added to cart on : {#dateformat(EditItem.lastbought,'mm/dd/yy')#}. <br>
    Clustercount : #edititem.clustercount# indicates This is a member of  a
    <cfswitch expression="#edititem.clustercount#">
      <cfcase value="0">
      No cluster.  This is not a healthy sign.
      </cfcase>
      <cfcase value="1">
      A lookalike gang
      </cfcase>
      <cfcase value="2">
      At least one set of various category
      </cfcase>
      <cfcase value="3">
      At least one design cluster and at least one set cluster
      </cfcase>
    </cfswitch>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>

        <cfif isdefined("url.olditem")>
          <cfINPUT required="yes" TYPE="hidden" NAME="newitem" VALUE="#olditem#">
          <cfelse>
          <cfINPUT required="yes" TYPE="hidden" NAME="newitem" VALUE="#newitem#">
        </cfif>
TITLE: <cfinput required="yes" name="nameid" value="#edititem.nameid#" size="40">
       Status :
        <Select NAME="status">
          <option <CFIF #editItem.status# is 0>selected</cfif> value="0">Active</option>
          <option value="1" <CFIF #editItem.status# is 1>selected</cfif> >Inactive</option>
       <!---   <cfif session.mail is "acemat@vsnl.com">
            <option value="2"  <CFIF #editItem.status# is 2>selected</cfif>>Delete forever</option>
          </cfif>--->
          <option  <CFIF #editItem.status# is 3>selected</cfif> value="3">On
          Sale</option>
          <option <CFIF #editItem.status# is 4>selected</cfif> value="4">Free</option>
          <option <CFIF #editItem.status# is 5>selected</cfif> value="5">No
          Picture</option>
        </select>
        <cfoutput>#editItem.status#</cfoutput>,

        ------  Picture:
        <Select NAME="g2i">
          <option <CFIF #editItem.g2i# is 0>selected</cfif> value="0">So So</option>
          <option value="1" <CFIF #editItem.g2i# is 1>selected</cfif> >Good</option>
	      <option value="-1" <CFIF #editItem.g2i# is -1>selected</cfif> >Bad</option>
		   <option value="2" <CFIF #editItem.g2i# is 2>selected</cfif> >Awesome</option>
        </select>
      <br> Weight:
      <cfINPUT TYPE="text" SIZE="10" NAME="weight" VALUE="#EditItem.weight#" required="yes" id="itemweight">
      , <br />
      rate:
      <cfINPUT TYPE="text" SIZE="10" NAME="rate" VALUE="#EditItem.rate#" required="no" id="itemrate">
      Rs/gm
      Cat:
      <cfif isdefined("url.cat")>
        <cfINPUT TYPE="text" SIZE="10" NAME="CAT" VALUE="#url.CAT#" required="yes" id="itemcat">
        <cfelse>
        <cfINPUT TYPE="text" SIZE="10" NAME="CAT" VALUE="#EditItem.CAT#" required="yes"  id="itemcat">
      </cfif>Shape:
      <Select NAME="shape">
        <option value="<cfoutput>#EditItem.shape#</cfoutput>"  selected><cfoutput>#EditItem.shape#</cfoutput></option>
        <option value="">None</option>
        <option value="leaf">leaf</option>
        <option value="marquise">Marquise</option>
        <option value="oval">Oval</option>
        <option value="pear">pear</option>
        <option value="round">Round</option>
        <option value="rectangular">Rectangular</option>
        <option value="spherical">Spherical</option>
        <option value="square">Square</option>
      </select>

      Style:
      <Select NAME="style">
        <option value=<cfoutput>"#edititem.style#"</cfoutput>  selected><cfoutput>#edititem.style#</cfoutput></option>
        <option value="Silver Setting"  >Silver Setting</option>
        <option value="Beaded" >Beaded</option>
        <option value="Gold Polish" >Gold Polish</option>
        <option value="Gold Plated" >Gold Plated</option>
	   <option value="White Gold Plated" >White Gold Plated</option>
        <option value="Smooth" >Smooth Cab.</option>
        <option value="Silver Plated" >Silver Plated</option>
				    <option value="Brass" >Brass</option>
    <option value="German Silver" >German Silver</option>
    <option value="Metal Setting" >Other Metal Setting</option>
    <option value="" >None</option>
      </select><br />  Base Metal:
      <Select NAME="material">
        <option value=<cfoutput>"#edititem.material#"</cfoutput>  selected><cfoutput>#edititem.material#</cfoutput></option>
        <option value="925 Sterling Silver"  >925 Sterling Silver</option>
        <option value="925 Sterling Silver"  >Rhodium on 925 Silver</option>
       <option value="German Silver" >German Silver</option>
        <option value="Brass" >Brass</option>
	   <option value="Copper" >Copper</option>
        <option value="White Metal" >White Metal</option>
				        <option value="Gold Polish" >Gold Polish</option>
        <option value="Gold Plated" >Gold Plated</option>
	   <option value="White Gold Plated" >White Gold Plated</option>
	   <option value="" >None</option>
      </select><br>
	Stone1:
      <Select NAME="subcat" >
        <option value="<cfoutput>#EditItem.subCAT#</cfoutput>" selected ><cfoutput>#EditItem.subCAT#</cfoutput></option>
			            <option value="Bulk Lots"  >Bulk Lots</option>
        <cfloop query="stonelist">
          <cfoutput>
            <option value="#Stone#"  >#Stone#</option>

          </cfoutput>
        </cfloop>
        <option>wood</option>
      </select>
     CWT<input type="text" value="#edititem.cwt#" name="cwt"><br /> Stone2:
      <Select NAME="subcat2">
        <option value="">None</option>
        <option value="<cfoutput>#EditItem.subCAT2#</cfoutput>" selected ><cfoutput>#EditItem.subCAT2#</cfoutput></option>
         			            <option value="Bulk Lots"  >Bulk Lots</option>
        <cfloop query="stonelist">
<cfoutput>

            <option value="#Stone#"  >#Stone#</option>
          </cfoutput>
        </cfloop>
      </select>
     CWT<input type="text" value="#edititem.cwt2#" name="cwt2" /><br />      Stone3:
      <Select NAME="subcat3">
        <option value="">None</option>
        <option value="<cfoutput>#EditItem.subCAT3#</cfoutput>"  selected><cfoutput>#EditItem.subCAT3#</cfoutput></option>
        <cfloop query="stonelist">
          <cfoutput>
            <option value="#Stone#" >#Stone#</option>
          </cfoutput>
        </cfloop>
        <option>wood</option>
      </select>
     CWT<input type="text" value="#edititem.cwt3#" name="cwt3">   	    &nbsp;&nbsp;&nbsp;Number of extra images:<select name="morepics">
<option value="0" <cfif edititem.morepics is ""> selected</cfif>>None</option>
  <option value="0" <cfif edititem.morepics is 0> selected</cfif>>None</option>
  <option value="1" <cfif edititem.morepics is 1> selected</cfif>>1</option>
	<option value="2" <cfif edititem.morepics is 2> selected</cfif>>2</option>
	<option value="3" <cfif edititem.morepics is 3> selected</cfif>>3</option>
	</select>


      <img src="/images/#edititem.cat#/#newitem#.jpg" width=200 style="display:inline;" >
			<img src="/images/#edititem.cat#/thumb/#newitem#.jpg" width=50 style="display:inline;" >Descr:
    <textarea cols="40" rows="3" name="description"  wrap="virtual" id="itemdescription">#EditItem.Description#</textarea>
    &nbsp;
<br>	<a href=/admintools/edit-copyitem.cfm?itemid=#newitem#>COPY THIS DATA TO CREATE A NEW ITEM IN SAME CATEGORY</a> || 
<a href=/admintools/edit-copyitem.cfm?itemid=#newitem#&useimage=yes&cat=#edititem.cat#>COPY THIS WITH IMAGE</a>

  <INPUT TYPE="button" VALUE="UPDATE" onClick="javascript:verifyinput()">
  [Read carefully: If this number is changed then, the newnumber.jpg is removed
  and copied to the oldnumber.jpg. You must then specify the correct cat of newnumber
  item on top. Or all will fail. The new category will be for the newitem but with old number retained. Thus you
  can replace image or use an old number for totally new item. If you want to
  just change the category, just change category, the images will be moved between folders.] <a href="videoadd.cfm?itemid=#newitem#">ADD VIDEOID</a>
  <input type='button' onClick="javascript:calcprices()">    <td>
  	<!--- Changes By Ankur --->
  	<span
		<cfif qryGetAccess.limitedaccess eq '1'>
    		style="display:inline"
		<cfelse>
        	style="display:inline"
		</cfif>
    >

    Base Cost (Rs):
<cfif IsUserInRole("superadmin")>
    <INPUT TYPE="text" SIZE="4" NAME="basecost" VALUE="<CFOUTPUT>#Round(EditItem.BaseCost*100)/100#</CFOUTPUT>" id="itembasecost" onChange="javascript:changeBase('in');" />
		<cfelse>
    <INPUT TYPE="hidden" SIZE="" NAME="basecost" VALUE="<CFOUTPUT>#Round(EditItem.BaseCost*100)/100#</CFOUTPUT>" id="itembasecost" onChange="javascript:changeBase('in');" />

</cfif>    &nbsp;&nbsp;&nbsp;<cfoutput>Base Price ($): <span id="basecostus"><CFOUTPUT>#Round((EditItem.BaseCost/45)*100)/100#</CFOUTPUT></span> </cfoutput><br />
    <script language="javascript">
	<!--
	   <cfoutput>
	   vCurrentBase = #EditItem.BaseCost#
	   </cfoutput>
	-->
	</script>
    Multipliers:
    <input type="button" value="2/1.5" onClick="javascript:multiplier(2);" />

    <input type="button" value="3/1.7" onClick="javascript:multiplier(3);" />

    <input type="button" value="4/2" onClick="javascript:multiplier(4);" />

    <input type="button" value="5/2.3" onClick="javascript:multiplier(5);" />
    <input type="button" value="6/2.5" onClick="javascript:multiplier(6);" />

	  <input type="button" value="7/2.7" onClick="javascript:multiplier(7);" />
	  <input type="button" value="8/3" onClick="javascript:multiplier(8);" /><br>
 	  <input type="button" value="CLEARANCE" onClick="javascript:multiplier(9);" />
    <strong>Prices:</strong> Retail:$
    <cfINPUT required="yes" TYPE="text" SIZE="4" NAME="price" VALUE="#round(EditItem.price*100)/100#" id="itemprice">
    &nbsp;
    &nbsp;Sale: $
    <INPUT TYPE="text" SIZE="4" NAME="Saleprice" VALUE="#round(EditItem.saleprice*100)/100#</CFOUTPUT>" id="itemsalesprice">
    &nbsp;

    WholeSale : $
    <INPUT TYPE="text" SIZE="4" NAME="Wholesaleprice" VALUE="<CFOUTPUT>#round(EditItem.WholeSalePrice*100)/100#</CFOUTPUT>" id="itemwholesaleprice">
    </span>
   <br> Stock USA:
    <INPUT TYPE="text" SIZE="2" NAME="inventory" VALUE="<CFOUTPUT>#EditItem.inventory#" id="iteminventory">
Stock India:  <INPUT TYPE="text" SIZE="2" NAME="inventoryindia" VALUE="#EditItem.inventoryindia#" id="iteminventoryindia">
    ; display:
    <INPUT TYPE="text" SIZE="2" NAME="disporder" VALUE="#EditItem.disporder#" id="itemdisporder">
&nbsp;    Size:
    <input type="text" size=2 name="size" value="#edititem.size#" id="itemsize">
    <br>
    Mostly - Faceted:
    <INPUT TYPE="radio" NAME="faceted" value="1" <cfif #edititem.faceted# is "1">  checked="checked"</cfif>>
    / UNFaceted:
    <INPUT TYPE="radio" NAME="faceted" value="0" <cfif #edititem.faceted# is "0">  checked="checked"</cfif>>
    <!--- <INPUT TYPE="text" SIZE="3" NAME="shipping" VALUE="#left(EditItem.shipping,4)#">--->
    <br>
    Color:<br>
    <table cellpadding="0" cellspacing="0">
    <tr><td>
    <input type="checkbox" name="color" value="black" <cfif Edititem.color contains 'black'>checked="checked"</cfif> /> Black
    </td><td>
        <input type="checkbox" name="color" value="blue" <cfif Edititem.color contains 'blue'>checked="checked"</cfif> /> Blue
         </td><td>
    <input type="checkbox" name="color" value="brown" <cfif Edititem.color contains 'brown'>checked="checked"</cfif> /> Brown
		         </td><td>
		    <input type="checkbox" name="color" value="clear" <cfif Edititem.color contains 'clear'>checked="checked"</cfif> /> Clear
     </td><td>
    <input type="checkbox" name="color" value="green" <cfif Edititem.color contains 'green'>checked="checked"</cfif> /> Green
     </td><td>
    <input type="checkbox" name="color" value="gray" <cfif Edititem.color contains 'gray'>checked="checked"</cfif> /> Gray
    </td><td>
    <input type="checkbox" name="color" value="orange" <cfif Edititem.color contains 'orange'>checked="checked"</cfif> /> Orange
     </td></tr><tr><td>
    <input type="checkbox" name="color" value="pink" <cfif Edititem.color contains 'pink'>checked="checked"</cfif> /> Pink
     </td><td>
    <input type="checkbox" name="color" value="purple" <cfif Edititem.color contains 'purple'>checked="checked"</cfif> /> Purple
    </td><td>
    <input type="checkbox" name="color" value="red" <cfif Edititem.color contains 'red'>checked="checked"</cfif> /> Red
     </td><td>
    <input type="checkbox" name="color" value="white" <cfif Edititem.color contains 'white'>checked="checked"</cfif> /> White
     </td><td>
    <input type="checkbox" name="color" value="yellow" <cfif Edititem.color contains 'yellow'>checked="checked"</cfif> /> Yellow
     </td><td>
    <input type="checkbox" name="color" value="multi-color" <cfif Edititem.color contains 'multi-color'>checked="checked"</cfif> /> Multi-color
</td><td>
     </td></tr></table>
   <!--- <Select NAME="color" id="itemcolor" multiple="multiple" size="12">
      <OPTION value="black" <cfif Edititem.color contains 'black'>selected</cfif> >Black</option>
      <OPTION value="blue" <cfif Edititem.color contains 'blue'>selected</cfif>>Blue</option>
      <OPTION value="brown" <cfif Edititem.color contains 'brown'>selected</cfif>>Brown</option>
      <OPTION value="green" <cfif Edititem.color contains 'green'>selected</cfif>>Green</option>
      <OPTION value="gray" <cfif Edititem.color contains 'gray'>selected</cfif>>Gray</option>
      <OPTION value="orange" <cfif Edititem.color contains 'orange'>selected</cfif>>Orange</option>
      <OPTION value="pink" <cfif Edititem.color contains 'pink'>selected</cfif>>Pink</option>
      <OPTION value="purple" <cfif Edititem.color contains 'purple'>selected</cfif>>Purple</option>
      <OPTION value="red" <cfif Edititem.color contains 'red'>selected</cfif>>Red</option>
      <OPTION value="white" <cfif Edititem.color contains 'white'>selected</cfif>>White</option>
      <OPTION value="yellow" <cfif Edititem.color contains 'yellow'>selected</cfif>>Yellow</option>
      <OPTION value="multi-color" <cfif Edititem.color contains 'multi-color'>selected</cfif>>Multi-Color</option>
    </select>--->
    <br>
    Storage:
    <input type="text" size="8" name="storage" value="#Edititem.storage#" id="itemstorage">/INDIA:<input type="text" size="8" name="storageindia" value="#Edititem.storageindia#" id="itemindiastorage">
    <cfinclude template="/includes/secondarystorage.cfm">
   <br> Make On Order? (1 for yes, 0 for no):
    <INPUT TYPE="text" SIZE="3" NAME="orderonrequest" VALUE="#EditItem.orderonrequest#" id="orderonrequest">
    Supplier:	<Select NAME="supplier" id="itemsupplier">
    <cfif edititem.supplier neq ""><OPTION value="#Edititem.supplier#" selected>#Edititem.supplier#</option>
	<cfelse><OPTION value="" selected></option>
	</cfif>
	<cfloop query="suppliers">
      <OPTION value="#suppliername#" >#suppliername#</option>
	 </cfloop>
	</select>


    <br>
    Note:
    <INPUT TYPE="text" SIZE="50" NAME="internalNote" VALUE="#EditItem.internalNote#" id="iteminternalnote">
    <br>
  </cfoutput> Current Group(s): <font color=blue><cfoutput query="groupassigned">#Groupname# <a href='?grouping=#urlencodedformat(groupname)#&groupdel=#newitem#'>X</a>,</cfoutput></font> Group Item in (submit multiple times to assign to more groups): <br>
  <Select NAME="grouping">
    <cfoutput>
      <option value="#groupassigned.groupname#">#groupassigned.groupname#</option>
    </cfoutput> <cfoutput query="groups">
      <option value="#groupname#">#groupname#</option>
    </cfoutput>
  </select>
  <cfoutput> <br>
    <a href=groupnamecreate.cfm>Define Groups</a>&nbsp;&nbsp;&nbsp;<a href=stonecreate.cfm>Add Stone Type</a>&nbsp;&nbsp;&nbsp;<span style="border:2px dashed white;width:280px;display:block;hieght:50px;background-color:##DDDDDD"> <a href="/np/match/cluster.cfm?list=0&target=#newitem#&category=#edititem.cat#">Add to Clusters</a> <a href="/np/match/cluster.cfm?list=007&itemid=#newitem#">#edititem.clustercount# </a>&nbsp; <br>
    <a href="/options/optionsoptions.cfm?itemid=#newitem#">Work On Options</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <cfif edititem.cat is 'rings'>
      <a href=addoptions.cfm?itemnumber=#newitem#>Add All Ring Sizes</a>
	  <cfelseif edititem.cat is 'bracelets'>
       <a href=addoptionsbracelets.cfm?itemnumber=#newitem#>Add All Bracelet Sizes</a>
    </cfif>
    ---- <cfquery datasource="gemssql" name="w1">
select count(*) as sold from buyingrecordall as buyingrecord, anup.cartstatusall as cartstatus where cartstatus.cartid=buyingrecord.cartid and itemid  = #url.newitem# and cartstatus.paymode <> 'null'
</cfquery><br>Sold since <cfoutput>#dateformat(edititem.datetaken, "mmm-dd-yy")#: #w1.sold#</cfoutput><a href="whensold.cfm?newitem=#newitem#"> When all sold?</a></span></CFOUTPUT>


  </td>
  </tr>
  </table>


</cfFORM>

Last inventory update: <cfoutput>#edititem.lastbought#</cfoutput>
<h2>UPLOADING ADDITIONAL IMAGE:</h2>
<form name="imageform" action="imageextra.cfm"
      enctype="multipart/form-data"
      method="post">
  Images being uploaded should have dimensions of less than 450 pixels on larger side. Second image should be 350 wide. Height can be anything<br>
  Thumbnail size should be under 7 kb for thumbnail and dimensions 120x80:
 <br>What is being updated/added: <select name="sequence">
    <option value="0" Selected>Main Image Updating</option>
		 <option value="100">Thumbnail Update</option>
     <option value="1">1st Extra Image Update</option>
		 <option value="2">2nd Extra Image Update</option>
   <option value="3">3rd Extra Image Update</option>
  </select>
    &nbsp;&nbsp;&nbsp;Number of extra images:<select name="morepics">
  <option value="0" <cfif edititem.morepics is 0> selected</cfif>>None</option>
  <option value="1" <cfif edititem.morepics is 1> selected</cfif>>1</option>
	  <option value="2" <cfif edititem.morepics is 2> selected</cfif>>2</option>
		  <option value="3" <cfif edititem.morepics is 3> selected</cfif>>3</option></select>

  <INPUT TYPE="hidden" NAME="newitem" VALUE="<cfoutput>#newitem#</cfoutput>">
  <input type="hidden" name="destin" value="<cfoutput>#root#\images\jewelry\#edititem.cat#\#newitem#</cfoutput>">
  <input type="hidden" name="origdestin" value="<cfoutput>#root#\images\#edititem.cat#\#newitem#.jpg</cfoutput>">
  <input type="hidden" name="thumbdestin" value="<cfoutput>#root#\images\#edititem.cat#\thumb\#newitem#.jpg</cfoutput>">
  <p>Select File:
    <input type="file"
         name="File2Upload"
         size="50">
  </p>
  <input    type="submit"
         value="Upload">
</form>
<a href="javascript:picmeleoApi.open('http://www.semiprecious.com/images/<cfoutput>#edititem.cat#/#newitem#</cfoutput>.jpg')">Open Picmeleo editor</a>

<script type="text/javascript">
	var picmeleo = {
		key: "a96e8f65c24c3f7d782cce281281cea52212",
		receiver: "http://www.semiprecious.com/admintools/images/saveeditedfile.cfm?newitem=<cfoutput>#newitem#</cfoutput>"
	}
</script>
<script type="text/javascript">
	document.write(unescape("%3Cscript src='http://manager.picmeleo.com/api/lightbox' type='text/javascript'%3E%3C/script%3E"));
</script>
<!---
<cfquery name="irating" datasource='gemssql'>
select * from itemstats with (nolock) where itemid=#newitem#
</cfquery>

<cfquery name="crating" datasource='gemssql'>
select sum(thumbexposure) as TCAT, avg(thumbexposure/(zoom+1)) as avgT2Z, avg(zoom/(addtocart+1)) as avgZ2C  from itemstats with (nolock) where #edititem.cat#  >10
</cfquery>

<cfset t2z=irating.thumbexposure/(irating.zoom+1)>
<cfset z2c=irating.zoom/(irating.addtocart+1)>

<cfoutput>

<table border=1><tr ><td colspan=8 bgcolor=lightblue>ITEM RATING</td></tr>
<tr><td>ActiveDays</td><td>t/z</td><td>(t/z)/(T/Zcat)</td><td>z/c</td><td>(z/c)/(Z/C)</td><td>Cart/Days</td><td>Sold/Days</td><td>DaysPersale</td></tr>
<tr><td>#irating.daysactive#</td><td>#decimalformat(t2z)#</td><td>#decimalformat(evaluate(t2z/crating.avgT2Z))#</td><td>#decimalformat(z2c)#</td><td>#decimalformat(evaluate((z2c)/crating.avgZ2C))#</td><td>#decimalformat(evaluate(irating.addtocart/(irating.daysactive+1)))#</td><td>#decimalformat(evaluate(irating.sold/(irating.daysactive+1)))#</td><td>#decimalformat(evaluate((irating.daysactive+1)/irating.sold))#</td></tr>
</table>
</cfoutput>
--->

</cfif>
</div>

</CFIF>
<cfcatch><cfoutput>#cfcatch.detail#,#cfcatch.message#</cfoutput>
<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>
<cfinclude template="/mainfooter.cfm" />
