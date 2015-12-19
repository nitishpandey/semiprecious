<cfparam name=filtered default="">

<cfset itemslist = "" >
<cftry>
<cfif start GT getlist.recordcount or start eq 0>
<cfset start = 1 />
</cfif>
	<CFLOOP QUERY="Getlist"	startrow="#start#" endrow="#evaluate(start+displayrows*displaycolumns-1)#">
		<cfset itemslist = ListAppend(itemslist, newitem)>
	</cfloop>

	<cfset itemsalllist = "" >
	<CFLOOP QUERY="Getlist">
		<cfset itemsalllist = ListAppend(itemsalllist, newitem)>
	</cfloop>


		<cftry>

			<cfif occasion is 'oos'>
			<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,35,0)#">
			select disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
			inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
			   buylink from items with (nolock) where (status=0 or status=3)
				 </cfquery>
				 <cfelse>

			<cfquery datasource="gemssql" name="itemsinmemory" cachedwithin="#createTimespan(0,0,15,0)#">
			select disporder,  weight, size,  lower(cat) as cat, totalqtysold, itemnumber as optcount, grouping, lower(color) as color, orderonrequest,
			inventory , newitem,  style, lower(subcat) as subcat, subcat2, datetaken,  NameID,  price, basecost, saleprice, status, wholesaleprice, left(Description,20) as description, inventory, storage, thumblink, imagelink,
			   buylink from items with (nolock) where (status=0 or status=3) and (inventory>0 or orderonrequest=1)
				 </cfquery>
			</cfif>
			 <cfcatch type="any">
			 Error in itemsinmemory
		</cfcatch>
	 </cftry>

