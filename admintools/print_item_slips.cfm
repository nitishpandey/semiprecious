
<cfif isuserinrole("admin") or isuserinrole("superadmin") or isuserinrole("guestadmin")>
<cfparam default="" name="session.print_item_list" />
<cfif isdefined("url.empty")>
<cfset session.print_item_list = "" />
</cfif>
<cfif isdefined("url.cartid")>
<cfset session.print_item_list = replacenocase(session.print_item_list,listgetat(url.cartid,1),'','All') />
<cfset session.print_item_list = session.print_item_list & " #listgetat(url.cartid,1)#" />
<cfif cgi.http_referer contains '/itemsell.cfm'>
<cflocation url="/itemsell.cfm?#cgi.query_string#" addtoken="no" />
<cfabort />
</cfif>


</cfif>

<html>
<head>
<meta name="robots" content="noindex,nofollow">
<style type="text/css" media="All">
div.slip {
	position:relative;
	float:left;width:184px;height:97px;
	margin-left:12px;margin-bottom:6px;padding:5px;
font-size:11px;
text-align:left;}
a:visited {
color:red;
}
.inventory0 {
color:red ;
}
img { z-index:1;

float:right;}
body {
	font-family:verdana;
	margin-top:2px;
	padding:10px;
}

._text {
	z-index:4;width:176px;position:absolute;top:1px;left:2px;}
</style>
<STYLE media="PRINT">
FORM {
	DISPLAY:NONE;
}</STYLE>
</head>

<body style="margin-top:-10px"  >
<form method="GET">
<cfoutput>
Comma Separated Cartids:<input type="text" name="cartid" value="#session.print_item_list#" />
</cfoutput>
<br>
Start Row: <input type="text" value="1" name="start_row" />
<INPUT TYPE="SUBMIT" />
<a href="?empty=1">Empty Cart Id List </a>  <a href="/cartstatus21.cfm?empty=1">Carts List</a> 
</form>
<cftry>
<cfif isdefined("url.cartid")>
<cfset url.cartid = listsort(url.cartid,"Numeric","dESC"," ,")>
 <CFPARAM name="showimage" default="">
