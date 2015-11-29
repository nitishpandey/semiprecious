<html>
<head>
<title>New Task</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<table width="100%" border="1" cellpadding="2">
  <tr> 
    <td colspan="4">Initiate New Task</td>
  </tr>
  <tr> 
    <td>Subject</td>
    <td>: <input type="text" name="textfield"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>Task Details</td>
    <td rowspan="2">:
      <textarea name="textarea" cols="60" rows="4"></textarea></td>
    <td>PDC:</td>
    <td><input type="text" name="textfield2">
      (Format 19/06/1999)</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>Date Initiated</td>
    <td>:
      <input type="text" name="textfield22"></td>
  </tr>
  <tr> 
    <td>Action By</td>
    <td>: <select name="select">
        <option value="CADO">CADO</option>
        <option value="LOGO">LOGO</option>
        <option value="IAS">IAS</option>
        <option value="DPS">DPS</option>
        <option value="PROJ">PROJ</option>
        <option value="PPF">PPF</option>
        <option value="SWD">SWD</option>
      </select></td>
    <td>Info </td>
    <td>: <select name="select2" multiple >
        <option value="CADO">CADO</option>
        <option value="LOGO">LOGO</option>
        <option value="IAS">IAS</option>
        <option value="DPS">DPS</option>
        <option value="PROJ">PROJ</option>
        <option value="PPF">PPF</option>
        <option value="SWD">SWD</option>
      </select></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="49">
<input type="submit" name="Submit2" value="Reset"></td>
    <td align="center" valign="middle"> 
      <form name="form1" method="post" action="taskinitiated.cfm">
        <input type="submit" name="Submit" value="Initiate">
      </form></td>
    <td>&nbsp;</td>
    <td><a href="index.cfm">Return to Main Menu</a></td>
  </tr>
</table>
</body>
</html>
