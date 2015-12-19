<?
include "../library/database/database.php";
include "../library/database/db_function.php";
include "../library/function/function.php";
if($session_admin=="")
{
   echo"<script>location.href='index.php'</script>";
}
if($act=="logout")
{
 session_unregister("session_admin");
}

if($action=="yes")
{
      #update tblorder
	  $sql_up="update tblorder set order_status='y' where cart_session_id='$c_s_id'";
	  mysql_query($sql_up);
	  echo"<script> window.close(); </script>";
}

$sql_chareg="select * from tblorder where cart_session_id='$c_s_id'";
$res_chareg=mysql_query($sql_chareg);
$row_chareg=mysql_fetch_array($res_chareg);
$chareg=$row_chareg[scharge];

$sql="select * from tblcart where order_id='$oid'";
$res=mysql_query($sql);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Admin Main Menu :: Haldiram</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="file:///C|/CFusionMX/wwwroot/haldiram/httpdocs/admin/style.css" rel="stylesheet" type=text/css>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
  <tr>
      <td bgcolor="#990033"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            
          <td height="30" colspan="2" align="center"  bgcolor=#99CCFF> <font size=2 color="#000000" face="verdana,Arial"> 
            <b>Administration Section :: Order Details</b> </font> </td>
          </tr>
          <tr>
            <td bgcolor="#ffffff"><div align="left">
                <table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#990033">
                  <tr>
                    
                  <td width="100%" class=partner valign=top align=center bgcolor=CCFFCC>
                      <br>
                    
                    <table width="85%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td bgcolor="#006699"><table width="100%" border="0" cellspacing="1" cellpadding="5">
                            <tr align="center"> 
                              <td width="33%" bgcolor="CCFFCC"><b>Pro.Name</b></td>
                              <td width="33%" bgcolor="CCFFCC"><b>Quantity</b></td>
                              <td width="33%" bgcolor="CCFFCC"><b>Price</b></td>
                            </tr>
                         <?
                            while($row=mysql_fetch_array($res))
                            {
                                $pid=$row[prod_id];
                                $sql_prod="select * from tblproduct where prod_id='$pid'";
                                $res_prod=mysql_query($sql_prod);
                                $row_prod=mysql_fetch_array($res_prod);
                        ?>
						    <tr align="center">
                              <td bgcolor="CCFFCC"><? print $row_prod[prod_name];?></td>
                              <td bgcolor="CCFFCC"><? print $row[qty];?></td>
                              <td bgcolor="CCFFCC">$<? print $row_prod[prod_price];?></td>
							  <?
							     //$price=$row[qty]*$row_prod[prod_price];
								 // $totprice=$totprice+$price;
							  ?>
                            </tr>
							<?
							}
							?>
							<tr>
							<td colspan="3" align="center" bgcolor="CCFFCC">Shipping Charge=$<? print $row_chareg[scharge];?></td>
							</tr>
							<?
							    //$totprice=$totprice+$chareg;
							?>
							<tr>
							<td colspan="3" align="center" bgcolor="CCFFCC">Total=$<? print $row_chareg[total];?></td>
							</tr>
                          </table></td>
                      </tr>
                    </table>
                    <br>
                    <table width="85%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td bgcolor="#BAE99E"><table width="100%" border="0" cellspacing="1" cellpadding="3">
                            <tr>
                              <td bgcolor="CCFFCC"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
                                  <form name="showFRM" method="post" action="file:///C|/CFusionMX/wwwroot/haldiram/httpdocs/admin/show_details.php?action=yes">
                                    <input type="hidden" name="c_s_id" value="<? print $c_s_id?>">
                                    <tr bgcolor="#BAE99E"> 
                                      <td height="22" colspan="4" align="center"> 
                                        <b>Shipping Detalis</b></td>
                                    </tr>
                                    <?
						   $sql1="select * from tblorder where cart_session_id='$c_s_id'";
	                       $res1=mysql_query($sql1);
						   $row1=mysql_fetch_array($res1);
						   
						?>
                                    <tr> 
                                      <td width="37%" align="left" colspan=""><b>Name:</b></td>
                                      <td width="63%"  colspan="" align="left"><? print $row1[shipping_name];?></td>
                                    </tr>
                                    
                                    <tr> 
                                      <td width="37%" align="left" colspan=""><b>Country:</b> 
                                      </td>
                                      <td align="left"  colspan=""><? print $row1[shipping_country];?></td>
                                    </tr>
                                    <tr> 
                                      <td colspan="" align="left"><b>City:</b></td>
                                      <td align="left"  colspan=""><? print $row1[shipping_city];?></td>
                                    </tr>
                                    <tr> 
                                      <td colspan="" align="left"><b>State:</b></td>
                                      <td align="left"  colspan=""><? print $row1[shipping_state];?></td>
                                    </tr>
                                    <tr> 
                                      <td colspan="" align="left"><b>Zip:</b></td>
                                      <td align="left"  colspan=""><? print $row1[shipping_zip];?></td>
                                    </tr>
                                   
                                    <tr> 
                                      <td colspan="" align="left"><b>Street Add:</b></td>
                                      <td align="left"  colspan=""><? print $row1[shipping_street_address];?></td>
                                    </tr>
									
                                  </form>
                                </table></td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                    <br>
                  </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table></td>
    </tr>

</table>
</body>
</html>