<cfparam name="archived" default="no">
     <cffunction name="Query_Append" access="public" returntype="void" output="false"
     hint="This takes two queries and appends the second one to the first one. This actually updates the first query and does not return anything.">
    

     <!--- Define arguments. --->
     <cfargument name="QueryOne" type="query" required="true" />
     <cfargument name="QueryTwo" type="query" required="true" />
    

     <!--- Define the local scope. --->
     <cfset var LOCAL = StructNew() />
    

     <!--- Get the column list (as an array for faster access. --->
     <cfset LOCAL.Columns = ListToArray( ARGUMENTS.QueryTwo.ColumnList ) />
    

    


     <!--- Loop over the second query. --->
     <cfloop query="ARGUMENTS.QueryTwo">
    

     <!--- Add a row to the first query. --->
     <cfset QueryAddRow( ARGUMENTS.QueryOne ) />
    

     <!--- Loop over the columns. --->
     <cfloop index="LOCAL.Column" from="1" to="#ArrayLen( LOCAL.Columns )#" step="1">
    

     <!--- Get the column name for easy access. --->
     <cfset LOCAL.ColumnName = LOCAL.Columns[ LOCAL.Column ] />
    

     <!--- Set the column value in the newly created row. --->
     <cfset ARGUMENTS.QueryOne[ LOCAL.ColumnName ][ ARGUMENTS.QueryOne.RecordCount ] = ARGUMENTS.QueryTwo[ LOCAL.ColumnName ][ ARGUMENTS.QueryTwo.CurrentRow ] />
    

     </cfloop>
    

     </cfloop>
    

     <!--- Return out. --->
     <cfreturn />
     </cffunction>
<cfloop list="#url.cartid#" index="k" delimiters=", " >
 <Cfquery datasource="gemssql" name="q_ship">
    Select shippingdetails, paymode,tps,status,couponcode from cartstatus where cartid = #TRIM(k)#
    </Cfquery>
	<cfif q_ship.recordcount is 0>
        
    <CFQUERY DATASOURCE="gemssql" NAME="solditems">SELECT     TOP 100 PERCENT  dbo.items.subcat as subcat2,  dbo.items.internalNote,  buyingrecord.itemid, dbo.items.CAT, dbo.items.supplier, 
                      dbo.items.thumblink, buyingrecord.Note,buyingrecord.datebought, buyingrecord.optionid,  buyingrecord.quantity,  dbo.items.storage, buyingrecord.affiliateID, 
                       dbo.items.Inventory, buyingrecord.cartid,buyingrecord.inventoryatsale
		FROM         dbo.buyingrecord_archive as buyingrecord LEFT OUTER JOIN
                      dbo.items ON buyingrecord.itemid * 1 = dbo.items.newitem
		WHERE     (buyingrecord.quantity > 0) AND (buyingrecord.rate IS NOT NULL) AND (buyingrecord.cartid = #TRIM(k)#)
			ORDER BY dbo.items.CAT,storage, note
		  </cfquery>
  <cfif solditems.recordcount is 0>
 
	    <CFQUERY DATASOURCE="gemssql" NAME="solditems">SELECT     TOP 100 PERCENT dbo.items.subcat as subcat2,  dbo.items.internalNote, 
     dbo.buyingrecord.itemid,     dbo.buyingrecord.cartid, dbo.items.CAT, dbo.items.supplier, 
                      dbo.items.thumblink, dbo.buyingrecord.Note, buyingrecord.datebought, dbo.buyingrecord.optionid, dbo.buyingrecord.quantity,  dbo.items.storage, dbo.buyingrecord.affiliateID, 
                      dbo.items.Inventory,dbo.buyingrecord.inventoryatsale
FROM         dbo.buyingrecord LEFT OUTER JOIN
                      dbo.items ON dbo.buyingrecord.itemid * 1 = dbo.items.newitem
WHERE     (dbo.buyingrecord.quantity > 0) AND (dbo.buyingrecord.rate IS NOT NULL) AND (dbo.buyingrecord.cartid = #TRIM(k)#)
ORDER BY dbo.items.CAT, storage, note
  </cfquery>
   </cfif>
<cfelse>
    <CFQUERY DATASOURCE="gemssql" NAME="solditems">SELECT     TOP 100 PERCENT  dbo.items.subcat as subcat2, dbo.items.internalNote,  dbo.buyingrecord.itemid, dbo.items.CAT, dbo.items.supplier, 
                      dbo.items.thumblink, dbo.buyingrecord.Note, buyingrecord.datebought,dbo.buyingrecord.optionid, dbo.buyingrecord.quantity, dbo.items.storage, dbo.buyingrecord.affiliateID, 
 dbo.items.Inventory,dbo.buyingrecord.cartid, dbo.buyingrecord.inventoryatsale
FROM         dbo.buyingrecord LEFT OUTER JOIN
                      dbo.items ON dbo.buyingrecord.itemid * 1 = dbo.items.newitem
WHERE     (dbo.buyingrecord.quantity > 0) AND (dbo.buyingrecord.rate IS NOT NULL) AND (dbo.buyingrecord.cartid = #TRIM(k)#)
ORDER BY dbo.items.CAT,storage, note
  </cfquery>
  </cfif>
<cfif not isdefined("solid")>
     <cfset solid = querynew(solditems.ColumnList) />
     </cfif>
	  <cfset p = query_append(solid,solditems) />
	</cfloop>
    <cfset solditems = solid />
<div style="width:460px;margin-left:165px;">
<cftry>
<CFOUTPUT>
	<DIV STYLE="display:none;width:460px;HEIGHT:#EVALUATE((URL.START_ROW-1)*96)#PX;"></DIV></CFOUTPUT>
	<cfset cartgroupid = 0 />
						<cfset moocount = 0 />
<cfoutput query="solditems">
<cfif cat neq 'chains' AND 0 >
<cfloop from="1" to="#quantity#" index="j">
<div class="slip" >
		  <cfif storage is 'pippin'>
  		      <img  src=#thumblink# width="70px" border="0" alt="#internalnote#">
		    <cfelse>
		     <img src=/images/#cat#/thumb/#itemid#.jpg width="70px" border="0">
		  </cfif>
<div class="_text">#solditems.cartid#
<cfif optionid>:<cfmodule TEMPLATE="/optiondetails.cfm" option="#optionid#"  newitem='#itemid#' />
</cfif>[#dateformat(solditems.datebought,'DD-MM')#]<br>
#itemid#-#j#/#quantity#|#inventory#|#SUBCAT2#<br>
<cfif storage is 'Angela'><b>OHIO</b>
<cfelseif supplier contains "OC"><b>OC</b>
	<cfelse>
	#storage#
<cfif	(inventoryatsale LT 0 and len(inventoryatsale))>
MOO
<cfelse>
<cfif note contains 'IN-'  >
	<cfelse>U</cfif>
	</cfif>
</cfif>
</div>          
	
 </div>
 </cfloop>
 <cfelse>
<cfif storage is 'Angela' or  supplier contains "OC">
<cfset qtytoadd = 0 />
<cfelse> 
 <div class="slip">
		  <cfif storage is 'pippin'>
  				      <img  src=#thumblink# width="70px" border="0" >
			    <cfelse>
				     <img src=/images/#cat#/thumb/#itemid#.jpg width="70px" border="0">
			  </cfif>
			<div class="_text">#cartid#|#itemid#|#left(cat,1)# 
					<cfif optionid>
						<cfmodule TEMPLATE="/optiondetails.cfm" option="#optionid#"  newitem='#itemid#' />
					</cfif>[#dateformat(solditems.datebought,'DD-MM')#]<br />
					#SUBCAT2#|#inventory#|<u>#quantity#</u><br>
					#storage#
<cfset qtytoadd = solditems.quantity />
					<cfif	(inventoryatsale LT 0 and len(inventoryatsale))>
					<cfset moocount = moocount + solditems.quantity />
					</cfif>
					<cfif note contains 'IN-' or storage contains 'IN-'>
						<cfset uscount = 0 />
						<cfelse>
						US <cfset uscount = solditems.quantity  />
					</cfif>
				</div> 
		 </div>
			</cfif>         
	 </cfif>
	 <cfif solditems.cartid neq Variables.cartgroupid>
				 <cfif Variables.cartgroupid>
				 <div class="slip">
					<div class="_text">#cartgroupid#-Inus:#usitems#
		
		
						<br /> Total Qty #evaluate(Variables.itemsincart-usitems)# + #Variables.moocount#
						<br /> Items Packed:  
						<cfif usitems is 0>
									 Semiprecious.com 
						<cfelse>
								<strong>Semiprecious.com</strong>
						</cfif>
						<cfset moocount = 0 />
						 </div> 
				 </div>
		    </cfif>
		 <cfset cartgroupid = cartid />
		 <cfset itemsincart = qtytoadd - moocount />
		 <cfset usitems = uscount />
         
	 <cfelse>
	     <cfset usitems = usitems + uscount />
		 <cfset itemsincart = itemsincart + qtytoadd - moocount />
	 </cfif>
 </cfoutput>

<cfoutput>
 <cfif Variables.cartgroupid>
		 <div class="slip">
			<div class="_text">#cartgroupid#-Inus:#usitems#


				<br /> Total Qty #Variables.itemsincart#
				<br /> Items Packed:  
				<cfif usitems is 0>
								 Semiprecious.com 
				<cfelse>
						<strong>Semiprecious.com</strong>
				</cfif>
				 </div> 
		 </div>
    </cfif></cfoutput>
 
 <cfcatch type="any">

<cfoutput>#cfcatch.message#,#cfcatch.detail#
</cfoutput>
<cfdump var="#cfcatch.tagcontext#">
</cfcatch>
</cftry>
</div>
<cfif cartid eq "">
 <span class="form_heading">Or Fill form below to process another cartid:</span> 
  <cfform action='' method="post">
    <table width="88%" border="1">
      <tr> 
        <td>Please enter cart id:</td>
        <td><cfoutput> 
            <input type="text" value="#url.cartidfromcartlist#" name="cartid">
		</cfoutput></td>
      </tr>
    </table>
  </cfform>
    <!--- info put inline <div id="storagelayer" style="z-index:2;position:absolute;top:80px;left:200px;visibility:hidden;width:100px;border:1px brown dashed;background-color:yellow;"> 
    Where Stored & Inventory AFTER this shipment:<br>
    <cfoutput>#storagelayer# . </cfoutput></div> --->


  </cfif>

</cfif>
<cfcatch type="any">
<cfoutput><cfdump var="#cfcatch.tagcontext#" />
#cfcatch.Message#,#cfcatch.detail#</cfoutput>
</cfcatch></cftry>
</body>
</html>
<cfelse>
Not enough privileges.
</cfif>
