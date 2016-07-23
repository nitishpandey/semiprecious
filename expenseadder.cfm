<html>
<head>
<title>Expense Logger</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="styles/npstyles1.css" rel="stylesheet" type="text/css">
</head>

<body><cfinclude template="headerforlist.cfm">
<cfif isdefined("form.month")>
<cfquery datasource="sptm"  username="nitish" password="rangeela">
insert into expenses values ('#__CFTEXT__form1__month#',#__CFTEXT__form1__year#,'#__CFTEXT__form1__description#','#__CFTEXT__form1__type#',#__CFTEXT__form1__value#)
</cfquery>
</cfif><br>
<br>

<cfform name="form1" method="post" action="expenseadder.cfm">
  <table width="668" border="1" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="78" bgcolor="#CCCCCC">Month</td>
      <td width="400">
<cftextinput name="month" value="#Datepart('m',Now())#" required="no" range="1,12" validate="integer" message="Enter month number." size="3" height="20" width="30" vspace="1" hspace="1" bold="no" italic="no" align="texttop" maxlength="2"> 
        &nbsp;</td>
      <td width="79" bgcolor="#CCCCCC">Year:</td>
      <td width="111"><cftextinput name="year" value="#datepart('yyyy',Now())#" required="yes" range="2004,2020" validate="integer" message="Enter a correct value for year." size="50" font="Courier" fontsize="14" height="20" width="50" vspace="1" hspace="1" bold="yes" italic="yes" align="middle" bgcolor="##330066" textcolor="##FFFFFF" maxlength="4">&nbsp;</td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC">Description</td>
      <td><cftextinput name="description" required="yes" size="40" font="Arial CE" fontsize="12" height="20" width="200" vspace="1" hspace="1" bold="no" italic="yes" align="middle" bgcolor="##FFFFCC" textcolor="##336633" maxlength="100">
        (do use some keywords to make search easier)</td>
      <td bgcolor="#CCCCCC">Type:</td>
      <td><cftextinput name="type" required="yes" size="20" font="Arial CE" fontsize="12" height="20" width="100" vspace="1" hspace="1" bold="no" italic="no" align="middle" bgcolor="##FFFFCC" textcolor="##336633" maxlength="100"></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC">Value</td>
      <td><cftextinput name="value" required="no" range="-5000,5000" validate="float" message="Enter a value in USD" size="36" height="20" width="58" vspace="6" hspace="1" bold="no" italic="no" align="middle" maxlength="6">
        (in USD)</td>
      <td bgcolor="#CCCCCC">&nbsp;</td>
      <td align="center">
<input name="submit" type="submit">
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
</cfform>
<a href="viewexpenses.cfm">View Expenses</a>&nbsp;&nb;<a href="salescalculator.cfm">Sales Calc</a>
<!--- <!-- <cftry>
<cfquery datasource="sptm" username="nitish" password="rangeela">
create table expenses (month smallint(3), year integer, description varchar(100), type varchar(12), value integer ,UNIQUE expenses_unique (description))</cfquery>
<cfcatch type="database">You can remove the database creation call.<br>
</cfcatch></cftry> --> ---><cfinclude template="adminfooter.cfm">
<!--- <!-- <cfquery datasource="sptm" username="nitish" password="rangeela">
delete  from expenses
</cfquery> --> --->
</body>
</html>
