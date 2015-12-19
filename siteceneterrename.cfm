<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<!--- <cfquery datasource="sptm"  username="nitish" password="rangeela" debug="yes">
create table customrequest (reqid varchar(10),name varchar(40),email varchar(42),phone varchar(18),fax varchar(20),description blob,country varchar(16))
</cfquery> --->
<cfquery datasource="sptm"  username="nitish" password="rangeela" debug="yes">
create table customrequestimages (reqid varchar(10),type char(8),url varchar(60)) 
</cfquery> 
<!-- <cfquery datasource="sptm"  username="nitish" password="rangeela" debug="yes">
drop table customerequestimages 
</cfquery> -->
</body>
</html>
