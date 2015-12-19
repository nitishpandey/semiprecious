<cfparam name=sortby default="">
<html xml:lang="en" dir="ltr">
<head>
<title>List of Whole Sale Members</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript1.1" type="text/javascript">
<!-- 
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  popUpWin = window.open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menub ar=no,scrollbar=no,resizable=no,copyhistory=yes,width='+width+',height='+height+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
// -->
</script>

</head>
<body>
<cfquery datasource="sptm" username="nitish" password="rangeela" name="bbs">
select * from bulkbuyers order by <cfif isdefined("url.t")>totpurchase <cfelseif sortby is "reg"> registered <cfelse> lastlogin </cfif> desc limit 100
</cfquery>
<!---<span style="font:11px;">--->
Total: <cfoutput>#bbs.recordcount#. Time : #now()#.</cfoutput>
email, lastlogin, id, password, minamt, registerd, total, phone+address, mailcount
<a href="wholesale_list.cfm?t=12">Sort on Purchase</a> <a href="wholesale_list.cfm">Sort on Visit</a> <a href="admin.cfm">admin</a> <a href="cartstatus21.cfm">Carts</a>
<cfoutput query="bbs">
<hr />

#currentrow#:
<a href="showuserdetails.cfm?email=#bbs.email#" title="send email ?" >#bbs.email#</a>,<a href="javascript:popUpWindow('customercare.cfm?email=#email#',120,160,300,100);">#bbs.totpurchase#</a>( #bbs.lastlogin#) #bbs.name#, #bbs.minamt#, #bbs.registered#, #bbs.phoneno#, #bbs.address#,#bbs.mailcount#
<form action="customercare.cfm" method="post" ><input name="remarks" type="text" size="30"><input type="submit"  value="Update Customer Care"><input type="hidden" name="email" value="#bbs.email#"></form>

</cfoutput>
<a href="wholesale_list.cfm?SortBy=reg">Sort on Registration Date</a> <a href="wholesale_list.cfm?t=12">Sort on Purchase</a> <a href="wholesale_list.cfm">Sort on Visit</a> <a href="admin.cfm">admin</a> <a href="cartstatus21.cfm">Carts</a>
<!---style="display:inline;"--->
</body>
</html>
=