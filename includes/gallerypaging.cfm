<!--start of includes/gallerypaging.cfm
--><cfparam name="start" default="1">
<div align="center" width="100%" style="padding:5px">
	<!--- Paging links --->
	<!--- If we are  not on the first page --->
	<cfif isdefined("url.start")>
	</cfif>
	<cfparam name="numberdisplayed" default="0" type="numeric" />
	<cfif numberdisplayed>
		<cfset p = numberdisplayed />
		<cfset numberdisplayed = displayrows*displaycolumns />
		<cfset total = getlist.recordcount>
		<!--- set up link values --->
		<cfset vPageLink = currentfile & "?category=" & category >
		<cfif url.sortorder neq "">
			<cfif find(' ',url.sortorder) neq 0>
				<cfset vPageLink = vPageLink & "&sortorder=" & Mid(url.sortorder, 1, find(' ',url.sortorder)-1) >
			<cfelse>
				<cfset vPageLink = vPageLink & "&sortorder=" & url.sortorder >
			</cfif>
		</cfif>
		<cfif subcat neq "">
			<cfif find(' ',subcat) eq 0>
				<cfset vPageLink = vPageLink & "&subcat=" & subcat>
			<cfelse>
				<cfset vPageLink = vPageLink & "&subcat=" & replace(subcat,' ','+' ,'all') >
			</cfif>
		</cfif>
		<cfif occasion neq "">
			<cfset vPageLink = vPageLink & "&occasion=" & occasion>
		</cfif>
		<cfif color neq "">
			<cfset vPageLink = vPageLink & "&color=" & color>
		</cfif>
		<cfif priceless neq "">
			<cfset vPageLink = vPageLink & "&priceless=" & priceless>
		</cfif>
		<cfif pricegreater neq "">
			<cfset vPageLink = vPageLink & "&pricegreater=" & pricegreater>
		</cfif>
		<cfif salestatus neq "">
			<cfset vPageLink = vPageLink & "&salestatus=" & salestatus>
		</cfif>
		<cfif jewelrysize neq "">
			<cfset vPageLink = vPageLink & "&jewelrysize=" & jewelrysize>
		</cfif>
		<cfif ringsize neq "">
			<cfif ringsize does not contain 'size'>
				<cfset rsize=ringsize>
			<cfelse>
				<cfset rsize=Right(ringsize, (len(ringsize) - 5)) >
			</cfif>
			<cfset vPageLink = vPageLink & "&ringsize=" & rsize>
		</cfif>
		<cfif advancedsearch neq "">
			<cfset vPageLink = vPageLink & "&advancedsearch=" & URLEncodedformat(advancedsearch)>
		</cfif>
		<cfif url.style neq "">
			<cfset vPageLink = vPageLink & "&style=" & url.style>
		</cfif>
		<cfif groupname neq "">
			<cfset vPageLink = vPageLink & "&groupname=" & groupname>
		</cfif>
		<!--- newstart is used below. Might be able to delete --->
		<cfif start GT 1>
			<cfset newstart = start - display>
			<cfif newstart LT 1>
				<cfset newstart = 1>
			</cfif>
		</cfif>
		<!---  Double Arrows go to 1st/last  page.  +100, -100, +10, and -10 pages are shown, if they're unique.
			-5 through +5 pages are shown if they exist
			If x items are displayed per page, displays always start at 1 or x*page + 1  --->
		<cfoutput>
			<table border="0" cellpadding="0" cellspacing="0" style="display:inline" align="center" >
				<tr>
					<td rowspan="3" align="right" style="padding-right:5px">
						<cfset finalPageLink = (vPageLink & '&start=1')>
						<!---      <a href=#finalPageLink#><img src="/images/prevlistmini.gif" name="prev"  border="0" style="display:inline;" /><img src="/images/prevlistmini.gif" name="prev"  border="0" style="display:inline;" /></a>&nbsp;&nbsp;&nbsp;&nbsp;--->
						<cfset finalPageLink = (vPageLink & '&start=' & max((start - numberdisplayed),1))>
						<cfset qn = int(start/(numberdisplayed)) + 1 />
						<cfif qn GT 1>
							<a href=#finalPageLink# style="text-decoration:none;font-size:2.2em;color:rgb(192, 142, 147)">
								&larr;
								<!--- 	<img src="/images/previousgreen.gif" name="prev"  border="0" style="display:inline;" width="30" height="18" />
									--->
							</a>
							&nbsp;
						</cfif>
					</td>
					<td align="center" nowrap="nowrap">
						<cfif start - (numberdisplayed * 100) gt numberdisplayed>
							<cfset finalPageLink = vPageLink & '&start=' & start - (numberdisplayed * 100)>
							<a href=#finalPageLink#>
								#qn - 100#
							</a>
							&nbsp;
						</cfif>
						<cfif start - (numberdisplayed * 10) gt numberdisplayed>
							<cfset finalPageLink = vPageLink & '&start=' & start - (numberdisplayed * 10)>
							<a href=#finalPageLink#>
								#qn - 10#
							</a>
							&nbsp;
						</cfif>
						<cfloop index="pagepoint" list="-5,-4,-3,-2,-1,0,1,2,3,4,5">
							<cfif pagepoint eq 0 >
								<span style="background-color:rgb(192, 142, 147);color:white;">&nbsp;#qn + pagepoint#&nbsp;</span>
							<cfelse>
								<cfif start + (numberdisplayed * pagepoint) gt 0 and (start + (numberdisplayed * pagepoint)) lt (total - numberdisplayed)>
									<cfset finalPageLink = vPageLink & '&start=' & start + (numberdisplayed * pagepoint) >
									<a href=#finalPageLink#>
										#qn + pagepoint#
									</a>
									&nbsp;
								</cfif>
							</cfif>
						</cfloop>
						<cfif start + (numberdisplayed * 10) lt total - numberdisplayed>
							<cfset finalPageLink = vPageLink & '&start=' & start + (numberdisplayed * 10)>
							<a href=#finalPageLink#>
								#qn + 10#
							</a>
							&nbsp;
						</cfif>
						<cfif start + (numberdisplayed * 100) lte total - numberdisplayed>
							<cfset finalPageLink = vPageLink & '&start=' & start + (numberdisplayed * 100)>
							<a href=#finalPageLink#>
								#qn + 100#
							</a>
							&nbsp;
						</cfif>
					</td>
					<td rowspan="3" align="left"  style="padding-left:5px">
						<cfif (total-(ceiling(start/numberdisplayed))*numberdisplayed) GT 0>
							<cfset finalPageLink = vPageLink & '&start=' & evaluate(start + p) >
							<a href="#finalPageLink#" style="text-decoration:none;font-size:2.2em;color:rgb(192, 142, 147)">
								&rarr;
								<!---
									<img src="/images/nextgreen.gif" name="next"  border="0" style="display:inline;" width="30" height="18" />
									--->
							</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</cfif>
						<!---   <cfset finalPageLink = vPageLink & '&start=' & total - (total mod numberdisplayed) + 1>
							<a href=#finalPageLink#><img src="/images/nextlistmini.gif" name="prev"  border="0" style="display:inline;" /><img src="/images/nextlistmini.gif" name="prev"  border="0" style="display:inline;" /></a>&nbsp;--->
					</td>
				</tr>


				<tr>
					<td align="center" class="side_link">
						You are on Page
						<br />
						#qn# of #ceiling(total/numberdisplayed)#
					</td>
				</tr>
				<tr>
					<td align="center">
						Displaying items #start# - #min(start+p - 1,total)# of #total#
					</td>
				</tr>
			</table>
		</cfoutput>
	</cfif>
</div>
<!--- End Paging links --->
<!--end of includes/gallerypaging.cfm -->