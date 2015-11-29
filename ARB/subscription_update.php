<?php
// Set headers for cache control
session_cache_limiter( 'nocache' );
session_start();
header( 'Cache-Control: no-cache, must-revalidate, post-check=0, pre-check=0' );


define('VDAEMON_PARSE', false);
include('vdaemon/vdaemon.php');

include ("data.php");
include ("authnetfunction.php");


// MAKE A CONNECTION TO THE DATABASE
		$hostname = "MySQLB2.webcontrolcenter.com";
		$dbName = "sptm";
		$username = "nitish";
		$password = "rangeela";
		// $usertable = "verify_cron_log"; 
		MYSQL_CONNECT($hostname, $username, $password) OR DIE("DB connection unavailable now");
		@mysql_select_db( "$dbName") or die( "Unable to select database");

// Server side validation of credit card's expiry date check (if it has already expired) using vdaemon's library
function phpExpDateCheck($sValue, &$oStatus)
{
    $nMonth = $_POST['cc_month'];
    $nYear  = $_POST['cc_year'];
    $nCurrMonth = date('m');
    $nCurrYear  = date('Y');
    
    if ($nCurrYear > $nYear || ($nCurrYear == $nYear && $nCurrMonth > $nMonth))
    {
        $oStatus->bValid = false;
        $oStatus->sErrMsg = "Check the Expiration Date of the Credit Card";
    }
}


//gather and define POST variables
$cardNumber = $_POST['cardNumber'];
$expirationDate = $_POST["cc_year"]."-".$_POST["cc_month"];
$subscriptionID = $_POST['subscriptionID'];
$amount = $_POST['sub_amount'];
$invoiceNumber = $_POST['invoiceNumber'];

//If user directly came to this page, the invoice no. and/or the amount would be missing. In which case, redirect them to semiprecious.com
/*
if (!$amount || !$invoiceNumber)
	{
		header ("Location: http://www.semiprecious.com/confirmation.cfm"); 
	}
*/



//build xml to post
$content =
        "<?xml version=\"1.0\" encoding=\"utf-8\"?>".
        "<ARBUpdateSubscriptionRequest xmlns=\"AnetApi/xml/v1/schema/AnetApiSchema.xsd\">".
        "<merchantAuthentication>".
        "<name>" . $loginname . "</name>".
        "<transactionKey>" . $transactionkey . "</transactionKey>".
        "</merchantAuthentication>".
        "<subscriptionId>" . $subscriptionID . "</subscriptionId>".
        "<subscription>".
        "<payment>".
        "<creditCard>".
        "<cardNumber>" . $cardNumber ."</cardNumber>".
        "<expirationDate>" . $expirationDate . "</expirationDate>".
        "</creditCard>".
        "</payment>".
        "</subscription>".
        "</ARBUpdateSubscriptionRequest>";
        
        
        

//send the xml via curl
$response = send_request_via_curl($host,$path,$content);

//if curl is unavilable try using fsockopen
// $response = send_request_via_fsockopen($host,$path,$content);

//if the connection and send worked $response holds the return from Authorize.net. ECHOEs TURNED-OFF for LIVE SERVER.


// TURNED-OFF for LIVE SERVER:
//echo $content;

if ($response)
{

	list ($refId, $resultCode, $code, $text, $subscriptionId)=parse_return($response);
	
	// TURNED-OFF for LIVE SERVER:
	/*
	echo " Response Code: $resultCode <br>";
	echo " Response Reason Code: $code<br>";
	echo " Response Text: $text<br>";
	// echo " Reference Id: $refId<br>";
	echo " Subscription Id: $subscriptionId <br><br>";
	echo " Data has been written to data.log<br><br>";
	echo $loginname;
	echo "<br />";
	echo $transactionkey;
	echo "<br />";
  
  echo "amount:";
  echo $amount;
  echo "<br \>";
 
  
  echo "name:";
  echo $name;
  echo "<br \>";
  
  echo "amount: ";
  echo $HTTP_POST_VARS[amount];
  echo "<br \>";
  echo "<br \>";
  //echo $content;
  echo "<br \>";
  echo "<br \>";
	
$fp = fopen('data.log', "a");
fwrite($fp, "$refId\r\n");
fwrite($fp, "$subscriptionId\r\n");
fwrite($fp, "$amount\r\n");
fclose($fp);*/

}


else { 
		// TURNED-OFF for LIVE SERVER:
		echo "Transaction Failed. <br>";
	 }


// ########### INSERT INTO THE DATABASE THE TRANSACTION DETAILS #############
// Process some of the values above for inserting into the record.
// Trim the credit card no. to the last 4 digits.
$cardNumber_last4 = substr($cardNumber,-4);



?>






<html>

<head>

<title>&lt;Authorize.Net ARB Subscription Update&gt;</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link type="text/css" rel="stylesheet" href="CSS/upc.css"> 

</head>

