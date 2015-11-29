 MySQL dump 8.8

 Host: localhost    Database: taskmanager
--------------------------------------------------------
 Server version	3.23.22-beta
Use taskmanager

 Table structure for table 'task'

<cftry>
<cfquery datasource="sptm" username="nitish" password="rangeela"> Create TABLE task (
  tdtoi datetime,
  subject varchar(50),
  mainsubject varchar(30),
  tby varchar(22),
  action varchar(22),
  info varchar(120),
  status varchar(9),
  pdc date,
  closedon datetime
); </cfquery>

 Dumping data for table 'task'


<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO task VALUES ('2004-10-04 17:01:06','new (hindi)','','comdt','DPS','IAS,DPS','close','2002-12-12','2002-10-25 00:00:00'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO task VALUES ('2004-10-07 10:50:14','test','not in use','comdt','DPS','PROJ,SWD,COBWEBS','close','2004-12-12','2004-10-07 10:53:52'); </cfquery>
<cfcatch type="database">Already done</cfcatch></cftry>


 Table structure for table 'taskdetails'


<cfquery datasource="sptm" username="nitish" password="rangeela"> Create TABLE taskdetails (
  tdtoi datetime,
  tby varchar(22),
  detail varchar(255)
); </cfquery>


 Dumping data for table 'taskdetails'


<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-04 17:01:06','comdt','non e l..,, aso;. asdt.u.,, x.asy.,, dsf;?p sdjaylh., dg;lswuomd kpn .slfgh,'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-05 10:29:51','comdt','this task s to sl. complelt sdby the a,third f to fthis nmonth irerespoectiv eof hte prosobllut andik it is uliknkely that hthe observeation of the pd csarpdad is of any consqeuenc to the mpoeple of the communistre repoulblic of chine and the covedite uni'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-05 12:15:18','comdt','as'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-05 15:07:56','comdt','the details of the task go in here.'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-05 15:51:33','Comdt','asadasl asdfl sdfsdf'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-06 14:45:07','Comdt','ASDF SDF'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskdetails VALUES ('2004-10-07 10:50:14','comdt','just a dummy task to see what it looks like.'); </cfquery>


 Table structure for table 'taskpdc'


<cfquery datasource="sptm" username="nitish" password="rangeela"> Create TABLE taskpdc (
  tdtoi datetime,
  pdc date,
  tby varchar(22),
  added datetime
); </cfquery>


 Dumping data for table 'taskpdc'


<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-04 17:01:06','2003-12-12','comdt','2004-10-04 17:01:06'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-04 17:01:06','2002-12-12','comdt','2004-10-05 10:09:00'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-04 17:01:06','2002-12-12','comdt','2004-10-05 10:10:42'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-05 10:29:51','2003-12-12','comdt','2004-10-05 10:29:51'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-05 12:15:18','2012-12-12','comdt','2004-10-05 12:15:18'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-05 15:07:56','2003-12-12','comdt','2004-10-05 15:07:56'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-05 15:07:56','2010-12-12','comdt','2004-10-05 15:12:47'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-05 15:51:33','1110-11-12','Comdt','2004-10-05 15:51:33'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-06 14:45:07','2012-12-12','Comdt','2004-10-06 14:45:07'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-07 10:50:14','2004-10-12','comdt','2004-10-07 10:50:14'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskpdc VALUES ('2004-10-07 10:50:14','2004-12-12','comdt','2004-10-07 10:52:35'); </cfquery>


 Table structure for table 'taskresponse'


<cfquery datasource="sptm" username="nitish" password="rangeela"> Create TABLE taskresponse (
  tdtoi datetime,
  tby varchar(22),
  detail varchar(255),
  added datetime,
  addedby varchar(12)
); </cfquery>


 Dumping data for table 'taskresponse'


<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskresponse VALUES ('2004-10-04 17:01:06','comdt','noe lsl, lku, jkmnp, lsa;d ,aplrd,\r\nlnon.s','2004-10-04 17:02:08','comdt'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskresponse VALUES ('2004-10-04 17:01:06','comdt','this is an sls , lusnsi la,','2004-10-05 09:51:08','comdt'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskresponse VALUES ('2004-10-05 10:29:51','comdt','thisi the response of the coo (Proj) of the assignment and the of the list','2004-10-05 10:30:38','comdt'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskresponse VALUES ('2004-10-05 10:29:51','comdt','this is by dps','2004-10-05 11:18:35','dps'); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO taskresponse VALUES ('2004-10-07 10:50:14','comdt','added a respones to the task about the happenings in dipac in september','2004-10-07 10:53:31','comdt'); </cfquery>


 Table structure for table 'users'


<cfquery datasource="sptm" username="nitish" password="rangeela"> Create TABLE users (
  Apptt varchar(12),
  name varchar(26),
  rank varchar(22),
  password varchar(20),
  lastlogin datetime,
  UNIQUE uniqueuser (Apptt)
); </cfquery>

<!---
 Dumping data for table 'users'


<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO users VALUES ('asdf',NULL,NULL,'as',NULL); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO users VALUES ('a',NULL,NULL,'cobwebs',NULL); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO users VALUES ('comdt',NULL,NULL,'gunner',NULL); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO users VALUES ('PROJ',NULL,NULL,'a',NULL); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO users VALUES ('dps',NULL,NULL,'a',NULL); </cfquery>
<cfquery datasource="sptm" username="nitish" password="rangeela"> insert INTO users VALUES ('logo',NULL,NULL,'a',NULL); </cfquery>
 --->
