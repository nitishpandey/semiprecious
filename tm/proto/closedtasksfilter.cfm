<html>
<head>
<title>Search For Closed Tasks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<table width="100%" border="1" cellpadding="2">
  <tr bgcolor="#CCCCCC"> 
    <td colspan="2"> Search Interface for Closed and Aborted Tasks:</td>
  </tr>
  <tr> 
    <td>PDC FROM:</td>
    <td> :
<input type="text" name="textfield2">
      (Format 19/06/1999)</td>
  </tr>
  <tr> 
    <td>PDC TO:</td>
    <td>:
<input type="text" name="textfield"></td>
  </tr>
  <tr> 
    <td>ACTION ADDRESEE:</td>
    <td> :
<select name="select2" multiple >
        <option value="CADO">CADO</option>
        <option value="LOGO">LOGO</option>
        <option value="IAS">IAS</option>
        <option value="DPS">DPS</option>
        <option value="PROJ">PROJ</option>
        <option value="PPF">PPF</option>
        <option value="SWD">SWD</option>
      </select>
      (Depress Shift Key to do multiple Selects)</td>
  </tr>
  <tr> 
    <td>INFO ADDRESEE:</td>
    <td> :
<select name="select" multiple >
        <option value="CADO">CADO</option>
        <option value="LOGO">LOGO</option>
        <option value="IAS">IAS</option>
        <option value="DPS">DPS</option>
        <option value="PROJ">PROJ</option>
        <option value="PPF">PPF</option>
        <option value="SWD">SWD</option>
      </select>
    </td>
  </tr>
  <tr> 
    <td>Status</td>
    <td>:
<select name="select3">
        <option value="Closed">Closed</option>
        <option value="Aborted">Aborted</option>
        <option value="Both">Both</option>
      </select></td>
  </tr>
  <tr> 
    <td>Subject Containg Text</td>
    <td>: <input name="textfield3" type="text" size="22"></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td> <form name="form1" method="post" action="closedtasks.cfm">
        <input type="submit" name="Submit" value="Fetch">
      </form></td>
  </tr>
</table>
<p>&nbsp;</p>
<p> <a href="index.cfm">Click Here to return to Main Menu</a></p>
</body>
</html>
