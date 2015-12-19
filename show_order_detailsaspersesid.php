<?
include "../library/database/database.php";
include "../library/database/db_function.php";
include "../library/function/function.php";
include "../data_function.php" ;
if($session_admin=="")
{
    echo"<script>location.href='index.php' </script>";
}
if($act=="logout")
{
 session_unregister("session_admin");
}
$sql="select * from tblorder where cart_session_id='$c_s_id' order by order_id desc";
$res=mysql_query($sql);
$row=mysql_fetch_array($res);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Admin Main Menu :: Haldiram</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="file:///C|/CFusionMX/wwwroot/haldiram/httpdocs/admin/style.css" rel="stylesheet" type=text/css>
</head>
<body>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
  <tr>
      <td bgcolor="#990033"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2" align="center"  bgcolor=#99CCFF>
             <font size=2 color="#000000" face="verdana,Arial">
              <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              Administration Section :: Order Details</b> </font> </td>
          </tr>
          <tr>
            <td bgcolor="#ffffff"><div align="left">
                <table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#990033">
                  <tr>
                    <td width="25%" valign="top" bgcolor="#CCCCFF">

                    <? include 'admin_left_menu.php';?>

                    </td>
                    <td width="75%" class=partner valign=top align=center bgcolor=#CCFFCC> &nbsp;&nbsp;
                      <table border="0" width="100%" cellpadding="1" cellspacing="1">
                       <form name="" method="" action="" enctype="multipart/form-data">
                          <tr>
                              <td align="left">Shipping Name & Address</td>
                          </tr>
                          <tr>
                              <td align="left"><br></td>
                          </tr>
                          <tr>
                              <td align="left"><?=$row[shipping_name];?></td>
                          </tr>
                          <tr>
                              <td align="left"><?=$row[shipping_street_address];?>,&nbsp;<?=$row[shipping_city];?></td>
                           </tr>
                           <tr>
                              <td align="left"><?=$row[shipping_state];?></td>
                           </tr>
                           <tr>
                              <td align="left"><?=$row[shipping_zip];?></td>
                           </tr>
						   <tr>
                              <td align="left"><?=$row[shipping_country];?></td>
                           </tr>
                           <tr>
                              <td align="left">ordered by :&nbsp;(<?=$row[card_holder_name];?>)</td>
                           </tr>
                           <tr>
                              <td align="left">phone :&nbsp;<?=$row[card_holder_phone];?></td>
                           </tr>
                           <tr>
                              <td align="left">Haldiram Transaction ID :&nbsp;<?=$row[order_id];?></td>
                           </tr>
						   <tr>
                              <td align="left">Checkout Order ID :&nbsp;<?=$row[checkout_order_id];?></td>
                           </tr>
                           <tr>
                              <td align="left">Order Date :&nbsp;<?=$row[order_date];?></td>
                           </tr>
                            <tr>
                              <td align="left"><br></td>
                          </tr>
                           <tr>
                              <td align="left">
                                 <table border="0" width="60%" cellpadding="1" cellspacing="1">
                                   <tr>
                                       <td width="40%">Item Name</td>
                                       <td width="20%">Size</td>
                                       <td width="20%">Quantity</td>
                                       <td width="20%">Amount</td>
                                   </tr>
                                   <tr>
                                      <td colspan="4"><hr size="1"></td>
                                   </tr>
                                   <?
                                    $sql1="select * from tblcart where cart_session='$c_s_id'";
                                    $res1=mysql_query($sql1);
                                    while($row1=mysql_fetch_array($res1))
                                    {
                                   
									    $discountcat = 1; // cash discount
										$pid=$row1[prod_id]; 
										//  print $pid ;
										if ( $pid != -1)
										  { 
										$freecheck = $row1[price] ;
										$discountcat = 2 ; // free item
										 if ( $freecheck != 0) // is it a free item 
										  {   
										   $discountcat = 0 ; // then it is a normal item
							 		 }
										   $sql_prod="select * from tblproduct where prod_id='$pid'";
                                           $res_prod=mysql_query($sql_prod);
                                           $row_prod=mysql_fetch_array($res_prod);
										  
								}
                                        
                                   ?>
								   <? if ( $discountcat == 1) 
								   { //cash discount
								   ?>
								   <tr >
                                       <td width="20%"><font color="#FF0000">COUPON</font></td>
									    <td width="40%">
									</td>
                                    
                                       <td width="20%">&nbsp;<? print $row1[qty];?></td>
                                       <td width="20%">$<? print $row1[price];?></td>
                                        <?
							                $price=$row1[price];
								            $totprice=$totprice+$price;
							            ?>
                                   </tr>
                                  
								  <? } ?>
								  
								   <? if ( $discountcat == 2) 
								   { // free item
								   ?>
							   <tr>
                                      <td width="40%"><? print $row_prod[prod_name];    ?></td>
                                       <td width="20%"><? print $row_prod[prod_amount];?></td>
                                       <td width="20%">&nbsp;<? print $row1[qty];?></td>
                                       <td width="20%">$<? print $row_prod[prod_price];?> (FREE)</td>
                                        
                                   </tr>
                                  
								  <? }?>
								   <? if ( $discountcat == 0) 
								   { // ordinary sale
								   ?>
                                   <tr>
                                      <td width="40%"><? print $row_prod[prod_name];    ?></td>
                                       <td width="20%"><? print $row_prod[prod_amount];?></td>
                                       <td width="20%">&nbsp;<? print $row1[qty];?></td>
                                       <td width="20%">$<? print $row_prod[prod_price];?></td>
                                        <?
							                $price=$row1[qty]*$row_prod[prod_price];
								            $totprice=$totprice+$price;
							            ?>
                                   </tr>
								   
								   				   <? } ?>
								   
                                   <? }?>
								   <tr>
							          <td colspan="4" align="center"><b>Total=$<?print $totprice;?></b></td>
							      </tr>
								   <?
								       if($row[scharge]!=0)
									      $totprice=$totprice+3;
								   ?>
								   <tr>
							          <td colspan="4" align="center"><b>Shipping Charge=$<?=$row[scharge];?></b></td>
							      </tr>
                                   <tr>
							          <td colspan="4" align="center"><b>Grand Total=$<?print  $totprice;?></b></td>
							      </tr>
                                    <tr>
                                      <td colspan="4"><a href="file:///C|/CFusionMX/wwwroot/haldiram/httpdocs/admin/last_50.php">Last 50</a></td>
                                   </tr>
								   <tr>
                                      <td colspan="4" align="center"><a href="file:///C|/CFusionMX/wwwroot/haldiram/httpdocs/admin/edit_shipping_details.php?oid=<?print $oid;?>">Edit </a></td>
									   </td>
                                   </tr>
                                 </table>
                              </td>
                           </tr>

                        </form>
                      </table>

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