<cfif cgi.server_name does not contain 'wholesale'>

	  <cfquery datasource="gemssql" name="themes" cachedwithin="#createTimespan(0,1,0,0)#">
               select itemid, groupname from itemsbygroup
	 </cfquery>


	 <cfquery dbtype="query" name="itemsingallery">
            select cat, Color, newitem, subcat, style, price,  saleprice, wholesaleprice from itemsinmemory where newitem in (#itemsalllist#)
	 </cfquery>

	<CFQUERY dbtype="query" NAME="typesofjewelry">
			select distinct groupname from themes, itemsingallery where themes.itemid=itemsingallery.newitem
			 <cfif subcat neq ""> and subcat ='#subcat#'</cfif>
			<cfif category neq "all"> and cat='#category#'</cfif>
	</cfquery>

	<cfif color is "">
	<cfquery dbtype="query" name="colorsavailable">
	select distinct color from itemsinmemory where newitem in (#itemsalllist#) order by color
	</cfquery>
	</cfif>
	<cfif subcat is "">
	<cfquery dbtype="query" name="stonesavailable">
	select distinct subcat from itemsinmemory where newitem in (#itemsalllist#) order by subcat
	</cfquery>
	</cfif>
	<cfif category is "" or category is "all">
	<cfquery dbtype="query" name="catsavailable">
		select distinct cat from itemsinmemory where newitem in (#itemsalllist#) order by cat
	</cfquery>
	</cfif>
	<cfif color eq "" and subcat is "">
	<cfset filtered="yes">
	</cfif>


<!---	<cfif url.category neq "" or subcat neq "" or groupname neq "" or pricegreater neq "0" or priceless neq ""><a href=<cfoutput>#GetFileFromPath(GetBaseTemplatePath()
)#</cfoutput>>Clear Filters</a>
</cfif>

<img src="/images/filter.jpg" style="display:inline" width="18px" />
--->
<!--- use this if you put back the price filter	<cfif (category is "all") or (groupname eq "") or (priceless eq "") or (color is "" and subcat is "")>
--->
	<cfif (category is "all") or (groupname eq "")  or (color is "" and subcat is "")><span class="search-btn"><b>Search By</b></span>

		<FORM ACTION="<cfoutput>#GetFileFromPath(GetBaseTemplatePath())#</cfoutput>" method="get" name="srchfrm"  style="display:inline;margin:4px;">
		<cfif category is "all">
		          <SELECT class="inputtext" NAME="category" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
		            <option  value="" selected >Category</option>
		            <OPTION value="">Select All</option>
		           <cfoutput query="catsavailable">
		            <OPTION value="#cat#">#cat#</option>
		</cfoutput>
		          </select>
		          <input type="hidden" name="subcat" value=<cfoutput>"#subcat#"</cfoutput>>
		    	<input type="hidden" name="color" value=<cfoutput>"#color#"</cfoutput>>
			<input type="hidden" name="priceless" value=<cfoutput>"#priceless#"</cfoutput>>
		    	<input type="hidden" name="groupname" value=<cfoutput>"#groupname#"</cfoutput>>
					</form>
					</cfif>
		</form>
		<FORM ACTION="<cfoutput>#GetFileFromPath(GetBaseTemplatePath())#</cfoutput>" method="get" name="srchfrm"  style="display:inline;margin:4px;">
		<cfif color is "" and subcat is "">
		          <SELECT class="inputtext" NAME="color" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">

							  <option  value="" selected >Color</option>
								 <OPTION value="">Select All</option>

		<cfoutput query="colorsavailable">
		          <cfif color does not contain ",">  <OPTION value="#color#">#color#</option>
					</cfif>
		</cfoutput>
		          </select>


		           <SELECT class="inputtext" NAME="subcat" SIZE="1" VALUE="subcat" onChange="javascript:submit(this.form);">
		            <option  value="" selected >Stones</option>
		            <OPTION value="">Select All</option>

		<cfoutput query="stonesavailable">
		            <OPTION value="#subcat#">#subcat#</option>
		</cfoutput>

		          </select>

			<input type="hidden" name="priceless" value=<cfoutput>"#priceless#"</cfoutput>>
			<input type="hidden" name="category" value=<cfoutput>"#category#"</cfoutput>>
		    	<input type="hidden" name="groupname" value=<cfoutput>"#groupname#"</cfoutput>>
		 </cfif>
		</form>
		<!--- <FORM ACTION="<cfoutput>#GetFileFromPath(GetBaseTemplatePath())#</cfoutput>" method="get" name="srchfrm"  style="display:inline;margin:4px;">
		<cfif priceless eq "">
		  <SELECT class="inputtext" NAME="priceless" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
		<option selected value="">Price</option>
		<OPTION value="">ALL</option><cfoutput>
		<OPTION value="30">#round_format(30)# and Less</option>
		<OPTION value="60">#round_format(60)# and Less</option>
		<OPTION value="100">#round_format(100)# and Less</option>
		<OPTION value="200">#round_format(200)# and Less</option>
		<OPTION value="600">#round_format(600)# and Less</option></cfoutput>
		</select>
		    	<input type="hidden" name="subcat" value=<cfoutput>"#subcat#"</cfoutput>>
		    	<input type="hidden" name="color" value=<cfoutput>"#color#"</cfoutput>>
			<input type="hidden" name="category" value=<cfoutput>"#category#"</cfoutput>>
		  <!---  	<input type="hidden" name="groupname" value=<cfoutput>"#groupname#"</cfoutput>>--->
		</cfif>
		</form>--->
		<FORM ACTION="<cfoutput>#GetFileFromPath(GetBaseTemplatePath())#</cfoutput>" method="get" name="srchfrm"  style="display:inline;margin:4px;">

			<cfif groupname eq "">
			  <SELECT class="inputtext" NAME="groupname" SIZE="1" VALUE="" onChange="javascript:submit(this.form);">
			            <option  value="" selected >Design</option>
			  <OPTION value="">All Designs</option>
			        <cfoutput query="typesofjewelry">
			                    <OPTION value="#groupname#">#groupname#</option>
			        </cfoutput>
			        </select>
			    	<input type="hidden" name="color" value=<cfoutput>"#color#"</cfoutput>>
			    	<input type="hidden" name="subcat" value=<cfoutput>"#subcat#"</cfoutput>>
				<input type="hidden" name="category" value=<cfoutput>"#category#"</cfoutput>>
			 </cfif>

		</form>
	</cfif>
</cfif>
<cfcatch type="any">
<cfoutput>You Can Navigate Pagination from Bottom</cfoutput>

</cfcatch>
</cftry>
