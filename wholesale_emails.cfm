<cfif session.mail is "acemat@vsnl.com">
	<html xml:lang="en" dir="ltr">
		<head>
			<title>
				Keep out
			</title>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		</head>
		<body>
			<cfquery datasource="sptm" username="nitish" password="rangeela" name="bbs">
select email from bulkbuyers where membershipdate >'1/1/2009'	</cfquery>
			<cfoutput query="bbs">
				#bbs.email#
				<br>
			</cfoutput>
		</body>
	</html>
</cfif>
