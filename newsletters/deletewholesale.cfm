<html>
<head>
<title>Remove my Record! Stop bothering me!! I dont like deals!!</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<cfparam name="delemail" default="">
<body>
<cfif delemail eq "">
<form action="deletewholesale.cfm"	 name="wholesaleemail">
Do not send once a quarter emails to following email address: <input type="text" name="delemail" size="100">
<input type="submit" value="Delete my email and record">
</form>
<cfelse>
   <cfquery datasource="sptm" name="valid" username="nitish" password="rangeela">
      delete from bulkbuyers where email='#delemail#'
      </cfquery>
	  
	  Done
</cfif>

</body>
</html>
