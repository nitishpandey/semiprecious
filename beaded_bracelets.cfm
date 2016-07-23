<!--- a better approach is to have a URL pattern to be detected in index.cfm (hopefully the request will go to index.cfm when the folder does not exist as per the pretty URL) then 
based on the pattern if the starting folder is "style" then the first item in the underscore join word would be category and the next the style --->
<!--- and so on and then no page is required. --->
<cfset category = 'bracelets' > <cfset style ='beaded' > <cfset reversefilename = 1> <cfinclude  template='gemstone_jewelry_gallery.cfm' > 
