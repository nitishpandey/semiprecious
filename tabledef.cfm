<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<cfquery datasource="sptm"  password="rangeela" username="nitish">
create table options 
( itemid  mediumint,
  optionid smallint,
  description varchar(30) not null,
  value smallint not null default 0,
  primary key (itemid,optionid) )
  
</cfquery>
</body>
</html>
