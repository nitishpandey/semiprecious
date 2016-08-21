<HTML>
<HEAD>
<title>Coloring of customisable jewelry items</title></HEAD>
<BODY>

<cfif isdefined("form.files1") and isdefined("form.files2")>
<cfset dest_dir1 = "#Application.rootfolder#/images/#form.category#" />
<cfset dest_dir2 = "#Application.rootfolder#/images/custom/#form.category#" />
                           <cfset fileupload = 1 />     <cftry>
					<cfdirectory action="create" recurse="true" directory="#dest_dir#" />
                                                                    <cfcatch type="any">
                                                                    	<!--- in case the directory already exists, do nothing --->
                                                                    </cfcatch>
																	</cftry>
					<cftry>
					<cffile action = "upload" accept="image/png" fileField = "files1" destination = "#dest_dir1#/#form.itemid#.png" nameConflict = "overwrite">
					<cffile action = "upload" accept="image/png" fileField = "files2" destination = "#dest_dir2#/#form.itemid#.png" nameConflict = "overwrite">

					                                                <cfcatch type="any">
                                                     <cfset fileupload = 0 />                                         	<!--- in case the directory already exists, do nothing --->
                                                                    </cfcatch>
																	</cftry>

   <cfif fileUpload >
	<cfinvoke method="custom_status" component="customrequest.custom" returnvariable="return_" >
		<cfinvokeargument name="itemid" value="#form.itemid#" />
		<cfinvokeargument name="status" value="colored" />
	</cfinvoke>

<div style="width:400px;float:left">
<cfoutput><img src="/images/custom/#form.category#/#form.itemid#.png" />
</cfoutput></div>
New status is : <cfoutput>#return_#</cfoutput>
<CFELSE>
COULD NOT UPLOAD
</CFIF>

<cfoutput>
	<div style="width:420px;float:left">
<img src="/images/#form.category#/#form.itemid#.png" />
</div><br />

<div style="color:red">If  you see an error then please FILL  the same itemid and upload again.</div>
To process for layers <a href="build_layers_IHS.cfm?image=#form.itemid#&amp;category=#form.category#">click here</a>
</cfoutput>

<br />

<cfelseif isdefined("form.itemid")>

<cfquery datasource="sptm" name="q">
	select category from custom_items where imageid = #form.itemid#
</cfquery>

<cfinvoke component="customrequest.custom" method="custom_status" returnvariable="custom_state">
 <cfinvokeargument name="itemid" value="#form.itemid#" />
 <cfinvokeargument  name="category" value="#q.category#" />
</cfinvoke>

<div style="width:400px;float:left">

<cfoutput><img src="/images/#q.category#/#form.itemid#.jpg" />
#custom_state#</cfoutput>
</div>
		<cfif listgetat(custom_state,1)  eq "initiated" or listgetat(custom_state,1) eq "colored" ><!--- layered is the auto process to be invoked manually since it uses js --->

<div style="width:200px;float:left;border:1px black solid;">

<cfFORM action=""       enctype="multipart/form-data"
       method="post">
   <P>

<cfINPUT type="hidden" name="itemid" value="#form.itemid#"  />

<cfINPUT type="hidden" name="category" value="#Q.category#" /><BR>
Select Original PNG File: <INPUT  type="file" name="files1" /><BR>

Select Colored PNG File: <INPUT  type="file" name="files2" /><BR>
   <INPUT type="submit" value="Upload" />
	<INPUT type="reset" />
 </cfFORM>


</div>
<cfelse>
Current Status is : <cfoutput>#listgetat(custom_state,1)#....<br />To initiate this item <a href="/detail.cfm?itemnumber=#form.itemid#">click here</a>

</cfoutput>
<span style="color:red">This item has not been initiated for customisation or is not available for re-coloring</span>
</cfif>
</cfif>
--------------------------------
<div style="clear:left;border:1px double blue;">

<FORM action="" method="post" >
   <P>

Which item id have you colored <INPUT type="text" name="itemid"><BR>
   <INPUT type="submit" value="Send">
<INPUT type="reset">
 </FORM>
</div>

</BODY>
</HTML>