<body>
<br>
<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
  	<tr align="left" valign="top" bgcolor="#FFFFFF"> 
    	<td colspan="3" bgcolor="666666" class="header"><div align="center"><b> SUBSCRIPTION 
       		 UPDATE REQUEST</b></div></td>
  	</tr>

	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Invoice no.:</div></td>
    	<td width="361" colspan="2"><?php echo $invoiceNumber; ?></td>
  	</tr>
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Merchant:</div></td>
    	<td width="361" colspan="2">Semiprecious.com</td>
  	</tr>	
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0"> 
   	 	<td width="124" class="field_name" ><div align="left">Subscription Amount:</div></td>
    	<td width="361" colspan="2"><b><?php echo "$".$amount; ?> </b>(Recurring)</td>
  	</tr>				
  					
 	<?php  
 		if ($code == "I00001")
 			{
 				echo"<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\"> 
   	 				<td width=\"121\" class=\"field_name\" ><div align=\"left\">Subscription ID:</div></td>
    				<td width=\"361\" colspan=\"2\"> <b>". $subscriptionID. "</b></td>
  					</tr>";
  				
  				mysql_query("UPDATE cartARB SET ARB_cardNumber='$cardNumber_last4', ARB_expirationDate='$expirationDate', updatesub_key=NULL WHERE response_subscriptionID='$subscriptionID'  ")
							or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 156');
							
				/*
  				mysql_query("UPDATE cartARB SET x_response='PENDING',
  												response_result='$resultCode',
  												response_code='$code',
  												response_text='$text',
  												response_subscriptionID='$subscriptionId'
  							WHERE invoiceNumber = '$invoiceNumber'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 156');
  				*/
  				
 			}
 				
	?>
 
	<tr align="left" valign="top" bgcolor="f0f0f0" > 
   	 	<td width="124" class="field_name" ><div align="left">Subscription Status:</div></td>
    	<td width="361" colspan="2"><?php
    									if ($code == "I00001") echo "<b>Subscription Update request sent for approval.</b>";
    									
    									elseif ($code == "E00012")
  											{
  												echo "<b>Subscription Update Request already pending approval.</b><br>
  												<i>".$text."<i></td></tr>";
  											}
  					
    									else 
    										{						
    						/*					
    											mysql_query("UPDATE cartARB SET response_result='$resultCode',
  																				response_code='$code',
  																				response_text='$text'
  															WHERE invoiceNumber = '$invoiceNumber'") or die('Query failed: ' . mysql_error() . '<br><br># Internal Error 157');	*/
  							
    											echo "<b>Error in processing order.</b><br>";
    											echo"<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\"> 
   	 												 <td width=\"121\" class=\"field_name\" ><div align=\"left\">Error Reason:</div></td>
    									 			 <td width=\"361\" colspan=\"2\"> <i>". $text. "</i></td>
  													 </tr>";
    										}
    										
    								?>
    	</td>
  	</tr>
  	

</table>
	<br>

<table width="500" align="center" cellpadding="4" cellspacing="0" class="border_configuration">
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    	<td  class="field_name" ><div align="left"></div></td>
    	<td  class="field_name" ><p><strong>What's Next?</strong></p>      </td>
  	</tr>

    						  
  	<?php
  				$codes_range = array("E00013", "E00014", "E00015", "E00016", "E00018", "E00019", "E00020");

  				if ($code == "I00001")
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Your subscription update request has been sent for subscription approval.<br>It usually takes less than
    						  24 hours for the approval process. You will receive an e-mail as soon as it's done.</td>";
  						
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >You may want to Print this page for your records. Remember to mention the Subscription ID
    						  and the Invoice no. in your communications with us for this order.</td>";
  						
  						
  					}
  				
  				elseif ($code == "E00012")
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Your subscription update request has <u>ALREADY</u> been sent for approval.<br>
    						  It usually takes less than 24 hours for the approval process. You will receive an e-mail as soon as it's done.</td>";
    						  
    					echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >
    						  Click on the 'Continue' button below to continue to Semiprecious.com</td>";	  
  						
  					}
  				elseif (in_array($code, $codes_range))
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >Oops! Looks like there was a problem in filling-out the payment form.<br>
    						  Click on the 'Back' button below, to go back to the payment form and make the necessary corrections.</td>";
  					
  					}
  			
  				else
  					{
  						echo "<tr align=\"left\" valign=\"top\" bgcolor=\"f0f0f0\" > 
    						  <td height=\"29\" align=\"center\" valign=\"middle\" class=\"field_name\" ><img src=\"images/arrow.gif\"></td>
    						  <td class=\"field_name\" >The system is experiencing technical issues. The error has been logged.<br>
    						  We apologize for the inconvenience caused. Please e-mail us at <a href=\"mailto:cs@semiprecious.com?subject=ARB Gateway Critical Error\">
    						  cs@semiprecious.com</a> and let us know what happened.</td>";
  					
  						
  					
  					}
  	?>
  	
  	<tr align="left" valign="top" bgcolor="f0f0f0" > 
    	<td height="29" align="center" valign="middle" class="field_name" ><img src="images/arrow.gif"></td>
    	<td class="field_name" >Need help? <a href="mailto:cs@semiprecious.com?subject=ARB Gateway Form">E-mail us</a> and we'll take care of any issues you might be having.</td>
  	</tr>

</table>

<?php
	if ($code == "I00001")
			{
				echo "<center><p><input type=\"button\" name=\"Print\" value=\"Print\" onClick=\"window.print()\">
				<p><p><input type=\"button\" name=\"Continue\" value=\"CONTINUE\" onClick=\"location.href='http://www.semiprecious.com/'
				\"></p></p></p></center>";
			}
			
	elseif ($code == "E00012")
			{
				echo "<center><p><input type=\"button\" name=\"Continue\" value=\"CONTINUE\" onClick=\"location.href='http://www.semiprecious.com/'\"></p></center>";
			}
			
	elseif (in_array($code, $codes_range))
			{
				echo "<center><p><input type=\"button\" name=\"Back\" value=\"Back\" onClick=\"javascript:history.go(-1);\"></p></center>";
			}

	else { echo "<center><p><input type=\"button\" name=\"Continue\" value=\"CONTINUE\" onClick=\"location.href='http://www.semiprecious.com/'\"></p></center>";}

?>

</body>
</html>

