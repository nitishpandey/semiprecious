<cfparam default="" name="success_msg" />
<cfparam default="" name="failure_msg" />
 <cfif isdefined("deleterate")>
	<cftry>
		<cfquery datasource="sptm" name="rates">
			delete from custom_stone_rates where rate_id = #id# 
		</cfquery>
	<cfset success_msg = success_msg & ' #id# deleted from rates ' />
	<cfcatch type="any">
	<cfset failure_msg = failure_msg & ' error deleting #id# rate' />
</cfcatch>
</cftry>
</cfif>

<cfif isdefined("rateid")>
		<cftry>
<cfif max_carat LTE min_carat>
	<cfthrow  />
</cfif>	
		<cfquery datasource="sptm" name="rates">
			update custom_stone_rates set max_carat = #max_carat#, min_carat = #min_carat#, rate = #rate# where rate_id = #rateid# 
		</cfquery>
	<cfset success_msg = success_msg & ' #rateid# updated ' />
	<cfcatch type="any">
	<cfset failure_msg = failure_msg & ' error updating #rateid# rate' />
</cfcatch>
</cftry>
</cfif>

<cfif isdefined("stoneid")>
	<cftry>
			<cfif max_carat LTE min_carat>
                <cfthrow  />
            </cfif>	
            <cfquery datasource="sptm" >
	            insert into custom_stone_rates (max_carat,min_carat,rate,stone_id) values (#form.max_carat#,#form.min_carat#,#form.rate#,#stoneid#)
            </cfquery>
		<cfset success_msg = success_msg & ' #stoneid# new range inserted  ' />
	<cfcatch type="any">
		<cfset failure_msg = failure_msg & ' error adding new range' />
	</cfcatch>
</cftry>
</cfif>

<cfif isdefined("form.addstone")><!--- adding a new stone --->
	<cftry>
	<cfif len(form.imagefile)>
		<cffile action="upload" filefield="imagefile" destination="customrequest" nameconflict="OVERWRITE">
		<cffile action="readBinary" file="#form.imagefile#"  variable="image">
	<cfelse>
		<cfset image = "">
	</cfif>
	<cfquery datasource="sptm" >
		insert into custom_stone_matrix (stone_name,type,pic,quality,shape) values ('#form.stone_name#','#form.stone_type#','#tobase64(image)#','#form.quality#','#form.shape#')
	</cfquery>
	
<cfcatch type="any"><br />
<cfoutput>#cfcatch.message#,#cfcatch.detail#</cfoutput>	Already exists.<br />
</cfcatch>
</cftry>
</cfif>


<html>
<head>
</head>
<body>
	<cfoutput>#success_msg#</cfoutput><br />
	<cfoutput>#failure_msg#</cfoutput>
    <cfif isdefined("editrate")>
<cfquery datasource="sptm" name="rates">
	select * from custom_stone_rates,custom_stone_matrix where rate_id = #url.id# and custom_stone_rates.stone_id = custom_stone_matrix.stone_id
</cfquery>
<strong>Edit  Rate for a given stone type and carat range</strong><form enctype="multipart/form-data" method="post" >
<cfoutput>	<input type="hidden" name="rateid" value="#rates.rate_id#">
Stone Name : #rates.stone_name# 
Type : #rates.type# Shape: #rates.shape#<br>

Max Carat: <input type="hidden" value="#rates.max_carat#" name="max_carat">#rates.max_carat#
Min Carat: <input type="hidden" value="#rates.min_carat#" name="min_carat">#rates.min_carat#<br>

<br />Quality: <input type="hidden" value="#rates.quality#" name="min_carat"><span style="color:blue;">#rates.quality#</span>
Rate (USD/): <input type="text" value="#rates.rate#" name="rate">
</cfoutput>
<input type="submit" value="Update rate">
</form>
</cfif>
<cfif isdefined("addrate")>
	<cfquery datasource="sptm" name="rates">
		select * from custom_stone_matrix where stone_id = #stone_id#
	</cfquery><br />
<strong>Add New Rate for given stone type</strong>	<form method="post">
			<cfoutput>	
			<input type="hidden" name="stoneid" value="#rates.stone_id#" ><!-- represents stoneid from the stones matrix -->
				
			<input type="hidden" name="stone_name" value="#rates.stone_name#" >
			<input type="hidden" name="stone_type" value="#rates.type#" >
			Stone Name : #rates.stone_name# 
				Type : #rates.type# 
				Quality: <span style="color:blue;">#rates.quality#</span>
			</cfoutput>	
			<br />
			Max Carat: <input type="text" value="1000" name="max_carat">
				Min Carat: <input type="text" value="0" name="min_carat">
				Rate (USD/): <input type="text" value="0" name="rate">
			<input type="submit" value="add stone Rate">
	</form>
</cfif>

<cfquery datasource="sptm" name="rates">
	select * from custom_stone_rates,custom_stone_matrix where  custom_stone_rates.stone_id = custom_stone_matrix.stone_id order by stone_name, type
</cfquery>	
<cfquery datasource="sptm" name="stones">
	select * from custom_stone_matrix order by stone_name, type
</cfquery><!--- 
<cfdump var="#stones#"> --->
<hr />
<strong>Add Stone and quality type:</strong> <form method="post"  enctype="multipart/form-data">
<input type="hidden" name="addstone">
Stone Name : <input type="text" name="stone_name">
Type: <select name="stone_type"><option value="faceted" >Faceted</option><option value="non-faceted">Non-Faceted</option></select>
		<br />(<strong>Do not leave pic selection blank </strong>)Pic <input type="file" name="imagefile" />
Quality: <input type="text" value="" name="quality" />
Shape: <input type="text" value="" name="shape" />
	<input type="submit" value="add stone type">
</form><hr />
<strong>Add Stone Rate:</strong><br /><cftable  query="stones"   border colheaders  colspacing="0">
				<cfcol header="stone"  text="#stone_name#" ><cfcol header="type"  text="#type#"><cfcol header="Quality" text="#quality#">
				<cfcol header="Edit" text="<a href='?stone_id=#stone_id#&amp;addrate=true'>New carat &amp; rate</a>" >
				<cfcol header="Pic" text='<img width="30px" src="data:image/png;base64,#pic#" />' align="center"   />
				
				</cftable>

<strong>RATES:</strong>
<table style="border:1px black solid;margin-top:20px;">
<tr style="background-color:#CdC2CA;"><td>Pic</td><td>Stone</td><td>Type</td><td>Quality</td><td>Max</td><TD>mIN</TD><TD>RATE</TD></TR>

<cfoutput query="rates">
<TR><td><cfif len(pic)><img width="30px" src="data:image/png;base64,#pic#" />
</cfif>&nbsp;</td><TD> #stone_name#</TD><TD>
#type#</TD><td>#quality#</td><TD>#max_carat#</TD><TD>#min_carat#</TD><TD>#rate#  <a href="?id=#Rate_id#&editrate=true" >Edit</a><a href="?id=#Rate_id#&deleterate=true" >X</a></TD></TR>
</cfoutput>
</TABLE>
</body>
</html>