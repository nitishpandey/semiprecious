<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>

<!--- 
<cfquery datasource="sptm" username="nitish" password="rangeela">
drop table invite_credits
</cfquery> --->
<cfquery datasource="sptm" username="nitish" password="rangeela">
alter table invited modify column creditpart  real
</cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela">
create table invite_credits (email varchar(40), totalcredit real default 0,balancecredit real default 0, lastcartid integer, lastcreditvalue real default 0,unique email_unique (email))
</cfquery>

<cfquery datasource="sptm" username="nitish" password="rangeela">
create table  active_credits ( email varchar(40), cartid  integer, credit real , unique cartid_unique (cartid))
</cfquery>

<cfquery datasource="sptm" username="nitish" password="rangeela">
create table invited (byemail varchar(40), email varchar(40), dateinvited datetime ,creditpart real,UNIQUE email_unique (email))
</cfquery>
<body>
</body>
</html>
