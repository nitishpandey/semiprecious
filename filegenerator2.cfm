<cfloop list="#Application.allstones#" index="subcat">
<!--- <cfdirectory action="create" newdirectory="" 
directory structure can be taken up but that has issues since we are going to include ../list.cfm and
then list.cfm will have dependencies , as to how it has referenced images and other templates and hrefs 
thus for now i am just making categorystone

<cfloop list="#evaluate('application.' & c & 'tones')#" index="s">--->
<cfoutput>#subcat#</cfoutput>
<cfset s1 = replace(trim(subcat)," ","",'All')>

<cfset v = "<cfset subcat ='" & subcat &"' >  <cfinclude ">
<cfset v = v & " template='gemstone_jewelry_gallery.cfm' > " >
<cffile action="write" output="#v#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\jewelry_#s1#.cfm" >
<cffile action="write" output="#v#" nameconflict="overwrite" destination="d:\inetpub\semiprecious" file="d:\inetpub\semiprecious\#s1#.cfm" ><!--- </cfloop> --->
</cfloop>
