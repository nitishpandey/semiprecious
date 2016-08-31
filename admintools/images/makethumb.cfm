
<cfif (not IsUserInRole("admin")) and (not IsUserInRole("superadmin"))>
Not enough privileges
<cfabort />
</cfif><cfparam name="imagesize" default="">
<cfparam name="image" default="">
<cfparam name="cat" default="">
<cfparam name="newitem" default="">
<html> 
<head> 
    <title>Save image</title> 
</head> 
<body> 
 
 
 <cfif image neq "">
            <cfquery datasource="gemssql" name="getcat">
            select cat from items where newitem=#newitem#
            </cfquery>

 			 			 <cfhttp method="Get" url="#image#" path="d:\inetpub\semiprecious\images\#getcat.cat#\thumb" file="#newitem#.jpg">		
						 				 IMAGE UPDATED!
<cfelse>
<a href="javascript:picmeleoApi.open('http://www.semiprecious.com/images/<cfoutput>#cat#/#newitem#</cfoutput>.jpg')">Open Picmeleo editor to make thumb</a>

<script type="text/javascript">
	var picmeleo = {
		key: "a96e8f65c24c3f7d782cce281281cea52212",
		receiver: "http://www.semiprecious.com/admintools/images/makethumb.cfm?newitem=<cfoutput>#newitem#</cfoutput>"
	}
</script>
<script type="text/javascript">
	document.write(unescape("%3Cscript src='http://manager.picmeleo.com/api/lightbox' type='text/javascript'%3E%3C/script%3E"));
</script>

</cfif> 
</body> 
</html>
