<html>
<head>
<title>Expenses Incurred</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="sptm"  username="nitish" password="rangeela" name="j">
select * from expenses
</cfquery>
<cfoutput query="j">
#value#, #month# #description#<br>

</cfoutput>
</body>
</html>
